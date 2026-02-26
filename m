Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7839A25D1E9
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115251; cv=none; b=DQWpXAYa+1cf0HapCIrD0V7kc/z18gPuDvk4Y+zUUrL+tOgrXT/bxRL8T0IE+7J/Luu1efEEyTuoAANE1wTAWtDKZoNdjz1Lv7BwLXFHhCXaqamoco2fTrboedGXTjkVWtnR3RM+uYg3/Z9G0BbS/xorqn526DLz0PtSIKjZ6YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115251; c=relaxed/simple;
	bh=7d0Z6n85efDENcql1JXFKWlMWnCFj3UqoI+o53fEDnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pN5QbSHBzDuJpVCrYMKNueoE8U+Zbmrll3aLWiqckPj4ItTHoIfcrVlfKSPigOj7Hmrf/K5KMX9sT2tq1bTWvgDve3Dxom1A1KRVlx1SNkI6sDHGVsp6VeWtXzuy4w9z2rg/Bdk+RZtuBuM2E9yiUUQnVcpU3KAmI2zeoA3Nxc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoKRA0Ps; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoKRA0Ps"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64c9a6d68e5so584684d50.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 06:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772115249; x=1772720049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrD/m5O0NdO0Atz2QOQ4FEtgeJXcWcpmzKjneNfXSBQ=;
        b=eoKRA0PsTgbJAD3I8bUpvrpqn7qjXpqKTeExWdvxia/DkEUr3ZCtNT+K3CQFCznBb6
         YtAZlEp2QhUoJX10l/qGb2MKeVDwZ4GoxPW4EgplTWi3gOOOuza75twjgYn6ttIfPd+U
         yL8JbEFWffxxh+yan3Ayk+BNLNx+tUdD3D0CMlCr47WRO5K2dmX91hYRsRncI1ZWLcwo
         EPX0P0EyRhlSik5CLRSRrg5aNgiu0bTdBsM5xKZ5PB5l2gMQQgVbuuEF4cUIF9f4rkrM
         c2gZa8fOF9Lyb5oTv1y1v58RgWBHrmE82q6sP9ZzY3UMiXt7xxcjUwVfjTm10w8EII4a
         iqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772115249; x=1772720049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrD/m5O0NdO0Atz2QOQ4FEtgeJXcWcpmzKjneNfXSBQ=;
        b=mjcA4aEARMhUmGPXUZbm6GIOiIK7hFfPFmuX7jxDzsrphlHbOFv0hO21rGd/vJsq5i
         FinN2wV0S5m+ZIKSp6/DvNd0XLm+ggZxSjPFrSXw39fzzrO4VSwuchZ0J9HDdC561uOS
         p8ntljosu44TaErlowBynv1ssK1xRjrqmCR7jr9682eoqU6R6Ta3xu9qGfedWeKKc1TR
         WG0plHw461oJeSIA7bx7uQdphekYjYVvIRwfnECuSNDRw60V9JP57TS25pYMJF8FzDwb
         tbJtbACwkLgkJgYoGwKzmB/qL5iySk8Qw79GIUKTSiD0cY/WP1MpWiFkNlPD39Vi0ZcQ
         X0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgfcQEIviWWiSsU/AHt+AZ9e2ytzXnVAEgbjp5esdzO0LuiiMOStW6qwQGJTXFKD4yf5Ty9RdwAQY8WImT@lists.linux.dev
X-Gm-Message-State: AOJu0YwZK1pkwb/amqAwAk/387sEaPy7URl89DXXOB0fbyae0AP6Or4R
	rueXErq1r/fOiwKhF5zvcdmivIVquPETZDcnGe28Xek3pQvLtb1leFqj
X-Gm-Gg: ATEYQzxVhACrydpnAVF3OGBXEIWjxsV7f/bvmh501LKaX3ZqMXcmlysMl9mzvbiQT58
	9obgxFEolAOjmqCxSAw5v4OVLFkbe9BGiejf8T3zVx2S2788IoWseXKCUTBRwpKyTbMZ1zSnwWe
	rmu4f6mouH8vkIBT29LSklkbGUf7le/V7HwQuE88BorNol+KDRU8/0G598u280oQEs/tZG/lsBp
	j9hHZGE9DmtqD7V2eDIHshyBZr2gHgw+uW7KIvcngCvVja5nXuN139NZA56Lq2xGXVWEB+6jYN3
	SkzC8Pci3zkgw/RGzUotOTgZFal0y8RPFYs1UvksA+Rg+xWW51Q4rReUbLuuIwFSm6e+hhUu8sm
	cMyNpIpN6hi3NTmtGkGk5zG9MgA+SUiF3nw7u+JVUtMeB2KgPfSzGi//9mNrlwdjAjcGFEIx9VK
	Oa5mWCjpngHeYsu96P/S/Q+w==
X-Received: by 2002:a05:690e:414a:b0:649:b216:c8b8 with SMTP id 956f58d0204a3-64cb7bf562dmr1622226d50.4.1772115249277;
        Thu, 26 Feb 2026 06:14:09 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb75ae57esm985960d50.9.2026.02.26.06.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:14:08 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused 'ratelen' parameter from rtw_check_network_type()
Date: Thu, 26 Feb 2026 17:10:40 +0300
Message-ID: <20260226141333.9909-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_check_network_type() function takes a 'ratelen' parameter, but
does not use it in any way. Also remove the local variable in rtw_ap.c
created just to pass a value to this unused parameter.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        | 5 +----
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3e62fc8f61cf..8be29bbebd41 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -367,7 +367,6 @@ void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 void update_bmc_sta(struct adapter *padapter)
 {
 	unsigned char network_type;
-	int support_rate_num = 0;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -391,9 +390,7 @@ void update_bmc_sta(struct adapter *padapter)
 		memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 		/* prepare for add_ratid */
-		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-						      support_rate_num,
 						      pcur_network->configuration.ds_config
 		);
 		if (is_supported_tx_cck(network_type)) {
@@ -890,7 +887,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		support_rate_num += ie_len;
 	}
 
-	network_type = rtw_check_network_type(support_rate, support_rate_num, channel);
+	network_type = rtw_check_network_type(support_rate, channel);
 
 	rtw_set_supported_rate(pbss_network->supported_rates, network_type);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index dbd4bcc8cd28..a657c963ff52 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -94,7 +94,7 @@ bool rtw_is_cckratesonly_included(u8 *rate)
 	return true;
 }
 
-int rtw_check_network_type(unsigned char *rate, int ratelen, int channel)
+int rtw_check_network_type(unsigned char *rate, int channel)
 {
 	if (channel > 14)
 		return WIRELESS_INVALID;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a631fe323157..38c673e31313 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4886,7 +4886,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	rtw_hal_update_sta_rate_mask(padapter, psta);
 
 	/*  ToDo: HT for Ad-hoc */
-	psta->wireless_mode = rtw_check_network_type(psta->bssrateset, psta->bssratelen, pmlmeext->cur_channel);
+	psta->wireless_mode = rtw_check_network_type(psta->bssrateset, pmlmeext->cur_channel);
 	psta->raid = networktype_to_raid_ex(padapter, psta);
 
 	/* rate radaptive */
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 97fd5f75096b..8ec14e8d4c89 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -778,7 +778,7 @@ bool rtw_is_cckrates_included(u8 *rate);
 
 bool rtw_is_cckratesonly_included(u8 *rate);
 
-int rtw_check_network_type(unsigned char *rate, int ratelen, int channel);
+int rtw_check_network_type(unsigned char *rate, int channel);
 
 void rtw_get_bcn_info(struct wlan_network *pnetwork);
 
-- 
2.53.0

