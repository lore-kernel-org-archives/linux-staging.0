Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CBF42884D
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284185; cv=none; b=r1cpKk66lDnqjM1HF3LgQ2eGTNsbjSm3QfJMTFQzuBOcO9V9vhC6IN2o4s8/o2RVvC1TAIaiHlKTYwXlLR3CKBRoQTAab9ip+HvfLZ4N4yh0qS9rUsoLcNJuc/cUyLE3thArzIjCPuRnopbmZQa5W8fsSoKxY5EXmXM3LGf81X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284185; c=relaxed/simple;
	bh=Y7h2EEWaNOMcQ56DFdTdWMBktUhBt9VTX2gZTaXLmwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BArQMwWv+9IJt9BF+7ZD26nwYpTe0ZuYEyFTHwsRAF2+D92vJexcNT3VRM8wjaggwDwIzDw/DDKZ0ZahBkh2TAeKpnJ6FdZftPwn36A+GhHHZGBW3X5wrLgSkkqPaCSS8BghZ9vFXThgh1voV9itITPtkf/I/8U4nYtDxpnbqNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhwqYxcP; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhwqYxcP"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79827d28fc4so28732547b3.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772284183; x=1772888983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DQCCOesD1gd953wVYJWwZKg6TYjtjXghn2JiF3fA40=;
        b=jhwqYxcPHov6hdf9iS2WhBInqHdeESXfro5HanPpPCqsL1ufPzwG+UMHNNsGf+rKbg
         WB/vykh/BqsFNVkH7vko2eMVSX498AWIanBE0xpVwC88LX+HobrFQACXs5j4LngY25p9
         GlO/8yTGS0h/QDav8a6rddmSiVqiQANc0dRGxONLpQmAE99+L0pDXDmJGIpHadzh4wR+
         v/86U1c4Er/fu2hn/SKYAq2j4A0aqbxq5pZAnIKVCxUKqJtORdafGpA9g5cJ7rtx90+l
         8UHYM1h/p+ws9kNRW3b6seUvw+iqybwryNQAOYAizFEF5kGIBPkHKPpavpTeyK/ZsUHt
         9Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772284183; x=1772888983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DQCCOesD1gd953wVYJWwZKg6TYjtjXghn2JiF3fA40=;
        b=j5QvZXoanKzh5GU1EDYd4FuxJ8Fpolse5yhR/RedD7jJXB4vaJJ1/fpMz+NFALOt33
         F4vmHMwxzMXqKLcI3yNaPGJABBPY8c7ZKSSihPTh0wknDYv5F5VOhLXrEwDggMNv9v1D
         2+To2r4xsmzpASJbJQH51p8qCQwKiyItAJoCuBVZ+WeO4aHmZbmgwuG/CIy4Aa227R17
         9zr7RdEUzhQVcq7emC+j8ZOASwSIkDlMa+49t0qh6ihk7bAt8I6PXM6kSaY+8wEokY8B
         bqWfWOMaQzHEjEYCFO8l20bmCfnzlZ50APfhYwRZZHSR9SyQeP+4Wbu/59y6fvZV033X
         Np5A==
X-Forwarded-Encrypted: i=1; AJvYcCXuTNzY2g/fMxA3c2IkCLhDue2oz0quAus8sDhGgyomOfKm6+htHOXcmwB6WEa2hm9sgVfXshegID8kZQhd@lists.linux.dev
X-Gm-Message-State: AOJu0YwJnunR+6c3sn6XEN7J/TGzDHC+D3zRaxMRXhmGYAE+7QTLkEbN
	CutSBN2X+QNBXeW/Tu3s6ibcL95HUG4+rZ/Z2fbtm6rTB7kjNNpqWJYpoZVtHg==
X-Gm-Gg: ATEYQzy005YAaa0ODZM4AkMeP11MtgCdRmmUZmoNazwob8cfxZ2WWlJYakM5v3y33qg
	agkDG27/2NZFzzI/YutzOt9ew62lDge9VvQ5fI5n82kHW4DDteOW++aUCv4tPGW9fphnandHJKt
	6kZNg4DZGULvD3Sh/ZXxhGUowmgwJQcioqmQAgsDk9fkmK5oAiyzDM9SiXQA0gCJ8PGQ2+srmKi
	d77FDLM110aAx3UVCHYoCAs5Lvxux7Ur4XOYH8DwZu9NzlEOYO2jNOIhr908D2DGCTG6/rsC99O
	uT/3xxIFmlgO/DAVl5P4aReSrvHeOuSOgpZH+J9Wqn3xHbQidvrWIXi86131qE0hbLOqW79XlCN
	xIGq6fibTuoSkvVarl928APCXx1F81M+KvwYCHJB/TtBYyBP68sMMt6n/xLmp6qHAott8nScXrA
	LBxfT8TdVbZ/MegEQR9Xlp27DP
X-Received: by 2002:a05:690c:dd5:b0:796:3981:fd6e with SMTP id 00721157ae682-79885475a07mr59820057b3.10.1772284183248;
        Sat, 28 Feb 2026 05:09:43 -0800 (PST)
Received: from archlinux ([185.140.163.152])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c47f82sm31299257b3.36.2026.02.28.05.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:09:42 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unused 'ratelen' parameter from rtw_check_network_type()
Date: Sat, 28 Feb 2026 16:09:06 +0300
Message-ID: <20260228130917.4123-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226141333.9909-1-nikolayof23@gmail.com>
References: <20260226141333.9909-1-nikolayof23@gmail.com>
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

Changes in v2:
	- remove the last 'support_rate_num' increment which is not
	  used anywhere in rtw_check_beacon_data() in rtw_ap.c

 drivers/staging/rtl8723bs/core/rtw_ap.c        | 9 ++-------
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 2 +-
 4 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3e62fc8f61cf..d6aa52f859df 100644
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
@@ -885,12 +882,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       WLAN_EID_EXT_SUPP_RATES,
 		       &ie_len,
 		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
-	if (p) {
+	if (p)
 		memcpy(support_rate + support_rate_num, p + 2, ie_len);
-		support_rate_num += ie_len;
-	}
 
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

