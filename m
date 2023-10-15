Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29D63B1;
	Sun, 15 Oct 2023 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6jcDDAG"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7cc03dee5so44266467b3.3;
        Sun, 15 Oct 2023 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697369286; x=1697974086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkYHvKPu1Q1D8EcB6jx1CuleaITKIFHxMsgaSudzDAw=;
        b=R6jcDDAGow7ZY6wTTCTwiptKXJXeAQI2qL/et/IqC6MxXE93QYolxxzsfSqdRgZ2RI
         Aqq9BzX5MWJqFPnjvsmjJkQ2VOoFQPDyvRVFOU3MrgkQ2kBokeBkOGr+9uC108oCeoi3
         pglXzXSNNE/NDMpf0JRb8Jk2KyywzBpxhr4B3rAR+3zuZf/es3EfgU4MR7ZR8sxTetv6
         ff1povQ3TxwFbLUAMIIMTosz2vtItp/1jt1SrbI9tWiZWaqxlprwZl4G/G3fkIEzgRk+
         q5nuI4oLRn6SL4rVwQMrawrY/oG/tMSsjwuTyhjihQ3BDowRnrpvQ79iw8zwlmtFtIL5
         aUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697369286; x=1697974086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkYHvKPu1Q1D8EcB6jx1CuleaITKIFHxMsgaSudzDAw=;
        b=vER6zFklxAW+1WwNk3aIX9/hMD28xWB1XHERv1C5CRPzqmFICdlOqzqgHLCISBaAWY
         QlLQN4RCR9M9yjFuFwYGHVyewQ52hr1BlFSt7GEHfTQPtquOH2vrmGkOxV9mBqkZ0nY7
         E2BUTg0OcnyVbEm9rNrbBi+T908wNUWSbkho/lWvjgSvWFThbMA0bqmwFE8qb3QLpOwX
         9IM4O/cFE4SNPTblLrm+gwZMVdic60kzILxXKqu6AkhkA5S3s4J0ez8fn86pq4CZKTSg
         SzNpP1p9N3FBM1OvLS8dNVAwybNL3pwJMMiUHV38onhaUOrRo8ukXPfQNs7S80lHi+LE
         T8/w==
X-Gm-Message-State: AOJu0YyTMdYr3fJYmzPke/tkER5+L2VZ6544LwTKGKIr/puClP+KZbje
	LQK3/b3t2ZosAVs7XuX8OVPmjEMlPwHQw2/w
X-Google-Smtp-Source: AGHT+IGMyscEAmCK3SHfzMZF3dgTFI1Tf9THLBogQG+bhFJqNd+8LFVonQLsHcyfMqUU2ZLqxIwu6A==
X-Received: by 2002:a0d:d981:0:b0:5a7:b557:6595 with SMTP id b123-20020a0dd981000000b005a7b5576595mr16365859ywe.21.1697369285950;
        Sun, 15 Oct 2023 04:28:05 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id w82-20020a817b55000000b005a2521fb26csm1318732ywc.99.2023.10.15.04.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:28:05 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 4/6] staging: rtl8192u: Align descendant arguments
Date: Sun, 15 Oct 2023 12:24:50 +0100
Message-Id: <dd85488b60990013dbda687c00c8c419adc2db83.1697367161.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index cbae852478ea..84c2ad89f02c 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -331,7 +331,7 @@ static void dm_check_rate_adaptive(struct net_device *dev)
 		if (pra->ping_rssi_enable) {
 			if (priv->undecorated_smoothed_pwdb < (long)(pra->ping_rssi_thresh_for_ra+5)) {
 				if ((priv->undecorated_smoothed_pwdb < (long)pra->ping_rssi_thresh_for_ra) ||
-					ping_rssi_state) {
+				    ping_rssi_state) {
 					pra->ratr_state = DM_RATR_STA_LOW;
 					targetRATR = pra->ping_rssi_ratr;
 					ping_rssi_state = 1;
@@ -612,7 +612,7 @@ static void dm_TXPowerTrackingCallback_ThermalMeter(struct net_device *dev)
 			if (tmpRegA == OFDMSwingTable[i]) {
 				priv->OFDM_index = (u8)i;
 				RT_TRACE(COMP_POWER_TRACKING, "Initial reg0x%x = 0x%x, OFDM_index=0x%x\n",
-					rOFDM0_XATxIQImbalance, tmpRegA, priv->OFDM_index);
+					 rOFDM0_XATxIQImbalance, tmpRegA, priv->OFDM_index);
 			}
 		}
 
@@ -622,7 +622,7 @@ static void dm_TXPowerTrackingCallback_ThermalMeter(struct net_device *dev)
 			if (TempCCk == (u32)CCKSwingTable_Ch1_Ch13[i][0]) {
 				priv->CCK_index = (u8) i;
 				RT_TRACE(COMP_POWER_TRACKING, "Initial reg0x%x = 0x%x, CCK_index=0x%x\n",
-					rCCK0_TxFilter1, TempCCk, priv->CCK_index);
+					 rCCK0_TxFilter1, TempCCk, priv->CCK_index);
 				break;
 			}
 		}
@@ -695,7 +695,7 @@ static void dm_TXPowerTrackingCallback_ThermalMeter(struct net_device *dev)
 		priv->OFDM_index = tmpOFDMindex;
 		rtl8192_setBBreg(dev, rOFDM0_XATxIQImbalance, bMaskDWord, OFDMSwingTable[priv->OFDM_index]);
 		RT_TRACE(COMP_POWER_TRACKING, "Update OFDMSwing[%d] = 0x%x\n",
-			priv->OFDM_index, OFDMSwingTable[priv->OFDM_index]);
+			 priv->OFDM_index, OFDMSwingTable[priv->OFDM_index]);
 	}
 	priv->txpower_count = 0;
 }
@@ -1352,7 +1352,7 @@ static void dm_CCKTxPowerAdjust_ThermalMeter(struct net_device *dev, bool  bInCH
 					(CCKSwingTable_Ch1_Ch13[priv->CCK_index][1]<<8);
 		rtl8192_setBBreg(dev, rCCK0_TxFilter1, bMaskHWord, TempVal);
 		RT_TRACE(COMP_POWER_TRACKING, "CCK not chnl 14, reg 0x%x = 0x%x\n",
-			rCCK0_TxFilter1, TempVal);
+			 rCCK0_TxFilter1, TempVal);
 		/* Write 0xa24 ~ 0xa27 */
 		TempVal =	CCKSwingTable_Ch1_Ch13[priv->CCK_index][2] +
 					(CCKSwingTable_Ch1_Ch13[priv->CCK_index][3]<<8) +
@@ -1360,14 +1360,14 @@ static void dm_CCKTxPowerAdjust_ThermalMeter(struct net_device *dev, bool  bInCH
 					(CCKSwingTable_Ch1_Ch13[priv->CCK_index][5]<<24);
 		rtl8192_setBBreg(dev, rCCK0_TxFilter2, bMaskDWord, TempVal);
 		RT_TRACE(COMP_POWER_TRACKING, "CCK not chnl 14, reg 0x%x = 0x%x\n",
-			rCCK0_TxFilter2, TempVal);
+			 rCCK0_TxFilter2, TempVal);
 		/* Write 0xa28  0xa29 */
 		TempVal =	CCKSwingTable_Ch1_Ch13[priv->CCK_index][6] +
 					(CCKSwingTable_Ch1_Ch13[priv->CCK_index][7]<<8);
 
 		rtl8192_setBBreg(dev, rCCK0_DebugPort, bMaskLWord, TempVal);
 		RT_TRACE(COMP_POWER_TRACKING, "CCK not chnl 14, reg 0x%x = 0x%x\n",
-			rCCK0_DebugPort, TempVal);
+			 rCCK0_DebugPort, TempVal);
 	} else {
 		/* Write 0xa22 0xa23 */
 		TempVal =	CCKSwingTable_Ch14[priv->CCK_index][0] +
@@ -1764,7 +1764,7 @@ static void dm_ctrl_initgain_byrssi_highpwr(
 
 	/*  For smooth, we can not change high power DIG state in the range. */
 	if ((priv->undecorated_smoothed_pwdb > dm_digtable.rssi_high_power_lowthresh) &&
-		(priv->undecorated_smoothed_pwdb < dm_digtable.rssi_high_power_highthresh))
+	    (priv->undecorated_smoothed_pwdb < dm_digtable.rssi_high_power_highthresh))
 		return;
 
 	/* 3. When RSSI >75% or <70%, it is a high power issue. We have to judge if
@@ -1790,7 +1790,7 @@ static void dm_ctrl_initgain_byrssi_highpwr(
 		dm_digtable.dig_highpwr_state = DM_STA_DIG_OFF;
 
 		if (priv->undecorated_smoothed_pwdb < dm_digtable.rssi_high_power_lowthresh &&
-			 priv->undecorated_smoothed_pwdb >= dm_digtable.rssi_high_thresh) {
+		    priv->undecorated_smoothed_pwdb >= dm_digtable.rssi_high_thresh) {
 			/*  3.2 Recover PD_TH for OFDM for normal power region. */
 			if (priv->CurrentChannelBW != HT_CHANNEL_WIDTH_20) {
 				write_nic_byte(dev, (rOFDM0_XATxAFE+3), 0x20);
@@ -1881,7 +1881,7 @@ static void dm_pd_th(
 			else if (dm_digtable.rssi_val <= dm_digtable.rssi_low_thresh)
 				dm_digtable.curpd_thstate = DIG_PD_AT_LOW_POWER;
 			else if ((dm_digtable.rssi_val >= dm_digtable.rssi_high_thresh) &&
-					(dm_digtable.rssi_val < dm_digtable.rssi_high_power_lowthresh))
+				 (dm_digtable.rssi_val < dm_digtable.rssi_high_power_lowthresh))
 				dm_digtable.curpd_thstate = DIG_PD_AT_NORMAL_POWER;
 			else
 				dm_digtable.curpd_thstate = dm_digtable.prepd_thstate;
@@ -2620,7 +2620,7 @@ void dm_check_fsync(struct net_device *dev)
 	RT_TRACE(COMP_HALDM, "RateBitmap 0x%x FirstDiffRateThreshold %d SecondDiffRateThreshold %d\n", priv->ieee80211->fsync_rate_bitmap, priv->ieee80211->fsync_firstdiff_ratethreshold, priv->ieee80211->fsync_seconddiff_ratethreshold);
 
 	if (priv->ieee80211->state == IEEE80211_LINKED &&
-		(priv->ieee80211->pHTInfo->IOTAction & HT_IOT_ACT_CDD_FSYNC)) {
+	    (priv->ieee80211->pHTInfo->IOTAction & HT_IOT_ACT_CDD_FSYNC)) {
 		if (priv->ieee80211->bfsync_enable == 0) {
 			switch (priv->ieee80211->fsync_state) {
 			case Default_Fsync:
@@ -2779,7 +2779,7 @@ static void dm_dynamic_txpower(struct net_device *dev)
 	}
 
 	if ((priv->bDynamicTxHighPower != priv->bLastDTPFlag_High) ||
-		(priv->bDynamicTxLowPower != priv->bLastDTPFlag_Low)) {
+	    (priv->bDynamicTxLowPower != priv->bLastDTPFlag_Low)) {
 		RT_TRACE(COMP_TXAGC, "SetTxPowerLevel8190()  channel = %d\n", priv->ieee80211->current_network.channel);
 
 #if  defined(RTL8190P) || defined(RTL8192E)
-- 
2.34.1

