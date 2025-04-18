Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28F26FD8F
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969688; cv=none; b=WSXKi+hCvBMb4aNfz53eWnLvxOuG+ZVvfD0wssVGfhOdJTZTfBSbNRwqn5OIpGWkCzhCeGvAm4ybX2dDQfRlAphcVClzZDjkxYowE375+MyTufa5xebNRYuAlXb7EZw9Ml1nA30f34WlMU+TaIyAyy8JltmsHVSJDaTdimP3llQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969688; c=relaxed/simple;
	bh=7tuF8mS/RBiXqmBPIHQCKgLB4C5lh2LqoT+PdNMhZKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rIhT7X99jPsrgIWzQjgDcqgvwngX4Hdmj8tbdzeU0UYBOSOcAxYWTiNJrLrBx3UpplL8ptDEg3KTvdcTguzLlGwIkAZJCIEDOr/79x/GaiKnHb9wkS4TrXFjlJBWiS0BDBNRKo/+e/FIVsH02MJRJSGIUK8oAAJb7Qfv9fkd3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba5Hltei; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba5Hltei"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c08f9d0ef3so94410485a.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744969685; x=1745574485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=ba5HlteiJnGZmr6m4K7GxrxuT/FdrPRoRZkoHqUOgr2oRtjF+NLp7bcByzBPrTFB9e
         yqcCFJ+wd2T+zlYxOTImPBzRdU3Fs/z2H4Ow0m4++I9emIgYJZCZB9mndfWve/P2nArA
         QRlO8xFIXB4EN4MjdSPDVt9+NDboxjGmJ83STnv+htUiMJPBuBQLqaeAO4UBumQSApt3
         CDoi84dzqzOHBczWqb+Bs98OYWmUdHFolq+sNMptBoZfj5W316/SoOmC4tRzMkGGSrgj
         3oHuTwK9eE7nSFw2U6dKXnvDl0S39GPxedIn1D6nUCcZnoeGGWGdz3e7Rz5Fjiu3GZ7B
         fy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969685; x=1745574485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=fP90Y27sCXon3QmZ4SJbsXIigTQqBIY4kYhW6sehrI4NdSCMI9wStGePuOIKRSSxK0
         Ot5dMxwKgjHV24vSXLMP2ynO+W3+fE3pt9rkeTlhDkOekY/MN5ZTEr1UCuedHSMbTgVU
         2Ef4F6I9JVTRhKKabShRVp6xC+6QByLrrunNclUUCGJxhNkroJzLF0XcYXHzGgos41Hh
         4OQb2Y0C1Tn5iaBVrVPeWf3aMwmoiQOgOcIpINmdL+uJiPcmeAQDa3/Gv3dH3219DVUb
         2pS3RVIttB0ewxQo18mtLf+cDBsDr+ULu6fe6uxbTDzBnZ6RfMIXhq7IyYsYG/RYGDsE
         6U0Q==
X-Gm-Message-State: AOJu0YzlKSmKd8rK6IwUbX0TU8JWh5wyCJTZh9lLk9HvoNUgTVVPj+e4
	0FRRIeQQ3sz0FmmtyIQZjwx1q155itRhoQKfiWjPDE7GNercE62n
X-Gm-Gg: ASbGncuA36WCMh1XGQvYU5T2y0ZEXj7aNJc20xHQ2SXP3P+ym5lWZO9jAnV3AJ3yNlR
	K/Eyn5H/b4aIsXQ6R7B0Ja1Rtvor4AWb5FMh4EIGgqUtxEfQSnx1dtwS0Wsy+XThheov1zhoUMg
	0AXk66hFZfPer5+6TdUE4i1HNLTx6nOPZIn9IcthfIt3mRxzHySWrHlXoN2iOFbJC7oQVp+tiN9
	02yVw7HxdIGW0JI2cf389MYoRl52c53T8LNJfRIK4Flyj+nGtltKvzFWt5ysfUu3eF3BL80LEF1
	OD7IrzSPm9IuvEJxXXTy8sWW51kAJyAH
X-Google-Smtp-Source: AGHT+IGhhQYwXXU6Niw3QT+LbIjsoJKoG3bvb2d2USnFJuJeJ8zyigLaEU37PAkVyAOQqtgjlTyK2Q==
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c927f780aemr316707685a.18.1744969685553;
        Fri, 18 Apr 2025 02:48:05 -0700 (PDT)
Received: from ubuntu ([105.112.229.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b775c1sm89372785a.97.2025.04.18.02.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:48:05 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v11 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Fri, 18 Apr 2025 09:47:54 +0000
Message-Id: <3b9a0572ad56699b095642fc169c9603e08616e9.1744966511.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744966511.git.abrahamadekunle50@gmail.com>
References: <cover.1744966511.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code contains no spaces around binary operators with long lines
which reduces readability thereby not adhering to Linux kernel coding
style.

Add white spaces around the binary operators and use line breaks to
increase readability and ensure adherence to Linux kernel coding
styles.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..5def2467f42b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,14 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(pattrib->seqnum + 1) & 0xfff;
+
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

