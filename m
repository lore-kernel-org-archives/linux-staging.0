Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD140FDAA
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680441; cv=none; b=rgsBAlK+P/IamF/rnJMnXQXJNaI1WLdAz4lMBVCxBwNKNCkW9mi5OLsW6XRQC2M/kZNXuwq0yQgdgu6AUxnpqXtscvq7gZEhT96V7tR1aAQm25DEEXLRcQpmtP78ArxYDnz2/veiW4JM/Bhb8zmFUUyzZrn+5K05CW07uVGxeFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680441; c=relaxed/simple;
	bh=IQVb3tU8K3v+6jPZug6lV7Bjw+OEsRa/DiLJzddCCq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDhL+coCxVpXMZqjQc3AcmNUUupReVsM8VW4Dd6t//kWWL8Vg5nyj/qtXKzrvzcS4htopUhk9R6vJR2oxHsWqco5tnhFTnluxKDNw8dimoAndNP749QsX38VuopWoCuVvkvZM4SaRmjFljOjs1DTUYmFDi6hKhSnUSHvGy4B0x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx2jOaCl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx2jOaCl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b966dd74so2824135e9.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680437; x=1784285237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzP/ZuanozlilKPvt7tvamVbmrh5QHp9YNAPn0uiB08=;
        b=Wx2jOaCl4VeZElFJKXYjPcaUOZOAE6aGtiw8jUp0R6wqpCpNiy5anzFTPAk1xjFZiJ
         CD/qEnLbHSb2vR2CheUWVr3OLKLshXeyeBPZh42c2nSsp7JJ4ORCydSB/2C4/1xo58Ms
         A5m0M/jL4uqiznj/njBgcZHBJ3S1P4zbnhwjqiYY6lggerDoA4HP9gBXMu3RkBpY3HH5
         cOrBgjo/0cfKO77QxFlO/WCq+vt3oaQQiBQeuTLcdaItDpqQzjcCfg3R8Tauf++Omp5X
         KdJNJl3zOIN7pBzi3E1cZSh9oDFqxN5IqV+q75RYBBXBn8QKFPwz+eYUVccRu6seyKmE
         Hgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680437; x=1784285237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzP/ZuanozlilKPvt7tvamVbmrh5QHp9YNAPn0uiB08=;
        b=JAqdg3FiOIVJKWFzFKHRHEKfOjZcZnPTSTTk2iMgpXZrjp6ZpIum+oUcLhSmiHUNvF
         NXGTdlU2FtUZMgLtOpHJ8Yw6FNPBt/VVDLlRAG1djlaki75QxVGpa4R7YHcpHSwOsd0D
         fplGIY5Zd3VjlDwgGoTIV9frSu2rHC1MkmB0rZoHiydKN2KZmEQ5oKa3nhuG3xi0pXRn
         JsjxegTk7Rgb4PixwGgKRiISx0CAbR6c5ZuCSiS/ELJlZdeG2tnt4teDAhHVf8WgqhNm
         qPop3CmncaJ9XGLxeEzIUHbjLKKr8c+T74w9Zp1v+oaZb+EYRTJmbYVs4Dr4c/yeQfo3
         SVXg==
X-Forwarded-Encrypted: i=1; AHgh+RqdL+VKnI/1OMFn0C2U3yS3lUU+oo9ykwT97Vydx+HG3dbWDU+lA+CL4zYbPnu1/QR6+j1I7LruZ8IK8Zwh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7FlGCGjolxACFu7mPu5kvxc/9kEqpGMreB3fY1Wb1N+km3RxB
	i+dMmJrF4AvH56jv/keIH9drxk5qDevL3HMtS5rRFaZfexUFiR/gN7F7
X-Gm-Gg: AfdE7clpxwYHmnh0S1sjFfOlL9ENdrmKfGRQlAUWOZH8f+AA1NTAarqdc6LF8UIiVG8
	2/Zk6CFWL5DMa2W/vk5FcCwiH/bZtoxqgSLyk+5hjtiGB0yNCMHkeLO8dWEkk7JsZYnfghgM69B
	6Jfj+cZcY3LZvWMjseoREGm2FIhtf8cCLU+fYIxm2vvLa0LvBUy7CoonU+yFLWsZ+G1Mgby8gXz
	FuCk+aP+h8pxaV51SFyF2iR74Sxiq1CgC03taIr3FnfbyYmVm/Hb+4WaAvJY185+U/qJ+b8BSyf
	BbZeKgoGSqA4PVKrIRsxYiLnEUvMSs4Y4+h/D0CRhvIjNn/oEcKfJ097czQ9Wwk7vXJY0Z6WO01
	Dk6mQ0Wm09jcd/uc13n8QB4H4mi+6ZvCHzf00U8ll5RsF+/4uylxVj+Hf6pNdC6Fn2Ipm798ICR
	qPuEu+XbTJzFDxCQt6ea4seNBUUdEbZcW+C+tlAlRA3lv9UhIwE4H8svKzbEtGwOweObcIwi9wo
	AOaYw==
X-Received: by 2002:a05:600c:204f:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-493e97441e2mr57134185e9.16.1783680437158;
        Fri, 10 Jul 2026 03:47:17 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm66551861f8f.17.2026.07.10.03.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:47:16 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 1/5] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_8021X
Date: Fri, 10 Jul 2026 10:45:25 +0000
Message-ID: <20260710104529.5366-2-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710104529.5366-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260710104529.5366-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Rename enum value dot11AuthAlgrthm_8021X to dot11_auth_algrthm_8021x
to fix the checkpatch.pl CamelCase finding.

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
index 1d429f16e01e..943bfde5da65 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -447,7 +447,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x)
 		psta->ieee8021x_blocked = true;
 	else
 		psta->ieee8021x_blocked = false;
@@ -674,7 +674,7 @@ void start_bss_network(struct adapter *padapter)
 
 	/* Set Security */
 	val8 = (psecuritypriv->dot11_auth_algrthm ==
-		dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 	/* Beacon Control related register */
@@ -872,7 +872,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 				      &group_cipher,
 				      &pairwise_cipher,
 				      NULL) == _SUCCESS) {
-			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 			psecuritypriv->wpa_psk |= BIT(1);
@@ -898,7 +898,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 					     &group_cipher,
 					     &pairwise_cipher,
 					     NULL) == _SUCCESS) {
-				psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+				psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 958bb0d2aaa1..13376e406f9f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -398,7 +398,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 	psecuritypriv->ndisauthtype = authmode;
 
 	if (psecuritypriv->ndisauthtype > 3)
-		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 	res = rtw_set_auth(padapter, psecuritypriv);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 849280edaacc..930ca09b7ac2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -972,7 +972,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
@@ -1085,7 +1085,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -1334,7 +1334,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x)
 		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
 
 	psta->ieee8021x_blocked = false;
@@ -1887,7 +1887,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
 		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 128213c97a61..3ed30b19d94e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4012,7 +4012,7 @@ void start_clnt_join(struct adapter *padapter)
 	if (caps&WLAN_CAPABILITY_ESS) {
 		set_msr(padapter, WIFI_FW_STATION_STATE);
 
-		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		val8 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index ea005d2fae29..803eef9438a6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -315,7 +315,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if (padapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X &&
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x &&
 	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 33004fd9cff2..7287f4342718 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -529,7 +529,7 @@ static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		case dot11AuthAlgrthm_Auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
-		case dot11AuthAlgrthm_8021X:
+		case dot11_auth_algrthm_8021x:
 			if (bmcast)
 				pattrib->key_idx = (u8)psecuritypriv->dot118021XGrpKeyid;
 			else
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index a3e8f695de6b..80a775437751 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -548,7 +548,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
-			if (sec->dot11_auth_algrthm != dot11AuthAlgrthm_8021X)
+			if (sec->dot11_auth_algrthm != dot11_auth_algrthm_8021x)
 				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
 		} else /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index d1db75d50327..180891e49971 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -46,7 +46,7 @@
 enum {
 	dot11AuthAlgrthm_Open = 0,
 	dot11AuthAlgrthm_Shared,
-	dot11AuthAlgrthm_8021X,
+	dot11_auth_algrthm_8021x,
 	dot11AuthAlgrthm_Auto,
 	dot11AuthAlgrthm_WAPI,
 	dot11AuthAlgrthm_MaxNum
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 7b92f7e4ce71..58f058ce339f 100644
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
index 47506fb93a85..18e95c4feb39 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -609,7 +609,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x && psta) {/* psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
 				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
@@ -757,7 +757,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		goto exit;
 	}
 
-	if (padapter->securitypriv.dot11_auth_algrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) { /*  802_1x */
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
@@ -1318,7 +1318,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
-			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
@@ -1388,9 +1388,9 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
-		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
-		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 	}
 
 	return 0;
@@ -1431,7 +1431,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1440,7 +1440,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11_auth_algrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
-- 
2.54.0

