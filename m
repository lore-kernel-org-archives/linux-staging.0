Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9CD170826;
	Tue,  8 Apr 2025 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119146; cv=none; b=FRAHGmHBZRQuhdp8Z7j8NZ+FCMXNmKOvmsV3oWpWb70Z3fE6vwIQXAqifV7yX4H0AjgdoT6jQw+UHhO2fBWblBD680oil8eTyeTOJeVGmZo2Fa2Dxiqg5JeJCOXnKSGQ6cOdnKdiX+UY163KYnjejY/mRcPBLTaMRwxq60t7PJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119146; c=relaxed/simple;
	bh=gMn5sT6YHlhINbVg1JhdIXBV5Svve4/i0YWieM+ToWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OsW78wpJR+NRql2qrCyOGJkvaSTWYiY6kkEsDC0TfNH88iXjYumLEMvRIaM27Ox5lHc2tfb6OiDGwf/UJQl7A3kg3Hc2LAZMJc4cC2K0WNaV5R4qBsRCLoAanViZMXZhsiRkywHvMA+qUJstNe4FUbXw9FBuSJLWJKmZmek+ozM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6F4i9Va; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6F4i9Va"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c55b53a459so559620485a.3;
        Tue, 08 Apr 2025 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119144; x=1744723944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIusQuGgX2vGT68cDt8SEFqpzccdF2dU+sL7arsGnOo=;
        b=g6F4i9VaP6WN1rLVU9KzGhVnMxc8bLyge7l45O5eyKVOViuDpaTwD4+IyKb2hhHl5y
         3//XnX+f+KPVCmnhorPrp84t1EZjInd0X/vvWEuyTJORSbJoojQWRplHNIg6A/NGzcUF
         WAzIdGA+b1bktTHPiI7n5xsIzP74IAjegFpwPp7aIpNor9gWpk1jp46ObSJEWBC2WSzf
         DymdYqDe4DvDi/1xK3Xb3RnLXKlpWXkH2mTG2NvYLELpTSC9IQghyXbPGyfMN+CgQdLh
         FYOPm+DGJicXCMewGyYNtM++QXdgZUUtlcgcDwffCikqt3cSoTwGj+Vi6gXQYXdM/eDT
         WjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119144; x=1744723944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIusQuGgX2vGT68cDt8SEFqpzccdF2dU+sL7arsGnOo=;
        b=XbImj1rjXDU3LXfz6yzEuuNFu2dcfusAsGLyky2rPQjwoF6+GEtMQq+FG4myCnstsP
         7zYC/qStyF+NFRXVB0MOXUlSgIJBbych3Wf41KozuShpGucutNZBy2CSDVCu/rgsaq0N
         VvRK7ZbfYE3BLAeuPbhrqEpbhay5VY6Ke92AUa9YlhB/AvKdvfLaZkLh+xkwrRAbgO5n
         O4rQIoW1xreWv2Azq+tr9LSpG6QmGctujBU4/amce6U/JLd1BQNiLZA2bFK5yg9tICvp
         bK4kxloBNbvQyvS2t7aUt1k6OcVpRU+wirjacwkn05gsvQ6t7Y3t2CB9fJE5xoOG5w37
         PZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvX4ngY7dKMDy9TfM7XudF7ODfpS5pvWAbr7d4YfQX0coxWV9FrIvcuPjc3DO9clEXzEdhIqi9cKon6P7F@lists.linux.dev
X-Gm-Message-State: AOJu0YxetOpYzOPfOqX+pOI/e/EWt9Es9M4hEk93695CttQXPm2eeZ8/
	vm5OWjorjfA6U7zHAMr3rv0hUDa8cpWGwBs56Pe5vsqu9bfgcVFy
X-Gm-Gg: ASbGnctY4QOh1uQKxO8O6nA13OlN209t91uKOWCt/zoMcDOK46kcUH3zObpvzfEvrQK
	MQbHk/HSEE7QY2qkAyb4O2YXwRdpumblQ7zpcEdaAvxAcEPPMPJJidBPBM1N2A0255OH/bF7Ggo
	INpqzvwF/6w3kifdtWhtlMXPKAI1MW1GJUOBKRJPXBF9tTBNcBoXtPaGnFdSR1w2H6iQtE5crwi
	lJGEwkl/izyCug15nOHoCUwelV8aoj484GZqTZigx9IBTIdE61byO0lULxzKGjVyczGDPD+FvRF
	091KF5Ih4nR+4ctIMqFpteRoVP8oRoU3EJeEJNvGqUg3nUg=
X-Google-Smtp-Source: AGHT+IFrw7EmfxOH9MSpeh5HQd6u8DJWIr9NwkrsX23oxfMP+eHGV56Vg893NNzA3a8wcq4yDxW2tg==
X-Received: by 2002:a05:620a:46a3:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7c775a34e1cmr2586558285a.30.1744119144179;
        Tue, 08 Apr 2025 06:32:24 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96e611sm757715285a.62.2025.04.08.06.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:32:23 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v7 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Tue,  8 Apr 2025 13:31:41 +0000
Message-Id: <8e582c7166200e618ff56ec10ed16b4a4e73eece.1744117091.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744117091.git.abrahamadekunle50@gmail.com>
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
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
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..9ba3bebfc8bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,13 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
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
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

