Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9CF3A1A4E
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939708; cv=none; b=PvN4rLHtCaMXO6IWBvWSufM9g7toiNqrmSURNp01F5PmWGJYbArDGNMPdDrzrmz2A8lbaIJI/4tKWLQPGgwE/wwzGlaYyS/hkgLxkq/JmXORE0/fiWdLk1WjGI81X+y6WAY1QxX2W7ddAShcFGH3rmZ7gQX1F4eSZx2/zLZMNTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939708; c=relaxed/simple;
	bh=maq2MLz0LbMvCU2iptFPmeKmM1E42eYzmPSYbr59LXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGAR3gnj/So9hEpeholZv/p04JJ1Op5Wh2vUBqhvU7ZsjDyoDlHBSrQnia/nbMeW5+CmNhwgPCuzeEqj3LoZhVePs5z6KCZcGVZf1YgubvEl1WetfWYg2OKcVT28zzlL7rXgHLMW3juo+iN1hBA7TmNfY5b7tAULhdvaN6+vor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BBsXL4rx; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BBsXL4rx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzbmJ4wGCj3Vro9Z+z3DO+k606ErxhyKKAdpsNKhJVQ=;
	b=BBsXL4rxvWEMTbGlxHmu0sUuPmoE/cnUg3cf3yIHWhFC2gMfk5pKZ5bpzogJ/utTNy1ax2
	oMT/BTQ5lzgTxFM7fm48xfbddoN9jvT3ckXrq5v0Jb8GDGQcg2dgRza0yhP43iavjSDsna
	RolCG9xw/5VLGiFjOJzzlZ475/M9dTY=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 19/21] staging: rtl8723bs: core: fix line lengths in rtw_mlme.c
Date: Tue, 24 Feb 2026 14:27:46 +0100
Message-ID: <20260224132748.12336-20-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 101 ++++++++++++++--------
 1 file changed, 66 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2bd6f5367bdc..c100b2388572 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -52,7 +52,8 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
 	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	/* 1: active, 0: passive. Maybe someday rename to "active_mode" */
+	pmlmepriv->scan_mode = SCAN_ACTIVE;
 
 	spin_lock_init(&pmlmepriv->lock);
 	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
@@ -376,7 +377,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 			(d_cap & WLAN_CAPABILITY_ESS));
 }
 
-struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
+struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
+					     struct wlan_network *network)
 {
 	struct list_head *phead, *plist;
 	struct wlan_network *found = NULL;
@@ -427,7 +429,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
+	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
 		ss_final = padapter->recvpriv.signal_strength;
 		sq_final = padapter->recvpriv.signal_qual;
@@ -469,10 +472,13 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
+	    is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0)) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
-		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+		rtw_update_protection(adapter,
+				      pmlmepriv->cur_network.network.ies +
+				      sizeof(struct ndis_802_11_fix_ie),
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -609,7 +615,10 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	privacy = pnetwork->network.privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		u8 *ies = pnetwork->network.ies + _FIXED_IE_LENGTH_;
+		uint ie_len = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
+
+		if (rtw_get_wps_ie(ies, ie_len, NULL, &wps_ielen))
 			return true;
 		else
 			return false;
@@ -617,12 +626,14 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
+		u8 *ies = pnetwork->network.ies + _BEACON_IE_OFFSET_;
+		uint ies_len = pnetwork->network.ie_length - _BEACON_IE_OFFSET_;
 
 		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
-			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+			p = rtw_get_ie(ies, WLAN_EID_RSN, &ie_len, ies_len);
 			if (p && ie_len > 0)
 				bselected = true;
 			else
@@ -957,7 +968,8 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = false;
 }
 
-static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
+static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
+						    struct wlan_network *pnetwork)
 {
 	int i;
 	struct sta_info *bmc_sta, *psta = NULL;
@@ -1041,7 +1053,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter,
+				       struct wlan_network *ptarget_wlan,
+				       struct wlan_network *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
@@ -1059,7 +1073,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
 	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
-	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
+	padapter->recvpriv.rssi =
+		translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
@@ -1084,7 +1099,9 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
 									(cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies,
+			  cur_network->network.ie_length,
+			  (u8)cur_network->network.configuration.ds_config);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -1106,7 +1123,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  Backup the btkip_countermeasure information. */
 		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
 
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
 		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
@@ -1118,7 +1136,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 		/*  Added by Albert 2009/02/18 */
 		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0],
+		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
 		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
@@ -1166,7 +1185,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 
-	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
+	the_same_macaddr = !memcmp(pnetwork->network.mac_address,
+				   cur_network->network.mac_address, ETH_ALEN);
 
 	pnetwork->network.length = get_wlan_bssid_ex_sz(&pnetwork->network);
 	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
@@ -1349,9 +1369,9 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	/* for AD-HOC mode */
 	psta = rtw_get_stainfo(&adapter->stapriv, pstassoc->macaddr);
 	if (psta) {
-		/* the sta have been in sta_info_queue => do nothing */
-
-		return; /* between drv has received this event before and  fw have not yet to set key to CAM_ENTRY) */
+		/* sta already in sta_info_queue, do nothing */
+		/* drv received this event but fw hasn't set key to CAM_ENTRY yet */
+		return;
 	}
 
 	psta = rtw_alloc_stainfo(&adapter->stapriv, pstassoc->macaddr);
@@ -1435,7 +1455,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		if (adapter->registrypriv.wifi_spec == 1) {
 			roam = false;
-		} else if (reason == WLAN_REASON_EXPIRATION_CHK && rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
+		} else if (reason == WLAN_REASON_EXPIRATION_CHK &&
+			   rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
 			roam = true;
 		} else if (reason == WLAN_REASON_ACTIVE_ROAM && rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 			roam = true;
@@ -1904,7 +1925,8 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	return res;
 }
 
-signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
+signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv,
+		       signed int keyid, u8 set_tx, bool enqueue)
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
@@ -1979,7 +2001,8 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			uint in_len, uint initial_out_len)
 {
 	unsigned	int ielength = 0;
 	unsigned int i, j;
@@ -2290,7 +2313,9 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
+				   u8 *out_ie, uint in_len,
+				   uint *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2436,20 +2461,26 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		phtpriv->ampdu_enable = true;
 
 	/* check Max Rx A-MPDU Size */
-	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
-		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
-		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
-		max_ampdu_sz = 1 << (max_ampdu_sz + 3); /*  max_ampdu_sz (kbytes); */
-
-		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
-	}
+	{
+		u8 *ies = pie + sizeof(struct ndis_802_11_fix_ie);
+		uint ies_len = ie_len - sizeof(struct ndis_802_11_fix_ie);
+
+		len = 0;
+		p = rtw_get_ie(ies, WLAN_EID_HT_CAPABILITY, &len, ies_len);
+		if (p && len > 0) {
+			pht_capie = (struct ieee80211_ht_cap *)(p + 2);
+			max_ampdu_sz = pht_capie->ampdu_params_info &
+				       IEEE80211_HT_CAP_AMPDU_FACTOR;
+			max_ampdu_sz = 1 << (max_ampdu_sz + 3);
+
+			phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
+		}
 
-	len = 0;
-	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
-		/* todo: */
+		len = 0;
+		p = rtw_get_ie(ies, WLAN_EID_HT_OPERATION, &len, ies_len);
+		if (p && len > 0) {
+			/* todo: */
+		}
 	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
-- 
2.53.0

