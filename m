Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B040DFCF
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777136427; cv=none; b=BbGEBuKe8sZN5atetyZqVahlPJVb4ISm7E0uijcftOXuzOeVaJfT+XfkM3YzJaCvEi0wLUAO3yMtDLNe4WjGqfFZtMqiRUm+unxXeUpp9Vpm+Bx31T07DIET20LC1FpQtfLoPh1C1EYABb3tOEYn0DQv8UCHyDikX/8DrzIFgmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777136427; c=relaxed/simple;
	bh=vDBQqwu4jHDyTcJOwoxGDXFy/XhUGEgdnfwuXiJOkg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CclaV/oDq6ESFwf58KRDKe0tfma5qalwT18RuA7QD7TqVtdeKthc8IJLzun02lIbuMFrEdvfIG8S+oqxIjriSnw7wQXjI+nXGysUrLlVh88xKHnKvuTuoq+EuoGS6aPQo4VuZHgg6KKoTwHnfF9hF8YVyYGq4I7vyQMwMAMNSTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=dJCIYgwI; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="dJCIYgwI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 624F684466;
	Sat, 25 Apr 2026 20:00:21 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777136422; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=zQmgrqD4W/5KcUjPvMWJScS/GQ1Fc9QibpAVu52zqpM=;
	b=dJCIYgwIQgqJrwjI8WKdgRFmsWBYUWJsBNJbNJbJ/he64Pn/daSEP1XjmsibBZTV76CMZ3
	HQDlEmeMbcYfDMdzIMoiWhvlevS0OzCjgxy8XMel8AeYniy/EJwel5jjnwPfwAeZ667qZs
	j+YcXl1jjIhB00iCgImMDEH265VCLsoCl9wcqoiG4J6Ph2h6v2vAxNhz83lI848tXTaXLW
	Ae9lW/RAJqJ5ai9BIGhScvr+DoVJkEBxldxImL4cWNKUAblNtpiivrcQO3iiZNKmHPhIT5
	+wgkH/Ytv4x87h990mH9btbXfevPUVy7Fa5LZmU4qRxstpUdqXwAytcfO/bsjZMmJcgm4a
	pz94UOGN0gbNNfHMJdGQwajhS6r35u6ck6g6unXr/JGOpl5U8s0SNmNh8c2TkF12yKuKt/
	Qx4j40APzUVyK5iv5U/svVuS2igK5JFT7PXI1XZMWp7NNfhQm2TA+eyJG8qy2WdVldVMFH
	pkiQMv3J38shGxgrAZHZT+Nuh7fHyWdX+cPWEEAN7+lXgOkwbTv0Ptniwp52IL11oCEVFX
	6I/xBu7ESsorx4HiwOCTlmOsQtKuYZg/a654qsfbk3GBwiRculKUdyi8SfuQYWO/sXp4tt
	u38UgKfP1fdv+lF5JWdTf0gll/44fkngbznk+K7ly1DpAj8Vli6oE=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: rtw_mlme: fix line length warnings
Date: Sat, 25 Apr 2026 19:56:56 +0300
Message-ID: <20260425165733.289919-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Fix lines exceeding 100 columns in rtw_mlme.c as flagged by
checkpatch.pl. Extract local variables to avoid breaking arithmetic
operations, structure member accesses, and comparison operators
across lines. Fix function signature alignment to match the column
of the first parameter. Use min_t() for value capping. Fix block
comment formatting on continuation lines. Remove dead commented-out
code found while fixing line lengths.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
v2:
  - Extract local variables instead of breaking arithmetic across lines
  - Extract local variables for long struct member access paths
  - Fix function signature alignment to match first parameter column
  - Use min_t() instead of ternary for wrqu.data.length cap
  - Fix block comment alignment on continuation lines
  - Add blank lines after variable declarations
  - Remove dead commented-out code
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 277 +++++++++++++++-------
 1 file changed, 189 insertions(+), 88 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..045c636142f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
 	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	/* 1: active, 0: passive. Maybe someday we should rename this
+	 * variable to "active_mode" (Jeff)
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
 
@@ -363,13 +367,12 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 	return (src->ssid.ssid_length == dst->ssid.ssid_length) &&
 			((!memcmp(src->mac_address, dst->mac_address, ETH_ALEN))) &&
 			((!memcmp(src->ssid.ssid, dst->ssid.ssid, src->ssid.ssid_length))) &&
-			((s_cap & WLAN_CAPABILITY_IBSS) ==
-			(d_cap & WLAN_CAPABILITY_IBSS)) &&
-			((s_cap & WLAN_CAPABILITY_ESS) ==
-			(d_cap & WLAN_CAPABILITY_ESS));
+			((s_cap & WLAN_CAPABILITY_IBSS) == (d_cap & WLAN_CAPABILITY_IBSS)) &&
+			((s_cap & WLAN_CAPABILITY_ESS) == (d_cap & WLAN_CAPABILITY_ESS));
 }
 
-struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
+struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
+					    struct wlan_network *network)
 {
 	struct list_head *phead, *plist;
 	struct wlan_network *found = NULL;
@@ -420,7 +423,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
+	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
 		ss_final = padapter->recvpriv.signal_strength;
 		sq_final = padapter->recvpriv.signal_qual;
@@ -431,11 +435,15 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
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
@@ -462,10 +470,12 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	u8 *ie = pmlmepriv->cur_network.network.ies + sizeof(struct ndis_802_11_fix_ie);
+
+	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
+	    is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0)) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
-		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+		rtw_update_protection(adapter, ie, pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -600,12 +610,16 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	desired_encmode = psecuritypriv->ndisencryptstatus;
 	privacy = pnetwork->network.privacy;
 
+	u8 *ie_ptr = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+	u32 ie_len_val = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		if (rtw_get_wps_ie(ie_ptr, ie_len_val, NULL, &wps_ielen))
 			return true;
 		else
 			return false;
 	}
+
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
@@ -614,7 +628,10 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
-			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+			u8 *ie_ptr = pnetwork->network.ies + _BEACON_IE_OFFSET_;
+			u32 ie_len_val = pnetwork->network.ie_length - _BEACON_IE_OFFSET_;
+
+			p = rtw_get_ie(ie_ptr, WLAN_EID_RSN, &ie_len, ie_len_val);
 			if (p && ie_len > 0)
 				bselected = true;
 			else
@@ -625,8 +642,14 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0))
 		bselected = false;
 
+	enum ndis_802_11_network_infrastructure inf_mode;
+	enum ndis_802_11_network_infrastructure cur_inf;
+
+	inf_mode = pnetwork->network.infrastructure_mode;
+	cur_inf = pmlmepriv->cur_network.network.infrastructure_mode;
+
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-		if (pnetwork->network.infrastructure_mode != pmlmepriv->cur_network.network.infrastructure_mode)
+		if (inf_mode != cur_inf)
 			bselected = false;
 	}
 
@@ -654,12 +677,14 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 
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
@@ -710,13 +735,15 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex    *pdev_network = &adapter->registrypriv.dev_network;
-					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
+					struct registry_priv *regs = &adapter->registrypriv;
+					struct wlan_bssid_ex *pdev_network = &regs->dev_network;
+					u8 *pibss = regs->dev_network.mac_address;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
-					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+					memcpy(&pdev_network->ssid,
+					       &pmlmepriv->assoc_ssid,
+					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
 					rtw_generate_random_ibss(pibss);
@@ -743,9 +770,12 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
-					if (rtw_dec_to_roam(adapter) == 0
-						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
-					) {
+					u8 survey_ret = rtw_sitesurvey_cmd(adapter,
+									   &pmlmepriv->assoc_ssid,
+									   1, NULL, 0);
+
+					if (rtw_dec_to_roam(adapter) == 0 ||
+					    survey_ret != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
@@ -759,12 +789,14 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			}
 		}
 	} else {
+		u8 *mac_addr = pmlmepriv->cur_network.network.mac_address;
+
 		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+			    check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
-					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
-						, WLAN_REASON_ACTIVE_ROAM);
+					receive_disconnect(adapter, mac_addr,
+							   WLAN_REASON_ACTIVE_ROAM);
 				}
 			}
 		}
@@ -948,7 +980,8 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = false;
 }
 
-static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
+static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
+						   struct wlan_network *pnetwork)
 {
 	int i;
 	struct sta_info *bmc_sta, *psta = NULL;
@@ -1005,7 +1038,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		}
 
 		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
-		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indicate_seq) to default value = 0xffff */
+		/* if A-MPDU Rx is enabled, resetting rx_ordering_ctrl
+		 * wstart_b(indicate_seq) to default value = 0xffff
+		 */
 		/* todo: check if AP can send A-MPDU packets */
 		for (i = 0; i < 16 ; i++) {
 			preorder_ctrl = &psta->recvreorder_ctrl[i];
@@ -1022,7 +1057,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 				preorder_ctrl->enable = false;
 				preorder_ctrl->indicate_seq = 0xffff;
 				preorder_ctrl->wend_b = 0xffff;
-				preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
+				/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
+				preorder_ctrl->wsize_b = 64;
 			}
 		}
 	}
@@ -1032,10 +1068,13 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter,
+				       struct wlan_network *ptarget_wlan,
+				       struct wlan_network *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
+	u8 signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 
 	/*  why not use ptarget_wlan?? */
 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.length);
@@ -1049,8 +1088,10 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 
 	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
-	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
-	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
+	/* the ptarget_wlan->network.rssi is raw data, we use
+	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
+	 */
+	padapter->recvpriv.rssi = translate_percentage_to_dbm(signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
@@ -1072,10 +1113,13 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 			break;
 	}
 
-	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+	u8 *ie = cur_network->network.ies + sizeof(struct ndis_802_11_fix_ie);
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_protection(padapter, ie, (cur_network->network.ie_length));
+
+	rtw_update_ht_cap(padapter, cur_network->network.ies,
+			  cur_network->network.ie_length,
+			  (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -1095,9 +1139,12 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
 		/*  */
 		/*  Backup the btkip_countermeasure information. */
-		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
+		/*  When the countermeasure is trigger, the driver have to disconnect
+		 *  with AP for 60 seconds.
+		 */
 
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
 		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
@@ -1108,8 +1155,11 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		memset((unsigned char *)&adapter->securitypriv, 0, sizeof(struct security_priv));
 
 		/*  Added by Albert 2009/02/18 */
-		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		/*  Restore the PMK information to securitypriv
+		 *  structure for the following connection.
+		 */
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
 		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
@@ -1141,10 +1191,14 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 /* Notes: the function could be > passive_level (the same context as Rx tasklet) */
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-/* if join_res > 0, for (fw_state ==WIFI_STATION_STATE), we check if  "ptarget_sta" & "ptarget_wlan" exist. */
+/* if join_res > 0, for (fw_state ==WIFI_STATION_STATE), we check
+ * if "ptarget_sta" & "ptarget_wlan" exist.
+ */
 /* if join_res > 0, for (fw_state ==WIFI_ADHOC_STATE), we only check if "ptarget_wlan" exist. */
-/* if join_res > 0, update "cur_network->network" from "pnetwork->network" if (ptarget_wlan != NULL). */
-/*  */
+/* if join_res > 0, update "cur_network->network" from "pnetwork->network"
+ * if (ptarget_wlan != NULL).
+ */
+
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
@@ -1154,8 +1208,10 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
+	struct __queue *scanned_queue = &pmlmepriv->scanned_queue;
 
-	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
+	the_same_macaddr = !memcmp(pnetwork->network.mac_address,
+				   cur_network->network.mac_address, ETH_ALEN);
 
 	pnetwork->network.length = get_wlan_bssid_ex_sz(&pnetwork->network);
 	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
@@ -1195,9 +1251,11 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	/* s1. find ptarget_wlan */
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		if (the_same_macaddr) {
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			ptarget_wlan = rtw_find_network(scanned_queue,
+							cur_network->network.mac_address);
 		} else {
-			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+						     cur_network->network.mac_address);
 			if (pcur_wlan)
 				pcur_wlan->fixed = false;
 
@@ -1205,7 +1263,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			if (pcur_sta)
 				rtw_free_stainfo(adapter, pcur_sta);
 
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
+			ptarget_wlan = rtw_find_network(scanned_queue,
+							pnetwork->network.mac_address);
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 				if (ptarget_wlan)
 					ptarget_wlan->fixed = true;
@@ -1230,7 +1289,9 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
 
-	/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
+	/* s3. find ptarget_sta & update ptarget_sta after
+	 * update cur_network only for station mode
+	 */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
 		if (!ptarget_sta) {
@@ -1298,7 +1359,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 			/* report to upper layer */
 			spin_lock_bh(&psta->lock);
 			if (psta->passoc_req && psta->assoc_req_len > 0) {
-				passoc_req = kmemdup(psta->passoc_req, psta->assoc_req_len, GFP_ATOMIC);
+				passoc_req = kmemdup(psta->passoc_req,
+						     psta->assoc_req_len, GFP_ATOMIC);
 				if (passoc_req) {
 					assoc_req_len = psta->assoc_req_len;
 
@@ -1310,7 +1372,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 			spin_unlock_bh(&psta->lock);
 
 			if (passoc_req && assoc_req_len > 0) {
-				rtw_cfg80211_indicate_sta_assoc(adapter, passoc_req, assoc_req_len);
+				rtw_cfg80211_indicate_sta_assoc(adapter,
+								passoc_req, assoc_req_len);
 
 				kfree(passoc_req);
 			}
@@ -1323,7 +1386,10 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	if (psta) {
 		/* the sta have been in sta_info_queue => do nothing */
 
-		return; /* between drv has received this event before and  fw have not yet to set key to CAM_ENTRY) */
+		/* between drv has received this event before and
+		 * fw have not yet to set key to CAM_ENTRY)
+		 */
+		return;
 	}
 
 	psta = rtw_alloc_stainfo(&adapter->stapriv, pstassoc->macaddr);
@@ -1346,11 +1412,13 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
+	struct __queue *queue = &pmlmepriv->scanned_queue;
+
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
 	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+			ptarget_wlan = rtw_find_network(queue, cur_network->network.mac_address);
 			pmlmepriv->cur_network_scanned = ptarget_wlan;
 			if (ptarget_wlan)
 				ptarget_wlan->fixed = true;
@@ -1407,16 +1475,19 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
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
@@ -1430,7 +1501,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		/*  remove the network entry in scanned_queue */
-		pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
+		pwlan = rtw_find_network(&pmlmepriv->scanned_queue,
+					 tgt_network->network.mac_address);
 		if (pwlan) {
 			pwlan->fixed = false;
 			rtw_free_network_nolock(adapter, pwlan);
@@ -1444,12 +1516,14 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
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
@@ -1459,9 +1533,11 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 			pdev_network = &adapter->registrypriv.dev_network;
 			pibss = adapter->registrypriv.dev_network.mac_address;
 
-			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
+			memcpy(pdev_network, &tgt_network->network,
+			       get_wlan_bssid_ex_sz(&tgt_network->network));
 
-			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+			       sizeof(struct ndis_802_11_ssid));
 
 			rtw_update_registrypriv_dev_network(adapter);
 
@@ -1530,9 +1606,11 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 	} else {
 		rtw_indicate_disconnect(adapter);
-		free_scanqueue(pmlmepriv);/*  */
+		free_scanqueue(pmlmepriv);
 
-		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
+		/* indicate disconnect for the case that join_timeout and
+		 * check_fwstate != FW_LINKED
+		 */
 		rtw_cfg80211_indicate_disconnect(adapter);
 	}
 
@@ -1581,8 +1659,9 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 
 	rtw_mlme_reset_auto_scan_int(padapter);
 
-	if (pmlmepriv->auto_scan_int_ms != 0
-		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
+	unsigned int elapsed_ms = jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time);
+
+	if (pmlmepriv->auto_scan_int_ms != 0 && elapsed_ms > pmlmepriv->auto_scan_int_ms) {
 		if (!padapter->registrypriv.wifi_spec) {
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
@@ -1621,10 +1700,11 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 
 		should_enter_ps = traffic_status_watchdog(adapter, true);
 		if (should_enter_ps) {
-			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
 			rtw_hal_dm_watchdog_in_lps(adapter);
 		} else {
-			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1) in traffic_status_watchdog() */
+			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1) in
+			 * traffic_status_watchdog()
+			 */
 		}
 
 	} else {
@@ -1684,7 +1764,9 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms)
 		goto exit;
 
-	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi < mlme->roam_rssi_diff_th)
+	long rssi_diff = competitor->network.rssi - mlme->cur_network_scanned->network.rssi;
+
+	if (rssi_diff < mlme->roam_rssi_diff_th)
 		goto exit;
 
 	if (*candidate && (*candidate)->network.rssi >= competitor->network.rssi)
@@ -1757,9 +1839,12 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 
 	/* check ssid, if needed */
 	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
-		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length
-			|| memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid, mlme->assoc_ssid.ssid_length)
-		)
+		u8 *ssid_comp = competitor->network.ssid.ssid;
+		u8 *ssid_mlme = mlme->assoc_ssid.ssid;
+		u32 len_comp = competitor->network.ssid.ssid_length;
+		u32 len_mlme = mlme->assoc_ssid.ssid_length;
+
+		if (len_comp != len_mlme || memcmp(ssid_comp, ssid_mlme, len_mlme))
 			goto exit;
 	}
 
@@ -1876,7 +1961,9 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	return res;
 }
 
-signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
+signed int rtw_set_key(struct adapter *adapter,
+		       struct security_priv *psecuritypriv,
+		       signed int keyid, u8 set_tx, bool enqueue)
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
@@ -1951,7 +2038,8 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			uint in_len, uint initial_out_len)
 {
 	unsigned	int ielength = 0;
 	unsigned int i, j;
@@ -2055,7 +2143,8 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 
 		wrqu.data.length = p - buff;
 
-		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
+		wrqu.data.length = min_t(typeof(wrqu.data.length),
+					 wrqu.data.length, IW_CUSTOM_MAX);
 
 		kfree(buff);
 	}
@@ -2085,7 +2174,8 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		ielength += psecuritypriv->wps_ie_len;
 	} else if ((authmode == WLAN_EID_VENDOR_SPECIFIC) || (authmode == WLAN_EID_RSN)) {
 		/* copy RSN or SSN */
-		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecuritypriv->supplicant_ie[1] + 2);
+		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0],
+		       psecuritypriv->supplicant_ie[1] + 2);
 		ielength += psecuritypriv->supplicant_ie[1] + 2;
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
@@ -2123,7 +2213,8 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	security_priv *psecuritypriv = &adapter->securitypriv;
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
+	/* adhoc no 802.1x */
+	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
 	pdev_network->rssi = 0;
 
@@ -2153,15 +2244,15 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	/*  1. Supported rates */
 	/*  2. IE */
 
-	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv->wireless_mode) ;  will be called in rtw_generate_ie */
 	sz = rtw_generate_ie(pregistrypriv);
 
 	pdev_network->ie_length = sz;
 
 	pdev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)pdev_network);
 
-	/* notes: translate ie_length & length after assign the length to cmdsz in createbss_cmd(); */
-	/* pdev_network->ie_length = cpu_to_le32(sz); */
+	/* notes: translate ie_length & length after assign the
+	 * length to cmdsz in createbss_cmd();
+	 */
 }
 
 /* the function is at passive_level */
@@ -2172,7 +2263,9 @@ void rtw_joinbss_reset(struct adapter *padapter)
 
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
-	/* todo: if you want to do something io/reg/hw setting before join_bss, please add code here */
+	/* todo: if you want to do something io/reg/hw setting before join_bss,
+	 * please add code here
+	 */
 
 	pmlmepriv->num_FortyMHzIntolerant = 0;
 
@@ -2262,7 +2355,9 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
+				   u8 *out_ie, uint in_len,
+				   uint *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2343,7 +2438,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 	/* update default supported_mcs_set */
 	if (stbc_rx_enable)
-		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_RX_STBC_1R);/* RX STBC One spatial stream */
+		/* RX STBC One spatial stream */
+		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_RX_STBC_1R);
 
 	set_mcs_rate_by_mask(ht_capie.mcs.rx_mask, MCS_RATE_1R);
 
@@ -2409,7 +2505,10 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
+	u8 *ie_ptr = pie + sizeof(struct ndis_802_11_fix_ie);
+	int ie_remaining = ie_len - sizeof(struct ndis_802_11_fix_ie);
+
+	p = rtw_get_ie(ie_ptr, WLAN_EID_HT_CAPABILITY, &len, ie_remaining);
 	if (p && len > 0) {
 		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
@@ -2419,7 +2518,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	}
 
 	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
+	p = rtw_get_ie(ie_ptr, WLAN_EID_HT_OPERATION, &len, ie_remaining);
 	if (p && len > 0) {
 		/* todo: */
 	}
@@ -2433,9 +2532,10 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	      BIT(1)) && (pmlmeinfo->HT_info.infos[0] & BIT(2))) {
 		int i;
 
+		u8 *mcs_rate = pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate;
 		/* update the MCS set */
 		for (i = 0; i < 16; i++)
-			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= pmlmeext->default_supported_mcs_set[i];
+			mcs_rate[i] &= pmlmeext->default_supported_mcs_set[i];
 
 		/* update the MCS rates */
 		set_mcs_rate_by_mask(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS_RATE_1R);
@@ -2552,7 +2652,8 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 
 	if (rtw_to_roam(padapter) > 0) {
-		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
+		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid,
+		       sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
-- 
2.54.0

