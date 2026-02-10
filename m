Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A892D97B4
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692858; cv=none; b=ge2zueJLopSrcoCb7VrQWIf7iJ4Kk/RFCKm9BnVrD91dkDuF52HYHXNjQB46qbduuH199g1VgOkWGfSOih6eMFxprJm0le+OpM36449ej/bQQzMYZQH2XhiDRIwWLTZmO9NUhI4dF7XGaImyfv0LHKMWoLqgfV7B8MYIzoqFKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692858; c=relaxed/simple;
	bh=/A91F5up8bHoUXlD8H50sP8j6ANez5rYMGRsMneFY+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjPTbWu87aaGE/e9KKNd+kfgtHYADh8BS7Z1up+LELRDdAlD0CL0UDhv9XNjwlELg+cm9Ve3Qzo7cDrSwxdHMbMRMVKOWOO7TuMLi49MIYoUZ+Z2HUydT6NIVupBjB9E2ZhOL+VmXWqrWyRrqwNeBA3puw6o3phFcWZ6lxhG1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfXWCQXY; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfXWCQXY"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso135976a12.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692855; x=1771297655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZuEZPAPfkrspoCeOtWv8OxJuAL3HQ3zo1MJnrN+08Y=;
        b=dfXWCQXY6IGI1Y6+xVPVawbsr+QQZ7uWIYQrmPXhRxNo9gTFbzAAUeN3Vn+otceWtw
         J2oK1DMoKkEEbtxP/G0QNpmN5r8GZ48dQWBHnN8xecOcxcROdJC+K5WP9RYj3WQhxBBz
         po+4XjoL+7nfzFdc9isXT51Gs5caN5z+2QbtQmXLcqbVqJTRqeAJi9Ze/T3XtghOdpwX
         Vf+UkO48VpzV0aYXZd8GlmyArxvjF8v5AqN+ZMugccD2lIW27XvaV1MolkjjIhoeNiQp
         x3kBdbvnvWIhELQiOwhngBRbhIpm4NHgmezqKK71OnSrGT9q90uMpusBoXEYzQHjYdlp
         6NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692855; x=1771297655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZuEZPAPfkrspoCeOtWv8OxJuAL3HQ3zo1MJnrN+08Y=;
        b=FpQuDjP4UQVZW1qMPsBJ6+gt06nmlEkb0CwTZxI68aGXKhmo/TlKR2zWwekk3yFtfY
         RroV8W5SepvPWejMVOVTWoGj6n99sjJ0tn4ieRA95nh4/gvXrT7k/B39ImXIq2wF4sfA
         OmTMBABQ13Z/vLght3xpzt9Grdcy2dR16qlb9i6M7Gx/+o7fy25TDLXtT8xfe4OjoXaK
         L9Uhj4ieXkYlBZ6bD6F4Y4sbqyyHjNGbpcW728FPp+cZWsb0vR5ptYChgyGMvzNFvdV8
         oJI0Oj7PYqLXbJjwLrXh8lP7wF+LNiG3x1k4KDc0ck/CFfISki/RNalLsUOywM7SjEjs
         EEEg==
X-Gm-Message-State: AOJu0YwyJWKtkW1r/ajViFwIq8J6R2NuG686JWZRDQLLbKtaHTrQtzj+
	eQiiGXoepqQkV4zLeE6Omcujav+URafoMROAT3uk3o+egnq/BkR43nLt
X-Gm-Gg: AZuq6aL6By1ycmriO8Mai0GlvX/pN5Ow/sd5NGOb8uogL/2ku0+GvqNowdoH7MFkiQm
	ip9lh2yFb+c8HHcqYEJMUuH6a23MJ9E0B5sgmNL1hgFgKgXTCeelbuGCJ5D55rh5SO8t8wVQrF5
	YfN8hPQXBANlWtgNT1wgR7IBHLmmPg020DWw6NR2YSnl/tR3klS3w59cif8G3dT/X4YXhtkBKm3
	mqz3uWTg6SyUd14sbRZ74qhEWH5+TasphAhc6wmG0drXH1c92DOw2GW+neNfrRpl8Fn4LGaZI8w
	Z8Sf7ktrhJda/lOXCJt24GFDLuZ/6otZRaZnNjQAuVOw9TBG1a5u/pG11SEXROdqI9TvuMIKB7H
	9KOAbDTfRMSY5lZzQBTL93S95J8Py7MM5mLU8G77QT1mGeagW6+6XAj2R2gbP3aOsWJnr0X2/RV
	u+HFOJEt/aA+Neh89WfZNWBUIN5JYL4A==
X-Received: by 2002:a17:902:d4c2:b0:2aa:e6c1:cea1 with SMTP id d9443c01a7336-2aae6c1d148mr60749195ad.17.1770692855467;
        Mon, 09 Feb 2026 19:07:35 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:35 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 7/7] staging: rtl8723bs: remove unnecessary void * casts in ioctl_cfg80211.c
Date: Tue, 10 Feb 2026 10:06:07 +0700
Message-ID: <20260210030607.1430567-8-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210030607.1430567-1-horstaufmental@gmail.com>
References: <20260210030607.1430567-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..a0f9844e17d9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -93,7 +93,7 @@ static struct ieee80211_channel rtw_2ghz_channels[] = {
 
 static void rtw_2g_channels_init(struct ieee80211_channel *channels)
 {
-	memcpy((void *)channels, (void *)rtw_2ghz_channels,
+	memcpy(channels, rtw_2ghz_channels,
 	       sizeof(struct ieee80211_channel) * RTW_2G_CHANNELS_NUM
 	);
 }
@@ -894,7 +894,7 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
 	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
 		if (mac_addr)
-			memcpy(param->sta_addr, (void *)mac_addr, ETH_ALEN);
+			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
 	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true
@@ -1737,7 +1737,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 		pwep->key_index = wep_key_idx;
 		pwep->key_index |= 0x80000000;
 
-		memcpy(pwep->key_material,  (void *)sme->key, pwep->key_length);
+		memcpy(pwep->key_material, sme->key, pwep->key_length);
 
 		if (rtw_set_802_11_add_wep(padapter, pwep) == (u8)_FAIL)
 			ret = -EOPNOTSUPP;
@@ -2086,7 +2086,7 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 
 		pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 
-		memcpy(pframe, (void *)buf, len);
+		memcpy(pframe, buf, len);
 		pattrib->pktlen = len;
 
 		pwlanhdr = (struct ieee80211_hdr *)pframe;
@@ -2261,8 +2261,8 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 	if (!pbuf)
 		return -ENOMEM;
 
-	memcpy(pbuf, (void *)head + 24, head_len - 24);/*  24 =beacon header len. */
-	memcpy(pbuf + head_len - 24, (void *)tail, tail_len);
+	memcpy(pbuf, head + 24, head_len - 24);/*  24 =beacon header len. */
+	memcpy(pbuf + head_len - 24, tail, tail_len);
 
 	len = head_len + tail_len - 24;
 
@@ -2299,9 +2299,9 @@ static int cfg80211_rtw_start_ap(struct wiphy *wiphy, struct net_device *ndev,
 		struct wlan_bssid_ex *pbss_network = &adapter->mlmepriv.cur_network.network;
 		struct wlan_bssid_ex *pbss_network_ext = &adapter->mlmeextpriv.mlmext_info.network;
 
-		memcpy(pbss_network->ssid.ssid, (void *)settings->ssid, settings->ssid_len);
+		memcpy(pbss_network->ssid.ssid, settings->ssid, settings->ssid_len);
 		pbss_network->ssid.ssid_length = settings->ssid_len;
-		memcpy(pbss_network_ext->ssid.ssid, (void *)settings->ssid, settings->ssid_len);
+		memcpy(pbss_network_ext->ssid.ssid, settings->ssid, settings->ssid_len);
 		pbss_network_ext->ssid.ssid_length = settings->ssid_len;
 	}
 
@@ -2494,7 +2494,7 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 
-	memcpy(pframe, (void *)buf, len);
+	memcpy(pframe, buf, len);
 	pattrib->pktlen = len;
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
-- 
2.52.0

