Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F566410D26
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378738; cv=none; b=hokr6XCaAV3y86oiYVS8AmmuEVhBShipmljcBn4yc7uFetbpV0Mz9QIkU6FIPUMiUom0YvI0vUIgv/F/RBTMgpbdyP+EOfnz/9ZznczXwgOEdSKPsN56bbwzEcp/LSnZ7EXZeFGKiVHIhP3kBcTaD0jCBt0WxQVwYm2+PsGFFU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378738; c=relaxed/simple;
	bh=Jx4iZ/8PkdZK0lhQE9y4lhz7CbHXyh8Md20GdYFe2lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olpJMiMz81NKAj9z4VUpXNr3Mmdo1Vd2vIIbtqkCWGLe2s6e1gjdgBSLpacZcVEhfQ8FJtr+y2AQMOIB1oGgFU7c8fEU3JKZ0pmJWeLs80Tlba0e0J3cwL5sSxL3z0VkheQnIi2BuZZX5DBQyze0Sm5+/uEbQc+aYGxLq5OTVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=MGlOrLLS; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="MGlOrLLS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1533184E96;
	Tue, 28 Apr 2026 15:18:37 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378718; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=/9hZhd+L1lrNW0W/JPYcPQAcCjjih863/GC3B5PxJX4=;
	b=MGlOrLLScpW9fptJd0i+xtf1fEZe/I40+2r4KJIikWnG3Q/3JFkaZD0By/kTBxk/XtUnCh
	2Ku4riEVqXyj4IUvsIe+ken2Dnd2o2DQzlSYe5DV/h/tdCizyiYwjxgL8xIQJRMzSwriLA
	Kts2Gr/M7Y5pviWxoH8JSW3kDIdiVTemQinfCCfEBjBZj7eRb5wJZgehmy85JSEqmwl1KN
	rF0LipxSrj69NPflA7oSlpUpuGo46QKdE2hg+TeKpI70Pej7cVWHP1+QoXj3bYKZnkXtpt
	1G5mgfzfkDZAkLmotVBFXg+ScK0iGAElUGdkaT90tlxg5qbjNbLThiXKEuukQutjYxUW5g
	iiF9XR5F87G0b61IE7gldKuLoefLD64qdOSWL5cgYonYhZ1ErAiYdQuiL0rLGUrAu+ja9E
	EBr+3S0X5UX7+on0R2K3Ak4mzErETDFcPjjj3tyGiS5Ux02PSdfQEyKL1dA+KkDtDgXZJF
	CYbFV4HA0UWIewBhHSR/hgyvlVtK+LtSLImQ5/+jYGWxhnYVXr/SSA4jR1Mp8w9R4kVD+6
	Uxq6iNlDzzDGIFPbRHm3oJCpCjQZPDMIrMjefIJavjS7MsJtfHGqJqHJ6AXZL6O/PnKw4W
	LAETSNHDDy8Iq0YzoJ7o92WAe9iJwFlTg/vARjfCZzQGylW8geyn8=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] staging: rtl8723bs: rtw_mlme: extract local variables for long expressions
Date: Tue, 28 Apr 2026 15:15:48 +0300
Message-ID: <20260428121737.435248-6-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428121737.435248-1-me@cipherat.com>
References: <20260428121737.435248-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Extract local variables to shorten lines that cannot be wrapped
cleanly.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 49 +++++++++++++++--------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index caaad38dd790..c7609f1a90f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -474,12 +474,16 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+		u32 ie_len;
+		u8 *ie;
+
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
-		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+		ie_len = pmlmepriv->cur_network.network.ie_length;
+		if (ie_len < sizeof(struct ndis_802_11_fix_ie))
 			return;
 
-		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length - sizeof(struct ndis_802_11_fix_ie));
+		ie = pmlmepriv->cur_network.network.ies + sizeof(struct ndis_802_11_fix_ie);
+		rtw_update_protection(adapter, ie, ie_len - sizeof(struct ndis_802_11_fix_ie));
 	}
 }
 
@@ -650,7 +654,13 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		bselected = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-		if (pnetwork->network.infrastructure_mode != pmlmepriv->cur_network.network.infrastructure_mode)
+		enum ndis_802_11_network_infrastructure inf_mode;
+		enum ndis_802_11_network_infrastructure cur_inf;
+
+		inf_mode = pnetwork->network.infrastructure_mode;
+		cur_inf = pmlmepriv->cur_network.network.infrastructure_mode;
+
+		if (inf_mode != cur_inf)
 			bselected = false;
 	}
 
@@ -735,9 +745,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
+					struct wlan_bssid_ex *pdev_network = &regs->dev_network;
+					struct registry_priv *regs = &adapter->registrypriv;
+					u8 *pibss = regs->dev_network.mac_address;
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex    *pdev_network = &adapter->registrypriv.dev_network;
-					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
 
 					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
 					 * because don't set assoc_timer
@@ -792,8 +803,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
 				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
-					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
-						, WLAN_REASON_ACTIVE_ROAM);
+					u8 *mac_addr = pmlmepriv->cur_network.network.mac_address;
+
+					receive_disconnect(adapter, mac_addr,
+							   WLAN_REASON_ACTIVE_ROAM);
 				}
 			}
 		}
@@ -1069,8 +1082,9 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 				       struct wlan_network *ptarget_wlan,
 				       struct wlan_network  *pnetwork)
 {
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	u8 signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	/*  why not use ptarget_wlan?? */
 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.length);
@@ -1082,12 +1096,12 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
+	padapter->recvpriv.signal_strength = signal_strength;
 	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
 	/* the ptarget_wlan->network.rssi is raw data, we use
 	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
 	 */
-	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
+	padapter->recvpriv.rssi = translate_percentage_to_dbm(signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
@@ -1740,8 +1754,9 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
 static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
-	int updated = false;
 	struct adapter *adapter = container_of(mlme, struct adapter, mlmepriv);
+	int updated = false;
+	long rssi_diff;
 
 	if (is_same_ess(&competitor->network, &mlme->cur_network.network) == false)
 		goto exit;
@@ -1759,7 +1774,8 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms)
 		goto exit;
 
-	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi < mlme->roam_rssi_diff_th)
+	rssi_diff = competitor->network.rssi - mlme->cur_network_scanned->network.rssi;
+	if (rssi_diff < mlme->roam_rssi_diff_th)
 		goto exit;
 
 	if (*candidate && (*candidate)->network.rssi >= competitor->network.rssi)
@@ -2133,7 +2149,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 
 		wrqu.data.length = p - buff;
 
-		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
+		wrqu.data.length = umin(wrqu.data.length, IW_CUSTOM_MAX);
 
 		kfree(buff);
 	}
@@ -2521,14 +2537,15 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	if ((cbw40_enable) &&
 	    (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
 	      BIT(1)) && (pmlmeinfo->HT_info.infos[0] & BIT(2))) {
+		u8 *mcs_rate = pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate;
 		int i;
 
 		/* update the MCS set */
 		for (i = 0; i < 16; i++)
-			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= pmlmeext->default_supported_mcs_set[i];
+			mcs_rate[i] &= pmlmeext->default_supported_mcs_set[i];
 
 		/* update the MCS rates */
-		set_mcs_rate_by_mask(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS_RATE_1R);
+		set_mcs_rate_by_mask(mcs_rate, MCS_RATE_1R);
 
 		/* switch to the 40M Hz mode according to the AP */
 		/* pmlmeext->cur_bwmode = CHANNEL_WIDTH_40; */
-- 
2.54.0

