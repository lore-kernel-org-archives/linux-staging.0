Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28334DCE6
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548520; cv=none; b=X77t3fw2S9ERD7+6lZBCnTcy+Q85OZGseajU7DrW5SiMq8VTMSshEwWvGkwPQCk6PdTTXhPebhsbJJXOB/zg95s7phAS5L3TG8/17TBIsi6LofbnbMOZpyq/JUDG5l2x8igADMM9ICTlXj2DjAmFUHewP3H/wqoyIf50El8bOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548520; c=relaxed/simple;
	bh=C/2+2ybgOlibn+xiNs2QmTAPV7SWylZTrmCgmHR+7TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNqw7oCW2Ilnm9Yhg4Ffap0bzRnf1mpcEMWAXid2aExk01NEdTEfAwxQMKSbr291GIPnpt/ssz2MndSmImt6Q6b0bf62rS2wKZbWfyp2AoiSceBWBAo2YUPYcwg07OWo3YEuBls5IS7/gZhCJm0GrSoiGspmvLVwdfHr+jJC3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TdAhPKo+; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TdAhPKo+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7RAjfCt7zvQkA6epcZTLns3fehJnTH4OXrp3n2/+Ws=;
	b=TdAhPKo+RwBJRu/eQzzkv7uNErmylOwykCGR/7A2Te4dX4/4hL33x60Z0dku0XH9jcMTFQ
	jWNjoPdVs7ocIMwwpZcMPUtKZoj4x+ee3eDZOkw9wICsX0wYZLx9r9v4HFx6YnA5H5h8Mb
	qEh0UVgeanIXtV30JAUcFFLO8nhCWts=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 22/22] staging: rtl8723bs: core: fix various line length overflows
Date: Sun,  8 Feb 2026 12:01:11 +0100
Message-ID: <20260208110111.46642-23-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Fix lines exceeding 100 characters in rtw_ieee80211.c and rtw_security.c
to comply with kernel coding style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 36 ++++++++++++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c | 11 ++++--
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index febc14de6bc0..084589b46ff9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -333,11 +333,17 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&(pdev_network->configuration.ds_config), &sz);
 
 	/* IBSS Parameter Set */
+	{
+		u8 *atim = (u8 *)&pdev_network->configuration.atim_window;
 
-	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->configuration.atim_window), &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, atim, &sz);
+	}
+
+	if (rateLen > 8) {
+		u8 *ext_rates = pdev_network->supported_rates + 8;
 
-	if (rateLen > 8)
-		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev_network->supported_rates + 8), &sz);
+		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, rateLen - 8, ext_rates, &sz);
+	}
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
@@ -437,7 +443,8 @@ int rtw_get_wpa2_cipher_suite(u8 *s)
 	return 0;
 }
 
-int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher,
+		     int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -500,7 +507,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 	return ret;
 }
 
-int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x)
+int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher,
+		      int *pairwise_cipher, int *is_8021x)
 {
 	int i, ret = _SUCCESS;
 	int left, count;
@@ -738,7 +746,8 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+			     u8 *buf_content, uint *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -1019,7 +1028,11 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
+			int ret2 = rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2,
+						     &group_cipher,
+						     &pairwise_cipher,
+						     &is8021x);
+			if (ret2 == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
@@ -1065,7 +1078,11 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 
 	/* get bwmode and ch_offset */
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	{
+		u8 *ies_start = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ies_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		p = rtw_get_ie(ies_start, WLAN_EID_HT_CAPABILITY, &len, ies_len);
 	if (p && len > 0) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
@@ -1073,7 +1090,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 		pnetwork->bcn_info.ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
+	p = rtw_get_ie(ies_start, WLAN_EID_HT_OPERATION, &len, ies_len);
+	}
 	if (p && len > 0) {
 		pht_info = (struct HT_info_element *)(p + 2);
 		pnetwork->bcn_info.ht_info_infos_0 = pht_info->infos[0];
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index c868dfcf2ed5..e3aae0f5ee7f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -61,9 +61,12 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		keylength = psecuritypriv->dot11DefKeylen[psecuritypriv->dot11PrivacyKeyIndex];
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
+			u8 keyidx = psecuritypriv->dot11PrivacyKeyIndex;
+			u8 *defkey = psecuritypriv->dot11DefKey[keyidx].skey;
+
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
+			memcpy(&wepkey[3], defkey, keylength);
 			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
@@ -1041,7 +1044,8 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-	} else if ((frtype == WIFI_DATA) && /* only for data packet . add for CONFIG_IEEE80211W, none 11w also can use */
+	/* only for data packet . add for CONFIG_IEEE80211W, none 11w also can use */
+	} else if ((frtype == WIFI_DATA) &&
 		   ((frsubtype == 0x08) ||
 		   (frsubtype == 0x09) ||
 		   (frsubtype == 0x0a) ||
@@ -1464,8 +1468,9 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 {
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
+	u32 alg = securitypriv->dot11PrivacyAlgrthm;
 
-	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) || (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
+	if ((alg == _WEP40_) || (alg == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
-- 
2.52.0

