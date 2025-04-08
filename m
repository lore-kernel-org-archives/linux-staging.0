Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A03425291E
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 23:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154743; cv=none; b=g2u4Wl3XWJ6EiBaKOMi3M13o9O4/0naI0IHGcOLSs8bCjZ48gxqDiAfLX9SQjNV3m0e47bQL6W0frkUnQ0IPbnjXAEYlWpMBoWSaaIr16kvyXSfRjSwTK8ro6nc2cIr9gUC3xfgEgUubZ/lY2X0Gv9R/jFgVnUWxBcLXiOMyFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154743; c=relaxed/simple;
	bh=640QD7k20bcrdYb6D3bMaDTYP6L0i7TB5oP6rPlUONU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNWIpeDjpgpGOOT9TZbLZL/C55Nlb4F9SwV+B8AOxs9Q7HhxoUR2BA2XldPy/KMBAY0hzbuIOMMKO8TmjljrceDU/nzy55krFyFDVv0yCnqQ+f/uvkF3xqCcuWOz43YJNkvdptVnhQY0toYGvKpal4/ejXzsxmEBdfqv9+E++64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=RsCMTum/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="RsCMTum/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7376e311086so8205868b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154740; x=1744759540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn6fMxD+cDOZwdFvmm5E80ak9T8erorYNtCsqpyQQZ0=;
        b=RsCMTum/LkDtyFKOMSgnjykbDCjAYI9UYgQiXc55YgOVVMjgd5glDxwh+PkKVuEp2Z
         hHurAulodX+L9AGILxWV+8D6yWpPZt7pzs2Uo4baTdPmAPg1EgLDpIRNjY9jqfeFnRfh
         8i/fV+V+9pmVmgJAMNCPnHVCcRAOyFphRmzy34ENSVMtKUtOe+orwyfxD0CpgbnkgrIq
         Ek4NItlqoq+llT/UaxMaIR8M2SndYO9HaWKU2x4dik1sOlaGmHl1PXJilznQ83e+BRpd
         p0Rj5CWW43Ng7e8V0QYAW/+5ynfWftXOaMpwc72u9yIfd8et8Xwkl4CBLJyWGPqu2B01
         CKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154740; x=1744759540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn6fMxD+cDOZwdFvmm5E80ak9T8erorYNtCsqpyQQZ0=;
        b=k8HFT4NfnGFaOafRVO8apZm78/GYB728FvN9n3I2CB7TVcIyHbGFqVLQPSbsxp41fF
         YqWouLxVLn3gVui9m8lA6+uYH3hpT28uOh0GlBV8p+3Nit25PPC0PLf3U8e/+rrCT48X
         0x0Gti++GvyyJY6hJgCSpKWttkGWFfLoy+ZxOYWW/wkkkDKaegtayd1zqxJVV38bVI7r
         nJD0oaqEj9zNs3kDbthdtf66AsmRA3OrWpmB//1v4f/lAmlrTf90okbmY8TZ/V2nrBTI
         XwbVU9o1QG8LGv/9x6ZiKRpFudoI97D+bC3ahls2PCKC0ICToobTfRBcoK5CBr8M5BaO
         s1Sg==
X-Gm-Message-State: AOJu0YxE9yxf21gLz+EuhjKancSRsOSS8iogU2rBNseNe1XJl5BLoHQW
	w0PRZqPcV6DgzGp9bQRDXoFfWqM8dD9rqsOHwxoY0m3c5q1GbNaFt3HThirdtg==
X-Gm-Gg: ASbGnctKstwLhz+pqtKyH3ijT2pZNEbTiVGFYJfX2Pqf2FL66QDt0jHEqqa5j9q0R6n
	YzDk8B8HxiQa3jmmAPddd2qbptGKklz8rCddnZKiz2Q4VcepmR2eKQm8aDi76KpFdhpP2IhcCmy
	s2mubDE4JNKpUNk/DIVNvGPX0IFklUHVqLEhTy/pS8J4A9nejJZ2YhG4hqMTdCSbnkxAPRJUL4L
	WESxSQ5Q12qDLN00oQWT6rNkp0NuibTPv/J3MUbJjsvrwqRDTeoW7FqXYzF5EeqUWySe+PcAif6
	TNH33WWx0GjU89OSAS8PQp3cueHE9SE7TfaRiEUKd9F/suOUo8V34XiKPJgU5d1GbHouy0U043Z
	pokL2tai/vw==
X-Google-Smtp-Source: AGHT+IGl1tqjm2dSiqFkQWDhXy72/QE2y9bkx/rWioiBktFdjQArXQAGyWkZqTAbFzcxtmVR/XhJlQ==
X-Received: by 2002:a05:6a21:6d81:b0:1f5:7e57:501c with SMTP id adf61e73a8af0-201592e0bc7mr970440637.39.1744154739951;
        Tue, 08 Apr 2025 16:25:39 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc3fd3fasm9505874a12.47.2025.04.08.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:39 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 1/7] staging: gpib: Removing typedef gpib_event_queue
Date: Tue,  8 Apr 2025 23:25:29 +0000
Message-ID: <20250408232535.187528-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_event_queue_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 10 +++++-----
 drivers/staging/gpib/include/gpibP.h      |  4 ++--
 drivers/staging/gpib/include/gpib_types.h |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index f2216768d8bd..684faa0c4547 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -74,7 +74,7 @@ static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
 static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board);
 
 static int pop_gpib_event_nolock(struct gpib_board *board,
-				 gpib_event_queue_t *queue, short *event_type);
+				 struct gpib_event_queue *queue, short *event_type);
 
 /*
  * Timer functions
@@ -1839,14 +1839,14 @@ static int select_device_path_ioctl(struct gpib_board_config *config, unsigned l
 	return 0;
 }
 
-unsigned int num_gpib_events(const gpib_event_queue_t *queue)
+unsigned int num_gpib_events(const struct gpib_event_queue *queue)
 {
 	return queue->num_events;
 }
 
 static int push_gpib_event_nolock(struct gpib_board *board, short event_type)
 {
-	gpib_event_queue_t *queue = &board->event_queue;
+	struct gpib_event_queue *queue = &board->event_queue;
 	struct list_head *head = &queue->event_head;
 	gpib_event_t *event;
 	static const unsigned int max_num_events = 1024;
@@ -1901,7 +1901,7 @@ int push_gpib_event(struct gpib_board *board, short event_type)
 EXPORT_SYMBOL(push_gpib_event);
 
 static int pop_gpib_event_nolock(struct gpib_board *board,
-				 gpib_event_queue_t *queue, short *event_type)
+				 struct gpib_event_queue *queue, short *event_type)
 {
 	struct list_head *head = &queue->event_head;
 	struct list_head *front = head->next;
@@ -1935,7 +1935,7 @@ static int pop_gpib_event_nolock(struct gpib_board *board,
 }
 
 // pop event from front of event queue
-int pop_gpib_event(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type)
+int pop_gpib_event(struct gpib_board *board, struct gpib_event_queue *queue, short *event_type)
 {
 	unsigned long flags;
 	int retval;
diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index c9cd1dbd7e6f..6461b330a3c3 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -25,9 +25,9 @@ struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsi
 struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
 				    unsigned int ss_device, struct pci_dev *from);
-unsigned int num_gpib_events(const gpib_event_queue_t *queue);
+unsigned int num_gpib_events(const struct gpib_event_queue *queue);
 int push_gpib_event(struct gpib_board *board, short event_type);
-int pop_gpib_event(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type);
+int pop_gpib_event(struct gpib_board *board, struct gpib_event_queue *queue, short *event_type);
 int gpib_request_pseudo_irq(struct gpib_board *board, irqreturn_t (*handler)(int, void *));
 void gpib_free_pseudo_irq(struct gpib_board *board);
 int gpib_match_device_path(struct device *dev, const char *device_path_in);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 0253ef2c94a3..66a1a1676f2b 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -178,14 +178,14 @@ struct gpib_interface {
 	unsigned skip_check_for_command_acceptors : 1;
 };
 
-typedef struct {
+struct gpib_event_queue {
 	struct list_head event_head;
 	spinlock_t lock; // for access to event list
 	unsigned int num_events;
 	unsigned dropped_event : 1;
-} gpib_event_queue_t;
+};
 
-static inline void init_event_queue(gpib_event_queue_t *queue)
+static inline void init_event_queue(struct gpib_event_queue *queue)
 {
 	INIT_LIST_HEAD(&queue->event_head);
 	queue->num_events = 0;
@@ -283,7 +283,7 @@ struct gpib_board {
 	/* autospoll kernel thread */
 	struct task_struct *autospoll_task;
 	/* queue for recording received trigger/clear/ifc events */
-	gpib_event_queue_t event_queue;
+	struct gpib_event_queue event_queue;
 	/* minor number for this board's device file */
 	int minor;
 	/* struct to deal with polling mode*/
-- 
2.43.0

