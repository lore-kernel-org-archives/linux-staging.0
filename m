Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825483E3167
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494638; cv=none; b=K4u2KzD9UsEMO5leS0sKfLBW51dXw4fHZQp5aJ7sNS/0++3Yxbop2KRu55KVT7RzOcQFKP5oi3j0hTAJWdm92mc8AGLeN0w8RBvm7nw18ysgc2tJK0PQEnwryC/vPimd5uREnK6MQNikR4/0afHxBUVWLpFvqTXynPAjPhzRgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494638; c=relaxed/simple;
	bh=8NYAjLgJIEhHKmTFcmIL6Hcii1yiTG1TFc24NNBIVME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cbs9evcdjNkJ/ZCkIN2Yci/4r7+UfKGRp2xCu/A8YLV3BovL9B99xPyE8X9Enr7LiiI64gdgAd8Re5kb8XvlyqGmkwjeAARP5jGtLD4hZfpwLrdFzPu0KRnB/Y/UlnXvzePura8++SZ+v6k97CxBU/27nD5OemHbrMdEPvdppZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=og7NTCmS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="og7NTCmS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so185613f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494623; x=1786099423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USqDcpKYDPbvIaJCKxv2oi3H9relOD9ZBbNL1tR7fVk=;
        b=og7NTCmSmJaYt29D9QIcVAueioykVGR6R0KMOxZkpcuV/Y5Bmp2bPr/4BbyuL5UqJF
         u2UEgsY16BxyZ4pC1GHaveU+VAok3mRv8DhyJs96E9G5Md9vD+sz0zjg+uCh8CglXpG4
         P8k0oKTWbACOwe0BlAEWL317CmDlyrGViPkpPYlAw8WQlO4sBQ2DtnzQI5GbiqmVRQfP
         HBUJ8B2t54fEmGXc678OC0FkxGMDUFLO+F6tjNz6DHisUZKQUKoN91LQRHN/N0RVb8s3
         WpCKpUQN7h6k52KF9G0arPRpm0p3WU7E7q+Bs5K6QLWPT1OP1Q5q9OKPV9Mvw6sjd6XD
         gNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494623; x=1786099423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=USqDcpKYDPbvIaJCKxv2oi3H9relOD9ZBbNL1tR7fVk=;
        b=ipveOfaZ4Ks2+9bbSTQL6ZKAV9EAK4g17aD6UqbRRZXjMGJPlLUqwcsfwQKvZKPgdX
         ZeyP9mNS5p65yAdLMhB/eYENqfrkW2txs6ghCvQ3T07a9N3Ken6nEVOEhCfFOcYm4FUg
         OZltvEYB7VSdp6SraJBtXum2lO31P5cl6z1GhRqQ7sgEEMUrhq6/GfzoEua2m/ifIAbd
         c3D2o/NNdEsxR7p6vBuWYk0D7rqGtaLw0RNittEZTq46mquQMARa2RInOwfZzBcZtbs1
         2vx3TQPDkM+M42NSFgjTYl/c/zsYfGjhq1u8TRncKGVbZnR9+dRSah9sieJXt7PK3BsY
         4jPg==
X-Forwarded-Encrypted: i=1; AHgh+RoxK/2Tpe1cmuSYBVGZtJTEPpXvpbymGKnN1aPGADdxFyvomNpFjgb6i9f++zF3DOUbsMHS/cHJP9OXbd+U@lists.linux.dev
X-Gm-Message-State: AOJu0YxajAzSOtwsxM63pk25+EdUiuUJZmOhNyAY0eJBKrx088WlteJz
	spHqLtuKRXlRZmbhMTQOhGMO0hFV+jIAkCHs9Rl+AzYpGP/fQQeMgY5A
X-Gm-Gg: AR+sD10TxlNdaZ592gArEWjrl185N5fmkS6re+lVqSl+ZHONOw4P6QEQYRFwrDjN4If
	56ZNRThq/MoJ4y9fHSCX3GTMAhoFXxGWjoZOqdUAMWTxybr1LK6KFSvCtAsXo2bvcnLxkbOiwl4
	e02uZvbuxWD4qNb7jEbNrts3C/x0SfonmF1V47HklhXbVD7+aY95BV1KLsBzPTn/cEKJHf+aflc
	RmrYl0PEGARelEuN1jjswHcnmvss0CctGjAWmWpVfq5IM/txgoA1S0XWsVZyNhHcoLMTiojGw5r
	/htjBzsoWVTfTkpe96tvQ/Ch4CE4Yx/6H5Brl9aIBkhtVTYa/U7wx8/I1btVkGdwGI8to/RfZHC
	0jtK52Qw8u+uaFlE0EKcjNhFmU6bb+FmJCT8VtsubfEVGAFDCqyDM9zT8vRkh+OAeSwGhsbKJBu
	h1xom9ZfMtunU6jhqCkIz6yn2hJ9dPspRa09Bk0fVirbcMpfInJBXzd0U3mvwBGPTWbQPP5Hl6t
	LtE+zrZk3vn1PD6tlRRnhWVOjDDwMwtQ2QfdrkTUSDKuo4ZEdO7
X-Received: by 2002:a05:6000:25f2:b0:47f:97e9:fe4a with SMTP id ffacd0b85a97d-47fd2b56517mr3499363f8f.43.1785494622560;
        Fri, 31 Jul 2026 03:43:42 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:42 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 05/11] staging: rtl8723bs: renaming variable padapter in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:28 +0000
Message-ID: <20260731104134.12754-6-fliegbert2@gmail.com>
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

Renaming occurrences of padapter to adapter since the prefix p is an
old naming convention to indicate a pointer variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 268 +++++++++++-----------
 1 file changed, 134 insertions(+), 134 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 761cbff86bbb..e46e137a1adf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -27,9 +27,9 @@ static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
 	rtw_clear_scan_deny(adapter);
 }
 
-static void rtw_init_mlme_timer(struct adapter *padapter)
+static void rtw_init_mlme_timer(struct adapter *adapter)
 {
-	struct	mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct	mlme_priv *mlme_priv = &adapter->mlmepriv;
 
 	timer_setup(&mlme_priv->assoc_timer, _rtw_join_timeout_handler, 0);
 	timer_setup(&mlme_priv->scan_to_timer, rtw_scan_timeout_handler, 0);
@@ -39,15 +39,15 @@ static void rtw_init_mlme_timer(struct adapter *padapter)
 		    _rtw_set_scan_deny_timer_hdl, 0);
 }
 
-int rtw_init_mlme_priv(struct adapter *padapter)
+int rtw_init_mlme_priv(struct adapter *adapter)
 {
 	int i;
 	u8 *buf;
 	struct wlan_network *pnetwork;
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	int res = _SUCCESS;
 
-	mlme_priv->nic_hdl = (u8 *)padapter;
+	mlme_priv->nic_hdl = (u8 *)adapter;
 
 	mlme_priv->pscanned = NULL;
 	mlme_priv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
@@ -82,7 +82,7 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
 
-	rtw_clear_scan_deny(padapter);
+	rtw_clear_scan_deny(adapter);
 
 	#define RTW_ROAM_SCAN_RESULT_EXP_MS 5000
 	#define RTW_ROAM_RSSI_DIFF_TH 10
@@ -97,7 +97,7 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 	mlme_priv->roam_rssi_diff_th = RTW_ROAM_RSSI_DIFF_TH;
 	mlme_priv->roam_scan_int_ms = RTW_ROAM_SCAN_INTERVAL_MS;
 
-	rtw_init_mlme_timer(padapter);
+	rtw_init_mlme_timer(adapter);
 
 exit:
 
@@ -243,11 +243,11 @@ struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 	return pnetwork;
 }
 
-void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
+void rtw_free_network_queue(struct adapter *adapter, u8 isfreeall)
 {
 	struct list_head *phead, *plist, *tmp;
 	struct wlan_network *pnetwork;
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct __queue *scanned_queue = &mlme_priv->scanned_queue;
 
 	spin_lock_bh(&scanned_queue->lock);
@@ -262,10 +262,10 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 	spin_unlock_bh(&scanned_queue->lock);
 }
 
-bool rtw_if_up(struct adapter *padapter)
+bool rtw_if_up(struct adapter *adapter)
 {
-	if (padapter->driver_stopped || padapter->bSurpriseRemoved ||
-	    !check_fwstate(&padapter->mlmepriv, _FW_LINKED))
+	if (adapter->driver_stopped || adapter->bSurpriseRemoved ||
+	    !check_fwstate(&adapter->mlmepriv, _FW_LINKED))
 		return false;
 
 	return true;
@@ -307,11 +307,11 @@ void rtw_free_mlme_priv(struct mlme_priv *mlme_priv)
 	_rtw_free_mlme_priv(mlme_priv);
 }
 
-void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
-void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
+void rtw_free_network_nolock(struct adapter *adapter, struct wlan_network *pnetwork);
+void rtw_free_network_nolock(struct adapter *adapter, struct wlan_network *pnetwork)
 {
-	_rtw_free_network_nolock(&padapter->mlmepriv, pnetwork);
-	rtw_cfg80211_unlink_bss(padapter, pnetwork);
+	_rtw_free_network_nolock(&adapter->mlmepriv, pnetwork);
+	rtw_cfg80211_unlink_bss(adapter, pnetwork);
 }
 
 /*
@@ -406,7 +406,7 @@ struct wlan_network *rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-		    struct adapter *padapter, bool update_ie)
+		    struct adapter *adapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -417,10 +417,10 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
+	if (check_fwstate(&adapter->mlmepriv, _FW_LINKED) && is_same_network(&adapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
-		ss_final = padapter->recvpriv.signal_strength;
-		sq_final = padapter->recvpriv.signal_qual;
+		ss_final = adapter->recvpriv.signal_strength;
+		sq_final = adapter->recvpriv.signal_qual;
 		/* the rssi value here is undecorated, and will be used for antenna diversity */
 		if (sq_smp != 101) /* from the right channel */
 			rssi_final = (src->rssi + dst->rssi * 4) / 5;
@@ -856,69 +856,69 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 }
 
 /* rtw_indicate_connect: the caller has to lock mlme_priv->lock */
-void rtw_indicate_connect(struct adapter *padapter)
+void rtw_indicate_connect(struct adapter *adapter)
 {
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
 	mlme_priv->to_join = false;
 
-	if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
+	if (!check_fwstate(&adapter->mlmepriv, _FW_LINKED)) {
 		set_fwstate(mlme_priv, _FW_LINKED);
 
 		if (check_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE) ||
 		    check_fwstate(mlme_priv, WIFI_ADHOC_STATE))
-			rtw_cfg80211_ibss_indicate_connect(padapter);
+			rtw_cfg80211_ibss_indicate_connect(adapter);
 		else
-			rtw_cfg80211_indicate_connect(padapter);
+			rtw_cfg80211_indicate_connect(adapter);
 
-		netif_carrier_on(padapter->pnetdev);
+		netif_carrier_on(adapter->pnetdev);
 
-		if (padapter->pid[2] != 0)
-			rtw_signal_process(padapter->pid[2], SIGALRM);
+		if (adapter->pid[2] != 0)
+			rtw_signal_process(adapter->pid[2], SIGALRM);
 	}
 
-	rtw_set_to_roam(padapter, 0);
-	rtw_set_scan_deny(padapter, 3000);
+	rtw_set_to_roam(adapter, 0);
+	rtw_set_scan_deny(adapter, 3000);
 }
 
 /* rtw_indicate_disconnect: the caller has to lock mlme_priv->lock */
-void rtw_indicate_disconnect(struct adapter *padapter)
+void rtw_indicate_disconnect(struct adapter *adapter)
 {
-	struct	mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct	mlme_priv *mlme_priv = &adapter->mlmepriv;
 
 	_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING | WIFI_UNDER_WPS);
 
-	if (rtw_to_roam(padapter) > 0)
+	if (rtw_to_roam(adapter) > 0)
 		_clr_fwstate_(mlme_priv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || rtw_to_roam(padapter) <= 0) {
+	if (check_fwstate(&adapter->mlmepriv, _FW_LINKED) || rtw_to_roam(adapter) <= 0) {
 		/*  Do it first for tx broadcast pkt after disconnection issue! */
-		netif_carrier_off(padapter->pnetdev);
+		netif_carrier_off(adapter->pnetdev);
 
-		rtw_cfg80211_indicate_disconnect(padapter);
+		rtw_cfg80211_indicate_disconnect(adapter);
 
-		rtw_reset_securitypriv_cmd(padapter);
+		rtw_reset_securitypriv_cmd(adapter);
 
 		/* set ips_deny_time to avoid enter IPS before LPS leave */
-		rtw_set_ips_deny(padapter, 3000);
+		rtw_set_ips_deny(adapter, 3000);
 
 		_clr_fwstate_(mlme_priv, _FW_LINKED);
 
-		rtw_clear_scan_deny(padapter);
+		rtw_clear_scan_deny(adapter);
 	}
 
-	rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_DISCONNECT, 1);
+	rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_DISCONNECT, 1);
 }
 
-inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
+inline void rtw_indicate_scan_done(struct adapter *adapter, bool aborted)
 {
-	rtw_cfg80211_indicate_scan_done(padapter, aborted);
+	rtw_cfg80211_indicate_scan_done(adapter, aborted);
 
-	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
-	    (!check_fwstate(&padapter->mlmepriv,
+	if ((!adapter_to_pwrctl(adapter)->bInSuspend) &&
+	    (!check_fwstate(&adapter->mlmepriv,
 			    WIFI_ASOC_STATE | WIFI_UNDER_LINKING))) {
-		rtw_set_ips_deny(padapter, 0);
-		_set_timer(&padapter->mlmepriv.dynamic_chk_timer, 1);
+		rtw_set_ips_deny(adapter, 0);
+		_set_timer(&adapter->mlmepriv.dynamic_chk_timer, 1);
 	}
 }
 
@@ -944,13 +944,13 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = false;
 }
 
-static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
+static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *adapter, struct wlan_network *pnetwork)
 {
 	int i;
 	struct sta_info *bmc_sta, *psta = NULL;
 	struct recv_reorder_ctrl *preorder_ctrl;
-	struct sta_priv *pstapriv = &padapter->stapriv;
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct sta_priv *pstapriv = &adapter->stapriv;
+	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	psta = rtw_get_stainfo(pstapriv, pnetwork->network.mac_address);
 	if (!psta)
@@ -960,27 +960,27 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 		psta->aid = pnetwork->join_res;
 
-		update_sta_info(padapter, psta);
+		update_sta_info(adapter, psta);
 
 		/* update station supportRate */
 		psta->bssratelen = rtw_get_rateset_len(pnetwork->network.supported_rates);
 		memcpy(psta->bssrateset, pnetwork->network.supported_rates, psta->bssratelen);
-		rtw_hal_update_sta_rate_mask(padapter, psta);
+		rtw_hal_update_sta_rate_mask(adapter, psta);
 
 		psta->wireless_mode = pmlmeext->cur_wireless_mode;
-		psta->raid = networktype_to_raid_ex(padapter, psta);
+		psta->raid = networktype_to_raid_ex(adapter, psta);
 
 		/* sta mode */
-		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
+		rtw_hal_set_odm_var(adapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
-			padapter->securitypriv.binstallGrpkey = false;
-			padapter->securitypriv.busetkipkey = false;
-			padapter->securitypriv.bgrpkey_handshake = false;
+		if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
+			adapter->securitypriv.binstallGrpkey = false;
+			adapter->securitypriv.busetkipkey = false;
+			adapter->securitypriv.bgrpkey_handshake = false;
 
 			psta->ieee8021x_blocked = true;
-			psta->dot118021XPrivacy = padapter->securitypriv.dot11_privacy_algrthm;
+			psta->dot118021XPrivacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
 
@@ -995,9 +995,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 		/* When doing the WPS, the wps_ie_len won't equal to 0 */
 		/* And the Wi-Fi driver shouldn't allow the data packet to be transmitted. */
-		if (padapter->securitypriv.wps_ie_len != 0) {
+		if (adapter->securitypriv.wps_ie_len != 0) {
 			psta->ieee8021x_blocked = true;
-			padapter->securitypriv.wps_ie_len = 0;
+			adapter->securitypriv.wps_ie_len = 0;
 		}
 
 		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
@@ -1011,7 +1011,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
 		}
 
-		bmc_sta = rtw_get_bcmc_stainfo(padapter);
+		bmc_sta = rtw_get_bcmc_stainfo(adapter);
 		if (bmc_sta) {
 			for (i = 0; i < 16 ; i++) {
 				preorder_ctrl = &bmc_sta->recvreorder_ctrl[i];
@@ -1028,10 +1028,10 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan,
+static void rtw_joinbss_update_network(struct adapter *adapter, struct wlan_network *ptarget_wlan,
 				       struct wlan_network *pnetwork)
 {
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct wlan_network *cur_network = &mlme_priv->cur_network;
 
 	/*  why not use ptarget_wlan?? */
@@ -1042,14 +1042,14 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 
 	cur_network->aid = pnetwork->join_res;
 
-	rtw_set_signal_stat_timer(&padapter->recvpriv);
+	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
-	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
-	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
+	adapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
+	adapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
 	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
-	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
+	adapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
-	rtw_set_signal_stat_timer(&padapter->recvpriv);
+	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	/* update fw_state will clr _FW_UNDER_LINKING here indirectly */
 	switch (pnetwork->network.infrastructure_mode) {
@@ -1072,10 +1072,10 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	if (cur_network->network.ie_length < sizeof(struct ndis_802_11_fix_ie))
 		return;
 
-	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
+	rtw_update_protection(adapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length - sizeof(struct ndis_802_11_fix_ie)));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(adapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list backupPMKIDList[NUM_PMKID_CACHE];
@@ -1480,18 +1480,18 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 	spin_unlock_bh(&mlme_priv->lock);
 }
 
-void rtw_cpwm_event_callback(struct adapter *padapter, u8 *buf)
+void rtw_cpwm_event_callback(struct adapter *adapter, u8 *buf)
 {
 	struct reportpwrstate_parm *preportpwrstate;
 
 	preportpwrstate = (struct reportpwrstate_parm *)buf;
-	preportpwrstate->state |= (u8)(adapter_to_pwrctl(padapter)->cpwm_tog + 0x80);
-	cpwm_int_hdl(padapter, preportpwrstate);
+	preportpwrstate->state |= (u8)(adapter_to_pwrctl(adapter)->cpwm_tog + 0x80);
+	cpwm_int_hdl(adapter, preportpwrstate);
 }
 
-void rtw_wmm_event_callback(struct adapter *padapter, u8 *buf)
+void rtw_wmm_event_callback(struct adapter *adapter, u8 *buf)
 {
-	WMMOnAssocRsp(padapter);
+	WMMOnAssocRsp(adapter);
 }
 
 /*
@@ -1575,15 +1575,15 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	}
 }
 
-static void rtw_auto_scan_handler(struct adapter *padapter)
+static void rtw_auto_scan_handler(struct adapter *adapter)
 {
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	rtw_mlme_reset_auto_scan_int(padapter);
+	rtw_mlme_reset_auto_scan_int(adapter);
 
 	if (mlme_priv->auto_scan_int_ms != 0 &&
 	    jiffies_to_msecs(jiffies - mlme_priv->scan_start_time) > mlme_priv->auto_scan_int_ms) {
-		if (!padapter->registrypriv.wifi_spec) {
+		if (!adapter->registrypriv.wifi_spec) {
 			if (check_fwstate(mlme_priv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
 
@@ -1591,7 +1591,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 				goto exit;
 		}
 
-		rtw_set_802_11_bssid_list_scan(padapter, NULL, 0);
+		rtw_set_802_11_bssid_list_scan(adapter, NULL, 0);
 	}
 
 exit:
@@ -1624,7 +1624,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
 			rtw_hal_dm_watchdog_in_lps(adapter);
 		} else {
-			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1) in traffic_status_watchdog() */
+			/* call rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_LEAVE, 1) in traffic_status_watchdog() */
 		}
 
 	} else {
@@ -2149,10 +2149,10 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 }
 
 /* the function is at passive_level */
-void rtw_joinbss_reset(struct adapter *padapter)
+void rtw_joinbss_reset(struct adapter *adapter)
 {
 	u8 threshold;
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
 	struct ht_priv *phtpriv = &mlme_priv->htpriv;
 
@@ -2167,22 +2167,22 @@ void rtw_joinbss_reset(struct adapter *padapter)
 	/*  TH = 1 => means that invalidate usb rx aggregation */
 	/*  TH = 0 => means that validate usb rx aggregation, use init value. */
 	if (phtpriv->ht_option) {
-		if (padapter->registrypriv.wifi_spec == 1)
+		if (adapter->registrypriv.wifi_spec == 1)
 			threshold = 1;
 		else
 			threshold = 0;
-		rtw_hal_set_hwreg(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
+		rtw_hal_set_hwreg(adapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
 	} else {
 		threshold = 1;
-		rtw_hal_set_hwreg(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
+		rtw_hal_set_hwreg(adapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
 	}
 }
 
-void rtw_ht_use_default_setting(struct adapter *padapter)
+void rtw_ht_use_default_setting(struct adapter *adapter)
 {
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *phtpriv = &mlme_priv->htpriv;
-	struct registry_priv *pregistrypriv = &padapter->registrypriv;
+	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
 	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
 
@@ -2195,34 +2195,34 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
 
 	/*  LDPC support */
-	rtw_hal_get_def_var(padapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
+	rtw_hal_get_def_var(adapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
 	CLEAR_FLAGS(phtpriv->ldpc_cap);
 	if (bHwLDPCSupport) {
 		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(4)))
 			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_RX);
 	}
-	rtw_hal_get_def_var(padapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
+	rtw_hal_get_def_var(adapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
 	if (bHwLDPCSupport) {
 		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(5)))
 			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_TX);
 	}
 
 	/*  STBC */
-	rtw_hal_get_def_var(padapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
+	rtw_hal_get_def_var(adapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
 	CLEAR_FLAGS(phtpriv->stbc_cap);
 	if (bHwSTBCSupport) {
 		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(5)))
 			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_TX);
 	}
-	rtw_hal_get_def_var(padapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
+	rtw_hal_get_def_var(adapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
 	if (bHwSTBCSupport) {
 		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(4)))
 			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_RX);
 	}
 
 	/*  Beamforming setting */
-	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
-	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
+	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
+	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
 	CLEAR_FLAGS(phtpriv->beamform_cap);
 	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
 		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
@@ -2231,32 +2231,32 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
-void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
+void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, uint *pout_len)
 {
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
 	int out_len;
 
-	if (padapter->mlmepriv.qospriv.qos_option == 0) {
+	if (adapter->mlmepriv.qospriv.qos_option == 0) {
 		out_len = *pout_len;
 		rtw_set_ie(out_ie + out_len, WLAN_EID_VENDOR_SPECIFIC,
 			   _WMM_IE_Length_, WMM_IE, pout_len);
 
-		padapter->mlmepriv.qospriv.qos_option = 1;
+		adapter->mlmepriv.qospriv.qos_option = 1;
 	}
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
 	unsigned char *p;
 	struct ieee80211_ht_cap ht_capie;
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
-	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct registry_priv *pregistrypriv = &adapter->registrypriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *phtpriv = &mlme_priv->htpriv;
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	phtpriv->ht_option = false;
 
@@ -2273,7 +2273,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	if (!in_ie) {
 		/* TDLS: TODO 20/40 issue */
 		if (check_fwstate(mlme_priv, WIFI_STATION_STATE)) {
-			operation_bw = padapter->mlmeextpriv.cur_bwmode;
+			operation_bw = adapter->mlmeextpriv.cur_bwmode;
 			if (operation_bw > CHANNEL_WIDTH_40)
 				operation_bw = CHANNEL_WIDTH_40;
 		} else {
@@ -2335,20 +2335,20 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	{
 		u32 rx_packet_offset, max_recvbuf_sz;
 
-		rtw_hal_get_def_var(padapter, HAL_DEF_RX_PACKET_OFFSET, &rx_packet_offset);
-		rtw_hal_get_def_var(padapter, HAL_DEF_MAX_RECVBUF_SZ, &max_recvbuf_sz);
+		rtw_hal_get_def_var(adapter, HAL_DEF_RX_PACKET_OFFSET, &rx_packet_offset);
+		rtw_hal_get_def_var(adapter, HAL_DEF_MAX_RECVBUF_SZ, &max_recvbuf_sz);
 	}
 
-	if (padapter->driver_rx_ampdu_factor != 0xFF)
+	if (adapter->driver_rx_ampdu_factor != 0xFF)
 		max_rx_ampdu_factor =
-		  (enum ieee80211_max_ampdu_length_exp)padapter->driver_rx_ampdu_factor;
+		  (enum ieee80211_max_ampdu_length_exp)adapter->driver_rx_ampdu_factor;
 	else
-		rtw_hal_get_def_var(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR,
+		rtw_hal_get_def_var(adapter, HW_VAR_MAX_RX_AMPDU_FACTOR,
 				    &max_rx_ampdu_factor);
 
 	ht_capie.ampdu_params_info = (max_rx_ampdu_factor & 0x03);
 
-	if (padapter->securitypriv.dot11_privacy_algrthm == _AES_)
+	if (adapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & (0x07 << 2));
 	else
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & 0x00);
@@ -2370,15 +2370,15 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 }
 
 /* the function is > passive_level (in critical_section) */
-void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channel)
+void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel)
 {
 	u8 *p, max_ampdu_sz;
 	int len;
 	struct ieee80211_ht_cap *pht_capie;
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *phtpriv = &mlme_priv->htpriv;
-	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct registry_priv *pregistrypriv = &adapter->registrypriv;
+	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 cbw40_enable = 0;
 
@@ -2455,7 +2455,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	pmlmeinfo->HT_protection = pmlmeinfo->HT_info.infos[1] & 0x3;
 }
 
-void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitframe)
+void rtw_issue_addbareq_cmd(struct adapter *adapter, struct xmit_frame *pxmitframe)
 {
 	u8 issued;
 	int priority;
@@ -2464,12 +2464,12 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
-	if (bmcst || (padapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100))
+	if (bmcst || (adapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100))
 		return;
 
 	priority = pattrib->priority;
 
-	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
+	psta = rtw_get_stainfo(&adapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
 		return;
 
@@ -2487,14 +2487,14 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
-			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
+			rtw_addbareq_cmd(adapter, (u8) priority, pattrib->ra);
 		}
 	}
 }
 
-void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len)
+void rtw_append_exented_cap(struct adapter *adapter, u8 *out_ie, uint *pout_len)
 {
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *phtpriv = &mlme_priv->htpriv;
 	u8 cap_content[8] = {0};
 
@@ -2522,43 +2522,43 @@ inline u8 rtw_to_roam(struct adapter *adapter)
 	return adapter->mlmepriv.to_roam;
 }
 
-void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
+void rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network)
 {
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
 	spin_lock_bh(&mlme_priv->lock);
-	_rtw_roaming(padapter, tgt_network);
+	_rtw_roaming(adapter, tgt_network);
 	spin_unlock_bh(&mlme_priv->lock);
 }
 
-void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
+void _rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network)
 {
-	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct wlan_network *cur_network = &mlme_priv->cur_network;
 
-	if (rtw_to_roam(padapter) > 0) {
+	if (rtw_to_roam(adapter) > 0) {
 		memcpy(&mlme_priv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
 
 		mlme_priv->assoc_by_bssid = false;
 
-		while (rtw_do_join(padapter) != _SUCCESS) {
-			rtw_dec_to_roam(padapter);
-			if (rtw_to_roam(padapter) <= 0) {
-				rtw_indicate_disconnect(padapter);
+		while (rtw_do_join(adapter) != _SUCCESS) {
+			rtw_dec_to_roam(adapter);
+			if (rtw_to_roam(adapter) <= 0) {
+				rtw_indicate_disconnect(adapter);
 				break;
 			}
 		}
 	}
 }
 
-bool rtw_linked_check(struct adapter *padapter)
+bool rtw_linked_check(struct adapter *adapter)
 {
-	if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) ||
-	    check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
-		if (padapter->stapriv.asoc_sta_count > 2)
+	if (check_fwstate(&adapter->mlmepriv, WIFI_AP_STATE) ||
+	    check_fwstate(&adapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
+		if (adapter->stapriv.asoc_sta_count > 2)
 			return true;
 	} else {	/* Station mode */
-		if (check_fwstate(&padapter->mlmepriv, _FW_LINKED))
+		if (check_fwstate(&adapter->mlmepriv, _FW_LINKED))
 			return true;
 	}
 	return false;
-- 
2.55.0

