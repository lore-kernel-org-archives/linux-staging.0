Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8DB34BA33
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156643; cv=none; b=IHeaCE48XLpdosjxIP6qB2S+fwD9LfOZX+4GtWzb5N9KMte3fxALhfDTN9PakxETT0s60u3Lw/GDPw7VoNMOQAAVXfnaCmrOjzHq4UJL7lfFY0l7oGBIiPFnCuXiGAKHOykEzxih4t1Rl5mkkNKbTHPZc+8xFjj/e7wdPkVNZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156643; c=relaxed/simple;
	bh=fl8LZYS9qeWPoNGE1qp2A78T4rOc3z+bF+PvxBl8lbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyHE+0J2xFEEGZVD+WrGW7RnCyGmxfZCsjXkrOaLpiShbuAJDH9HMKUHybSmcG6cHCU8CZVRZhEyOwmzBtS304Jna2njg+5Wgd8KMIDYuOFCmRrukQmgb1UcIc+KF5bIRRxkTcNu2JmAOii8Al3zt20ZdSvyl7SHxVKtRW4bXQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbH7QYiO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbH7QYiO"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso42366755ad.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156639; x=1768761439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASoHbVsowmDQYZYqADnm8elWQSiSQB3UuKMUV0ANdcc=;
        b=PbH7QYiOhzrUMJbFBUJBk4PpiwSwiSMe7/G0+na3d58NPr5cQGe/plJxQs42Q2aMvh
         fyAiA+/SD9y/AQn1kwcYF8yAnH7dquA1BrzbkMuRmzdPn3nUECelM0YZiQPZRP5NJ7V9
         cxFz93kGDuZgQw2Dsx+K4ptnRTFVN4kEWpO3/Pj4WAeAMd1E+9FaYtao/Iz361jWYdRM
         GRVvvTLIi+qiYR6obC0f3OitarJpBjkuw9bcpr/y9YkHlfYp2B54EN65Cg+993v5c315
         kTBT3guTw6bicyqj1gy7v2YzEAPxzaiFwu2x26T6pzyHybSSM2RKN/qgGDdG2LHPhgyI
         F6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156639; x=1768761439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASoHbVsowmDQYZYqADnm8elWQSiSQB3UuKMUV0ANdcc=;
        b=lEuVldUXJRHmZFoPbHcnJhhAlnLX9xTr1PlVc0VGzejdMdnSvldpgygkvZRClQPKib
         oDkROSS1z4Fi5wRRiO6cniVzWsxJxiu0H3CyzHPu4jOI+4VquHobW2iGWUI93V65j335
         hg6qlw2C+lSwzsKv9eUzO1A9GxdCXSTpV/AilsUA44w6RDZmNqbJdMpdIsl6uRPlmopg
         dQVcRSC6ANKI7YPMgZkhaMeG0bYQB5+j8IiM+7KNkzUOaDBsASUFBWz5qH1lWx8+i5Cr
         KYrfjT6A1RT5jXNfpL3Bwa/iWd7r7A0gDtNXDjW95AJGfE1x83//lBUbmHsPut0Nbs07
         oZkw==
X-Forwarded-Encrypted: i=1; AJvYcCUbRbgMACpNZifloGqFtb2z95GjXCz3rbfdUQuNrV5zYt7sa1eCFLPFn/NgRxjBZebVE1zIP618VIGb+r30@lists.linux.dev
X-Gm-Message-State: AOJu0YwmY64u9/yTxIMNx2wz7uU2K8N2nX+YcapQWzyfUcZwO2U8jWqs
	vp0lIZOO3pnWz1rqClE83qPUTD1V+DejE1XkTDi/IUmrbZXyY9aPZnOr
X-Gm-Gg: AY/fxX6LdVwv4rKr+ATf3liHjTIwX7v9aXfVBsR7qf0Cr+3UKlKYYp01Q4SEpSFwDVf
	UYYQoWRmhmFkxWJ+W5wvWsxu3i4uQbAVrEfLuK1FfR9JUiy3B7+D/ex6mr/Sb1/nO96jSm4BhW7
	I32yWduwhjwbu4Ia9ArDYyBAENcXmwXggIUTCuT8TcTgIa22ArlJDuUPebQV2XadbCHCM94aySe
	PG4BVMlzDQgvAfIs/aSZWDGTE3J96d8oUJwJQsSiPi96giRKzKVFTE/52D4pGqiiscRWoePNmme
	NcmJ9Hgd8gzZWnftPmcKQfCP72FOirltL/Pby7YxCf0ulKr76NMDu6TewQRU3WJWMWC5WTk6VEE
	dlvIne2oB9HLUMAuGpCcX4r3+8Mfdzey/z5keK2BOTr1UCpSyLPhF3ALcocvmctlM0RuJby8q7s
	GGGN0OPESQQOfrA+X5bgUegURS
X-Google-Smtp-Source: AGHT+IF8tzZ+0FHPjI8wnjH8brVBrar+nwhsLYOL6P00hMAPP/Hw/IkqNdC8OyKbXb+MBmIHrn8KFQ==
X-Received: by 2002:a17:902:dace:b0:294:d953:6ff9 with SMTP id d9443c01a7336-2a3ee49b44dmr171632285ad.47.1768156637992;
        Sun, 11 Jan 2026 10:37:17 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:37:17 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 6/9] staging: rtl8723bs: rename struct members to snake_case
Date: Mon, 12 Jan 2026 00:06:27 +0530
Message-ID: <20260111183630.12816-7-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase struct members in rtw_xmit.c and related files to
snake_case to follow the kernel naming conventions.

These identifiers are used across multiple files, so this patch
ensures consistent naming throughout the driver.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  26 +--
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  66 +++----
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  48 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 106 +++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   4 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  34 ++--
 drivers/staging/rtl8723bs/core/rtw_security.c |  38 ++--
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  70 +++----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   8 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |   2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  32 ++--
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |   2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   6 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  16 +-
 .../staging/rtl8723bs/include/rtw_security.h  |  36 ++--
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   2 +-
 drivers/staging/rtl8723bs/include/sta_info.h  |   2 +-
 drivers/staging/rtl8723bs/include/wifi.h      |  30 +--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 176 +++++++++---------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  18 +-
 25 files changed, 373 insertions(+), 373 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..b443f441c8cf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -462,7 +462,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x)
 		psta->ieee8021x_blocked = true;
 	else
 		psta->ieee8021x_blocked = false;
@@ -682,8 +682,8 @@ void start_bss_network(struct adapter *padapter)
 	if (!pmlmepriv->cur_network.join_res) { /* setting only at  first time */
 
 		/* WEP Key will be set before this function, do not clear CAM. */
-		if ((psecuritypriv->dot11PrivacyAlgrthm != _WEP40_) &&
-		    (psecuritypriv->dot11PrivacyAlgrthm != _WEP104_))
+		if ((psecuritypriv->dot11_privacy_algrthm != _WEP40_) &&
+		    (psecuritypriv->dot11_privacy_algrthm != _WEP104_))
 			flush_all_cam_entry(padapter);	/* clear CAM */
 	}
 
@@ -705,8 +705,8 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acparm));
 
 	/* Set Security */
-	val8 = (psecuritypriv->dot11AuthAlgrthm ==
-		dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+	val8 = (psecuritypriv->dot11_auth_algrthm ==
+		dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 	/* Beacon Control related register */
@@ -925,7 +925,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 				      &group_cipher,
 				      &pairwise_cipher,
 				      NULL) == _SUCCESS) {
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 			psecuritypriv->wpa_psk |= BIT(1);
@@ -951,7 +951,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 					     &group_cipher,
 					     &pairwise_cipher,
 					     NULL) == _SUCCESS) {
-				psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+				psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
@@ -1249,7 +1249,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 
 	memcpy(psetstakey_para->addr, psta->hwaddr, ETH_ALEN);
 
-	memcpy(psetstakey_para->key, &psta->dot118021x_UncstKey, 16);
+	memcpy(psetstakey_para->key, &psta->dot11_8021x_uncst_key, 16);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1972,12 +1972,12 @@ void rtw_ap_restore_network(struct adapter *padapter)
 
 	start_bss_network(padapter);
 
-	if ((padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_) ||
-	    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+	if ((padapter->securitypriv.dot11_privacy_algrthm == _TKIP_) ||
+	    (padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 		/* restore group key, WEP keys is restored in ips_leave() */
 		rtw_set_key(padapter,
 			    psecuritypriv,
-			    psecuritypriv->dot118021XGrpKeyid,
+			    psecuritypriv->dot11_8021x_grp_key_id,
 			    0,
 			    false);
 	}
@@ -2008,8 +2008,8 @@ void rtw_ap_restore_network(struct adapter *padapter)
 			Update_RA_Entry(padapter, psta);
 			/* pairwise key */
 			/* per sta pairwise key and settings */
-			if ((psecuritypriv->dot11PrivacyAlgrthm == _TKIP_) ||
-			    (psecuritypriv->dot11PrivacyAlgrthm == _AES_)) {
+			if ((psecuritypriv->dot11_privacy_algrthm == _TKIP_) ||
+			    (psecuritypriv->dot11_privacy_algrthm == _AES_)) {
 				rtw_setstakey_cmd(padapter, psta, true, false);
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..874d31bf12fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -756,9 +756,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
 		/* Especially for Realtek 8192u SoftAP. */
-		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
+		if ((padapter->securitypriv.dot11_privacy_algrthm != _WEP40_) &&
+			(padapter->securitypriv.dot11_privacy_algrthm != _WEP104_) &&
+			(padapter->securitypriv.dot11_privacy_algrthm != _TKIP_)) {
 			rtw_ht_use_default_setting(padapter);
 
 			rtw_build_wmm_ie_ht(padapter, &psecnetwork->ies[12], &psecnetwork->ie_length);
@@ -877,14 +877,14 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
+		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11_privacy_algrthm;
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
 	if (unicast_key)
-		memcpy(&psetstakey_para->key, &sta->dot118021x_UncstKey, 16);
+		memcpy(&psetstakey_para->key, &sta->dot11_8021x_uncst_key, 16);
 	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey, 16);
+		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot11_8021x_grp_key_id].skey, 16);
 
 	/* jeff: set this because at least sw key is ready */
 	padapter->securitypriv.busetkipkey = true;
@@ -1144,51 +1144,51 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	if ((check_fwstate(pmlmepriv, _FW_LINKED))
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+		if (pmlmepriv->link_detect_info.bBusyTraffic)
 			BusyThreshold = BusyThresholdLow;
 
-		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
+		if (pmlmepriv->link_detect_info.NumRxOkInPeriod > BusyThreshold ||
+			pmlmepriv->link_detect_info.num_tx_ok_in_period > BusyThreshold) {
 			bBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->link_detect_info.NumRxOkInPeriod > pmlmepriv->link_detect_info.num_tx_ok_in_period)
 				bRxBusyTraffic = true;
 			else
 				bTxBusyTraffic = true;
 		}
 
 		/*  Higher Tx/Rx data. */
-		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
+		if (pmlmepriv->link_detect_info.NumRxOkInPeriod > 4000 ||
+			pmlmepriv->link_detect_info.num_tx_ok_in_period > 4000) {
 			bHigherBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->link_detect_info.NumRxOkInPeriod > pmlmepriv->link_detect_info.num_tx_ok_in_period)
 				bHigherBusyRxTraffic = true;
 			else
 				bHigherBusyTxTraffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
+		if (((pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod + pmlmepriv->link_detect_info.num_tx_ok_in_period) > 8) ||
+			(pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
+				if (pmlmepriv->link_detect_info.TrafficTransitionCount <= 4)
+					pmlmepriv->link_detect_info.TrafficTransitionCount = 4;
 
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;
+				pmlmepriv->link_detect_info.TrafficTransitionCount++;
 
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
+				if (pmlmepriv->link_detect_info.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
+					pmlmepriv->link_detect_info.TrafficTransitionCount = 30;
 			}
 		} else {
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >= 2)
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount -= 2;
+			if (pmlmepriv->link_detect_info.TrafficTransitionCount >= 2)
+				pmlmepriv->link_detect_info.TrafficTransitionCount -= 2;
 			else
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+				pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
 
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
+			if (pmlmepriv->link_detect_info.TrafficTransitionCount == 0)
 				bEnterPS = true;
 		}
 
@@ -1213,15 +1213,15 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			LPS_Leave(padapter, "NON_LINKED");
 	}
 
-	pmlmepriv->LinkDetectInfo.NumRxOkInPeriod = 0;
-	pmlmepriv->LinkDetectInfo.NumTxOkInPeriod = 0;
-	pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod = 0;
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = bBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bTxBusyTraffic = bTxBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bRxBusyTraffic = bRxBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bHigherBusyTraffic = bHigherBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
-	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
+	pmlmepriv->link_detect_info.NumRxOkInPeriod = 0;
+	pmlmepriv->link_detect_info.num_tx_ok_in_period = 0;
+	pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod = 0;
+	pmlmepriv->link_detect_info.bBusyTraffic = bBusyTraffic;
+	pmlmepriv->link_detect_info.bTxBusyTraffic = bTxBusyTraffic;
+	pmlmepriv->link_detect_info.bRxBusyTraffic = bRxBusyTraffic;
+	pmlmepriv->link_detect_info.bHigherBusyTraffic = bHigherBusyTraffic;
+	pmlmepriv->link_detect_info.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
+	pmlmepriv->link_detect_info.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 
 	return bEnterPS;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..adc568a3a95c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -61,7 +61,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
 		/* we try to issue sitesurvey firstly */
 
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
+		if (pmlmepriv->link_detect_info.bBusyTraffic == false
 			|| rtw_to_roam(padapter) > 0
 		) {
 			/*  submit site_survey_cmd */
@@ -113,7 +113,7 @@ u8 rtw_do_join(struct adapter *padapter)
 
 				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
 				/* we try to issue sitesurvey firstly */
-				if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
+				if (pmlmepriv->link_detect_info.bBusyTraffic == false
 					|| rtw_to_roam(padapter) > 0
 				) {
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
@@ -380,7 +380,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 	}
 
 	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
-		(pmlmepriv->LinkDetectInfo.bBusyTraffic == true)) {
+		(pmlmepriv->link_detect_info.bBusyTraffic == true)) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
@@ -408,7 +408,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 	psecuritypriv->ndisauthtype = authmode;
 
 	if (psecuritypriv->ndisauthtype > 3)
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 	res = rtw_set_auth(padapter, psecuritypriv);
 
@@ -436,13 +436,13 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 
 	switch (wep->key_length) {
 	case 5:
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
+		psecuritypriv->dot11_privacy_algrthm = _WEP40_;
 		break;
 	case 13:
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+		psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 		break;
 	default:
-		psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 		break;
 	}
 
@@ -450,7 +450,7 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 
 	psecuritypriv->dot11DefKeylen[keyid] = wep->key_length;
 
-	psecuritypriv->dot11PrivacyKeyIndex = keyid;
+	psecuritypriv->dot11_privacy_key_index = keyid;
 
 	res = rtw_set_key(padapter, psecuritypriv, keyid, 1, true);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..0d09145d7ea0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -335,10 +335,10 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	int ret = true;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
-	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
+	if ((psecuritypriv->dot11_privacy_algrthm != _NO_PRIVACY_) &&
 		    (pnetwork->network.privacy == 0))
 		ret = false;
-	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
+	else if ((psecuritypriv->dot11_privacy_algrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
 		ret = false;
 	else
@@ -998,15 +998,15 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
 
 			psta->ieee8021x_blocked = true;
-			psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+			psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 
-			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
+			memset((u8 *)&psta->dot11_8021x_uncst_key, 0, sizeof(union Keytype));
 
 			memset((u8 *)&psta->dot11tkiprxmickey, 0, sizeof(union Keytype));
 			memset((u8 *)&psta->dot11tkiptxmickey, 0, sizeof(union Keytype));
@@ -1109,7 +1109,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -1143,12 +1143,12 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
-		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
-		psec_priv->dot11PrivacyKeyIndex = 0;
+		psec_priv->dot11_auth_algrthm = dot11_auth_algrthm_open;  /* open system */
+		psec_priv->dot11_privacy_algrthm = _NO_PRIVACY_;
+		psec_priv->dot11_privacy_key_index = 0;
 
-		psec_priv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-		psec_priv->dot118021XGrpKeyid = 1;
+		psec_priv->dot11_8021x_grp_privacy = _NO_PRIVACY_;
+		psec_priv->dot11_8021x_grp_key_id = 1;
 
 		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
 		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
@@ -1185,8 +1185,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
+	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
 
 	if (pnetwork->join_res > 0) {
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
@@ -1379,8 +1379,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
-		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x)
+		psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 	psta->ieee8021x_blocked = false;
 
@@ -1627,7 +1627,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true)
 				goto exit;
 
-			if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+			if (pmlmepriv->link_detect_info.bBusyTraffic)
 				goto exit;
 		}
 
@@ -1900,7 +1900,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 		goto exit;
 	}
 
-	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
+	psetauthparm->mode = (unsigned char)psecuritypriv->dot11_auth_algrthm;
 
 	pcmd->cmdcode = _SetAuth_CMD_;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
@@ -1930,10 +1930,10 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
-		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x)
+		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot11_8021x_grp_privacy;
 	else
-		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
+		psetkeyparm->algorithm = (u8)psecuritypriv->dot11_privacy_algrthm;
 
 	psetkeyparm->keyid = (u8)keyid;/* 0~3 */
 	psetkeyparm->set_tx = set_tx;
@@ -2161,7 +2161,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	security_priv *psecuritypriv = &adapter->securitypriv;
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
+	pdev_network->privacy = (psecuritypriv->dot11_privacy_algrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
 
 	pdev_network->rssi = 0;
 
@@ -2401,7 +2401,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 	ht_capie.ampdu_params_info = (max_rx_ampdu_factor&0x03);
 
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&(0x07<<2));
 	else
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
@@ -2517,8 +2517,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
-	/* if (bmcst || (padapter->mlmepriv.LinkDetectInfo.bTxBusyTraffic == false)) */
-	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100))
+	/* if (bmcst || (padapter->mlmepriv.link_detect_info.bTxBusyTraffic == false)) */
+	if (bmcst || (padapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100))
 		return;
 
 	priority = pattrib->priority;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..3219d234e3ce 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -236,7 +236,7 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 	pmlmeinfo->reassoc_count = 0;
 	pmlmeinfo->link_count = 0;
 	pmlmeinfo->auth_seq = 0;
-	pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+	pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 	pmlmeinfo->key_index = 0;
 	pmlmeinfo->iv = 0;
 
@@ -452,7 +452,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 
 	ptable = mlme_sta_tbl;
 
-	index = GetFrameSubType(pframe) >> 4;
+	index = get_frame_sub_type(pframe) >> 4;
 
 	if (index >= ARRAY_SIZE(mlme_sta_tbl))
 		return;
@@ -470,7 +470,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 		psta->RxMgmtFrameSeqNum = precv_frame->u.hdr.attrib.seq_num;
 	}
 
-	switch (GetFrameSubType(pframe)) {
+	switch (get_frame_sub_type(pframe)) {
 	case WIFI_AUTH:
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 			ptable->func = &OnAuth;
@@ -691,7 +691,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	sa = GetAddr2Ptr(pframe);
 
-	auth_mode = psecuritypriv->dot11AuthAlgrthm;
+	auth_mode = psecuritypriv->dot11_auth_algrthm;
 
 	if (GetPrivacy(pframe)) {
 		u8 *iv;
@@ -715,8 +715,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP104_)
+			psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
+			psecuritypriv->dot11_privacy_algrthm != _WEP104_)
 		auth_mode = 0;
 
 	if ((algorithm > 0 && auth_mode == 0) ||	/*  rx a shared-key auth but shared not enabled */
@@ -875,11 +875,11 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
-			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
+			if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_shared;
 			/* pmlmeinfo->reauth_count = 0; */
 		}
 
@@ -888,7 +888,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	}
 
 	if (seq == 2) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
@@ -906,7 +906,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		/* open system */
 		go2asoc = 1;
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
 			go2asoc = 1;
 		else
 			goto authclnt_fail;
@@ -953,7 +953,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
-	frame_type = GetFrameSubType(pframe);
+	frame_type = get_frame_sub_type(pframe);
 	if (frame_type == WIFI_ASSOCREQ)
 		ie_offset = _ASOCREQ_IE_OFFSET_;
 	else /*  WIFI_REASSOCREQ */
@@ -1523,7 +1523,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (ignore_received_deauth == 0)
 		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.bBusyTraffic = false;
 	return _SUCCESS;
 }
 
@@ -1575,7 +1575,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.bBusyTraffic = false;
 	return _SUCCESS;
 
 }
@@ -2142,9 +2142,9 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
+	set_seq_num(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
 	/* pmlmeext->mgnt_seq++; */
-	SetFrameSubType(pframe, WIFI_BEACON);
+	set_frame_sub_type(pframe, WIFI_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -2292,9 +2292,9 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	memcpy(pwlanhdr->addr2, mac, ETH_ALEN);
 	memcpy(pwlanhdr->addr3, bssid, ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(fctrl, WIFI_PROBERSP);
+	set_frame_sub_type(fctrl, WIFI_PROBERSP);
 
 	pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = pattrib->hdrlen;
@@ -2491,9 +2491,9 @@ static int _issue_probereq(struct adapter *padapter,
 
 	memcpy(pwlanhdr->addr2, mac, ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_PROBEREQ);
+	set_frame_sub_type(pframe, WIFI_PROBEREQ);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -2605,9 +2605,9 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_AUTH);
+	set_frame_sub_type(pframe, WIFI_AUTH);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -2651,7 +2651,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
@@ -2682,7 +2682,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
 			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128, pmlmeinfo->chg_txt, &(pattrib->pktlen));
 
-			SetPrivacy(fctrl);
+			set_privacy(fctrl);
 
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 
@@ -2741,10 +2741,10 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	memcpy((void *)GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
 	if ((pkt_type == WIFI_ASSOCRSP) || (pkt_type == WIFI_REASSOCRSP))
-		SetFrameSubType(pwlanhdr, pkt_type);
+		set_frame_sub_type(pwlanhdr, pkt_type);
 	else
 		return;
 
@@ -2868,9 +2868,9 @@ void issue_assocreq(struct adapter *padapter)
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ASSOCREQ);
+	set_frame_sub_type(pframe, WIFI_ASSOCREQ);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3044,9 +3044,9 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	*(fctrl) = 0;
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
-		SetFrDs(fctrl);
+		set_fr_ds(fctrl);
 	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
-		SetToDs(fctrl);
+		set_to_ds(fctrl);
 
 	if (power_mode)
 		SetPwrMgt(fctrl);
@@ -3055,9 +3055,9 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_DATA_NULL);
+	set_frame_sub_type(pframe, WIFI_DATA_NULL);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3188,25 +3188,25 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	*(fctrl) = 0;
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
-		SetFrDs(fctrl);
+		set_fr_ds(fctrl);
 	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
-		SetToDs(fctrl);
+		set_to_ds(fctrl);
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
 
-	SetPriority(qc, tid);
+	set_priority(qc, tid);
 
-	SetEOSP(qc, pattrib->eosp);
+	set_eosp(qc, pattrib->eosp);
 
-	SetAckpolicy(qc, pattrib->ack_policy);
+	set_ack_policy(qc, pattrib->ack_policy);
 
 	memcpy(pwlanhdr->addr1, da, ETH_ALEN);
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_QOS_DATA_NULL);
+	set_frame_sub_type(pframe, WIFI_QOS_DATA_NULL);
 
 	pframe += sizeof(struct ieee80211_qos_hdr);
 	pattrib->pktlen = sizeof(struct ieee80211_qos_hdr);
@@ -3296,9 +3296,9 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_DEAUTH);
+	set_frame_sub_type(pframe, WIFI_DEAUTH);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3391,9 +3391,9 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
+	set_frame_sub_type(pframe, WIFI_ACTION);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3465,9 +3465,9 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
+	set_frame_sub_type(pframe, WIFI_ACTION);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3620,9 +3620,9 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
+	set_seq_num(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	SetFrameSubType(pframe, WIFI_ACTION);
+	set_frame_sub_type(pframe, WIFI_ACTION);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -3923,7 +3923,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	memset(bssid, 0, sizeof(struct wlan_bssid_ex));
 
-	subtype = GetFrameSubType(pframe);
+	subtype = get_frame_sub_type(pframe);
 
 	if (subtype == WIFI_BEACON) {
 		bssid->reserved[0] = 1;
@@ -4130,7 +4130,7 @@ void start_clnt_join(struct adapter *padapter)
 	if (caps&WLAN_CAPABILITY_ESS) {
 		Set_MSR(padapter, WIFI_FW_STATION_STATE);
 
-		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		val8 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4775,9 +4775,9 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 
 	timer_delete_sync(&pmlmeext->link_timer);
 
-	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
+	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
+	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 0ef788abf403..b2e367d3c1e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -210,7 +210,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 		}
 
 	} else { /*  from rx path */
-		if (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 4/*2*/) {
+		if (pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod > 4/*2*/) {
 			if (adapter_to_pwrctl(padapter)->bLeisurePs
 			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
 			    && !(hal_btcoex_IsBtControlLps(padapter)))
@@ -325,7 +325,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x &&
 	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e893cb6fa273..eb590a28f673 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -380,7 +380,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				/* rxdata_key_idx =(((iv[3])>>6)&0x3) ; */
 				mickey = &psecuritypriv->dot118021XGrprxmickey[prxattrib->key_index].skey[0];
 
-				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_key_idx); */
+				/* psecuritypriv->dot11_8021x_grp_key_id, pmlmeinfo->key_index, rxdata_key_idx); */
 
 				if (psecuritypriv->binstallGrpkey == false) {
 					res = _FAIL;
@@ -408,7 +408,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			if (bmic_err == true) {
 				/*  double check key_index for some timing issue , */
-				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
+				/*  cannot compare with psecuritypriv->dot11_8021x_grp_key_id also cause timing issue */
 				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
@@ -452,12 +452,12 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 			switch (prxattrib->encrypt) {
 			case _WEP40_:
 			case _WEP104_:
-				prxattrib->key_index = psecuritypriv->dot11PrivacyKeyIndex;
+				prxattrib->key_index = psecuritypriv->dot11_privacy_key_index;
 				break;
 			case _TKIP_:
 			case _AES_:
 			default:
-				prxattrib->key_index = psecuritypriv->dot118021XGrpKeyid;
+				prxattrib->key_index = psecuritypriv->dot11_8021x_grp_key_id;
 				break;
 			}
 		}
@@ -512,7 +512,7 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 	pstapriv = &adapter->stapriv;
 
-	auth_alg = adapter->securitypriv.dot11AuthAlgrthm;
+	auth_alg = adapter->securitypriv.dot11_auth_algrthm;
 
 	ptr = precv_frame->u.hdr.rx_data;
 	pfhdr = &precv_frame->u.hdr;
@@ -680,10 +680,10 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 	sz = get_recvframe_len(prframe);
 	precvpriv->rx_bytes += sz;
 
-	padapter->mlmepriv.LinkDetectInfo.NumRxOkInPeriod++;
+	padapter->mlmepriv.link_detect_info.NumRxOkInPeriod++;
 
 	if ((!is_broadcast_ether_addr(pattrib->dst)) && (!is_multicast_ether_addr(pattrib->dst)))
-		padapter->mlmepriv.LinkDetectInfo.NumRxUnicastOkInPeriod++;
+		padapter->mlmepriv.link_detect_info.NumRxUnicastOkInPeriod++;
 
 	if (sta)
 		psta = sta;
@@ -840,7 +840,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-		if (GetFrameSubType(ptr) & BIT(6)) {
+		if (get_frame_sub_type(ptr) & BIT(6)) {
 			/* No data, will not indicate to upper layer, temporily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
@@ -920,10 +920,10 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 
 		process_pwrbit_data(adapter, precv_frame);
 
-		if ((GetFrameSubType(ptr) & WIFI_QOS_DATA_TYPE) == WIFI_QOS_DATA_TYPE)
+		if ((get_frame_sub_type(ptr) & WIFI_QOS_DATA_TYPE) == WIFI_QOS_DATA_TYPE)
 			process_wmmps_data(adapter, precv_frame);
 
-		if (GetFrameSubType(ptr) & BIT(6)) {
+		if (get_frame_sub_type(ptr) & BIT(6)) {
 			/* No data, will not indicate to upper layer, temporily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
@@ -968,7 +968,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	psta->sta_stats.rx_ctrl_pkts++;
 
 	/* only handle ps-poll */
-	if (GetFrameSubType(pframe) == WIFI_PSPOLL) {
+	if (get_frame_sub_type(pframe) == WIFI_PSPOLL) {
 		u16 aid;
 		u8 wmmps_ac = 0;
 
@@ -1261,11 +1261,11 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 
 		if (psta) {
 			psta->sta_stats.rx_mgnt_pkts++;
-			if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_BEACON)
+			if (get_frame_sub_type(precv_frame->u.hdr.rx_data) == WIFI_BEACON)
 				psta->sta_stats.rx_beacon_pkts++;
-			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_PROBEREQ)
+			else if (get_frame_sub_type(precv_frame->u.hdr.rx_data) == WIFI_PROBEREQ)
 				psta->sta_stats.rx_probereq_pkts++;
-			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_PROBERSP) {
+			else if (get_frame_sub_type(precv_frame->u.hdr.rx_data) == WIFI_PROBERSP) {
 				if (!memcmp(padapter->eeprompriv.mac_addr, GetAddr1Ptr(precv_frame->u.hdr.rx_data), ETH_ALEN))
 					psta->sta_stats.rx_probersp_pkts++;
 				else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)) ||
@@ -1405,11 +1405,11 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	u8 *ptr = precv_frame->u.hdr.rx_data;
 	u8 subtype;
 
-	subtype = GetFrameSubType(ptr); /* bit(7)~bit(2) */
+	subtype = get_frame_sub_type(ptr); /* bit(7)~bit(2) */
 
 	/* only support station mode */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED) &&
-	    adapter->securitypriv.binstallBIPkey == true) {
+	    adapter->securitypriv.b_install_bip_key == true) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
@@ -1497,7 +1497,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	}
 
 	type =  GetFrameType(ptr);
-	subtype = GetFrameSubType(ptr); /* bit(7)~bit(2) */
+	subtype = get_frame_sub_type(ptr); /* bit(7)~bit(2) */
 
 	pattrib->to_fr_ds = get_tofr_ds(ptr);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..32a5512d87e9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -57,12 +57,12 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	/* start to encrypt each fragment */
 	if ((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) {
-		keylength = psecuritypriv->dot11DefKeylen[psecuritypriv->dot11PrivacyKeyIndex];
+		keylength = psecuritypriv->dot11DefKeylen[psecuritypriv->dot11_privacy_key_index];
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
+			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11_privacy_key_index].skey[0], keylength);
 			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
@@ -110,7 +110,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		keyindex = prxattrib->key_index;
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
-		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
+		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11_privacy_key_index].skey[0], keylength); */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
@@ -479,9 +479,9 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 		{
 			if (is_multicast_ether_addr(pattrib->ra))
-				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
+				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot11_8021x_grp_key_id].skey;
 			else
-				prwskey = pattrib->dot118021x_UncstKey.skey;
+				prwskey = pattrib->dot11_8021x_uncst_key.skey;
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 				iv = pframe + pattrib->hdrlen;
@@ -590,7 +590,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
 			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+				prwskey = &stainfo->dot11_8021x_uncst_key.skey[0];
 			}
 
 			iv = pframe + prxattrib->hdrlen;
@@ -829,7 +829,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
 	uint	frtype  = GetFrameType(pframe);
-	uint	frsubtype  = GetFrameSubType(pframe);
+	uint	frsubtype  = get_frame_sub_type(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -993,9 +993,9 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _AES_) {
 		if (is_multicast_ether_addr(pattrib->ra))
-			prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
+			prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot11_8021x_grp_key_id].skey;
 		else
-			prwskey = pattrib->dot118021x_UncstKey.skey;
+			prwskey = pattrib->dot11_8021x_uncst_key.skey;
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
@@ -1034,7 +1034,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	u8 mic[8];
 
 	uint frtype  = GetFrameType(pframe);
-	uint frsubtype  = GetFrameSubType(pframe);
+	uint frsubtype  = get_frame_sub_type(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -1282,12 +1282,12 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 				no_gkey_mc_cnt = 0;
 
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
+				if (psecuritypriv->dot11_8021x_grp_key_id != prxattrib->key_index) {
 					res = _FAIL;
 					goto exit;
 				}
 			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+				prwskey = &stainfo->dot11_8021x_uncst_key.skey[0];
 			}
 
 			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
@@ -1343,7 +1343,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		/* copy key index */
 		memcpy(&le_tmp, p + 2, 2);
 		keyid = le16_to_cpu(le_tmp);
-		if (keyid != padapter->securitypriv.dot11wBIPKeyid)
+		if (keyid != padapter->securitypriv.dot11w_bip_key_id)
 			goto BIP_exit;
 
 		/* clear the MIC field of MME to zero */
@@ -1351,13 +1351,13 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 
 		/* conscruct AAD, copy frame control field */
 		memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
-		ClearRetry(BIP_AAD);
-		ClearPwrMgt(BIP_AAD);
-		ClearMData(BIP_AAD);
+		clear_retry(BIP_AAD);
+		clear_pwr_mgt(BIP_AAD);
+		clear_m_data(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 
-		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
+		if (omac1_aes_128(padapter->securitypriv.dot11w_bip_key[padapter->securitypriv.dot11w_bip_key_id].skey
 			, BIP_AAD, ori_len, mic))
 			goto BIP_exit;
 
@@ -1488,10 +1488,10 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
 
-	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
+	if ((_WEP40_ == securitypriv->dot11_privacy_algrthm) || (_WEP104_ == securitypriv->dot11_privacy_algrthm)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
-				if (keyid == securitypriv->dot11PrivacyKeyIndex)
+				if (keyid == securitypriv->dot11_privacy_key_index)
 					rtw_set_key(adapter, securitypriv, keyid, 1, false);
 				else
 					rtw_set_key(adapter, securitypriv, keyid, 0, false);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa50699e..4366f5c2b930 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1141,7 +1141,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 	}
 
-	subtype = GetFrameSubType(pframe) >> 4;
+	subtype = get_frame_sub_type(pframe) >> 4;
 
 	if (subtype == WIFI_BEACON)
 		bssid->reserved[0] = 1;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index fd25289111e3..418ca141e656 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -384,7 +384,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		while (true) {
 			/* IOT action */
 			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en) &&
-			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			    (padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
@@ -477,7 +477,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	signed int bmcast = is_multicast_ether_addr(pattrib->ra);
 
-	memset(pattrib->dot118021x_UncstKey.skey,  0, 16);
+	memset(pattrib->dot11_8021x_uncst_key.skey,  0, 16);
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
@@ -491,15 +491,15 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
-		switch (psecuritypriv->dot11AuthAlgrthm) {
-		case dot11AuthAlgrthm_Open:
-		case dot11AuthAlgrthm_Shared:
-		case dot11AuthAlgrthm_Auto:
-			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
+		switch (psecuritypriv->dot11_auth_algrthm) {
+		case dot11_auth_algrthm_open:
+		case dot11_auth_algrthm_shared:
+		case dot11_auth_algrthm_auto:
+			pattrib->key_idx = (u8)psecuritypriv->dot11_privacy_key_index;
 			break;
-		case dot11AuthAlgrthm_8021X:
+		case dot11_auth_algrthm_8021x:
 			if (bmcast)
-				pattrib->key_idx = (u8)psecuritypriv->dot118021XGrpKeyid;
+				pattrib->key_idx = (u8)psecuritypriv->dot11_8021x_grp_key_id;
 			else
 				pattrib->key_idx = 0;
 			break;
@@ -558,7 +558,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	}
 
 	if (pattrib->encrypt > 0)
-		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
+		memcpy(pattrib->dot11_8021x_uncst_key.skey, psta->dot11_8021x_uncst_key.skey, 16);
 
 	if (pattrib->encrypt &&
 		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
@@ -779,10 +779,10 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
 			if (bmcst) {
-				if (!memcmp(psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey, null_key, 16))
+				if (!memcmp(psecuritypriv->dot11_8021x_grp_tx_mickey[psecuritypriv->dot11_8021x_grp_key_id].skey, null_key, 16))
 					return _FAIL;
 				/* start to calculate the mic code */
-				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey);
+				rtw_secmicsetkey(&micdata, psecuritypriv->dot11_8021x_grp_tx_mickey[psecuritypriv->dot11_8021x_grp_key_id].skey);
 			} else {
 				if (!memcmp(&pattrib->dot11tkiptxmickey.skey[0], null_key, 16))
 					return _FAIL;
@@ -872,7 +872,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 	memset(hdr, 0, WLANHDR_OFFSET);
 
-	SetFrameSubType(fctrl, pattrib->subtype);
+	set_frame_sub_type(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
 		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
@@ -881,7 +881,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			{
 				/*  1.Data transfer to AP */
 				/*  2.Arp pkt will relayed by AP */
-				SetToDs(fctrl);
+				set_to_ds(fctrl);
 				memcpy(pwlanhdr->addr1, get_bssid(pmlmepriv), ETH_ALEN);
 				memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 				memcpy(pwlanhdr->addr3, pattrib->dst, ETH_ALEN);
@@ -891,7 +891,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 				qos_option = true;
 		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
-			SetFrDs(fctrl);
+			set_fr_ds(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, get_bssid(pmlmepriv), ETH_ALEN);
 			memcpy(pwlanhdr->addr3, pattrib->src, ETH_ALEN);
@@ -912,20 +912,20 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 		}
 
 		if (pattrib->mdata)
-			SetMData(fctrl);
+			set_m_data(fctrl);
 
 		if (pattrib->encrypt)
-			SetPrivacy(fctrl);
+			set_privacy(fctrl);
 
 		if (qos_option) {
 			qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
 
 			if (pattrib->priority)
-				SetPriority(qc, pattrib->priority);
+				set_priority(qc, pattrib->priority);
 
-			SetEOSP(qc, pattrib->eosp);
+			set_eosp(qc, pattrib->eosp);
 
-			SetAckpolicy(qc, pattrib->ack_policy);
+			set_ack_policy(qc, pattrib->ack_policy);
 		}
 
 		/* TODO: fill HT Control Field */
@@ -949,7 +949,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
-				SetSeqNum(hdr, pattrib->seqnum);
+				set_seq_num(hdr, pattrib->seqnum);
 
 				/* check if enable ampdu */
 				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
@@ -1069,7 +1069,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		pframe = mem_start;
 
-		SetMFrag(mem_start);
+		set_m_frag(mem_start);
 
 		pframe += pattrib->hdrlen;
 		mpdu_len -= pattrib->hdrlen;
@@ -1114,7 +1114,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz : 0) +
 					((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
 
-			ClearMFrag(mem_start);
+			clear_m_frag(mem_start);
 
 			break;
 		}
@@ -1165,7 +1165,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
 	tmp_buf = rtw_zmalloc(ori_len);
 	BIP_AAD = rtw_zmalloc(ori_len);
-	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
+	subtype = get_frame_sub_type(pframe); /* bit(7)~bit(2) */
 
 	if (!BIP_AAD)
 		return _FAIL;
@@ -1177,7 +1177,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		goto xmitframe_coalesce_success;
 
 	/* IGTK key is not install, it may not support 802.11w */
-	if (!padapter->securitypriv.binstallBIPkey)
+	if (!padapter->securitypriv.b_install_bip_key)
 		goto xmitframe_coalesce_success;
 
 	/* station mode doesn't need TX BIP, just ready the code */
@@ -1188,14 +1188,14 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		memset(MME, 0, 18);
 
 		/* other types doesn't need the BIP */
-		if (GetFrameSubType(pframe) != WIFI_DEAUTH && GetFrameSubType(pframe) != WIFI_DISASSOC)
+		if (get_frame_sub_type(pframe) != WIFI_DEAUTH && get_frame_sub_type(pframe) != WIFI_DISASSOC)
 			goto xmitframe_coalesce_fail;
 
 		MGMT_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 		pframe += pattrib->pktlen;
 
 		/* octent 0 and 1 is key index , BIP keyid is 4 or 5, LSB only need octent 0 */
-		MME[0] = padapter->securitypriv.dot11wBIPKeyid;
+		MME[0] = padapter->securitypriv.dot11w_bip_key_id;
 		/* copy packet number */
 		memcpy(&MME[2], &pmlmeext->mgnt_80211w_IPN, 6);
 		/* increase the packet number */
@@ -1210,15 +1210,15 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 
 		/* conscruct AAD, copy frame control field */
 		memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
-		ClearRetry(BIP_AAD);
-		ClearPwrMgt(BIP_AAD);
-		ClearMData(BIP_AAD);
+		clear_retry(BIP_AAD);
+		clear_pwr_mgt(BIP_AAD);
+		clear_m_data(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 		/* copy management fram body */
 		memcpy(BIP_AAD + BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
-		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
+		if (omac1_aes_128(padapter->securitypriv.dot11w_bip_key[padapter->securitypriv.dot11w_bip_key_id].skey
 			, BIP_AAD, BIP_AAD_SIZE + frame_body_len, mic))
 			goto xmitframe_coalesce_fail;
 
@@ -1249,7 +1249,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 				goto xmitframe_coalesce_fail;
 			/* before encrypt dump the management packet content */
 			if (pattrib->encrypt > 0)
-				memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
+				memcpy(pattrib->dot11_8021x_uncst_key.skey, psta->dot11_8021x_uncst_key.skey, 16);
 			/* bakeup original management packet */
 			memcpy(tmp_buf, pframe, pattrib->pktlen);
 			/* move to data portion */
@@ -1287,7 +1287,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			pattrib->last_txcmdsz = pattrib->pktlen;
 
 			/* set protected bit must be beofre SW encrypt */
-			SetPrivacy(mem_start);
+			set_privacy(mem_start);
 			/* software encrypt */
 			xmitframe_swencrypt(padapter, pxmitframe);
 		}
@@ -1383,7 +1383,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
-		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
+		pmlmepriv->link_detect_info.num_tx_ok_in_period += pkt_num;
 
 		pxmitpriv->tx_pkts += pkt_num;
 
@@ -2451,7 +2451,7 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 
 			pxmitbuf = container_of(plist, struct xmit_buf, list);
 
-			type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);
+			type = get_frame_sub_type(pxmitbuf->pbuf + TXDESC_OFFSET);
 
 			if ((type == WIFI_PROBEREQ) ||
 				(type == WIFI_DATA_NULL) ||
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..47aabfc527f4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -167,7 +167,7 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 			return true;
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+		if (pmlmepriv->link_detect_info.bBusyTraffic)
 			return true;
 	}
 
@@ -325,7 +325,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 		break;
 
 	case BTC_GET_BL_WIFI_ENABLE_ENCRYPTION:
-		*pu8 = padapter->securitypriv.dot11PrivacyAlgrthm != 0;
+		*pu8 = padapter->securitypriv.dot11_privacy_algrthm != 0;
 		break;
 
 	case BTC_GET_BL_WIFI_UNDER_B_MODE:
@@ -364,9 +364,9 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 	case BTC_GET_U4_WIFI_TRAFFIC_DIRECTION:
 		{
 			struct rt_link_detect_t *plinkinfo;
-			plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
+			plinkinfo = &padapter->mlmepriv.link_detect_info;
 
-			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
+			if (plinkinfo->num_tx_ok_in_period > plinkinfo->NumRxOkInPeriod)
 				*pU4Tmp = BTC_WIFI_TRAFFIC_TX;
 			else
 				*pU4Tmp = BTC_WIFI_TRAFFIC_RX;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 70b5b289f9cb..ab65bd2ae2b3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -593,7 +593,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
-			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
+			if (sec->dot11_auth_algrthm != dot11_auth_algrthm_8021x)
 				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
 		} else /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 462553d296ff..97dcb9a84cf8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -160,7 +160,7 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
 	/* memcpy(pmgntframe->attrib.ra, pwlanhdr->addr1, ETH_ALEN); */
 
-	if (padapter->securitypriv.binstallBIPkey == true) {
+	if (padapter->securitypriv.b_install_bip_key == true) {
 		if (is_multicast_ether_addr(pmgntframe->attrib.ra)) {
 			pmgntframe->attrib.encrypt = _BIP_;
 			/* pmgntframe->attrib.bswenc = true; */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..be2755e6059a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -121,9 +121,9 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
-	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
+	set_seq_num(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
 	/* pmlmeext->mgnt_seq++; */
-	SetFrameSubType(pframe, WIFI_BEACON);
+	set_frame_sub_type(pframe, WIFI_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pktlen = sizeof(struct ieee80211_hdr_3addr);
@@ -204,7 +204,7 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 	SetPwrMgt(fctrl);
-	SetFrameSubType(pframe, WIFI_PSPOLL);
+	set_frame_sub_type(pframe, WIFI_PSPOLL);
 
 	/*  AID. */
 	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
@@ -246,13 +246,13 @@ static void ConstructNullFunctionData(
 
 	switch (cur_network->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
-		SetToDs(fctrl);
+		set_to_ds(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
 	case Ndis802_11APMode:
-		SetFrDs(fctrl);
+		set_fr_ds(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
@@ -265,20 +265,20 @@ static void ConstructNullFunctionData(
 		break;
 	}
 
-	SetSeqNum(pwlanhdr, 0);
+	set_seq_num(pwlanhdr, 0);
 
 	if (bQoS) {
 		struct ieee80211_qos_hdr *pwlanqoshdr;
 
-		SetFrameSubType(pframe, WIFI_QOS_DATA_NULL);
+		set_frame_sub_type(pframe, WIFI_QOS_DATA_NULL);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
-		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
-		SetEOSP(&pwlanqoshdr->qos_ctrl, bEosp);
+		set_priority(&pwlanqoshdr->qos_ctrl, AC);
+		set_eosp(&pwlanqoshdr->qos_ctrl, bEosp);
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
-		SetFrameSubType(pframe, WIFI_DATA_NULL);
+		set_frame_sub_type(pframe, WIFI_DATA_NULL);
 
 		pktlen = sizeof(struct ieee80211_hdr_3addr);
 	}
@@ -765,26 +765,26 @@ static void ConstructBtNullFunctionData(
 	if (bForcePowerSave)
 		SetPwrMgt(fctrl);
 
-	SetFrDs(fctrl);
+	set_fr_ds(fctrl);
 	ether_addr_copy(pwlanhdr->addr1, StaAddr);
 	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 	ether_addr_copy(pwlanhdr->addr3, myid(&padapter->eeprompriv));
 
 	SetDuration(pwlanhdr, 0);
-	SetSeqNum(pwlanhdr, 0);
+	set_seq_num(pwlanhdr, 0);
 
 	if (bQoS) {
 		struct ieee80211_qos_hdr *pwlanqoshdr;
 
-		SetFrameSubType(pframe, WIFI_QOS_DATA_NULL);
+		set_frame_sub_type(pframe, WIFI_QOS_DATA_NULL);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
-		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
-		SetEOSP(&pwlanqoshdr->qos_ctrl, bEosp);
+		set_priority(&pwlanqoshdr->qos_ctrl, AC);
+		set_eosp(&pwlanqoshdr->qos_ctrl, bEosp);
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
-		SetFrameSubType(pframe, WIFI_DATA_NULL);
+		set_frame_sub_type(pframe, WIFI_DATA_NULL);
 
 		pktlen = sizeof(struct ieee80211_hdr_3addr);
 	}
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..fd1b8d383ca4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -88,7 +88,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_RX_UNI, &(dvobj->traffic_stat.rx_bytes));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_WM_MODE, &(pmlmeext->cur_wireless_mode));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_CHNL_OFFSET, &(pHalData->nCur40MhzPrimeSC));
-	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_MODE, &(Adapter->securitypriv.dot11PrivacyAlgrthm));
+	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_MODE, &(Adapter->securitypriv.dot11_privacy_algrthm));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_BW, &(pHalData->CurrentChannelBW));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_CHNL, &(pHalData->CurrentChannel));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_NET_CLOSED, &(Adapter->net_closed));
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..f1b9b58ad26b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1906,7 +1906,7 @@ void rtl8723b_fill_fake_txdesc(
 	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
 	/*  */
 	if (bDataFrame) {
-		u32 EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
+		u32 EncAlg = padapter->securitypriv.dot11_privacy_algrthm;
 
 		switch (EncAlg) {
 		case _NO_PRIVACY_:
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 399edfbf8ec6..554b6e64844f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -112,7 +112,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 
 
 	pkt_info.is_beacon = pkt_info.bssid_match &&
-		(GetFrameSubType(wlanhdr) == WIFI_BEACON);
+		(get_frame_sub_type(wlanhdr) == WIFI_BEACON);
 
 	sa = get_ta(wlanhdr);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..3eded093fcf4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -202,7 +202,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 		if (
 			(check_pending_xmitbuf(pxmitpriv)) &&
-			(padapter->mlmepriv.LinkDetectInfo.bHigherBusyTxTraffic)
+			(padapter->mlmepriv.link_detect_info.bHigherBusyTxTraffic)
 		) {
 			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
 				err = -2;
@@ -445,7 +445,7 @@ s32 rtl8723bs_mgnt_xmit(
 
 	pxmitbuf->priv_data = NULL;
 
-	if (GetFrameSubType(pframe) == WIFI_BEACON) { /* dump beacon directly */
+	if (get_frame_sub_type(pframe) == WIFI_BEACON) { /* dump beacon directly */
 		ret = rtw_write_port(padapter, pdvobjpriv->Queue2Pipe[pxmitbuf->ff_hwaddr], pxmitbuf->len, (u8 *)pxmitbuf);
 		if (ret != _SUCCESS)
 			rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_WRITE_PORT_ERR);
@@ -482,7 +482,7 @@ s32 rtl8723bs_hal_xmit(
 		(pxmitframe->attrib.ether_type != 0x888e) &&
 		(pxmitframe->attrib.dhcp_pkt != 1)
 	) {
-		if (padapter->mlmepriv.LinkDetectInfo.bBusyTraffic)
+		if (padapter->mlmepriv.link_detect_info.bBusyTraffic)
 			rtw_issue_addbareq_cmd(padapter, pxmitframe);
 	}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 2a128568c6df..80500084031c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -44,12 +44,12 @@
 
 
 enum {
- dot11AuthAlgrthm_Open = 0,
- dot11AuthAlgrthm_Shared,
- dot11AuthAlgrthm_8021X,
- dot11AuthAlgrthm_Auto,
- dot11AuthAlgrthm_WAPI,
- dot11AuthAlgrthm_MaxNum
+ dot11_auth_algrthm_open = 0,
+ dot11_auth_algrthm_shared,
+ dot11_auth_algrthm_8021x,
+ dot11_auth_algrthm_auto,
+ dot11_auth_algrthm_wapi,
+ dot11_auth_algrthm_maxnum
 };
 
 /*  Scan type including active and passive scan. */
@@ -93,7 +93,7 @@ struct sitesurvey_ctrl {
 };
 
 struct rt_link_detect_t {
-	u32 			NumTxOkInPeriod;
+	u32 			num_tx_ok_in_period;
 	u32 			NumRxOkInPeriod;
 	u32 			NumRxUnicastOkInPeriod;
 	bool			bBusyTraffic;
@@ -171,7 +171,7 @@ struct mlme_priv {
 
 	struct ht_priv htpriv;
 
-	struct rt_link_detect_t	LinkDetectInfo;
+	struct rt_link_detect_t	link_detect_info;
 	struct timer_list	dynamic_chk_timer; /* dynamic/periodic check timer */
 
 	u8 acm_mask; /*  for wmm acm mask */
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..e51820fe6f30 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -91,24 +91,24 @@ struct rt_pmkid_list {
 
 
 struct security_priv {
-	u32   dot11AuthAlgrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
-	u32   dot11PrivacyAlgrthm;	/*  This specify the privacy for shared auth. algorithm. */
+	u32   dot11_auth_algrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
+	u32   dot11_privacy_algrthm;	/*  This specify the privacy for shared auth. algorithm. */
 
 	/* WEP */
-	u32   dot11PrivacyKeyIndex;	/*  this is only valid for legendary wep, 0~3 for key id. (tx key index) */
+	u32   dot11_privacy_key_index;	/*  this is only valid for legendary wep, 0~3 for key id. (tx key index) */
 	union Keytype dot11DefKey[4];	/*  this is only valid for def. key */
 	u32 dot11DefKeylen[4];
 	u8 key_mask; /* use to restore wep key after hal_init */
 
-	u32 dot118021XGrpPrivacy;	/*  This specify the privacy algthm. used for Grp key */
-	u32 dot118021XGrpKeyid;		/*  key id used for Grp Key (tx key index) */
+	u32 dot11_8021x_grp_privacy;	/*  This specify the privacy algthm. used for Grp key */
+	u32 dot11_8021x_grp_key_id;		/*  key id used for Grp Key (tx key index) */
 	union Keytype	dot118021XGrpKey[BIP_MAX_KEYID + 1];	/*  802.1x Group Key, for inx0 and inx1 */
-	union Keytype	dot118021XGrptxmickey[BIP_MAX_KEYID + 1];
+	union Keytype	dot11_8021x_grp_tx_mickey[BIP_MAX_KEYID + 1];
 	union Keytype	dot118021XGrprxmickey[BIP_MAX_KEYID + 1];
 	union pn48		dot11Grptxpn;			/*  PN48 used for Grp Key xmit. */
 	union pn48		dot11Grprxpn;			/*  PN48 used for Grp Key recv. */
-	u32 dot11wBIPKeyid;						/*  key id used for BIP Key (tx key index) */
-	union Keytype	dot11wBIPKey[BIP_MAX_KEYID + 1];	/*  BIP Key, for index4 and index5 */
+	u32 dot11w_bip_key_id;						/*  key id used for BIP Key (tx key index) */
+	union Keytype	dot11w_bip_key[BIP_MAX_KEYID + 1];	/*  BIP Key, for index4 and index5 */
 	union pn48		dot11wBIPtxpn;			/*  PN48 used for Grp Key xmit. */
 	union pn48		dot11wBIPrxpn;			/*  PN48 used for Grp Key recv. */
 
@@ -127,7 +127,7 @@ struct security_priv {
 	struct arc4_ctx recv_arc4_ctx;
 
 	u8 binstallGrpkey;
-	u8 binstallBIPkey;
+	u8 b_install_bip_key;
 	u8 busetkipkey;
 	/* _timer tkip_timer; */
 	u8 bcheck_grpkey;
@@ -170,20 +170,20 @@ struct security_priv {
 
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
-	switch (psecuritypriv->dot11AuthAlgrthm) {\
-	case dot11AuthAlgrthm_Open:\
-	case dot11AuthAlgrthm_Shared:\
-	case dot11AuthAlgrthm_Auto:\
-		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+	switch (psecuritypriv->dot11_auth_algrthm) {\
+	case dot11_auth_algrthm_open:\
+	case dot11_auth_algrthm_shared:\
+	case dot11_auth_algrthm_auto:\
+		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
-	case dot11AuthAlgrthm_8021X:\
+	case dot11_auth_algrthm_8021x:\
 		if (bmcst)\
-			encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
+			encry_algo = (u8)psecuritypriv->dot11_8021x_grp_privacy;\
 		else\
 			encry_algo = (u8)psta->dot118021XPrivacy;\
 		break;\
-	case dot11AuthAlgrthm_WAPI:\
-		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+	case dot11_auth_algrthm_wapi:\
+		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
 	} \
 } while (0)
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 544468f57692..a26d23cff3da 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -181,7 +181,7 @@ struct pkt_attrib {
 	u8 cts2self;
 	union Keytype	dot11tkiptxmickey;
 	/* union Keytype	dot11tkiprxmickey; */
-	union Keytype	dot118021x_UncstKey;
+	union Keytype	dot11_8021x_uncst_key;
 
 	u8 icmp_pkt;
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 63343998266a..1f15cba25de3 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -90,7 +90,7 @@ struct sta_info {
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-	union Keytype	dot118021x_UncstKey;
+	union Keytype	dot11_8021x_uncst_key;
 	union pn48		dot11txpn;			/*  PN48 used for Unicast xmit */
 	union pn48		dot11wtxpn;			/*  PN48 used for Unicast mgmt xmit. */
 	union pn48		dot11rxpn;			/*  PN48 used for Unicast recv. */
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..ba2872f8482f 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -70,29 +70,29 @@ enum {
 #define _PRIVACY_	BIT(14)
 #define _ORDER_			BIT(15)
 
-#define SetToDs(pbuf)	\
+#define set_to_ds(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_TO_DS_))
 
 #define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
 
-#define SetFrDs(pbuf)	\
+#define set_fr_ds(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
 #define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
 
-#define SetMFrag(pbuf)	\
+#define set_m_frag(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
 
 #define GetMFrag(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_FRAG_)) != 0)
 
-#define ClearMFrag(pbuf)	\
+#define clear_m_frag(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_)))
 
 #define GetRetry(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_RETRY_)) != 0)
 
-#define ClearRetry(pbuf)	\
+#define clear_retry(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_RETRY_)))
 
 #define SetPwrMgt(pbuf)	\
@@ -100,18 +100,18 @@ enum {
 
 #define GetPwrMgt(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PWRMGT_)) != 0)
 
-#define ClearPwrMgt(pbuf)	\
+#define clear_pwr_mgt(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_PWRMGT_)))
 
-#define SetMData(pbuf)	\
+#define set_m_data(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_))
 
 #define GetMData(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
 
-#define ClearMData(pbuf)	\
+#define clear_m_data(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_DATA_)))
 
-#define SetPrivacy(pbuf)	\
+#define set_privacy(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_))
 
 #define GetPrivacy(pbuf)					\
@@ -129,10 +129,10 @@ enum {
 		*(unsigned short *)(pbuf) |= cpu_to_le16(type); \
 	} while (0)
 
-#define GetFrameSubType(pbuf)	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(7) |\
+#define get_frame_sub_type(pbuf)	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(7) |\
 	 BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2)))
 
-#define SetFrameSubType(pbuf, type) \
+#define set_frame_sub_type(pbuf, type) \
 	do {    \
 		*(__le16 *)(pbuf) &= cpu_to_le16(~(BIT(7) | BIT(6) |	\
 		 BIT(5) | BIT(4) | BIT(3) | BIT(2))); \
@@ -153,7 +153,7 @@ enum {
 			cpu_to_le16(0x0f & (num));     \
 	} while (0)
 
-#define SetSeqNum(pbuf, num) \
+#define set_seq_num(pbuf, num) \
 	do {    \
 		*(__le16 *)((size_t)(pbuf) + 22) = \
 			((*(__le16 *)((size_t)(pbuf) + 22)) & cpu_to_le16((unsigned short)0x000f)) | \
@@ -164,15 +164,15 @@ enum {
 	(*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur)))
 
 
-#define SetPriority(pbuf, tid)	\
+#define set_priority(pbuf, tid)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf))
 
 #define GetPriority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
 
-#define SetEOSP(pbuf, eosp)	\
+#define set_eosp(pbuf, eosp)	\
 		(*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4))
 
-#define SetAckpolicy(pbuf, ack)	\
+#define set_ack_policy(pbuf, ack)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5))
 
 #define GetAckpolicy(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 5) & 0x3)
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..c1719326aefd 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -289,15 +289,15 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
+	set_seq_num(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
 	/* pmlmeext->mgnt_seq++; */
 
 	if (pnetwork->network.reserved[0] == 1) { /*  WIFI_BEACON */
 		eth_broadcast_addr(pwlanhdr->addr1);
-		SetFrameSubType(pbuf, WIFI_BEACON);
+		set_frame_sub_type(pbuf, WIFI_BEACON);
 	} else {
 		memcpy(pwlanhdr->addr1, myid(&(padapter->eeprompriv)), ETH_ALEN);
-		SetFrameSubType(pbuf, WIFI_PROBERSP);
+		set_frame_sub_type(pbuf, WIFI_PROBERSP);
 	}
 
 	memcpy(pwlanhdr->addr2, pnetwork->network.mac_address, ETH_ALEN);
@@ -500,7 +500,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	struct security_priv *psecuritypriv =  &(padapter->securitypriv);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	char *grpkey = padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey;
-	char *txkey = padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey;
+	char *txkey = padapter->securitypriv.dot11_8021x_grp_tx_mickey[param->u.crypt.idx].skey;
 	char *rxkey = padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey;
 
 	param->u.crypt.err = 0;
@@ -543,17 +543,17 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
-			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
+			psecuritypriv->dot11_8021x_grp_privacy = _WEP40_;
 
 			if (wep_key_len == 13) {
-				psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
-				psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
+				psecuritypriv->dot11_privacy_algrthm = _WEP104_;
+				psecuritypriv->dot11_8021x_grp_privacy = _WEP104_;
 			}
 
-			psecuritypriv->dot11PrivacyKeyIndex = wep_key_idx;
+			psecuritypriv->dot11_privacy_key_index = wep_key_idx;
 		}
 
 		memcpy(&(psecuritypriv->dot11DefKey[wep_key_idx].skey[0]), param->u.crypt.key, wep_key_len);
@@ -572,12 +572,12 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 			if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-				psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+				psecuritypriv->dot11_8021x_grp_privacy = _WEP40_;
 				if (param->u.crypt.key_len == 13)
-					psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
+					psecuritypriv->dot11_8021x_grp_privacy = _WEP104_;
 
 			} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
-				psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
+				psecuritypriv->dot11_8021x_grp_privacy = _TKIP_;
 
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
@@ -588,35 +588,35 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				psecuritypriv->busetkipkey = true;
 
 			} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
-				psecuritypriv->dot118021XGrpPrivacy = _AES_;
+				psecuritypriv->dot11_8021x_grp_privacy = _AES_;
 
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 			} else {
-				psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
+				psecuritypriv->dot11_8021x_grp_privacy = _NO_PRIVACY_;
 			}
 
-			psecuritypriv->dot118021XGrpKeyid = param->u.crypt.idx;
+			psecuritypriv->dot11_8021x_grp_key_id = param->u.crypt.idx;
 
 			psecuritypriv->binstallGrpkey = true;
 
-			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+			psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot11_8021x_grp_privacy;/*  */
 
-			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot11_8021x_grp_privacy, param->u.crypt.idx);
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
 				pbcmc_sta->ieee8021x_blocked = false;
-				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot11_8021x_grp_privacy;/* rx will use bmc_sta's dot118021XPrivacy */
 			}
 		}
 
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
-				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+				memcpy(psta->dot11_8021x_uncst_key.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					psta->dot118021XPrivacy = _WEP40_;
@@ -647,11 +647,11 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-					psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+					psecuritypriv->dot11_8021x_grp_privacy = _WEP40_;
 					if (param->u.crypt.key_len == 13)
-						psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
+						psecuritypriv->dot11_8021x_grp_privacy = _WEP104_;
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
-					psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
+					psecuritypriv->dot11_8021x_grp_privacy = _TKIP_;
 
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
@@ -662,25 +662,25 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					psecuritypriv->busetkipkey = true;
 
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
-					psecuritypriv->dot118021XGrpPrivacy = _AES_;
+					psecuritypriv->dot11_8021x_grp_privacy = _AES_;
 
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 				} else {
-					psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
+					psecuritypriv->dot11_8021x_grp_privacy = _NO_PRIVACY_;
 				}
 
-				psecuritypriv->dot118021XGrpKeyid = param->u.crypt.idx;
+				psecuritypriv->dot11_8021x_grp_key_id = param->u.crypt.idx;
 
 				psecuritypriv->binstallGrpkey = true;
 
-				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+				psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot11_8021x_grp_privacy;/*  */
 
-				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot11_8021x_grp_privacy, param->u.crypt.idx);
 
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
 					pbcmc_sta->ieee8021x_blocked = false;
-					pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+					pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot11_8021x_grp_privacy;/* rx will use bmc_sta's dot118021XPrivacy */
 				}
 			}
 		}
@@ -741,15 +741,15 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
-			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
+			psecuritypriv->dot11_8021x_grp_privacy = _WEP40_;
 
 			if (wep_key_len == 13) {
-				psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
-				psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
+				psecuritypriv->dot11_privacy_algrthm = _WEP104_;
+				psecuritypriv->dot11_8021x_grp_privacy = _WEP104_;
 			}
 
-			psecuritypriv->dot11PrivacyKeyIndex = wep_key_idx;
+			psecuritypriv->dot11_privacy_key_index = wep_key_idx;
 		}
 
 		memcpy(&(psecuritypriv->dot11DefKey[wep_key_idx].skey[0]), param->u.crypt.key, wep_key_len);
@@ -761,7 +761,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		goto exit;
 	}
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) { /*  802_1x */
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
@@ -774,12 +774,12 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(psta->dot11_8021x_uncst_key.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
@@ -793,17 +793,17 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 				} else { /* group key */
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0 || strcmp(param->u.crypt.alg, "CCMP") == 0) {
 						memcpy(padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						memcpy(padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[16]), 8);
+						memcpy(padapter->securitypriv.dot11_8021x_grp_tx_mickey[param->u.crypt.idx].skey, &(param->u.crypt.key[16]), 8);
 						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[24]), 8);
 						padapter->securitypriv.binstallGrpkey = true;
 
-						padapter->securitypriv.dot118021XGrpKeyid = param->u.crypt.idx;
+						padapter->securitypriv.dot11_8021x_grp_key_id = param->u.crypt.idx;
 						rtw_set_key(padapter, &padapter->securitypriv, param->u.crypt.idx, 1, true);
 					} else if (strcmp(param->u.crypt.alg, "BIP") == 0) {
 						/* save the IGTK key, length 16 bytes */
-						memcpy(padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						padapter->securitypriv.dot11wBIPKeyid = param->u.crypt.idx;
-						padapter->securitypriv.binstallBIPkey = true;
+						memcpy(padapter->securitypriv.dot11w_bip_key[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+						padapter->securitypriv.dot11w_bip_key_id = param->u.crypt.idx;
+						padapter->securitypriv.b_install_bip_key = true;
 					}
 				}
 			}
@@ -816,7 +816,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 			}
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
@@ -924,7 +924,7 @@ static int cfg80211_rtw_del_key(struct wiphy *wiphy, struct net_device *ndev,
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
-	if (key_index == psecuritypriv->dot11PrivacyKeyIndex) {
+	if (key_index == psecuritypriv->dot11_privacy_key_index) {
 		/* clear the flag of wep default key set. */
 		psecuritypriv->bWepDefaultKeyIdxSet = 0;
 	}
@@ -940,16 +940,16 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
-	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11PrivacyAlgrthm == _WEP40_) || (psecuritypriv->dot11PrivacyAlgrthm == _WEP104_))) { /* set wep default key */
+	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11_privacy_algrthm == _WEP40_) || (psecuritypriv->dot11_privacy_algrthm == _WEP104_))) { /* set wep default key */
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
-		psecuritypriv->dot11PrivacyKeyIndex = key_index;
+		psecuritypriv->dot11_privacy_key_index = key_index;
 
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
-		psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+		psecuritypriv->dot11_privacy_algrthm = _WEP40_;
+		psecuritypriv->dot11_8021x_grp_privacy = _WEP40_;
 		if (psecuritypriv->dot11DefKeylen[key_index] == 13) {
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
-			psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP104_;
+			psecuritypriv->dot11_8021x_grp_privacy = _WEP104_;
 		}
 
 		psecuritypriv->bWepDefaultKeyIdxSet = 1; /* set the flag to represent that wep default key has been set */
@@ -1231,7 +1231,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		goto check_need_indicate_scan_done;
 	}
 
-	if (pmlmepriv->LinkDetectInfo.bBusyTraffic == true) {
+	if (pmlmepriv->link_detect_info.bBusyTraffic == true) {
 		static unsigned long lastscantime;
 		unsigned long passtime;
 
@@ -1323,26 +1323,26 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 	switch (sme_auth_type) {
 	case NL80211_AUTHTYPE_AUTOMATIC:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
 
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_shared;
 
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		break;
 	default:
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open;
 		/* return -ENOTSUPP; */
 	}
 
@@ -1353,8 +1353,8 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 {
 	u32 ndisencryptstatus = Ndis802_11EncryptionDisabled;
 
-	u32 *profile_cipher = ucast ? &psecuritypriv->dot11PrivacyAlgrthm :
-		&psecuritypriv->dot118021XGrpPrivacy;
+	u32 *profile_cipher = ucast ? &psecuritypriv->dot11_privacy_algrthm :
+		&psecuritypriv->dot11_8021x_grp_privacy;
 
 	if (!cipher) {
 		*profile_cipher = _NO_PRIVACY_;
@@ -1390,7 +1390,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 	if (ucast) {
 		psecuritypriv->ndisencryptstatus = ndisencryptstatus;
 
-		/* if (psecuritypriv->dot11PrivacyAlgrthm >= _AES_) */
+		/* if (psecuritypriv->dot11_privacy_algrthm >= _AES_) */
 		/*	psecuritypriv->ndisauthtype = Ndis802_11AuthModeWPA2PSK; */
 	}
 
@@ -1401,9 +1401,9 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 	}
 
 	return 0;
@@ -1446,7 +1446,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1455,7 +1455,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
@@ -1469,46 +1469,46 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 	switch (group_cipher) {
 	case WPA_CIPHER_NONE:
-		padapter->securitypriv.dot118021XGrpPrivacy = _NO_PRIVACY_;
+		padapter->securitypriv.dot11_8021x_grp_privacy = _NO_PRIVACY_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
 		break;
 	case WPA_CIPHER_WEP40:
-		padapter->securitypriv.dot118021XGrpPrivacy = _WEP40_;
+		padapter->securitypriv.dot11_8021x_grp_privacy = _WEP40_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	case WPA_CIPHER_TKIP:
-		padapter->securitypriv.dot118021XGrpPrivacy = _TKIP_;
+		padapter->securitypriv.dot11_8021x_grp_privacy = _TKIP_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
 		break;
 	case WPA_CIPHER_CCMP:
-		padapter->securitypriv.dot118021XGrpPrivacy = _AES_;
+		padapter->securitypriv.dot11_8021x_grp_privacy = _AES_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
 		break;
 	case WPA_CIPHER_WEP104:
-		padapter->securitypriv.dot118021XGrpPrivacy = _WEP104_;
+		padapter->securitypriv.dot11_8021x_grp_privacy = _WEP104_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	}
 
 	switch (pairwise_cipher) {
 	case WPA_CIPHER_NONE:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		padapter->securitypriv.dot11_privacy_algrthm = _NO_PRIVACY_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
 		break;
 	case WPA_CIPHER_WEP40:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP40_;
+		padapter->securitypriv.dot11_privacy_algrthm = _WEP40_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	case WPA_CIPHER_TKIP:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _TKIP_;
+		padapter->securitypriv.dot11_privacy_algrthm = _TKIP_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
 		break;
 	case WPA_CIPHER_CCMP:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _AES_;
+		padapter->securitypriv.dot11_privacy_algrthm = _AES_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
 		break;
 	case WPA_CIPHER_WEP104:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
+		padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	}
@@ -1528,9 +1528,9 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	/* TKIP and AES disallow multicast packets until installing group key */
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _TKIP_
+		|| padapter->securitypriv.dot11_privacy_algrthm == _TKIP_WTMIC_
+		|| padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		/* WPS open need to enable multicast */
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
@@ -1576,9 +1576,9 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
-	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_8021x_grp_privacy = _NO_PRIVACY_;
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1672,9 +1672,9 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 		rtw_scan_abort(padapter);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
-	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_8021x_grp_privacy = _NO_PRIVACY_;
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
@@ -1697,8 +1697,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	}
 
 	/* For WEP Shared auth */
-	if ((psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Shared ||
-	     psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Auto) && sme->key) {
+	if ((psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_shared ||
+	     psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
 
@@ -1726,8 +1726,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 			pwep->length = wep_total_len;
 
 			if (wep_key_len == 13) {
-				padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
-				padapter->securitypriv.dot118021XGrpPrivacy = _WEP104_;
+				padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
+				padapter->securitypriv.dot11_8021x_grp_privacy = _WEP104_;
 			}
 		} else {
 			ret = -EINVAL;
@@ -1920,7 +1920,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 		struct station_info sinfo = {};
 		u8 ie_offset;
 
-		if (GetFrameSubType(pmgmt_frame) == WIFI_ASSOCREQ)
+		if (get_frame_sub_type(pmgmt_frame) == WIFI_ASSOCREQ)
 			ie_offset = _ASOCREQ_IE_OFFSET_;
 		else /*  WIFI_REASSOCREQ */
 			ie_offset = _REASOCREQ_IE_OFFSET_;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548805..738a0a9529a9 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -525,13 +525,13 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 
-	psecuritypriv->dot11PrivacyKeyIndex = 0;
+	psecuritypriv->dot11_privacy_key_index = 0;
 
-	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot118021XGrpKeyid = 1;
+	psecuritypriv->dot11_8021x_grp_privacy = _NO_PRIVACY_;
+	psecuritypriv->dot11_8021x_grp_key_id = 1;
 
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 	psecuritypriv->ndisencryptstatus = Ndis802_11WEPDisabled;
@@ -610,11 +610,11 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	padapter->xmitpriv.tx_pkts = 0;
 	padapter->recvpriv.rx_pkts = 0;
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.bBusyTraffic = false;
 
-	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
+	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
+	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
 
-- 
2.52.0

