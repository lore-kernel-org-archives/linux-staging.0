Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26DD16191B
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728956872; cv=none; b=HApqbwLuRMt/fzexnY24Gr+Lx7S5JhRuae6CUpWi4NPk6m1GwPMdy0yhE5GScjlhtnpZ8HGTSOBEfi+qAQ2qK6/1oL6dbG8JJIJZAFkKU1ovM1FO+rTMirbnQaIOSPwBbuxSVLwjqfwS1fkHki/yfKfF8ghim4+w0sr1k0hAIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728956872; c=relaxed/simple;
	bh=N5KvQyAWasw2pHtA50YzKW1XZmGuj+tV+JDsgre7160=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=abIA58uPwrrpZdvOD7r+eell609MmzWDa/W5cBGWkYOtJFvPHvDxE26pgjSrJJewAmXTka5IKG7O7xOD7sgh1cN+iV+73M2yy/ekoWscX89PrhtXml6h0KHzpd/7N2kJ0hbmw+lABkslAJMtL/14heGps6HBfH2fMWRV8FgNSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLsCEaH6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLsCEaH6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cb7139d9dso22507235ad.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 18:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956870; x=1729561670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU/+PDQEVns2ZoSRDquh2VHXFYZzqQ8KNkMRDlpc89g=;
        b=kLsCEaH6amqnqj0en8QF158XYhBffho/m5u8p2uooIfkujShoDdQ4iRGs05iY0c4KR
         w7WdQp5xHN/wZzXrC0qRwMPNBIlztFoWeLxE1Pad1thOLbwFsT00d0q0rk0waqCBRThd
         aaOBf7+8+89BSKlLGCvRuWPclPuEDB7xPLK1mmmhj4gkHAvRInQhEA+58jSGPOoJhH75
         1lGI7yyuT85CgasOrRViYcb5coUR7S1Q4fqNC7rnRZqe7ZOckzRb2+kKBfFLiyhJAIB9
         iKewHUhE18TYqjvni0OV1MWCcVQLiHOTeNsI/S35yfOm6EUUSzam7BAPJT0Vk1DwPsNa
         cIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956870; x=1729561670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WU/+PDQEVns2ZoSRDquh2VHXFYZzqQ8KNkMRDlpc89g=;
        b=S1hHyOeV0hzK6TAQW84Rr0JPCfFreFIIMdn/KOST3tUahnUaMaRScxfL68GcGY0nNV
         OD7xImBZGZnOrMsqofYRKoBZn6RrHbB/iLj4tO6SS/0CR7ZQyuRgATieoWovdOXn/SUH
         qJqImAPv/TU7BHUHXSYdns8HhmabcBdI9kJdN6LX+Nsan4cE/8nu1dySHNyuyCQg0yK1
         +QQmD/YwejCT43S4c9n/wjeqYGiRYSUsQ9nrbNSFw9J6tmPiyaAFmSZtr7VCeRQNVmay
         62pq5PVMGuqlwTI5QAIKkh0iQPToFuNFOfxL7OCY8rZevkLjQS2FUk2CfdiKTmJcEouE
         UI8A==
X-Forwarded-Encrypted: i=1; AJvYcCUSdpV/X8M0p3t5vjGBhdqCHROpEhAbkvUKyw1T39lgGvAshj7hhhBrZ4HIrSno69NgYcOwhMPxGMyPXwS6@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8WvTEVdaVip30rtQol5A+x6Dzs2NCSpOoteY0wGTp0TYJvEEb
	Xd8RhRxG9ywwTnqNSnzJ8W8hC89ZFRebyD8+s6n9Lmy6B198rjn1QX4uRw==
X-Google-Smtp-Source: AGHT+IFhn1nqUQMa0NBua1Qu1EX3Ct5NxTLCuaW8EaPCYEgH/5N7WIi9EvNzDgvtUfk/+tmzO9irmw==
X-Received: by 2002:a17:902:f543:b0:20c:c01d:54a8 with SMTP id d9443c01a7336-20cc01d5d28mr112046805ad.16.1728956870050;
        Mon, 14 Oct 2024 18:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:4e84:7ad0:3bea:5c55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d18036251sm1863615ad.172.2024.10.14.18.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:47:49 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused debug statements
Date: Mon, 14 Oct 2024 22:47:38 -0300
Message-Id: <20241015014738.41685-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015014738.41685-1-rodrigo.gobbi.7@gmail.com>
References: <20241015014738.41685-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove both commented printk() and commented DEBUG_ERR()
statements around the driver.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c         |  1 -
 drivers/staging/rtl8723bs/hal/odm.c             |  4 ----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c   |  2 --
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c   | 12 +-----------
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c  | 17 ++---------------
 5 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 484e0b4e489f..5994e574ae99 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -883,7 +883,6 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 	int save_cnt = false;
 
 	/* switch counter to RX fifo */
-	/* printk("8723b or 8192e , MAC_667 set 0xf0\n"); */
 	rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xf0);
 	save_cnt = true;
 	/* todo: other chips */
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index ea3b4cd32360..2cec8d8aeaef 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -433,7 +433,6 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 				continue;
 
 			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
-				/* printk("RSSI:%d, RSSI_LEVEL:%d\n", pstat->rssi_stat.UndecoratedSmoothedPWDB, pstat->rssi_level); */
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
 			}
 
@@ -512,7 +511,6 @@ bool ODM_RAStateCheck(
 		RATRState = DM_RATR_STA_MIDDLE;
 	else
 		RATRState = DM_RATR_STA_LOW;
-	/* printk("==>%s, RATRState:0x%02x , RSSI:%d\n", __func__, RATRState, RSSI); */
 
 	if (*pRATRState != RATRState || bForceUpdate) {
 		*pRATRState = RATRState;
@@ -593,8 +591,6 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 			}
 		}
 
-		/* printk("%s ==> sta_cnt(%d)\n", __func__, sta_cnt); */
-
 		for (i = 0; i < sta_cnt; i++) {
 			if (PWDB_rssi[i] != (0)) {
 				if (pHalData->fw_ractrl == true)/*  Report every sta's RSSI to FW */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index b9c6cd1f80d6..1b1929061083 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -53,8 +53,6 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	u8 *bufferPtr = buffer;
 	u32 i = 0, offset = 0;
 
-/* 	printk("====>%s %d\n", __func__, __LINE__); */
-
 	/* 3 Phase #1 */
 	blockCount_p1 = buffSize / blockSize_p1;
 	remainSize_p1 = buffSize % blockSize_p1;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index b63a74e669bc..c053ee9c1361 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -581,7 +581,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-				/* DEBUG_ERR("set key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len); */
 				/* set mic key */
 				memcpy(txkey, &(param->u.crypt.key[16]), 8);
 				memcpy(rxkey, &(param->u.crypt.key[24]), 8);
@@ -626,7 +625,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 					psta->dot118021XPrivacy = _TKIP_;
 
-					/* DEBUG_ERR("set key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len); */
 					/* set mic key */
 					memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
 					memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
@@ -657,7 +655,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-					/* DEBUG_ERR("set key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len); */
 					/* set mic key */
 					memcpy(txkey, &(param->u.crypt.key[16]), 8);
 					memcpy(rxkey, &(param->u.crypt.key[24]), 8);
@@ -785,7 +782,6 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
-						/* DEBUG_ERR(("\nset key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len)); */
 						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
 						memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
 
@@ -806,10 +802,6 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 					} else if (strcmp(param->u.crypt.alg, "BIP") == 0) {
 						/* save the IGTK key, length 16 bytes */
 						memcpy(padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						/*
-						for (no = 0;no<16;no++)
-							printk(" %02x ", padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey[no]);
-						*/
 						padapter->securitypriv.dot11wBIPKeyid = param->u.crypt.idx;
 						padapter->securitypriv.binstallBIPkey = true;
 					}
@@ -817,9 +809,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 			}
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
-			if (!pbcmc_sta) {
-				/* DEBUG_ERR(("Set OID_802_11_ADD_KEY: bcmc stainfo is null\n")); */
-			} else {
+			if (pbcmc_sta) {
 				/* Jeff: don't disable ieee8021x_blocked while clearing key */
 				if (strcmp(param->u.crypt.alg, "none") != 0)
 					pbcmc_sta->ieee8021x_blocked = false;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index a9e481e182ad..793b051536f3 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -138,9 +138,7 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE) == true) { /* sta mode */
 			psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
-			if (!psta) {
-				/* DEBUG_ERR(("Set wpa_set_encryption: Obtain Sta_info fail\n")); */
-			} else {
+			if (psta) {
 				/* Jeff: don't disable ieee8021x_blocked while clearing key */
 				if (strcmp(param->u.crypt.alg, "none") != 0)
 					psta->ieee8021x_blocked = false;
@@ -154,7 +152,6 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
-						/* DEBUG_ERR(("\nset key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len)); */
 						memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
 						memcpy(psta->dot11tkiprxmickey.skey, &param->u.crypt.key[24], 8);
 
@@ -177,13 +174,8 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 						rtw_set_key(padapter, &padapter->securitypriv, param->u.crypt.idx, 1, true);
 					} else if (strcmp(param->u.crypt.alg, "BIP") == 0) {
-						/* printk("BIP key_len =%d , index =%d @@@@@@@@@@@@@@@@@@\n", param->u.crypt.key_len, param->u.crypt.idx); */
 						/* save the IGTK key, length 16 bytes */
 						memcpy(padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						/*printk("IGTK key below:\n");
-						for (no = 0;no<16;no++)
-							printk(" %02x ", padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey[no]);
-						printk("\n");*/
 						padapter->securitypriv.dot11wBIPKeyid = param->u.crypt.idx;
 						padapter->securitypriv.binstallBIPkey = true;
 					}
@@ -191,9 +183,7 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 			}
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
-			if (!pbcmc_sta) {
-				/* DEBUG_ERR(("Set OID_802_11_ADD_KEY: bcmc stainfo is null\n")); */
-			} else {
+			if (pbcmc_sta) {
 				/* Jeff: don't disable ieee8021x_blocked while clearing key */
 				if (strcmp(param->u.crypt.alg, "none") != 0)
 					pbcmc_sta->ieee8021x_blocked = false;
@@ -629,7 +619,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-				/* DEBUG_ERR("set key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len); */
 				/* set mic key */
 				memcpy(txkey, &param->u.crypt.key[16], 8);
 				memcpy(psecuritypriv->dot118021XGrprxmickey[param->u.crypt.idx].skey, &param->u.crypt.key[24], 8);
@@ -674,7 +663,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 					psta->dot118021XPrivacy = _TKIP_;
 
-					/* DEBUG_ERR("set key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len); */
 					/* set mic key */
 					memcpy(psta->dot11tkiptxmickey.skey, &param->u.crypt.key[16], 8);
 					memcpy(psta->dot11tkiprxmickey.skey, &param->u.crypt.key[24], 8);
@@ -703,7 +691,6 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-					/* DEBUG_ERR("set key length :param->u.crypt.key_len =%d\n", param->u.crypt.key_len); */
 					/* set mic key */
 					memcpy(txkey, &param->u.crypt.key[16], 8);
 					memcpy(rxkey, &param->u.crypt.key[24], 8);
-- 
2.34.1

