Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12D434D4EC
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364535; cv=none; b=fGmVkDmAp/nITomfOYuhHoDN3w9RfcSyG+MPsPjwzOzs0yhbtJNLcu+DB7c11M/oNbT63w7xOG3w1IGoXN7OJd1PUP0nqT9ArkC0e0mERGFAjyc8H6JkmIHgvZbh4+W8sboTBuUaOxovzKI6MgtyfqbN85NqNXTE7utsuNfueSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364535; c=relaxed/simple;
	bh=1+/QSiPDLFD5kh0w7bUmGr1a70aiPgxlePucbelzdLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvlAmSHBxlT/7rY0vR1squIxpbejDzf2gYPANVazYOOdCm+rwYU11YgvoOIJfIYwEGkHMFKy9ZUGaE17H9oEwAoHRHyBR2dufVZn67cYF3l9fymbUXP7gDoaPGOswAswFh500o/chYZcBW3RUGqWVezbCph2iVvbicQ46Ek9Vv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+TXbttl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+TXbttl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4362c635319so183415f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364533; x=1770969333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKRCjnMX4iU4PsaBniZlhPqQtHYlVNjsHQLtx43ivsc=;
        b=i+TXbttl/9CUVwbWxk50RicdXCGmeLdswuWM2PKTRVx8LHa72ypGQskw0IRKe/j6Zm
         yk9rR7n3/6/XXuCnFVbFvhM161U0fjifNFEtCHYBswkQ4RCn17phdcRCNtpt2pGXvptG
         l7vAxs3hptcDI3QG+1OfKrHUCpqxo4XzPsqhfLWdtbfZdS0t+Y2dxRz1jP1x4N15zHfg
         miGUbjRInkWcB7Em8kyXfBrdHmgPYewmwdcdOagnVEe3JtatVjyOHUgMFH0OB4ORaQK0
         5eG+tr2Gdc1CgHRk3DkA+mSHY/SsXjQlcrszb0h9c7ds2it8mTP96/cfco9iNDzT5snZ
         7grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364533; x=1770969333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TKRCjnMX4iU4PsaBniZlhPqQtHYlVNjsHQLtx43ivsc=;
        b=rExHdDl4JubQ2UsSm6JHFWCMRULqypw68hwuSydrVyvx+wQFS9YKFa9Bt1hDT761VM
         vOFycph36MK8bxLuKSSIvjWnukwNXg7bT59s/se3FYt2O+1b+5NNQBbRtG2JyNAtw6oZ
         SSUMV0uDAJ7117MvoTMdk0CJMLjhp3+voh00HOtM6gclSr1QIvWwLNkoTalLB/eS3MuV
         muhS5kLM9JofM7r2h5p5IpWskjpdbt8lnKLCNE4/XVWq5bNtBIUyr2ejlRnOOmiVDAMJ
         oJOV2+/CmwFk/9mjw+d5CuK0SHNoVLCohWiUGibW2olllZOI7YOsyMC7wqYIEa6rkpNP
         wbLg==
X-Forwarded-Encrypted: i=1; AJvYcCVeyWbrRXT9eMFufl0pnblDvtyPgKeukb6Z89vnLXPt8pvv2jLkrK0bwspJgQhrJc+NN0IMKrCxEX/U8/AG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi05X/c3SqVelOcSzfvDlQY9vUPHjm6vXkOLX80jKY9Mmnr1wp
	ZOIQsVPTttASIUbTwX73Eib6+QHBHgJ+9+YiHA4rUODH2AxiGYZVxg0=
X-Gm-Gg: AZuq6aKF2q7zhXa9cdDKnlQXUsSvVdyXBiOJS/ioBlGOEebVyA/3h32l1lDPd36SuAU
	y3NeT2awKyzsHb8xZleViD3yi0LZUQEo0caTFDHMf/gtvaoMfoAk2ZehFa3TFeCpVoK9l4qC8yo
	P+tEi5Z33xOA7WJgX30tKU1wRdK9I1lrMw7l/qDNDxb3cWhWSwYMl0ZKVM4l+ekhiS5wkrTi7Qa
	vlxGKRhgKAC7ytTvWcxQHljyAqhgBIpj6nphncmHC/bmUgEB1EFxdT2zPK3I7ziRA+tDP53C5bk
	PaSR+XFRE/ExlRn9fejrZ4e1CO8yEyfgyMJRxSyNkcYfCZGM993pVWXfp+nmYdJ9gahe8MKkj8h
	kRYtER/ts7/XInTkf2je6OrreVCZ6Uybk1vyjYFVW507K2OaaBsFjWb+vvSXz+LgNxP3lJpcMXS
	S6ADAD6HotpGPyt6SXCLRlzsy9wgjum1M9w/xD6DNmTxSCZUMgzyeW0OvGNExdSBE=
X-Received: by 2002:a05:6000:4284:b0:436:19eb:286e with SMTP id ffacd0b85a97d-43629006f3bmr2655685f8f.0.1770364533125;
        Thu, 05 Feb 2026 23:55:33 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:32 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 26/26] staging: rtl8723bs: core: fix various line length overflows
Date: Fri,  6 Feb 2026 08:54:39 +0100
Message-ID: <20260206075439.103287-27-luka.gejak@linux.dev>
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

Fix lines exceeding 100 characters in rtw_ieee80211.c and rtw_security.c
to comply with kernel coding style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 36 ++++++++++++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c | 11 ++++--
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 92b12a13d27c..8584bfceab96 100644
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
index 86e54454145a..11231f0d8fd0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -60,9 +60,12 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
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
@@ -1063,7 +1066,8 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-	} else if ((frtype == WIFI_DATA) && /* only for data packet . add for CONFIG_IEEE80211W, none 11w also can use */
+	/* only for data packet . add for CONFIG_IEEE80211W, none 11w also can use */
+	} else if ((frtype == WIFI_DATA) &&
 		   ((frsubtype == 0x08) ||
 		   (frsubtype == 0x09) ||
 		   (frsubtype == 0x0a) ||
@@ -1487,8 +1491,9 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
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

