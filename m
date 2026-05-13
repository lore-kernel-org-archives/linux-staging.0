Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE83815FE
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704587; cv=none; b=GjDvhWEsereI3t9LlELIgTnIga0bz7jPIH6a4e3WmBOqvCs9UkIgZJ+C3yw1c+6ak+zLw8SXxdATdyOYa44chMrJ1ge3spHZt9gYELPsKRqm1oRdLrqw3WfPIUMB/Eq3SdEzFcNL42nLANG2il2Vf+MPZJCLj2SBSNPFAMfCRBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704587; c=relaxed/simple;
	bh=6trcGTC37H9MXsMGUkJAY7fu3Qy9pHRpk0B1zV+YEQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=si4dcrISl02E2nhXY+BJls7MClNYiHfMKtZo6B6WzchE60V8GEGV+ZNEfZN9k2rDfiOR6/NsNk5iHqyFvMzf2M9iSBQ/RFymJ1srhTqAv3rNJx8fXhu7iCkbPT81T/AMXDreIkLMYRldJuk4jWDo+lnb5+OHBb+L7YNd9F4tHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=BpkKSqqK; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="BpkKSqqK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDD9984FEE;
	Wed, 13 May 2026 23:36:21 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778704582; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iOjXUmX/3LFVvlDQgBU1jNZBrZ14fTBb4/kiLAqbpb0=;
	b=BpkKSqqKLBsXUP7MsfaFQa0P5qGx2f8xC7/BOspfowk4alv5NMYxFTRH8qv9cXvTNi0Pu1
	b0xgWWiBLFFNFusm2PjRi8/LNkCKSBbiVjH87oe7MKCPX0HwPOKTwr8vEOYfxAswa/EkTC
	DcsrBCVfSrpJ2H92ciyxcQMKQkQ/w33zTgb5aWxrQRoKHFfoe10WojEnTWCUS0z4ODDo4I
	xoS+WG+nFWuZLtTRY15VRN+09mfxq7bISUGc/YKp2DgGtVS2QJhF6Uuni/pboDke1ivF7I
	/J1xCHGB1v3wEjr4v9gp6N4JfuxsJYb8AzbFbNDMK4VPs+sd4DRcOqI8pcFroM9KcrKjFi
	huayaGeV6AwHF/AUum1dRMf/LPhAY7N4Cti2saaV6DCrFt6jAiUs1JzDf/vxTcjOWG8jXG
	Xwqvr5JzxuXnSLEe21Lw+1jaVj4gP/CE8lq6j611Y0vjIl3yfID14FMv1HhsHl99p4Gfxl
	AJtrsEBem+g3bNuO4qz5URk5e1gcGGuwVLcyBP80oEbBhCPk3sweTSgemQhCzoyVMqIkCc
	5crMNEGdjOgKnBb4DsZxJXncilo+xprFsPIx6AObtiLUOG1vMoyu2/tiir0Db+8PA5vQbC
	1yk/uzK2T7CXIiV/AkilmmJ2ijeHWAUjV06MTfNsSlpxckrYxrWps=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/6] staging: rtl8723bs: rtw_mlme: extract local variables for long expressions
Date: Wed, 13 May 2026 23:35:01 +0300
Message-ID: <20260513203611.31872-4-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513203611.31872-1-me@cipherat.com>
References: <20260513203611.31872-1-me@cipherat.com>
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
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 47 +++++++++++++++--------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index caaad38dd790..9582d9704393 100644
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
+					struct registry_priv *regs = &adapter->registrypriv;
+					struct wlan_bssid_ex *pdev_network = &regs->dev_network;
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
@@ -1069,6 +1082,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 				       struct wlan_network *ptarget_wlan,
 				       struct wlan_network  *pnetwork)
 {
+	u8 signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 
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

