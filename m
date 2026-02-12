Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98511DE2B4
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906120; cv=none; b=bIXt/XZuQN0+7JDCHI4pfs1JEOJzh9pBYdjdEQCYGHhILNKliOVRRuAvDoKxn1lttUuSl8q2PvpzXH/Nta25oYEDoM6FK5faXpKx79QtPfhdo05WUnQrqZx5g19lUsNz0F026HDsP7BwCmTesm+SS4ci9Xto3ZenQfWJQrseaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906120; c=relaxed/simple;
	bh=Gz+drbzvA5uCLe2JVl20jmgCsmBcByMlQKLBPuE6BhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM6oPk7sUSsVb8mzxJQgFyqYCyAQ6q/MdoJxjHb6sNheaWnQ2Ch2IECyDNS21vbw4oFEosH2pOyRs0hE/ihzShaGdEYHL2EtyD0KQLrgB9K5Z7v7n8RDsDgN14LHUHjI1wVAEptQrzJuZR9V3/K8cZ3g39ztz7VT6dAuAU68+iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUzqt+k5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUzqt+k5"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-823075fed75so1237578b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906118; x=1771510918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzcoFtC2gMrRDn/IBqqi/adTtin2TuH0g/AauQgdTNE=;
        b=KUzqt+k5r8N1JKLEvUmEz+tfYeKt2uREKzs0ys8V8e3pwMZlWPBUzoPtVmNiBdIQ9e
         k9VExb2cLVLDog+JmberRW8dXYNZoh17taW0Szg/wAxRyzKqeufAXDzMzERwxvljVJy4
         L+BPne3BiT1xlPgudyWTBxDX63MdRWWkiysudG1acI0segnZBtNSZR1olBr9kh1Ep+1y
         b2wiVSj3kdzHX9M1zUPJUrRZts2vu0VN7UBxDXRa0OMz93BhcoBph9X6AjMqFOSdndHs
         Vzmb4cGFscKpoVq/XgHGSREbPwJfaUVTgZEHg1/GtvVrtRlANyuB2wdZhMS2Czi5lVMv
         10WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906118; x=1771510918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BzcoFtC2gMrRDn/IBqqi/adTtin2TuH0g/AauQgdTNE=;
        b=TW5bm9yjzEKQEnTqpmX6BpN8/02xsnLzr0ScAJBw8PAXxykEvqwRHl9nBvex2g9NB/
         zKMYMBFPuwITLTTR1MovY1STuoM1YIh48pFdQmceIUy+E6kEWRjv62Xjt+PbzIOOFgM9
         pP2T5h0I7ZJC/tS5PvjhqdDHZnYCmgRminZ5Xsze2sNYW9AXclxVYRvbtfcY4KSqEIwh
         SPeCJGlSN7jBOePP/vN30N00Y1ozI4tlPgpdAGW0g682GFV17wT/6i0wkWFI8I5+/h3u
         gE4Keunq2tJkmq7v8mGPOlUu7hBJq6fEACg3XTPtAwM5/7JLwV6DawkyYjvMdGkwvI7v
         yVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZPvaDyi02zMjwM52TNwMLSiHx+ONevnh1M1nvm4k2IPOmwfzy1+xNfkaWEb2cO4X9sB3v4pLZkPcfbrI+@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyz70dany9rHKNqMDEO18d4UAoRPD2iyKuazE6R16AfakvTeya
	A5MYC+aKq00pnmfV7FK84g42IHtXcMqLYUXkn/XY/TpjX2PDL11fFoov
X-Gm-Gg: AZuq6aLUvD78EJIYpprM4hY6OxKbz6C1UQUsmkW4x8cjcpDyki5l+2PbOz++f8tWbdX
	RO9u30a8LuZqMjN+Rfx+cAd6H+MZPvX4vDDcIARQh8iYHYpwoGTvW4KPL3n3HiOQ7hXKib9CAcb
	A6WIBHFBeRcfCJKOfGvwzRMYxGlPK1hQKIenzMhiht1rmcjxQCpPz49YQuAeegVJ6crKEwJgsAy
	miEviJuc9Sb4DPUzRFnqL178sDv9FSvJX7ZOP3SsLo76euvwI1OcmFCtZlaZuoa5H2xvOIIkNqc
	VSZ7oSbtFBlW3d6SGWXL2eDFw5CnHDq+LYvkvDQa10SzkYPpxCOzud+I6pLeYCkLqQ5/G6AGufo
	ZOSNqueGmgOKv2hs4oWNykpv9KNYBGSWuAbSWFUXj2lR4O/0VATJMHP5n/dp2hI+7f5PDsTWXVz
	S8WPPS4zJRE2d3r5Z3Ak80w5tDUVe8MA==
X-Received: by 2002:a05:6a00:4512:b0:7b8:acdd:23c3 with SMTP id d2e1a72fcca58-824b0cd744cmr2264931b3a.11.1770906117905;
        Thu, 12 Feb 2026 06:21:57 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:21:56 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 2/7] staging: rtl8723bs: rename rt_link_detect_t fields to snake_case
Date: Thu, 12 Feb 2026 19:51:26 +0530
Message-ID: <20260212142131.28131-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212142131.28131-1-khushalchitturi@gmail.com>
References: <20260212142131.28131-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the CamelCase field names in struct rt_link_detect_t to
snake_case to follow naming conventions.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v6 -> v7: Split from previous patch.

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 54 +++++++++----------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  6 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  8 +--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 22 ++++----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  6 +--
 12 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index bd1eed3d98fb..b3fa54f7f7a9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1143,51 +1143,51 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	if ((check_fwstate(pmlmepriv, _FW_LINKED))
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
-		if (pmlmepriv->link_detect_info.bBusyTraffic)
+		if (pmlmepriv->link_detect_info.busy_traffic)
 			BusyThreshold = BusyThresholdLow;
 
-		if (pmlmepriv->link_detect_info.NumRxOkInPeriod > BusyThreshold ||
-		    pmlmepriv->link_detect_info.NumTxOkInPeriod > BusyThreshold) {
+		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > BusyThreshold ||
+		    pmlmepriv->link_detect_info.num_tx_ok_in_period > BusyThreshold) {
 			bBusyTraffic = true;
 
-			if (pmlmepriv->link_detect_info.NumRxOkInPeriod > pmlmepriv->link_detect_info.NumTxOkInPeriod)
+			if (pmlmepriv->link_detect_info.num_rx_ok_in_period > pmlmepriv->link_detect_info.num_tx_ok_in_period)
 				bRxBusyTraffic = true;
 			else
 				bTxBusyTraffic = true;
 		}
 
 		/*  Higher Tx/Rx data. */
-		if (pmlmepriv->link_detect_info.NumRxOkInPeriod > 4000 ||
-		    pmlmepriv->link_detect_info.NumTxOkInPeriod > 4000) {
+		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > 4000 ||
+		    pmlmepriv->link_detect_info.num_tx_ok_in_period > 4000) {
 			bHigherBusyTraffic = true;
 
-			if (pmlmepriv->link_detect_info.NumRxOkInPeriod > pmlmepriv->link_detect_info.NumTxOkInPeriod)
+			if (pmlmepriv->link_detect_info.num_rx_ok_in_period > pmlmepriv->link_detect_info.num_tx_ok_in_period)
 				bHigherBusyRxTraffic = true;
 			else
 				bHigherBusyTxTraffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod + pmlmepriv->link_detect_info.NumTxOkInPeriod) > 8) ||
-		    (pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
+		if (((pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period + pmlmepriv->link_detect_info.num_tx_ok_in_period) > 8) ||
+		    (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 2)) {
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
-				if (pmlmepriv->link_detect_info.TrafficTransitionCount <= 4)
-					pmlmepriv->link_detect_info.TrafficTransitionCount = 4;
+				if (pmlmepriv->link_detect_info.traffic_transition_count <= 4)
+					pmlmepriv->link_detect_info.traffic_transition_count = 4;
 
-				pmlmepriv->link_detect_info.TrafficTransitionCount++;
+				pmlmepriv->link_detect_info.traffic_transition_count++;
 
-				if (pmlmepriv->link_detect_info.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
-					pmlmepriv->link_detect_info.TrafficTransitionCount = 30;
+				if (pmlmepriv->link_detect_info.traffic_transition_count > 30/*TrafficTransitionLevel*/)
+					pmlmepriv->link_detect_info.traffic_transition_count = 30;
 			}
 		} else {
-			if (pmlmepriv->link_detect_info.TrafficTransitionCount >= 2)
-				pmlmepriv->link_detect_info.TrafficTransitionCount -= 2;
+			if (pmlmepriv->link_detect_info.traffic_transition_count >= 2)
+				pmlmepriv->link_detect_info.traffic_transition_count -= 2;
 			else
-				pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
+				pmlmepriv->link_detect_info.traffic_transition_count = 0;
 
-			if (pmlmepriv->link_detect_info.TrafficTransitionCount == 0)
+			if (pmlmepriv->link_detect_info.traffic_transition_count == 0)
 				bEnterPS = true;
 		}
 
@@ -1212,15 +1212,15 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			LPS_Leave(padapter, "NON_LINKED");
 	}
 
-	pmlmepriv->link_detect_info.NumRxOkInPeriod = 0;
-	pmlmepriv->link_detect_info.NumTxOkInPeriod = 0;
-	pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod = 0;
-	pmlmepriv->link_detect_info.bBusyTraffic = bBusyTraffic;
-	pmlmepriv->link_detect_info.bTxBusyTraffic = bTxBusyTraffic;
-	pmlmepriv->link_detect_info.bRxBusyTraffic = bRxBusyTraffic;
-	pmlmepriv->link_detect_info.bHigherBusyTraffic = bHigherBusyTraffic;
-	pmlmepriv->link_detect_info.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
-	pmlmepriv->link_detect_info.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
+	pmlmepriv->link_detect_info.num_rx_ok_in_period = 0;
+	pmlmepriv->link_detect_info.num_tx_ok_in_period = 0;
+	pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period = 0;
+	pmlmepriv->link_detect_info.busy_traffic = bBusyTraffic;
+	pmlmepriv->link_detect_info.tx_busy_traffic = bTxBusyTraffic;
+	pmlmepriv->link_detect_info.rx_busy_traffic = bRxBusyTraffic;
+	pmlmepriv->link_detect_info.higher_busy_traffic = bHigherBusyTraffic;
+	pmlmepriv->link_detect_info.higher_busy_rx_traffic = bHigherBusyRxTraffic;
+	pmlmepriv->link_detect_info.higher_busy_tx_traffic = bHigherBusyTxTraffic;
 
 	return bEnterPS;
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 87fd4b11a7dd..c41595d03c08 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -61,7 +61,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
 		/* we try to issue sitesurvey firstly */
 
-		if (pmlmepriv->link_detect_info.bBusyTraffic == false
+		if (pmlmepriv->link_detect_info.busy_traffic == false
 			|| rtw_to_roam(padapter) > 0
 		) {
 			/*  submit site_survey_cmd */
@@ -113,7 +113,7 @@ u8 rtw_do_join(struct adapter *padapter)
 
 				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
 				/* we try to issue sitesurvey firstly */
-				if (pmlmepriv->link_detect_info.bBusyTraffic == false
+				if (pmlmepriv->link_detect_info.busy_traffic == false
 					|| rtw_to_roam(padapter) > 0
 				) {
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
@@ -380,7 +380,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 	}
 
 	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
-		(pmlmepriv->link_detect_info.bBusyTraffic == true)) {
+		(pmlmepriv->link_detect_info.busy_traffic == true)) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1217c409abea..944f56b7acf5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1174,8 +1174,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
-	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
+	pmlmepriv->link_detect_info.traffic_transition_count = 0;
+	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
 	if (pnetwork->join_res > 0) {
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
@@ -1615,7 +1615,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
 
-			if (pmlmepriv->link_detect_info.bBusyTraffic)
+			if (pmlmepriv->link_detect_info.busy_traffic)
 				goto exit;
 		}
 
@@ -2504,8 +2504,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
-	/* if (bmcst || (padapter->mlmepriv.link_detect_info.bTxBusyTraffic == false)) */
-	if (bmcst || (padapter->mlmepriv.link_detect_info.NumTxOkInPeriod < 100))
+	/* if (bmcst || (padapter->mlmepriv.link_detect_info.tx_busy_traffic == false)) */
+	if (bmcst || (padapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100))
 		return;
 
 	priority = pattrib->priority;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 74aa089a97bd..6a85cf9cecfc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1511,7 +1511,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (ignore_received_deauth == 0)
 		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->link_detect_info.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
 }
 
@@ -1563,7 +1563,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->link_detect_info.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
 
 }
@@ -4757,8 +4757,8 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	timer_delete_sync(&pmlmeext->link_timer);
 
 	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
-	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
-	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
+	pmlmepriv->link_detect_info.traffic_transition_count = 0;
+	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 3122435fa91d..15657de5475e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -206,7 +206,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 		}
 
 	} else { /*  from rx path */
-		if (pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod > 4/*2*/) {
+		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4/*2*/) {
 			if (adapter_to_pwrctl(padapter)->bLeisurePs
 			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
 			    && !(hal_btcoex_IsBtControlLps(padapter)))
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index cb20f2bee0a0..beaadcaff967 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -680,10 +680,10 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 	sz = get_recvframe_len(prframe);
 	precvpriv->rx_bytes += sz;
 
-	padapter->mlmepriv.link_detect_info.NumRxOkInPeriod++;
+	padapter->mlmepriv.link_detect_info.num_rx_ok_in_period++;
 
 	if ((!is_broadcast_ether_addr(pattrib->dst)) && (!is_multicast_ether_addr(pattrib->dst)))
-		padapter->mlmepriv.link_detect_info.NumRxUnicastOkInPeriod++;
+		padapter->mlmepriv.link_detect_info.num_rx_unicast_ok_in_period++;
 
 	if (sta)
 		psta = sta;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 976f6f6ed029..da0ec4c05208 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1414,7 +1414,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
-		pmlmepriv->link_detect_info.NumTxOkInPeriod += pkt_num;
+		pmlmepriv->link_detect_info.num_tx_ok_in_period += pkt_num;
 
 		pxmitpriv->tx_pkts += pkt_num;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 973d2e6a9d6a..9c84f4cf1dda 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -167,7 +167,7 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 			return true;
-		if (pmlmepriv->link_detect_info.bBusyTraffic)
+		if (pmlmepriv->link_detect_info.busy_traffic)
 			return true;
 	}
 
@@ -366,7 +366,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 			struct rt_link_detect_t *plinkinfo;
 			plinkinfo = &padapter->mlmepriv.link_detect_info;
 
-			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
+			if (plinkinfo->num_tx_ok_in_period > plinkinfo->num_rx_ok_in_period)
 				*pU4Tmp = BTC_WIFI_TRAFFIC_TX;
 			else
 				*pU4Tmp = BTC_WIFI_TRAFFIC_RX;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a8d3a3b16c95..379d29d3f9d3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -202,7 +202,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 		if (
 			(check_pending_xmitbuf(pxmitpriv)) &&
-			(padapter->mlmepriv.link_detect_info.bHigherBusyTxTraffic)
+			(padapter->mlmepriv.link_detect_info.higher_busy_tx_traffic)
 		) {
 			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
 				err = -2;
@@ -482,7 +482,7 @@ s32 rtl8723bs_hal_xmit(
 		(pxmitframe->attrib.ether_type != 0x888e) &&
 		(pxmitframe->attrib.dhcp_pkt != 1)
 	) {
-		if (padapter->mlmepriv.link_detect_info.bBusyTraffic)
+		if (padapter->mlmepriv.link_detect_info.busy_traffic)
 			rtw_issue_addbareq_cmd(padapter, pxmitframe);
 	}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 1659c4b43957..66d522006dfb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -93,18 +93,18 @@ struct sitesurvey_ctrl {
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
+	bool			higher_busy_traffic; /*  For interrupt migration purpose. */
+	bool			higher_busy_rx_traffic; /*  We may disable Tx interrupt according as Rx traffic. */
+	bool			higher_busy_tx_traffic; /*  We may disable Tx interrupt according as Tx traffic. */
 	/* u8 TrafficBusyState; */
-	u8 TrafficTransitionCount;
-	u32 LowPowerTransitionCount;
+	u8 traffic_transition_count;
+	u32 low_power_transition_count;
 };
 
 /* used for mlme_priv.roam_flags */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 88ba148bbc78..983669189d41 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1231,7 +1231,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		goto check_need_indicate_scan_done;
 	}
 
-	if (pmlmepriv->link_detect_info.bBusyTraffic == true) {
+	if (pmlmepriv->link_detect_info.busy_traffic == true) {
 		static unsigned long lastscantime;
 		unsigned long passtime;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 572ee4124b52..953e29ad2c44 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -618,11 +618,11 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	padapter->xmitpriv.tx_pkts = 0;
 	padapter->recvpriv.rx_pkts = 0;
 
-	pmlmepriv->link_detect_info.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.busy_traffic = false;
 
 	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
-	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
-	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
+	pmlmepriv->link_detect_info.traffic_transition_count = 0;
+	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
 
-- 
2.52.0

