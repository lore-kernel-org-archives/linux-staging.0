Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AE82FAF
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 16:59:30 +0000 (UTC)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lpZdw-0002hw-Oa; Sat, 05 Jun 2021 18:59:28 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 8/9] staging: rtl8188eu: use standard kthread handling
Date: Sat,  5 Jun 2021 18:58:57 +0200
Message-Id: <20210605165858.3175-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605165858.3175-1-martin@kaiser.cx>
References: <20210605165858.3175-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defines its own completion to wait until the command thread
is stopped. Use kthread_stop instead and check kthread_should_stop in
the thread's main loop. (For now, we keep the driver's "emergency exit"
via bDriverStopped/bSurpriseRemoved.)

To check if the command thread is running, the driver stores the thread's
task_struct and a boolean status variable. Remove this status and check the
task_struct directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_cmd.c    | 15 +++++----------
 drivers/staging/rtl8188eu/include/rtw_cmd.h |  2 --
 drivers/staging/rtl8188eu/os_dep/os_intfs.c | 15 +++++++++------
 3 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index b892763ce1ba..18eb87052f48 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -55,7 +55,6 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 void rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	init_completion(&pcmdpriv->cmd_queue_comp);
-	init_completion(&pcmdpriv->terminate_cmdthread_comp);
 
 	_rtw_init_queue(&pcmdpriv->cmd_queue);
 }
@@ -121,7 +120,7 @@ static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 		bAllow = true;
 
 	if ((!padapter->hw_init_completed && !bAllow) ||
-	    !pcmdpriv->cmdthd_running)	/* com_thread not running */
+	    !padapter->cmdThread) /* com_thread not running */
 		return _FAIL;
 	return _SUCCESS;
 }
@@ -181,9 +180,7 @@ int rtw_cmd_thread(void *context)
 
 	allow_signal(SIGTERM);
 
-	pcmdpriv->cmdthd_running = true;
-
-	while (1) {
+	do {
 		if (padapter->bDriverStopped || padapter->bSurpriseRemoved)
 			break;
 
@@ -223,16 +220,14 @@ int rtw_cmd_thread(void *context)
 
 		if (signal_pending(current))
 			flush_signals(current);
-	}
-	pcmdpriv->cmdthd_running = false;
+	} while (!kthread_should_stop());
 
 	/*  free all cmd_obj resources */
 	while ((pcmd = rtw_dequeue_cmd(&pcmdpriv->cmd_queue)))
 		rtw_free_cmd_obj(pcmd);
 
-	complete(&pcmdpriv->terminate_cmdthread_comp);
-
-	complete_and_exit(NULL, 0);
+	padapter->cmdThread = NULL;
+	return 0;
 }
 
 /*
diff --git a/drivers/staging/rtl8188eu/include/rtw_cmd.h b/drivers/staging/rtl8188eu/include/rtw_cmd.h
index 0261cd931c35..4e9cb93e4b8f 100644
--- a/drivers/staging/rtl8188eu/include/rtw_cmd.h
+++ b/drivers/staging/rtl8188eu/include/rtw_cmd.h
@@ -32,9 +32,7 @@ struct cmd_obj {
 
 struct cmd_priv {
 	struct completion cmd_queue_comp;
-	struct completion terminate_cmdthread_comp;
 	struct __queue cmd_queue;
-	u8 cmdthd_running;
 };
 
 #define init_h2fwcmd_w_parm_no_rsp(pcmd, pparm, code) \
diff --git a/drivers/staging/rtl8188eu/os_dep/os_intfs.c b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
index 5207cb0c60cd..9944011b52d3 100644
--- a/drivers/staging/rtl8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
@@ -316,6 +316,7 @@ struct net_device *rtw_init_netdev(void)
 	pnetdev->wireless_handlers = (struct iw_handler_def *)&rtw_handlers_def;
 
 	loadparam(padapter, pnetdev);
+	padapter->cmdThread = NULL;
 
 	return pnetdev;
 }
@@ -326,10 +327,11 @@ static int rtw_start_drv_threads(struct adapter *padapter)
 
 	RT_TRACE(_module_os_intfs_c_, _drv_info_, ("+%s\n", __func__));
 
-	padapter->cmdThread = kthread_run(rtw_cmd_thread, padapter,
-					  "RTW_CMD_THREAD");
-	if (IS_ERR(padapter->cmdThread))
+	padapter->cmdThread = kthread_run(rtw_cmd_thread, padapter, "RTW_CMD_THREAD");
+	if (IS_ERR(padapter->cmdThread)) {
 		err = PTR_ERR(padapter->cmdThread);
+		padapter->cmdThread = NULL;
+	}
 
 	return err;
 }
@@ -338,10 +340,11 @@ void rtw_stop_drv_threads(struct adapter *padapter)
 {
 	RT_TRACE(_module_os_intfs_c_, _drv_info_, ("+%s\n", __func__));
 
-	/* Below is to terminate rtw_cmd_thread & event_thread... */
+	if (!padapter->cmdThread)
+		return;
+
 	complete(&padapter->cmdpriv.cmd_queue_comp);
-	if (padapter->cmdThread)
-		wait_for_completion_interruptible(&padapter->cmdpriv.terminate_cmdthread_comp);
+	kthread_stop(padapter->cmdThread);
 }
 
 static u8 rtw_init_default_value(struct adapter *padapter)
-- 
2.20.1

