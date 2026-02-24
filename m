Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136C43A0B11
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939702; cv=none; b=nR4ElyqdP0M/XQ/3boasl+Yb6lk0Ddvp1Hxl1gP2UziGB9DWLPNuW9PJmTD0SmHdhN12LjKLKEqf1UScoz1JW+3oIFTc275sw4H4/1o8tXvG7n5b2+vnrMZlfgzEfN/JMIi/a7WOZ1CtAxiN+ZpyniwKVDS96GlAm8oYtd1d3e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939702; c=relaxed/simple;
	bh=ghLJw3SQjMPWGtzc38Q6ejQ0lD1l+DPknX2BGJLdAuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHPTPokhfiZhogLu1ZDHDlHgK21T8AsG4q2Dkmmh2SHYg0YKttBVVbKGCNIK1RydeB95Cgv6jtVl0h3AB00xeofkL3r0xaJqOOAMaVEA8RP5z26BUHKfnQAIXGFZaREziwq3rET8/19hHSNBeSSigTVu49CJZWWLIojheIhsFG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sR0TT4Sf; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sR0TT4Sf"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGXF/dmSLENGwwjxnqYZzTSMCNztHS7dnYPzKa6gebQ=;
	b=sR0TT4SfRjAeChBeKyrPAeTnnziDNPFscy3t9wW3Wx1L3KJiv0nFoHVSvJ57nApC0j3TQx
	M1DoW3E7LxAnYZL1ac5I15R3zI7oR3sYNCWwL+97LemxhXoCm7xE9oNNUp/EhEWEd/O/ml
	XTdlrK66dg3UB3w6fhb1KiNDuIwrGY8=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 10/21] staging: rtl8723bs: os_dep: fix line lengths in ioctl_cfg80211.c
Date: Tue, 24 Feb 2026 14:27:37 +0100
Message-ID: <20260224132748.12336-11-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 134 ++++++++++++------
 1 file changed, 94 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 51725c302458..c04af493f24d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -127,8 +127,10 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
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
@@ -207,7 +209,8 @@ int rtw_ieee80211_channel_to_frequency(int chan)
 }
 
 #define MAX_BSSINFO_LEN 1000
-struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork)
+struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter,
+					     struct wlan_network *pnetwork)
 {
 	struct ieee80211_channel *notify_channel;
 	struct cfg80211_bss *bss = NULL;
@@ -248,7 +251,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		u32 wpsielen = 0;
 		u8 *wpsie = NULL;
 
-		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
+		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		wpsie = rtw_get_wps_ie(ies, ie_len, NULL, &wpsielen);
 
 		if (wpsie && wpsielen > 0)
 			psr = rtw_get_wps_attr_content(wpsie, wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
@@ -277,9 +283,13 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
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
@@ -380,9 +390,10 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
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
@@ -493,18 +504,24 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
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
@@ -604,12 +621,15 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
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
 
@@ -619,7 +639,8 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
-				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+				memcpy(psta->dot118021x_UncstKey.skey,
+				       param->u.crypt.key, key_len);
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					psta->dot118021XPrivacy = _WEP40_;
@@ -648,7 +669,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			} else { /* group key??? */
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 
 					psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 					if (param->u.crypt.key_len == 13)
@@ -656,7 +677,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 					psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
 
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 
 					/* set mic key */
 					memcpy(txkey, &(param->u.crypt.key[16]), 8);
@@ -667,7 +688,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
 					psecuritypriv->dot118021XGrpPrivacy = _AES_;
 
-					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(grpkey, param->u.crypt.key, key_len);
 				} else {
 					psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 				}
@@ -678,12 +699,16 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
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
@@ -694,15 +719,20 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
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
 
@@ -782,7 +812,8 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(psta->dot118021x_UncstKey.skey,
+					       param->u.crypt.key, key_len);
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
@@ -795,17 +826,27 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
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
@@ -1276,7 +1321,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		for (j = request->n_channels - 1; j >= 0; j--)
 			for (i = 0; i < survey_times; i++)
 				memcpy(&ch[j * survey_times + i], &ch[j], sizeof(struct rtw_ieee80211_channel));
-		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, ch, survey_times * request->n_channels);
+		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT,
+					     ch, survey_times * request->n_channels);
 	} else {
 		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, NULL, 0);
 	}
@@ -1858,10 +1904,14 @@ static int cfg80211_rtw_set_pmksa(struct wiphy *wiphy,
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
@@ -1930,7 +1980,9 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 	}
 }
 
-void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter, unsigned char *da, unsigned short reason)
+void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter,
+					unsigned char *da,
+					unsigned short reason)
 {
 	struct net_device *ndev = padapter->pnetdev;
 
@@ -2109,7 +2161,8 @@ static const struct net_device_ops rtw_cfg80211_monitor_if_ops = {
 	.ndo_start_xmit = rtw_cfg80211_monitor_if_xmit_entry,
 };
 
-static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, struct net_device **ndev)
+static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name,
+				       struct net_device **ndev)
 {
 	int ret = 0;
 	struct net_device *mon_ndev = NULL;
@@ -2242,7 +2295,8 @@ static int cfg80211_rtw_del_virtual_intf(struct wiphy *wiphy,
 	return ret;
 }
 
-static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_len, const u8 *tail, size_t tail_len)
+static int rtw_add_beacon(struct adapter *adapter, const u8 *head,
+			  size_t head_len, const u8 *tail, size_t tail_len)
 {
 	int ret = 0;
 	u8 *pbuf = NULL;
-- 
2.53.0

