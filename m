Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F4239E65
	for <linux-staging@lists.linux.dev>; Sun,  1 Feb 2026 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769946008; cv=none; b=YeOEbyLYdDFAhW2TtmG778L5g65UrY4bAMx7PNPNX02WSCwfONAfMBaPRpPzE8PlZ0z9lJVSJSZRZ5UjI/nDGZ9yomJuNIKj4OF8LiIOJjMTK7uiZyi1tOsdie5ixqlb7vafuPO+MPEiw9UsmkGVGOVhKizlGObge/pD58YDT30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769946008; c=relaxed/simple;
	bh=VEHWnhCA10zhkeR+z57FtlFd2ORb+BmxNw9eSGSvMlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f94d4gKqgfl0V9H19XEhvteald3eI6atiUTMYzAhdPpMhX261U2Z2D6uU34hPet4fru8R1p0eMmHwNRgqf2pq+g395S0Isxg4WMe9atSHzYgPsqk2IHS31KcCN+PvLbr5npqy7ShXh5JwisMAI7FQTQU7+gVRpULjnOCLrjnwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKBlZ9hA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKBlZ9hA"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c61343f82d7so1392520a12.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769946006; x=1770550806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD1fbwC7X28JWcq9LUMH7rbyJ5ZFLhr2C6Ozi6G/pog=;
        b=lKBlZ9hARDIFaTp8OVNCx8C0La+knWzXTu1duh1mf0qK+JXwh4fUwrxtckE/UQ32iM
         VLuGYejbC2FuPGarXG5HZ3+dXx6eo/vtzJmUf6MOfTAsuOqgkkI+Js7ij6gGu2XKLEnF
         zUyo614qZ+UDrU/xwKOoDU9tk109ETB2j0tYajz4jH5BWDa3sJ5QEULt+IfPUEzhHvae
         LDImeGVrrY4QfieRbAp/h6kpneFwmsXAxLW1WsM8FLWwXvsKxZGv56RO3PiqglRk9hGG
         JOiZQfHOcDdFU4QCTe32cZ+GrGfdoMkuaNVeY1d/3QY81fMLhDPIXD6x4BDOlqsySJ7L
         cO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769946006; x=1770550806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PD1fbwC7X28JWcq9LUMH7rbyJ5ZFLhr2C6Ozi6G/pog=;
        b=X+D04N2Eyigc7IcJm1/wSXhnkinKN447U74k1U/9E8U50OWgVpFgEhvwqhsUDscLoE
         j3XxD4JanX7E3ZEk32zHQehnOlzjRTVLmXY1ZspRdMYkl9IgJaRmOHLDNyws5l5emu4i
         YuIVyLksaDz0tT/9hjiFNAS/dByUb4e2or+kQSOyGIaR4xySuJyKN0ThHlSCg8mjYMT7
         ZhIjZl30fp6+LwH0NiISGP/qigbbF9Aq6XtepPix4b8c7bgNjkZ1Az3utjcPP6SY+p/9
         b2TYrIAuCTrdOVFkvGoZ4R6dTHXbkNRQcJVqYqO7jyPlp+T8dTUQ1bV2FnCyoW/AEBk3
         lcfA==
X-Forwarded-Encrypted: i=1; AJvYcCXdmyOcLqUBmwPUy3vyW4mUyR7Ozs1lUhZ5Z+bzF1BJXBfFwoFThlwKQxdP5PHCUlSObyzsc9AlJDvdC2o6@lists.linux.dev
X-Gm-Message-State: AOJu0YxWyoY9xYsrlAHsfpHFSJ46+yGmVVXCB6j91/4iLaWT9DOPpiwK
	FCd5ixWRAa7rpiTV/2TjNT4TTJhM4R0339hnwgR5BEwYZIHh/YENH7y6NdrApw==
X-Gm-Gg: AZuq6aIHp1q6Rroa7EbenFo86o6xOO4JbknhthBhsJ6pazeGfGfNT5f23PBpPdgb/fD
	UVkBPK4YTJjf1u+lS80uHyAwgSXK5mLbcaZcS/ltx/mdplX9Q4dBw2h8TfpdGfSYFPWLUxUmonZ
	4t3vqFyK93noeTJL9aXwKZLbcJd5heeicSLqxUPz/hMVj7cAF/8V93lmyT+rGDYllDHVEbl4do2
	ia/UaYwwH/KhhsiyH3qz6cab5mK2YDpsSWRFqYrJEkVSKcGUnyQ6h5X1WYO79grtR4OYQhCTwdm
	R7C5x/L7Ec+E0krhlxt8UuLInJlLYLRgpTnD6OKIYbZ+D/vD2PkZ+OkQH1uoDEgK3YE14PNmhXd
	/WGwu7dDq4sjwNcz4hvpz7b7m8zF9ucnw9KhCtddcg/ZdSgHh6JpkMa09/Y2Qvgp9/G+x5Xhn8K
	ILVoJvQ+yasFRUSz7qM9MGrTbLEMU=
X-Received: by 2002:a17:902:da90:b0:29e:a615:f508 with SMTP id d9443c01a7336-2a8d803819bmr86319955ad.28.1769946005565;
        Sun, 01 Feb 2026 03:40:05 -0800 (PST)
Received: from snowman ([2401:4900:614d:8c00:9d3:b11e:236d:377a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f7caasm121156675ad.101.2026.02.01.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:40:04 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v6 1/4] staging: rtl8723bs: rename LinkDetectInfo and clean up related code
Date: Sun,  1 Feb 2026 17:08:34 +0530
Message-ID: <20260201113837.8531-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201113837.8531-1-khushalchitturi@gmail.com>
References: <20260201113837.8531-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames LinkDetectInfo instance to link_detect_info and update
the fields of rt_link_detect_t to follow kernel naming conventions.
Local variables in traffic_status_watchdog were also updated for
consistency.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v5 -> v6: Limited the changes to LinkDetectInfo renaming.
v4 -> v5: Rebased onto current staging-testing.
v3 -> v4: Narrow rename scope to affect link detection, and adjusted
formatting.
v2 -> v3: Resubmitted as a versioned series.
v1 -> v2: Corrected commit messages.

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 102 ++++++++++--------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   9 +-
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
 12 files changed, 105 insertions(+), 91 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 27da987d881f..ab3c7d3846b5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1130,12 +1130,16 @@ static void collect_traffic_statistics(struct adapter *padapter)
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 {
-	u8 bEnterPS = false;
-	u16 BusyThresholdHigh = 25;
-	u16 BusyThresholdLow = 10;
-	u16 BusyThreshold = BusyThresholdHigh;
-	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
-	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
+	u8 should_enter_ps = false;
+	u16 busy_threshold_high = 25;
+	u16 busy_threshold_low = 10;
+	u16 busy_threshold = busy_threshold_high;
+	u8 busy_traffic = false;
+	u8 tx_busy_traffic = false;
+	u8 rx_busy_traffic = false;
+	u8 higher_busy_traffic = false;
+	u8 higher_busy_rx_traffic = false;
+	u8 higher_busy_tx_traffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
@@ -1145,57 +1149,61 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
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
-		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
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
-		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
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
-		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
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
@@ -1215,17 +1223,17 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
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
 
 static void dynamic_chk_wk_hdl(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..2d37ac4c50ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -61,7 +61,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
 		/* we try to issue sitesurvey firstly */
 
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
+		if (pmlmepriv->link_detect_info.busy_traffic == false
 			|| rtw_to_roam(padapter) > 0
 		) {
 			/*  submit site_survey_cmd */
@@ -113,9 +113,8 @@ u8 rtw_do_join(struct adapter *padapter)
 
 				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
 				/* we try to issue sitesurvey firstly */
-				if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
-					|| rtw_to_roam(padapter) > 0
-				) {
+				if (pmlmepriv->link_detect_info.busy_traffic == false ||
+				    rtw_to_roam(padapter) > 0) {
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
 					if (ret != _SUCCESS)
 						pmlmepriv->to_join = false;
@@ -380,7 +379,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 	}
 
 	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
-		(pmlmepriv->LinkDetectInfo.bBusyTraffic == true)) {
+		(pmlmepriv->link_detect_info.busy_traffic == true)) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 8e1e1c97f0c4..4088a1aaae3c 100644
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
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
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
+		u8 should_enter_ps;
 
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
+	if (bmcst || padapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100)
 		return;
 
 	priority = pattrib->priority;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..8eafb929938c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1522,7 +1522,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (ignore_received_deauth == 0)
 		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
 }
 
@@ -1574,7 +1574,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
 
 }
@@ -4776,9 +4776,9 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 
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
index 0a8725686721..80d0c5884a2a 100644
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
index 9cead1455bfa..bff8f8e76a63 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1390,7 +1390,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
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
index 33c23b80e11b..32533a748f4d 100644
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
index 476ab055e53e..62b249cc23ef 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1232,7 +1232,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		goto check_need_indicate_scan_done;
 	}
 
-	if (pmlmepriv->LinkDetectInfo.bBusyTraffic == true) {
+	if (pmlmepriv->link_detect_info.busy_traffic == true) {
 		static unsigned long lastscantime;
 		unsigned long passtime;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f7f23d1b1709..eb1186e69bdf 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -606,11 +606,11 @@ void rtw_reset_drv_sw(struct adapter *padapter)
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

