Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716502765FF
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394731; cv=none; b=myCrG/cFMN8+ofi71nCiT9DJq3pL9WJCcwWqzY+s5/KZWI8zvYRklXKBLTYLe8jTZ4rGvC3zaHEwmpaY+xZpXSw6JGNHARkzmlJ6YcF7vEzULaGHIIpPsEfo0YwYzH9HpAq1HLCMToYvOAuZ9w/61wuXWIbA/xJ9WomRRnVvktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394731; c=relaxed/simple;
	bh=wv1wAz5G5jTk9iKfTQXieVLbuRkIyBCE8b6i9HhVL3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvC/oZ2n7PztaA21eUNVveZUlZ2h9zwXr5v8iVBq2hz9mUh0d9e09YcMJfNgoBgOLX9osz7fHlegnQEPko95Ksx3w8EKeS2Si7zVg504IGFq7j7yRp0aGASLIfjXcza7T3ECLIwILa0IXtUvhD5LVGPuqiICh2IPratJ/BBMVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=Vsojaa0s; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="Vsojaa0s"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A62B84F97;
	Tue, 28 Apr 2026 19:45:27 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394727; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ys2ruBN+FMlbNaJuod+QMjGTvoSg6mzg3rPSjZ68TBE=;
	b=Vsojaa0suPojEy68pvB/5F7ESU4F5X7DoFUWkWmDfPuvUDVJGP7/QyqLqvNRU5XjeLjQc/
	rz4OEoNEjJuqhCZoUbOsF8K63Iki5i1zdUDEiXiUsF5xo0nhlPn7e7/AzQo/BbjD1Jy/PM
	CEGAoRvPkXC3tygWIPUyU7We++MrXtkKS62kXqp/OLxwGbzDiJyj9UBf3PRRucY7f87hh8
	lc8jpYZNnvMCYHO6N4UHGnLC/fwqr1KWN2SMo/GO9rQ0NdBCXPfmzta6QsTnTmaHr/uwGp
	/ejgGcM92MxQbhNzJ5VM6I5OWl3mOnHdRWQnRb467AuLRrIis3ljm1EntECB0FuuW0aClr
	SklnH122jwXQYq6KZSlJOKgbb4n/41do9xlp1rCU9dhnx9ApwNm2/8eTPIPVlnPvHlzJcI
	HsDaKAiZSROXyQiqhpIA/T93BM6yLrlpzFfT3NU4vvQkiKYc08OIssXMXMXCcjTgrKM9Ar
	f/yVoIvpMxBlhoa1o5s7mkedWbQYeoLsDOd65j3ENqzhu1Af0WF7YrF8HDYJ4ByXmhD4qf
	Ya7TBtnL+5TZllAdIXKZUfPofKk7tvBKqoLGUCQOgaje4vzz028pHPlOsBoQwRjfl39zpr
	mJHq3gqjdvg4dRO1Afs81Nh0PR0s41nH6ZE/SHM627F5z2CnazdYo=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/8] staging: rtl8723bs: rtw_mlme: wrap lines exceeding 100 columns
Date: Tue, 28 Apr 2026 19:44:33 +0300
Message-ID: <20260428164513.763471-4-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428164513.763471-1-me@cipherat.com>
References: <20260428164513.763471-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Wrap long lines to bring them within the 100 column limit.
No functional changes.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 205 +++++++++++++++-------
 1 file changed, 142 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 9f21a2226dbd..a35d726b803c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
 	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	/*  1: active, 0: passive. Maybe someday we should rename this variable
+	 *  to "active_mode" (Jeff)
+	 */
+	pmlmepriv->scan_mode = SCAN_ACTIVE;
 
 	spin_lock_init(&pmlmepriv->lock);
 	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
@@ -125,7 +128,8 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_beacon_ie, &pmlmepriv->p2p_beacon_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_req_ie, &pmlmepriv->p2p_probe_req_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_resp_ie, &pmlmepriv->p2p_probe_resp_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie, &pmlmepriv->p2p_go_probe_resp_ie_len);
+	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie,
+			      &pmlmepriv->p2p_go_probe_resp_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
 }
 
@@ -369,7 +373,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 			(d_cap & WLAN_CAPABILITY_ESS));
 }
 
-struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
+struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
+					    struct wlan_network *network)
 {
 	struct list_head *phead, *plist;
 	struct wlan_network *found = NULL;
@@ -420,7 +425,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
+	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
 		ss_final = padapter->recvpriv.signal_strength;
 		sq_final = padapter->recvpriv.signal_qual;
@@ -431,11 +437,15 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 			rssi_final = rssi_ori;
 	} else {
 		if (sq_smp != 101) { /* from the right channel */
-			ss_final = ((u32)(src->phy_info.signal_strength) + (u32)(dst->phy_info.signal_strength) * 4) / 5;
-			sq_final = ((u32)(src->phy_info.signal_quality) + (u32)(dst->phy_info.signal_quality) * 4) / 5;
+			ss_final = ((u32)(src->phy_info.signal_strength) +
+				    (u32)(dst->phy_info.signal_strength) * 4) / 5;
+			sq_final = ((u32)(src->phy_info.signal_quality) +
+				    (u32)(dst->phy_info.signal_quality) * 4) / 5;
 			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		} else {
-			/* bss info not receiving from the right channel, use the original RX signal infos */
+			/* bss info not receiving from the right channel,
+			 * use the original RX signal infos
+			 */
 			ss_final = dst->phy_info.signal_strength;
 			sq_final = dst->phy_info.signal_quality;
 			rssi_final = dst->rssi;
@@ -462,7 +472,8 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
+	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
 			return;
@@ -606,7 +617,9 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
 		if (pnetwork->network.ie_length < _FIXED_IE_LENGTH_)
 			return false;
-		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_,
+				   pnetwork->network.ie_length - _FIXED_IE_LENGTH_,
+				   NULL, &wps_ielen))
 			return true;
 		else
 			return false;
@@ -622,7 +635,9 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 			if (pnetwork->network.ie_length < _BEACON_IE_OFFSET_) {
 				bselected = false;
 			} else {
-				p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+				p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_,
+					       WLAN_EID_RSN, &ie_len,
+					       (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
 				if (p && ie_len > 0)
 					bselected = true;
 				else
@@ -663,12 +678,14 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 
 	/*  update IBSS_network 's timestamp */
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
-		if (!memcmp(&pmlmepriv->cur_network.network.mac_address, pnetwork->mac_address, ETH_ALEN)) {
+		if (!memcmp(&pmlmepriv->cur_network.network.mac_address,
+			    pnetwork->mac_address, ETH_ALEN)) {
 			struct wlan_network *ibss_wlan = NULL;
 
 			memcpy(pmlmepriv->cur_network.network.ies, pnetwork->ies, 8);
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-			ibss_wlan = rtw_find_network(&pmlmepriv->scanned_queue,  pnetwork->mac_address);
+			ibss_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+						     pnetwork->mac_address);
 			if (ibss_wlan) {
 				memcpy(ibss_wlan->network.ies, pnetwork->ies, 8);
 				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
@@ -722,10 +739,13 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					struct wlan_bssid_ex    *pdev_network = &adapter->registrypriv.dev_network;
 					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
+					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
+					 * because don't set assoc_timer
+					 */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
-					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
 					rtw_generate_random_ibss(pibss);
@@ -957,7 +977,8 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = false;
 }
 
-static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
+static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
+						   struct wlan_network *pnetwork)
 {
 	int i;
 	struct sta_info *bmc_sta, *psta = NULL;
@@ -1014,7 +1035,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		}
 
 		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
-		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indicate_seq) to default value = 0xffff */
+		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl
+		 * wstart_b(indicate_seq) to default value = 0xffff
+		 */
 		/* todo: check if AP can send A-MPDU packets */
 		for (i = 0; i < 16 ; i++) {
 			preorder_ctrl = &psta->recvreorder_ctrl[i];
@@ -1031,7 +1054,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 				preorder_ctrl->enable = false;
 				preorder_ctrl->indicate_seq = 0xffff;
 				preorder_ctrl->wend_b = 0xffff;
-				preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
+				/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
+				preorder_ctrl->wsize_b = 64;
 			}
 		}
 	}
@@ -1041,7 +1065,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter,
+				       struct wlan_network *ptarget_wlan,
+				       struct wlan_network  *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
@@ -1058,7 +1084,9 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 
 	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
-	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
+	/* the ptarget_wlan->network.rssi is raw data, we use
+	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
+	 */
 	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
@@ -1084,10 +1112,12 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	if (cur_network->network.ie_length < sizeof(struct ndis_802_11_fix_ie))
 		return;
 
-	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length - sizeof(struct ndis_802_11_fix_ie)));
+	rtw_update_protection(padapter,
+			      (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
+			      (cur_network->network.ie_length - sizeof(struct ndis_802_11_fix_ie)));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length,
+			  (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -1107,9 +1137,12 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
 		/*  */
 		/*  Backup the btkip_countermeasure information. */
-		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
+		/*  When the countermeasure is trigger, the driver have
+		 *  to disconnect with AP for 60 seconds.
+		 */
 
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
 		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
@@ -1120,8 +1153,11 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		memset((unsigned char *)&adapter->securitypriv, 0, sizeof(struct security_priv));
 
 		/*  Added by Albert 2009/02/18 */
-		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		/*  Restore the PMK information to securitypriv structure
+		 * for the following connection.
+		 */
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
 		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
@@ -1153,9 +1189,13 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 /* Notes: the function could be > passive_level (the same context as Rx tasklet) */
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-/* if join_res > 0, for (fw_state ==WIFI_STATION_STATE), we check if  "ptarget_sta" & "ptarget_wlan" exist. */
+/* if join_res > 0, for (fw_state ==WIFI_STATION_STATE), we check
+ * if  "ptarget_sta" & "ptarget_wlan" exist.
+ */
 /* if join_res > 0, for (fw_state ==WIFI_ADHOC_STATE), we only check if "ptarget_wlan" exist. */
-/* if join_res > 0, update "cur_network->network" from "pnetwork->network" if (ptarget_wlan != NULL). */
+/* if join_res > 0, update "cur_network->network" from
+ * "pnetwork->network" if (ptarget_wlan != NULL).
+ */
 /*  */
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
@@ -1167,7 +1207,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 
-	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
+	the_same_macaddr = !memcmp(pnetwork->network.mac_address,
+				   cur_network->network.mac_address, ETH_ALEN);
 
 	pnetwork->network.length = get_wlan_bssid_ex_sz(&pnetwork->network);
 	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
@@ -1207,9 +1248,11 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	/* s1. find ptarget_wlan */
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		if (the_same_macaddr) {
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+							cur_network->network.mac_address);
 		} else {
-			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+						     cur_network->network.mac_address);
 			if (pcur_wlan)
 				pcur_wlan->fixed = false;
 
@@ -1217,7 +1260,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			if (pcur_sta)
 				rtw_free_stainfo(adapter, pcur_sta);
 
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
+			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+							pnetwork->network.mac_address);
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 				if (ptarget_wlan)
 					ptarget_wlan->fixed = true;
@@ -1242,7 +1286,9 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
 
-	/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
+	/* s3. find ptarget_sta & update ptarget_sta after update
+	 * cur_network only for station mode
+	 */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
 		if (!ptarget_sta) {
@@ -1310,7 +1356,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 			/* report to upper layer */
 			spin_lock_bh(&psta->lock);
 			if (psta->passoc_req && psta->assoc_req_len > 0) {
-				passoc_req = kmemdup(psta->passoc_req, psta->assoc_req_len, GFP_ATOMIC);
+				passoc_req = kmemdup(psta->passoc_req,
+						     psta->assoc_req_len, GFP_ATOMIC);
 				if (passoc_req) {
 					assoc_req_len = psta->assoc_req_len;
 
@@ -1335,7 +1382,10 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	if (psta) {
 		/* the sta have been in sta_info_queue => do nothing */
 
-		return; /* between drv has received this event before and  fw have not yet to set key to CAM_ENTRY) */
+		/* between drv has received this event before and
+		 * fw have not yet to set key to CAM_ENTRY)
+		 */
+		return;
 	}
 
 	psta = rtw_alloc_stainfo(&adapter->stapriv, pstassoc->macaddr);
@@ -1362,7 +1412,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+							cur_network->network.mac_address);
 			pmlmepriv->cur_network_scanned = ptarget_wlan;
 			if (ptarget_wlan)
 				ptarget_wlan->fixed = true;
@@ -1419,16 +1470,19 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		if (adapter->registrypriv.wifi_spec == 1) {
 			roam = false;
-		} else if (reason == WLAN_REASON_EXPIRATION_CHK && rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
+		} else if (reason == WLAN_REASON_EXPIRATION_CHK &&
+			   rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
 			roam = true;
-		} else if (reason == WLAN_REASON_ACTIVE_ROAM && rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+		} else if (reason == WLAN_REASON_ACTIVE_ROAM &&
+			   rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 			roam = true;
 			roam_target = pmlmepriv->roam_network;
 		}
 
 		if (roam) {
 			if (rtw_to_roam(adapter) > 0)
-				rtw_dec_to_roam(adapter); /* this stadel_event is caused by roaming, decrease to_roam */
+				/* this stadel_event is caused by roaming, decrease to_roam */
+				rtw_dec_to_roam(adapter);
 			else if (rtw_to_roam(adapter) == 0)
 				rtw_set_to_roam(adapter, adapter->registrypriv.max_roaming_times);
 		} else {
@@ -1442,7 +1496,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		/*  remove the network entry in scanned_queue */
-		pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
+		pwlan = rtw_find_network(&pmlmepriv->scanned_queue,
+					 tgt_network->network.mac_address);
 		if (pwlan) {
 			pwlan->fixed = false;
 			rtw_free_network_nolock(adapter, pwlan);
@@ -1456,12 +1511,14 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
-		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
+		/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
+		if (adapter->stapriv.asoc_sta_count == 1) {
 			u8 ret = _SUCCESS;
 
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			/* free old ibss network */
-			pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
+			pwlan = rtw_find_network(&pmlmepriv->scanned_queue,
+						 tgt_network->network.mac_address);
 			if (pwlan) {
 				pwlan->fixed = false;
 				rtw_free_network_nolock(adapter, pwlan);
@@ -1471,9 +1528,11 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 			pdev_network = &adapter->registrypriv.dev_network;
 			pibss = adapter->registrypriv.dev_network.mac_address;
 
-			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
+			memcpy(pdev_network, &tgt_network->network,
+			       get_wlan_bssid_ex_sz(&tgt_network->network));
 
-			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+			       sizeof(struct ndis_802_11_ssid));
 
 			rtw_update_registrypriv_dev_network(adapter);
 
@@ -1544,7 +1603,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 		rtw_indicate_disconnect(adapter);
 		free_scanqueue(pmlmepriv);/*  */
 
-		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
+		/* indicate disconnect for the case that join_timeout
+		 * and check_fwstate != FW_LINKED
+		 */
 		rtw_cfg80211_indicate_disconnect(adapter);
 	}
 
@@ -1593,8 +1654,8 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 
 	rtw_mlme_reset_auto_scan_int(padapter);
 
-	if (pmlmepriv->auto_scan_int_ms != 0
-		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
+	if (pmlmepriv->auto_scan_int_ms != 0 &&
+	    jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
 		if (!padapter->registrypriv.wifi_spec) {
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
@@ -1636,7 +1697,9 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
 			rtw_hal_dm_watchdog_in_lps(adapter);
 		} else {
-			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1) in traffic_status_watchdog() */
+			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1)
+			 * in traffic_status_watchdog()
+			 */
 		}
 
 	} else {
@@ -1769,8 +1832,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 
 	/* check ssid, if needed */
 	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
-		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length
-			|| memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid, mlme->assoc_ssid.ssid_length)
+		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length ||
+		    memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid,
+			   mlme->assoc_ssid.ssid_length)
 		)
 			goto exit;
 	}
@@ -1888,7 +1952,8 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	return res;
 }
 
-signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
+signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv,
+		       signed int keyid, u8 set_tx, bool enqueue)
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
@@ -1963,7 +2028,8 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			uint in_len, uint initial_out_len)
 {
 	unsigned	int ielength = 0;
 	unsigned int i, j;
@@ -2097,7 +2163,8 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		ielength += psecuritypriv->wps_ie_len;
 	} else if ((authmode == WLAN_EID_VENDOR_SPECIFIC) || (authmode == WLAN_EID_RSN)) {
 		/* copy RSN or SSN */
-		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecuritypriv->supplicant_ie[1] + 2);
+		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0],
+		       psecuritypriv->supplicant_ie[1] + 2);
 		ielength += psecuritypriv->supplicant_ie[1] + 2;
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
@@ -2135,7 +2202,8 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	security_priv *psecuritypriv = &adapter->securitypriv;
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
+	/*  adhoc no 802.1x */
+	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
 	pdev_network->rssi = 0;
 
@@ -2165,14 +2233,18 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	/*  1. Supported rates */
 	/*  2. IE */
 
-	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv->wireless_mode) ;  will be called in rtw_generate_ie */
+	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv->wireless_mode);
+	 * will be called in rtw_generate_ie
+	 */
 	sz = rtw_generate_ie(pregistrypriv);
 
 	pdev_network->ie_length = sz;
 
 	pdev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)pdev_network);
 
-	/* notes: translate ie_length & length after assign the length to cmdsz in createbss_cmd(); */
+	/* notes: translate ie_length & length after assign the
+	 * length to cmdsz in createbss_cmd();
+	 */
 	/* pdev_network->ie_length = cpu_to_le32(sz); */
 }
 
@@ -2184,7 +2256,9 @@ void rtw_joinbss_reset(struct adapter *padapter)
 
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
-	/* todo: if you want to do something io/reg/hw setting before join_bss, please add code here */
+	/* todo: if you want to do something io/reg/hw setting before
+	 * join_bss, please add code here
+	 */
 
 	pmlmepriv->num_FortyMHzIntolerant = 0;
 
@@ -2274,7 +2348,8 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie,
+				   uint in_len, uint *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2345,7 +2420,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SM_PS);
 
 	if (TEST_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_RX)) {
-		if ((channel <= 14 && pregistrypriv->rx_stbc == 0x1) ||	/* enable for 2.4GHz */
+		if ((channel <= 14 && pregistrypriv->rx_stbc == 0x1) || /* enable for 2.4GHz */
 			(pregistrypriv->wifi_spec == 1))
 			stbc_rx_enable = 1;
 	}
@@ -2355,7 +2430,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 	/* update default supported_mcs_set */
 	if (stbc_rx_enable)
-		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_RX_STBC_1R);/* RX STBC One spatial stream */
+		/* RX STBC One spatial stream */
+		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_RX_STBC_1R);
 
 	set_mcs_rate_by_mask(ht_capie.mcs.rx_mask, MCS_RATE_1R);
 
@@ -2421,7 +2497,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
+	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY,
+		       &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
 		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
@@ -2431,7 +2508,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	}
 
 	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
+	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION,
+		       &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
 		/* todo: */
 	}
@@ -2564,7 +2642,8 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 
 	if (rtw_to_roam(padapter) > 0) {
-		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
+		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid,
+		       sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
-- 
2.54.0

