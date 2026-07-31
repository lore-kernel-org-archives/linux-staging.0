Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4941167C
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494636; cv=none; b=RlSS6yyjc6IWEcTthJaxMSVx3qcjwzekj8ky70iefFu5gN7Jy0mtIFVwqvPsACiGIUHOthTdpITxlFHR34k9toYB/th5/ctzZ29zYrtokPphnq7CSZ7vYw03j2OngO9seqaHmCMDFAo1ek2yhKlcibKRGq2Kzs7OINpayOWIsnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494636; c=relaxed/simple;
	bh=iaVUpV/d+U2iLTKuHJHE3/DnccaoZGxveCcdeVs7kqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpheCz2K71Lw9jRzsKbHo6h08x+mEiCIwCyEHUU1WMHpQaFGICpyMqfJ18CFd+p/O52INxqTdhiAyjqx79gX0gM5CSid42vk2MNwFMTlpxjaJblc5JUAWcuvJ4/EwGPU0Vh/I4iIf19A4sgVZGongXym05hFEZVyP3+sm6gqJls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+c/mwWQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+c/mwWQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f6609c657so414637f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494624; x=1786099424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbMMxVWI1HxBa2UGVYvHtHHQFtntrXS6D3AyyDSHIP4=;
        b=K+c/mwWQGdhsuEJW3tvGXNGGKtkg2e9GD68HUIJk4zBlSl4QonDDiHg22fVN4GPG3U
         6gFd4pyjV+hA8RwlMqH5JHGbEu3CYJs9bPABJMJ0OoX4EjlE9EhOqC23jEIyTH7Iue02
         R1RBR8A6V0cHDW4v+x7LcFmlx1SXNcy5dDstNtAka/iat0Z0OgjwawdxoKCrjnRAXhAI
         syvzE9IeS7mGTEKA21KxOWHUz3Nqevjc+8nRrB69EWudBy+Gy1xUOI50BKPyMO9KH5an
         guUzZ38jxwF+v2AJ9MwWDhi9e+TSNsFoO9LC3G2NyYtC8izFE1rDoFYh6ZnTgEiCbUFT
         nDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494624; x=1786099424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbMMxVWI1HxBa2UGVYvHtHHQFtntrXS6D3AyyDSHIP4=;
        b=Gv7Fi0GYELcRF0LqR/c7zW8v7cgfFvVdbnEyi0c5R5ZCihyeeCJi0XkRi3Xj5MR3iY
         nPC1cf/lV17yEGHHTpugptLUGHJLz46nmAsaAH9ALsVsM1HTPj9/CAHxsFL8w39qRb3U
         a8JFG7Q1o7i9aVH6fU6hm5bvDWsrEtdjltcHjjJ5+KiMRta0sAOM9ArQMpImiLJ42GpH
         tTLO8FWTv9rv1snBC0OEhhV95kZ+YN/6sGNDB8pduIF5DgRkCpLFZADnWlLOHP6w65JC
         k+lQS2w55Unv1tPkogtpNJwzA3dVj0lJrXgaWrJ9HhCjv2cNaoHMeFlQw+8SM1l+LjaG
         zH/g==
X-Forwarded-Encrypted: i=1; AHgh+RqgNhACTH+ZrTTbCcM5vuN7eqh5ovmOCLqvXUxvtgiiDoSdohRjw6rsojDnRYGjwH9/K6Hdpj8f87JsLOLA@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9N8yljpAbK26A8aC0f0WBYdXeUd7lQZNgjAVlfcQPVIgbcXhy
	oEX7Tz5zUr4QZ+Gw6zYP7S0/TjJi8YUJCCiMvlO0tWW7LF0mq1GxVAWs
X-Gm-Gg: AR+sD10Ya2drqupr/KDENVta4X8m279WZimxGJPhQ6M5riD1MUwL+zlS5DcLeUQkIKQ
	D6jYMMdLhCKXUjeZNO5AqiGuZ3imlTFeGXmM4CrNDfRQ8SXt4pq5yvZD8Q+GdqOQAt/EUwsnXkD
	6Z7+hI5Bx/TsDWgLj7iJo9k12cug43htNPSEhUNWDYqX7eh+PxZATc/8tQoGNJ7+6vxDV8X178A
	TXeFh7H6ZhsZiplghvD8trr087PE2cSu9C0QFnec2JuiNRtzM4N4cPliStsRfbisiodx284Q6/1
	d0OdbW54/zojDGRd8B3IE3B4O6VjojBSu7kmh2WmcXI3QnLYdXyri5mQNB12PXWEA92xkB1cZHs
	N7wBWo1U8gvy47BFpvep+0+n+tsgGlKbwqpcDnCm5tVHy7XlJuju+/ZWFhORogZtihMHb8X5/Ez
	MAHS+yURAclApRF85+7EwMPR9593LXFxHLZa6C4Ss1WxtZzw67ZKZzQfWmPfI2jA8QC3vX775B1
	dXGgD96+SOMmzyfO78eAW7K7MF3ChHkcHeToLYRJRmAzhf80GO+
X-Received: by 2002:a05:6000:41f2:b0:47f:81fe:12f8 with SMTP id ffacd0b85a97d-47fd2ababd7mr3595905f8f.1.1785494623811;
        Fri, 31 Jul 2026 03:43:43 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:43 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 07/11] staging: rtl8723bs: renaming variable pregistrypriv in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:30 +0000
Message-ID: <20260731104134.12754-8-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731104134.12754-1-fliegbert2@gmail.com>
References: <20260731104134.12754-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming occurrences of pregistrypriv to registry_priv since the
prefix p is an old naming convention to indicate a pointer variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 50 +++++++++++------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7245f671075e..0da5515a6be5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2102,14 +2102,14 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 
 void rtw_init_registrypriv_dev_network(struct adapter *adapter)
 {
-	struct registry_priv *pregistrypriv = &adapter->registrypriv;
+	struct registry_priv *registry_priv = &adapter->registrypriv;
 	struct eeprom_priv *peepriv = &adapter->eeprompriv;
-	struct wlan_bssid_ex *dev_network = &pregistrypriv->dev_network;
+	struct wlan_bssid_ex *dev_network = &registry_priv->dev_network;
 	u8 *myhwaddr = myid(peepriv);
 
 	memcpy(dev_network->mac_address, myhwaddr, ETH_ALEN);
 
-	memcpy(&dev_network->ssid, &pregistrypriv->ssid, sizeof(struct ndis_802_11_ssid));
+	memcpy(&dev_network->ssid, &registry_priv->ssid, sizeof(struct ndis_802_11_ssid));
 
 	dev_network->configuration.length = sizeof(struct ndis_802_11_conf);
 	dev_network->configuration.beacon_period = 100;
@@ -2118,8 +2118,8 @@ void rtw_init_registrypriv_dev_network(struct adapter *adapter)
 void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 {
 	int sz = 0;
-	struct registry_priv *pregistrypriv = &adapter->registrypriv;
-	struct wlan_bssid_ex *dev_network = &pregistrypriv->dev_network;
+	struct registry_priv *registry_priv = &adapter->registrypriv;
+	struct wlan_bssid_ex *dev_network = &registry_priv->dev_network;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	struct wlan_network *cur_network = &adapter->mlmepriv.cur_network;
 
@@ -2127,7 +2127,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 	dev_network->rssi = 0;
 
-	dev_network->configuration.ds_config = (pregistrypriv->channel);
+	dev_network->configuration.ds_config = (registry_priv->channel);
 
 	if (cur_network->network.infrastructure_mode == NL80211_IFTYPE_ADHOC)
 		dev_network->configuration.atim_window = (0);
@@ -2137,8 +2137,8 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	/*  1. Supported rates */
 	/*  2. IE */
 
-	/* rtw_set_supported_rate(dev_network->supported_rates, pregistrypriv->wireless_mode) ;  will be called in rtw_generate_ie */
-	sz = rtw_generate_ie(pregistrypriv);
+	/* rtw_set_supported_rate(dev_network->supported_rates, registry_priv->wireless_mode) ;  will be called in rtw_generate_ie */
+	sz = rtw_generate_ie(registry_priv);
 
 	dev_network->ie_length = sz;
 
@@ -2182,28 +2182,28 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 {
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
-	struct registry_priv *pregistrypriv = &adapter->registrypriv;
+	struct registry_priv *registry_priv = &adapter->registrypriv;
 	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
 	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
 
-	if (pregistrypriv->wifi_spec)
+	if (registry_priv->wifi_spec)
 		ht_priv->bss_coexist = 1;
 	else
 		ht_priv->bss_coexist = 0;
 
-	ht_priv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT(1)) ? true : false;
-	ht_priv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
+	ht_priv->sgi_40m = TEST_FLAG(registry_priv->short_gi, BIT(1)) ? true : false;
+	ht_priv->sgi_20m = TEST_FLAG(registry_priv->short_gi, BIT(0)) ? true : false;
 
 	/*  LDPC support */
 	rtw_hal_get_def_var(adapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
 	CLEAR_FLAGS(ht_priv->ldpc_cap);
 	if (bHwLDPCSupport) {
-		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(4)))
+		if (TEST_FLAG(registry_priv->ldpc_cap, BIT(4)))
 			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_RX);
 	}
 	rtw_hal_get_def_var(adapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
 	if (bHwLDPCSupport) {
-		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(5)))
+		if (TEST_FLAG(registry_priv->ldpc_cap, BIT(5)))
 			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_TX);
 	}
 
@@ -2211,12 +2211,12 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	rtw_hal_get_def_var(adapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
 	CLEAR_FLAGS(ht_priv->stbc_cap);
 	if (bHwSTBCSupport) {
-		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(5)))
+		if (TEST_FLAG(registry_priv->stbc_cap, BIT(5)))
 			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_TX);
 	}
 	rtw_hal_get_def_var(adapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
 	if (bHwSTBCSupport) {
-		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(4)))
+		if (TEST_FLAG(registry_priv->stbc_cap, BIT(4)))
 			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_RX);
 	}
 
@@ -2224,10 +2224,10 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
 	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
 	CLEAR_FLAGS(ht_priv->beamform_cap);
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
+	if (TEST_FLAG(registry_priv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
 		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
 
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
+	if (TEST_FLAG(registry_priv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
 		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
@@ -2253,7 +2253,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 	unsigned char *p;
 	struct ieee80211_ht_cap ht_capie;
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
-	struct registry_priv *pregistrypriv = &adapter->registrypriv;
+	struct registry_priv *registry_priv = &adapter->registrypriv;
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
@@ -2302,7 +2302,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 	}
 
 	/* to disable 40M Hz support while gd_bw_40MHz_en = 0 */
-	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+	if ((registry_priv->bw_mode & 0x0f) > 0)
 		cbw40_enable = 1;
 
 	if ((cbw40_enable == 1) && (operation_bw == CHANNEL_WIDTH_40)) {
@@ -2318,8 +2318,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 	ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SM_PS);
 
 	if (TEST_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_RX)) {
-		if ((channel <= 14 && pregistrypriv->rx_stbc == 0x1) ||	/* enable for 2.4GHz */
-			(pregistrypriv->wifi_spec == 1))
+		if ((channel <= 14 && registry_priv->rx_stbc == 0x1) ||	/* enable for 2.4GHz */
+			(registry_priv->wifi_spec == 1))
 			stbc_rx_enable = 1;
 	}
 
@@ -2377,7 +2377,7 @@ void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel
 	struct ieee80211_ht_cap *pht_capie;
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
-	struct registry_priv *pregistrypriv = &adapter->registrypriv;
+	struct registry_priv *registry_priv = &adapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 cbw40_enable = 0;
@@ -2389,7 +2389,7 @@ void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel
 		return;
 
 	/* maybe needs check if ap supports rx ampdu. */
-	if (!(ht_priv->ampdu_enable) && pregistrypriv->ampdu_enable == 1)
+	if (!(ht_priv->ampdu_enable) && registry_priv->ampdu_enable == 1)
 		ht_priv->ampdu_enable = true;
 
 	/* check Max Rx A-MPDU Size */
@@ -2409,7 +2409,7 @@ void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel
 		/* todo: */
 	}
 
-	if ((pregistrypriv->bw_mode & 0x0f) > 0)
+	if ((registry_priv->bw_mode & 0x0f) > 0)
 		cbw40_enable = 1;
 
 	/* update cur_bwmode & cur_ch_offset */
-- 
2.55.0

