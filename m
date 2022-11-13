Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A7ED1
	for <linux-staging@lists.linux.dev>; Sun, 13 Nov 2022 04:35:46 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso5530289wms.4
        for <linux-staging@lists.linux.dev>; Sat, 12 Nov 2022 20:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdNPeBuZne6ZjAt+1em7v+tbiZS7ElWikTlojXTRK9s=;
        b=lLbSa5IG7gJUk9wcyTNCOHZy18TZHwpmV6jdDz3QM0qco+gFsxnDlPKsa2bh9oe8ft
         IcYdyXsdtgNeioRuUPQjcsIQTi5jiR8ohmjftLKfI046jKXt9a1lHfpVftQAKPEJGmlq
         IK884br2bvWb0Rnbzk+nMjvUlBdzBmZ25UtYxXEpSDYYBoJC9KKJ+iJd3KOEoSSBRx/8
         EWtOau9DdfMx/NbibpLpCSNJh9szmFRkKX4TzJOy1Wb5nFWYy7Bprj37P8wPtjqJPtOV
         QssmVT1Dgsn0h2B/jAXSnb5Xi0gy0vLk+k2KdDNYcNdB3H5E+iwFgaNn16PhafrZc1ja
         JDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdNPeBuZne6ZjAt+1em7v+tbiZS7ElWikTlojXTRK9s=;
        b=YiqQAgvfLL+fIUYq74HC4fy3E6vCUo4H3nrig9Gfj8pdM8LXDNiihr4tWYAJP9GXT7
         +bP57Z4VyQMTpKf+olOwQiyKK3YH2dKgArDC+6Hlf+VwrnXPEzgW5o8IAEhjwZcAZYXR
         MnrgQ2+sUkefvWXPPVUx1XlYJ9OxlLNoNdVtO54Am01bvoJCgZHHYWDAG+s/sZGzY0L5
         j8jH8t+YXeXfq798kmSvY8gELhvpnL2S9Pvhtqn+9dG3GxZopaF/h1s8WMfppa3apzT+
         wypeO7d0drSfup3PnAF2pQLw5z75a/4oIIeW9E1ydNxv5diW2cghkbQW/I0wGixqzzAR
         7TxA==
X-Gm-Message-State: ANoB5pnJODmyJD6bLIjalp6YWUjAOl1fjl7qV2YHC2Ho6EfRJ1UX82ZV
	PTh8b2MyCNwYxk8KChW3wVo=
X-Google-Smtp-Source: AA0mqf6GgwuJyv2Gj3Vagw1EMhbwUk5AbeRtmvx+pSiIFQB1cQRvkiZW6n1ExE0/+tHpz/WWceu9/A==
X-Received: by 2002:a1c:f714:0:b0:3cf:6a66:e324 with SMTP id v20-20020a1cf714000000b003cf6a66e324mr4900638wmh.158.1668314145111;
        Sat, 12 Nov 2022 20:35:45 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id t7-20020adff047000000b0022e57e66824sm6948774wro.99.2022.11.12.20.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 20:35:44 -0800 (PST)
Date: Sun, 13 Nov 2022 05:35:43 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Rename RFInProgres.., bEnableHT and
 RegChannelPlan
Message-ID: <aa3b8fd4a51fc9b1c32566cd079590bf11a9190d.1668313325.git.philipp.g.hortmann@gmail.com>
References: <cover.1668313325.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1668313325.git.philipp.g.hortmann@gmail.com>

Rename variable RFInProgressTimeOut to rf_in_progress_timeout, bEnableHT
to enable_ht and RegChannelPlan to reg_chnl_plan to avoid CamelCase which
is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 12 ++++++------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  2 +-
 drivers/staging/rtl8192e/rtl819x_HT.h          |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
 drivers/staging/rtl8192e/rtllib_softmac.c      | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           |  8 ++++----
 8 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index bbaf20fbfde0..d0ce89837073 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -474,10 +474,10 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 	priv->rf_chip = RF_8256;
 
-	if (priv->RegChannelPlan == 0xf)
+	if (priv->reg_chnl_plan == 0xf)
 		priv->ChannelPlan = priv->eeprom_ChannelPlan;
 	else
-		priv->ChannelPlan = priv->RegChannelPlan;
+		priv->ChannelPlan = priv->reg_chnl_plan;
 
 	if (priv->eeprom_vid == 0x1186 &&  priv->eeprom_did == 0x3304)
 		priv->CustomerID =  RT_CID_DLINK;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 144bc7c9abd5..1bf5e760d87a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -672,9 +672,9 @@ void rtl92e_set_wireless_mode(struct net_device *dev, u8 wireless_mode)
 
 	if ((wireless_mode == WIRELESS_MODE_N_24G) ||
 	    (wireless_mode == WIRELESS_MODE_N_5G)) {
-		priv->rtllib->pHTInfo->bEnableHT = 1;
+		priv->rtllib->pHTInfo->enable_ht = 1;
 	} else {
-		priv->rtllib->pHTInfo->bEnableHT = 0;
+		priv->rtllib->pHTInfo->enable_ht = 0;
 	}
 	_rtl92e_refresh_support_rate(priv);
 }
@@ -723,7 +723,7 @@ static int _rtl92e_sta_down(struct net_device *dev, bool shutdownrf)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	unsigned long flags = 0;
-	u8 RFInProgressTimeOut = 0;
+	u8 rf_in_progress_timeout = 0;
 
 	if (priv->up == 0)
 		return -1;
@@ -755,12 +755,12 @@ static int _rtl92e_sta_down(struct net_device *dev, bool shutdownrf)
 	spin_lock_irqsave(&priv->rf_ps_lock, flags);
 	while (priv->rf_change_in_progress) {
 		spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
-		if (RFInProgressTimeOut > 100) {
+		if (rf_in_progress_timeout > 100) {
 			spin_lock_irqsave(&priv->rf_ps_lock, flags);
 			break;
 		}
 		mdelay(1);
-		RFInProgressTimeOut++;
+		rf_in_progress_timeout++;
 		spin_lock_irqsave(&priv->rf_ps_lock, flags);
 	}
 	priv->rf_change_in_progress = true;
@@ -845,7 +845,7 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rxringcount = MAX_RX_COUNT;
 	priv->irq_enabled = 0;
 	priv->chan = 1;
-	priv->RegChannelPlan = 0xf;
+	priv->reg_chnl_plan = 0xf;
 	priv->rtllib->mode = WIRELESS_MODE_AUTO;
 	priv->rtllib->iw_mode = IW_MODE_INFRA;
 	priv->rtllib->bNetPromiscuousMode = false;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 1ae3c77e2fef..98c750730f87 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -467,7 +467,7 @@ struct r8192_priv {
 
 	bool bTXPowerDataReadFromEEPORM;
 
-	u16 RegChannelPlan;
+	u16 reg_chnl_plan;
 	u16 ChannelPlan;
 	u8 bHwRfOffAction;
 
diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 76bc9c5a6d83..22e4f126ed56 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -96,7 +96,7 @@ enum ht_aggre_mode {
 
 
 struct rt_hi_throughput {
-	u8				bEnableHT;
+	u8				enable_ht;
 	u8				bCurrentHTSupport;
 
 	u8				bRegBW40MHz;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 2092ebf717a1..2c4c1cb4cbed 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -690,7 +690,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 	u8	bIOTAction = 0;
 
-	/* unmark bEnableHT flag here is the same reason why unmarked in
+	/* unmark enable_ht flag here is the same reason why unmarked in
 	 * function rtllib_softmac_new_net. WB 2008.09.10
 	 */
 	if (pNetwork->bssht.bd_support_ht) {
@@ -776,7 +776,7 @@ void HTUseDefaultSetting(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 
-	if (pHTInfo->bEnableHT) {
+	if (pHTInfo->enable_ht) {
 		pHTInfo->bCurrentHTSupport = true;
 		pHTInfo->bCurSuppCCK = pHTInfo->bRegSuppCCK;
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ee4173a6ade0..ac8132d8c45a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1179,11 +1179,11 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if ((ieee->rtllib_ap_sec_type &&
 	    (ieee->rtllib_ap_sec_type(ieee) & SEC_ALG_TKIP)) ||
 	    ieee->bForcedBgMode) {
-		ieee->pHTInfo->bEnableHT = 0;
+		ieee->pHTInfo->enable_ht = 0;
 		ieee->mode = WIRELESS_MODE_G;
 	}
 
-	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->bEnableHT) {
+	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->enable_ht) {
 		ht_cap_buf = (u8 *)&(ieee->pHTInfo->SelfHTCap);
 		ht_cap_len = sizeof(ieee->pHTInfo->SelfHTCap);
 		HTConstructCapabilityElement(ieee, ht_cap_buf, &ht_cap_len,
@@ -1324,7 +1324,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		memcpy(tag, osCcxVerNum.Octet, osCcxVerNum.Length);
 		tag += osCcxVerNum.Length;
 	}
-	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->bEnableHT) {
+	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->enable_ht) {
 		if (ieee->pHTInfo->ePeerHTSpecVer != HT_SPEC_VER_EWC) {
 			tag = skb_put(skb, ht_cap_len);
 			*tag++ = MFIE_TYPE_HT_CAP;
@@ -1358,7 +1358,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		rtllib_TURBO_Info(ieee, &tag);
 	}
 
-	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->bEnableHT) {
+	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->enable_ht) {
 		if (ieee->pHTInfo->ePeerHTSpecVer == HT_SPEC_VER_EWC) {
 			tag = skb_put(skb, ht_cap_len);
 			*tag++ = MFIE_TYPE_GENERIC;
@@ -1524,14 +1524,14 @@ static void rtllib_associate_complete_wq(void *data)
 		ieee->SetWirelessMode(ieee->dev, IEEE_B);
 		netdev_info(ieee->dev, "Using B rates:%d\n", ieee->rate);
 	}
-	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->bEnableHT) {
+	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->enable_ht) {
 		netdev_info(ieee->dev, "Successfully associated, ht enabled\n");
 		HTOnAssocRsp(ieee);
 	} else {
 		netdev_info(ieee->dev,
 			    "Successfully associated, ht not enabled(%d, %d)\n",
 			    ieee->pHTInfo->bCurrentHTSupport,
-			    ieee->pHTInfo->bEnableHT);
+			    ieee->pHTInfo->enable_ht);
 		memset(ieee->dot11ht_oper_rate_set, 0, 16);
 	}
 	ieee->LinkDetectInfo.SlotNum = 2 * (1 +
@@ -1684,7 +1684,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				    ieee->current_network.ssid,
 				    ieee->current_network.channel,
 				    ieee->current_network.qos_data.supported,
-				    ieee->pHTInfo->bEnableHT,
+				    ieee->pHTInfo->enable_ht,
 				    ieee->current_network.bssht.bd_support_ht,
 				    ieee->current_network.mode,
 				    ieee->current_network.flags);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index fdf867a5dd7a..7bac30b87c93 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -359,7 +359,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 	if (ieee->ScanOperationBackupHandler)
 		ieee->ScanOperationBackupHandler(ieee->dev, SCAN_OPT_BACKUP);
 
-	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->bEnableHT &&
+	if (ieee->pHTInfo->bCurrentHTSupport && ieee->pHTInfo->enable_ht &&
 	    ieee->pHTInfo->bCurBW40MHz) {
 		b40M = 1;
 		chan_offset = ieee->pHTInfo->CurSTAExtChnlOffset;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index be3779efcd23..8b01cfe03381 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -273,7 +273,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 	if (rtllib_act_scanning(ieee, false))
 		return;
 
-	if (!pHTInfo->bCurrentHTSupport || !pHTInfo->bEnableHT)
+	if (!pHTInfo->bCurrentHTSupport || !pHTInfo->enable_ht)
 		return;
 	if (!IsQoSDataFrame(skb->data))
 		return;
@@ -354,7 +354,7 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 
 	tcb_desc->bUseShortGI		= false;
 
-	if (!pHTInfo->bCurrentHTSupport || !pHTInfo->bEnableHT)
+	if (!pHTInfo->bCurrentHTSupport || !pHTInfo->enable_ht)
 		return;
 
 	if (pHTInfo->forced_short_gi) {
@@ -375,7 +375,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 
 	tcb_desc->bPacketBW = false;
 
-	if (!pHTInfo->bCurrentHTSupport || !pHTInfo->bEnableHT)
+	if (!pHTInfo->bCurrentHTSupport || !pHTInfo->enable_ht)
 		return;
 
 	if (tcb_desc->bMulticast || tcb_desc->bBroadcast)
@@ -438,7 +438,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 			tcb_desc->rts_rate = MGN_24M;
 			break;
 		}
-		if (pHTInfo->bCurrentHTSupport  && pHTInfo->bEnableHT) {
+		if (pHTInfo->bCurrentHTSupport  && pHTInfo->enable_ht) {
 			u8 HTOpMode = pHTInfo->current_op_mode;
 
 			if ((pHTInfo->bCurBW40MHz && (HTOpMode == 2 ||
-- 
2.37.3

