Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7829CA
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:25:32 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqHYv-0006jj-Bi; Thu, 25 Nov 2021 17:25:29 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: remove the _init_workitem wrapper
Date: Thu, 25 Nov 2021 17:25:11 +0100
Message-Id: <20211125162513.25039-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211125162513.25039-1-martin@kaiser.cx>
References: <20211125162513.25039-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the _init_workitem wrapper and call INIT_WORK directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_cmd.c          | 2 +-
 drivers/staging/r8188eu/core/rtw_led.c          | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 1f4cc321bd1a..fb8ba7ded489 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -69,7 +69,7 @@ static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	atomic_set(&pevtpriv->event_seq, 0);
 	pevtpriv->evt_done_cnt = 0;
 
-	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
+	INIT_WORK(&pevtpriv->c2h_wk, c2h_wk_callback);
 	pevtpriv->c2h_wk_alive = false;
 	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 
diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index d48ed98453f5..0aebdc3c497d 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -46,7 +46,7 @@ void InitLed871x(struct adapter *padapter, struct LED_871x *pLed, enum LED_PIN_8
 	ResetLedStatus(pLed);
 
 	timer_setup(&pLed->BlinkTimer, BlinkTimerCallback, 0);
-	_init_workitem(&pLed->BlinkWorkItem, BlinkWorkItemCallback, pLed);
+	INIT_WORK(&pLed->BlinkWorkItem, BlinkWorkItemCallback);
 }
 
 void DeInitLed871x(struct LED_871x *pLed)
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 766440461a0c..21e5cacbd893 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -74,11 +74,6 @@ static inline void _cancel_timer(struct timer_list *ptimer,u8 *bcancelled)
 #define RTW_TIMER_HDL_NAME(name) rtw_##name##_timer_hdl
 #define RTW_DECLARE_TIMER_HDL(name) void RTW_TIMER_HDL_NAME(name)(RTW_TIMER_HDL_ARGS)
 
-static inline void _init_workitem(struct work_struct *pwork, void *pfunc, void * cntx)
-{
-	INIT_WORK(pwork, pfunc);
-}
-
 static inline void _cancel_workitem_sync(struct work_struct *pwork)
 {
 	cancel_work_sync(pwork);
-- 
2.20.1

