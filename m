Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815938D3E4
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784462208; cv=none; b=j7xbPmfiL1CIMX3siagSvS/MqSp8KFb47T9Ie+R1FK8aAljFKWQrZ7sbvbnLoGoo0KIwZQ+pv+byhwNVyfuyvSRjjgwSLFCtXHojDpKfbBHoRGqDryvuRM/md0t0wh4yWWb3uIGl+aOYdPgC/nTSBfZ22GdvR+5/IBW8h8IAeak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784462208; c=relaxed/simple;
	bh=OSjl4EX/3fDrkQvG1N0m9s/1XtrtQQCpeffXTsvZW1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6VOviXT9o91HR//zDugQnT3f+K6X2BZpPr1M7DRt+6PKriFout0cnFm0SVP9p3idYwFr93eEHx8lQQGOxVSzaeXJDQ1NB19XPsUncVAaK4F7levMXPDImsZBInP5viTpoEsK6pKCNOtQXSGDHHt7YnJYYth8pWV138/V5wchY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7v3zxSd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7v3zxSd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49557167508so6378515e9.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784462204; x=1785067004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AGiODBO1Z6yEmoanwrRsQvRkT2fbNTWXorZsTOj6so=;
        b=g7v3zxSd4bVXJhYIjZiGU+gSI8VtXrGlMn+1o6hjik+uRvwHNN8T2L/l0LkIPDS738
         nNQEwhajO6DtD7GNvJRizZQWhEqQU3aKRXPIxNlohk8HZ9jpPVZbjjjO87gywnfkC63Y
         b8/LQG2ll1roA7l2WqfGKYyTw/yOYwdhQFia9XbPjCAH7BURRnDoOqOeeFqiSz19txCK
         HmwcxzD4/bJz0XLVkgjX5WbckEXr6EZZbt3Sib27WVe68eFA3YMs8yLx41EygDGIMS89
         0kQE4DapaMT+ZWxf2Y7FHKkZeaqC6WhmaaFG1+RrDd5Qyd2JFWkI7TO8gy/ygXovxKFK
         370w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784462204; x=1785067004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AGiODBO1Z6yEmoanwrRsQvRkT2fbNTWXorZsTOj6so=;
        b=VdbZf/WC+166CCBfLKeh/GzPBRaZYZ5Bl8CPvXpqEYqcldDFvnkDghhPwLrlOk3zjW
         ECxfR/hTXwHVtZri+FmdN8O7WJf3pJT1aCz6I2QH3GLZ+BNdzc9Jb9VWHAuLulfGhcH8
         9MNd4EETI4QywUDzdeIoOCPQMty86+c7IxRUSoPuZt1EfIMv0eRpKEibVk3J1ci6hk2M
         aiqbTiI9Lu6d4JY95aFEINOlXJRkSlIj2ZBVWzRN5BYtZHvrKKrYwhcKFIvfqyTYpdPD
         6RqV3iAfHEXvZ6dIFNw8a1bhluGVXazdZSY/RTbuJ0YL+QXWRJsUdLu55n791scEje51
         dmhQ==
X-Gm-Message-State: AOJu0YwRDnvVNHMoFXMAKTER17dlgiz42jSkNWfFHJiYLe7JHlW9i2K9
	09dCkp5RarniiryTSZ20c3RaLOiGlVifhuf1go/d6WTQ+Ce9kisr8CrS
X-Gm-Gg: AfdE7cnKeeNJifJHylfHMIylhoGlOW22l0zYgo9/pKKvn0ZqNPPkahE8C/MVNPObYxr
	5qtFPk4ennU8j6m0Y0aMi14viQCFe7JondNzUg5BdjIsbwbHMwjK07Y9wI1YkGYad2sCVGxtNM1
	M6rV2mK/8kBuKTYVCSm2Y2qlxmPpqH19mtu/KvSAlyCWWZpnfcVe/De7SbEuFFX1P49OUB7edlp
	g29y2rqg19RwiS8DpUWWuSo+PCyNtLsmjiwuUG+OrxJ6YETNFs0o8n56oo7b15t4o5ULnOQr4Me
	uStby4U3jjgzvEWNiBrOBq3QE12Ic5kAeI8Xh4VcwZe5qVpI47Orj0jGYMB7ErjnLGX8+z8t3eW
	W6TiqRaszTErIgkBWaiAZf/eak9k4j3WAtqYuJgKAIJBza4MsabNoIBuMxitalMIqc1+nNdTSPz
	Ca4Ab9+uN5PT7fQ94N7eJheDa9d5BrSpBD8YHtG27GqMzytAJSeyxyEQn0PWQe6c3ZlKU=
X-Received: by 2002:a05:600c:5247:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-495573e1da1mr41005745e9.9.1784462203846;
        Sun, 19 Jul 2026 04:56:43 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a35830sm199719265e9.3.2026.07.19.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 04:56:43 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove unnecessary whitespace
Date: Sun, 19 Jul 2026 11:54:49 +0000
Message-ID: <20260719115451.4401-2-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260719115451.4401-1-fliegbert2@gmail.com>
References: <20260719115451.4401-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary whitespace to improve readability and coding style
consistency.

No functional changes are intended in this patch.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 154 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  56 +++----
 3 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7a232daf5c56..cd6c7cbade9b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -39,13 +39,13 @@ static void rtw_init_mlme_timer(struct adapter *padapter)
 		    _rtw_set_scan_deny_timer_hdl, 0);
 }
 
-int	rtw_init_mlme_priv(struct adapter *padapter)
+int rtw_init_mlme_priv(struct adapter *padapter)
 {
-	int	i;
+	int i;
 	u8 *pbuf;
-	struct wlan_network	*pnetwork;
-	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
-	int	res = _SUCCESS;
+	struct wlan_network *pnetwork;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	int res = _SUCCESS;
 
 	pmlmepriv->nic_hdl = (u8 *)padapter;
 
@@ -137,9 +137,9 @@ void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 	}
 }
 
-struct	wlan_network *rtw_alloc_network(struct	mlme_priv *pmlmepriv)
+struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
 {
-	struct	wlan_network	*pnetwork;
+	struct wlan_network *pnetwork;
 	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 	struct list_head *plist = NULL;
 
@@ -167,7 +167,7 @@ struct	wlan_network *rtw_alloc_network(struct	mlme_priv *pmlmepriv)
 	return pnetwork;
 }
 
-void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwork, u8 isfreeall)
+void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork, u8 isfreeall)
 {
 	unsigned int delta_time;
 	u32 lifetime = SCANQUEUE_LIFETIME;
@@ -198,7 +198,7 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 	spin_unlock_bh(&free_queue->lock);
 }
 
-void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
+void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
 {
 	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 
@@ -220,8 +220,8 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
  */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
-	struct list_head	*phead, *plist;
-	struct	wlan_network *pnetwork = NULL;
+	struct list_head *phead, *plist;
+	struct wlan_network *pnetwork = NULL;
 
 	if (is_zero_ether_addr(addr)) {
 		pnetwork = NULL;
@@ -319,9 +319,9 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
  *
  * Shall be called under atomic context... to avoid possible racing condition...
  */
-struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
+struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
-	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
+	struct wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
 
 	return pnetwork;
 }
@@ -385,12 +385,12 @@ struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struc
 	return found;
 }
 
-struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
+struct wlan_network *rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 {
-	struct list_head	*plist, *phead;
+	struct list_head *plist, *phead;
 
-	struct	wlan_network	*pwlan = NULL;
-	struct	wlan_network	*oldest = NULL;
+	struct	wlan_network *pwlan = NULL;
+	struct	wlan_network *oldest = NULL;
 
 	phead = get_list_head(scanned_queue);
 
@@ -467,12 +467,12 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 /* Caller must hold pmlmepriv->lock first. */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
-	struct list_head	*plist, *phead;
+	struct list_head *plist, *phead;
 	u32 bssid_ex_sz;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct __queue	*queue	= &pmlmepriv->scanned_queue;
-	struct wlan_network	*pnetwork = NULL;
-	struct wlan_network	*oldest = NULL;
+	struct __queue *queue = &pmlmepriv->scanned_queue;
+	struct wlan_network *pnetwork = NULL;
+	struct wlan_network *oldest = NULL;
 	int target_find = 0;
 	u8 feature = 0;
 
@@ -632,11 +632,11 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	return bselected;
 }
 
-void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
+void rtw_survey_event_callback(struct adapter *adapter, u8 *pbuf)
 {
 	u32 len;
 	struct wlan_bssid_ex *pnetwork;
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	pnetwork = (struct wlan_bssid_ex *)pbuf;
 
@@ -675,9 +675,9 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
-void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
+void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
 {
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	spin_lock_bh(&pmlmepriv->lock);
 	if (pmlmepriv->wps_probe_req_ie) {
@@ -704,7 +704,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex    *pdev_network = &adapter->registrypriv.dev_network;
+					struct wlan_bssid_ex *pdev_network = &adapter->registrypriv.dev_network;
 					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
 
 					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
@@ -782,11 +782,11 @@ void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf)
 {
 }
 
-static void free_scanqueue(struct	mlme_priv *pmlmepriv)
+static void free_scanqueue(struct mlme_priv *pmlmepriv)
 {
 	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 	struct __queue *scan_queue = &pmlmepriv->scanned_queue;
-	struct list_head	*plist, *phead, *ptemp;
+	struct list_head *plist, *phead, *ptemp;
 
 	spin_lock_bh(&scan_queue->lock);
 	spin_lock_bh(&free_queue->lock);
@@ -808,7 +808,7 @@ static void free_scanqueue(struct	mlme_priv *pmlmepriv)
 static void find_network(struct adapter *adapter)
 {
 	struct wlan_network *pwlan = NULL;
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
 	pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
@@ -825,14 +825,14 @@ static void find_network(struct adapter *adapter)
 /* rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
 
 		psta = rtw_get_stainfo(&adapter->stapriv, tgt_network->network.mac_address);
-		rtw_free_stainfo(adapter,  psta);
+		rtw_free_stainfo(adapter, psta);
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
@@ -954,7 +954,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 	if (psta) { /* update ptarget_sta */
 
-		psta->aid  = pnetwork->join_res;
+		psta->aid = pnetwork->join_res;
 
 		update_sta_info(padapter, psta);
 
@@ -1024,10 +1024,10 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
+	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 
 	/*  why not use ptarget_wlan?? */
 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.length);
@@ -1073,7 +1073,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
 
-static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
+static struct rt_pmkid_list backupPMKIDList[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
 	u8 backupPMKIDIndex = 0;
@@ -1141,12 +1141,12 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
-	struct	sta_priv *pstapriv = &adapter->stapriv;
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct wlan_network	*pnetwork	= (struct wlan_network *)pbuf;
-	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
-	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
-	unsigned int		the_same_macaddr = false;
+	struct sta_priv *pstapriv = &adapter->stapriv;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct wlan_network *pnetwork = (struct wlan_network *)pbuf;
+	struct wlan_network *cur_network = &pmlmepriv->cur_network;
+	struct wlan_network *pcur_wlan = NULL, *ptarget_wlan = NULL;
+	unsigned int the_same_macaddr = false;
 
 	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
 
@@ -1248,7 +1248,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf)
 {
-	struct wlan_network	*pnetwork	= (struct wlan_network *)pbuf;
+	struct wlan_network *pnetwork = (struct wlan_network *)pbuf;
 
 	mlmeext_joinbss_event_callback(adapter, pnetwork->join_res);
 
@@ -1271,9 +1271,9 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 {
 	struct sta_info *psta;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct stassoc_event	*pstassoc	= (struct stassoc_event *)pbuf;
-	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
-	struct wlan_network	*ptarget_wlan = NULL;
+	struct stassoc_event *pstassoc = (struct stassoc_event *)pbuf;
+	struct wlan_network *cur_network = &pmlmepriv->cur_network;
+	struct wlan_network *ptarget_wlan = NULL;
 
 	if (!rtw_access_ctrl(adapter, pstassoc->macaddr))
 		return;
@@ -1365,8 +1365,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network *pwlan = NULL;
 	struct wlan_bssid_ex    *pdev_network = NULL;
 	u8 *pibss = NULL;
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct	stadel_event *pstadel	= (struct stadel_event *)pbuf;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct stadel_event *pstadel = (struct stadel_event *)pbuf;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -1435,7 +1435,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
 	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-		rtw_free_stainfo(adapter,  psta);
+		rtw_free_stainfo(adapter, psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
 			u8 ret = _SUCCESS;
@@ -1497,7 +1497,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
 						     mlmepriv.assoc_timer);
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 		return;
@@ -1540,7 +1540,7 @@ void rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
 						     mlmepriv.scan_to_timer);
-	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	spin_lock_bh(&pmlmepriv->lock);
 
@@ -1696,10 +1696,10 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 {
 	int ret = _FAIL;
-	struct list_head	*phead;
-	struct __queue	*queue	= &mlme->scanned_queue;
-	struct	wlan_network	*pnetwork = NULL;
-	struct	wlan_network	*candidate = NULL;
+	struct list_head *phead;
+	struct __queue *queue = &mlme->scanned_queue;
+	struct wlan_network *pnetwork = NULL;
+	struct wlan_network *candidate = NULL;
 
 	if (!mlme->cur_network_scanned) {
 		WARN_ON(1);
@@ -1787,11 +1787,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
 	int ret;
-	struct list_head	*phead;
+	struct list_head *phead;
 	struct adapter *adapter;
-	struct __queue	*queue	= &pmlmepriv->scanned_queue;
-	struct	wlan_network	*pnetwork = NULL;
-	struct	wlan_network	*candidate = NULL;
+	struct __queue *queue = &pmlmepriv->scanned_queue;
+	struct wlan_network *pnetwork = NULL;
+	struct wlan_network *candidate = NULL;
 
 	adapter = (struct adapter *)pmlmepriv->nic_hdl;
 
@@ -1837,10 +1837,10 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 
 signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecuritypriv)
 {
-	struct	cmd_obj *pcmd;
-	struct	setauth_parm *psetauthparm;
-	struct	cmd_priv *pcmdpriv = &adapter->cmdpriv;
-	signed int		res = _SUCCESS;
+	struct cmd_obj *pcmd;
+	struct setauth_parm *psetauthparm;
+	struct cmd_priv *pcmdpriv = &adapter->cmdpriv;
+	signed int res = _SUCCESS;
 
 	pcmd = kzalloc_obj(*pcmd);
 	if (!pcmd) {
@@ -1859,7 +1859,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 
 	pcmd->cmdcode = SET_AUTH_CMD;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
-	pcmd->cmdsz =  (sizeof(struct setauth_parm));
+	pcmd->cmdsz = (sizeof(struct setauth_parm));
 	pcmd->rsp = NULL;
 	pcmd->rspsz = 0;
 
@@ -1875,9 +1875,9 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
-	struct setkey_parm	*psetkeyparm;
+	struct setkey_parm *psetkeyparm;
 	struct cmd_priv *pcmdpriv = &adapter->cmdpriv;
-	signed int	res = _SUCCESS;
+	signed int res = _SUCCESS;
 
 	psetkeyparm = kzalloc_obj(*psetkeyparm);
 	if (!psetkeyparm) {
@@ -1930,7 +1930,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 
 		pcmd->cmdcode = SET_KEY_CMD;
 		pcmd->parmbuf = (u8 *)psetkeyparm;
-		pcmd->cmdsz =  (sizeof(struct setkey_parm));
+		pcmd->cmdsz = (sizeof(struct setkey_parm));
 		pcmd->rsp = NULL;
 		pcmd->rspsz = 0;
 
@@ -1948,7 +1948,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 /* adjust ies for rtw_joinbss_cmd in WMM */
 int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
 {
-	unsigned	int ielength = 0;
+	unsigned int ielength = 0;
 	unsigned int i, j;
 
 	i = 12; /* after the fixed IE */
@@ -2025,7 +2025,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 
 static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
-	uint	len;
+	uint len;
 	u8 *buff, *p;
 	union iwreq_data wrqu;
 
@@ -2059,12 +2059,12 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
 {
 	u8 authmode = 0x0;
-	uint	ielength;
+	uint ielength;
 	int iEntry;
 
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
-	uint	ndisauthmode = psecuritypriv->ndisauthtype;
+	uint ndisauthmode = psecuritypriv->ndisauthtype;
 
 	/* copy fixed ie only */
 	memcpy(out_ie, in_ie, 12);
@@ -2099,7 +2099,7 @@ void rtw_init_registrypriv_dev_network(struct adapter *adapter)
 {
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	struct eeprom_priv *peepriv = &adapter->eeprompriv;
-	struct wlan_bssid_ex    *pdev_network = &pregistrypriv->dev_network;
+	struct wlan_bssid_ex *pdev_network = &pregistrypriv->dev_network;
 	u8 *myhwaddr = myid(peepriv);
 
 	memcpy(pdev_network->mac_address, myhwaddr, ETH_ALEN);
@@ -2114,9 +2114,9 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 {
 	int sz = 0;
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
-	struct wlan_bssid_ex    *pdev_network = &pregistrypriv->dev_network;
-	struct	security_priv *psecuritypriv = &adapter->securitypriv;
-	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
+	struct wlan_bssid_ex *pdev_network = &pregistrypriv->dev_network;
+	struct security_priv *psecuritypriv = &adapter->securitypriv;
+	struct wlan_network *cur_network = &adapter->mlmepriv.cur_network;
 
 	pdev_network->privacy = (psecuritypriv->dot11_privacy_algrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
 
@@ -2137,7 +2137,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 	pdev_network->ie_length = sz;
 
-	pdev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)pdev_network);
+	pdev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex *)pdev_network);
 
 	/* notes: translate ie_length & length after assign the length to cmdsz in createbss_cmd(); */
 	/* pdev_network->ie_length = cpu_to_le32(sz); */
@@ -2178,8 +2178,8 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	bool		bHwLDPCSupport = false, bHwSTBCSupport = false;
-	bool		bHwSupportBeamformer = false, bHwSupportBeamformee = false;
+	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
+	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
 
 	if (pregistrypriv->wifi_spec)
 		phtpriv->bss_coexist = 1;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index aea660f27959..6d014bf8fa96 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -454,7 +454,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
 /* any station allocated can be searched by hash list */
 struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 {
-	struct list_head	*plist, *phead;
+	struct list_head *plist, *phead;
 	struct sta_info *psta = NULL;
 	u32 index;
 	u8 *addr;
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 6da157914925..f4c1456f1476 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -19,8 +19,8 @@ typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*
 typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
-	u32  ssid_length;
-	u8  ssid[32];
+	u32 ssid_length;
+	u8 ssid[32];
 };
 
 /*
@@ -35,15 +35,15 @@ struct ndis_802_11_conf {
 };
 
 struct ndis_802_11_fix_ie {
-	u8  time_stamp[8];
-	u16  beacon_interval;
-	u16  capabilities;
+	u8 time_stamp[8];
+	u16 beacon_interval;
+	u16 capabilities;
 };
 
 struct ndis_80211_var_ie {
-	u8  element_id;
-	u8  length;
-	u8  data[];
+	u8 element_id;
+	u8 length;
+	u8 data[];
 };
 
 /* Length is the 4 bytes multiples of the sum of
@@ -126,7 +126,7 @@ struct wlan_bcn_info {
 	int is_8021x;
 
 	/* bwmode 20/40 and ch_offset UP/LOW */
-	unsigned short	ht_cap_info;
+	unsigned short ht_cap_info;
 	unsigned char ht_info_infos_0;
 };
 
@@ -134,18 +134,18 @@ struct wlan_bcn_info {
  * struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
  */
 struct wlan_bssid_ex {
-	u32  length;
+	u32 length;
 	u8 mac_address[ETH_ALEN];
-	u8  reserved[2];/* 0]: IS beacon frame */
-	struct ndis_802_11_ssid  ssid;
-	u32  privacy;
-	long  rssi;/* in dBM, raw data , get from PHY) */
-	struct ndis_802_11_conf  configuration;
-	enum nl80211_iftype  infrastructure_mode;
-	NDIS_802_11_RATES_EX  supported_rates;
+	u8 reserved[2];/* 0]: IS beacon frame */
+	struct ndis_802_11_ssid ssid;
+	u32 privacy;
+	long rssi;/* in dBM, raw data , get from PHY) */
+	struct ndis_802_11_conf configuration;
+	enum nl80211_iftype infrastructure_mode;
+	NDIS_802_11_RATES_EX supported_rates;
 	struct wlan_phy_info phy_info;
-	u32  ie_length;
-	u8  ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
+	u32 ie_length;
+	u8 ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
 } __packed;
 
 static inline uint get_wlan_bssid_ex_sz(struct wlan_bssid_ex *bss)
@@ -153,15 +153,15 @@ static inline uint get_wlan_bssid_ex_sz(struct wlan_bssid_ex *bss)
 	return (sizeof(struct wlan_bssid_ex) - MAX_IE_SZ + bss->ie_length);
 }
 
-struct	wlan_network {
-	struct list_head	list;
-	int	network_type;	/* refer to ieee80211.h for WIRELESS_11A/B/G */
-	int	fixed;			/*  set to fixed when not to be removed as site-surveying */
-	unsigned long	last_scanned; /* timestamp for the network */
-	int	aid;			/* will only be valid when a BSS is joinned. */
-	int	join_res;
-	struct wlan_bssid_ex	network; /* must be the last item */
-	struct wlan_bcn_info	bcn_info;
+struct wlan_network {
+	struct list_head list;
+	int network_type;	/* refer to ieee80211.h for WIRELESS_11A/B/G */
+	int fixed;			/*  set to fixed when not to be removed as site-surveying */
+	unsigned long last_scanned; /* timestamp for the network */
+	int aid;			/* will only be valid when a BSS is joinned. */
+	int join_res;
+	struct wlan_bssid_ex network; /* must be the last item */
+	struct wlan_bcn_info bcn_info;
 };
 
 enum {
-- 
2.54.0

