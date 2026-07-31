Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E7041A51D
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494642; cv=none; b=Ad1hWZff0wY+GHC311KPc+fVsfJinfl4odOYaV1WbNaE11Zznt+L2PXnXKc1QVSwe6Dvmt0eZNlp/SbsifWbXXHIKrAlA7zEpRVJpJMkIRGHdo22uHFcd8GFpv5lyrRSyhLKZGXE0XM5X+kH5CFb2K4Tr8bH2SCAcdbN+i3Tnhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494642; c=relaxed/simple;
	bh=CA2d/wf/q2wXDSlSwfQ/52bJgc7WgYltsh4UaFFb9A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmvKznTQBLxmisRNXGLOP+oAlLDLTFKwSUDeRDj+Vc0qkm8JPTCkkgms9nQRyULWoQ6yDyC3ux0KgqZvdqphodGXgC+pBDM+XTxiy7d/4D8511u6E3d5bXBFKceLdidHHTApNg0eVHZ9jRDu+6DSyTbveAuwGVjjfddnjpZOKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abbUlqDJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abbUlqDJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47db714766aso1128994f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494621; x=1786099421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pjpnk/e8XGdrC/Ir+XpXavatQU9AB2mubA2qXyMAAgs=;
        b=abbUlqDJv4EGq3J3pWYlheE7d2EmDkqJZEPWbBrKcQVeBiNzwZCrkSz+0plW9CCeoF
         yRPB/ynA2cAeTyCNxbpZt4hr6QhJETgag+CepVZUsuSkd8GMn0BAK3EoZ+6j7+e0Iyxo
         d3Yoq/MktVNpO7GC1UpE2gSJr+4iUUHcv1TSiCzjEg1AN3cIm/Jeyab5Ntpb87708FNK
         Z0ja3cz72hvQV65X31f2XQHfBmebcdpOOWdZ5Y2Cj4XLfELdxmE33iHt93KFTjreWTgn
         ILADUqTJNbCsAmVqgod3GpBdiz8e/k/g94VYXrKSMnYHPPYSB8hj6iQYfa5hcDRrCj1f
         dfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494621; x=1786099421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pjpnk/e8XGdrC/Ir+XpXavatQU9AB2mubA2qXyMAAgs=;
        b=bdQ1dYsXANTi+2SbggpQfxX0/Sbp9w7jVsytXA9H1i2g+nkeuwSGRTAi6dyJWX1tTx
         xGpsDO4XUQvSsWmvhOUlSfRczcQE7q3ymNkZQ1YqIiwD0I1J/H747RSlII+NvECc8FCO
         M1Tv7m91qwkVhcgyGgaWYZisJIC1njkYmXxy4kW81VaamTO8+iTbMcSTaIMhx6sV187K
         h8MaKLYHjDZj5zWDLW+BcYT7NVxv8wn2olfJT2v2kQqBMKTRUkmGSt8FlGd7CPnDrnNs
         fywIo+pqz9MXOPnHkOjrrJgytiSWokw6ib71l3nyH5YpBidXuzE4bQKAiIr152zjEt1o
         gyLg==
X-Forwarded-Encrypted: i=1; AHgh+Rp30WnGWKaVeL8VpZl9M5B6/YlYPRyo8PAAjxlvWPRpgygtCL8awDg+2ReZhEYxMKhgiDPCuD/obVnRD4HN@lists.linux.dev
X-Gm-Message-State: AOJu0YwtgKEVt//DycD8xcYbZ2o5QBpGyu0EaJgbmpxSqFdhXHaMTUO5
	n2hju/B0SeNz0RfHZQ8/2/rLBDl5tZ8HkaC/nuMN0429E9xp5MA8s6de
X-Gm-Gg: AR+sD13yjhF0G1CHUmUDh8xostk+NxCPpMh5ZcEwdUcI9naKpj3R8TnbaKfuzvl1oYb
	vwweDPlb2rOxulJVoDBXU6vjlQXFZVJRkYqm9rH9FbWEXP+Dzj92EGAinuC7AnwxcTPG3V94F/7
	WY2pTSohbTQzyY/fzF+Wu061OCZy6sWo+RULBaDe25S0hF2F0VtcrLRsdZF5W2jZRo/BUUZcA28
	LWBRmFEV0h1HxMSHfUum0HjIztIYHUTYDKwU3nCtvD89llvaJW8HupXS4WC+9sNJ/BPrLvL5WIZ
	IOz3bShYqvsUoFVTa9DWU//Q0FDdsVt3O7/zKnCAk8jXxYZD8e3trtRzbAsxPTqYITFOTLoJrpm
	A5gDWWkU7D6eLF7kzLRjukxBW5Ljl2VvJczdHq/alHK93Qc/v5l92bL7IEYEx/uaAZnd2BJ1YhA
	HC/5+iSjtqtJ1pZq9G7kf1dosuF+lR7B/Y5LZFVrOizIts8pNrIls+y3f/1mNxJ+jswa8JR4HFH
	FetEsN9xCkjmTQj2C29GG+Rpt+NCMvQu9d4o5oYe/6NWIvHe9ag
X-Received: by 2002:a05:6000:18a5:b0:47f:6e8b:699c with SMTP id ffacd0b85a97d-47fd339536dmr2965960f8f.14.1785494621247;
        Fri, 31 Jul 2026 03:43:41 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:40 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 03/11] staging: rtl8723bs: renaming variable pdev_network in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:26 +0000
Message-ID: <20260731104134.12754-4-fliegbert2@gmail.com>
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

Renaming occurrences of pdev_network to dev_network since the prefix
p is an old.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 42 +++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 276bf83fa024..37640ea9edc8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -704,7 +704,7 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 					_set_timer(&mlme_priv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex *pdev_network =
+					struct wlan_bssid_ex *dev_network =
 						&adapter->registrypriv.dev_network;
 
 					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
@@ -712,7 +712,7 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 					/* mlme_priv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
 					_clr_fwstate_(mlme_priv, _FW_UNDER_SURVEY);
 
-					memcpy(&pdev_network->ssid, &mlme_priv->assoc_ssid,
+					memcpy(&dev_network->ssid, &mlme_priv->assoc_ssid,
 					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
@@ -1368,7 +1368,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 	int mac_id = (-1);
 	struct sta_info *psta;
 	struct wlan_network *pwlan = NULL;
-	struct wlan_bssid_ex    *pdev_network = NULL;
+	struct wlan_bssid_ex    *dev_network = NULL;
 	u8 *pibss = NULL;
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct stadel_event *pstadel = (struct stadel_event *)buf;
@@ -1454,12 +1454,12 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 			}
 			spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 			/* re-create ibss */
-			pdev_network = &adapter->registrypriv.dev_network;
+			dev_network = &adapter->registrypriv.dev_network;
 			pibss = adapter->registrypriv.dev_network.mac_address;
 
-			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
+			memcpy(dev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
 
-			memcpy(&pdev_network->ssid, &mlme_priv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+			memcpy(&dev_network->ssid, &mlme_priv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
 
 			rtw_update_registrypriv_dev_network(adapter);
 
@@ -2104,48 +2104,48 @@ void rtw_init_registrypriv_dev_network(struct adapter *adapter)
 {
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	struct eeprom_priv *peepriv = &adapter->eeprompriv;
-	struct wlan_bssid_ex *pdev_network = &pregistrypriv->dev_network;
+	struct wlan_bssid_ex *dev_network = &pregistrypriv->dev_network;
 	u8 *myhwaddr = myid(peepriv);
 
-	memcpy(pdev_network->mac_address, myhwaddr, ETH_ALEN);
+	memcpy(dev_network->mac_address, myhwaddr, ETH_ALEN);
 
-	memcpy(&pdev_network->ssid, &pregistrypriv->ssid, sizeof(struct ndis_802_11_ssid));
+	memcpy(&dev_network->ssid, &pregistrypriv->ssid, sizeof(struct ndis_802_11_ssid));
 
-	pdev_network->configuration.length = sizeof(struct ndis_802_11_conf);
-	pdev_network->configuration.beacon_period = 100;
+	dev_network->configuration.length = sizeof(struct ndis_802_11_conf);
+	dev_network->configuration.beacon_period = 100;
 }
 
 void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 {
 	int sz = 0;
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
-	struct wlan_bssid_ex *pdev_network = &pregistrypriv->dev_network;
+	struct wlan_bssid_ex *dev_network = &pregistrypriv->dev_network;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	struct wlan_network *cur_network = &adapter->mlmepriv.cur_network;
 
-	pdev_network->privacy = (psecuritypriv->dot11_privacy_algrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
+	dev_network->privacy = (psecuritypriv->dot11_privacy_algrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
 
-	pdev_network->rssi = 0;
+	dev_network->rssi = 0;
 
-	pdev_network->configuration.ds_config = (pregistrypriv->channel);
+	dev_network->configuration.ds_config = (pregistrypriv->channel);
 
 	if (cur_network->network.infrastructure_mode == NL80211_IFTYPE_ADHOC)
-		pdev_network->configuration.atim_window = (0);
+		dev_network->configuration.atim_window = (0);
 
-	pdev_network->infrastructure_mode = (cur_network->network.infrastructure_mode);
+	dev_network->infrastructure_mode = (cur_network->network.infrastructure_mode);
 
 	/*  1. Supported rates */
 	/*  2. IE */
 
-	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv->wireless_mode) ;  will be called in rtw_generate_ie */
+	/* rtw_set_supported_rate(dev_network->supported_rates, pregistrypriv->wireless_mode) ;  will be called in rtw_generate_ie */
 	sz = rtw_generate_ie(pregistrypriv);
 
-	pdev_network->ie_length = sz;
+	dev_network->ie_length = sz;
 
-	pdev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pdev_network);
+	dev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)dev_network);
 
 	/* notes: translate ie_length & length after assign the length to cmdsz in createbss_cmd(); */
-	/* pdev_network->ie_length = cpu_to_le32(sz); */
+	/* dev_network->ie_length = cpu_to_le32(sz); */
 }
 
 /* the function is at passive_level */
-- 
2.55.0

