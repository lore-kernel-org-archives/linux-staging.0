Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752973C1D57
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494636; cv=none; b=bA2KCI+ozVLidS0ex1lq3SMA1W1bEn2Ea05hhuiPW+YWgvlGmrcH4aN3+Flw6rOWxV8+C4cRcMqwOZ2IrtoXQdNy2rpeBIqRkgBBRbgphwsDbPpofoJmtpCPCqHbGqNl/+5Gd9vDbm3bDEChfI8puhCQuD6K5Y+q2TvsN7Ru28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494636; c=relaxed/simple;
	bh=bcChaHKviVKabZd5Nuts/U3Bc37AX5xhFT3Yg/qlJdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZSuq7o+k3Gvzg+Jy5W/tx1OG8cPsoY+XeWB8urQQsl9WTBWPKl1vGGhDVWLprHVWQz75urVYxnsJCAXqEi2S3Sb+ogXtm3A3kcfJaMKJDi6xxgNk1yXKcvT6xIzcIegUaPpZe1v2BK62/ZHPcMnwwqwlKGqZ6cqdZ8TFyVZ8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpD7BL84; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpD7BL84"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-472326ca506so577632f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494621; x=1786099421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FN3m4V2OjqHsywQEie8ykzImWS2QcSM59uQeZjIXfdc=;
        b=BpD7BL84onrH7LnQwaKpM847nKnptuJ8Hju6pilUiKMUDES4EZ6vbnD6pCxlEoU9ze
         I7EJAXq8F5j+JvlD17+Gm9N5OtKanM7hJxxkovInwrE8J7kEAu2qsTYzPv1k1Rpxh8+L
         rgpbhXKpHz6y3HPbj9sh2advG4BadxJboUftVG92yICHVD1aMfr7yEPliY+3BYugbfRJ
         KRcdJs+eg2H6fmZgiEmy/FKU82tldiga+yfEu3eu02vakYTDLXjtd942uDXxtlVpok4E
         KyXMWeDv0pNRUPbTt28A81ABCS0cIPgboDI0BVwCr5J6AY+p5N6yeleecckCp09KsLGl
         7THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494621; x=1786099421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FN3m4V2OjqHsywQEie8ykzImWS2QcSM59uQeZjIXfdc=;
        b=VcnoZoTreZZHdOtNzkg3okuquyNDti5rPzGcP4WkZ3USZzvn7BGJsZZBWmhtnVLFVM
         5o642kn/5gKNVePS/zvgUDo8EbElp9AI4jwQMKduBH5T2LwlFDAo0l7RzdUCGO2yHKa8
         QSLQE0QxqFFmnq7ILBDRKyV+rwzWydDYzL21IYRSvLG9S+4aGm43Rz41ibRShCcVpZ46
         LPPv8qIsMomwsaI4iHyOGS8/6M/cxf975p3G5Q1odthGz4Qg1QoXmCGhe5BrKCPVFtZt
         XwfIq7P+1SvV1S84lS4BBAmfBQWkhnTzYolZNDwnVlqt4RFCA3tmgdsCDSdfCj/x4IA7
         FbZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqR8vE/k1aqPqfw78i9g1Fi4vn/eJRGYkkZCFzdO00N0LXSQyQ93j66icK0zwKZnxULLgUq3ArXGRpZzbZp@lists.linux.dev
X-Gm-Message-State: AOJu0YwrhhpIs5zZGdgl1PoZlie9FpJK80aw/ykFD89g5FAc/hRyqH3u
	TWyF3e2vFwjBx4VVdqC3RPzdWasfjmyoUyAE8/BLSXpoQiMpY2qWyWMiqgX7enKe
X-Gm-Gg: AR+sD13t/QURfE0LfHhkBON40jcecWTcMR6fy4SJCaYbQxSq6BnBQlXAKBEi8VNnEgV
	ZfCT/q7YBPb9lKcBHwQuJmwmbBk7lZw9KesbprtbJI76ACRgTTJ/wn6rrwt2M5TOynlGlKPE7Ax
	sAuiA33iGaPsDhoKts59+/WkMg88q5LATJSTsT8xyWjA2Zt61rTt6afND2PpW1VpwxSc7nS2Eer
	3IZ8p5JhMAcBIw1jBjaohSEjZArYreNNKd3eR1iH78Wxhigk1X8mXSdu9xZrOOkr7tY9lSnc1cy
	qobX09k506PkLIWrb45GFnd1ZvaXDk/k5YY8+yzaYETnY9f5bBsZjgIBo67FZpdDxumkZXhFMkh
	alw+OXYLqI+DYJs/1iQPO7Dvj8m9+uRDInb282wSfmKBQTif1mVEaprWJRGDsdCqMxfuiUQH9oZ
	k7DIVqdBqGipi8vxA+q2sXJct1I+hSUYj9uFpoN4moiiQT/Y94MtV8WCuZOeAVbXz4ufq7f5rdQ
	qoN+WQlVFJ6ytD/W9z902D954aw3RXWRZ8JaqjladiTJR7DFw4d
X-Received: by 2002:a05:6000:420c:b0:474:3b3b:5e5f with SMTP id ffacd0b85a97d-47fd2ac9875mr3679684f8f.16.1785494620591;
        Fri, 31 Jul 2026 03:43:40 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:40 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 02/11] staging: rtl8723bs: renaming variable pmlmepriv in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:25 +0000
Message-ID: <20260731104134.12754-3-fliegbert2@gmail.com>
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

Renaming occurrences of pmlmepriv to mlme_priv since the prefix p is
an old naming convention to indicate a pointer variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 520 +++++++++++-----------
 1 file changed, 260 insertions(+), 260 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7f43f8f27186..276bf83fa024 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -29,13 +29,13 @@ static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
 
 static void rtw_init_mlme_timer(struct adapter *padapter)
 {
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct	mlme_priv *mlme_priv = &padapter->mlmepriv;
 
-	timer_setup(&pmlmepriv->assoc_timer, _rtw_join_timeout_handler, 0);
-	timer_setup(&pmlmepriv->scan_to_timer, rtw_scan_timeout_handler, 0);
-	timer_setup(&pmlmepriv->dynamic_chk_timer,
+	timer_setup(&mlme_priv->assoc_timer, _rtw_join_timeout_handler, 0);
+	timer_setup(&mlme_priv->scan_to_timer, rtw_scan_timeout_handler, 0);
+	timer_setup(&mlme_priv->dynamic_chk_timer,
 		    _dynamic_check_timer_handler, 0);
-	timer_setup(&pmlmepriv->set_scan_deny_timer,
+	timer_setup(&mlme_priv->set_scan_deny_timer,
 		    _rtw_set_scan_deny_timer_hdl, 0);
 }
 
@@ -44,23 +44,23 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 	int i;
 	u8 *buf;
 	struct wlan_network *pnetwork;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
 	int res = _SUCCESS;
 
-	pmlmepriv->nic_hdl = (u8 *)padapter;
+	mlme_priv->nic_hdl = (u8 *)padapter;
 
-	pmlmepriv->pscanned = NULL;
-	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
-	pmlmepriv->cur_network.network.infrastructure_mode = NL80211_IFTYPE_UNSPECIFIED;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this variable to "active_mode" (Jeff) */
+	mlme_priv->pscanned = NULL;
+	mlme_priv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
+	mlme_priv->cur_network.network.infrastructure_mode = NL80211_IFTYPE_UNSPECIFIED;
+	mlme_priv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this variable to "active_mode" (Jeff) */
 
-	spin_lock_init(&pmlmepriv->lock);
-	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
-	spin_lock_init(&pmlmepriv->free_bss_pool.lock);
-	INIT_LIST_HEAD(&pmlmepriv->scanned_queue.queue);
-	spin_lock_init(&pmlmepriv->scanned_queue.lock);
+	spin_lock_init(&mlme_priv->lock);
+	INIT_LIST_HEAD(&mlme_priv->free_bss_pool.queue);
+	spin_lock_init(&mlme_priv->free_bss_pool.lock);
+	INIT_LIST_HEAD(&mlme_priv->scanned_queue.queue);
+	spin_lock_init(&mlme_priv->scanned_queue.lock);
 
-	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
+	memset(&mlme_priv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
 
 	buf = vzalloc(array_size(MAX_BSS_CNT, sizeof(struct wlan_network)));
 
@@ -68,14 +68,14 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 		res = _FAIL;
 		goto exit;
 	}
-	pmlmepriv->free_bss_buf = buf;
+	mlme_priv->free_bss_buf = buf;
 
 	pnetwork = (struct wlan_network *)buf;
 
 	for (i = 0; i < MAX_BSS_CNT; i++) {
 		INIT_LIST_HEAD(&pnetwork->list);
 
-		list_add_tail(&pnetwork->list, &pmlmepriv->free_bss_pool.queue);
+		list_add_tail(&pnetwork->list, &mlme_priv->free_bss_pool.queue);
 
 		pnetwork++;
 	}
@@ -88,14 +88,14 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 	#define RTW_ROAM_RSSI_DIFF_TH 10
 	#define RTW_ROAM_SCAN_INTERVAL_MS 10000
 
-	pmlmepriv->roam_flags = 0
+	mlme_priv->roam_flags = 0
 		| RTW_ROAM_ON_EXPIRED
 		| RTW_ROAM_ON_RESUME
 		;
 
-	pmlmepriv->roam_scanr_exp_ms = RTW_ROAM_SCAN_RESULT_EXP_MS;
-	pmlmepriv->roam_rssi_diff_th = RTW_ROAM_RSSI_DIFF_TH;
-	pmlmepriv->roam_scan_int_ms = RTW_ROAM_SCAN_INTERVAL_MS;
+	mlme_priv->roam_scanr_exp_ms = RTW_ROAM_SCAN_RESULT_EXP_MS;
+	mlme_priv->roam_rssi_diff_th = RTW_ROAM_RSSI_DIFF_TH;
+	mlme_priv->roam_scan_int_ms = RTW_ROAM_SCAN_INTERVAL_MS;
 
 	rtw_init_mlme_timer(padapter);
 
@@ -113,34 +113,34 @@ static void rtw_free_mlme_ie_data(u8 **ppie, u32 *plen)
 	}
 }
 
-void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
+void rtw_free_mlme_priv_ie_data(struct mlme_priv *mlme_priv)
 {
-	rtw_buf_free(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len);
-	rtw_buf_free(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->wps_beacon_ie, &pmlmepriv->wps_beacon_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_req_ie, &pmlmepriv->wps_probe_req_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_resp_ie, &pmlmepriv->wps_probe_resp_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->wps_assoc_resp_ie, &pmlmepriv->wps_assoc_resp_ie_len);
+	rtw_buf_free(&mlme_priv->assoc_req, &mlme_priv->assoc_req_len);
+	rtw_buf_free(&mlme_priv->assoc_rsp, &mlme_priv->assoc_rsp_len);
+	rtw_free_mlme_ie_data(&mlme_priv->wps_beacon_ie, &mlme_priv->wps_beacon_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->wps_probe_req_ie, &mlme_priv->wps_probe_req_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->wps_probe_resp_ie, &mlme_priv->wps_probe_resp_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->wps_assoc_resp_ie, &mlme_priv->wps_assoc_resp_ie_len);
 
-	rtw_free_mlme_ie_data(&pmlmepriv->p2p_beacon_ie, &pmlmepriv->p2p_beacon_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_req_ie, &pmlmepriv->p2p_probe_req_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_resp_ie, &pmlmepriv->p2p_probe_resp_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie, &pmlmepriv->p2p_go_probe_resp_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->p2p_beacon_ie, &mlme_priv->p2p_beacon_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->p2p_probe_req_ie, &mlme_priv->p2p_probe_req_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->p2p_probe_resp_ie, &mlme_priv->p2p_probe_resp_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->p2p_go_probe_resp_ie, &mlme_priv->p2p_go_probe_resp_ie_len);
+	rtw_free_mlme_ie_data(&mlme_priv->p2p_assoc_req_ie, &mlme_priv->p2p_assoc_req_ie_len);
 }
 
-void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
+void _rtw_free_mlme_priv(struct mlme_priv *mlme_priv)
 {
-	if (pmlmepriv) {
-		rtw_free_mlme_priv_ie_data(pmlmepriv);
-		vfree(pmlmepriv->free_bss_buf);
+	if (mlme_priv) {
+		rtw_free_mlme_priv_ie_data(mlme_priv);
+		vfree(mlme_priv->free_bss_buf);
 	}
 }
 
-struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
+struct wlan_network *rtw_alloc_network(struct mlme_priv *mlme_priv)
 {
 	struct wlan_network *pnetwork;
-	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
+	struct __queue *free_queue = &mlme_priv->free_bss_pool;
 	struct list_head *plist = NULL;
 
 	spin_lock_bh(&free_queue->lock);
@@ -167,11 +167,11 @@ struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
 	return pnetwork;
 }
 
-void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork, u8 isfreeall)
+void _rtw_free_network(struct mlme_priv *mlme_priv, struct wlan_network *pnetwork, u8 isfreeall)
 {
 	unsigned int delta_time;
 	u32 lifetime = SCANQUEUE_LIFETIME;
-	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
+	struct __queue *free_queue = &mlme_priv->free_bss_pool;
 
 	if (!pnetwork)
 		return;
@@ -179,8 +179,8 @@ void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 	if (pnetwork->fixed)
 		return;
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE))
+	if (check_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE) ||
+	    check_fwstate(mlme_priv, WIFI_ADHOC_STATE))
 		lifetime = 1;
 
 	if (!isfreeall) {
@@ -198,9 +198,9 @@ void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 	spin_unlock_bh(&free_queue->lock);
 }
 
-void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
+void _rtw_free_network_nolock(struct mlme_priv *mlme_priv, struct wlan_network *pnetwork)
 {
-	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
+	struct __queue *free_queue = &mlme_priv->free_bss_pool;
 
 	if (!pnetwork)
 		return;
@@ -247,8 +247,8 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 {
 	struct list_head *phead, *plist, *tmp;
 	struct wlan_network *pnetwork;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct __queue *scanned_queue = &pmlmepriv->scanned_queue;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct __queue *scanned_queue = &mlme_priv->scanned_queue;
 
 	spin_lock_bh(&scanned_queue->lock);
 
@@ -256,7 +256,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 	list_for_each_safe(plist, tmp, phead) {
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
-		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
+		_rtw_free_network(mlme_priv, pnetwork, isfreeall);
 	}
 
 	spin_unlock_bh(&scanned_queue->lock);
@@ -302,9 +302,9 @@ u8 *rtw_get_beacon_interval_from_ie(u8 *ie)
 	return ie + 8;
 }
 
-void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
+void rtw_free_mlme_priv(struct mlme_priv *mlme_priv)
 {
-	_rtw_free_mlme_priv(pmlmepriv);
+	_rtw_free_mlme_priv(mlme_priv);
 }
 
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
@@ -452,25 +452,25 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 
 static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
 {
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct	mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
-		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
-		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+	if (check_fwstate(mlme_priv, _FW_LINKED) && (is_same_network(&mlme_priv->cur_network.network, pnetwork, 0))) {
+		update_network(&mlme_priv->cur_network.network, pnetwork, adapter, true);
+		if (mlme_priv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
 			return;
 
-		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length - sizeof(struct ndis_802_11_fix_ie));
+		rtw_update_protection(adapter, (mlme_priv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
+								mlme_priv->cur_network.network.ie_length - sizeof(struct ndis_802_11_fix_ie));
 	}
 }
 
-/* Caller must hold pmlmepriv->lock first. */
+/* Caller must hold mlme_priv->lock first. */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head *plist, *phead;
 	u32 bssid_ex_sz;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct __queue *queue = &pmlmepriv->scanned_queue;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
+	struct __queue *queue = &mlme_priv->scanned_queue;
 	struct wlan_network *pnetwork = NULL;
 	struct wlan_network *oldest = NULL;
 	int target_find = 0;
@@ -499,7 +499,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	 * with this beacon's information
 	 */
 	if (!target_find) {
-		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
+		if (list_empty(&mlme_priv->free_bss_pool.queue)) {
 			/* If there are no more slots, expire the oldest */
 			/* list_del_init(&oldest->list); */
 			pnetwork = oldest;
@@ -521,7 +521,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		} else {
 			/* Otherwise just pull from the free list */
 
-			pnetwork = rtw_alloc_network(pmlmepriv); /*  will update scan_time */
+			pnetwork = rtw_alloc_network(mlme_priv); /*  will update scan_time */
 
 			if (!pnetwork)
 				goto exit;
@@ -583,7 +583,7 @@ static void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetw
 static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
 {
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	u32 desired_encmode;
 	u32 privacy;
 	uint wps_ielen;
@@ -592,7 +592,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	desired_encmode = psecuritypriv->ndisencryptstatus;
 	privacy = pnetwork->network.privacy;
 
-	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
+	if (check_fwstate(mlme_priv, WIFI_UNDER_WPS)) {
 		if (pnetwork->network.ie_length < _FIXED_IE_LENGTH_)
 			return false;
 		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
@@ -624,8 +624,8 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0))
 		bselected = false;
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-		if (pnetwork->network.infrastructure_mode != pmlmepriv->cur_network.network.infrastructure_mode)
+	if (check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
+		if (pnetwork->network.infrastructure_mode != mlme_priv->cur_network.network.infrastructure_mode)
 			bselected = false;
 	}
 
@@ -636,7 +636,7 @@ void rtw_survey_event_callback(struct adapter *adapter, u8 *buf)
 {
 	u32 len;
 	struct wlan_bssid_ex *pnetwork;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
 	pnetwork = (struct wlan_bssid_ex *)buf;
 
@@ -644,27 +644,27 @@ void rtw_survey_event_callback(struct adapter *adapter, u8 *buf)
 	if (len > (sizeof(struct wlan_bssid_ex)))
 		return;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	spin_lock_bh(&mlme_priv->lock);
 
 	/*  update IBSS_network 's timestamp */
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
-		if (!memcmp(&pmlmepriv->cur_network.network.mac_address, pnetwork->mac_address, ETH_ALEN)) {
+	if (check_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE)) {
+		if (!memcmp(&mlme_priv->cur_network.network.mac_address, pnetwork->mac_address, ETH_ALEN)) {
 			struct wlan_network *ibss_wlan = NULL;
 
-			memcpy(pmlmepriv->cur_network.network.ies, pnetwork->ies, 8);
-			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-			ibss_wlan = rtw_find_network(&pmlmepriv->scanned_queue,  pnetwork->mac_address);
+			memcpy(mlme_priv->cur_network.network.ies, pnetwork->ies, 8);
+			spin_lock_bh(&mlme_priv->scanned_queue.lock);
+			ibss_wlan = rtw_find_network(&mlme_priv->scanned_queue,  pnetwork->mac_address);
 			if (ibss_wlan) {
 				memcpy(ibss_wlan->network.ies, pnetwork->ies, 8);
-				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+				spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 				goto exit;
 			}
-			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+			spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 		}
 	}
 
-	/*  lock pmlmepriv->lock when you accessing network_q */
-	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
+	/*  lock mlme_priv->lock when you accessing network_q */
+	if (!check_fwstate(mlme_priv, _FW_UNDER_LINKING)) {
 		if (pnetwork->ssid.ssid[0] == 0)
 			pnetwork->ssid.ssid_length = 0;
 		rtw_add_network(adapter, pnetwork);
@@ -672,36 +672,36 @@ void rtw_survey_event_callback(struct adapter *adapter, u8 *buf)
 
 exit:
 
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 }
 
 void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 {
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	spin_lock_bh(&pmlmepriv->lock);
-	if (pmlmepriv->wps_probe_req_ie) {
-		pmlmepriv->wps_probe_req_ie_len = 0;
-		kfree(pmlmepriv->wps_probe_req_ie);
-		pmlmepriv->wps_probe_req_ie = NULL;
+	spin_lock_bh(&mlme_priv->lock);
+	if (mlme_priv->wps_probe_req_ie) {
+		mlme_priv->wps_probe_req_ie_len = 0;
+		kfree(mlme_priv->wps_probe_req_ie);
+		mlme_priv->wps_probe_req_ie = NULL;
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
-		spin_unlock_bh(&pmlmepriv->lock);
-		timer_delete_sync(&pmlmepriv->scan_to_timer);
-		spin_lock_bh(&pmlmepriv->lock);
-		_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
+	if (check_fwstate(mlme_priv, _FW_UNDER_SURVEY)) {
+		spin_unlock_bh(&mlme_priv->lock);
+		timer_delete_sync(&mlme_priv->scan_to_timer);
+		spin_lock_bh(&mlme_priv->lock);
+		_clr_fwstate_(mlme_priv, _FW_UNDER_SURVEY);
 	}
 
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
-	if (pmlmepriv->to_join) {
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
-				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
+	if (mlme_priv->to_join) {
+		if (check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
+			if (!check_fwstate(mlme_priv, _FW_LINKED)) {
+				set_fwstate(mlme_priv, _FW_UNDER_LINKING);
 
-				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
-					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				if (rtw_select_and_join_from_scanned_queue(mlme_priv) == _SUCCESS) {
+					_set_timer(&mlme_priv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
 					struct wlan_bssid_ex *pdev_network =
@@ -709,18 +709,18 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 
 					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
-					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
+					/* mlme_priv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
+					_clr_fwstate_(mlme_priv, _FW_UNDER_SURVEY);
 
-					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+					memcpy(&pdev_network->ssid, &mlme_priv->assoc_ssid,
 					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
 					rtw_generate_random_ibss(pibss);
 
-					pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
+					mlme_priv->fw_state = WIFI_ADHOC_MASTER_STATE;
 
-					pmlmepriv->to_join = false;
+					mlme_priv->to_join = false;
 
 					ret = rtw_createbss_cmd(adapter);
 					if (ret != _SUCCESS)
@@ -730,37 +730,37 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 		} else {
 			int s_ret;
 
-			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
-			pmlmepriv->to_join = false;
-			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
+			set_fwstate(mlme_priv, _FW_UNDER_LINKING);
+			mlme_priv->to_join = false;
+			s_ret = rtw_select_and_join_from_scanned_queue(mlme_priv);
 			if (s_ret == _SUCCESS) {
-				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				_set_timer(&mlme_priv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) {/* there is no need to wait for join */
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+				_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
 					if (rtw_dec_to_roam(adapter) == 0 ||
-					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
+					    rtw_sitesurvey_cmd(adapter, &mlme_priv->assoc_ssid,
 							       1, NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
 					} else {
-						pmlmepriv->to_join = true;
+						mlme_priv->to_join = true;
 					}
 				} else {
 					rtw_indicate_disconnect(adapter);
 				}
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+				_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING);
 			}
 		}
 	} else {
 		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
-			    check_fwstate(pmlmepriv, _FW_LINKED)) {
-				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
-					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
+			if (check_fwstate(mlme_priv, WIFI_STATION_STATE) &&
+			    check_fwstate(mlme_priv, _FW_LINKED)) {
+				if (rtw_select_roaming_candidate(mlme_priv) == _SUCCESS) {
+					receive_disconnect(adapter, mlme_priv->cur_network.network.mac_address
 						, WLAN_REASON_ACTIVE_ROAM);
 				}
 			}
@@ -768,7 +768,7 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 	}
 
 unlock:
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 
 	rtw_os_xmit_schedule(adapter);
 
@@ -785,10 +785,10 @@ void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *buf)
 {
 }
 
-static void free_scanqueue(struct mlme_priv *pmlmepriv)
+static void free_scanqueue(struct mlme_priv *mlme_priv)
 {
-	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
-	struct __queue *scan_queue = &pmlmepriv->scanned_queue;
+	struct __queue *free_queue = &mlme_priv->free_bss_pool;
+	struct __queue *scan_queue = &mlme_priv->scanned_queue;
 	struct list_head *plist, *phead, *ptemp;
 
 	spin_lock_bh(&scan_queue->lock);
@@ -811,34 +811,34 @@ static void free_scanqueue(struct mlme_priv *pmlmepriv)
 static void find_network(struct adapter *adapter)
 {
 	struct wlan_network *pwlan = NULL;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
+	struct wlan_network *tgt_network = &mlme_priv->cur_network;
 
-	pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
+	pwlan = rtw_find_network(&mlme_priv->scanned_queue, tgt_network->network.mac_address);
 	if (!pwlan)
 		return;
 
 	pwlan->fixed = false;
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) &&
+	if (check_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE) &&
 	    (adapter->stapriv.asoc_sta_count == 1))
 		rtw_free_network_nolock(adapter, pwlan);
 }
 
-/* rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock */
+/* rtw_free_assoc_resources: the caller has to lock mlme_priv->lock */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
+	struct wlan_network *tgt_network = &mlme_priv->cur_network;
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
+	if (check_fwstate(mlme_priv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
 
 		psta = rtw_get_stainfo(&adapter->stapriv, tgt_network->network.mac_address);
 		rtw_free_stainfo(adapter, psta);
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
+	if (check_fwstate(mlme_priv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
 
 		rtw_free_all_stainfo(adapter);
@@ -855,18 +855,18 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 		adapter->securitypriv.key_mask = 0;
 }
 
-/* rtw_indicate_connect: the caller has to lock pmlmepriv->lock */
+/* rtw_indicate_connect: the caller has to lock mlme_priv->lock */
 void rtw_indicate_connect(struct adapter *padapter)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
 
-	pmlmepriv->to_join = false;
+	mlme_priv->to_join = false;
 
 	if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
-		set_fwstate(pmlmepriv, _FW_LINKED);
+		set_fwstate(mlme_priv, _FW_LINKED);
 
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-		    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE))
+		if (check_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE) ||
+		    check_fwstate(mlme_priv, WIFI_ADHOC_STATE))
 			rtw_cfg80211_ibss_indicate_connect(padapter);
 		else
 			rtw_cfg80211_indicate_connect(padapter);
@@ -881,15 +881,15 @@ void rtw_indicate_connect(struct adapter *padapter)
 	rtw_set_scan_deny(padapter, 3000);
 }
 
-/* rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock */
+/* rtw_indicate_disconnect: the caller has to lock mlme_priv->lock */
 void rtw_indicate_disconnect(struct adapter *padapter)
 {
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct	mlme_priv *mlme_priv = &padapter->mlmepriv;
 
-	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING | WIFI_UNDER_WPS);
+	_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING | WIFI_UNDER_WPS);
 
 	if (rtw_to_roam(padapter) > 0)
-		_clr_fwstate_(pmlmepriv, _FW_LINKED);
+		_clr_fwstate_(mlme_priv, _FW_LINKED);
 
 	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || rtw_to_roam(padapter) <= 0) {
 		/*  Do it first for tx broadcast pkt after disconnection issue! */
@@ -902,7 +902,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 		/* set ips_deny_time to avoid enter IPS before LPS leave */
 		rtw_set_ips_deny(padapter, 3000);
 
-		_clr_fwstate_(pmlmepriv, _FW_LINKED);
+		_clr_fwstate_(mlme_priv, _FW_LINKED);
 
 		rtw_clear_scan_deny(padapter);
 	}
@@ -925,12 +925,12 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 void rtw_scan_abort(struct adapter *adapter)
 {
 	unsigned long start;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
+	while (check_fwstate(mlme_priv, _FW_UNDER_SURVEY)
 	       && jiffies_to_msecs(start) <= 200) {
 		if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 			break;
@@ -938,7 +938,7 @@ void rtw_scan_abort(struct adapter *adapter)
 		msleep(20);
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
+	if (check_fwstate(mlme_priv, _FW_UNDER_SURVEY))
 		rtw_indicate_scan_done(adapter, true);
 
 	pmlmeext->scan_abort = false;
@@ -1031,8 +1031,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan,
 				       struct wlan_network *pnetwork)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct wlan_network *cur_network = &pmlmepriv->cur_network;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct wlan_network *cur_network = &mlme_priv->cur_network;
 
 	/*  why not use ptarget_wlan?? */
 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.length);
@@ -1055,17 +1055,17 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	switch (pnetwork->network.infrastructure_mode) {
 	case NL80211_IFTYPE_STATION:
 
-			if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
-				pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
+			if (mlme_priv->fw_state & WIFI_UNDER_WPS)
+				mlme_priv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
 			else
-				pmlmepriv->fw_state = WIFI_STATION_STATE;
+				mlme_priv->fw_state = WIFI_STATION_STATE;
 
 			break;
 	case NL80211_IFTYPE_ADHOC:
-			pmlmepriv->fw_state = WIFI_ADHOC_STATE;
+			mlme_priv->fw_state = WIFI_ADHOC_STATE;
 			break;
 	default:
-			pmlmepriv->fw_state = WIFI_NULL_STATE;
+			mlme_priv->fw_state = WIFI_NULL_STATE;
 			break;
 	}
 
@@ -1147,9 +1147,9 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *buf)
 {
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
 	struct sta_priv *pstapriv = &adapter->stapriv;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct wlan_network *pnetwork = (struct wlan_network *)buf;
-	struct wlan_network *cur_network = &pmlmepriv->cur_network;
+	struct wlan_network *cur_network = &mlme_priv->cur_network;
 	struct wlan_network *pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int the_same_macaddr = false;
 
@@ -1159,43 +1159,43 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *buf)
 	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
 		return;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	spin_lock_bh(&mlme_priv->lock);
 
-	pmlmepriv->link_detect_info.traffic_transition_count = 0;
-	pmlmepriv->link_detect_info.low_power_transition_count = 0;
+	mlme_priv->link_detect_info.traffic_transition_count = 0;
+	mlme_priv->link_detect_info.low_power_transition_count = 0;
 
 	if (pnetwork->join_res == -4) {
 		rtw_reset_securitypriv(adapter);
-		_set_timer(&pmlmepriv->assoc_timer, 1);
+		_set_timer(&mlme_priv->assoc_timer, 1);
 
-		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
+		if (check_fwstate(mlme_priv, _FW_UNDER_LINKING))
+			_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING);
 
-		spin_unlock_bh(&pmlmepriv->lock);
+		spin_unlock_bh(&mlme_priv->lock);
 		return;
 	}
 
 	if (pnetwork->join_res <= 0) { /* if join_res < 0 (join fails), then try again */
-		_set_timer(&pmlmepriv->assoc_timer, 1);
-		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-		spin_unlock_bh(&pmlmepriv->lock);
+		_set_timer(&mlme_priv->assoc_timer, 1);
+		_clr_fwstate_(mlme_priv, _FW_UNDER_LINKING);
+		spin_unlock_bh(&mlme_priv->lock);
 		return;
 	}
 
-	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
+	spin_lock_bh(&mlme_priv->scanned_queue.lock);
 
-	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
-		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-		spin_unlock_bh(&pmlmepriv->lock);
+	if (!check_fwstate(mlme_priv, _FW_UNDER_LINKING)) {
+		spin_unlock_bh(&mlme_priv->scanned_queue.lock);
+		spin_unlock_bh(&mlme_priv->lock);
 		return;
 	}
 
 	/* s1. find ptarget_wlan */
-	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(mlme_priv, _FW_LINKED)) {
 		if (the_same_macaddr) {
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			ptarget_wlan = rtw_find_network(&mlme_priv->scanned_queue, cur_network->network.mac_address);
 		} else {
-			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			pcur_wlan = rtw_find_network(&mlme_priv->scanned_queue, cur_network->network.mac_address);
 			if (pcur_wlan)
 				pcur_wlan->fixed = false;
 
@@ -1203,15 +1203,15 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *buf)
 			if (pcur_sta)
 				rtw_free_stainfo(adapter, pcur_sta);
 
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+			ptarget_wlan = rtw_find_network(&mlme_priv->scanned_queue, pnetwork->network.mac_address);
+			if (check_fwstate(mlme_priv, WIFI_STATION_STATE)) {
 				if (ptarget_wlan)
 					ptarget_wlan->fixed = true;
 			}
 		}
 	} else {
-		ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+		ptarget_wlan = _rtw_find_same_network(&mlme_priv->scanned_queue, pnetwork);
+		if (check_fwstate(mlme_priv, WIFI_STATION_STATE)) {
 			if (ptarget_wlan)
 				ptarget_wlan->fixed = true;
 		}
@@ -1221,34 +1221,34 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *buf)
 	if (!ptarget_wlan) {
 		netdev_dbg(adapter->pnetdev,
 			   "Can't find ptarget_wlan when joinbss_event callback\n");
-		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-		spin_unlock_bh(&pmlmepriv->lock);
+		spin_unlock_bh(&mlme_priv->scanned_queue.lock);
+		spin_unlock_bh(&mlme_priv->lock);
 		return;
 	}
 
 	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
 
 	/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+	if (check_fwstate(mlme_priv, WIFI_STATION_STATE)) {
 		ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
 		if (!ptarget_sta) {
-			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-			spin_unlock_bh(&pmlmepriv->lock);
+			spin_unlock_bh(&mlme_priv->scanned_queue.lock);
+			spin_unlock_bh(&mlme_priv->lock);
 			return;
 		}
 	}
 
 	/* s4. indicate connect */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-		pmlmepriv->cur_network_scanned = ptarget_wlan;
+	if (check_fwstate(mlme_priv, WIFI_STATION_STATE)) {
+		mlme_priv->cur_network_scanned = ptarget_wlan;
 		rtw_indicate_connect(adapter);
 	}
 
-	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+	spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 	/* s5. Cancel assoc_timer */
-	timer_delete_sync(&pmlmepriv->assoc_timer);
+	timer_delete_sync(&mlme_priv->assoc_timer);
 }
 
 void rtw_joinbss_event_callback(struct adapter *adapter, u8 *buf)
@@ -1275,15 +1275,15 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u3
 void rtw_stassoc_event_callback(struct adapter *adapter, u8 *buf)
 {
 	struct sta_info *psta;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct stassoc_event *pstassoc = (struct stassoc_event *)buf;
-	struct wlan_network *cur_network = &pmlmepriv->cur_network;
+	struct wlan_network *cur_network = &mlme_priv->cur_network;
 	struct wlan_network *ptarget_wlan = NULL;
 
 	if (!rtw_access_ctrl(adapter, pstassoc->macaddr))
 		return;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
+	if (check_fwstate(mlme_priv, WIFI_AP_STATE)) {
 		psta = rtw_get_stainfo(&adapter->stapriv, pstassoc->macaddr);
 		if (psta) {
 			u8 *passoc_req = NULL;
@@ -1342,23 +1342,23 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *buf)
 
 	psta->ieee8021x_blocked = false;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	spin_lock_bh(&mlme_priv->lock);
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	if (check_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE) ||
+	    check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
-			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
-			pmlmepriv->cur_network_scanned = ptarget_wlan;
+			spin_lock_bh(&mlme_priv->scanned_queue.lock);
+			ptarget_wlan = rtw_find_network(&mlme_priv->scanned_queue, cur_network->network.mac_address);
+			mlme_priv->cur_network_scanned = ptarget_wlan;
 			if (ptarget_wlan)
 				ptarget_wlan->fixed = true;
-			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+			spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 			/*  a sta + bc/mc_stainfo (not Ibss_stainfo) */
 			rtw_indicate_connect(adapter);
 		}
 	}
 
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 
 	mlmeext_sta_add_event_callback(adapter, psta);
 }
@@ -1370,9 +1370,9 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 	struct wlan_network *pwlan = NULL;
 	struct wlan_bssid_ex    *pdev_network = NULL;
 	u8 *pibss = NULL;
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct stadel_event *pstadel = (struct stadel_event *)buf;
-	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
+	struct wlan_network *tgt_network = &mlme_priv->cur_network;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
@@ -1390,15 +1390,15 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 		rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 	}
 
-	/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) */
+	/* if (check_fwstate(mlme_priv, WIFI_AP_STATE)) */
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		return;
 
 	mlmeext_sta_del_event_callback(adapter);
 
-	spin_lock_bh(&pmlmepriv->lock);
+	spin_lock_bh(&mlme_priv->lock);
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+	if (check_fwstate(mlme_priv, WIFI_STATION_STATE)) {
 		u16 reason = *((unsigned short *)(pstadel->rsvd));
 		bool roam = false;
 		struct wlan_network *roam_target = NULL;
@@ -1409,7 +1409,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 			roam = true;
 		} else if (reason == WLAN_REASON_ACTIVE_ROAM && rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 			roam = true;
-			roam_target = pmlmepriv->roam_network;
+			roam_target = mlme_priv->roam_network;
 		}
 
 		if (roam) {
@@ -1426,48 +1426,48 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 		rtw_free_assoc_resources(adapter, 1);
 		rtw_indicate_disconnect(adapter);
 
-		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
+		spin_lock_bh(&mlme_priv->scanned_queue.lock);
 		/*  remove the network entry in scanned_queue */
-		pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
+		pwlan = rtw_find_network(&mlme_priv->scanned_queue, tgt_network->network.mac_address);
 		if (pwlan) {
 			pwlan->fixed = false;
 			rtw_free_network_nolock(adapter, pwlan);
 		}
-		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+		spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 
 		_rtw_roaming(adapter, roam_target);
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	if (check_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE) ||
+	    check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter, psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
 			u8 ret = _SUCCESS;
 
-			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
+			spin_lock_bh(&mlme_priv->scanned_queue.lock);
 			/* free old ibss network */
-			pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
+			pwlan = rtw_find_network(&mlme_priv->scanned_queue, tgt_network->network.mac_address);
 			if (pwlan) {
 				pwlan->fixed = false;
 				rtw_free_network_nolock(adapter, pwlan);
 			}
-			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+			spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 			/* re-create ibss */
 			pdev_network = &adapter->registrypriv.dev_network;
 			pibss = adapter->registrypriv.dev_network.mac_address;
 
 			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
 
-			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+			memcpy(&pdev_network->ssid, &mlme_priv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
 
 			rtw_update_registrypriv_dev_network(adapter);
 
 			rtw_generate_random_ibss(pibss);
 
-			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-				set_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
-				_clr_fwstate_(pmlmepriv, WIFI_ADHOC_STATE);
+			if (check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
+				set_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE);
+				_clr_fwstate_(mlme_priv, WIFI_ADHOC_STATE);
 			}
 
 			ret = rtw_createbss_cmd(adapter);
@@ -1477,7 +1477,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 	}
 
 unlock:
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 }
 
 void rtw_cpwm_event_callback(struct adapter *padapter, u8 *buf)
@@ -1502,12 +1502,12 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
 						     mlmepriv.assoc_timer);
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
 	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
 		return;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	spin_lock_bh(&mlme_priv->lock);
 
 	if (rtw_to_roam(adapter) > 0) { /* join timeout caused by roaming */
 		while (1) {
@@ -1528,13 +1528,13 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 	} else {
 		rtw_indicate_disconnect(adapter);
-		free_scanqueue(pmlmepriv);/*  */
+		free_scanqueue(mlme_priv);/*  */
 
 		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
 		rtw_cfg80211_indicate_disconnect(adapter);
 	}
 
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 }
 
 /*
@@ -1545,13 +1545,13 @@ void rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
 						     mlmepriv.scan_to_timer);
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	spin_lock_bh(&mlme_priv->lock);
 
-	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
+	_clr_fwstate_(mlme_priv, _FW_UNDER_SURVEY);
 
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 
 	rtw_indicate_scan_done(adapter, true);
 }
@@ -1577,17 +1577,17 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
 
 	rtw_mlme_reset_auto_scan_int(padapter);
 
-	if (pmlmepriv->auto_scan_int_ms != 0 &&
-	    jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
+	if (mlme_priv->auto_scan_int_ms != 0 &&
+	    jiffies_to_msecs(jiffies - mlme_priv->scan_start_time) > mlme_priv->auto_scan_int_ms) {
 		if (!padapter->registrypriv.wifi_spec) {
-			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
+			if (check_fwstate(mlme_priv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
 
-			if (pmlmepriv->link_detect_info.busy_traffic)
+			if (mlme_priv->link_detect_info.busy_traffic)
 				goto exit;
 		}
 
@@ -1786,34 +1786,34 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
  * Calling context:
  * The caller of the sub-routine will be in critical section...
  * The caller must hold the following spinlock
- * pmlmepriv->lock
+ * mlme_priv->lock
  */
 
-int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
+int rtw_select_and_join_from_scanned_queue(struct mlme_priv *mlme_priv)
 {
 	int ret;
 	struct list_head *phead;
 	struct adapter *adapter;
-	struct __queue *queue = &pmlmepriv->scanned_queue;
+	struct __queue *queue = &mlme_priv->scanned_queue;
 	struct wlan_network *pnetwork = NULL;
 	struct wlan_network *candidate = NULL;
 
-	adapter = (struct adapter *)pmlmepriv->nic_hdl;
+	adapter = (struct adapter *)mlme_priv->nic_hdl;
 
-	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
+	spin_lock_bh(&mlme_priv->scanned_queue.lock);
 
-	if (pmlmepriv->roam_network) {
-		candidate = pmlmepriv->roam_network;
-		pmlmepriv->roam_network = NULL;
+	if (mlme_priv->roam_network) {
+		candidate = mlme_priv->roam_network;
+		mlme_priv->roam_network = NULL;
 		goto candidate_exist;
 	}
 
 	phead = get_list_head(queue);
-	list_for_each(pmlmepriv->pscanned, phead) {
-		pnetwork = list_entry(pmlmepriv->pscanned,
+	list_for_each(mlme_priv->pscanned, phead) {
+		pnetwork = list_entry(mlme_priv->pscanned,
 				      struct wlan_network, list);
 
-		rtw_check_join_candidate(pmlmepriv, &candidate, pnetwork);
+		rtw_check_join_candidate(mlme_priv, &candidate, pnetwork);
 	}
 
 	if (!candidate) {
@@ -1826,17 +1826,17 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 candidate_exist:
 
 	/*  check for situation of  _FW_LINKED */
-	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(mlme_priv, _FW_LINKED)) {
 		rtw_disassoc_cmd(adapter, 0, true);
 		rtw_indicate_disconnect(adapter);
 		rtw_free_assoc_resources(adapter, 0);
 	}
 
-	set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
+	set_fwstate(mlme_priv, _FW_UNDER_LINKING);
 	ret = rtw_joinbss_cmd(adapter, candidate);
 
 exit:
-	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
+	spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 	return ret;
 }
 
@@ -2067,7 +2067,7 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 	uint ielength;
 	int iEntry;
 
-	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	uint ndisauthmode = psecuritypriv->ndisauthtype;
 
@@ -2079,7 +2079,7 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 	if ((ndisauthmode == Ndis802_11AuthModeWPA2) || (ndisauthmode == Ndis802_11AuthModeWPA2PSK))
 		authmode = WLAN_EID_RSN;
 
-	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
+	if (check_fwstate(mlme_priv, WIFI_UNDER_WPS)) {
 		memcpy(out_ie + ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
 
 		ielength += psecuritypriv->wps_ie_len;
@@ -2090,7 +2090,7 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
 
-	iEntry = SecIsInPMKIDList(adapter, pmlmepriv->assoc_bssid);
+	iEntry = SecIsInPMKIDList(adapter, mlme_priv->assoc_bssid);
 	if (iEntry < 0)
 		return ielength;
 
@@ -2152,15 +2152,15 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 void rtw_joinbss_reset(struct adapter *padapter)
 {
 	u8 threshold;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
 
-	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv *phtpriv = &mlme_priv->htpriv;
 
 	/* todo: if you want to do something io/reg/hw setting before join_bss, please add code here */
 
-	pmlmepriv->num_FortyMHzIntolerant = 0;
+	mlme_priv->num_FortyMHzIntolerant = 0;
 
-	pmlmepriv->num_sta_no_ht = 0;
+	mlme_priv->num_sta_no_ht = 0;
 
 	phtpriv->ampdu_enable = false;/* reset to disabled */
 
@@ -2180,8 +2180,8 @@ void rtw_joinbss_reset(struct adapter *padapter)
 
 void rtw_ht_use_default_setting(struct adapter *padapter)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct ht_priv *phtpriv = &mlme_priv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
 	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
@@ -2254,8 +2254,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	struct ieee80211_ht_cap ht_capie;
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct ht_priv *phtpriv = &mlme_priv->htpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	phtpriv->ht_option = false;
@@ -2272,7 +2272,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	/* Get HT BW */
 	if (!in_ie) {
 		/* TDLS: TODO 20/40 issue */
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+		if (check_fwstate(mlme_priv, WIFI_STATION_STATE)) {
 			operation_bw = padapter->mlmeextpriv.cur_bwmode;
 			if (operation_bw > CHANNEL_WIDTH_40)
 				operation_bw = CHANNEL_WIDTH_40;
@@ -2375,8 +2375,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	u8 *p, max_ampdu_sz;
 	int len;
 	struct ieee80211_ht_cap *pht_capie;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct ht_priv *phtpriv = &mlme_priv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -2494,8 +2494,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct ht_priv *phtpriv = &mlme_priv->htpriv;
 	u8 cap_content[8] = {0};
 
 	if (phtpriv->bss_coexist)
@@ -2524,22 +2524,22 @@ inline u8 rtw_to_roam(struct adapter *adapter)
 
 void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
 
-	spin_lock_bh(&pmlmepriv->lock);
+	spin_lock_bh(&mlme_priv->lock);
 	_rtw_roaming(padapter, tgt_network);
-	spin_unlock_bh(&pmlmepriv->lock);
+	spin_unlock_bh(&mlme_priv->lock);
 }
 
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct wlan_network *cur_network = &pmlmepriv->cur_network;
+	struct mlme_priv *mlme_priv = &padapter->mlmepriv;
+	struct wlan_network *cur_network = &mlme_priv->cur_network;
 
 	if (rtw_to_roam(padapter) > 0) {
-		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
+		memcpy(&mlme_priv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
 
-		pmlmepriv->assoc_by_bssid = false;
+		mlme_priv->assoc_by_bssid = false;
 
 		while (rtw_do_join(padapter) != _SUCCESS) {
 			rtw_dec_to_roam(padapter);
-- 
2.55.0

