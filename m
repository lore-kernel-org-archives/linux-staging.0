Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274942C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 18:14:10 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mboC7-0006wS-0v; Sat, 16 Oct 2021 20:14:07 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: r8188eu: don't accept SIGTERM for cmd thread
Date: Sat, 16 Oct 2021 20:13:43 +0200
Message-Id: <20211016181343.3686-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211016181343.3686-1-martin@kaiser.cx>
References: <20211016181343.3686-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment, our command thread can be killed by user space.

[root@host ]# kill `pidof RTW_CMD_THREAD`

The driver will then stop working until the module is unloaded
and reloaded.

Don't process SIGTERM in the command thread. Other drivers that have a
command thread don't process SIGTERM either.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_cmd.c          | 2 --
 drivers/staging/r8188eu/include/osdep_service.h | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e17332677daa..b834fac41627 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -243,8 +243,6 @@ int rtw_cmd_thread(void *context)
 	struct adapter *padapter = (struct adapter *)context;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	thread_enter("RTW_CMD_THREAD");
-
 	pcmdbuf = pcmdpriv->cmd_buf;
 
 	pcmdpriv->cmdthd_running = true;
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index ee8a64bb3126..886a1b6f30b4 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -160,11 +160,6 @@ static inline unsigned char _cancel_timer_ex(struct timer_list *ptimer)
 	return del_timer_sync(ptimer);
 }
 
-static __inline void thread_enter(char *name)
-{
-	allow_signal(SIGTERM);
-}
-
 static inline void flush_signals_thread(void)
 {
 	if (signal_pending (current))
-- 
2.20.1

