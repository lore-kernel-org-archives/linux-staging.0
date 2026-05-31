Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01091E520A
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780221867; cv=none; b=rbQ5Bq8lNnkw1ZKxy3Y2jfKlPVjGklO6tsu91V4OaMC9paOShPOtvDni8SHmF7ewoQgJr/HZScIz2ktrdHr//zI797PYhib2cAMGMXpAhCB4oNqAvxCfYtPObck7p3y5Dn2lIgf2KxRevDbO65Ly3FCY1tk5i2yFmqRFHQcGMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780221867; c=relaxed/simple;
	bh=UydcxuhqpVIuc8roeQi9f4M4Ic7JU0CIyc/DAcSoY+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=old1YaI9pus19SgUiWwnrrRx+uz3laT9Yw0F8T9M9obVDH6h9nkmRbXkALzA7kAyvK15Jt6VJ01+v33kJTd7KFCbtwlICD+wl13qrPtreknYlfAnRNpbRqCl69oIHrFUpCvkxsUQfjCd3XN0gZvEsXpByNhkNYlxvW+MXopTybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDlMqesf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDlMqesf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso82206685e9.2
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780221863; x=1780826663; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBUBNEgRmt/dQgTKa0WbswbbUxf0LVatIhCfU6UZ2sY=;
        b=iDlMqesfCsSwZGoPpXqmKLy8sDhqerkPWgbn+9BxNditw9sBZdpquR6dH1HC5PO83S
         1OHOtUcj6s7RQ+hjfksmxlmFAf1CoN2ck60MBIGNZ3GtonWAmjMGov+l1o+8tPWlbrsN
         dAhkBwNNa1NWoWsWNLhBwXI33mtZUHWY0PaKzMNYkpKZD9dSg9wO0GMhbJWcQR2I7fLr
         tPwUVN10QSAFzi4U5GBXFVYyKqzA7sCrytLOu1TVk1Qi50hCPxvAb8XpMquiS1CK/sGZ
         wQv3nn6UbRNBITV71yA5rsHmMQvUlp0NnPlCt89p1QKMUbIvanFMLEZg3p5dzijdjnyX
         m9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780221863; x=1780826663;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBUBNEgRmt/dQgTKa0WbswbbUxf0LVatIhCfU6UZ2sY=;
        b=tKV/rWuN1rzIKdGoLtBnB25B3Pv2uoRnAf5US6xmZo4Xj4KuglE5yIHnBjGgAl237P
         j6biSmZ9fzYybpycaUdHDfNZUEdO0wDhcbfkmX9d+rBUy+EOWuskJUQlbT+8KVXHD3x1
         8XV5PacEr7ya8IJuBdlWxgXnjbBmTl3raXEmWnZNPDtHoSinCIOI17OzKz7+BCNETyUX
         wyoTb9pGXqfDGho6AMNqncmxd3amWpFBvw5jSvqgQxcNdiFCUTOteVCyQMa8UOebs0Sf
         +1t9yt0jEtdS2Tm3CEh33o1ZPdHcBrRrwwwP9YlA0VLOdyGuWwpggrTzYDWSeUV3EJWU
         e9YQ==
X-Gm-Message-State: AOJu0Yz4xL+nuZzsXVvWGj6/mBqpEr7fPnn2jBylA/l7MLQEa/dPg9wm
	At1kuvT6vzQVpvbllPlEsZ6i5RqwH7qK2YaW47ycawSjNucZ00u4dI6Q
X-Gm-Gg: Acq92OHl3qHXTF8vLeep1jwCqmDXJPQIodmROuYWr5EZXxHkQvGKCCikRyyosarHILt
	0FKChVuBud+HjT3V/VYgq/kgDN96C9knVQQdxNb/YVEvN7L1uSeUpsXV4xq7QKS6vUULCYXDrKu
	jwkIY3YpCXzltTYiSxqhI6uQO/BHTZGa9Rvx0o7EJQSSpkynsiUm7DcRvxMiW4xBLBzvRLbVCcN
	7v2o47RDUVzQzuvpZHxfzDQ03lbpMtRRI4eJLNAGLqyeUaQmkXo2kEEjJKSEUzs8PPUs8sDtefS
	gyVR2FBqXQWxvRfWqHxZgOYiueq6csUcWeC1FNPKbxYv7tyiSn37SKDpd04W1lL+zyGE+0AcOER
	BdcRAhk0iEf96p8BCzKtpOtzLNUJa+A59VN+MI5AHYZ23qxNCZbAMhau9nqJC4Eh87dPK5HnPBv
	xluNwzfcibpw7dMgyX2dHhen8rWD6DZhmlpwLUJDz2eywz6stVnfHC0t4X40i2giqVRcj2hjsim
	zQTgwBMlMUNfURK
X-Received: by 2002:a05:600c:450b:b0:490:3fa2:1b93 with SMTP id 5b1f17b1804b1-490a291fa5bmr130950695e9.13.1780221862758;
        Sun, 31 May 2026 03:04:22 -0700 (PDT)
Received: from localhost (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c123406sm67367605e9.5.2026.05.31.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:04:22 -0700 (PDT)
Date: Sun, 31 May 2026 10:03:24 +0000
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Rename camelcase variable
 dot11AuthAlgrthm
Message-ID: <ahwHbMecWpijQBv9@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variable dot11AuthAlgrthm to dot11_auth_algrthm in
struct security_priv to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 ++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 12 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 .../staging/rtl8723bs/include/rtw_security.h  |  4 +--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 11 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e894..dd361714f9ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -447,7 +447,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
 		psta->ieee8021x_blocked = true;
 	else
 		psta->ieee8021x_blocked = false;
@@ -673,7 +673,7 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acparm));
 
 	/* Set Security */
-	val8 = (psecuritypriv->dot11AuthAlgrthm ==
+	val8 = (psecuritypriv->dot11_auth_algrthm ==
 		dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -872,7 +872,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 				      &group_cipher,
 				      &pairwise_cipher,
 				      NULL) == _SUCCESS) {
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 			psecuritypriv->wpa_psk |= BIT(1);
@@ -898,7 +898,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 					     &group_cipher,
 					     &pairwise_cipher,
 					     NULL) == _SUCCESS) {
-				psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+				psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 12bf7780bea5..85f50ef44812 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -400,7 +400,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 	psecuritypriv->ndisauthtype = authmode;
 
 	if (psecuritypriv->ndisauthtype > 3)
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 
 	res = rtw_set_auth(padapter, psecuritypriv);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4fb74729180f..20611d10a6bf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -969,7 +969,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
@@ -1080,7 +1080,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -1114,7 +1114,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;  /* open system */
 		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
@@ -1330,7 +1330,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
 		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
 
 	psta->ieee8021x_blocked = false;
@@ -1853,7 +1853,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 		goto exit;
 	}
 
-	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
+	psetauthparm->mode = (unsigned char)psecuritypriv->dot11_auth_algrthm;
 
 	pcmd->cmdcode = _SetAuth_CMD_;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
@@ -1883,7 +1883,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
 		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..d91dc408277d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -679,7 +679,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	sa = GetAddr2Ptr(pframe);
 
-	auth_mode = psecuritypriv->dot11AuthAlgrthm;
+	auth_mode = psecuritypriv->dot11_auth_algrthm;
 
 	if (GetPrivacy(pframe)) {
 		u8 *iv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf1014ed..60174361761f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -315,7 +315,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X &&
 	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..69ac683b2b9b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -494,7 +494,7 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 	pstapriv = &adapter->stapriv;
 
-	auth_alg = adapter->securitypriv.dot11AuthAlgrthm;
+	auth_alg = adapter->securitypriv.dot11_auth_algrthm;
 
 	ptr = precv_frame->u.hdr.rx_data;
 	pfhdr = &precv_frame->u.hdr;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0de7f..1d32a6d2e434 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -526,7 +526,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
-		switch (psecuritypriv->dot11AuthAlgrthm) {
+		switch (psecuritypriv->dot11_auth_algrthm) {
 		case dot11AuthAlgrthm_Open:
 		case dot11AuthAlgrthm_Shared:
 		case dot11AuthAlgrthm_Auto:
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 634af4657eee..3bfe69f4a1fe 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -548,7 +548,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
-			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
+			if (sec->dot11_auth_algrthm != dot11AuthAlgrthm_8021X)
 				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
 		} else /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..7b92f7e4ce71 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -91,7 +91,7 @@ struct rt_pmkid_list {
 
 
 struct security_priv {
-	u32   dot11AuthAlgrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
+	u32   dot11_auth_algrthm;	/*  802.11 auth, could be open, shared, 8021x and authswitch */
 	u32   dot11PrivacyAlgrthm;	/*  This specify the privacy for shared auth. algorithm. */
 
 	/* WEP */
@@ -170,7 +170,7 @@ struct security_priv {
 
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
-	switch (psecuritypriv->dot11AuthAlgrthm) {\
+	switch (psecuritypriv->dot11_auth_algrthm) {\
 	case dot11AuthAlgrthm_Open:\
 	case dot11AuthAlgrthm_Shared:\
 	case dot11AuthAlgrthm_Auto:\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1484336d7551..8d6c59b52f6c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -546,7 +546,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
@@ -616,7 +616,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
+	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
 				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
@@ -764,7 +764,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		goto exit;
 	}
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
@@ -1326,26 +1326,26 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 	switch (sme_auth_type) {
 	case NL80211_AUTHTYPE_AUTOMATIC:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Auto;
 
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
+		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Shared;
 
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		break;
 	default:
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;
 		/* return -ENOTSUPP; */
 	}
 
@@ -1404,9 +1404,9 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 	}
 
 	return 0;
@@ -1447,7 +1447,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1456,7 +1456,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
@@ -1579,7 +1579,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1675,7 +1675,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
@@ -1698,8 +1698,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	}
 
 	/* For WEP Shared auth */
-	if ((psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Shared ||
-	     psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Auto) && sme->key) {
+	if ((psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_Shared ||
+	     psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_Auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..b63db61649af 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -534,7 +534,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
-- 
2.54.0

