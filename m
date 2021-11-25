Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835E02C82
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:25:31 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqHYu-0006jj-8L; Thu, 25 Nov 2021 17:25:28 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: remove the _set_workitem wrapper
Date: Thu, 25 Nov 2021 17:25:10 +0100
Message-Id: <20211125162513.25039-2-martin@kaiser.cx>
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

Remove the _set_workitem wrapper and call schedule_work directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c          | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 0e3453639a8b..d48ed98453f5 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -12,7 +12,7 @@ void BlinkTimerCallback(struct timer_list *t)
 	if ((padapter->bSurpriseRemoved) || (padapter->bDriverStopped))
 		return;
 
-	_set_workitem(&pLed->BlinkWorkItem);
+	schedule_work(&pLed->BlinkWorkItem);
 }
 
 void BlinkWorkItemCallback(struct work_struct *work)
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index f6f5e4581212..766440461a0c 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -79,11 +79,6 @@ static inline void _init_workitem(struct work_struct *pwork, void *pfunc, void *
 	INIT_WORK(pwork, pfunc);
 }
 
-static inline void _set_workitem(struct work_struct *pwork)
-{
-	schedule_work(pwork);
-}
-
 static inline void _cancel_workitem_sync(struct work_struct *pwork)
 {
 	cancel_work_sync(pwork);
-- 
2.20.1

