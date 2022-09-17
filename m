Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394D366
	for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 04:26:01 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id u9so53565180ejy.5
        for <linux-staging@lists.linux.dev>; Fri, 16 Sep 2022 21:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=48TrLh74HqKrzik8Fk6DUHkcVjt+dZhNAckkfUJzuE0=;
        b=nUG9lZNtYC0PSixanDyWQ01k0z7hFlVsMAq1nmESd0yXJUYonLPqfiwfr3RBLnddgp
         JKF+xomEA8Ni58wanXtGYMqBjruQeLpqQsRfqB8XIH4nF/d2ASIx4KOv7RziHH47E61K
         WquRHNnAxSoJCqbRAt36lS661wpczPCJredbxPnhJnvUQxgErIJW5bsh870/067DghUa
         RHZsgk2rHIYNGXuhfZba1CzyeXpC5BMGFvZ0aOL/M6hbVuDuuAUcQPoqLpC5lHsXYuEQ
         7VEMVG+/rrDS3ZvYWRhNIcIA6HVsw6RVtwea+PrgMY+BY/LkMIY8SU/du/oME2pVweM/
         SlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=48TrLh74HqKrzik8Fk6DUHkcVjt+dZhNAckkfUJzuE0=;
        b=na2wK6U6kjPPK77GNS8XOmk5nyZBCrccWN50x1kxG1r7dwb3Vxcfps21/y8CvLrlCs
         p3jJXC9+pteD0Y4YdltDjnoG0Ai0T/3XP4GBJRzxDc7lfssjYBp+CkINu4QbWG8coPHX
         N2El4d/+B6h9uGu9ZhW+rTFBIvP2qMLu+Lw7LouW0DZkTh6y3CMuTXSnkdDC9O12RVKN
         ADRKCZplVMUIX1LO9hJl7ai3u/lUqruOSx8bT3YLx94dJ0S3znGeDi13IVAxTdodN0g3
         UqhmtVsDLsssKxBT9MOqcT1NfTcPVTqNJKjaNYEtvo9t5Lr54oMrQwzFas81UaUT0Yqi
         EZwQ==
X-Gm-Message-State: ACrzQf3rH8PefCujPkQjeanj+89RO1yxlN822CsDpRAOkYZ6EsNwCoUg
	JtFt8/PMPf0E5HCW6cbbGbc=
X-Google-Smtp-Source: AMsMyM7/YuX8xKItHriaHDm0U24H0J8mZmYHBA2MagMxvOVL2b+hd4tuQ/0WnQYLOl7tvrVZCAUpXw==
X-Received: by 2002:a17:907:9718:b0:77b:45b6:b047 with SMTP id jg24-20020a170907971800b0077b45b6b047mr5605543ejc.479.1663388761412;
        Fri, 16 Sep 2022 21:26:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090630ce00b0073d7b876621sm2153632ejb.205.2022.09.16.21.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 21:26:00 -0700 (PDT)
Date: Sat, 17 Sep 2022 06:25:58 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: rtl8192e: Remove ftrace-like logging in
 rtl819x_BAProc.c, ...
Message-ID: <2c41e6856cd37b4f3e5cb1108272bcc24032bf64.1663387785.git.philipp.g.hortmann@gmail.com>
References: <cover.1663387785.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1663387785.git.philipp.g.hortmann@gmail.com>

Remove "Unnecessary ftrace-like logging" as requested by checkpatch.
Remove multiline macro as it is not needed anymore and not liked by
kernel community.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c    | 5 -----
 drivers/staging/rtl8192e/rtllib_debug.h      | 6 ------
 drivers/staging/rtl8192e/rtllib_softmac.c    | 8 --------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 6 ------
 4 files changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 7d04966afdd9..4c907fb16253 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -100,8 +100,6 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 	*tag++ = pBA->dialog_token;
 
 	if (type == ACT_ADDBARSP) {
-		RT_TRACE(COMP_DBG, "====>to send ADDBARSP\n");
-
 		put_unaligned_le16(StatusCode, tag);
 		tag += 2;
 	}
@@ -183,7 +181,6 @@ static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
 	skb = rtllib_ADDBA(ieee, dst, pBA, 0, ACT_ADDBAREQ);
 
 	if (skb) {
-		RT_TRACE(COMP_DBG, "====>to send ADDBAREQ!!!!!\n");
 		softmac_mgmt_xmit(skb, ieee);
 	} else {
 		netdev_dbg(ieee->dev, "Failed to generate ADDBAReq packet.\n");
@@ -247,7 +244,6 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	pBaTimeoutVal = (u16 *)(tag + 5);
 	pBaStartSeqCtrl = (union sequence_control *)(req + 7);
 
-	RT_TRACE(COMP_DBG, "====>rx ADDBAREQ from : %pM\n", dst);
 	if (!ieee->current_network.qos_data.active ||
 	    !ieee->pHTInfo->bCurrentHTSupport ||
 	    (ieee->pHTInfo->IOTAction & HT_IOT_ACT_REJECT_ADDBA_REQ)) {
@@ -330,7 +326,6 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	pBaParamSet = (union ba_param_set *)(tag + 5);
 	pBaTimeoutVal = (u16 *)(tag + 7);
 
-	RT_TRACE(COMP_DBG, "====>rx ADDBARSP from : %pM\n", dst);
 	if (!ieee->current_network.qos_data.active ||
 	    !ieee->pHTInfo->bCurrentHTSupport ||
 	    !ieee->pHTInfo->bCurrentAMPDUEnable) {
diff --git a/drivers/staging/rtl8192e/rtllib_debug.h b/drivers/staging/rtl8192e/rtllib_debug.h
index e3e8302945eb..f6b23defe225 100644
--- a/drivers/staging/rtl8192e/rtllib_debug.h
+++ b/drivers/staging/rtl8192e/rtllib_debug.h
@@ -46,10 +46,4 @@ enum RTL_DEBUG {
 	COMP_ERR		= BIT(31)
 };
 
-#define RT_TRACE(component, x, args...)		\
-do {			\
-	if (rt_global_debug_component & component) \
-		printk(KERN_DEBUG DRV_NAME ":" x "\n", ##args);\
-} while (0)
-
 #endif
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9e6d7c5716ff..e4f5f4ecf4d0 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1584,13 +1584,8 @@ static void rtllib_associate_procedure_wq(void *data)
 		ieee->data_hard_stop(ieee->dev);
 
 	rtllib_stop_scan(ieee);
-	RT_TRACE(COMP_DBG, "===>%s(), chan:%d\n", __func__,
-		 ieee->current_network.channel);
 	HTSetConnectBwMode(ieee, HT_CHANNEL_WIDTH_20, HT_EXTCHNL_OFFSET_NO_EXT);
 	if (ieee->eRFPowerState == eRfOff) {
-		RT_TRACE(COMP_DBG,
-			 "=============>%s():Rf state is eRfOff, schedule ipsleave wq again,return\n",
-			 __func__);
 		if (ieee->rtllib_ips_leave_wq != NULL)
 			ieee->rtllib_ips_leave_wq(ieee->dev);
 		mutex_unlock(&ieee->wx_mutex);
@@ -2062,9 +2057,6 @@ static inline void rtllib_sta_ps(struct work_struct *work)
 	if ((ieee->ps == RTLLIB_PS_DISABLED ||
 	     ieee->iw_mode != IW_MODE_INFRA ||
 	     ieee->state != RTLLIB_LINKED)) {
-		RT_TRACE(COMP_DBG,
-			 "=====>%s(): no need to ps,wake up!! ieee->ps is %d, ieee->iw_mode is %d, ieee->state is %d\n",
-			 __func__, ieee->ps, ieee->iw_mode, ieee->state);
 		spin_lock_irqsave(&ieee->mgmt_tx_lock, flags2);
 		rtllib_sta_wakeup(ieee, 1);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 70a62ca0f69a..f9589c5b62ba 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -364,8 +364,6 @@ void rtllib_wx_sync_scan_wq(void *data)
 		b40M = 1;
 		chan_offset = ieee->pHTInfo->CurSTAExtChnlOffset;
 		bandwidth = (enum ht_channel_width)ieee->pHTInfo->bCurBW40MHz;
-		RT_TRACE(COMP_DBG, "Scan in 40M, force to 20M first:%d, %d\n",
-			 chan_offset, bandwidth);
 		ieee->SetBWModeHandler(ieee->dev, HT_CHANNEL_WIDTH_20,
 				       HT_EXTCHNL_OFFSET_NO_EXT);
 	}
@@ -373,7 +371,6 @@ void rtllib_wx_sync_scan_wq(void *data)
 	rtllib_start_scan_syncro(ieee, 0);
 
 	if (b40M) {
-		RT_TRACE(COMP_DBG, "Scan in 20M, back to 40M\n");
 		if (chan_offset == HT_EXTCHNL_OFFSET_UPPER)
 			ieee->set_chan(ieee->dev, chan + 2);
 		else if (chan_offset == HT_EXTCHNL_OFFSET_LOWER)
@@ -571,14 +568,11 @@ int rtllib_wx_set_power(struct rtllib_device *ieee,
 	mutex_lock(&ieee->wx_mutex);
 
 	if (wrqu->power.disabled) {
-		RT_TRACE(COMP_DBG, "===>%s(): power disable\n", __func__);
 		ieee->ps = RTLLIB_PS_DISABLED;
 		goto exit;
 	}
 	if (wrqu->power.flags & IW_POWER_TIMEOUT) {
 		ieee->ps_timeout = wrqu->power.value / 1000;
-		RT_TRACE(COMP_DBG, "===>%s():ps_timeout is %d\n", __func__,
-			 ieee->ps_timeout);
 	}
 
 	if (wrqu->power.flags & IW_POWER_PERIOD)
-- 
2.37.3

