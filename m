Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0E772
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 11:03:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id ec8so36588554edb.6
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 04:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b6vSL2TaHk4f5VyyfBBfiPqOex1pQv9XVqbuGM1Nzks=;
        b=dlQ5ko2tTQ+2yjfKscMdxyLodnebmkVd6Naj22fr9hTrqt4vSpXBJDCbTmuk6px7M2
         oimLiTVr1nPm/9REJzy5pF4vE9c0YMzAweXVlB7tecdJfZzHTMN//mzhckl1RUlIssqP
         mft5exblCl3z8HyS1zIkej+FBmfn3rjsp363QFvkmod7oA/XabTy80QdgbIyVox1Nf9V
         gp3RkXiq3c2x4ctwR9PFh3BxLnKOsgoLgVUzvfRUu2Ldsh6/MlVkP26I4kqQFZV7M8lX
         admTbuYxyq0JMYYIHOtn9OKyqt9t7hGYsiX7KF7s+ofto49X9K8ql7c4fvLuHEhA5ssx
         Vgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b6vSL2TaHk4f5VyyfBBfiPqOex1pQv9XVqbuGM1Nzks=;
        b=lE4TsjTQY4ACUFqsGE215vdr3WLx5+T+YR3yeeFVFluqrbV+mwq9BrJLV/4DECgpO5
         2MMPkw2KlYxTb8YBBTlU82C+ZH6bfeNI41uvZJM4laiJbVaQv9FgUxo/Q21aGYN3tQ3I
         M2/o43Je6h3vGeaoU0cHBWREe6xev8muYfmaVBZ0zB8K67zGEbWZqIsLXlZU65AwVwcF
         yihTKrbxkgYFfWgtG2XZkdyob34pJDvx8Z86C0kCqFBqU6Gpv04ga0jHTaqjkJhcrlol
         dCLXCobuAUtLU6XY6mMwzowUcueZHTef1SEAF9cojTFsotQIgWK+J6p8U5VWmq2oZYEp
         yHdg==
X-Gm-Message-State: AOAM5319weqqtbQJMFl1utXM/TkJ8I+Qt+/DANIiVDh+Cwo4TdvOz5OQ
	gYOZxKJQI0NsTjUdhGldIK0=
X-Google-Smtp-Source: ABdhPJw8gN9YmA+pXpY97vQOGFgMkgRDQAM4cpLGl9OpQPUGd+lXQ3BP8hRHGFU5dAxRgoWRkwpr4g==
X-Received: by 2002:a05:6402:5187:: with SMTP id q7mr16619531edd.374.1634295780348;
        Fri, 15 Oct 2021 04:03:00 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id w11sm4477283edl.87.2021.10.15.04.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 04:02:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [RFC PATCH] staging: r8188eu: Use completions instead of semaphores
Date: Fri, 15 Oct 2021 13:02:38 +0200
Message-Id: <20211015110238.1819-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_cmd_thread() "up(s)" a semaphore twice, first to notify callers when
its execution is started and then to notify when it is about to end.

It makes the same semaphore go "up" twice in the same thread. This
construct makes Smatch to warn of duplicate "up(s)".

This thread uses interruptible semaphores where instead completions are
more suitable. For this purpose it calls an helper (_rtw_down_sema())
that returns values that are never checked. It may lead to bugs.

To address the above-mentioned issues, use two completions variables
instead of semaphores. Use the uninterruptible versions of
wake_for_completion*() because the interruptible / killable versions are
not necessary.

Tested with "ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano]".

This is an RFC patch because I'm not sure that changing this code
from using semaphores to using completions variables is actually required.
After all, the code was working properly with semaphores and, at the same
time, I'm not sure if the Smatch warning about duplicate "up(s)" should
actually be addressed.

I'm waiting for Maintainers and other Reviewers to say if this patch is
actually needed and, if so, also for suggestions about how to improve
it. In particular I'm interested to know what they think of using the
uninterruptible version of wait_for_completion*().

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

