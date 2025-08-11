Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19352274B34
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893361; cv=none; b=s0Y+79kGtNVijZQCuj92u6rnwoz2FOvLOA5V5IJXf2EJMPV/D3sZ9nj4wKNCY1ZZstmV5pl51E3nWe+PyL7SAVrAshhr9K3tKVPg15DMyuR+LF3qnIFGRl4lzyrSR8WOsJU2M1epbhpvXS6Dz0x3BHpbxgaNB+vqf4B69+SCFug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893361; c=relaxed/simple;
	bh=jON790ZWlgN6ZbnHI1AExklBkaMuJdp0/+MdC91//bI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dkLAV/NiFkkEV4mjVJbuF2zGj+4C0MyKPh43FOjHED6qMtMmk2hoH3AyzWgB9UzEfGHmW4oVUSVm0j+WxhsrfnedYhvOIkHszs/5RnBWGfVmj0Q8CMEds35P3ZJW4TfWxrJAxCCGxvhcBzD5onsEoMUy76a8E0BCROddtg35rEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFVTU8jh; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFVTU8jh"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7682560a2f2so3965319b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754893358; x=1755498158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bV8UeJcS+Lb84093TwDV4zLCHy2ZU5ZDahAnF6NK8YE=;
        b=FFVTU8jh1OFK0QpDkOuXhJp7w4Zju6r9BORGq2wKLhllzQ2Akc5GkuQRxdtwAWvJLn
         30e7OMPEps6mCo+IgahvIXRa3C8OFBg8bB2X+YPWUJAPi3AcMb0oyRx1pyehL4P7LsGI
         bP70qkjSSE8vggafJ2bz1g4JATXGs2qD9vcERunhtHX1ReTcfTaV54TMhdS9/vuOZuPf
         ZDuVUddm9VuXM4NwN9O8kXgZ0nKR6qFdDw5AYYejajSofnTD3vn7hsNAoh4bMOPeSqbm
         n9ZsdbcwXdbZT5vlU0s7CfbENYXuNlOAfMxufaNJh5qmLdVwhFKLxS/CYDHDfPs0vKGB
         I6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754893358; x=1755498158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV8UeJcS+Lb84093TwDV4zLCHy2ZU5ZDahAnF6NK8YE=;
        b=KMFnsyYxJWvOkiNJMJCMcS3Epj33lD2mk73SUYNpiSLFnYwnqrRQ6ZQxHe8pK+vtpn
         mPhWWHdaEF47CxmnQZ13g3MiFH4RIy94e+35x8jnTZsJN+/W7gwyvtKVL7j5in0aJ9Ib
         bbJd5sgQhGGTKCTSJF06pFGYmjsFzXwtAOzn3ktcp//W2N3xKIT9uZuUOZlyH7iR+ZD1
         iXx/l5PtyxcAjOtuZ7iEeRdUGwllR6O1wXBZRaeHnpORLoD0dG6YdTiGaco+eYWI6F5e
         yjckiDIa2b4vvuGNGn6xMn5PKi8UNkc8buIHjucGiE0Qdw/h4ByUvNzYEun4Mt/YvdbQ
         gamg==
X-Gm-Message-State: AOJu0YwCZuKFygxt/fJZCbJA0TjsDDe4xMNpxja3ir4aAFdK+UkBvflI
	hNHRCuNzUtd43u3NVzibaWGSZ1/CU3Zh3YELyLiFkmeWN/CPBBeddrsm
X-Gm-Gg: ASbGncs8n5iMcJPwlVAQjFMOk1A+QBQTEY5Sdj5ttt41WdJvAe+jKyZs4rvZ/C6TLxN
	WsAYu2TrBwErWXSQofJEbo4PY5aivoiq3DtZC9wLWQYyPHMwbKzLcw04J5wibJpAth/oP0oDq91
	GovD83EKMsG2D8psj8I2OY7wRPqncw78H7i0mDF9q5qeWkQt8DbXgmQk9JX8ynILsTn5XPw5WKx
	r7/F6yfWLKE7QA787CvmwwvJO4V3IJNWIr3da3+i7/TZqvJeyGVhkjB9tA+Oa8TFOJMi3g3reh8
	6GQZ7yIe9ajo4H7v83mJH3oEqxsvYtCPTGlaBILMnKyJAVkX+fyrRdOHu+mpBaZ9c1MZYwTZlZp
	yu+bvDDjGiNKplNhAhoIFxPvw22hpVL+X4lscYiweNUEpWrnWBL2yj0AET8VBOUbyKo5YDiqGhv
	fheAUz7Eq5FH9Nq9ovzJRgYUggDNsVx/NE5LkUnNOx
X-Google-Smtp-Source: AGHT+IFoWNQtK9CeFUWctqSs1ekUWpcKamPLewF4nOaDOyYbmSoDFs4wahOaDSi+3p9759+s2HcHhw==
X-Received: by 2002:a05:6a00:8503:b0:76c:5781:2c01 with SMTP id d2e1a72fcca58-76c57812d1fmr8535082b3a.0.1754893358306;
        Sun, 10 Aug 2025 23:22:38 -0700 (PDT)
Received: from wen-HP-ProBook-445-14-inch-G9-Notebook-PC.. (36-239-105-221.dynamic-ip.hinet.net. [36.239.105.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f800sm25861623b3a.42.2025.08.10.23.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:22:37 -0700 (PDT)
From: Yao-Wen Chang <changyaowen19980629@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yao-Wen Chang <changyaowen19980629@gmail.com>
Subject: [PATCH 01/11] staging: rtl8723bs: Rename camelCase variables to snake_case
Date: Mon, 11 Aug 2025 14:21:24 +0800
Message-ID: <20250811062132.102525-1-changyaowen19980629@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit renames variables that were incorrectly using a camelCase
naming convention.

Signed-off-by: Yao-Wen Chang <changyaowen19980629@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index fe97bbea548c..47c63177b2a6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -320,7 +320,7 @@ void expire_timeout_chk(struct adapter *padapter)
 
 void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
-	unsigned char sta_band = 0, shortGIrate = false;
+	unsigned char sta_band = 0, short_GI_rate = false;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
@@ -335,7 +335,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 	rtw_hal_update_sta_rate_mask(padapter, psta);
 	tx_ra_bitmap = psta->ra_mask;
 
-	shortGIrate = query_ra_short_GI(psta);
+	short_GI_rate = query_ra_short_GI(psta);
 
 	if (pcur_network->configuration.ds_config > 14) {
 		sta_band |= WIRELESS_INVALID;
@@ -358,7 +358,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 
 		arg[0] = psta->mac_id;
 		arg[1] = psta->raid;
-		arg[2] = shortGIrate;
+		arg[2] = short_GI_rate;
 		arg[3] = psta->init_rate;
 
 		rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, rssi_level);
@@ -368,7 +368,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 void update_bmc_sta(struct adapter *padapter)
 {
 	unsigned char network_type;
-	int supportRateNum = 0;
+	int support_rate_num = 0;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -804,14 +804,14 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 {
 	int ret = _SUCCESS;
 	u8 *p;
-	u8 *pHT_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *p_HT_caps_ie = NULL;
+	u8 *p_HT_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
 	int group_cipher, pairwise_cipher;
-	u8 channel, network_type, supportRate[NDIS_802_11_LENGTH_RATES_EX];
-	int supportRateNum = 0;
+	u8 channel, network_type, support_rate[NDIS_802_11_LENGTH_RATES_EX];
+	int support_rate_num = 0;
 	u8 OUI1[] = {0x00, 0x50, 0xf2, 0x01};
 	u8 WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -1030,7 +1030,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		u8 max_rx_ampdu_factor = 0;
 		struct ieee80211_ht_cap *pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 
-		pHT_caps_ie = p;
+		p_HT_caps_ie = p;
 
 		ht_cap = true;
 		network_type |= WIRELESS_11_24N;
@@ -1088,7 +1088,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
 	);
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		p_HT_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1123,9 +1123,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		if (pregistrypriv->ampdu_enable == 1)
 			pmlmepriv->htpriv.ampdu_enable = true;
 
-		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
+		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)p_HT_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)p_HT_info_ie);
 	}
 
 	pbss_network->length = get_wlan_bssid_ex_sz(
-- 
2.43.0

