Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747EE1FB8
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 17:39:34 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id g3so1954615pja.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Apr 2023 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680975574;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+3r3yk+kfxynNWjdV5lv3xdBpQII9pMefQwWf4bW4A=;
        b=Dxo/UCpQX9rqJQBDM/Fo/0UIAtIp03qgtEemAN9BCraMhHTcbjkeHcH5bOnZs/DHlw
         3WbqVHHg6qPpxKCkPKzucozOY11Ay3xSDCkdUV3v2fNzjZS3JyRLgrNY6JnFu8PuOxik
         FvkjSn5x8wkemb5PnMls5UCXLbwELQi26KsaW5LDMwVw3XsDsJtHKrqjL4gzhJfFB4Qg
         GtXqHY686cuhGtdAIykHjhQCnxoT2BjaYQcvCxkMeQp/UvSLfYirQtJRuo8cZ2PM199u
         V9yWmZhRRhrDZ0SLe+k4vTQfTEn6E4aU/EBuKHVlSzTSkzgzWA2eUBGQZt9mOwNjWx54
         OeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680975574;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+3r3yk+kfxynNWjdV5lv3xdBpQII9pMefQwWf4bW4A=;
        b=m5vryzYSUUejsD998fWXr1uPzO/wr4j0H+mytmB2bT8D6wN/ZTk3b9wlX8GMHV1kM/
         CLdFmUJ/dAWsvm9ap2P0QAstMQqd8XqwmTeC7D5AicdwOBLYCtcPflcibdg4QVZlwFq0
         79LSvp9qxNHnewbRyD/64FLAb7BeLyD6K+lc2GEubRFxI34Jaw/lDiiwTUUHKcpo1U/m
         mjrTyNqVV0Whkel/uM61Vu64lN8+/7qTJq/WD88ivw1QV2ao75WRAT5eTa/TSVIdrl6l
         Jknucw5/Pvp22WfVd+/Jz0IR9LJJvSRzyrGD7L9cEjYpn2fpChZ+I6RTBOEeivQxkniV
         90OA==
X-Gm-Message-State: AAQBX9d62T00o6ca08ZOMrBrHbrRgXaLbZvrUfrFoWuRI5iaVDpfPlz/
	dHDyNzVcxvoPmSSZhst20LmCE0N+7vcevg==
X-Google-Smtp-Source: AKy350bdQ/AvL59WCeJbiT8FVpDzYGphoQ0LYx7T7f1QFObta4YR/VsFU9jKPbJaurEfLutPsI97Og==
X-Received: by 2002:a17:902:d411:b0:19c:e405:4446 with SMTP id b17-20020a170902d41100b0019ce4054446mr2680142ple.30.1680975573682;
        Sat, 08 Apr 2023 10:39:33 -0700 (PDT)
Received: from sumitra.com ([117.207.136.97])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902b70d00b001a1d553de0fsm4780391pls.271.2023.04.08.10.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 10:39:33 -0700 (PDT)
Date: Sat, 8 Apr 2023 10:39:27 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix alignment to match open parenthesis
Message-ID: <20230408173927.GA262840@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix alignment to match opening parenthesis as suggested by Linux
kernel coding-style. Check reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 31 +++++++++-----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7506d7eb7b4c..1e16bfc9d52c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -285,7 +285,7 @@ static void _rtl92e_update_cap(struct net_device *dev, u16 cap)
 		u8	cur_slot_time = priv->slot_time;
 
 		if ((cap & WLAN_CAPABILITY_SHORT_SLOT_TIME) &&
-		   (!priv->rtllib->ht_info->current_rt2rt_long_slot_time)) {
+		    (!priv->rtllib->ht_info->current_rt2rt_long_slot_time)) {
 			if (cur_slot_time != SHORT_SLOT_TIME) {
 				slot_time_val = SHORT_SLOT_TIME;
 				priv->rtllib->SetHwRegHandler(dev,
@@ -354,14 +354,12 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
 		return ret;
 
 	if (network->flags & NETWORK_HAS_QOS_MASK) {
-		if (active_network &&
-				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
+		if (active_network && (network->flags & NETWORK_HAS_QOS_PARAMETERS))
 			network->qos_data.active = network->qos_data.supported;
 
 		if ((network->qos_data.active == 1) && (active_network == 1) &&
-				(network->flags & NETWORK_HAS_QOS_PARAMETERS) &&
-				(network->qos_data.old_param_count !=
-				network->qos_data.param_count)) {
+		    (network->flags & NETWORK_HAS_QOS_PARAMETERS) &&
+		    (network->qos_data.old_param_count != network->qos_data.param_count)) {
 			network->qos_data.old_param_count =
 				network->qos_data.param_count;
 			priv->rtllib->wmm_acm = network->qos_data.wmm_acm;
@@ -423,7 +421,7 @@ static int _rtl92e_qos_assoc_resp(struct r8192_priv *priv,
 			network->qos_data.param_count;
 	} else {
 		memcpy(&priv->rtllib->current_network.qos_data.parameters,
-		&def_qos_parameters, size);
+		       &def_qos_parameters, size);
 		priv->rtllib->current_network.qos_data.active = 0;
 		priv->rtllib->current_network.qos_data.supported = 0;
 		set_qos_param = 1;
@@ -439,8 +437,8 @@ static int _rtl92e_qos_assoc_resp(struct r8192_priv *priv,
 }
 
 static int _rtl92e_handle_assoc_response(struct net_device *dev,
-				 struct rtllib_assoc_response_frame *resp,
-				 struct rtllib_network *network)
+					 struct rtllib_assoc_response_frame *resp,
+					 struct rtllib_network *network)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
@@ -935,7 +933,7 @@ static short _rtl92e_is_tx_queue_empty(struct net_device *dev)
 			continue;
 		if (skb_queue_len(&(&priv->tx_ring[i])->queue) > 0) {
 			netdev_info(dev, "===>tx queue is not empty:%d, %d\n",
-			       i, skb_queue_len(&(&priv->tx_ring[i])->queue));
+				    i, skb_queue_len(&(&priv->tx_ring[i])->queue));
 			return 0;
 		}
 	}
@@ -1213,7 +1211,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	if ((ieee->state == RTLLIB_LINKED) && (ieee->iw_mode ==
 	     IW_MODE_INFRA) && (!ieee->net_promiscuous_md)) {
 		if (ieee->link_detect_info.NumRxOkInPeriod > 100 ||
-		ieee->link_detect_info.NumTxOkInPeriod > 100)
+		    ieee->link_detect_info.NumTxOkInPeriod > 100)
 			bBusyTraffic = true;
 
 		if (ieee->link_detect_info.NumRxOkInPeriod > 4000 ||
@@ -1397,8 +1395,7 @@ static void _rtl92e_hard_data_xmit(struct sk_buff *skb, struct net_device *dev,
 				    MAX_DEV_ADDR_SIZE);
 	u8 queue_index = tcb_desc->queue_index;
 
-	if ((priv->rtllib->rf_power_state == rf_off) || !priv->up ||
-	     priv->reset_in_progress) {
+	if ((priv->rtllib->rf_power_state == rf_off) || !priv->up || priv->reset_in_progress) {
 		kfree_skb(skb);
 		return;
 	}
@@ -1431,7 +1428,7 @@ static int _rtl92e_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	if (queue_index != TXCMD_QUEUE) {
 		if ((priv->rtllib->rf_power_state == rf_off) ||
-		     !priv->up || priv->reset_in_progress) {
+		    !priv->up || priv->reset_in_progress) {
 			kfree_skb(skb);
 			return 0;
 		}
@@ -1879,7 +1876,7 @@ static void _rtl92e_tx_resume(struct net_device *dev)
 	for (queue_index = BK_QUEUE;
 	     queue_index < MAX_QUEUE_SIZE; queue_index++) {
 		while ((!skb_queue_empty(&ieee->skb_waitQ[queue_index])) &&
-		(priv->rtllib->check_nic_enough_desc(dev, queue_index) > 0)) {
+		       (priv->rtllib->check_nic_enough_desc(dev, queue_index) > 0)) {
 			skb = skb_dequeue(&ieee->skb_waitQ[queue_index]);
 			ieee->softmac_data_hard_start_xmit(skb, dev, 0);
 		}
@@ -1948,7 +1945,7 @@ static int _rtl92e_close(struct net_device *dev)
 	int ret;
 
 	if ((rtllib_act_scanning(priv->rtllib, false)) &&
-		!(priv->rtllib->softmac_features & IEEE_SOFTMAC_SCAN)) {
+	    !(priv->rtllib->softmac_features & IEEE_SOFTMAC_SCAN)) {
 		rtllib_stop_scan(priv->rtllib);
 	}
 
@@ -2272,7 +2269,7 @@ static void _rtl92e_pci_disconnect(struct pci_dev *pdev)
 		if (dev->mem_start != 0) {
 			iounmap((void __iomem *)dev->mem_start);
 			release_mem_region(pci_resource_start(pdev, 1),
-					pci_resource_len(pdev, 1));
+					   pci_resource_len(pdev, 1));
 		}
 
 		free_rtllib(dev);
-- 
2.25.1

