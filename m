Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F4313547
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584377; cv=none; b=KavKpjhm4yY7UTrsQU9wvrCCnvz6BS8ZEQSCbJSz0TM2cOy/2IGStgr5jtfumxP18Uv2gPE7u1IWaRVCyGSR0pWkUHE5kpE9qLoj5mK3JYKXgnnub+mW7Zzo6aq0rC0j0AtnZy0Eyrx4YrqNpk4Ac34UpSn7Rii5GTg04EcHpWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584377; c=relaxed/simple;
	bh=69HsOm7pTeQYBzYuYBEveiwA68JaQxfsvKfwqwlJnZA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=aqn8W3Kr6tSrX26UuQFzrpp7BtHTCAuBWgY6WjZex8LA0oFFGmTPHCqYI/khzlW59jZOLiS0MryL6Z2WHNOncNUu/82uY8Yt7pBRuwOdjam/gezhpz8MWadnUfnilxsVGQb9qv/GiPywjP0px03i5YQjNsXutWIAOAzBpmbfkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCMbp/DU; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCMbp/DU"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80bb41f7f3cso17564687b3.2
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 18:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786584374; x=1787189174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kQgfZ1apjatXW6Ex3pL70lqr/joxYSzmfIXJhNP0U9g=;
        b=NCMbp/DUjZiz4HDzFbHgWwxNNSpMqPjl4aoZ2F58F12BtAoAfqRqXKzf8CJhV2p0Pj
         66L4R0YTTQ6n+qmHjATm9paQ8NeyLIC3xbrZaDN+NNC7hWRne87ohVS3Yz4/ElYi1vPJ
         o/cPOEK87BSoZzysZZOFE/OUhm+bm5TT4mv/RxuNfxZbHpubQBAq8d92nza0oEl8ks9A
         xD77RYlr5s7LPyemr+8ZjfP8H4A/Zj9PbEclPVnEtRHjwp8j9sSaM/t5DfHJPrGsXKG+
         TyXFRbKva+cTQ/qS8nNzQJbgrhrek3d4rsRMds7ZvhPQpBSXRyE2A2R2heM4wx2lvN2E
         5Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786584374; x=1787189174;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQgfZ1apjatXW6Ex3pL70lqr/joxYSzmfIXJhNP0U9g=;
        b=RqzYVbSC+/vSGURu0g+dkyNJOWoUYgdHmGLe5s7PhlSAuyg7bwLYkZWrkmERfTs9ti
         jtRHz1b9pu2Ih66jDEc7s23CWmNPrPbK9/ahucHOeiO2bAH1VZlGutLBul2tNCMZE1NM
         3jCXlq5GiNYP1ZM367CLFIQw9wF7gGTHeBP4EdWgy/XTZtaFZIx+zL/vytXEBrfBkbGu
         fwv+61xCHgcDtGL4LR9qTeQY4KzoJv3nlqKiiF42Qx/e8Shwps9drJ5s6mvxarfqWKz8
         h8eqAkEs/3s8AB78nj/i52qEAOc/Es9vnsqITESGmrWv3MYWgPo9OkQEOI8AGRo/Lnmv
         7I2Q==
X-Gm-Message-State: AOJu0YzhFhamszIkn8qlu01o6JQQcXiwUXxZHmHwUlp/jr9JeOZxv0h9
	tEdBWPWK1JpsswcJn+j26DZah8dafeBy7xyVKRa4MKHKY58ogdZW6V8G
X-Gm-Gg: AR+sD125P7xD1dCx3B6zzN0+VAniAfDqDExnt7h1NtaJDoqluFKM3unwMT1eYss4fJ7
	mmrn4ZOjItNyb0IFEaQUHaGQPoP3QLLUS8TXpNasE24iUWKSonPFj4NhYyoFPlsany1tPjq7Ien
	QgfpnFwMZ201TGqr1XurZI5pcU/jOwolZNVIsCGMgPqwzTX+tDu5/U61akd3hKUFNMhrN8TQ5Sf
	d/319oUI03VbMaEXJqxcQOzA1dBUTYurNUVAItmEF0t/3bQqCH52IX7+nER2TGONtr3jJFWX1zB
	gHYCFOCJmZLoRiZXx9s/gYbkHFIdSaNroDpvyKsV2FkgkZAO0j0rfuwzF2x5Tfg4wnFWoEmIe+K
	XfD63bcjKv9iCJaNtwcF59p4PkbvwDKGmYRMe1jHo5g7cUusBrMtmi0+yIZgi3HXIpiCL/cx13X
	olOVPqMJ39vSHx71TUR6XLoBZq02pbZEUC/gyVsu+VpzIwkVCYHHeSlPKGQGeTpVujvD2fk5hgD
	ryUscRxQo7G/ia/ONWXcI99ig==
X-Received: by 2002:a53:cb0d:0:b0:667:ba5f:e32e with SMTP id 956f58d0204a3-66c5141145fmr848676d50.14.1786584373984;
        Wed, 12 Aug 2026 18:26:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:2770:b8af:4ae3:d6ba:b7ab:258b? ([2600:1700:2770:b8af:4ae3:d6ba:b7ab:258b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c57416c41sm184092d50.16.2026.08.12.18.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 18:26:13 -0700 (PDT)
Message-ID: <cf384fae-ad2b-4b50-8a4e-9b7a6041bda8@gmail.com>
Date: Wed, 12 Aug 2026 21:26:13 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Straube <straube.linux@gmail.com>,
 Hungyu Lin <dennylin0707@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Dan Carpenter <error27@gmail.com>
From: Mohit D Patel <mdp.cs3544@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename dot11AuthAlgrthm to
 dot11_auth_algrthm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Rename dot11AuthAlgrthm to dot11_auth_algrthm to match kernel
coding style. Flagged by checkpatch --strict as CamelCase.
No functional change.

Signed-off-by: Mohit D Patel <mdp.cs3544@gmail.com>
---
This is my very humble first attempt at contributing to the Linux kernel. I
look forward to getting feedback on it and for the opportunity to help out more
in the future.

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
index 1196ec011455..19fcfbdcdab9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -978,7 +978,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
@@ -1092,7 +1092,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -1126,7 +1126,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;  /* open system */
 		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
@@ -1342,7 +1342,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
 		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
 
 	psta->ieee8021x_blocked = false;
@@ -1865,7 +1865,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 		goto exit;
 	}
 
-	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
+	psetauthparm->mode = (unsigned char)psecuritypriv->dot11_auth_algrthm;
 
 	pcmd->cmdcode = _SetAuth_CMD_;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
@@ -1895,7 +1895,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
 		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a9382dc1294b..b3a11f5bb18e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -682,7 +682,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
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
index 32f6d3a5e309..a1f1e7d1ed53 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -91,7 +91,7 @@ struct rt_pmkid_list {
 
 
 struct security_priv {
-	u32   dot11AuthAlgrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
+	u32   dot11_auth_algrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
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
index 9fa3131feb66..d8270c2336a3 100644
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
@@ -1451,7 +1451,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 			goto exit;
 		}
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1464,7 +1464,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 			goto exit;
 		}
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
@@ -1587,7 +1587,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1683,7 +1683,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
@@ -1706,8 +1706,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
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
2.55.0

