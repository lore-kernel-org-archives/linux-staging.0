Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63713353EE5
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100509; cv=none; b=uxfVINKCiUCKR75XGFT5NFhblWAI5UKQhhVezmW064JtumPtMDdEJaFhsfedjjCsJ+f6WQBUOpZXP+XKNY1K7TCd+XHe+BvEafFZJP9QxAvNbLU6xFLols75UaI6SCnPHIYPR64q2kFi3IVDGmO7eHOk2tASyJi7LB7lmVIwlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100509; c=relaxed/simple;
	bh=fWdbJsC0Vx/n2+9X7PJdBIzwpNiwAlm/8RrY9+fxIHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXemb0PHhOFREiP/N2/F2BpUAuRNK0SVdTcU6JB5TcGUntaB8qwwdtHPwO4IuUZVAxyW6xvf0FbfnM7WeoZH+wV9co2OxR78ky3734bPrrtNuhVbnJZRdZPTTakie9fl8Gm4LtL9pc0I248JoyKYJdzD8kCLT1HRzoifoJUWbB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyCea/X4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyCea/X4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a7aa9efc55so8168525ad.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100497; x=1769705297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqfhhn628N3fcgAUB6Q+dDfuXWXa6AjyDLgzZbmqr+E=;
        b=PyCea/X46gfbmuvzd/XpcF5oKD2GWl45SFFr1kc5m0xqmrlDaQwoNOIi+MLQOKu5vJ
         aQhmJCVdvOgvBTUopKPKrLxJkNFUsRcVZcB0BJKi4tsYRHa8LYv/68fb93uq3QYxfqH7
         1IEk9slQ4c6+kK3DWAQ6B1ivNNOTzc0I3Xdje/KNMwcHnE8iRDF05zAl/+5xqg+Twatz
         +fa/kDNC1BLIpvKuBnONXvEe0zTRXV3lrvK2cjiDEn4oCU8NrT77DxelwUCLomo/35R0
         lRgqbcxfY97Z3vDrQzonUBxiqmJ3Vy/xDCb7bToGd/RdiNDqznvLP9sVQLaFhh7EQCoP
         olvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100497; x=1769705297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zqfhhn628N3fcgAUB6Q+dDfuXWXa6AjyDLgzZbmqr+E=;
        b=WPmV2KjTK6cH3T4HcrtmtrypWsLq0cQegyfaPE/v+xmaaWTZjh7tkw+5rQaTbw1uN2
         TPkiyPRQFCloxwWcT7Fn+maNPUFWK2v4WRLoG5x95ELWTy52N0s9pygujWGLs+zqaCiT
         rHw1eKlDuUYUBWZWSJlT1WMndvbjkq8aQ7582uE0pbIUy7NSguYBXHNvl2KR+1OHpbSK
         MA3z7EsjxLL4JrfTvzvlCsdg8LhVkWoyeJewymXVzRW4M259IPr+XQOA9rYrSM7HCjYD
         UcVRp+TkSjIQbKb1BsgNwKuhz12c08GkV4yGSLrsUxd1ihnzV9HB4PqDfO1tLZ8wmvjx
         hXvA==
X-Forwarded-Encrypted: i=1; AJvYcCVQZjaU6BYDb/6bPVO0kF8nQP49HhIC13TOAj0NDEvau4n0iBjuMmg0YATwpSmAd5U8bmSJ30CjBlMbpIiI@lists.linux.dev
X-Gm-Message-State: AOJu0YwjKw3+1NUCp09oh6ujRyejP40uG2Q/aHN32dJefmmVsTAG6vLf
	en5deaze7VLoX450BZO3iO8lpwQv1nM/WEr7xcH+K4axt3Op7KrQHKfs
X-Gm-Gg: AZuq6aInwE7vMzdKDMUSjJpK5kDKja/DUBzcsSLmrJnJJ2Gch60Pnje750Ivmgqho26
	ck56NRB2vcIyqDUEdctpxItg47zu3dW+pB9REWqaT0MfqLssi1d3ZFEkBjq6CJSjTLsFCFolxEG
	dA6nvCCbREXP91kMShcyQ2+0KjWmBxV3ei3jG7+sN/mH3IeEqxoH9tJQim20i2RYRI8SOqxlyvh
	sf6aI6RkHBy93thMa1NnyedHf148u6ENaX2AlPjlADBqorrW8HkachEqtQUtXamTZec4xqgtfdt
	3XIXyLACsbb+ync6RCvgU5uKxGVymhOJvyQTsbz4IhTV5tNDz1qeR/zAHkyBo0YNxKSPM05Rkf3
	nXbprBEnNep3YsK04yz2mdBAjbzK0avcK5x+HxxKUbZNfn/7fyNlSZlZ79mXIP4KuYBd09o99SR
	DhPNhrQGZtTU36qF72hSxIe/9z
X-Received: by 2002:a17:902:ebc3:b0:2a7:8486:fe63 with SMTP id d9443c01a7336-2a7fe74f2b1mr200565ad.51.1769100496470;
        Thu, 22 Jan 2026 08:48:16 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd523sm189986225ad.62.2026.01.22.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:48:16 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v4 2/3] staging: rtl8723bs: rename LinkDetectInfo and clean up related code
Date: Thu, 22 Jan 2026 22:17:50 +0530
Message-ID: <20260122164751.37796-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122164751.37796-1-khushalchitturi@gmail.com>
References: <20260122164751.37796-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames LinkDetectInfo instance to link_detect_info and updates
the fields of rt_link_detect_t to follow kernel naming conventions.
Local variables in traffic_status_watchdog were also updated for
consistency.

Related checkpatch.pl warnings triggered by the rename were also fixed.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v3 -> v4: Narrow rename scope to affect link detection, and adjusted
formatting.
v2 -> v3: Resubmitted as a versioned series.
v1 -> v2: Corrected commit messages.

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 102 ++++++++++--------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  15 ++-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  16 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  10 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  31 +++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   8 +-
 12 files changed, 107 insertions(+), 95 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..ad673045f522 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1128,12 +1128,16 @@ static void collect_traffic_statistics(struct adapter *padapter)
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 {
-	u8 bEnterPS = false;
-	u16 BusyThresholdHigh = 25;
-	u16 BusyThresholdLow = 10;
-	u16 BusyThreshold = BusyThresholdHigh;
-	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
-	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
+	bool should_enter_ps = false;
+	u16 busy_threshold_high = 25;
+	u16 busy_threshold_low = 10;
+	u16 busy_threshold = busy_threshold_high;
+	bool busy_traffic = false;
+	bool tx_busy_traffic = false;
+	bool rx_busy_traffic = false;
+	bool higher_busy_traffic = false;
+	bool higher_busy_rx_traffic = false;
+	bool higher_busy_tx_traffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
@@ -1143,57 +1147,61 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	/*  */
 	if ((check_fwstate(pmlmepriv, _FW_LINKED))
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
-		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
-			BusyThreshold = BusyThresholdLow;
+		/*  if we raise busy_traffic in last watchdog, using lower threshold. */
+		if (pmlmepriv->link_detect_info.busy_traffic)
+			busy_threshold = busy_threshold_low;
 
-		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
-			bBusyTraffic = true;
+		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > busy_threshold ||
+		    pmlmepriv->link_detect_info.num_tx_ok_in_period > busy_threshold) {
+			busy_traffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
-				bRxBusyTraffic = true;
+			if (pmlmepriv->link_detect_info.num_rx_ok_in_period >
+			    pmlmepriv->link_detect_info.num_tx_ok_in_period)
+				rx_busy_traffic = true;
 			else
-				bTxBusyTraffic = true;
+				tx_busy_traffic = true;
 		}
 
 		/*  Higher Tx/Rx data. */
-		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
-			bHigherBusyTraffic = true;
+		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > 4000 ||
+		    pmlmepriv->link_detect_info.num_tx_ok_in_period > 4000) {
+			higher_busy_traffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
-				bHigherBusyRxTraffic = true;
+			if (pmlmepriv->link_detect_info.num_rx_ok_in_period >
+			    pmlmepriv->link_detect_info.num_tx_ok_in_period)
+				higher_busy_rx_traffic = true;
 			else
-				bHigherBusyTxTraffic = true;
+				higher_busy_tx_traffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
-			bEnterPS = false;
+		if ((pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period +
+		     pmlmepriv->link_detect_info.num_tx_ok_in_period) > 8 ||
+		    pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 2) {
+			should_enter_ps = false;
 
-			if (bBusyTraffic) {
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
+			if (busy_traffic) {
+				if (pmlmepriv->link_detect_info.traffic_transition_count <= 4)
+					pmlmepriv->link_detect_info.traffic_transition_count = 4;
 
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;
+				pmlmepriv->link_detect_info.traffic_transition_count++;
 
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
+				/* Check if traffic transition count exceeds the threshold */
+				if (pmlmepriv->link_detect_info.traffic_transition_count > 30)
+					pmlmepriv->link_detect_info.traffic_transition_count = 30;
 			}
 		} else {
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >= 2)
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount -= 2;
+			if (pmlmepriv->link_detect_info.traffic_transition_count >= 2)
+				pmlmepriv->link_detect_info.traffic_transition_count -= 2;
 			else
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+				pmlmepriv->link_detect_info.traffic_transition_count = 0;
 
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
-				bEnterPS = true;
+			if (pmlmepriv->link_detect_info.traffic_transition_count == 0)
+				should_enter_ps = true;
 		}
 
 		/*  LeisurePS only work in infra mode. */
-		if (bEnterPS) {
+		if (should_enter_ps) {
 			if (!from_timer)
 				LPS_Enter(padapter, "TRAFFIC_IDLE");
 		} else {
@@ -1213,17 +1221,17 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			LPS_Leave(padapter, "NON_LINKED");
 	}
 
-	pmlmepriv->LinkDetectInfo.NumRxOkInPeriod = 0;
-	pmlmepriv->LinkDetectInfo.NumTxOkInPeriod = 0;
-	pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod = 0;
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = bBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bTxBusyTraffic = bTxBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bRxBusyTraffic = bRxBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bHigherBusyTraffic = bHigherBusyTraffic;
-	pmlmepriv->LinkDetectInfo.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
-	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
-
-	return bEnterPS;
+	pmlmepriv->link_detect_info.num_rx_ok_in_period = 0;
+	pmlmepriv->link_detect_info.num_tx_ok_in_period = 0;
+	pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period = 0;
+	pmlmepriv->link_detect_info.busy_traffic = busy_traffic;
+	pmlmepriv->link_detect_info.tx_busy_traffic = tx_busy_traffic;
+	pmlmepriv->link_detect_info.rx_busy_traffic = rx_busy_traffic;
+	pmlmepriv->link_detect_info.higher_busy_traffic = higher_busy_traffic;
+	pmlmepriv->link_detect_info.higher_busy_rx_traffic = higher_busy_rx_traffic;
+	pmlmepriv->link_detect_info.higher_busy_tx_traffic = higher_busy_tx_traffic;
+
+	return should_enter_ps;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..b190cb1392a0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -61,9 +61,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
 		/* we try to issue sitesurvey firstly */
 
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
-			|| rtw_to_roam(padapter) > 0
-		) {
+		if (!pmlmepriv->link_detect_info.busy_traffic || rtw_to_roam(padapter) > 0) {
 			/*  submit site_survey_cmd */
 			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
 			if (ret != _SUCCESS)
@@ -113,9 +111,8 @@ u8 rtw_do_join(struct adapter *padapter)
 
 				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
 				/* we try to issue sitesurvey firstly */
-				if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
-					|| rtw_to_roam(padapter) > 0
-				) {
+				if (!pmlmepriv->link_detect_info.busy_traffic ||
+				    rtw_to_roam(padapter) > 0) {
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
 					if (ret != _SUCCESS)
 						pmlmepriv->to_join = false;
@@ -374,13 +371,13 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		res = false;
 		goto exit;
 	}
-	if (padapter->hw_init_completed == false) {
+	if (!padapter->hw_init_completed) {
 		res = false;
 		goto exit;
 	}
 
-	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
-		(pmlmepriv->LinkDetectInfo.bBusyTraffic == true)) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) ||
+	    pmlmepriv->link_detect_info.busy_traffic) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..88242fcdf85f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1185,8 +1185,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	pmlmepriv->link_detect_info.traffic_transition_count = 0;
+	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
 	if (pnetwork->join_res > 0) {
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
@@ -1627,7 +1627,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true)
 				goto exit;
 
-			if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+			if (pmlmepriv->link_detect_info.busy_traffic)
 				goto exit;
 		}
 
@@ -1655,12 +1655,12 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
 		&& !(hal_btcoex_IsBtControlLps(adapter))
 		) {
-		u8 bEnterPS;
+		bool should_enter_ps;
 
 		linked_status_chk(adapter);
 
-		bEnterPS = traffic_status_watchdog(adapter, 1);
-		if (bEnterPS) {
+		should_enter_ps = traffic_status_watchdog(adapter, 1);
+		if (should_enter_ps) {
 			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
 			rtw_hal_dm_watchdog_in_lps(adapter);
 		} else {
@@ -2517,8 +2517,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
-	/* if (bmcst || (padapter->mlmepriv.LinkDetectInfo.bTxBusyTraffic == false)) */
-	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100))
+	/* if (bmcst || (padapter->mlmepriv.link_detect_info.tx_busy_traffic == false)) */
+	if (bmcst || (padapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100))
 		return;
 
 	priority = pattrib->priority;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..54b4fe2a2072 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1523,7 +1523,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (ignore_received_deauth == 0)
 		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
 }
 
@@ -1575,7 +1575,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
 
 }
@@ -4775,9 +4775,9 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 
 	timer_delete_sync(&pmlmeext->link_timer);
 
-	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
+	pmlmepriv->link_detect_info.traffic_transition_count = 0;
+	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 0ef788abf403..5fab7b32d4d4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -210,7 +210,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 		}
 
 	} else { /*  from rx path */
-		if (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 4/*2*/) {
+		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4/*2*/) {
 			if (adapter_to_pwrctl(padapter)->bLeisurePs
 			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
 			    && !(hal_btcoex_IsBtControlLps(padapter)))
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e893cb6fa273..82f5061432e0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -680,10 +680,10 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 	sz = get_recvframe_len(prframe);
 	precvpriv->rx_bytes += sz;
 
-	padapter->mlmepriv.LinkDetectInfo.NumRxOkInPeriod++;
+	padapter->mlmepriv.link_detect_info.num_rx_ok_in_period++;
 
 	if ((!is_broadcast_ether_addr(pattrib->dst)) && (!is_multicast_ether_addr(pattrib->dst)))
-		padapter->mlmepriv.LinkDetectInfo.NumRxUnicastOkInPeriod++;
+		padapter->mlmepriv.link_detect_info.num_rx_unicast_ok_in_period++;
 
 	if (sta)
 		psta = sta;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 1ab1937fa2d7..959cbb4a194e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1391,7 +1391,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
-		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
+		pmlmepriv->link_detect_info.num_tx_ok_in_period += pkt_num;
 
 		pxmitpriv->tx_pkts += pkt_num;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..9c84f4cf1dda 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -167,7 +167,7 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 			return true;
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+		if (pmlmepriv->link_detect_info.busy_traffic)
 			return true;
 	}
 
@@ -364,9 +364,9 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 	case BTC_GET_U4_WIFI_TRAFFIC_DIRECTION:
 		{
 			struct rt_link_detect_t *plinkinfo;
-			plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
+			plinkinfo = &padapter->mlmepriv.link_detect_info;
 
-			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
+			if (plinkinfo->num_tx_ok_in_period > plinkinfo->num_rx_ok_in_period)
 				*pU4Tmp = BTC_WIFI_TRAFFIC_TX;
 			else
 				*pU4Tmp = BTC_WIFI_TRAFFIC_RX;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..1af9b922b4bc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -202,7 +202,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 		if (
 			(check_pending_xmitbuf(pxmitpriv)) &&
-			(padapter->mlmepriv.LinkDetectInfo.bHigherBusyTxTraffic)
+			(padapter->mlmepriv.link_detect_info.higher_busy_tx_traffic)
 		) {
 			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
 				err = -2;
@@ -482,7 +482,7 @@ s32 rtl8723bs_hal_xmit(
 		(pxmitframe->attrib.ether_type != 0x888e) &&
 		(pxmitframe->attrib.dhcp_pkt != 1)
 	) {
-		if (padapter->mlmepriv.LinkDetectInfo.bBusyTraffic)
+		if (padapter->mlmepriv.link_detect_info.busy_traffic)
 			rtw_issue_addbareq_cmd(padapter, pxmitframe);
 	}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 2a128568c6df..3cec80135fcd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -93,18 +93,25 @@ struct sitesurvey_ctrl {
 };
 
 struct rt_link_detect_t {
-	u32 			NumTxOkInPeriod;
-	u32 			NumRxOkInPeriod;
-	u32 			NumRxUnicastOkInPeriod;
-	bool			bBusyTraffic;
-	bool			bTxBusyTraffic;
-	bool			bRxBusyTraffic;
-	bool			bHigherBusyTraffic; /*  For interrupt migration purpose. */
-	bool			bHigherBusyRxTraffic; /*  We may disable Tx interrupt according as Rx traffic. */
-	bool			bHigherBusyTxTraffic; /*  We may disable Tx interrupt according as Tx traffic. */
+	u32			num_tx_ok_in_period;
+	u32			num_rx_ok_in_period;
+	u32			num_rx_unicast_ok_in_period;
+	bool			busy_traffic;
+	bool			tx_busy_traffic;
+	bool			rx_busy_traffic;
+
+	/* For interrupt migration purpose. */
+	bool			higher_busy_traffic;
+
+	/* We may disable Tx interrupt according as Rx traffic. */
+	bool			higher_busy_rx_traffic;
+
+	/* We may disable Tx interrupt according as Tx traffic. */
+	bool			higher_busy_tx_traffic;
+
 	/* u8 TrafficBusyState; */
-	u8 TrafficTransitionCount;
-	u32 LowPowerTransitionCount;
+	u8 traffic_transition_count;
+	u32 low_power_transition_count;
 };
 
 /* used for mlme_priv.roam_flags */
@@ -171,7 +178,7 @@ struct mlme_priv {
 
 	struct ht_priv htpriv;
 
-	struct rt_link_detect_t	LinkDetectInfo;
+	struct rt_link_detect_t	link_detect_info;
 	struct timer_list	dynamic_chk_timer; /* dynamic/periodic check timer */
 
 	u8 acm_mask; /*  for wmm acm mask */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..74aa7455311a 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1231,7 +1231,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		goto check_need_indicate_scan_done;
 	}
 
-	if (pmlmepriv->LinkDetectInfo.bBusyTraffic == true) {
+	if (pmlmepriv->link_detect_info.busy_traffic) {
 		static unsigned long lastscantime;
 		unsigned long passtime;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548805..92b94bebd7f2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -610,11 +610,11 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	padapter->xmitpriv.tx_pkts = 0;
 	padapter->recvpriv.rx_pkts = 0;
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 
-	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
+	pmlmepriv->link_detect_info.traffic_transition_count = 0;
+	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
 
-- 
2.52.0

