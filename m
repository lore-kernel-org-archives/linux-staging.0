Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EFB366
	for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 04:25:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lh5so11738076ejb.10
        for <linux-staging@lists.linux.dev>; Fri, 16 Sep 2022 21:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=P4IXbjpJGogB5bTg3j6LGjLbToM1KMQkj8lnneUfMDE=;
        b=NX8Ya4tB87jnzHdWuHENplKakLqBCRAgfp8c1MduGfLX4qWI5aM+Zxa8rReQkVw4UH
         6hlTaK/zi5A23JCAx7hrYYCuvKtFf2UGBAiV3xhGB3E1RI3uQTzySmM+nJezDdvLPkS1
         s5CxJak70R28Jbv4z5kOrHPsQ5XmZ3wTVQGOCL1SiqsN9LNXfHTrfeeaGOompCIxZUX+
         +VnaZw6Lbl7nSoBQeI/5w0dO7HHm9vYwJ6fj2kDpCJcwL1dxBVfj1JFw3mK9tEoP2naa
         HGUZ5vT+5++Q8xxzvNhdK2wHrwK4ojhSA9ZGpCYjVkwlRciPrq3akt/6NjieAMrwVjcJ
         rWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=P4IXbjpJGogB5bTg3j6LGjLbToM1KMQkj8lnneUfMDE=;
        b=pLODhcEDQRNyGM+Bxw0ZUWPe2LvSzPzsrS38QKRPQiuKT2g7RgVUahBT7XUQgPdXPg
         ZWwX0URq6bcl4WXLsD9kG6KlC/IsEKgIZXW6GhZCVusv1UzRKdiO+H6VG92AgjZsPjhr
         y20dTHfCFZbKcT4Kkp+LnOklSFGMRw+KbhgCgFbVcLhltPp58LkUlsbJV2gVnz0YCth7
         QoXt+1mfxkxRZfx0IsOMJiKndRTZh1S3Mh0ijitlkt+v81WL6IRnFEEKVdK8TuQKqoUw
         hmnmxlAd6uaiCbFHlDw3pcYhsqP4l3uV+zcxYJmu48oxtowt7IoiTIe3CTi3oh4mfIlg
         Ob5Q==
X-Gm-Message-State: ACrzQf2m5sE1WaNotfzuOQr/COvl3fGrXL9hsh/a6BmJyE8JBCL5GI8K
	S+Qc2/waJtkccgdmVlqelMY=
X-Google-Smtp-Source: AMsMyM7TWi7Pyw+NtYWXDQ0hRdHci6YAuF7Y7j81PkLYtxj2QlRD2YJMS7Dg5ZtYsN2zlzc2AdZWUA==
X-Received: by 2002:a17:907:6ea2:b0:779:8fc1:e5d8 with SMTP id sh34-20020a1709076ea200b007798fc1e5d8mr5467127ejc.731.1663388751168;
        Fri, 16 Sep 2022 21:25:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709063ca200b00777249e951bsm11544672ejh.51.2022.09.16.21.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 21:25:50 -0700 (PDT)
Date: Sat, 17 Sep 2022 06:25:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: rtl8192e: Remove ftrace-like logging in rtl_ps.c
Message-ID: <6d942ba65f62643af2ff7104911f7947cca21790.1663387785.git.philipp.g.hortmann@gmail.com>
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

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 34 ----------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 966debd99296..d752bbc310d1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -23,13 +23,9 @@ static void _rtl92e_hw_sleep(struct net_device *dev)
 	spin_lock_irqsave(&priv->rf_ps_lock, flags);
 	if (priv->rf_change_in_progress) {
 		spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
-		RT_TRACE(COMP_DBG,
-			 "%s(): RF Change in progress!\n", __func__);
 		return;
 	}
 	spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
-	RT_TRACE(COMP_DBG, "%s()============>come to sleep down\n", __func__);
-
 	rtl92e_set_rf_state(dev, eRfSleep, RF_CHANGE_BY_PS);
 }
 
@@ -50,14 +46,11 @@ void rtl92e_hw_wakeup(struct net_device *dev)
 	spin_lock_irqsave(&priv->rf_ps_lock, flags);
 	if (priv->rf_change_in_progress) {
 		spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
-		RT_TRACE(COMP_DBG,
-			 "%s(): RF Change in progress!\n", __func__);
 		schedule_delayed_work(&priv->rtllib->hw_wakeup_wq,
 				      msecs_to_jiffies(10));
 		return;
 	}
 	spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
-	RT_TRACE(COMP_PS, "%s()============>come to wake up\n", __func__);
 	rtl92e_set_rf_state(dev, eRfOn, RF_CHANGE_BY_PS);
 }
 
@@ -110,15 +103,10 @@ static void _rtl92e_ps_update_rf_state(struct net_device *dev)
 	struct rt_pwr_save_ctrl *pPSC = (struct rt_pwr_save_ctrl *)
 					&(priv->rtllib->PowerSaveControl);
 
-	RT_TRACE(COMP_PS, "%s() --------->\n", __func__);
 	pPSC->bSwRfProcessing = true;
-
-	RT_TRACE(COMP_PS, "%s(): Set RF to %s.\n", __func__,
-		 pPSC->eInactivePowerState == eRfOff ? "OFF" : "ON");
 	rtl92e_set_rf_state(dev, pPSC->eInactivePowerState, RF_CHANGE_BY_IPS);
 
 	pPSC->bSwRfProcessing = false;
-	RT_TRACE(COMP_PS, "%s() <---------\n", __func__);
 }
 
 void rtl92e_ips_enter(struct net_device *dev)
@@ -133,7 +121,6 @@ void rtl92e_ips_enter(struct net_device *dev)
 		if (rt_state == eRfOn && !pPSC->bSwRfProcessing &&
 			(priv->rtllib->state != RTLLIB_LINKED) &&
 			(priv->rtllib->iw_mode != IW_MODE_MASTER)) {
-			RT_TRACE(COMP_PS, "%s(): Turn off RF.\n", __func__);
 			pPSC->eInactivePowerState = eRfOff;
 			priv->isRFOff = true;
 			priv->bInPowerSaveMode = true;
@@ -153,7 +140,6 @@ void rtl92e_ips_leave(struct net_device *dev)
 		rt_state = priv->rtllib->eRFPowerState;
 		if (rt_state != eRfOn  && !pPSC->bSwRfProcessing &&
 		    priv->rtllib->RfOffReason <= RF_CHANGE_BY_IPS) {
-			RT_TRACE(COMP_PS, "%s(): Turn on RF.\n", __func__);
 			pPSC->eInactivePowerState = eRfOn;
 			priv->bInPowerSaveMode = false;
 			_rtl92e_ps_update_rf_state(dev);
@@ -210,7 +196,6 @@ static bool _rtl92e_ps_set_mode(struct net_device *dev, u8 rtPsMode)
 	if (priv->rtllib->iw_mode == IW_MODE_ADHOC)
 		return false;
 
-	RT_TRACE(COMP_LPS, "%s(): set ieee->ps = %x\n", __func__, rtPsMode);
 	if (!priv->ps_force)
 		priv->rtllib->ps = rtPsMode;
 	if (priv->rtllib->sta_sleep != LPS_IS_WAKE &&
@@ -221,8 +206,6 @@ static bool _rtl92e_ps_set_mode(struct net_device *dev, u8 rtPsMode)
 		priv->rtllib->sta_sleep = LPS_IS_WAKE;
 
 		spin_lock_irqsave(&(priv->rtllib->mgmt_tx_lock), flags);
-		RT_TRACE(COMP_DBG,
-			 "LPS leave: notify AP we are awaked ++++++++++ SendNullFunctionData\n");
 		rtllib_sta_ps_send_null_frame(priv->rtllib, 0);
 		spin_unlock_irqrestore(&(priv->rtllib->mgmt_tx_lock), flags);
 	}
@@ -236,12 +219,6 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 	struct rt_pwr_save_ctrl *pPSC = (struct rt_pwr_save_ctrl *)
 					&(priv->rtllib->PowerSaveControl);
 
-	RT_TRACE(COMP_PS, "%s()...\n", __func__);
-	RT_TRACE(COMP_PS,
-		 "pPSC->bLeisurePs = %d, ieee->ps = %d,pPSC->LpsIdleCount is %d,RT_CHECK_FOR_HANG_PERIOD is %d\n",
-		 pPSC->bLeisurePs, priv->rtllib->ps, pPSC->LpsIdleCount,
-		 RT_CHECK_FOR_HANG_PERIOD);
-
 	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
 	    (priv->rtllib->state == RTLLIB_LINKED))
 	    || (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
@@ -252,10 +229,6 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 		if (pPSC->LpsIdleCount >= RT_CHECK_FOR_HANG_PERIOD) {
 
 			if (priv->rtllib->ps == RTLLIB_PS_DISABLED) {
-
-				RT_TRACE(COMP_LPS,
-					 "%s(): Enter 802.11 power save mode...\n", __func__);
-
 				if (!pPSC->bFwCtrlLPS) {
 					if (priv->rtllib->SetFwCmdHandler)
 						priv->rtllib->SetFwCmdHandler(
@@ -275,15 +248,8 @@ void rtl92e_leisure_ps_leave(struct net_device *dev)
 	struct rt_pwr_save_ctrl *pPSC = (struct rt_pwr_save_ctrl *)
 					&(priv->rtllib->PowerSaveControl);
 
-
-	RT_TRACE(COMP_PS, "%s()...\n", __func__);
-	RT_TRACE(COMP_PS, "pPSC->bLeisurePs = %d, ieee->ps = %d\n",
-		pPSC->bLeisurePs, priv->rtllib->ps);
-
 	if (pPSC->bLeisurePs) {
 		if (priv->rtllib->ps != RTLLIB_PS_DISABLED) {
-			RT_TRACE(COMP_LPS,
-				 "%s(): Busy Traffic , Leave 802.11 power save..\n", __func__);
 			_rtl92e_ps_set_mode(dev, RTLLIB_PS_DISABLED);
 
 			if (!pPSC->bFwCtrlLPS) {
-- 
2.37.3

