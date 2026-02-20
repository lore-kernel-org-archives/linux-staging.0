Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF43164D4
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604240; cv=none; b=Pjng1KM0LOXyl1wo0mDHpxBDGLHYnVdhwMXJllPIagtSJf2pJM4l7DKqkV1FTadiI1lUdAPYQLJRLWDgJpR/yKMSE8jjuqp8MZRMkcuf5P4VNAzilhvlDdsjsYFV27dHWG0m97OFFzreu54cEZZRwxMqJM+B6hhlTNPKdcO1zL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604240; c=relaxed/simple;
	bh=MiV0mdsMmK2Umppo6mKgO9ZeuR/ly0co6Nc9kftdTEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5aAqIfSEzNOcz0qsSTqxbSDsoaRYQ4GPGa0HUc/Q47fIc3GCwA6E+4zTusgHrVYAbcwNs4N7KlzgfRncBM6x8q/ZUkyKF6AXa9mlJ2BwQi96M8wrJ//iB6ubOqZ9msUOqx+DngpZOaEUVh9HqDObJp67kG51g0SJyx5TgoBgR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=R6BYw15n; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="R6BYw15n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604237; bh=MiV0mdsMmK2Umppo6mKgO9ZeuR/ly0co6Nc9kftdTEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R6BYw15nlx/sIHEirGfjUTz9XbHPnBUelPcJm6cDVpQfwEaPGE6Rw2KPfrT7WOSX9
	 j4HARRZr6OTQB0QH3gOcx8sUbXUvtUuEjeFnsQ+lPSeGUB5NJqQ4OQXGzIovampjwK
	 MUJtN9oJFlAVb0cJU02FPEIxvwpnjUjhdSb2cqWHtxO1rvss9nzAD91l/Pz5Afa9pv
	 HguYCB8JgrSjV9DsocTiF83fYFextt0M+vucbjkEN6t7VDXgY54L33nGDVrrBz5gYz
	 ACwrx+LEN/sfUpULIMtS6kAohDy2fxZMfEhSyjeQ3lub3XjeDAqkFppyJbdsdIS/pE
	 58ppJlKQmfaJA==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id 9390F406A0;
	Fri, 20 Feb 2026 16:17:17 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ignacio Pena <ignacio.pena87@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: rtl8723bs: Drop workqueue wrapper functions
Date: Fri, 20 Feb 2026 18:15:19 +0200
Message-ID: <20260220161611.2398915-9-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220161611.2398915-1-plaes@plaes.org>
References: <20260220161611.2398915-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
+		schedule_work(&pwrctl->cpwm_event);
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

