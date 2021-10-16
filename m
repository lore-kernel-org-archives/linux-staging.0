Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8102C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:11:14 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id i20so46947114edj.10
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lZr1SNSUmJxs5qbwVaLzSk5qFj0BWBKgzlDwaUzb+9k=;
        b=S1bNDQ4QsMHlxND9MrxLqBDsOgLMeZUnLS3kGI0bOnUHgAR563TxnD3Sba8ZxZy/PP
         oygex4cb/0NJtdh9ZANK2l/KdvqqaZkyau5Sevu+v+dOE5w9MiaAHGgTYF6w0gxWt1/b
         BW5gItwbLl05L9wYUazDzr5BNluwvimw3gSbKd4NHP9oQVoLXYIVs68mYV1cFnI+nyJA
         JLR24RogjHF/3I3fbW9qLI8fiLjr8Lh7e8K9aB8aw2DEoG1RX4kE8Lohgy7LjAHlSCmW
         JnEyy46ECWGG+G+HjWC5xcGK5jrjyXFabfqJh7gSpPxnqLdwejV/d9uP8lx48Oq7NZw4
         qB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZr1SNSUmJxs5qbwVaLzSk5qFj0BWBKgzlDwaUzb+9k=;
        b=YEI9Kd+piaORKUSd0pXOgSCN4Dcyqw6/pZb24mptLFpxiIgewylwq0TR8uRiYRAmd6
         0p7CnrxQA53NMaush9ssC5pb9a8wN2LmJPjmlFQ+WQr8zR4Q7W7q5iWsA/LA21JPFI0v
         B3UuRhH91BqwD9QHd+gnn2Ui/fMyuv0wf217s7BmkK8CpxMMpuiHsr5Us6SG5NHDdWAv
         qW4lwAR3j8L8SkHsKiPBLTCCvnnHQ83FVSd6FsJmZIDiCa1y6MeqUK1mNLWcepPSIyB5
         qPVcBDrLDH5kYo0PqviuThPrqpIGUt32JGRD/vxWNILB6BapNxaGp3l89B6ddQt2p7VY
         5SrQ==
X-Gm-Message-State: AOAM530m9hKHp2IRLRJ2bXSyLGGlB7vikqNzt4R30I++LQNXm9QD5eIm
	Ii+CamafNuMiPuico7c/jbBBIrSSdoI=
X-Google-Smtp-Source: ABdhPJyNOR1pIOw4gy6uHxOjUrsoSYTNCzKpMO6z21BMs4dIhlkc4ID9fdZFi9kmfDher0qQcLi5TA==
X-Received: by 2002:a17:906:4a09:: with SMTP id w9mr13158522eju.419.1634375473168;
        Sat, 16 Oct 2021 02:11:13 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id o15sm5934723ejj.10.2021.10.16.02.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 02:11:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: Use completions for signaling start and end kthread
Date: Sat, 16 Oct 2021 11:10:40 +0200
Message-Id: <20211016091042.19614-2-fmdefrancesco@gmail.com>
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

rtw_cmd_thread() "up(s)" a semaphore twice, first to notify callers when
its execution has started and then to notify when it is about to end.

It makes the same semaphore go "up" twice in the same kthread. This
construct makes Smatch to warn of duplicate "up(s)".

This kthread uses interruptible semaphores where instead completions are
more suitable. For this purpose it calls an helper (_rtw_down_sema())
that returns values that are never checked. It may lead to bugs.

To address the above-mentioned issues, use two completions variables
instead of semaphores. Use the uninterruptible versions of
wait_for_completion*() because the interruptible / killable versions are
not necessary.

Tested with "ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano]".

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 7 ++++---
 drivers/staging/r8188eu/include/rtw_cmd.h | 3 ++-
 drivers/staging/r8188eu/os_dep/os_intfs.c | 6 ++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e17332677daa..195390449502 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -23,7 +23,8 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 
 	sema_init(&pcmdpriv->cmd_queue_sema, 0);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
-	sema_init(&pcmdpriv->terminate_cmdthread_sema, 0);
+	init_completion(&pcmdpriv->start_cmd_thread);
+	init_completion(&pcmdpriv->stop_cmd_thread);
 
 	rtw_init_queue(&pcmdpriv->cmd_queue);
 
@@ -248,7 +249,7 @@ int rtw_cmd_thread(void *context)
 	pcmdbuf = pcmdpriv->cmd_buf;
 
 	pcmdpriv->cmdthd_running = true;
-	up(&pcmdpriv->terminate_cmdthread_sema);
+	complete(&pcmdpriv->start_cmd_thread);
 
 	while (1) {
 		if (_rtw_down_sema(&pcmdpriv->cmd_queue_sema) == _FAIL)
@@ -329,7 +330,7 @@ int rtw_cmd_thread(void *context)
 		rtw_free_cmd_obj(pcmd);
 	} while (1);
 
-	up(&pcmdpriv->terminate_cmdthread_sema);
+	complete(&pcmdpriv->stop_cmd_thread);
 
 	thread_exit();
 }
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 83fbb922db2c..b6266e3e2c40 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -34,7 +34,8 @@ struct cmd_obj {
 
 struct cmd_priv {
 	struct semaphore cmd_queue_sema;
-	struct semaphore terminate_cmdthread_sema;
+	struct completion start_cmd_thread;
+	struct completion stop_cmd_thread;
 	struct __queue cmd_queue;
 	u8	cmd_seq;
 	u8	*cmd_buf;	/* shall be non-paged, and 4 bytes aligned */
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index e7964a048c99..0bcea66f550b 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -385,7 +385,8 @@ u32 rtw_start_drv_threads(struct adapter *padapter)
 	if (IS_ERR(padapter->cmdThread))
 		_status = _FAIL;
 	else
-		_rtw_down_sema(&padapter->cmdpriv.terminate_cmdthread_sema); /* wait for cmd_thread to run */
+		/* wait for rtw_cmd_thread() to start running */
+		wait_for_completion(&padapter->cmdpriv.start_cmd_thread);
 
 	return _status;
 }
@@ -395,7 +396,8 @@ void rtw_stop_drv_threads(struct adapter *padapter)
 	/* Below is to termindate rtw_cmd_thread & event_thread... */
 	up(&padapter->cmdpriv.cmd_queue_sema);
 	if (padapter->cmdThread)
-		_rtw_down_sema(&padapter->cmdpriv.terminate_cmdthread_sema);
+		/* wait for rtw_cmd_thread() to stop running */
+		wait_for_completion(&padapter->cmdpriv.stop_cmd_thread);
 }
 
 static u8 rtw_init_default_value(struct adapter *padapter)
-- 
2.33.0

