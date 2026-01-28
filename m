Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F22737E0
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624040; cv=none; b=UHTYxVvWkS15Imj2/T+QMvdLeQc3o54OkL2ZDhZneWASYSpRfCDy2y6XxxP8xN5+x8FvHwOUdmi+fTxa8pIM3EzD482oPyxJb0ELTJjJ6PWUTR1GtfUxFEYqTcnfkarCiSIrSIPV+9614mJhy+hYJbfBIGfNwWKFlq1G4YonoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624040; c=relaxed/simple;
	bh=E50o7xC1gaZM0yCKgJ3sW6KJ5WvlUIkTn/85NCo++2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NEIHCMrBXVSzp/F8Uyn3n3rIVPFGhT36hrtHlgottYwtegIuxPX8B5hra1J2s6d71QlDquKjDTcwM2zDYr0b4BKi9kAC/Cl7g8ZvnbZaNvUKHwP8do0mhQjrvBnO2PimfA3upGtIQnFoPImTwxp1M2WlwtFe290gxB1U2cnnKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0GYCdkO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0GYCdkO"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f47610542so61414b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769624038; x=1770228838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t1HPVvzkGSA3+ho3y6Jlp+Tfo0a5L30Sp12MV/Ub6sI=;
        b=i0GYCdkO8ldT3eEARepeAydedO/yqsQdxCjfo6aOvr9IC2/gu58SM72WwOH9FH2M1K
         8L7Fe/Fml0fz+vnhtpiwIyeD/wF8aVVF8nfCEruw5viRp7/la8WWUoqMpGLNx/9oPZD+
         iPzDiLPxERUdppM4YDhI1aD4giF4hDb8TJa+F5RZJ0ds6790K6aGOI4hilEofgTP5ylc
         uAqfzvuoe95uasX0U3hjkywJ222S6ltn5/kcM7ROLsBqpFjj6WqS+gj9FkFOupiY604N
         g7u8CRCnX8kP0l6SKw9vmtQtczJSXTprLvjjwyiAUG7nhx4ZVLF9K2/KFgYMFobgnzai
         hOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769624038; x=1770228838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1HPVvzkGSA3+ho3y6Jlp+Tfo0a5L30Sp12MV/Ub6sI=;
        b=wOZxHsfX+tLIRgF0CQJE5NujANJLVZ7adQJfux7+myrp/hgYOpidKE0V840wUA/NtA
         +hJ6ylGUyCUQKBDlsWQ5oyQrdG9rA/btl063Onqn5DC7LwOjmqqkjBIu1ZGKqz1esh5x
         uZBCaEzh0i7BSeGC9gGP9arBRSeS6w/Pa4T+iAkS7k868791c1iR7Uigi+a+woUYGvs1
         wEVDgKwIrSf6UgWoo1kcM50JJNkEMtRRS98o/wYSTjoehUqwqWYSKdlF8PoRqykcFXcX
         m+x0kQsk1oBmQ843JG7hYRvkndicD5Q53mP4c37wkKuYVjMOQPG4CCCUWYsym1tEXUTX
         6wUA==
X-Gm-Message-State: AOJu0YwJk5ZjmFZOEG5LDqJn5cECJXppouCuOGmOXcMn/lctcnMokeEh
	xxZDS+7C1xeEGLDC+e89ru9YJH9L4k/Ns5KkKvK5nUSh8CQgHJEtig36yzo6GCcV90E=
X-Gm-Gg: AZuq6aIDXsAe+46tZT6PxYjx1DD7nU1kicdClK8mWsKy24fSVKTWHojKlaOTcr+Dw+o
	BLNW1yefiSBSz66hnIYxAmLA9FBVPWF2SCWPLX8VkK5cpadEO6+iYVtIVcafdXX2zMv5guxN+M7
	juSdBN32tSfg/8liL0fu2ScWCrzncmbzYBplEg2w7POmLWev8EGtLm01Ak5kXcTKnW8knZExXta
	7GcNTf4FJzGobU184Qf9FeTskrH0ceBTDG84f73i8yPczSjmBXqUWpbyksMZOAZNckhlqJgh/8U
	rZmXH7s871ipjlZHWogmhMT0xpWRN64YxNxSoq2JKUdealvRlwLAdBfQm6sRmVOO4k6xht8oZtU
	zdqLKporml1cI0A/Mr/G1bxVaIMTVFyRqPIBOS90QU3/1kG7dHXzm42B+cN2H0Wyh4FRz9gI=
X-Received: by 2002:a05:6a00:114f:b0:823:172f:f0c with SMTP id d2e1a72fcca58-823692922c4mr5940768b3a.45.1769624037973;
        Wed, 28 Jan 2026 10:13:57 -0800 (PST)
Received: from arch ([14.139.98.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c32944sm3320774b3a.57.2026.01.28.10.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:13:57 -0800 (PST)
From: Tejas Vijapur <tejasnv1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Tejas Vijapur <tejasnv1@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename add_RATid to add_rat_id
Date: Wed, 28 Jan 2026 23:43:41 +0530
Message-ID: <20260128181341.10911-1-tejasnv1@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function to follow kernel naming conventions
No functional change

Signed-off-by: Tejas Vijapur <tejasnv1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c    | 8 ++++----
 drivers/staging/rtl8723bs/hal/hal_intf.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_ap.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..5b82dddcb822 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -318,7 +318,7 @@ void expire_timeout_chk(struct adapter *padapter)
 	associated_clients_update(padapter, updated);
 }
 
-void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
+void add_rat_id(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
 	unsigned char sta_band = 0, shortGIrate = false;
 	unsigned int tx_ra_bitmap = 0;
@@ -391,7 +391,7 @@ void update_bmc_sta(struct adapter *padapter)
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-		/* prepare for add_RATid */
+		/* prepare for add_rat_id */
 		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
 						      supportRateNum,
@@ -549,7 +549,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 	/* add ratid */
-	/* add_RATid(padapter, psta);//move to ap_sta_info_defer_update() */
+	/* add_rat_id(padapter, psta);//move to ap_sta_info_defer_update() */
 
 	spin_lock_bh(&psta->lock);
 	psta->state |= _FW_LINKED;
@@ -1947,7 +1947,7 @@ void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
 
 		/* add ratid */
-		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
+		add_rat_id(padapter, psta, 0);/* DM_RATR_STA_INIT */
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 462553d296ff..ed853613e148 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -207,7 +207,7 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 	pmlmepriv = &(padapter->mlmepriv);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
-		add_RATid(padapter, psta, rssi_level);
+		add_rat_id(padapter, psta, rssi_level);
 	else {
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_ap.h b/drivers/staging/rtl8723bs/include/rtw_ap.h
index 7a735e691399..832fc234cb30 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ap.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ap.h
@@ -11,7 +11,7 @@ void init_mlme_ap_info(struct adapter *padapter);
 void free_mlme_ap_info(struct adapter *padapter);
 /* void update_BCNTIM(struct adapter *padapter); */
 void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx);
-void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level);
+void add_rat_id(struct adapter *padapter, struct sta_info *psta, u8 rssi_level);
 void expire_timeout_chk(struct adapter *padapter);
 void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta);
 void start_bss_network(struct adapter *padapter);
-- 
2.52.0

