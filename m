Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10CB313E14
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100286; cv=none; b=h9DPLuCz3OYTy3PNDb1Dm8W6wXQRZvsApwDmBVb3hfxibSdizlAfM67fgHbxzfUYbV6pDabyYlf8biU1TMD+l28nVvvFB2UmrsV97VmrbjUlThVll0sLX4BqDhd6/OSs8YvyIWIdTFTpLsSFONgNiFSuHVQmP89XL+kohUYJEic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100286; c=relaxed/simple;
	bh=ZBP7RD3c4cPco/Bg9++j7DTOpm9ue45ItV3OExA3B90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PtDPCT4kI5aFSi+I1Rrlt4MRiEnZstiDIJ1LCgFKKdjdGii5eDaRsLP5JlJZRMrEXuzC3KuUmoD1tCS2qpTBhdLylZS6+dLv3+8NjW4iq2M1c15h0dbVVdOW6Dkbt2EU9UvceYocg/07VM2eBagObASsU9E611i8KrzrdqsFlUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU7E6dvA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU7E6dvA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43995fdfeceso23806f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100279; x=1772705079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qcXLa2XP0/0XLFeURmGXNOncrdj1rQnouRkD1+T3ktY=;
        b=QU7E6dvAeYj5d/hnfqCMO471nGsU+S6vP+xeQt/J2Nq1nXbJrfZUG+PasQ/s5bJbLb
         KWJw+Bu7vAa9plAvlqAr2fGPwp1A/JwQcnPGx8oWFJ7iN71o+h4waQSf1nuTDtOgeMxW
         VtXc7982acv6ZEh3H9LRNyGHgy5Ga3ffuOsYLkTe2ZhHpfykT3Jm92dEIg/PROmvX++t
         4JEzsJaylLAruU4pEy3yrj53nFSGTPBhGaz9A7RNQ3v344iiu0X8ESPMJRBdYqlxwzBb
         4EcIE8RFjYHsI9eiZ+hmiLkPPfJO8drs+5GN7/GVGXLEfUHSNdF/KTWavb0Px2/75gEl
         DAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100279; x=1772705079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcXLa2XP0/0XLFeURmGXNOncrdj1rQnouRkD1+T3ktY=;
        b=nYjlTtKN/JGZZfcdRsCk51tDisVdOUoxEhhyLUL/aVFHJQc/Qg7D60ZsXmsW2OTlNH
         FLUGlYBs14xCjjWd29j0tPRIkP2jz/cRXqQY3bjobkkl6Q5l05UvFLJYNLZJU23lNQu7
         26e//i73kHYmha/CfHHFNFquKtrQOyTgtX5dwILkyWBCb7naEYYkboYCgVYEav7ZZ9RM
         8CBqiAH9Ha7NrMV3yMQApkHgrGyd1BjbV24bXHwau0DzIA3hNvqI6wGgpVGGW3VNZgHs
         SJ37CM/kILSGuIvMfFlmy2jv5GWa082VfnOijoQ24XcTkvCTNQ/1y7i/+1tNNje1HN1/
         3KCw==
X-Gm-Message-State: AOJu0YyOxxNrHp0imTolalDFw+8/x58pM1EtUXTpyi850s2LEjQxu0uj
	HO8bvDwKnq8gNOM8F2m/Z/pr5EPM4jhqVmq5QTJozT4GfKRHgEiXNHZCBPCYwPbVYPA=
X-Gm-Gg: ATEYQzxAzGxpc6gDv9qNAizbKJlqaQLcsK5bQqx9R55c7mmThKVR7+TBza3+d8Y+oTb
	yUT70s6CliYa55v5uldMRK6JbfP49SSiKYgR3LcyFQcCvjV1Pnrq2Cf9N5Psn1chwIf8T61oqvz
	x7fob76DbxlsTmV7QCLmS6S8zNksDJ6miBcbuVPMOn5nOt3w2SM0w14zxETB+s1WvaEuV8gOVib
	GprcWrkoUnfTpUSBug6tLfpbaqhUJ8F/NonbS1Fj2+TNhbgXp2bz6eY3hCSSjwTVWhQAlUYlDes
	RwGDXJs8m+ZC932i6A8TM0ap9O5F7tgI3sDnFiqlLUA4m7AhPm0FCWEyduO/e1HDY9wn4mtXNww
	bQdbkvUa/IfBFVTd2SKjYftUGT43nN1cuwqM/h3u7AIi31V8Qf01LhuIP+n0wOvKuK/dyTU5UoN
	p6M6luIhEIoriWX0iooFv1a+5n8EBj/0I1KbbFYSQx2eUgecZFnicPx7ehCxRXCMFNJevny15Ne
	L/tkjGAt/0l84NqQ/cKfyl6YBTCuxF+fdv4RY4zZo9AVOWw+TIb
X-Received: by 2002:a5d:5f44:0:b0:437:6dac:4572 with SMTP id ffacd0b85a97d-4396f184ae3mr19211286f8f.6.1772100278911;
        Thu, 26 Feb 2026 02:04:38 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:38 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 12/12] staging: rtl8723bs: remove unnecessary casts in ioctl_cfg80211.c
Date: Thu, 26 Feb 2026 14:02:56 +0400
Message-ID: <20260226100255.167059-14-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 46 ++++++++++---------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22bf3..eafedf91fa6e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -93,9 +93,8 @@ static struct ieee80211_channel rtw_2ghz_channels[] = {
 
 static void rtw_2g_channels_init(struct ieee80211_channel *channels)
 {
-	memcpy((void *)channels, (void *)rtw_2ghz_channels,
-	       sizeof(struct ieee80211_channel) * RTW_2G_CHANNELS_NUM
-	);
+	memcpy(channels, rtw_2ghz_channels,
+	       sizeof(struct ieee80211_channel) * RTW_2G_CHANNELS_NUM);
 }
 
 static void rtw_2g_rates_init(struct ieee80211_rate *rates)
@@ -884,18 +883,18 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 	param->u.crypt.idx = key_index;
 
 	if (params->seq_len && params->seq)
-		memcpy(param->u.crypt.seq, (u8 *)params->seq, params->seq_len);
+		memcpy(param->u.crypt.seq, params->seq, params->seq_len);
 
 	if (params->key_len && params->key) {
 		param->u.crypt.key_len = params->key_len;
-		memcpy(param->u.crypt.key, (u8 *)params->key, params->key_len);
+		memcpy(param->u.crypt.key, params->key, params->key_len);
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
 	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
 		if (mac_addr)
-			memcpy(param->sta_addr, (void *)mac_addr, ETH_ALEN);
+			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
 	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true
@@ -988,7 +987,7 @@ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
 		&& check_fwstate(pmlmepriv, _FW_LINKED)) {
 		struct wlan_network  *cur_network = &(pmlmepriv->cur_network);
 
-		if (memcmp((u8 *)mac, cur_network->network.mac_address, ETH_ALEN)) {
+		if (memcmp(mac, cur_network->network.mac_address, ETH_ALEN)) {
 			ret = -ENOENT;
 			goto exit;
 		}
@@ -1573,7 +1572,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 
 	memset(&ndis_ssid, 0, sizeof(struct ndis_802_11_ssid));
 	ndis_ssid.ssid_length = params->ssid_len;
-	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
+	memcpy(ndis_ssid.ssid, params->ssid, params->ssid_len);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
@@ -1662,7 +1661,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	memset(&ndis_ssid, 0, sizeof(struct ndis_802_11_ssid));
 	ndis_ssid.ssid_length = sme->ssid_len;
-	memcpy(ndis_ssid.ssid, (u8 *)sme->ssid, sme->ssid_len);
+	memcpy(ndis_ssid.ssid, sme->ssid, sme->ssid_len);
 
 	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
 		ret = -EBUSY;
@@ -1735,7 +1734,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 		pwep->key_index = wep_key_idx;
 		pwep->key_index |= 0x80000000;
 
-		memcpy(pwep->key_material,  (void *)sme->key, pwep->key_length);
+		memcpy(pwep->key_material, sme->key, pwep->key_length);
 
 		if (rtw_set_802_11_add_wep(padapter, pwep) == (u8)_FAIL)
 			ret = -EOPNOTSUPP;
@@ -1848,8 +1847,9 @@ static int cfg80211_rtw_set_pmksa(struct wiphy *wiphy,
 
 	/* overwrite PMKID */
 	for (index = 0 ; index < NUM_PMKID_CACHE; index++) {
-		if (!memcmp(psecuritypriv->PMKIDList[index].Bssid, (u8 *)pmksa->bssid, ETH_ALEN)) {
-			memcpy(psecuritypriv->PMKIDList[index].PMKID, (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
+		if (!memcmp(psecuritypriv->PMKIDList[index].Bssid, pmksa->bssid, ETH_ALEN)) {
+			memcpy(psecuritypriv->PMKIDList[index].PMKID,
+			       pmksa->pmkid, WLAN_PMKID_LEN);
 			psecuritypriv->PMKIDList[index].bUsed = true;
 			psecuritypriv->PMKIDIndex = index + 1;
 			blInserted = true;
@@ -1858,8 +1858,10 @@ static int cfg80211_rtw_set_pmksa(struct wiphy *wiphy,
 	}
 
 	if (!blInserted) {
-		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].Bssid, (u8 *)pmksa->bssid, ETH_ALEN);
-		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].PMKID, (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
+		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].Bssid,
+		       pmksa->bssid, ETH_ALEN);
+		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].PMKID,
+		       pmksa->pmkid, WLAN_PMKID_LEN);
 
 		psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].bUsed = true;
 		psecuritypriv->PMKIDIndex++;
@@ -1879,7 +1881,7 @@ static int cfg80211_rtw_del_pmksa(struct wiphy *wiphy,
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
 	for (index = 0 ; index < NUM_PMKID_CACHE; index++) {
-		if (!memcmp(psecuritypriv->PMKIDList[index].Bssid, (u8 *)pmksa->bssid, ETH_ALEN)) {
+		if (!memcmp(psecuritypriv->PMKIDList[index].Bssid, pmksa->bssid, ETH_ALEN)) {
 			/*
 			 * BSSID is matched, the same AP => Remove this PMKID information
 			 * and reset it.
@@ -2084,7 +2086,7 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 
 		pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 
-		memcpy(pframe, (void *)buf, len);
+		memcpy(pframe, buf, len);
 		pattrib->pktlen = len;
 
 		pwlanhdr = (struct ieee80211_hdr *)pframe;
@@ -2260,7 +2262,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 		return -ENOMEM;
 
 	memcpy(pbuf, (void *)head + 24, head_len - 24);/*  24 =beacon header len. */
-	memcpy(pbuf + head_len - 24, (void *)tail, tail_len);
+	memcpy(pbuf + head_len - 24, tail, tail_len);
 
 	len = head_len + tail_len - 24;
 
@@ -2297,9 +2299,11 @@ static int cfg80211_rtw_start_ap(struct wiphy *wiphy, struct net_device *ndev,
 		struct wlan_bssid_ex *pbss_network = &adapter->mlmepriv.cur_network.network;
 		struct wlan_bssid_ex *pbss_network_ext = &adapter->mlmeextpriv.mlmext_info.network;
 
-		memcpy(pbss_network->ssid.ssid, (void *)settings->ssid, settings->ssid_len);
+		memcpy(pbss_network->ssid.ssid, settings->ssid,
+		       settings->ssid_len);
 		pbss_network->ssid.ssid_length = settings->ssid_len;
-		memcpy(pbss_network_ext->ssid.ssid, (void *)settings->ssid, settings->ssid_len);
+		memcpy(pbss_network_ext->ssid.ssid, settings->ssid,
+		       settings->ssid_len);
 		pbss_network_ext->ssid.ssid_length = settings->ssid_len;
 	}
 
@@ -2366,7 +2370,7 @@ static int cfg80211_rtw_del_station(struct wiphy *wiphy, struct net_device *ndev
 	list_for_each_safe(plist, tmp, phead) {
 		psta = list_entry(plist, struct sta_info, asoc_list);
 
-		if (!memcmp((u8 *)mac, psta->hwaddr, ETH_ALEN)) {
+		if (!memcmp(mac, psta->hwaddr, ETH_ALEN)) {
 			if (psta->dot8021xalg != 1 || psta->bpairwise_key_installed) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
@@ -2492,7 +2496,7 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 
-	memcpy(pframe, (void *)buf, len);
+	memcpy(pframe, buf, len);
 	pattrib->pktlen = len;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
-- 
2.52.0

