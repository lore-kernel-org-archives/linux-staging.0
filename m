Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F33F5BFA
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346566; cv=none; b=X0BtHbjwwQDV4Y+vL0SFpR8J2Z927XalQc72vArxAk0dqEknH0ZQGp+nTdIkW2aSn/Ke/2Xxnc9jW4GX9Z2mcQ6aAbd5ShRuKgaOUFnxU+HOTYdUUYlgt/ZUpV7OStnpuZq+HrzoM0Edp2DBsegAgS9TBCIHSZSj6X14S2CkbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346566; c=relaxed/simple;
	bh=1faOaAS7qabqINtHcSa3/cmVJCb76Ie6y4m2P5pf1ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgJG2yuWMuwf2Nb1BihHyR1wx9O/esnpmv3/Az1rvf9y6EmQx/mR2lRmF4xRSeBpL4jyrKUpZAdCUQAGwuAA7SzU/hrUhYN2e08BJJnduN29JIRpqGJH6BnKhLmrE6wi4WNQbL20cIrqIXzKDVTiYAZgyHA6VSQlfSWFchPMp74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+GI6LDs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+GI6LDs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so118334745e9.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346561; x=1780951361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUAXKhhSMS22PZd5+gl3h3WvzEoQ2O+XRwSHQVzJB34=;
        b=b+GI6LDs62e/nF1rxbrsEGY0CIwio24rh/Wcd+m6i6LMAjq7AFU/6AKzr7tZZrpzNB
         dvp5NJyiHEFgaplSVgWKWThKS0vXcbewtBOOwjiUsbL/IT7zLNFp7slelrLP+idqWb+6
         K4g6OqWhpkny3aqIsLRmc7f2aoDLWS1TniTC7ppGbvatGVnRWFzeRzBaBiRKNY/4YuTi
         +8xEmYkgOt3aHjN5Dw25A0mTZoeyGyHi+91DTMTjtSMzFyst2ziPS4moq0Nf/CJ/+31p
         8xYKcMazvGpih1ZIMWMy/bsJbvamYUoAbMXkP/peWAyR652FrDZeHs1Y7xaqjqwZrzU7
         XxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346561; x=1780951361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUAXKhhSMS22PZd5+gl3h3WvzEoQ2O+XRwSHQVzJB34=;
        b=A3l6ZwwPkswiC0BAbKLbR1d9EO6m70jMwBL/QhCHzFqBP1c6xyN5kP+8P9Yd8minKf
         ooC3IjjlfD4BVsOcM3fzc4v0xgToa3Jq+Mc1K+UyYaurTo9Jbr9HsxPySy3aXrb0kz/g
         Fxq9TO2CXuLapOnN/Afvn4po3XkIGVeaRt5PGjW9xQy9MqhChArpVlaaUMEV9+ob32uK
         gj42AaejoU6ZsJU1stdCvKm28lT736OomLUJQtrGgpn9bNhgRJ9PiJUNEsyRdTTHfRaN
         w1/cvdNSSK0+E4yQpbqIRPhak4XBoLJ4a2qE009c/kpjBsSeBd9BCnA8R+rEvYxkPFXV
         ylsg==
X-Gm-Message-State: AOJu0YwDzq/jhHvFlvxIDIo+KregVzPO+H8G//ApR0c9LmX8l9E5fJw5
	6v4jEtpKHdxZCeFPPdE2bpl4lu7vcJUKSNYmEP9N+oyhAMELc85OFMRh
X-Gm-Gg: Acq92OFVB9b5aesOKCuZURuO7gAMSwUdTfynTsF5HugTZwS5j31r0h4Yg3fj3jAsu5X
	xR02rzpxrJ0xHiXD1BBDZ6Flaax6HsFUkh31qjfhN4uFPbyEsKHFpxrnj2BoMott3hT4Sxnnql3
	PZJauMu384bFvpaakMC1HNE+U7oiHSJSntvBKPHO5ZGu9AZ6tv9jIuXfAYvOxnya5daH3ArJaR2
	LhUrZHAdzKZ+Rvt92WL26MXhOX+CAhJJtmlr1m05VN0KqeJqajGREgyZUwSsqT8s++UY/InTxBK
	QRIeaaki4x4VEf6XmaoUmvM9gqmcRUo4KKWQ/YX2u89tqnS1S+KKLKjiunlxeTwB1cJFxylASV5
	fx2Abq6Gh2WyAfUuCJlxosCAC0E9MBqStCDXhFNEJ9ZgKxe5n75x/vPHHvOX2rNTMBehZFGK9ln
	D1QJwBHzZCGLImFwWk17C5zKIc4eKp7ORhxSzyky/NlI6T0p35fhwiNuFs/M/yMFXCr1xkzDoxe
	/L6PAsx1IJJBBoUPMiSj+Vm24M=
X-Received: by 2002:a05:600c:6091:b0:490:6237:521b with SMTP id 5b1f17b1804b1-490a2b6b21cmr234633565e9.27.1780346561204;
        Mon, 01 Jun 2026 13:42:41 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm16988405e9.5.2026.06.01.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:42:40 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 1/6] staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_8021X
Date: Mon,  1 Jun 2026 20:39:53 +0000
Message-ID: <a3add17a969772a1ea6f9c2dc00cc2591fa152d9.1780343502.git.fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343502.git.fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Rename value dot11AuthAlgrthm_8021X to dot11_auth_algrthm_8021x in
enum to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           |  8 ++++----
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  8 ++++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c         |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c           |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_security.h  |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 14 +++++++-------
 10 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e894..3c8bf98f42c7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -447,7 +447,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11AuthAlgrthm == dot11_auth_algrthm_8021x)
 		psta->ieee8021x_blocked = true;
 	else
 		psta->ieee8021x_blocked = false;
@@ -674,7 +674,7 @@ void start_bss_network(struct adapter *padapter)
 
 	/* Set Security */
 	val8 = (psecuritypriv->dot11AuthAlgrthm ==
-		dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 	/* Beacon Control related register */
@@ -872,7 +872,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 				      &group_cipher,
 				      &pairwise_cipher,
 				      NULL) == _SUCCESS) {
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 			psecuritypriv->wpa_psk |= BIT(1);
@@ -898,7 +898,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 					     &group_cipher,
 					     &pairwise_cipher,
 					     NULL) == _SUCCESS) {
-				psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+				psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 12bf7780bea5..2922cd1c3ea7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -400,7 +400,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 	psecuritypriv->ndisauthtype = authmode;
 
 	if (psecuritypriv->ndisauthtype > 3)
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 
 	res = rtw_set_auth(padapter, psecuritypriv);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4fb74729180f..01e758a5fb8e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -969,7 +969,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11AuthAlgrthm == dot11_auth_algrthm_8021x) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
@@ -1080,7 +1080,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11AuthAlgrthm == dot11_auth_algrthm_8021x) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -1330,7 +1330,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (adapter->securitypriv.dot11AuthAlgrthm == dot11_auth_algrthm_8021x)
 		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
 
 	psta->ieee8021x_blocked = false;
@@ -1883,7 +1883,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11AuthAlgrthm == dot11_auth_algrthm_8021x)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
 		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..607af599c21c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4010,7 +4010,7 @@ void start_clnt_join(struct adapter *padapter)
 	if (caps&WLAN_CAPABILITY_ESS) {
 		set_msr(padapter, WIFI_FW_STATION_STATE);
 
-		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		val8 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf1014ed..a7b0231c14c5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -315,7 +315,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
+	if (padapter->securitypriv.dot11AuthAlgrthm == dot11_auth_algrthm_8021x &&
 	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0de7f..65f0d567b4d5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -532,7 +532,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		case dot11AuthAlgrthm_Auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
-		case dot11AuthAlgrthm_8021X:
+		case dot11_auth_algrthm_8021x:
 			if (bmcast)
 				pattrib->key_idx = (u8)psecuritypriv->dot118021XGrpKeyid;
 			else
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 634af4657eee..18ae87bd98e6 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -548,7 +548,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
-			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
+			if (sec->dot11AuthAlgrthm != dot11_auth_algrthm_8021x)
 				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
 		} else /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 8cc96164e1cf..5e4468f23a64 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -46,7 +46,7 @@
 enum {
  dot11AuthAlgrthm_Open = 0,
  dot11AuthAlgrthm_Shared,
- dot11AuthAlgrthm_8021X,
+ dot11_auth_algrthm_8021x,
  dot11AuthAlgrthm_Auto,
  dot11AuthAlgrthm_WAPI,
  dot11AuthAlgrthm_MaxNum
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..146d0fdf94b0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -176,7 +176,7 @@ do {\
 	case dot11AuthAlgrthm_Auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
-	case dot11AuthAlgrthm_8021X:\
+	case dot11_auth_algrthm_8021x:\
 		if (bmcst)\
 			encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
 		else\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1484336d7551..00d63eed7b46 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -616,7 +616,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
+	if (psecuritypriv->dot11AuthAlgrthm == dot11_auth_algrthm_8021x && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
 				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
@@ -764,7 +764,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		goto exit;
 	}
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
+	if (padapter->securitypriv.dot11AuthAlgrthm == dot11_auth_algrthm_8021x) { /*  802_1x */
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
@@ -1334,7 +1334,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
@@ -1404,9 +1404,9 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 	}
 
 	return 0;
@@ -1447,7 +1447,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1456,7 +1456,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
-- 
2.54.0

