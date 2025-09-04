Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE201DDA09
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949359; cv=none; b=SLkCrlakYoWDiBwJoiVb2HTmEPUFyBsG8mRbrB9srTbc7/pji4JqPdxjaKkhwAGz6nEeZhJxDUaT+J4hcXub9a9RceaYeI71bmTeW2rjTpAXsI1gQUID30t+XER91z4F8qDLsegX739h9n71QWm1hP5FXghP1RnMXHc7AAS/SPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949359; c=relaxed/simple;
	bh=VNfrpgpxpbyw8ERke3BpjHKuLSWG1u6qfMBqfz4ZVu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kEU1tTh6l2V5wtD8b7urbymoeNYfNCXVUn/fBpR+y6tFkobOMHX6qNt4U6Ljh57RiShE2/in+PGy5KHYNKeUA48S3h66wjcj1hx0Vsj9N/KSrFsDJjlku73n1H4/A5ZQ2J0a5k3PfIVRXopXpWvbQrmmVTsp35rmUDFY+uR9jwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qo9qCVCx; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo9qCVCx"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b109c59dc9so7455011cf.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949356; x=1757554156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYBVwg0qNAIsIE/fwzqPoC8Ske/D+V21MDnSh+sC2qg=;
        b=Qo9qCVCxaN2F9J7g+gguAr+sE8ZTPG6cAcdcOCwzLfjG3SqpyYI0oLBx0MxIR39lXr
         nMeLIGx7uEve0UGo2vAiaRG69O3PwWOBIEOYQH+CJFE3xrZwmk2OF8svTbIZ9uLjtIst
         Dm8fD6EH9PitfY8/90gz14q9eeICxRgRqiJiI43xM9O8aT6/FeB86+4XfQkoouHmVZ7W
         a5h+idTZCre3C3xiuzByUqvVWSI8IZ0b+Y+balhjcNE0s/qeI6IDDHs2fSHxj7qoWw54
         70X0wRMoy7FBfd6wDT7yKyQltHL7FqMjah3gxZh4MJ3QLb3PWa+8byi1yQO+0MfWu/tr
         +A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949356; x=1757554156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYBVwg0qNAIsIE/fwzqPoC8Ske/D+V21MDnSh+sC2qg=;
        b=vH7ocrRx3HZla2bWggav6jzLogxjQBuuRkqFFaySQ1MKRpcOL7Uupfm4kQ9Pg8ZxGa
         2BV/00lx2M6G7OUjJHNTWUKeuvmxswQk1UYHQCLjrMnVAIyxpoQEXphU4Vg9h5rRdiKp
         KOI9I2XN69D//vuhnQF7V17Ekrs+MmVKAoBVfZ2BSJU8oiee6TptcD7fe9LBzklxzQcb
         JqGxT6ofxNGci1fTMKEbKYqRPG+FYLhtadQvJI0rOQHP3CTSB2pAYXVanLbE5J0WOQbs
         uRfFTFhiFgSg7F51XFzm4Ki3IZ4tePIcqSXJfyRdk8k8G45xrGy7shl2BLMkXcQMkemE
         PUYA==
X-Gm-Message-State: AOJu0YzBF2J3t0a79cjGR53VEEkh9IlhIVuP1avNVM+gaKfPLk0753wo
	ugEq0JAa9SHTMRe0rwVWy1o755DZB/Uxdxzn6RSBJKBV4Zgob8Vp0jnA
X-Gm-Gg: ASbGncv11LUSbrcZ3qH3zeUxSBeAlj1GKOe1CMpiLLNS2C+SWhGisrDtbaudaymMP1Z
	/dFcxq3lg6XoGuA9Q2hyEFTf5BAVEKrsq19VxLgXP2IWrN5qc7T1IemIzdLsy79fmZtUCIPDSiZ
	y+yY4vhZ5j8Wt3NMzTrSqQ3YwPZ2JdW4ukckKpKyIZeZlk3owI7K+pl4Znh9MuH3gJtv6x8iwf3
	06b9NAx6wpDKQQZdkud/FP8bItcgYBls8oBUhCvhL0DqgfIsf+0ucbFeDmFJYAR6qMn3hRE/DQr
	n8jcAU0RHDuyz4nDtBZJ/LbiPEVzPXcF4JRGnnRVa866+iVr+XQRjN1jf+uYXg31NYvpI13PUVF
	TNRBLZnAlIAUaA+mL5N3iNoaIQTvSTSbtC4LhrwpsBHE38zKquodVhwU8B9RkWQ==
X-Google-Smtp-Source: AGHT+IEJYaFPK/iZ58a14wwtY2v9YBfzLVSz3C0zNtSZ1Fq1cnoSwZvA2/w97/vlw5MYkIWhKT2jYQ==
X-Received: by 2002:a05:622a:5909:b0:4b0:82d9:7cb5 with SMTP id d75a77b69052e-4b31d8a3aeamr195370551cf.26.1756949355730;
        Wed, 03 Sep 2025 18:29:15 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f78757fsm20378921cf.43.2025.09.03.18.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:29:15 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 12/16] staging: rtl8723bs: remove unnecessary braces for single statement blocks
Date: Thu,  4 Sep 2025 01:28:55 +0000
Message-Id: <20250904012859.215565-3-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
References: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop braces around conditional blocks that contain only a single
statement, as required by kernel coding style. This enhances clarity
and reduces visual clutter.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ef9057456768..27be46c11b65 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -514,9 +514,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}
 
-		if (rtw_roam_flags(adapter)) {
+		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
@@ -2546,9 +2545,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	len = 0;
 	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len,
 		       ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
+	if (p && len > 0)
 		/* todo: */
-	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
 		cbw40_enable = 1;
-- 
2.39.5

