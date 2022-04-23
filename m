Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52E7C
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 13:02:14 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id t13so9526781pgn.8
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vM5RVFO6hnZxHJlh729g+B7vJJ65wYvCqP8gO/Xp2ro=;
        b=lgd9AJ3xV83rtBnLBU8P2J9R36SCBOyCEbLQ2iuuJcKcMYPcMWeG9oEhUpBiDld0QJ
         LD9vFOnSdr4UWN1ePf6i0irQilLHHJMkr0AENGUZREk5/bQcoAbYZUPRe6Hdcbt3uAcc
         gBRiH7tPPurHgunU8I5j1SKxPTPh0hu9rhhqAygLH6l/WeLloKQir3eAmYq1z8l3Dj4E
         QBR3390YsMPjuvu2zaXZ1hFwY1+6ss2zE1CXEMuD2386I9YhjZdzzO4bCyFxBM0yu8qu
         TiWkf9Hzqae26ugfIKq4V2qHHSrJxmNHBjb2wjlckqJI9YsCqBBlLJBDY0ixvAllIYle
         ddDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vM5RVFO6hnZxHJlh729g+B7vJJ65wYvCqP8gO/Xp2ro=;
        b=0n63zU3tFagQ77Mopq7j9cb8/SksMNwe7bZOur4iv2nU51DpdG4ob9R96I4YcDeWoG
         GzQcmqJzfGeCC27TQHz/Vl4+OVIO4ZLHUsik0Ymx37gkpeGIPYxQbYqMX8zQ5T72JQc3
         4d0TbdR37J11nu0u7iKQftON26q1rV+6Paam+wcCui3x0UdX1ck99yAnwmp3o9DsWS+0
         uP3p44obpawrLJIxxWtOBN1Qx0+Crn5pqN++qaDquhUTWQ2ahcn4gR+gltSFkXeiueI+
         BCdH8HP5uhiaAXJoRapQqoVjpbcGFAF5Ml1ksrPZ0CyHHL2vk0FksbsdSleN7ie5+Gls
         JGug==
X-Gm-Message-State: AOAM533MI9u0wfpzXJ9j0LI1MOQU2TnDF7eTP19kV9JmLaEEIZPDYQI+
	AScq3LygvKX5KkRUjxdrBGg=
X-Google-Smtp-Source: ABdhPJxrZpTSfajfKptQieeEDLFf4C5YXMwUJmLcw1HcMC8Y6cJLiI9R2mqPpyptpKj1iuvCYwoLhw==
X-Received: by 2002:a05:6a00:4399:b0:50a:db62:e4fa with SMTP id bt25-20020a056a00439900b0050adb62e4famr10000551pfb.31.1650718933675;
        Sat, 23 Apr 2022 06:02:13 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id c139-20020a624e91000000b005060cdff4ffsm5808994pfb.129.2022.04.23.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:02:13 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 2/7] staging: rtl8192e: Remove unnecessary u8 argument cast
Date: Sat, 23 Apr 2022 21:01:45 +0800
Message-Id: <20220423130150.161903-3-wjsota@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220423130150.161903-1-wjsota@gmail.com>
References: <20220423130150.161903-1-wjsota@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary explicit u8 casts for u8 arguments in function
calls. These functions have declared their parameters to be of type u8,
so the arguments given to those parameters will be automatically coerced
to u8. Therefore, an explicit cast is unnecessary.

Signed-off-by: Solomon Tan <wjsota@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c      | 9 ++++-----
 drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c          | 2 +-
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 4b31fecde4e6..4fe806eae5b7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1175,7 +1175,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	pTxFwInfo = (struct tx_fwinfo_8190pci *)skb->data;
 	memset(pTxFwInfo, 0, sizeof(struct tx_fwinfo_8190pci));
 	pTxFwInfo->TxHT = (cb_desc->data_rate & 0x80) ? 1 : 0;
-	pTxFwInfo->TxRate = _rtl92e_rate_mgn_to_hw((u8)cb_desc->data_rate);
+	pTxFwInfo->TxRate = _rtl92e_rate_mgn_to_hw(cb_desc->data_rate);
 	pTxFwInfo->EnableCPUDur = cb_desc->bTxEnableFwCalcDur;
 	pTxFwInfo->Short = _rtl92e_query_is_short(pTxFwInfo->TxHT,
 						  pTxFwInfo->TxRate, cb_desc);
@@ -1194,7 +1194,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	pTxFwInfo->CtsEnable = (cb_desc->bCTSEnable) ? 1 : 0;
 	pTxFwInfo->RtsSTBC = (cb_desc->bRTSSTBC) ? 1 : 0;
 	pTxFwInfo->RtsHT = (cb_desc->rts_rate&0x80) ? 1 : 0;
-	pTxFwInfo->RtsRate = _rtl92e_rate_mgn_to_hw((u8)cb_desc->rts_rate);
+	pTxFwInfo->RtsRate = _rtl92e_rate_mgn_to_hw(cb_desc->rts_rate);
 	pTxFwInfo->RtsBandwidth = 0;
 	pTxFwInfo->RtsSubcarrier = cb_desc->RTSSC;
 	pTxFwInfo->RtsShort = (pTxFwInfo->RtsHT == 0) ?
@@ -1707,8 +1707,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		slide_rssi_index = 0;
 
 	tmp_val = priv->stats.slide_rssi_total/slide_rssi_statistics;
-	priv->stats.signal_strength = rtl92e_translate_to_dbm(priv,
-							      (u8)tmp_val);
+	priv->stats.signal_strength = rtl92e_translate_to_dbm(priv, tmp_val);
 	curr_st->rssi = priv->stats.signal_strength;
 	if (!prev_st->bPacketMatchBSSID) {
 		if (!prev_st->bToSelfBA)
@@ -2034,7 +2033,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	pDrvInfo = (struct rx_fwinfo *)(skb->data + stats->RxBufShift);
 
 	stats->rate = _rtl92e_rate_hw_to_mgn((bool)pDrvInfo->RxHT,
-					     (u8)pDrvInfo->RxRate);
+					     pDrvInfo->RxRate);
 	stats->bShortPreamble = pDrvInfo->SPLCP;
 
 	_rtl92e_update_received_rate_histogram_stats(dev, stats);
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
index 9b025b9fa7ab..38110fa4f36d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
@@ -34,8 +34,7 @@ static bool _rtl92e_fw_boot_cpu(struct net_device *dev)
 	netdev_dbg(dev, "Download Firmware: Put code ok!\n");
 
 	CPU_status = rtl92e_readl(dev, CPU_GEN);
-	rtl92e_writeb(dev, CPU_GEN,
-		      (u8)((CPU_status|CPU_GEN_PWR_STB_CPU)&0xff));
+	rtl92e_writeb(dev, CPU_GEN, (CPU_status | CPU_GEN_PWR_STB_CPU) & 0xff);
 	mdelay(1);
 
 	if (!_rtl92e_wait_for_fw(dev, CPU_GEN_BOOT_RDY, 200)) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index c7071e0997bc..1b70c12be365 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -933,7 +933,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				break;
 			case CmdID_WritePortUchar:
 				rtl92e_writeb(dev, CurrentCmd->Para1,
-					      (u8)CurrentCmd->Para2);
+					      CurrentCmd->Para2);
 				break;
 			case CmdID_RF_WriteReg:
 				for (eRFPath = 0; eRFPath <
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index c85b23415772..d58800d06e8f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -2513,5 +2513,5 @@ static void _rtl92e_dm_send_rssi_to_fw(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	rtl92e_writeb(dev, DRIVER_RSSI, (u8)priv->undecorated_smoothed_pwdb);
+	rtl92e_writeb(dev, DRIVER_RSSI, priv->undecorated_smoothed_pwdb);
 }
-- 
2.36.0

