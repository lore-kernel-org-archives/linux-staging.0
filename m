Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C542EB860
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771701026; cv=none; b=qtHzaOacToRcKEMSoUdmxDsOcINfQyx4v3Ij654UX/3dnnXmChaWqPifniySeVssa1B8iblAdsqs5CUs415ayOAd4Dqy+q1/eKn6fDN43almxicZhxrsbChpknvZko4OipfAa3wro9XgoPKmxQiWa63+104L7ED9zZiRUT0JXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771701026; c=relaxed/simple;
	bh=JxUfkBhilVvOHdFurYyaFG+IeFm8x975Z0QcPNTfezg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ktobebfz1kotW0kxUCu4pipohxdhYewmcG4o5PARkuJ+/d9daYaaY84w9acfrrfiJadr4foYWyjIaE+FpOITYM0vEk0o7Rr9lKva1BZAjcClfqQ+Z7DtRHHGSHK6vxZelaf6fbaXYuqxWAZRdIQmbu8axF5HlJiwr0D9MiuD/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=UsvPUvtL; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="UsvPUvtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771701023; bh=JxUfkBhilVvOHdFurYyaFG+IeFm8x975Z0QcPNTfezg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UsvPUvtLGsUGfQW33XPXG01VAl4Fibqav3q4g9DeNqO8O8JsBo8/m9YdFpjMXmq9j
	 ALDUFpbjoznU/VfAIogIloWUMJ7HMPGycoA/NNpl41uQG/iHjgp/lCkA5KVTwBZ0bH
	 seNKOSeDtKoHnTcqC51TK7NYz1SZj6j77X2K8yzCo8JCOhyToLQcpmxBhrRuq4HgHJ
	 Z+XL4Vstq693+izscJt9Okc1A2dV1zI5h5epDrPuTA4+xyLQoZAdJwYFvYP8N6074j
	 1qF/Kn6n4aqrPFTMEeS35sOCIwMnue8RQpNg3gB00EblqsD826QEVi2KlqNIOOQVHo
	 e5QQUoEBvOu5w==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id 6A96E400D2;
	Sat, 21 Feb 2026 19:10:23 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Philip Thayer <thayerscirez@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/11] staging: rtl8723bs: Drop workqueue wrapper functions
Date: Sat, 21 Feb 2026 21:01:38 +0200
Message-ID: <20260221190628.50273-9-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221190628.50273-1-plaes@plaes.org>
References: <20260221190628.50273-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom workqueue wrapper functions:
* _init_workitem -> INIT_WORK
* _cancel_workitem_sync -> cancel_work_sync
* _set_workitem -> schedule_work

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c          |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      |  6 +++---
 drivers/staging/rtl8723bs/hal/sdio_ops.c          |  4 ++--
 .../rtl8723bs/include/osdep_service_linux.h       | 15 ---------------
 4 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b2e7f479f72b..d0694a659259 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -201,7 +201,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	atomic_set(&pevtpriv->event_seq, 0);
 	pevtpriv->evt_done_cnt = 0;
 
-	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
+	INIT_WORK(&pevtpriv->c2h_wk, c2h_wk_callback);
 	pevtpriv->c2h_wk_alive = false;
 	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 	if (!pevtpriv->c2h_queue)
@@ -212,7 +212,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
-	_cancel_workitem_sync(&pevtpriv->c2h_wk);
+	cancel_work_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
 		msleep(10);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732687..c93c7357b3f0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -670,7 +670,7 @@ static void pwr_rpwm_timeout_handler(struct timer_list *t)
 	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
 		return;
 
-	_set_workitem(&pwrpriv->rpwmtimeoutwi);
+	schedule_work(&pwrpriv->rpwmtimeoutwi);
 }
 
 static inline void register_task_alive(struct pwrctrl_priv *pwrctrl, u32 tag)
@@ -971,11 +971,11 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_RPWM, (u8 *)(&pwrctrlpriv->rpwm));
 
-	_init_workitem(&pwrctrlpriv->cpwm_event, cpwm_event_callback, NULL);
+	INIT_WORK(&pwrctrlpriv->cpwm_event, cpwm_event_callback);
 
 	pwrctrlpriv->brpwmtimeout = false;
 	pwrctrlpriv->adapter = padapter;
-	_init_workitem(&pwrctrlpriv->rpwmtimeoutwi, rpwmtimeout_workitem_callback, NULL);
+	INIT_WORK(&pwrctrlpriv->rpwmtimeoutwi, rpwmtimeout_workitem_callback);
 	timer_setup(&pwrctrlpriv->pwr_rpwm_timer, pwr_rpwm_timeout_handler, 0);
 	timer_setup(&pwrctrlpriv->pwr_state_check_timer,
 		    pwr_state_check_handler, 0);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 6bfb8c0e519c..ea373276f9cd 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -876,7 +876,7 @@ void sd_int_dpc(struct adapter *adapter)
 
 		SdioLocalCmd52Read1Byte(adapter, SDIO_REG_HCPWM1_8723B);
 
-		_set_workitem(&(pwrctl->cpwm_event));
+		schedule_work(&(pwrctl->cpwm_event));
 	}
 
 	if (hal->sdio_hisr & SDIO_HISR_TXERR) {
@@ -912,7 +912,7 @@ void sd_int_dpc(struct adapter *adapter)
 		} else {
 			/* Error handling for malloc fail */
 			rtw_cbuf_push(adapter->evtpriv.c2h_queue, NULL);
-			_set_workitem(&adapter->evtpriv.c2h_wk);
+			schedule_work(&adapter->evtpriv.c2h_wk);
 		}
 	}
 
diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
index c8274da940ff..ebaa2f1d4af7 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
@@ -58,21 +58,6 @@ static inline void _set_timer(struct timer_list *ptimer, u32 delay_time)
 	mod_timer(ptimer, (jiffies + (delay_time * HZ / 1000)));
 }
 
-static inline void _init_workitem(struct work_struct *pwork, void *pfunc, void *cntx)
-{
-	INIT_WORK(pwork, pfunc);
-}
-
-static inline void _set_workitem(struct work_struct *pwork)
-{
-	schedule_work(pwork);
-}
-
-static inline void _cancel_workitem_sync(struct work_struct *pwork)
-{
-	cancel_work_sync(pwork);
-}
-
 static inline int rtw_netif_queue_stopped(struct net_device *pnetdev)
 {
 	return (netif_tx_queue_stopped(netdev_get_tx_queue(pnetdev, 0)) &&
-- 
2.53.0

