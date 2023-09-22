Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD182943C
	for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 13:30:04 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40506bfca64so7401465e9.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389402; x=1695994202; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IU0umDeRj0qrz0iB2siEvqGentkzeL4EI2Vh5qfUxFY=;
        b=O8YkaB7wLFRahQUQ5KtF+mSw4Ihp7ubu4EB6HiKJU6sq4/WlFL2dglFfUTmbewEWCH
         ZssPnKjDfDgVsdX1Pn8zpAQk7ToMNp3ggaFheZisWRF8ajeJceot1RG1IZEa9xnvaILT
         HDNNwpMlh3W57S7AE3aZkLH+eGchTzGQlgP35rh5XcAcuI9/3SOOqoJmnoG7Bwa3TlKQ
         KkoquT9lvNkj0s1TPMKeX/oIDUm2aygZEWv38q3fjwxRLzocGqzKW2G7nTSsrXkrjr2g
         TXegkTY5Pr+ielw/WNm9E+aHl70VcC9p0MkvAgJILeRi+oQH+Z63sXfRdiLktwjZzoAT
         CQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389402; x=1695994202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU0umDeRj0qrz0iB2siEvqGentkzeL4EI2Vh5qfUxFY=;
        b=VqCLWED52uxVUJBWz6CuzE8/KPPAqzHZsu+rNPFO9F2EVpfLojUqoKFudGTwgHOs/q
         b+997XYR8UVg4MmHAiGioHr520vR5F4iHVxed4Uj5qAM65OtFhdt6+6jhOXqpcEYuGp4
         Nvk3zs4Z5E82xszdOxdFZ5oNiiQMF2Rz4QRqOcVGB3YRx16MfMIzrPW05YMbRjfjxigh
         fqwEeCElTOWLpsgVV7PN07bIf2CH7ay2RiJuOJkynJm/hf7hhaG+m/P5kKAh4WPJU7FE
         qH3IVdeebP2486gVtrA6uD4aHpj5j6QhPKxVofjj96HFu09ssjVsM1QLq+AHlVTeACfd
         8iNA==
X-Gm-Message-State: AOJu0YyZTACGpxKzbVkNSm76lZraV/oA54My7E2HOxK+ytwmqsdmhfRn
	wPEmzElEVjzi2gghP2Y8bmg=
X-Google-Smtp-Source: AGHT+IHKK+OqC1EfcapiU5dz6RVElf341Utdamu3L6MLv629us5ayppbW6MZqlMBDrpTL/rlbOV3tw==
X-Received: by 2002:a05:600c:511e:b0:405:4721:800 with SMTP id o30-20020a05600c511e00b0040547210800mr273667wms.1.1695389402540;
        Fri, 22 Sep 2023 06:30:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d610b000000b0031435731dfasm4454699wrt.35.2023.09.22.06.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:30:02 -0700 (PDT)
Date: Fri, 22 Sep 2023 15:30:00 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] staging: rtl8192e: Remove rtllib_stop_send_beacons
Message-ID: <17c5545102ad8f50ca320af17aafa555f8caec2d.1695387832.git.philipp.g.hortmann@gmail.com>
References: <cover.1695387832.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695387832.git.philipp.g.hortmann@gmail.com>

rtllib_start_send_beacons() is removed so no need for
rtllib_stop_send_beacons() anymore.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  7 -------
 drivers/staging/rtl8192e/rtllib.h            |  9 ---------
 drivers/staging/rtl8192e/rtllib_softmac.c    | 21 --------------------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  1 -
 4 files changed, 38 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 208c7bfd9bfe..87f5441fbb10 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -458,10 +458,6 @@ static void _rtl92e_prepare_beacon(struct tasklet_struct *t)
 	pdesc->OWN = 1;
 }
 
-static void _rtl92e_stop_beacon(struct net_device *dev)
-{
-}
-
 void rtl92e_config_rate(struct net_device *dev, u16 *rate_config)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
@@ -700,8 +696,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->set_bw_mode_handler	= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
-	priv->rtllib->stop_send_beacons = _rtl92e_stop_beacon;
-
 	priv->rtllib->sta_wake_up = rtl92e_hw_wakeup;
 	priv->rtllib->enter_sleep_state = rtl92e_enter_sleep;
 	priv->rtllib->ps_is_queue_empty = _rtl92e_is_tx_queue_empty;
@@ -1045,7 +1039,6 @@ static void _rtl92e_if_silent_reset(struct net_device *dev)
 		if (ieee->link_state == MAC80211_LINKED) {
 			mutex_lock(&ieee->wx_mutex);
 			netdev_info(dev, "ieee->link_state is MAC80211_LINKED\n");
-			rtllib_stop_send_beacons(priv->rtllib);
 			del_timer_sync(&ieee->associate_timer);
 			cancel_delayed_work(&ieee->associate_retry_wq);
 			rtllib_stop_scan(ieee);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 410401869ebb..0597dcb759e0 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1495,14 +1495,6 @@ struct rtllib_device {
 	 */
 	void (*link_change)(struct net_device *dev);
 
-	/* these two function indicates to the HW when to start
-	 * and stop to send beacons. This is used when the
-	 * IEEE_SOFTMAC_BEACONS is not set. For now the
-	 * stop_send_bacons is NOT guaranteed to be called only
-	 * after start_send_beacons.
-	 */
-	void (*stop_send_beacons)(struct net_device *dev);
-
 	/* power save mode related */
 	void (*sta_wake_up)(struct net_device *dev);
 	void (*enter_sleep_state)(struct net_device *dev, u64 time);
@@ -1725,7 +1717,6 @@ void rtllib_reset_queue(struct rtllib_device *ieee);
 void rtllib_wake_all_queues(struct rtllib_device *ieee);
 void rtllib_stop_all_queues(struct rtllib_device *ieee);
 struct sk_buff *rtllib_get_beacon(struct rtllib_device *ieee);
-void rtllib_stop_send_beacons(struct rtllib_device *ieee);
 
 void notify_wx_assoc_event(struct rtllib_device *ieee);
 void rtllib_ps_tx_ack(struct rtllib_device *ieee, short success);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 4551071e9f1b..982578e1c0af 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -607,26 +607,6 @@ static void rtllib_softmac_scan_wq(void *data)
 	mutex_unlock(&ieee->scan_mutex);
 }
 
-static void rtllib_beacons_stop(struct rtllib_device *ieee)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&ieee->beacon_lock, flags);
-
-	ieee->beacon_txing = 0;
-
-	spin_unlock_irqrestore(&ieee->beacon_lock, flags);
-	del_timer_sync(&ieee->beacon_timer);
-}
-
-void rtllib_stop_send_beacons(struct rtllib_device *ieee)
-{
-	ieee->stop_send_beacons(ieee->dev);
-	if (ieee->softmac_features & IEEE_SOFTMAC_BEACONS)
-		rtllib_beacons_stop(ieee);
-}
-EXPORT_SYMBOL(rtllib_stop_send_beacons);
-
 static void rtllib_softmac_stop_scan(struct rtllib_device *ieee)
 {
 	mutex_lock(&ieee->scan_mutex);
@@ -2326,7 +2306,6 @@ void rtllib_stop_protocol(struct rtllib_device *ieee, u8 shutdown)
 		ieee->rtllib_ips_leave(ieee->dev);
 	}
 
-	rtllib_stop_send_beacons(ieee);
 	del_timer_sync(&ieee->associate_timer);
 	cancel_delayed_work_sync(&ieee->associate_retry_wq);
 	cancel_delayed_work_sync(&ieee->link_change_wq);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 2b15251201ec..3c7c0f07ab0b 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -310,7 +310,6 @@ void rtllib_wx_sync_scan_wq(void *data)
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 
 	rtllib_stop_all_queues(ieee);
-	rtllib_stop_send_beacons(ieee);
 	ieee->link_state = MAC80211_LINKED_SCANNING;
 	ieee->link_change(ieee->dev);
 	/* wait for ps packet to be kicked out successfully */
-- 
2.42.0

