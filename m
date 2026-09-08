Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9EA57F733
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885594; cv=none; b=cR+sJQ1fX/1IG3qL6/kTYAgeHG33a1O1kpNMcI6e/AjhfYNEQpDEtiLFGeRBTwVkYWjEeRmbU7w3mnfzSdWYnrQC9ff8t9v20d55DOVo0AL4Q9dC5S+MpdlJLe2esgIbh+HYIpqj7NX5ceHIBxjD2og8XrthB5kyt8FEsgBFKek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885594; c=relaxed/simple;
	bh=SEvrKgPQsEB4xxPVz3ixYHLDs2imE17KTRmgx5Ucjpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvM8YjpSnAzMoP7p4X0+x0Mz9jUcn6kFJ9pmtkAlJDQNKt1h2IPbQSVqlsgOErg8Dc8SF73iLkp8BgDOEx50tNf9q48d1TcOVOmMiI1Rf/ASjvIOuPir143pgrMKtuDM4WG2lv8p4Q/10+vjUW42ol081yEUTL34yI+eg0jkWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOThdUAf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOThdUAf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so4606564a91.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885592; x=1789490392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKbaojXzm0DiqnekXTH/M8UduIHz4I4DfWkzhVidLvU=;
        b=gOThdUAf+Hn0lE1rvaEVtbQ/X7HV4BKDCcWXSHWhER/TT4V5nDoAFgo/v/O3VynbJs
         lD9oC2jV3yxpBxgp1ukSjFvRVj5WB7PIo9QBrr5Od9BK5VwrWPz1fZqlcBxX3NG41Aji
         GedZbfKUQf5Gfe2ct9dw53qcd2ye7E+Dtd1AJrpOpUVvZB0XE4KZIuKuYvJW8WjaSwEq
         PxbEd5xwtISTWKFWtKlonXTKeTGSPxkn3xp2BwnKgyGmBLNOKb9e/4/CoGeat7RaM2Oz
         jg9S6W5cQdW9WvlcIY3UWlslfIzcI+M5anyVQQSP70GFeXlNHhDHlskmke+TkgpGTTAi
         zVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885592; x=1789490392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKbaojXzm0DiqnekXTH/M8UduIHz4I4DfWkzhVidLvU=;
        b=keDZ3CR/AoZ85LwAqY7Sm1A3Vp6R0NiJFcGzBPm/l1B1fn5N5lJ68SzgpqowGAqA/z
         fpZt84c07kjzvIYW6LV8H9Blt9/RiMSFnwuVRIOq9dz572xxYxwtaG99A2A6X2N8QxWC
         6YpNdrEoiVPRSjvhE04tYeMyKabu0Uy3jMjFCE8yZcZYK65xvk+RR4Or8daTVfv3jMeF
         3Bu2l3XWxVBf8z1Vfl/M1jZKhOq9g7Qt9c1nsiIIOUsmxjEDYg6jS2gpUZmYSLGIRv4l
         PSDHVBNDRGzVZODrC9pOppHhb78Fa7PGjL+dk6KjeXeq+VeIUONCKcZQG6eQse/iYcr9
         ZS8Q==
X-Gm-Message-State: AFuF++l60TZUBFOT98kWbSwUk9QF5dhIVGke0YR2Pg1zFuwCj4sXyKFj
	uk6sti1QolI63nvzUBQXl2DS5hPDtXzM7ze5H6eCZy0K2FLnXmCqMFjxuUc0uQ==
X-Gm-Gg: AYBFou2qA8tD/MBRi9YBIpqeUmmIZx/pePKe5Ohs5FB/EjeOdDv3LQWd13ltb7Iej7U
	qzuA0LPZ1uqR4XhDMG5vGD6aBqAJzLNjZeFfV7eeVMoNLhOLBJuCGTPyKwTa4VxV94gz/cAzBS3
	zst5K3Y5mS2fyUWJrq+VwknpZ1a3lePtNy44saoo/Ym3q4k15vlRWYuB5x8kGM1pwqsNcYzyptB
	xDNktrF73pdKRa6e22G/hdXt3m2pKCVkMDjHJs7b+8Hh8eP1dHeW011F3v+xYJjoTiO98FImJJl
	owMD+o3LlU5QmcX+obrz3cBafPZt81zuHLkNDKubhsSsWpGsnw+HVZywfz1mpLcUZRHsaoBbNb3
	5FulvCQBKnsVBmNMrTLE1bIrGbH3Jywqx9X7NLtRbFbUag734ikAIiMWzqrxQrpypj19vPHoOs+
	TrQP3KbROGS7M19FJZeHaylcifpfqOC33dEqWE07JlUmuzB1XbF7R3SY/7upxiYLonn6WRWy0=
X-Received: by 2002:a17:90b:2d46:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-39b2620a25emr42313482a91.15.1788885592137;
        Tue, 08 Sep 2026 09:39:52 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm5672357eec.29.2026.09.08.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:39:51 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 2/3] staging: rtl8723bs: remove commented out code in os_dep/ files
Date: Tue,  8 Sep 2026 09:39:18 -0700
Message-Id: <20260908163919.72100-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908163919.72100-1-guojy.bj@gmail.com>
References: <20260908163919.72100-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out code in all source files in os_dep/
Remove adjacent comment where applicable.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 19 ------------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 29 ++-----------------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  1 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  1 -
 4 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4416d0ec1db9..d94095cae0b4 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -204,7 +204,6 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 {
 	struct ieee80211_channel *notify_channel;
 	struct cfg80211_bss *bss = NULL;
-	/* struct ieee80211_supported_band *band; */
 	u16 channel;
 	u32 freq;
 	u64 notify_timestamp;
@@ -232,7 +231,6 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	}
 
 	/* To reduce PBC Overlap rate */
-	/* spin_lock_bh(&pwdev_priv->scan_req_lock); */
 	if (adapter_wdev_data(padapter)->scan_request) {
 		u8 *psr = NULL, sr = 0;
 		struct ndis_802_11_ssid *pssid = &pnetwork->network.ssid;
@@ -258,7 +256,6 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 			}
 		}
 	}
-	/* spin_unlock_bh(&pwdev_priv->scan_req_lock); */
 
 	channel = pnetwork->network.configuration.ds_config;
 	freq = rtw_ieee80211_channel_to_frequency(channel);
@@ -285,7 +282,6 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	*(fctrl) = 0;
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
-	/* pmlmeext->mgnt_seq++; */
 
 	if (pnetwork->network.reserved[0] == 1) { /*  WIFI_BEACON */
 		eth_broadcast_addr(pwlanhdr->addr1);
@@ -517,7 +513,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 	} else {
 		psta = rtw_get_stainfo(pstapriv, param->sta_addr);
 		if (!psta)
-			/* ret = -EINVAL; */
 			goto exit;
 	}
 
@@ -782,7 +777,6 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 						memcpy(psta->dot11tkiprxmickey.skey, &param->u.crypt.key[24], 8);
 
 						padapter->securitypriv.busetkipkey = false;
-						/* _set_timer(&padapter->securitypriv.tkip_timer, 50); */
 					}
 
 					rtw_setstakey_cmd(padapter, psta, true, true);
@@ -846,8 +840,6 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 	switch (params->cipher) {
 	case IW_AUTH_CIPHER_NONE:
-		/* todo: remove key */
-		/* remove = 1; */
 		alg_name = "none";
 		break;
 	case WLAN_CIPHER_SUITE_WEP40:
@@ -1125,7 +1117,6 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
 		/* report network only if the current channel set contains the channel to which this network belongs */
 		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set, pnetwork->network.configuration.ds_config) >= 0
 			&& true == rtw_validate_ssid(&pnetwork->network.ssid)) {
-			/* ev =translate_scan(padapter, a, pnetwork, ev, stop); */
 			rtw_cfg80211_inform_bss(padapter, pnetwork);
 		}
 	}
@@ -1330,7 +1321,6 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 		break;
 	default:
 		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open;
-		/* return -ENOTSUPP; */
 	}
 
 	return 0;
@@ -1376,9 +1366,6 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 
 	if (ucast) {
 		psecuritypriv->ndisencryptstatus = ndisencryptstatus;
-
-		/* if (psecuritypriv->dot11_privacy_algrthm >= _AES_) */
-		/*	psecuritypriv->ndisauthtype = Ndis802_11AuthModeWPA2PSK; */
 	}
 
 	return 0;
@@ -1387,7 +1374,6 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key_mgt)
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
-		/* auth_type = UMAC_AUTH_TYPE_8021X; */
 		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
 		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
@@ -1752,8 +1738,6 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	authmode = psecuritypriv->ndisauthtype;
 	rtw_set_802_11_authentication_mode(padapter, authmode);
 
-	/* rtw_set_802_11_encryption_mode(padapter, padapter->securitypriv.ndisencryptstatus); */
-
 	if (!rtw_set_802_11_connect(padapter, (u8 *)sme->bssid, &ndis_ssid)) {
 		ret = -1;
 		goto exit;
@@ -2055,8 +2039,6 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		struct xmit_frame		*pmgntframe;
 		struct pkt_attrib	*pattrib;
 		unsigned char *pframe;
-		/* u8 category, action, OUI_Subtype, dialogToken = 0; */
-		/* unsigned char *frame_body; */
 		struct ieee80211_hdr *pwlanhdr;
 		struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -2476,7 +2458,6 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 	/* starting alloc mgmt frame to dump it */
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe) {
-		/* ret = -ENOMEM; */
 		ret = _FAIL;
 		goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..f8b0fc1c4bec 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -20,7 +20,6 @@ static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
 
 
 static int rtw_network_mode = NL80211_IFTYPE_ADHOC;/* infra, ad-hoc, auto */
-/* struct ndis_802_11_ssid	ssid; */
 static int rtw_channel = 1;/* ad-hoc support requirement */
 static int rtw_wireless_mode = WIRELESS_11BG_24N;
 static int rtw_vrtl_carrier_sense = AUTO_VCS;
@@ -31,7 +30,6 @@ static int rtw_preamble = PREAMBLE_LONG;/* long, short, auto */
 static int rtw_scan_mode = 1;/* active, passive */
 static int rtw_adhoc_tx_pwr = 1;
 static int rtw_soft_ap;
-/* int smart_ps = 1; */
 static int rtw_power_mgnt = 1;
 static int rtw_ips_mode = IPS_NORMAL;
 module_param(rtw_ips_mode, int, 0644);
@@ -48,7 +46,6 @@ static int rtw_radio_enable = 1;
 static int rtw_long_retry_lmt = 7;
 static int rtw_short_retry_lmt = 7;
 static int rtw_busy_thresh = 40;
-/* int qos_enable = 0; */
 static int rtw_ack_policy = NORMAL_ACK;
 
 static int rtw_software_encrypt;
@@ -182,7 +179,6 @@ static void loadparam(struct adapter *padapter)
 	registry_par->chip_version = (u8)rtw_chip_version;
 	registry_par->rfintfs = (u8)rtw_rfintfs;
 	registry_par->lbkmode = (u8)rtw_lbkmode;
-	/* registry_par->hci = (u8)hci; */
 	registry_par->network_mode  = (u8)rtw_network_mode;
 
 	memcpy(registry_par->ssid.ssid, "ANY", 3);
@@ -207,7 +203,6 @@ static void loadparam(struct adapter *padapter)
 	registry_par->long_retry_lmt = (u8)rtw_long_retry_lmt;
 	registry_par->short_retry_lmt = (u8)rtw_short_retry_lmt;
 	registry_par->busy_thresh = (u16)rtw_busy_thresh;
-	/* registry_par->qos_enable = (u8)rtw_qos_enable; */
 	registry_par->ack_policy = (u8)rtw_ack_policy;
 	registry_par->software_encrypt = (u8)rtw_software_encrypt;
 	registry_par->software_decrypt = (u8)rtw_software_decrypt;
@@ -274,10 +269,7 @@ static int rtw_net_set_mac_address(struct net_device *pnetdev, void *p)
 	struct sockaddr *addr = p;
 
 	if (!padapter->bup) {
-		/* addr->sa_data[4], addr->sa_data[5]); */
 		memcpy(padapter->eeprompriv.mac_addr, addr->sa_data, ETH_ALEN);
-		/* eth_hw_addr_set(pnetdev, addr->sa_data); */
-		/* padapter->bset_hwaddr = true; */
 	}
 
 	return 0;
@@ -289,8 +281,8 @@ static struct net_device_stats *rtw_net_get_stats(struct net_device *pnetdev)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
-	padapter->stats.tx_packets = pxmitpriv->tx_pkts;/* pxmitpriv->tx_pkts++; */
-	padapter->stats.rx_packets = precvpriv->rx_pkts;/* precvpriv->rx_pkts++; */
+	padapter->stats.tx_packets = pxmitpriv->tx_pkts;
+	padapter->stats.rx_packets = precvpriv->rx_pkts;
 	padapter->stats.tx_dropped = pxmitpriv->tx_drop;
 	padapter->stats.rx_dropped = precvpriv->rx_drop;
 	padapter->stats.tx_bytes = pxmitpriv->tx_bytes;
@@ -409,7 +401,6 @@ int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
 		return 1;
 	}
 	netif_carrier_off(pnetdev);
-	/* rtw_netif_stop_queue(pnetdev); */
 
 	return 0;
 }
@@ -431,11 +422,8 @@ struct net_device *rtw_init_netdev(struct adapter *old_padapter)
 	padapter = rtw_netdev_priv(pnetdev);
 	padapter->pnetdev = pnetdev;
 
-	/* pnetdev->init = NULL; */
-
 	pnetdev->netdev_ops = &rtw_netdev_ops;
 
-	/* pnetdev->tx_timeout = NULL; */
 	pnetdev->watchdog_timeo = HZ * 3; /* 3 second timeout */
 
 	/* step 2. */
@@ -512,7 +500,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 	pxmitpriv->vcs_setting = pregistrypriv->vrtl_carrier_sense;
 	pxmitpriv->vcs = pregistrypriv->vcs_type;
 	pxmitpriv->vcs_type = pregistrypriv->vcs_type;
-	/* pxmitpriv->rts_thresh = pregistrypriv->rts_thresh; */
 	pxmitpriv->frag_len = pregistrypriv->frag_thresh;
 
 	/* recv_priv */
@@ -520,9 +507,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 	/* mlme_priv */
 	pmlmepriv->scan_mode = SCAN_ACTIVE;
 
-	/* qos_priv */
-	/* pmlmepriv->qospriv.qos_option = pregistrypriv->wmm_enable; */
-
 	/* ht_priv */
 	pmlmepriv->htpriv.ampdu_enable = false;/* set to disabled */
 
@@ -659,9 +643,6 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 		goto free_xmit_priv;
 	spin_lock_init(&padapter->security_key_mutex);
 
-	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
-	/* memset((unsigned char *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */
-
 	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)
 		goto free_recv_priv;
 
@@ -730,8 +711,6 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
 
 	rtw_free_pwrctrl_priv(padapter);
 
-	/* kfree((void *)padapter); */
-
 	rtw_hal_data_deinit(padapter);
 
 	/* free the old_pnetdev */
@@ -862,13 +841,11 @@ int netdev_open(struct net_device *pnetdev)
 static int  ips_netdrv_open(struct adapter *padapter)
 {
 	int status = _SUCCESS;
-	/* struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter); */
 
 	padapter->net_closed = false;
 
 	padapter->driver_stopped = false;
 	padapter->bCardDisableWOHSM = false;
-	/* padapter->bup = true; */
 
 	status = rtw_hal_init(padapter);
 	if (status == _FAIL)
@@ -930,7 +907,6 @@ static int netdev_close(struct net_device *pnetdev)
 	struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
 
 	if (pwrctl->bInternalAutoSuspend) {
-		/* rtw_pwr_wakeup(padapter); */
 		if (pwrctl->rf_pwrstate == rf_off)
 			pwrctl->ps_flag = true;
 	}
@@ -1068,7 +1044,6 @@ static void rtw_suspend_normal(struct adapter *padapter)
 
 	rtw_dev_unload(padapter);
 
-	/* sdio_deinit(adapter_to_dvobj(padapter)); */
 	if (padapter->intf_deinit)
 		padapter->intf_deinit(adapter_to_dvobj(padapter));
 }
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index e9a2f3f7ec74..15a55c05bdb4 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -433,7 +433,6 @@ s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 		return err;
 
 	func = psdio->func;
-/*	size = sdio_align_size(func, cnt); */
 
 	if (unlikely((cnt == 1) || (cnt == 2))) {
 		int i;
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 3b6029c20d50..ad73b528d220 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -165,7 +165,6 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 			}
 		} else {
 			pxmitpriv->tx_drop++;
-			/* dev_kfree_skb_any(skb); */
 			return false;	/*  Caller shall tx this multicast frame via normal way. */
 		}
 	}
-- 
2.34.1

