Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CE3B38AD
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316768; cv=none; b=g53Ir4ga7eiyIl6VTilcWCkIGRFF4kdbogsaepagIE9h2Tka108ZwAtpw6+QF1y/P0cMy8nasfZiqEOgbdkobzyzblEaOHBNhYaASqp7uNQj0jd8OwZL2GMYk60jaM3HOQCkR25cAFvCZqWY7FA+h11VHX49THjUlrlG82+twB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316768; c=relaxed/simple;
	bh=SVSbjYKvQH8BP8jFWa1Qg+4hx7GuAjAg+Hsk5fbH5t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VY0+2+9lLEstmeuahOBMleJ1UMuld475FSWZfULaWOeHrZ/Oq6qVfB7Heuk6lVmao2eHlc0/K/CxkVy3Wh48KkRzhK6e5C74ZVYVM4k+qSDFla4ejpBXTUDDR7aOVyH8bFiyun1zF74Fp5p3RonXwbhkUXuxprl98wSV+9akZNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=Qiry98jP; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="Qiry98jP"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9EDF84F26;
	Mon, 27 Apr 2026 22:06:04 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777316765; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nJDJanNXHQpf/NkVswkvf76WEju4GIQs0gdeZqutgaQ=;
	b=Qiry98jPoFkTLTHWn0fEO8Vk/jPBSyDidGxEmK8ZN4vdfUyis4a5QZQ3HHxSO77BipAmYh
	TYC5MIOgmEt6I3XlOoJL9G6F5Rht+G6fz/ZmvqqwHJfmD74NEINdgNxKg9TXlMEsrhDpIm
	au4RkQOcSluJP6ZAk2lo3/j2UXndqzWBGELojcrVQzt1boVvZiQit2B64GqEUuEu+grdEI
	ksm6R5ricXqVqC99VWuMOeml9iJ55Szhv8NFUr9H7oS4IPapDSASval3iKhES/lT8PHqtI
	ERZ/5LLE6FTnMrqc70/pCXy7+3Nl+SpLntD/dCbLu2nSE2pchILcIl33/zzs1m8fIlvmNv
	6huTbWvCsF4/0cJgXuqMns+FJahSQ42PqF9MJuha2AzRli85NT4OGi0PoO1lYKyqH5OT0u
	2b8bqoWXI+t9QxGL4/gS9h4B6ksI8JxGBYRl5MDyHRWFdp1TN758pKiPm9Aob9hjAWCNR6
	z7r9XP7+hmsG+BXQoSsD8ipdLuQbhYr7rExq1pWKZlnDp/jhjJPtGeFCU7CP9btLDRyB9R
	p3GFKCj9q8SO+qQ8puj13/A80K1WyJS176jLN2F2xH6ilCw2plKuoeG2A7mB8v8bbdoHCf
	D3ogtIs+BbP4UG83sLx5pvZg6O7wKixEeHus9SvV3srGiI93oU210=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] staging: rtl8723bs: rtw_mlme: extract local variables for long expressions
Date: Mon, 27 Apr 2026 22:05:32 +0300
Message-ID: <20260427190548.156499-5-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427190548.156499-1-me@cipherat.com>
References: <20260427190548.156499-1-me@cipherat.com>
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
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 56 ++++++++++++++++-------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c09fa4205f7f..98271cea2bf2 100644
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
 
@@ -736,8 +746,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex    *pdev_network = &adapter->registrypriv.dev_network;
-					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
+					struct registry_priv *regs = &adapter->registrypriv;
+					struct wlan_bssid_ex *pdev_network = &regs->dev_network;
+					u8 *pibss = regs->dev_network.mac_address;
 
 					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
 					 * because don't set assoc_timer
@@ -772,9 +783,14 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
-					if (rtw_dec_to_roam(adapter) == 0
-						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
-					) {
+					bool roam_failed = false;
+
+					if (rtw_dec_to_roam(adapter) == 0)
+						roam_failed = true;
+					else if (rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
+								    1, NULL, 0) != _SUCCESS)
+						roam_failed = true;
+					if (roam_failed) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
@@ -792,8 +808,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
 				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
-					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
-						, WLAN_REASON_ACTIVE_ROAM);
+					u8 *mac_addr = pmlmepriv->cur_network.network.mac_address;
+
+					receive_disconnect(adapter, mac_address,
+							   WLAN_REASON_ACTIVE_ROAM);
 				}
 			}
 		}
@@ -1071,6 +1089,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
+	u8 signal_strength = ptarget_wlan->network.phy_info.signal_strength;
 
 	/*  why not use ptarget_wlan?? */
 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.length);
@@ -1082,12 +1101,12 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 
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
 
@@ -1742,6 +1761,7 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 {
 	int updated = false;
 	struct adapter *adapter = container_of(mlme, struct adapter, mlmepriv);
+	long rssi_diff;
 
 	if (is_same_ess(&competitor->network, &mlme->cur_network.network) == false)
 		goto exit;
@@ -1759,7 +1779,8 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms)
 		goto exit;
 
-	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi < mlme->roam_rssi_diff_th)
+	rssi_diff = competitor->network.rssi - mlme->cur_network_scanned->network.rssi;
+	if (rssi_diff < mlme->roam_rssi_diff_th)
 		goto exit;
 
 	if (*candidate && (*candidate)->network.rssi >= competitor->network.rssi)
@@ -2133,7 +2154,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 
 		wrqu.data.length = p - buff;
 
-		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
+		wrqu.data.length = umin(wrqu.data.length, IW_CUSTOM_MAX);
 
 		kfree(buff);
 	}
@@ -2522,13 +2543,14 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	    (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
 	      BIT(1)) && (pmlmeinfo->HT_info.infos[0] & BIT(2))) {
 		int i;
+		u8 *mcs_rate = pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate;
 
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

