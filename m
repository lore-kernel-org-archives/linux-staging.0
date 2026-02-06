Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C426346797
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364524; cv=none; b=UEAXHXTfHItezvZSORliDayJg9n5k0/VJQhNXiFuENoBh5V/KAk4n0QBOkHTPvERNwz98u80iNMURmtdQ0xlUgF41OwHJNmKQn3nFk+OKm0fBOS2tszvfOSq7pkc+PjfP94wK2oXcgMNJeBIqYi2zzMusvYT2OpNuNEhqXGAjGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364524; c=relaxed/simple;
	bh=bEegYQOu4A7EcKMtJgomMcTEiuyvW0At8tUp6CikilY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CR0RoHI9BpbjPavPj4bwzgPCpV4xyNbSB5P16rLWQNVFNxaESw28N6W1BWrDWRI+/XsrbdaP5SFGX0ZSnn2KmjOZY05fZ0JkmGQ38f4iOxZrWQsVeqJGxMu5Lp9CHSt8wPIJRGBSeZmhCqcdssp6IGjUGti0amyQ0Lzc+Jk/tr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYUFFGAZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYUFFGAZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1114157f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364518; x=1770969318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ILS4KTwtC34WRtTTMDI56fcXf+P837XzR+TxGW/TgY=;
        b=NYUFFGAZHGMX/XnpTfrjinkkSM5c3RwJwHlO0UAiUexZZpP8lHHIc1oJBIycbDvXfF
         9BPzRGBM+5YVjIpi8O2onNsY6cNEVVUwOmNbLSO/PbIg4dsd7KtWbP+D1XSxh2TBHObF
         qNdqXhei2A6A5Ik3whHx9r7sLHHJtUAkT9QuEQSEHBsANNy5O2UAfj4oB2w2TxJEkrSA
         V5+kxpZ56VY452EYMmp4FI9RJhmPBC1f7dbGKNasK/VEdEg8x5wzmSKOTbYkfTfmVd5X
         2T6OrF9uoFvRZSyxeb0c/nZq8WXXowYJog3uE8cLVKCLYfLnJYoKNQ3GvfVD7EGNCirL
         opiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364518; x=1770969318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ILS4KTwtC34WRtTTMDI56fcXf+P837XzR+TxGW/TgY=;
        b=tXfHgwkoaTbBwVjKHrMcVQOz8dZFt5q0RAAoSib2URDBhKAQnRuzF1yub2AchpiDxB
         UL+Og6ipEzD3zikbnINIOYRQqrJoOMZEsYkzEzntL28TfDaqfvXK0jRf4qrNB7a+cgji
         5+Ana+fRVYMaVwIeg3Xns8L9su+H+WCb970XPbcq3o4L4TA3G7CjsdksHQl9Spj7o1VB
         Y7QB+cG/7supihNs1RpiwyZxSawwlpU98JozNqbcGlxHcmiIVYNObyDlg9G4Kk2IighQ
         dRqBq+bVibcLSjvggip0yWhNnU/+t4VrbCu9c5726pgfb6avN/1MtZ6kOGCCAHpYf9bB
         fAow==
X-Forwarded-Encrypted: i=1; AJvYcCW84s7/wFlpkIIUEAIXhGJPdw4LsA+3b4JM47MBIVUsEOIRmh5FYWRl12tY+FP9k8nhUWOYe4xAr1X+sSh3@lists.linux.dev
X-Gm-Message-State: AOJu0YzuElcTa4m7irFyDi9PTEuPmggZWi1WgVsZmh/MuBEbcoIfg95j
	b7DMzftWIGmjTizLokqmnz04vlIlzciiWkOpZTqHo7iFwFYgrKAPF63QZAqRr4w=
X-Gm-Gg: AZuq6aIfzr6kHf4YcHykMizNCKrlstzjSYHJyigM3PYK16WNgrTt/ihaCcnS0dnIkrD
	nHPrUq/zbmPMmSCvgXzytRuNXgPStDUmYDYV9VoHbBYoytXYuq2+OzO/1xvrS5vKqAmhig7CvEG
	Fl8NpDwTnq3W2tyCyjD+ZWbO6uu1gFrqoFq2ilGpoqw/yKKhrOFwuTCYkDulgnjzELbFb3RCqc0
	9jT89mZ2CZ8suW/7AoSnfFmnPR/syMeNBN0T2NhZBWtVUPZ0hbjEmq6qvkZtZa8w+pzSkbHnbEv
	0BQ5H+yYoKzhE1gA9qZOgUiztf002XkO0Lb5bjjbUnUquG5V+/ntEj127z8XOKoA0OWz0++ZalZ
	4lwiIJ2Ag2LrymCe+Mr+bGciAF1BiIs++Lt4bpmEbPjZ564ycyzFS6Acpv1zDSqDSOWfRgzJz8D
	ylMsrMsY+1YmHQ8w8QT4hvIGLVNzyCDDwiLvZW2oG56p5N1/u6DT+4AlK6+tvIgrg=
X-Received: by 2002:a05:6000:22c8:b0:435:b068:d3d2 with SMTP id ffacd0b85a97d-436293b245amr2509395f8f.57.1770364518234;
        Thu, 05 Feb 2026 23:55:18 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:17 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 15/26] staging: rtl8723bs: os_dep: fix line lengths in ioctl_cfg80211.c
Date: Fri,  6 Feb 2026 08:54:28 +0100
Message-ID: <20260206075439.103287-16-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 134 ++++++++++++------
 1 file changed, 94 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index aacc97bbf171..5044df543bd5 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -125,8 +125,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 	if (!spt_band)
 		goto exit;
 
-	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
-	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
+	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) +
+			      sizeof(struct ieee80211_supported_band));
+	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) +
+			     sizeof(struct ieee80211_channel) * n_channels);
 	spt_band->band = band;
 	spt_band->n_channels = n_channels;
 	spt_band->n_bitrates = n_bitrates;
@@ -205,7 +207,8 @@ int rtw_ieee80211_channel_to_frequency(int chan)
 }
 
 #define MAX_BSSINFO_LEN 1000
-struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork)
+struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter,
+					     struct wlan_network *pnetwork)
 {
 	struct ieee80211_channel *notify_channel;
 	struct cfg80211_bss *bss = NULL;
@@ -246,7 +249,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		u32 wpsielen = 0;
 		u8 *wpsie = NULL;
 
-		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
+		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		wpsie = rtw_get_wps_ie(ies, ie_len, NULL, &wpsielen);
 
 		if (wpsie && wpsielen > 0)
 			psr = rtw_get_wps_attr_content(wpsie, wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
@@ -275,9 +281,13 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	/* We've set wiphy's signal_type as CFG80211_SIGNAL_TYPE_MBM: signal strength in mBm (100*dBm) */
 	if (check_fwstate(pmlmepriv, _FW_LINKED) == true &&
 	    is_same_network(&pmlmepriv->cur_network.network, &pnetwork->network, 0)) {
-		notify_signal = 100 * translate_percentage_to_dbm(padapter->recvpriv.signal_strength);/* dbm */
+		u8 sig = padapter->recvpriv.signal_strength;
+
+		notify_signal = 100 * translate_percentage_to_dbm(sig);
 	} else {
-		notify_signal = 100 * translate_percentage_to_dbm(pnetwork->network.phy_info.signal_strength);/* dbm */
+		u8 sig = pnetwork->network.phy_info.signal_strength;
+
+		notify_signal = 100 * translate_percentage_to_dbm(sig);
 	}
 
 	buf = kzalloc(MAX_BSSINFO_LEN, GFP_ATOMIC);
@@ -378,9 +388,10 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 				rtw_warn_on(1);
 				return;
 			}
-			if (!memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
-			)
+			if (!memcmp(&scanned->network.ssid, &pnetwork->ssid,
+				    sizeof(struct ndis_802_11_ssid)) &&
+			    !memcmp(scanned->network.mac_address,
+				    pnetwork->mac_address, ETH_ALEN))
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
 				rtw_warn_on(1);
@@ -491,18 +502,24 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
 	}
 }
 
-static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_param *param, u32 param_len)
+static int rtw_cfg80211_ap_set_encryption(struct net_device *dev,
+					  struct ieee_param *param,
+					  u32 param_len)
 {
 	int ret = 0;
 	u32 wep_key_idx, wep_key_len;
+	u32 key_len;
 	struct sta_info *psta = NULL, *pbcmc_sta = NULL;
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv =  &(padapter->securitypriv);
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	char *grpkey = padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey;
-	char *txkey = padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey;
-	char *rxkey = padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey;
+	char *grpkey = psecuritypriv->dot118021XGrpKey[param->u.crypt.idx].skey;
+	char *txkey = psecuritypriv->dot118021XGrptxmickey[param->u.crypt.idx].skey;
+	char *rxkey = psecuritypriv->dot118021XGrprxmickey[param->u.crypt.idx].skey;
+
+	/* Clamp key_len to max 16 */
+	key_len = min_t(u32, param->u.crypt.key_len, 16);
 
 	param->u.crypt.err = 0;
 	param->u.crypt.alg[IEEE_CRYPT_ALG_NAME_LEN - 1] = '\0';
@@ -602,12 +619,15 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+			rtw_ap_set_group_key(padapter, param->u.crypt.key,
+					     psecuritypriv->dot118021XGrpPrivacy,
+					     param->u.crypt.idx);
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
 				pbcmc_sta->ieee8021x_blocked = false;
-				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+				/* rx will use bmc_sta's dot118021XPrivacy */
+				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;
 			}
 		}
 
@@ -617,7 +637,8 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
-				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+				memcpy(psta->dot118021x_UncstKey.skey,
+				       param->u.crypt.key, key_len);
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					psta->dot118021XPrivacy = _WEP40_;
@@ -646,7 +667,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			} else { /* group key??? */
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 
 					psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 					if (param->u.crypt.key_len == 13)
@@ -654,7 +675,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 					psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
 
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 
 					/* set mic key */
 					memcpy(txkey, &(param->u.crypt.key[16]), 8);
@@ -665,7 +686,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
 					psecuritypriv->dot118021XGrpPrivacy = _AES_;
 
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 				} else {
 					psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 				}
@@ -676,12 +697,16 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+				rtw_ap_set_group_key(padapter, param->u.crypt.key,
+						     psecuritypriv->dot118021XGrpPrivacy,
+						     param->u.crypt.idx);
 
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
 					pbcmc_sta->ieee8021x_blocked = false;
-					pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+					/* rx will use bmc_sta's dot118021XPrivacy */
+					pbcmc_sta->dot118021XPrivacy =
+						psecuritypriv->dot118021XGrpPrivacy;
 				}
 			}
 		}
@@ -692,15 +717,20 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	return ret;
 }
 
-static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param *param, u32 param_len)
+static int rtw_cfg80211_set_encryption(struct net_device *dev,
+				       struct ieee_param *param, u32 param_len)
 {
 	int ret = 0;
 	u8 max_idx;
 	u32 wep_key_idx, wep_key_len;
+	u32 key_len;
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
+	/* Clamp key_len to max 16 */
+	key_len = min_t(u32, param->u.crypt.key_len, 16);
+
 	param->u.crypt.err = 0;
 	param->u.crypt.alg[IEEE_CRYPT_ALG_NAME_LEN - 1] = '\0';
 
@@ -780,7 +810,8 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(psta->dot118021x_UncstKey.skey,
+					       param->u.crypt.key, key_len);
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
@@ -793,17 +824,27 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 					rtw_setstakey_cmd(padapter, psta, true, true);
 				} else { /* group key */
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0 || strcmp(param->u.crypt.alg, "CCMP") == 0) {
-						memcpy(padapter->securitypriv.dot118021XGrpKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						memcpy(padapter->securitypriv.dot118021XGrptxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[16]), 8);
-						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[24]), 8);
+						u8 grp_idx = param->u.crypt.idx;
+						struct security_priv *sec = psecuritypriv;
+
+						memcpy(sec->dot118021XGrpKey[grp_idx].skey,
+						       param->u.crypt.key, key_len);
+						memcpy(sec->dot118021XGrptxmickey[grp_idx].skey,
+						       &param->u.crypt.key[16], 8);
+						memcpy(sec->dot118021XGrprxmickey[grp_idx].skey,
+						       &param->u.crypt.key[24], 8);
 						padapter->securitypriv.binstallGrpkey = true;
 
-						padapter->securitypriv.dot118021XGrpKeyid = param->u.crypt.idx;
-						rtw_set_key(padapter, &padapter->securitypriv, param->u.crypt.idx, 1, true);
+						padapter->securitypriv.dot118021XGrpKeyid = grp_idx;
+						rtw_set_key(padapter, &padapter->securitypriv,
+							    grp_idx, 1, true);
 					} else if (strcmp(param->u.crypt.alg, "BIP") == 0) {
 						/* save the IGTK key, length 16 bytes */
-						memcpy(padapter->securitypriv.dot11wBIPKey[param->u.crypt.idx].skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-						padapter->securitypriv.dot11wBIPKeyid = param->u.crypt.idx;
+						u8 idx = param->u.crypt.idx;
+
+						memcpy(psecuritypriv->dot11wBIPKey[idx].skey,
+						       param->u.crypt.key, key_len);
+						padapter->securitypriv.dot11wBIPKeyid = idx;
 						padapter->securitypriv.binstallBIPkey = true;
 					}
 				}
@@ -940,8 +981,10 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 {
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	u32 alg = psecuritypriv->dot11PrivacyAlgrthm;
+	bool is_wep = (alg == _WEP40_) || (alg == _WEP104_);
 
-	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11PrivacyAlgrthm == _WEP40_) || (psecuritypriv->dot11PrivacyAlgrthm == _WEP104_))) { /* set wep default key */
+	if ((key_index < WEP_KEYS) && is_wep) { /* set wep default key */
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		psecuritypriv->dot11PrivacyKeyIndex = key_index;
@@ -953,7 +996,8 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 			psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 		}
 
-		psecuritypriv->bWepDefaultKeyIdxSet = 1; /* set the flag to represent that wep default key has been set */
+		/* set the flag to represent that wep default key has been set */
+		psecuritypriv->bWepDefaultKeyIdxSet = 1;
 	}
 
 	return 0;
@@ -1137,7 +1181,8 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
 		/* report network only if the current channel set contains the channel to which this network belongs */
-		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set, pnetwork->network.configuration.ds_config) >= 0
+		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set,
+					 pnetwork->network.configuration.ds_config) >= 0
 			&& true == rtw_validate_ssid(&(pnetwork->network.ssid))) {
 			/* ev =translate_scan(padapter, a, pnetwork, ev, stop); */
 			rtw_cfg80211_inform_bss(padapter, pnetwork);
@@ -1277,7 +1322,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		for (j = request->n_channels - 1; j >= 0; j--)
 			for (i = 0; i < survey_times; i++)
 				memcpy(&ch[j * survey_times + i], &ch[j], sizeof(struct rtw_ieee80211_channel));
-		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, ch, survey_times * request->n_channels);
+		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT,
+					     ch, survey_times * request->n_channels);
 	} else {
 		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, NULL, 0);
 	}
@@ -1861,10 +1907,14 @@ static int cfg80211_rtw_set_pmksa(struct wiphy *wiphy,
 	}
 
 	if (!blInserted) {
-		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].Bssid, (u8 *)pmksa->bssid, ETH_ALEN);
-		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].PMKID, (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
+		u8 idx = psecuritypriv->PMKIDIndex;
+
+		memcpy(psecuritypriv->PMKIDList[idx].Bssid,
+		       (u8 *)pmksa->bssid, ETH_ALEN);
+		memcpy(psecuritypriv->PMKIDList[idx].PMKID,
+		       (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
 
-		psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].bUsed = true;
+		psecuritypriv->PMKIDList[idx].bUsed = true;
 		psecuritypriv->PMKIDIndex++;
 		if (psecuritypriv->PMKIDIndex == 16)
 			psecuritypriv->PMKIDIndex = 0;
@@ -1933,7 +1983,9 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 	}
 }
 
-void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter, unsigned char *da, unsigned short reason)
+void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter,
+					unsigned char *da,
+					unsigned short reason)
 {
 	struct net_device *ndev = padapter->pnetdev;
 
@@ -2112,7 +2164,8 @@ static const struct net_device_ops rtw_cfg80211_monitor_if_ops = {
 	.ndo_start_xmit = rtw_cfg80211_monitor_if_xmit_entry,
 };
 
-static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, struct net_device **ndev)
+static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name,
+				       struct net_device **ndev)
 {
 	int ret = 0;
 	struct net_device *mon_ndev = NULL;
@@ -2245,7 +2298,8 @@ static int cfg80211_rtw_del_virtual_intf(struct wiphy *wiphy,
 	return ret;
 }
 
-static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_len, const u8 *tail, size_t tail_len)
+static int rtw_add_beacon(struct adapter *adapter, const u8 *head,
+			  size_t head_len, const u8 *tail, size_t tail_len)
 {
 	int ret = 0;
 	u8 *pbuf = NULL;
-- 
2.52.0

