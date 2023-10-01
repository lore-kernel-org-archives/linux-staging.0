Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA6B171DD
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:44:32 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9ae3d4c136fso419571066b.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167870; x=1696772670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ym31JZcesETa7AS2f1umn/B+sSEpEuK3mEbxds3x3JU=;
        b=W6q0IePcqriBKnfW3H6erE1EBp75SuIMHJFz1M58qDtUbMKa7yIQDuKK+Q5ROga4IA
         qe/ACPY9RJK3Wkq7zMSxn81wugn0DfUzFId0KvGyiXN3kGK21g94h6Im+/lDiE6tL1WM
         Whsg1PvaCG0XFVLWXuci1E7yemfNjxHR4yhqAIX70ZxuSKRiyXM4cQ2JObI45t0ZLy6e
         lV1On4/MRI6LoHhSUKHT2objELA9SIj67didY6qMSqsV1JhUFk5ZRWkRRWJLGayuhyng
         NDBwFtb/CP0n9fHJEflQqugcb0vVI/EaSm6beQpK0hSCQRf+QAvvBaMcYm7KLY9c2Sd3
         kGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167870; x=1696772670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym31JZcesETa7AS2f1umn/B+sSEpEuK3mEbxds3x3JU=;
        b=wzcmSmJHf0fn5+FZuxT2Fw51UpcJ9OIOTMULxsMLOT4+lVeNSFkudWR7ktnkdRwCwe
         x85otJHo9oumxtNys/irLafi1lsYwggcyv9JH4QFQq5106xS+b6NKZVlfIQ3fNYdWW8J
         qr3OVEfDTclp6tIzDwVp09M60rJc1Z/xUa4S9g26EqbzYILtusGLqTEcl3w/cSCK0t/m
         7aEOgStPGYY/lZitbDFX5VqGdL+Cx0G3zEIYge0tZjKuA8QFKncPwzLUeRy2O40ild1p
         V66wW1Sn6qVtorKblkpbYGc9kDLKpM5eR1nYj9Tw/DR6w+OIDq1PyFoiyAsmP0FWzAMK
         wSPQ==
X-Gm-Message-State: AOJu0YypF9jWgvDtQI5PxUgN9QPkm9mygOqMYq3U8EKf8kyx9ru76Hc5
	Y9ntHOeGS1r4YG/Jz2wrkGzWMGwI3xo=
X-Google-Smtp-Source: AGHT+IHCNDyM0yg+CQz5dfSM+EKe4Pd0E59Hd3zoNa1XRQq0Z9Lrjh/ux+e26rZ84y08df6ru7jkGQ==
X-Received: by 2002:a17:906:74d4:b0:9ad:dfe7:b361 with SMTP id z20-20020a17090674d400b009addfe7b361mr6959151ejl.5.1696167870325;
        Sun, 01 Oct 2023 06:44:30 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b009a193a5acffsm15232229ejk.121.2023.10.01.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:44:30 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:44:28 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8192e: Remove broken function
 _rtl92e_if_silent_reset()
Message-ID: <8b1b04b512b5691968a49308fdc052973fbe5032.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

When the function _rtl92e_if_silent_reset() is called the variable
priv->rst_progress is set to RESET_TYPE_SILENT.
Since priv->up is always true the function is left at "if (priv->up) {"
without resetting. Now the function _rtl92e_if_silent_reset() is like
deactivated because the equation at the very beginning is false:
"if (priv->rst_progress == RESET_TYPE_NORESET) {"
This leads to a state where the driver hangs in the reset state and
cannot go forward.
In 30% of the cases the wlan is disconnected and cannot reconnect. The
rest of the time it continues working but no reset is done at all.
Further requests for reset are ignored. Remove broken function
_rtl92e_if_silent_reset() and remove return value of
_rtl92e_if_check_reset() to avoid compiler warnings.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 113 +------------------
 1 file changed, 3 insertions(+), 110 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 11d20fc11a7d..43533410f8d6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -958,7 +958,7 @@ static enum reset_type _rtl92e_rx_check_stuck(struct net_device *dev)
 	return RESET_TYPE_NORESET;
 }
 
-static enum reset_type _rtl92e_if_check_reset(struct net_device *dev)
+static void _rtl92e_if_check_reset(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	enum reset_type TxResetType = RESET_TYPE_NORESET;
@@ -979,112 +979,8 @@ static enum reset_type _rtl92e_if_check_reset(struct net_device *dev)
 		   RxResetType == RESET_TYPE_SILENT) {
 		netdev_info(dev, "%s(): TxResetType is %d, RxResetType is %d\n",
 			    __func__, TxResetType, RxResetType);
-		return RESET_TYPE_SILENT;
-	} else {
-		return RESET_TYPE_NORESET;
-	}
-}
-
-static void _rtl92e_if_silent_reset(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	u8	reset_times = 0;
-	int reset_status = 0;
-	struct rtllib_device *ieee = priv->rtllib;
-	unsigned long flag;
-
-	if (priv->rst_progress == RESET_TYPE_NORESET) {
-		priv->rst_progress = RESET_TYPE_SILENT;
-
-		spin_lock_irqsave(&priv->rf_ps_lock, flag);
-		if (priv->rf_change_in_progress) {
-			spin_unlock_irqrestore(&priv->rf_ps_lock, flag);
-			goto END;
-		}
-		priv->rf_change_in_progress = true;
-		priv->reset_in_progress = true;
-		spin_unlock_irqrestore(&priv->rf_ps_lock, flag);
-
-RESET_START:
-
-		mutex_lock(&priv->wx_mutex);
-
-		if (priv->rtllib->link_state == MAC80211_LINKED)
-			rtl92e_leisure_ps_leave(dev);
-
-		if (priv->up) {
-			netdev_info(dev, "%s():the driver is not up.\n",
-				    __func__);
-			mutex_unlock(&priv->wx_mutex);
-			return;
-		}
-		priv->up = 0;
-
-		mdelay(1000);
-
-		if (!netif_queue_stopped(dev))
-			netif_stop_queue(dev);
-
-		rtl92e_irq_disable(dev);
-		del_timer_sync(&priv->watch_dog_timer);
-		_rtl92e_cancel_deferred_work(priv);
-		rtl92e_dm_deinit(dev);
-		rtllib_stop_scan_syncro(ieee);
-
-		if (ieee->link_state == MAC80211_LINKED) {
-			mutex_lock(&ieee->wx_mutex);
-			netdev_info(dev, "ieee->link_state is MAC80211_LINKED\n");
-			del_timer_sync(&ieee->associate_timer);
-			cancel_delayed_work(&ieee->associate_retry_wq);
-			rtllib_stop_scan(ieee);
-			netif_carrier_off(dev);
-			mutex_unlock(&ieee->wx_mutex);
-		} else {
-			netdev_info(dev, "ieee->link_state is NOT LINKED\n");
-			rtllib_softmac_stop_protocol(priv->rtllib, 0, true);
-		}
-
-		rtl92e_dm_backup_state(dev);
-
-		mutex_unlock(&priv->wx_mutex);
-		reset_status = _rtl92e_up(dev, true);
-
-		if (reset_status == -1) {
-			if (reset_times < 3) {
-				reset_times++;
-				goto RESET_START;
-			} else {
-				netdev_warn(dev, "%s():	Reset Failed\n",
-					    __func__);
-			}
-		}
-
-		ieee->is_silent_reset = 1;
-
-		spin_lock_irqsave(&priv->rf_ps_lock, flag);
-		priv->rf_change_in_progress = false;
-		spin_unlock_irqrestore(&priv->rf_ps_lock, flag);
-
-		rtl92e_enable_hw_security_config(dev);
-
-		if (ieee->link_state == MAC80211_LINKED && ieee->iw_mode ==
-		    IW_MODE_INFRA) {
-			ieee->set_chan(ieee->dev,
-				       ieee->current_network.channel);
-
-			schedule_work(&ieee->associate_complete_wq);
-
-		}
-
-		rtl92e_cam_restore(dev);
-		rtl92e_dm_restore_state(dev);
-END:
-		priv->rst_progress = RESET_TYPE_NORESET;
-		priv->reset_count++;
-		priv->reset_in_progress = false;
-
-		rtl92e_writeb(dev, UFWP, 1);
 	}
+	return;
 }
 
 static void _rtl92e_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
@@ -1114,7 +1010,6 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 				  struct r8192_priv, watch_dog_wq);
 	struct net_device *dev = priv->rtllib->dev;
 	struct rtllib_device *ieee = priv->rtllib;
-	enum reset_type ResetType = RESET_TYPE_NORESET;
 	static u8 check_reset_cnt;
 	unsigned long flags;
 	struct rt_pwr_save_ctrl *psc = (struct rt_pwr_save_ctrl *)
@@ -1232,13 +1127,11 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	spin_lock_irqsave(&priv->tx_lock, flags);
 	if ((check_reset_cnt++ >= 3) && (!ieee->is_roaming) &&
 	    (!priv->rf_change_in_progress) && (!psc->bSwRfProcessing)) {
-		ResetType = _rtl92e_if_check_reset(dev);
+		_rtl92e_if_check_reset(dev);
 		check_reset_cnt = 3;
 	}
 	spin_unlock_irqrestore(&priv->tx_lock, flags);
 
-	if ((priv->force_reset || ResetType == RESET_TYPE_SILENT))
-		_rtl92e_if_silent_reset(dev);
 	priv->force_reset = false;
 	priv->reset_in_progress = false;
 }
-- 
2.42.0

