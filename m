Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1DD2BD012
	for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429417; cv=none; b=Dyh9SdpVzhPKZamwimSzByObZOBhcNDL/kYLHlxz4dv8Zak7JpgI9XVJJy9wAqt9lHaEHc/AadWSn2KHLLOp1ANosKwnh68jbt/LGNvgl0SVlLdoQ+HOjGvlzSrydCqsGnTWQRx8o/XzUThs5xGfja+yruE8v7NjfxaD7baS2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429417; c=relaxed/simple;
	bh=7/gNhqWazny3OyL0y4jesOeRtItr1Lf5eqPoiLHFWbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BiFfGgBOSxQlb0g0vp3XJ24arNhEawAVgUeBU818gOTsnMtpg8ubv8zW11TAveAnn5UnfOCpMmbCuyT1dI2dXFygeJc7vPm1EOyNehH6pBmaVpNvUn+7bgbDc8VWtEXsj9bXMaOSvLTc7DdREmUQU2pJN6U7VTiB6Cu0azPJyfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERFMqzXZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERFMqzXZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81f47610542so2229450b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 04:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769429415; x=1770034215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqZGJGsBG2P7D4vFR0AdHyYXZpLRsBLzqt7Wa5rjGTU=;
        b=ERFMqzXZ7RtuvTfI3wL++msyUjttxfMQHSw6KDctKcyJmmd1pjMuz0a/oJrrDFjFrd
         5cpQ9kO3gO78tiRBpAxHCysybw+rBpITcmU6v9zYmWkObFKks3YwIP1raINwLPCgZ5rM
         KyUoNtQsEZgg6M2G9SVYGgxGbF78UZV/+0vUoiIkKy4IIPK3WaExnT1NR4sKlxAb3qYi
         WX2xgmDjEsA5SigH1wEt9sFtxwyE+0l2n83i9g4HdphOuiXIEiHjiXTgrRou/vqUNWFf
         ehIJVXGtwsInbD9g9Ys87PWwcahO+KqcsNgBlX7BoHo1qbx6UtBKKowJP7kFx1yPIxVv
         If6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769429415; x=1770034215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqZGJGsBG2P7D4vFR0AdHyYXZpLRsBLzqt7Wa5rjGTU=;
        b=JBLdiC/35Wyie/5pFXPKPIMbNc1zjAYhC9U4qEhFgonfsQaLOSpfg75N9L2Xroj+1u
         Xws7gvyBaWITE9bzqsq4OxFGj9WFTTWQ8DbJEusRJEYaaRGC3Be026URYrwuD7LAgQeO
         11KAdVoJkYB/ZBCdclspyFA8xg+OkQkBV8d7zAkI5SpQbua59pNvVvhSy7XjOkO3qnO1
         Klzqm42T4Bi3/DMBvmSoxHaxiJ6zfUSjlyhMFVdLEoRFyaMTSzulwWgaPJ8mRaqsDRj5
         LvybKEcdMOLot2URukldOWDfXjefg05FZR2SizFtYfcpgx5lHsKi0sYbfGmA5cV0RjhY
         9VBA==
X-Forwarded-Encrypted: i=1; AJvYcCWRXY1WP5tyoDneJ5Slqfu3+LkcGgqCiIhneyAMLZttxekv1YdB99XayYL4es4bz9iOY5QOwaOQQED5ekkE@lists.linux.dev
X-Gm-Message-State: AOJu0YwjdYy2ZJ3aMMbiWtjeS8uazlGbfa2TXwPYm2FN71iChj1loIRl
	fwLOrO9qUXQDrYvBG354NnGMZgSjTOc306ngyKbcRGs8hIc7KY8X1XfNz/KrQ4JH
X-Gm-Gg: AZuq6aJcrkQE2P+SdGS4XcuH5qLaJ7j8RtmsEyCFU9KyHQBkHjA0lMRfa0bB6bsk0xU
	N9XPbdW984zpxziZXNIHPZr3weSPeClZFBBYtE4UTLWI800h6TOswaT6RaqDi2IWsv4ulQXXXz2
	nr43v+586eCKu7W3eBOvSCy3VvynGngT9lqLbhEdcorkplBDo3nBAAoWXNFPlcgv7hHkZmWXo/d
	5HgVedkOAptBDsJ4IlM33IAvk9kxG2KMu5L/DrMGAXW+7l/PLj8GVrO+zSfsC4Lsv3lOyu+nwKl
	f/2uB9GylI1QmObhZ41p9O8gCNDv6wU35UISEX6ct1qX+d9t4mJ9HApzzcpUNOYXLAIuLYqct5K
	zXGQ1+ahO3Ua6XZs5iNn0LWprhE7hIzyTZ+h5Dl6ruKAMiSE5s4DouGVhURlLMlHinvHKDt1GQQ
	qlksD0HBSQNKgDGGZKLl1d4x8Z8h+erDFv
X-Received: by 2002:a05:6a00:2355:b0:81f:5ec1:8bcd with SMTP id d2e1a72fcca58-8234122bd0emr3573059b3a.20.1769429414956;
        Mon, 26 Jan 2026 04:10:14 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d512sm9319854b3a.33.2026.01.26.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:10:14 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary boolean comparisons
Date: Mon, 26 Jan 2026 04:09:07 -0800
Message-ID: <20260126120908.19563-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove explicit comparisons to true/false in boolean expressions to
improve code readability and follow standard Linux kernel coding style.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
v3:
 - Reduced the series to a single patch.
 - Dropped the redundant "else" statement cleanup as it was already 
   merged into staging-next (commit 09a9c4bde41c).
 - Rebased on top of the latest staging-next branch.
 - Fixed minor alignment and line length issues in modified lines to
   comply with checkpatch.pl.

v2:
 - Split the cleanup into two patches (boolean comparisons and 
   redundant else statements).
 - Improved indentation and added proper sign-offs.

v1:
 - Initial version with combined cleanups.

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 42 +++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f81a29cd6a78..8e1e1c97f0c4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -179,8 +179,8 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 	if (pnetwork->fixed)
 		return;
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE))
 		lifetime = 1;
 
 	if (!isfreeall) {
@@ -267,7 +267,7 @@ signed int rtw_if_up(struct adapter *padapter)
 	signed int res;
 
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		(check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
+		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		res = false;
 	else
 		res =  true;
@@ -469,7 +469,7 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
 
-	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
 								pmlmepriv->cur_network.network.ie_length);
@@ -633,7 +633,7 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0))
 		bselected = false;
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		if (pnetwork->network.infrastructure_mode != pmlmepriv->cur_network.network.infrastructure_mode)
 			bselected = false;
 	}
@@ -661,7 +661,7 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 	spin_lock_bh(&pmlmepriv->lock);
 
 	/*  update IBSS_network 's timestamp */
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		if (!memcmp(&pmlmepriv->cur_network.network.mac_address, pnetwork->mac_address, ETH_ALEN)) {
 			struct wlan_network *ibss_wlan = NULL;
 
@@ -678,7 +678,7 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 	}
 
 	/*  lock pmlmepriv->lock when you accessing network_q */
-	if ((check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) == false) {
+	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 		if (pnetwork->ssid.ssid[0] == 0)
 			pnetwork->ssid.ssid_length = 0;
 		rtw_add_network(adapter, pnetwork);
@@ -710,8 +710,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
 				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
@@ -1206,7 +1206,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 						rtw_free_stainfo(adapter,  pcur_sta);
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 						if (ptarget_wlan)
 							ptarget_wlan->fixed = true;
 					}
@@ -1214,7 +1214,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 			} else {
 				ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
-				if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+				if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 					if (ptarget_wlan)
 						ptarget_wlan->fixed = true;
 				}
@@ -1231,7 +1231,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			}
 
 			/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 				ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
 				if (!ptarget_sta) {
 					spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
@@ -1240,7 +1240,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			}
 
 			/* s4. indicate connect */
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 				pmlmepriv->cur_network_scanned = ptarget_wlan;
 				rtw_indicate_connect(adapter);
 			}
@@ -1258,7 +1258,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 		rtw_reset_securitypriv(adapter);
 		_set_timer(&pmlmepriv->assoc_timer, 1);
 
-		if ((check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) == true)
+		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 	} else {/* if join_res < 0 (join fails), then try again */
@@ -1386,8 +1386,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
@@ -1624,7 +1624,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 	if (pmlmepriv->auto_scan_int_ms != 0
 		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
 		if (!padapter->registrypriv.wifi_spec) {
-			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true)
+			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
 
 			if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
@@ -1866,7 +1866,7 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 candidate_exist:
 
 	/*  check for situation of  _FW_LINKED */
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		rtw_disassoc_cmd(adapter, 0, true);
 		rtw_indicate_disconnect(adapter);
 		rtw_free_assoc_resources(adapter, 0);
@@ -2607,12 +2607,12 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 
 signed int rtw_linked_check(struct adapter *padapter)
 {
-	if ((check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true) ||
-			(check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE) == true)) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) ||
+	    check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
 		if (padapter->stapriv.asoc_sta_count > 2)
 			return true;
 	} else {	/* Station mode */
-		if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) == true)
+		if (check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 			return true;
 	}
 	return false;
-- 
2.43.0

