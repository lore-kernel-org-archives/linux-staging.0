Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE172
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 20:26:51 +0000 (UTC)
Received: from dslb-188-104-057-152.188.104.pools.vodafone-ip.de ([188.104.57.152] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1leO6b-0003aS-6c; Wed, 05 May 2021 22:26:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/6] staging: rtl8188eu: don't block until cmdthread runs
Date: Wed,  5 May 2021 22:26:19 +0200
Message-Id: <20210505202622.11087-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505202622.11087-1-martin@kaiser.cx>
References: <20210505202622.11087-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_start_drv_threads starts a cmdthread that runs in a loop. It
reads a command from a queue and processes it. There's no need for
any synchronization when this thread is started.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_cmd.c    | 1 -
 drivers/staging/rtl8188eu/os_dep/os_intfs.c | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index 61d0342c76fc..955899f334e6 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -181,7 +181,6 @@ int rtw_cmd_thread(void *context)
 	allow_signal(SIGTERM);
 
 	pcmdpriv->cmdthd_running = true;
-	complete(&pcmdpriv->terminate_cmdthread_comp);
 
 	RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_,
 		 ("start r871x %s !!!!\n", __func__));
diff --git a/drivers/staging/rtl8188eu/os_dep/os_intfs.c b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
index 55ed721994a0..193895338cf0 100644
--- a/drivers/staging/rtl8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
@@ -330,9 +330,6 @@ static int rtw_start_drv_threads(struct adapter *padapter)
 					  "RTW_CMD_THREAD");
 	if (IS_ERR(padapter->cmdThread))
 		err = PTR_ERR(padapter->cmdThread);
-	else
-		/* wait for cmd_thread to run */
-		wait_for_completion_interruptible(&padapter->cmdpriv.terminate_cmdthread_comp);
 
 	return err;
 }
-- 
2.20.1

