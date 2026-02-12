Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868982066F7
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906137; cv=none; b=EsNn9m74k9rrk7ac/IJnyAFvzO7rE8H7MIWm6avnGmWoRiYtPzbqxc89e8FOZiMJxINiAYAlrCoa+qZyglz/mwo+sHPs3qaO4dhO2UAETwzMHYO5CIccoDkCBIUVlPRB8uPJSD50RbnlIT4z2enDCxwVIK3L6FC37SZ6DpCdGvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906137; c=relaxed/simple;
	bh=AVrSo12PevDCrsavSe2nODFjD/4AS0Ec0KkafXQfGv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxAib4jBxnln5i391+9D0/UgLOynXL51wzPzfNgKcyIbY9pWDl+1CMkxtJvUzGXYEv8+NMf2p/RDYA1ttqHvysqIcggQxhJp+G3WazNGsDagkpDa5d03yxZ5PIi+pS7LmA0hjk1vtIqtDYX7jjZjwsi0244pVcdrkHixmZMBfHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ/K7+Di; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ/K7+Di"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso3417297b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906135; x=1771510935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Dubv4xqureU0pvqUc34rSLT1aSAbaj46M3E5NdU8L4=;
        b=kZ/K7+Di60P7+cQ/plh+hQhvh9Ja0DRnW/T0ZSONxNFBl+aY3FK96BgpLxqfTTO84J
         tTivDMgj5E7UvC3/k2D/7/xZtagDDUWkIXBSPjz82nKa07rqIJpufYZZ1cSLZc7DP/dq
         itXf+Fx8xhr9cESrYSSjwEtAHzjsXP9iF14/TrmH1sw9H39ojcVEShuKc72m7lqCV4J3
         615kuLBEVqUIKEmdJ973WOkmQVKyZrbXgzlFsomvEeCXZU8H3gxDaMgVvZ3okUw+WMt1
         kg2URGU4Y0JdRibtI8gmBAa4GIxvQTS+lefa30WbFiVmPmJ7YjOS4/SXktrmHOgjhoRs
         Y8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906135; x=1771510935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Dubv4xqureU0pvqUc34rSLT1aSAbaj46M3E5NdU8L4=;
        b=MyhIfy22M/yrZFwdqGkcLDoFssHs2MSkq8sx0OF+1GzHlrb6Btpx+Yxr0IGd8w/R/F
         fKhOZpUd9zvRkR/2sL3BgM5QN9EJnqvC9zGIAZ6AoFLJQDIuSJ6DccZyD90mAYWpeFI9
         0T+AIWlzhxiWpHuj63P88G9q5UYSGqc4harjecZY+naxTQnFeCuCQ01cRSuD0/cqjAFG
         9hxGvopEESmKQx614QgyBfmYXX/Sq2ZZBkXA1L0OfwY6s3aDU32NLzhqKz/4RPB8Kt61
         GJg6XKreqrzTaxtK8KhUZ8i4xjwMgjPxRQ+JNsdiVcqFefO9SSG+5npU9wxA1HIQVcjO
         5Zcw==
X-Forwarded-Encrypted: i=1; AJvYcCXmnGOgXCVIKMJVhd/4fU1/kFTo1jsYtORZLHxIXCbw1UeOV6m8C4fkOXTPLvmeSXpiDkA234m4ZQKDN0vH@lists.linux.dev
X-Gm-Message-State: AOJu0YzwTSIEgrN/kz3lU0mWnWkZIItuadoww9yfOBkyPKZzVFgpgBR1
	Jfd0uXq7ddo6h+ByD85d374XgqodiNfZs1a/YhlkTkmN8nm9HIPHM9+F
X-Gm-Gg: AZuq6aL5mA46uQQpIPA3B38H+jFNCrNbwkXZdtSz1rGIhQgXkHWaxWWpKbzUkXRqeWO
	iYU32ekHPcj+SZTdJ6cpJgy+sFV1TQ7/GyeAZ/4LQatsvy5ASRBLFRQ3HqmyzlwsWdb8IlBYMLI
	F+xNVEgIEr3WFYeFoSDq/7Vp8mZNWzZea80YkP1x1XLTBuwOk++kr+CTA+9IzKPTQG9cNsl2Vu8
	798Te5MKBiWN/0QG5ZKigu2xX1RSuYhEZeuUVHWykw/9ooxbjvvM6QmspleyOAelfzR4HfhCW3T
	+y09bwLyz3/b9BSzcuxRJZbdCIxGCG0+MFq6xzbOQyjqmzc2CuEo5DMSPfSBa76+wj5K0zKSCIb
	GI+/DK3gzNHuhJKNdVXIVckdPsK0by9hRzgz77GjYEECRX8u/+N7pDRPxBzL9VocNf7MRxsr+cZ
	/IwekFBHx0UZKp6o4Moep89pcyTTeHig==
X-Received: by 2002:a05:6a00:1398:b0:81f:3f8a:4c37 with SMTP id d2e1a72fcca58-824b04dec34mr2880909b3a.38.1770906134686;
        Thu, 12 Feb 2026 06:22:14 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:22:14 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 3/7] staging: rtl8723bs: convert traffic_status_watchdog() local variables to snake_case
Date: Thu, 12 Feb 2026 19:51:27 +0530
Message-ID: <20260212142131.28131-4-khushalchitturi@gmail.com>
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

Convert the local variable names in traffic_status_watchdog()
to snake_case to follow naming conventions.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v6 -> v7: Split from earlier patch.

 drivers/staging/rtl8723bs/core/rtw_cmd.c  | 56 +++++++++++------------
 drivers/staging/rtl8723bs/core/rtw_mlme.c |  6 +--
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b3fa54f7f7a9..d6b486fb57ab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1127,12 +1127,12 @@ static void collect_traffic_statistics(struct adapter *padapter)
 
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
+	u8 busy_traffic = false, tx_busy_traffic = false, rx_busy_traffic = false;
+	u8 higher_busy_traffic = false, higher_busy_rx_traffic = false, higher_busy_tx_traffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
@@ -1142,37 +1142,37 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	/*  */
 	if ((check_fwstate(pmlmepriv, _FW_LINKED))
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
-		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
+		/*  if we raise busy_traffic in last watchdog, using lower threshold. */
 		if (pmlmepriv->link_detect_info.busy_traffic)
-			BusyThreshold = BusyThresholdLow;
+			busy_threshold = busy_threshold_low;
 
-		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > BusyThreshold ||
-		    pmlmepriv->link_detect_info.num_tx_ok_in_period > BusyThreshold) {
-			bBusyTraffic = true;
+		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > busy_threshold ||
+		    pmlmepriv->link_detect_info.num_tx_ok_in_period > busy_threshold) {
+			busy_traffic = true;
 
 			if (pmlmepriv->link_detect_info.num_rx_ok_in_period > pmlmepriv->link_detect_info.num_tx_ok_in_period)
-				bRxBusyTraffic = true;
+				rx_busy_traffic = true;
 			else
-				bTxBusyTraffic = true;
+				tx_busy_traffic = true;
 		}
 
 		/*  Higher Tx/Rx data. */
 		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > 4000 ||
 		    pmlmepriv->link_detect_info.num_tx_ok_in_period > 4000) {
-			bHigherBusyTraffic = true;
+			higher_busy_traffic = true;
 
 			if (pmlmepriv->link_detect_info.num_rx_ok_in_period > pmlmepriv->link_detect_info.num_tx_ok_in_period)
-				bHigherBusyRxTraffic = true;
+				higher_busy_rx_traffic = true;
 			else
-				bHigherBusyTxTraffic = true;
+				higher_busy_tx_traffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
 		if (((pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period + pmlmepriv->link_detect_info.num_tx_ok_in_period) > 8) ||
 		    (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 2)) {
-			bEnterPS = false;
+			should_enter_ps = false;
 
-			if (bBusyTraffic) {
+			if (busy_traffic) {
 				if (pmlmepriv->link_detect_info.traffic_transition_count <= 4)
 					pmlmepriv->link_detect_info.traffic_transition_count = 4;
 
@@ -1188,11 +1188,11 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 				pmlmepriv->link_detect_info.traffic_transition_count = 0;
 
 			if (pmlmepriv->link_detect_info.traffic_transition_count == 0)
-				bEnterPS = true;
+				should_enter_ps = true;
 		}
 
 		/*  LeisurePS only work in infra mode. */
-		if (bEnterPS) {
+		if (should_enter_ps) {
 			if (!from_timer)
 				LPS_Enter(padapter, "TRAFFIC_IDLE");
 		} else {
@@ -1215,14 +1215,14 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	pmlmepriv->link_detect_info.num_rx_ok_in_period = 0;
 	pmlmepriv->link_detect_info.num_tx_ok_in_period = 0;
 	pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period = 0;
-	pmlmepriv->link_detect_info.busy_traffic = bBusyTraffic;
-	pmlmepriv->link_detect_info.tx_busy_traffic = bTxBusyTraffic;
-	pmlmepriv->link_detect_info.rx_busy_traffic = bRxBusyTraffic;
-	pmlmepriv->link_detect_info.higher_busy_traffic = bHigherBusyTraffic;
-	pmlmepriv->link_detect_info.higher_busy_rx_traffic = bHigherBusyRxTraffic;
-	pmlmepriv->link_detect_info.higher_busy_tx_traffic = bHigherBusyTxTraffic;
-
-	return bEnterPS;
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
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 944f56b7acf5..45943f832e23 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1643,12 +1643,12 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
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
-- 
2.52.0

