Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0978D7477
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:09:45 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-50d8d4efd13so1981710a12.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001383; x=1686593383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNF95drdMe2nB4iU+FTUbRjzrVIn7SuCBsnSfgapJkY=;
        b=dlwfiRMkQLXkcseVb90U1cEULAs6+E7XraQqo4ZmA5TuxA+R5VZSwGMT7ZIA0OdCvd
         XqaSnG4xBZegzSI3aO3KB5OrcLcbA/qQbsfOz+JODBDm8/1WxxVtzhS9pf0tkui09hPA
         UnWFdQ9TgQNjLnhFEs5cGBcqKaebC/qh1VesSnxqxjQPxbF0zTTwpsj+SFEb/V5SWGqg
         wNQMNu4wucwZnic91pqOdVJjsLxbfCndFWKxNoIGwTecFRBDwNKac7p1HE2zVRoVmjGt
         xfzwp9NMxqRE/5dfZN+nENrwjzeafL1WaIohLgfFlvvMe6iFntHVd59KkTLmwzmMnEfz
         +Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001383; x=1686593383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNF95drdMe2nB4iU+FTUbRjzrVIn7SuCBsnSfgapJkY=;
        b=H20VTG+7SkgmuU7qr4Dno2VppDOpU5XISXki+nDdBxEoLm0H7V1AuWnfHmPMNbXzQW
         eVhxUpbPm1kerdzkPTXSdFq1lq8EPF/YkXQEKSfYqx6IlsqILQqwx5BkwSyUD1wJFQNc
         5g2076d7OOvYgH7uF1xaMGoAjKvHbBRAG6Jk4wFSQm7/CvCoer4a2PWXOUjB9G24mJmI
         mlQD8E+s3ZA/Ol6x6xMnFwUR+zjYm7qCoBFMib44AS0l1WtsXJbVSsQUf6FU5AwFnQfY
         X0FOuwTSRZnAVMheAJozWh7xIJUdtrETIA61XeNhxyqu4Ajw75nFb0N/dMFmcfE77kWG
         ecJw==
X-Gm-Message-State: AC+VfDxrC7E/jWP5BX+SciI0CMXUu8IFK+yyOjwmXgfJIFdfpaspPp+b
	VAj8ehhvTgr01Cbwuk8lE6I=
X-Google-Smtp-Source: ACHHUZ4TTkgB5bvS27tjUvNXgCZHLYv/6cvfU1HY4C1jEGAq6jjQmFotJsYd96Br742mvn8UeeCuUw==
X-Received: by 2002:a17:906:74d1:b0:965:9602:3ef0 with SMTP id z17-20020a17090674d100b0096596023ef0mr25591824ejl.0.1684001383077;
        Sat, 13 May 2023 11:09:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id d4-20020a170907272400b00965e9b435dfsm7065022ejl.65.2023.05.13.11.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:09:42 -0700 (PDT)
Date: Sat, 13 May 2023 20:09:40 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] staging: rtl8192e: Remove undefined function
 LedControlHandler
Message-ID: <e3c29c3db33d314dffb673f8e563da0fb1f2b22f.1683960685.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function LedControlHandler as it is not defined. Remove resulting
unused local variables bLedBlinking, type, fc and LedAction.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  4 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 26 -------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  4 ---
 drivers/staging/rtl8192e/rtllib.h             |  2 --
 drivers/staging/rtl8192e/rtllib_softmac.c     | 10 -------
 5 files changed, 46 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index c612e31d1a84..d9d056d18fa3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -46,7 +46,6 @@ static void _rtl92e_update_msr(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8 msr;
-	enum led_ctl_mode LedAction = LED_CTL_NO_LINK;
 
 	msr  = rtl92e_readb(dev, MSR);
 	msr &= ~MSR_LINK_MASK;
@@ -55,7 +54,6 @@ static void _rtl92e_update_msr(struct net_device *dev)
 	case IW_MODE_INFRA:
 		if (priv->rtllib->state == RTLLIB_LINKED)
 			msr |= MSR_LINK_MANAGED;
-		LedAction = LED_CTL_LINK;
 		break;
 	case IW_MODE_ADHOC:
 		if (priv->rtllib->state == RTLLIB_LINKED)
@@ -70,8 +68,6 @@ static void _rtl92e_update_msr(struct net_device *dev)
 	}
 
 	rtl92e_writeb(dev, MSR, msr);
-	if (priv->rtllib->LedControlHandler)
-		priv->rtllib->LedControlHandler(dev, LedAction);
 }
 
 void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 5fdee7b54f24..17b70dde7eeb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -737,8 +737,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->InitialGainHandler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
-
-	priv->rtllib->LedControlHandler = NULL;
 	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
 }
 
@@ -1272,10 +1270,6 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 			ieee->is_roaming = true;
 			ieee->is_set_key = false;
 			ieee->link_change(dev);
-			if (ieee->LedControlHandler)
-				ieee->LedControlHandler(ieee->dev,
-							LED_CTL_START_TO_LINK);
-
 			notify_wx_assoc_event(ieee);
 
 			if (!(ieee->rtllib_ap_sec_type(ieee) &
@@ -1506,7 +1500,6 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 				    MAX_DEV_ADDR_SIZE);
 	struct tx_desc *pdesc = NULL;
 	struct rtllib_hdr_1addr *header = NULL;
-	u16 fc = 0, type = 0;
 	u8 *pda_addr = NULL;
 	int   idx;
 	u32 fwinfo_size = 0;
@@ -1522,8 +1515,6 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 	fwinfo_size = sizeof(struct tx_fwinfo_8190pci);
 
 	header = (struct rtllib_hdr_1addr *)(((u8 *)skb->data) + fwinfo_size);
-	fc = le16_to_cpu(header->frame_ctl);
-	type = WLAN_FC_GET_TYPE(fc);
 	pda_addr = header->addr1;
 
 	if (!is_broadcast_ether_addr(pda_addr) && !is_multicast_ether_addr(pda_addr))
@@ -1545,11 +1536,6 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 		return skb->len;
 	}
-
-	if (type == RTLLIB_FTYPE_DATA) {
-		if (priv->rtllib->LedControlHandler)
-			priv->rtllib->LedControlHandler(dev, LED_CTL_TX);
-	}
 	rtl92e_fill_tx_desc(dev, pdesc, tcb_desc, skb);
 	__skb_queue_tail(&ring->queue, skb);
 	pdesc->OWN = 1;
@@ -1776,8 +1762,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_hdr_1addr *rtllib_hdr = NULL;
 	bool unicast_packet = false;
-	bool bLedBlinking = true;
-	u16 fc = 0, type = 0;
 	u32 skb_len = 0;
 	int rx_queue_idx = RX_MPDU_QUEUE;
 
@@ -1821,16 +1805,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 			/* unicast packet */
 			unicast_packet = true;
 		}
-		fc = le16_to_cpu(rtllib_hdr->frame_ctl);
-		type = WLAN_FC_GET_TYPE(fc);
-		if (type == RTLLIB_FTYPE_MGMT)
-			bLedBlinking = false;
-
-		if (bLedBlinking)
-			if (priv->rtllib->LedControlHandler)
-				priv->rtllib->LedControlHandler(dev,
-							LED_CTL_RX);
-
 		skb_len = skb->len;
 
 		if (!rtllib_rx(priv->rtllib, skb, &stats)) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 0bb657fda06c..8b656980ee25 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -421,10 +421,6 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 			mutex_unlock(&priv->rtllib->ips_mutex);
 		}
 		rtllib_stop_scan(priv->rtllib);
-		if (priv->rtllib->LedControlHandler)
-			priv->rtllib->LedControlHandler(dev,
-							 LED_CTL_SITE_SURVEY);
-
 		if (priv->rtllib->rf_power_state != rf_off) {
 			priv->rtllib->actscanning = true;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 8bafee31e50c..4aa5ce9f7792 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1716,8 +1716,6 @@ struct rtllib_device {
 	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
 					   u8 Operation);
-	void (*LedControlHandler)(struct net_device *dev,
-				  enum led_ctl_mode LedAction);
 	void (*SetHwRegHandler)(struct net_device *dev, u8 variable, u8 *val);
 
 	void (*AllowAllDestAddrHandler)(struct net_device *dev,
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 1fe0675033cb..18885cda60f6 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1680,9 +1680,6 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 								 false;
 
 				ieee->state = RTLLIB_ASSOCIATING;
-				if (ieee->LedControlHandler != NULL)
-					ieee->LedControlHandler(ieee->dev,
-							 LED_CTL_START_TO_LINK);
 				schedule_delayed_work(
 					   &ieee->associate_procedure_wq, 0);
 			} else {
@@ -2343,10 +2340,6 @@ rtllib_rx_deauth(struct rtllib_device *ieee, struct sk_buff *skb)
 		ieee->link_detect_info.bBusyTraffic = false;
 		rtllib_disassociate(ieee);
 		RemovePeerTS(ieee, header->addr2);
-		if (ieee->LedControlHandler != NULL)
-			ieee->LedControlHandler(ieee->dev,
-						LED_CTL_START_TO_LINK);
-
 		if (!(ieee->rtllib_ap_sec_type(ieee) &
 		    (SEC_ALG_CCMP|SEC_ALG_TKIP)))
 			schedule_delayed_work(
@@ -2641,9 +2634,6 @@ static void rtllib_start_ibss_wq(void *data)
 	ieee->link_change(ieee->dev);
 
 	HTSetConnectBwMode(ieee, HT_CHANNEL_WIDTH_20, HT_EXTCHNL_OFFSET_NO_EXT);
-	if (ieee->LedControlHandler != NULL)
-		ieee->LedControlHandler(ieee->dev, LED_CTL_LINK);
-
 	rtllib_start_send_beacons(ieee);
 
 	notify_wx_assoc_event(ieee);
-- 
2.40.1

