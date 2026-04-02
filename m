Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC73EF64D
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142299; cv=none; b=gvMdIWSgbI/ZWI5kFo/b96uMytvzPnYuGPQJcm2u986Zd6PBN9P/1tEa2/gBdUqNVF9DTSINrItfvR1HGNIFCUsAOMEAWqwTfOSzIBr6BdF0BUDbnwNwMXjZkowgMvjqBdFmB8/O7R75hrCRdaI+Q+qi2jQXuH6/rC8rmqAKuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142299; c=relaxed/simple;
	bh=O5IOJf0a0hCq/HbCm+RcvAg76hfYQXLgaLfXb13qSeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JkDtXVSblzFzqVPNKmRUkqF9VYYMlf0NsQA0rtz+iyExB+HrMw4lDBNSixR8f59bNBTCkYfclVDrtLwBazXoD6StvKQLZaq/aGIsJYCILgvw7k7Cnby8pWUil8awiOG8sDxxWy9S71iEbkkpFgHOHY2pyb3n/CWC6Vl5fr+QRUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=i8CmkU9L; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="i8CmkU9L"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fmlWh5ynbz9vCj;
	Thu,  2 Apr 2026 17:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775142288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JU8bIxPqBRLrG3ujJpbII0KxZXfTtu/qHEHP+Te70D8=;
	b=i8CmkU9LzqiJgHFvp8SQkIhwSileUhJy8vwUPiAZSSQJmmwo77ajL0yLNcINg1QSTig9yz
	ko0vUkLJ//VRO7P4e3P5ghAw3dG81bKbXz+hEQAdg7iYelOaNJ3H6nFgUpvWrxDm71jpxi
	OxMRZ2ADai6KI/micF8UcXGRCFPXfkDeDgcA002P40DVPzYqCaMtBwhZOeXE9kP0NOdKMk
	en0/MhQ1N38R31bkO53vSwgaySI8yEdMtlFjcGodaD5hM6thFE9tBOQiGOXphs2/6oPGLL
	Tby/XcmwFj8B0icvRBmrk1Vzgwh3BKQBRENsaA3laXYcI3IHuopZn6PTrVBLRQ==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 3/6] staging: rtl8723bs: os_dep: simplify boolean comparisons
Date: Thu,  2 Apr 2026 18:04:26 +0300
Message-ID: <20260402150429.14761-4-khomenkov@mailbox.org>
In-Reply-To: <20260402150429.14761-1-khomenkov@mailbox.org>
References: <20260402150429.14761-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 140b16ac75267b50861
X-MBO-RS-META: p3fpwyd1a9ia4butpezsm41sueg9hmk7

Simplify boolean comparisons to improve readability and conform
to the Linux kernel coding style.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 52 +++++++++----------
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  2 +-
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 098456e97c96..d585c4a4f807 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -275,7 +275,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	notify_timestamp = ktime_to_us(ktime_get_boottime());
 
 	/* We've set wiphy's signal_type as CFG80211_SIGNAL_TYPE_MBM: signal strength in mBm (100*dBm) */
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true &&
+	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    is_same_network(&pmlmepriv->cur_network.network, &pnetwork->network, 0)) {
 		notify_signal = 100 * translate_percentage_to_dbm(padapter->recvpriv.signal_strength);/* dbm */
 	} else {
@@ -372,7 +372,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 		struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
 		struct wlan_network *scanned = pmlmepriv->cur_network_scanned;
 
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 			memcpy(&cur_network->network, pnetwork, sizeof(struct wlan_bssid_ex));
 			rtw_cfg80211_inform_bss(padapter, cur_network);
 		} else {
@@ -410,7 +410,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		return;
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return;
 
 	{
@@ -479,7 +479,7 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
 		return;
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return;
 
 	if (!padapter->mlmepriv.not_indic_disco) {
@@ -768,7 +768,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE) == true) { /* sta mode */
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE)) { /* sta mode */
 			psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
 			if (psta) {
 				/* Jeff: don't disable ieee8021x_blocked while clearing key */
@@ -891,15 +891,15 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 		memcpy(param->u.crypt.key, (u8 *)params->key, params->key_len);
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		if (mac_addr)
 			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)
+		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
 	}
 
@@ -1031,7 +1031,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	int ret = 0;
 
-	if (adapter_to_dvobj(padapter)->processing_dev_remove == true) {
+	if (adapter_to_dvobj(padapter)->processing_dev_remove) {
 		ret = -EPERM;
 		goto exit;
 	}
@@ -1072,7 +1072,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 
 	rtw_wdev->iftype = type;
 
-	if (rtw_set_802_11_infrastructure_mode(padapter, networkType) == false) {
+	if (!rtw_set_802_11_infrastructure_mode(padapter, networkType)) {
 		rtw_wdev->iftype = old_type;
 		ret = -EPERM;
 		goto exit;
@@ -1207,8 +1207,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	pwdev_priv->scan_request = request;
 	spin_unlock_bh(&pwdev_priv->scan_req_lock);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING)) {
 			need_indicate_scan_done = true;
 			goto check_need_indicate_scan_done;
 		}
@@ -1223,10 +1223,10 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	if (request->ie && request->ie_len > 0)
 		rtw_cfg80211_set_probe_req_wpsp2pie(padapter, (u8 *)request->ie, request->ie_len);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
 		need_indicate_scan_done = true;
 		goto check_need_indicate_scan_done;
-	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
+	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 		ret = -EBUSY;
 		goto check_need_indicate_scan_done;
 	}
@@ -1282,7 +1282,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	}
 	spin_unlock_bh(&pmlmepriv->lock);
 
-	if (_status == false)
+	if (!_status)
 		ret = -1;
 
 check_need_indicate_scan_done:
@@ -1582,7 +1582,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
 	rtw_set_802_11_authentication_mode(padapter, psecuritypriv->ndisauthtype);
 
-	if (rtw_set_802_11_ssid(padapter, &ndis_ssid) == false) {
+	if (!rtw_set_802_11_ssid(padapter, &ndis_ssid)) {
 		ret = -1;
 		goto exit;
 	}
@@ -1608,7 +1608,7 @@ static int cfg80211_rtw_leave_ibss(struct wiphy *wiphy, struct net_device *ndev)
 
 		rtw_wdev->iftype = NL80211_IFTYPE_STATION;
 
-		if (rtw_set_802_11_infrastructure_mode(padapter, Ndis802_11Infrastructure) == false) {
+		if (!rtw_set_802_11_infrastructure_mode(padapter, Ndis802_11Infrastructure)) {
 			rtw_wdev->iftype = old_type;
 			ret = -EPERM;
 			goto leave_ibss;
@@ -1632,7 +1632,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	padapter->mlmepriv.not_indic_disco = true;
 
-	if (adapter_wdev_data(padapter)->block == true) {
+	if (adapter_wdev_data(padapter)->block) {
 		ret = -EBUSY;
 		goto exit;
 	}
@@ -1662,11 +1662,11 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	ndis_ssid.ssid_length = sme->ssid_len;
 	memcpy(ndis_ssid.ssid, (u8 *)sme->ssid, sme->ssid_len);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 		ret = -EBUSY;
 		goto exit;
 	}
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		rtw_scan_abort(padapter);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
@@ -1759,7 +1759,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	/* rtw_set_802_11_encryption_mode(padapter, padapter->securitypriv.ndisencryptstatus); */
 
-	if (rtw_set_802_11_connect(padapter, (u8 *)sme->bssid, &ndis_ssid) == false) {
+	if (!rtw_set_802_11_connect(padapter, (u8 *)sme->bssid, &ndis_ssid)) {
 		ret = -1;
 		goto exit;
 	}
@@ -2065,7 +2065,7 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		u32 len = skb->len;
 		u8 category, action;
 
-		if (rtw_action_frame_parse(buf, len, &category, &action) == false)
+		if (!rtw_action_frame_parse(buf, len, &category, &action))
 			goto fail;
 
 		/* starting alloc mgmt frame to dump it */
@@ -2247,7 +2247,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 	uint len, wps_ielen = 0;
 	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) != true)
+	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return -EINVAL;
 
 	if (head_len < 24)
@@ -2340,7 +2340,7 @@ static int cfg80211_rtw_del_station(struct wiphy *wiphy, struct net_device *ndev
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	const u8 *mac = params->mac;
 
-	if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)) != true)
+	if (!check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)))
 		return -EINVAL;
 
 	if (!mac) {
@@ -2546,7 +2546,7 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	/* indicate ack before issue frame to avoid racing with rsp frame */
 	rtw_cfg80211_mgmt_tx_status(padapter, *cookie, buf, len, ack, GFP_KERNEL);
 
-	if (rtw_action_frame_parse(buf, len, &category, &action) == false)
+	if (!rtw_action_frame_parse(buf, len, &category, &action))
 		goto exit;
 
 	rtw_ps_deny(padapter, PS_DENY_MGNT_TX);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 3ea9fdfa14f8..e9a2f3f7ec74 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -224,7 +224,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 				padapter->bSurpriseRemoved = true;
 
-			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
 				padapter->bSurpriseRemoved = true;
 				break;
 			}
@@ -300,7 +300,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 				padapter->bSurpriseRemoved = true;
 
-			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
 				padapter->bSurpriseRemoved = true;
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38b1a..3a9857378581 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -188,7 +188,7 @@ void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	s32 res = 0;
 
-	if (rtw_if_up(padapter) == false)
+	if (!rtw_if_up(padapter))
 		goto drop_packet;
 
 	rtw_check_xmit_resource(padapter, pkt);
-- 
2.53.0

