Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E6635B655
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906114; cv=none; b=pciP+8lLj8UkKkXbNYkctNwI+WgLk9Kr/8vysun/0wfjg9UZGCglI4TvPcpnShCzSuEig2xUErkXZGSAycMcL62hNy/VS6h2HSY2VLCOXBLQ9yvtkRC8uqPIq04mZ6bqQujhbFWCP5aQ9NHW/2lmAwC6cJphICPL+sLXNvv+j6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906114; c=relaxed/simple;
	bh=gHZKWMFTzv8X+uufCc9YFZKAOeqb7OPp74aA8IZOHA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s359tHEdNDHDn3lu0F3odciapvce0ynxAYudNhGsFG/OlyZCFOVGqNVTuZhbJ5rV3pvgiYngvMRXxLBoEZ6hb1BgRQXhfcaFSuwlAbjItG/i4B59W0o64ufOlEfiS/oA2tjwp7H8UvJ6AuJyJXl1jkGPEbtqqp9SlHfj0I0wVLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsgDvJq2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsgDvJq2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824b5f015bcso693330b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906112; x=1771510912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iumDngoSc+xj3Wvk1Z780999EPLacHI65kOB8TxNGR0=;
        b=WsgDvJq2nZAV+JOXBX7j6H5d2LLFvWgSWTKxOx5HCDgmWcmKtj4snIeVHhXb9KB9ZO
         7hDMB+wa1zJvNR5G5ltPyixnbtHD2u3s/vPp47rjQRB4rGP4UbrXiJMcrBzowjzfAJq8
         nOoyClkb1IdHQwVjFDz+L0FjMQlY67AOJYCUJPsuNbAKlN6uG9pqIpbyGBaI04a+LQn7
         2UoZj3INlQIEkU6VaFNQRYj2preiyunjooSHem6ni/Kqrzzk2ikTG2ZZ+SknS0tAr7UI
         7jQ3CZWp8UWiFG4au8kkd9zhPOKyyytzw+/4bv8XZaCvHHXx6Y0OXXSsE4djxo+eJPmT
         SXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906112; x=1771510912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iumDngoSc+xj3Wvk1Z780999EPLacHI65kOB8TxNGR0=;
        b=QBVu2M4gRMMwcw0Ku021z5golRB02LA2JG6HSzbFDFyXYrbNxxlyhl/2yvQ4qg5Buw
         tH+Ug0K4W6rfmjep5KxkqgTL8UC+kq4Ev4SbN5XZeBCOJ2ONVP1NBO+iB8khrheEzUjn
         Jr9+f76xiL0ndIvJkIT3h9nuhw4yrwNwuv5IkOMdlr7rWTsqVl3CqTjR3H4sxiQP5EkL
         gJgqk9Ei5+pDlfC45iDvxTzIwEedBnI8uyxMxDVhq2LKApS2hR4eRVjBlKyI/URZl1tH
         ZMUPzFY90qWY7/Lf31wgmoYq+lLG7D/8apQnoG0yVvVdPojVx2WD59V2wcmRaI1X4ZZT
         QjAA==
X-Forwarded-Encrypted: i=1; AJvYcCXiavzk5UPUQ/dvO9oqIjayd4x+DCaUY4d+Tg3w54NgGrNqpiLsvmCCMSV/NMknOqxQ91CtHLgnLUcHDguh@lists.linux.dev
X-Gm-Message-State: AOJu0YyD/Dp1HigQUTg4NlXqJbaiT21Fn4vQxGiDWBwWbFDr+oRBgv+H
	g6BSYJlf6o4WAqqItulyjhHzVl+2xzITZS255J+5fWMIK5QqQQYBBMvp
X-Gm-Gg: AZuq6aIuqnYHz2UwU8yYOdLY9ioCuxEYelHLNC4/p5m79zRNuGye3M3qXTUbg53ndN1
	6IW+JmdBCQoFwFSK8P2IvkiZusLa/MaXDyP6ZZfNvXcH46ce8nZh4eOsLczUvMVLBrPU4gg6mxb
	XU3AIjM2tiuVEGq4qvQ0rlNlrgfXMcuThIDv+/NIXXc9I2IB+5grvWEF5IqKsBr2Xzyxb2pmzuq
	Vt0Kvv7dHY6y/Y/JdywOvF5SFQtQ0DpoUI/oYciy8XaiJSZm4wmIWg/Clkl7gH10PIlA1shrqxV
	BCCp5hDVxmJlG1iATSSD205nj19Bx4CN9lzL41+64fBSYCnswXL0/Ul+LaK+OX5V91pnkwxHA6H
	DhTRv8WzUfFsXDL/VbPvxhA+xKNGUOGP7M0aEsRDebyFWEH5NkZqRStJdkM7ta9z4U4H+tYF9rN
	yEdA1/sYoTq2KgzJmJRg2U2rdZKgW1Um7Ti3QiiLEN
X-Received: by 2002:a05:6a00:4c0d:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-824b042b507mr2554564b3a.13.1770906111860;
        Thu, 12 Feb 2026 06:21:51 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:21:51 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 1/7] staging: rtl8723bs: rename LinkDetectInfo to link_detect_info
Date: Thu, 12 Feb 2026 19:51:25 +0530
Message-ID: <20260212142131.28131-2-khushalchitturi@gmail.com>
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

Rename LinkDetectInfo to link_detect_info in struct mlme_priv
to follow naming conventions.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v6 -> v7: Further split patches, limiting this patch to renaming
LinkDetectInfo only.
v5 -> v6: Limited the changes to LinkDetectInfo renaming, and local
variables of traffic_status_watchdog.
v4 -> v5: Rebased onto current staging-testing.
v3 -> v4: Narrow rename scope to affect link detection, and adjusted
formatting.
v2 -> v3: Resubmitted as a versioned series.
v1 -> v2: Corrected commit messages.

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 54 +++++++++----------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  6 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 ++--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  8 +--
 12 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b2e7f479f72b..bd1eed3d98fb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1143,51 +1143,51 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	if ((check_fwstate(pmlmepriv, _FW_LINKED))
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+		if (pmlmepriv->link_detect_info.bBusyTraffic)
 			BusyThreshold = BusyThresholdLow;
 
-		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
+		if (pmlmepriv->link_detect_info.NumRxOkInPeriod > BusyThreshold ||
+		    pmlmepriv->link_detect_info.NumTxOkInPeriod > BusyThreshold) {
 			bBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->link_detect_info.NumRxOkInPeriod > pmlmepriv->link_detect_info.NumTxOkInPeriod)
 				bRxBusyTraffic = true;
 			else
 				bTxBusyTraffic = true;
 		}
 
 		/*  Higher Tx/Rx data. */
-		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
-		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
+		if (pmlmepriv->link_detect_info.NumRxOkInPeriod > 4000 ||
+		    pmlmepriv->link_detect_info.NumTxOkInPeriod > 4000) {
 			bHigherBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->link_detect_info.NumRxOkInPeriod > pmlmepriv->link_detect_info.NumTxOkInPeriod)
 				bHigherBusyRxTraffic = true;
 			else
 				bHigherBusyTxTraffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
+		if (((pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod + pmlmepriv->link_detect_info.NumTxOkInPeriod) > 8) ||
+		    (pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
+				if (pmlmepriv->link_detect_info.TrafficTransitionCount <= 4)
+					pmlmepriv->link_detect_info.TrafficTransitionCount = 4;
 
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;
+				pmlmepriv->link_detect_info.TrafficTransitionCount++;
 
-				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
-					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
+				if (pmlmepriv->link_detect_info.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
+					pmlmepriv->link_detect_info.TrafficTransitionCount = 30;
 			}
 		} else {
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >= 2)
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount -= 2;
+			if (pmlmepriv->link_detect_info.TrafficTransitionCount >= 2)
+				pmlmepriv->link_detect_info.TrafficTransitionCount -= 2;
 			else
-				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
+				pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
 
-			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
+			if (pmlmepriv->link_detect_info.TrafficTransitionCount == 0)
 				bEnterPS = true;
 		}
 
@@ -1212,15 +1212,15 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
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
+	pmlmepriv->link_detect_info.NumRxOkInPeriod = 0;
+	pmlmepriv->link_detect_info.NumTxOkInPeriod = 0;
+	pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod = 0;
+	pmlmepriv->link_detect_info.bBusyTraffic = bBusyTraffic;
+	pmlmepriv->link_detect_info.bTxBusyTraffic = bTxBusyTraffic;
+	pmlmepriv->link_detect_info.bRxBusyTraffic = bRxBusyTraffic;
+	pmlmepriv->link_detect_info.bHigherBusyTraffic = bHigherBusyTraffic;
+	pmlmepriv->link_detect_info.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
+	pmlmepriv->link_detect_info.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 
 	return bEnterPS;
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..87fd4b11a7dd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -61,7 +61,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
 		/* we try to issue sitesurvey firstly */
 
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
+		if (pmlmepriv->link_detect_info.bBusyTraffic == false
 			|| rtw_to_roam(padapter) > 0
 		) {
 			/*  submit site_survey_cmd */
@@ -113,7 +113,7 @@ u8 rtw_do_join(struct adapter *padapter)
 
 				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
 				/* we try to issue sitesurvey firstly */
-				if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
+				if (pmlmepriv->link_detect_info.bBusyTraffic == false
 					|| rtw_to_roam(padapter) > 0
 				) {
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
@@ -380,7 +380,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 	}
 
 	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
-		(pmlmepriv->LinkDetectInfo.bBusyTraffic == true)) {
+		(pmlmepriv->link_detect_info.bBusyTraffic == true)) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 22dc36e8e38a..1217c409abea 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1174,8 +1174,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
+	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
 
 	if (pnetwork->join_res > 0) {
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
@@ -1615,7 +1615,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
 				goto exit;
 
-			if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+			if (pmlmepriv->link_detect_info.bBusyTraffic)
 				goto exit;
 		}
 
@@ -2504,8 +2504,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
-	/* if (bmcst || (padapter->mlmepriv.LinkDetectInfo.bTxBusyTraffic == false)) */
-	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100))
+	/* if (bmcst || (padapter->mlmepriv.link_detect_info.bTxBusyTraffic == false)) */
+	if (bmcst || (padapter->mlmepriv.link_detect_info.NumTxOkInPeriod < 100))
 		return;
 
 	priority = pattrib->priority;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 78abc5f5191f..74aa089a97bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1511,7 +1511,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if (ignore_received_deauth == 0)
 		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.bBusyTraffic = false;
 	return _SUCCESS;
 }
 
@@ -1563,7 +1563,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.bBusyTraffic = false;
 	return _SUCCESS;
 
 }
@@ -4756,9 +4756,9 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 
 	timer_delete_sync(&pmlmeext->link_timer);
 
-	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
+	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
+	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732687..3122435fa91d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -206,7 +206,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 		}
 
 	} else { /*  from rx path */
-		if (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 4/*2*/) {
+		if (pmlmepriv->link_detect_info.NumRxUnicastOkInPeriod > 4/*2*/) {
 			if (adapter_to_pwrctl(padapter)->bLeisurePs
 			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
 			    && !(hal_btcoex_IsBtControlLps(padapter)))
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f..cb20f2bee0a0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -680,10 +680,10 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 	sz = get_recvframe_len(prframe);
 	precvpriv->rx_bytes += sz;
 
-	padapter->mlmepriv.LinkDetectInfo.NumRxOkInPeriod++;
+	padapter->mlmepriv.link_detect_info.NumRxOkInPeriod++;
 
 	if ((!is_broadcast_ether_addr(pattrib->dst)) && (!is_multicast_ether_addr(pattrib->dst)))
-		padapter->mlmepriv.LinkDetectInfo.NumRxUnicastOkInPeriod++;
+		padapter->mlmepriv.link_detect_info.NumRxUnicastOkInPeriod++;
 
 	if (sta)
 		psta = sta;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 222851e8d985..976f6f6ed029 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1414,7 +1414,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
-		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
+		pmlmepriv->link_detect_info.NumTxOkInPeriod += pkt_num;
 
 		pxmitpriv->tx_pkts += pkt_num;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..973d2e6a9d6a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -167,7 +167,7 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 			return true;
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
+		if (pmlmepriv->link_detect_info.bBusyTraffic)
 			return true;
 	}
 
@@ -364,7 +364,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 	case BTC_GET_U4_WIFI_TRAFFIC_DIRECTION:
 		{
 			struct rt_link_detect_t *plinkinfo;
-			plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
+			plinkinfo = &padapter->mlmepriv.link_detect_info;
 
 			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
 				*pU4Tmp = BTC_WIFI_TRAFFIC_TX;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a1f2cbf2cf55..a8d3a3b16c95 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -202,7 +202,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 		if (
 			(check_pending_xmitbuf(pxmitpriv)) &&
-			(padapter->mlmepriv.LinkDetectInfo.bHigherBusyTxTraffic)
+			(padapter->mlmepriv.link_detect_info.bHigherBusyTxTraffic)
 		) {
 			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
 				err = -2;
@@ -482,7 +482,7 @@ s32 rtl8723bs_hal_xmit(
 		(pxmitframe->attrib.ether_type != 0x888e) &&
 		(pxmitframe->attrib.dhcp_pkt != 1)
 	) {
-		if (padapter->mlmepriv.LinkDetectInfo.bBusyTraffic)
+		if (padapter->mlmepriv.link_detect_info.bBusyTraffic)
 			rtw_issue_addbareq_cmd(padapter, pxmitframe);
 	}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 2a128568c6df..1659c4b43957 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -171,7 +171,7 @@ struct mlme_priv {
 
 	struct ht_priv htpriv;
 
-	struct rt_link_detect_t	LinkDetectInfo;
+	struct rt_link_detect_t	link_detect_info;
 	struct timer_list	dynamic_chk_timer; /* dynamic/periodic check timer */
 
 	u8 acm_mask; /*  for wmm acm mask */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a47d0d3fa2b7..88ba148bbc78 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1231,7 +1231,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 		goto check_need_indicate_scan_done;
 	}
 
-	if (pmlmepriv->LinkDetectInfo.bBusyTraffic == true) {
+	if (pmlmepriv->link_detect_info.bBusyTraffic == true) {
 		static unsigned long lastscantime;
 		unsigned long passtime;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 21a0c3cf4c31..572ee4124b52 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -618,11 +618,11 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	padapter->xmitpriv.tx_pkts = 0;
 	padapter->recvpriv.rx_pkts = 0;
 
-	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
+	pmlmepriv->link_detect_info.bBusyTraffic = false;
 
-	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
-	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
-	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
+	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
+	pmlmepriv->link_detect_info.TrafficTransitionCount = 0;
+	pmlmepriv->link_detect_info.LowPowerTransitionCount = 0;
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
 
-- 
2.52.0

