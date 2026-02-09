Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A6317711
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681156; cv=none; b=KShDWkUCfYp1ILncUWiA4cGbqTogCyrk99PtPvdclmz9BdPJeHLoqDcPjRVrQnEArbEnno/BywiVIfhBVMrQVnPjJMCXzIiOyWUCceC2If3jMF5mRPf4pICi+c7zUM/7DbmTEQ7SgSD1p3qCe/VPNkyEfT0yheWmwMJw2iicUOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681156; c=relaxed/simple;
	bh=/A91F5up8bHoUXlD8H50sP8j6ANez5rYMGRsMneFY+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2dgV65a7M9uUmjwgI1ojmPlhm8xJHi8anROrlQQ0ZFrTp+WDfa8HeCWvnwjIKLxo+Au3L1/Rz1S9RGOllG9Sxc4hpQK75GqNEbNjetXXiQEFoS8gLmZMdXZhO4HFZWTpjazYjwryEugBA++8T6GfTmT5dllryZrE9tFOLJBots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eljkf/Mo; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eljkf/Mo"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8230c839409so203104b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681154; x=1771285954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZuEZPAPfkrspoCeOtWv8OxJuAL3HQ3zo1MJnrN+08Y=;
        b=eljkf/MoIogQQPPdyIxTM4h3QhO3tkld7eD4wpe1V213NoB5B0Uu7SD+SN9YfeoXV4
         FIEOIwoCbT47ZjFQ1quFR3BUd69zAME8Q+/kjP7iL51hzbLXLr114P32KI1EXok1PCwJ
         3sdbdGBG4Ps9N+bre/9iEPppso5+e+CqQOTxtVo7hXQQqz31UCFmYdo/nqbdYxGINclQ
         X+RwvsEqK93h3iDDWxvtaecOkj3KUzpp+Rf+KH/SCMaGm9dqI60apTQrihYxxhJopZJk
         N5UYHYGU0tzWxza/Om1g2nROkWc9l+3Ztr2Z79jdQVajHGG7xf5+AkKwGLp659FW2UH2
         Q/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681154; x=1771285954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZuEZPAPfkrspoCeOtWv8OxJuAL3HQ3zo1MJnrN+08Y=;
        b=OTinKmX3TWbAEKD5uBabSBIqVxe0NIvIkHai/8/+8+SaCxR36A8Aj2L/U4PTBZbkNh
         MrCVZIgRYYKW2LuGuyXEOmPPXXOab+03ks99tZYHZ+PuSjwqbUhlH2imOj7XAmGOUF4Q
         Q88XtRslhkfYJgN7+QFUwrcnKSH7PGHFp2dZWdZzD08fVLZy7YqrE0swF8EHpzsSQdmA
         9EcKbAdAnHPGf+a+P5uHgJVbJzRSM2WCE7e949mUAW4WQWG9y+3EmVUIkIW5Uegf/n+0
         Ch1rpef1zkhlH9PsRmFSSObGlNxBhecDhS4E3xrFOSa4AJpVpifCU8TZMkFX7wrEWSrq
         OYrA==
X-Gm-Message-State: AOJu0YzozDxmkToSiGz4MfGIMvkuMNdhdo/8wVOaJV1Gvm+cZtMMKDZo
	xb4Q40Cp8sJaGEmdkYNKr6wcElfLUXeJnCGYgB6GRaCbMiAU6Qn8oPZvdSGip2953MM=
X-Gm-Gg: AZuq6aKJToFW5ZiBidlcGtF5VJ/mdPQNdyFiTZQSPMwRkf6j1Tvzm8GSnPXkRIhrAxa
	8hyOi4YgEioInw5wUTfpzNSFwXu2VbnIokNwO1xf6VD8KJdKd7kKEHIkkTY9B31cIQHn7nchAWJ
	G6+62TGCf58GykdEohKJEaQVs7k4+3MskIUXVyM3REG/TK30I8ARbwnWrDEXz8uN9hjCPPe0Iah
	1nV3slbNZaaH0QPhIvBDpSpOrHUk0H/vEXarWdyLqfEIzg7k29Mek2WWDkzVKO82Lv6Bbh4Db3h
	mauAU/qer/NRlKTgFPgjP2ZIbNpCTgumWlZlRBa6Sv+3lcBgpoPGNVPERSM5hq+MvL8QVJQZ9gf
	qjOfZCLe+wqWC8Aap9hVN38bbkK0Eabb1ZuNK1sxP+7EBCn3EzcmJcjk4eLVE+VzkONOxCcOyE7
	aIgRCdg/C5h9o7BomUbICNLw==
X-Received: by 2002:a05:6a20:918a:b0:358:dc7d:a2be with SMTP id adf61e73a8af0-393acfe8dd3mr14022790637.17.1770681154331;
        Mon, 09 Feb 2026 15:52:34 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:52:33 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 7/7] staging: rtl8723bs: ioctl_cfg80211: remove unnecessary void * casts
Date: Tue, 10 Feb 2026 06:51:33 +0700
Message-ID: <20260209235133.1292161-8-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209235133.1292161-1-horstaufmental@gmail.com>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
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

