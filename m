Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148802C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:11:17 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y30so30181557edi.0
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=noJ+6MKLd69BWpaEP9lhlln8+JP2/hnwsE/lE4s1R4A=;
        b=hAbkhCFWAX7ZcYR2Iwl7rrsHi3KZgssOx5hSqAISpjEfzUDQnC7WWC8okObl4O8QOw
         fVwcMXz04CAdTfH5L+UaH5PcHOc5n74YxST47vVUqlkokBf61d2SeM/sPQmYfTnBmrMr
         5oiALLyUGmD0J7njzLbBs1xexB45dRCji4E76nS21S1p8SatI57+mfqBsZ/VMEZAZlNi
         vyzn7LcSjSD29Iy3jsQafDBg23nvRZBHfGGirqU5xEFWrNTQI0mt6ja3KQTQVMA4wqZ/
         CyMFtDf/zvyLTJDrTFHTsBtfyLOdHyRywyeN+zbCiVHZ2DaxZ8i1b+WDYK0duUgOi4sQ
         iuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=noJ+6MKLd69BWpaEP9lhlln8+JP2/hnwsE/lE4s1R4A=;
        b=YzyrXE42+PBMM626g1dgwOWs9vrfBBCut4+Aic+rumItw6yhgY9qyoytfNzano3I4f
         ZVL9gbG6L2W1BBxM5XOb9ydaxUy8ZXELCiTROXWMBqOmcGIBqT6n4owfvpOUQn1wWxd/
         acN248ZISdbs6EfsqhrOacYIiOOjcIWlW5f6yBmafHqY2RP93orz7kf0X52M5OhcLbWz
         6LW7WIJ0m/XeJI1uP4vQOeciA+sOlmW72TAkCstRvx9DaRivxeAYA/cZbvLDfpy/cJm9
         5tVv6Bd9jB87WR/EeiMd3lnvRcRH2si80vf1bsLyEZmpkF5a5/p5Rjd7t5K/m/HNpzse
         qDxQ==
X-Gm-Message-State: AOAM532o6Mko7Cqf+tfL4N+NHnR8jyQ73JMRtl7s7anNxjorvDu37llo
	0aKlReL94RABM+8/NbkxMDI=
X-Google-Smtp-Source: ABdhPJyu5VCnQPGUXhI8dJhImZ4FNIma94RgXDPr3XRZQTwVZUmNvCkHB/mZsxEEjh1my7JlgcxU/w==
X-Received: by 2002:a05:6402:254e:: with SMTP id l14mr24663445edb.199.1634375475472;
        Sat, 16 Oct 2021 02:11:15 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id o15sm5934723ejj.10.2021.10.16.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 02:11:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: Use completions for signaling enqueueing
Date: Sat, 16 Oct 2021 11:10:41 +0200
Message-Id: <20211016091042.19614-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016091042.19614-1-fmdefrancesco@gmail.com>
References: <20211016091042.19614-1-fmdefrancesco@gmail.com>
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

In rtw_cmd_thread(), wait in killable mode because there are no other
reasons to interrupt waiting if not for killing.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 6 +++---
 drivers/staging/r8188eu/include/rtw_cmd.h | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 195390449502..2900c31d8ec9 100644
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
 
@@ -252,7 +252,7 @@ int rtw_cmd_thread(void *context)
 	complete(&pcmdpriv->start_cmd_thread);
 
 	while (1) {
-		if (_rtw_down_sema(&pcmdpriv->cmd_queue_sema) == _FAIL)
+		if (wait_for_completion_killable(&pcmdpriv->enqueue_cmd))
 			break;
 
 		if (padapter->bDriverStopped ||
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

