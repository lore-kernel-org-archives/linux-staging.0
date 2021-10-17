Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845262C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 14:28:35 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 5so29587325edw.7
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VMkDUCm16/LUUgJOBcLWZuUN1/iLLBPOlfRNhPBC994=;
        b=eo/dNwDGp4mkCRYFmm0lB+TQl2xlpftB+kG4oiAzE3cmE5W1fW6RJZnvMCadCj32um
         oQrPiWsoWzY94aMwPuUa2L/os0dv/gInQKp8uz6ZhRgU4njn7E8PPxdgfhHe36mGaxOo
         gMWkWmQp8E6/iM7WHUvTX8DLq48LfRLeRaXmfEhyMRLo+wF5Qux9go+qPx45epBt3sqt
         5In6YCEtnRXOPWRWaznvOwUd9fphsqETrzrx/1H9beoZyDMGkETCgp4RUFXSUgzMSvPJ
         QFGnoMh3YYMonOkzweLeMws2QCCbdM5zuC95Sa8yOIGLFt/YEL7LOFa7uYt0LycqQZ1g
         d78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VMkDUCm16/LUUgJOBcLWZuUN1/iLLBPOlfRNhPBC994=;
        b=W6v1can7DJ3zdAAeSXGcv5Mq7LFtAqxlryj8PTGSXgowdTjm8nf855Lc3pwIBx3H9s
         +f9z4t9KjFly1aCZ6UHu1OO7s4r2s3ZTN+Ech2NKv0TeJsMw6kmC96gwjuFzRLiyICPT
         H2EkA5YRPD0YsVERh/TxN0qXQDnV2FQwF+U2C/mnFgGA8ba+vZR9qDXCSL1RyR2UZ//f
         z7Q6r21PJThbLdWTnnUFi4NRBxfsf8dfY3E08lQHcuqd8Dl+QMZ56TUKL1pX8tfBDW5W
         /ZUVVByN8oytoS37vxSnldMAAEXsx1l0nATIlkjFtx+xj3qrdlaFMZ1v5jS3NaadsnDG
         cVqQ==
X-Gm-Message-State: AOAM531LfnxNbe7EbhbdLs2+zZvdVcMzcOFKb89hTmAZZBC/56CUAhm4
	EAqFrAi++z05SNkOK0KfJsIp5xz8Pa8=
X-Google-Smtp-Source: ABdhPJwkAcgWdpSD5YNV8E3AqEBp1s/4I09R6T/zSdp3T2sEMG7IZJTT3hXrgmRU4dbO1wA227YOwg==
X-Received: by 2002:a05:6402:32c:: with SMTP id q12mr32293708edw.378.1634480913885;
        Sun, 17 Oct 2021 07:28:33 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id p23sm9094537edw.94.2021.10.17.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:28:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 2/3] staging: r8188eu: Use completions for signaling enqueueing
Date: Sun, 17 Oct 2021 16:28:11 +0200
Message-Id: <20211017142812.4656-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017142812.4656-1-fmdefrancesco@gmail.com>
References: <20211017142812.4656-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_enqueue_cmd() uses a semaphore to notify rtw_cmd_thread() that it
has enqueued commands. rtw_cmd_thread() "down(s)" in interruptible mode
to wait to be notified.

Use completion variables because they are better suited for the purpose.

In rtw_cmd_thread(), wait in uninterruptible mode, even if the original
code uses down_interruptible(), because the interruption of
rtw_cmd_thread() is not allowed and unwanted.

Acked-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 7 +++----
 drivers/staging/r8188eu/include/rtw_cmd.h | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 195390449502..6fb79d711692 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -21,7 +21,7 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	int res = _SUCCESS;
 
-	sema_init(&pcmdpriv->cmd_queue_sema, 0);
+	init_completion(&pcmdpriv->enqueue_cmd);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
 	init_completion(&pcmdpriv->start_cmd_thread);
 	init_completion(&pcmdpriv->stop_cmd_thread);
@@ -198,7 +198,7 @@ u32 rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 	res = _rtw_enqueue_cmd(&pcmdpriv->cmd_queue, cmd_obj);
 
 	if (res == _SUCCESS)
-		up(&pcmdpriv->cmd_queue_sema);
+		complete(&pcmdpriv->enqueue_cmd);
 
 exit:
 
@@ -252,8 +252,7 @@ int rtw_cmd_thread(void *context)
 	complete(&pcmdpriv->start_cmd_thread);
 
 	while (1) {
-		if (_rtw_down_sema(&pcmdpriv->cmd_queue_sema) == _FAIL)
-			break;
+		wait_for_completion(&pcmdpriv->enqueue_cmd);
 
 		if (padapter->bDriverStopped ||
 		    padapter->bSurpriseRemoved) {
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index b6266e3e2c40..47c3c80cc24a 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -33,7 +33,7 @@ struct cmd_obj {
 };
 
 struct cmd_priv {
-	struct semaphore cmd_queue_sema;
+	struct completion enqueue_cmd;
 	struct completion start_cmd_thread;
 	struct completion stop_cmd_thread;
 	struct __queue cmd_queue;
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 0bcea66f550b..96e9897085fe 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -394,7 +394,7 @@ u32 rtw_start_drv_threads(struct adapter *padapter)
 void rtw_stop_drv_threads(struct adapter *padapter)
 {
 	/* Below is to termindate rtw_cmd_thread & event_thread... */
-	up(&padapter->cmdpriv.cmd_queue_sema);
+	complete(&padapter->cmdpriv.enqueue_cmd);
 	if (padapter->cmdThread)
 		/* wait for rtw_cmd_thread() to stop running */
 		wait_for_completion(&padapter->cmdpriv.stop_cmd_thread);
-- 
2.33.0

