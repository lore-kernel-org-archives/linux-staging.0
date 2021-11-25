Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72C68
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:25:33 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqHYw-0006jj-Mz; Thu, 25 Nov 2021 17:25:30 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/4] staging: r8188eu: remove the _cancel_workitem_sync wrapper
Date: Thu, 25 Nov 2021 17:25:12 +0100
Message-Id: <20211125162513.25039-4-martin@kaiser.cx>
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

Remove the _cancel_workitem_sync wrapper and call
cancel_work_sync directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_cmd.c          | 2 +-
 drivers/staging/r8188eu/core/rtw_led.c          | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 4 ----
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index fb8ba7ded489..d0a61331b883 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -78,7 +78,7 @@ static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
-	_cancel_workitem_sync(&pevtpriv->c2h_wk);
+	cancel_work_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
 		msleep(10);
 
diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 0aebdc3c497d..ae46fd48f940 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -51,7 +51,7 @@ void InitLed871x(struct adapter *padapter, struct LED_871x *pLed, enum LED_PIN_8
 
 void DeInitLed871x(struct LED_871x *pLed)
 {
-	_cancel_workitem_sync(&pLed->BlinkWorkItem);
+	cancel_work_sync(&pLed->BlinkWorkItem);
 	_cancel_timer_ex(&pLed->BlinkTimer);
 	ResetLedStatus(pLed);
 }
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 21e5cacbd893..5d8b567a3165 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -74,10 +74,6 @@ static inline void _cancel_timer(struct timer_list *ptimer,u8 *bcancelled)
 #define RTW_TIMER_HDL_NAME(name) rtw_##name##_timer_hdl
 #define RTW_DECLARE_TIMER_HDL(name) void RTW_TIMER_HDL_NAME(name)(RTW_TIMER_HDL_ARGS)
 
-static inline void _cancel_workitem_sync(struct work_struct *pwork)
-{
-	cancel_work_sync(pwork);
-}
 /*  */
 /*  Global Mutex: can only be used at PASSIVE level. */
 /*  */
-- 
2.20.1

