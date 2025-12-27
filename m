Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EEA328B5B
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870881; cv=none; b=g5ywt5kJIuZFY/Asv7KdyzkiNdfZcanTjsD1i2IgQIC665jz8X4CnDTA21liCCPk1W8mLwk1Qw7f6J5JOgmZIeihLueDZerhFxYYRChugXCAgrYS750qJQyYPlPRE71G0j4Ibyp6eQ7yppY+a4aOG8tah9az88oKciPLiCosBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870881; c=relaxed/simple;
	bh=g4R7lvzIjn5AqNtoNsAYVXvWXv4EGNoZc5m1Jjnjhak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAGCQC6ACnaBoB/mpBmNxi9Iw2zg1WAJQOlTNE7Cxj5cB1725/TmeyldTNfr7RYznijUxFvEXbhjmc6NVYZ7aQvg2qY9IQ/26f1b2ul6yviXKWiMkkFculXBWWOwypn9qlzk5wOeTVtm861e1DRIL3idl2RHPvlKxv1ZUYLQ5RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gey9yaKX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gey9yaKX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso35208715e9.1
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870877; x=1767475677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbgDYBC+VpSK7y/JxttJrTw9FgG4uMsu7GIbYrvx9tY=;
        b=Gey9yaKX1DU6imlZDC3VtgiCUJHux8sgluWfthvJCD9qpqKH3BqM7xwzdYN9OgIDRP
         FNvMnnJaeQEoSwpxUYmYbP3Ha+dfvkNa5uhlM5I2sYsdwK6db2KnfU2dD0SriQ6adNLA
         zbfLndNF5HcDCr7izzLZD92TIwTef4HK7sYR+PNCdWtsnQrFzNjmOpdcA9Nnw3+u3anP
         A97oE5ORIevfvQHhBMD/0DUWlDlFeH9IEK2R6WkczCT5cR7v4BmbWs7XuYsC31H99Z0L
         lJhVZqDs6S5srHSQ1rNTa4Qd9zBFEmzsHdSd/y6euk4svMl1cbrHbbR1+mRW7lEje/zd
         rgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870877; x=1767475677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbgDYBC+VpSK7y/JxttJrTw9FgG4uMsu7GIbYrvx9tY=;
        b=TfdSW1Wx946fzjyVFx4LvNfieA1G+12RHslPGwHSeLbH2uyfGJ1Ucd3QGQAhmqS+R6
         vV6+1pu8gCemR9mte1F5lao73O/pWde7jAVhX1iO0szZKNExabQJOgOAZIBf1yUoZ+Ul
         UKj9M/TCS8N7PNCvKPjww2hbZy2oaOIS9Becz9L0seM1zBj9OVPr+h7lEsA2LseNXHKN
         cQFFOgRJnTLarzMvjJeeqIgfHQqxCFLEsZm/WiY2aFRTIAUsBn0luKZA97xehgB7OmWT
         p2KNXAWdjNJaISNXn6boOofY+6sYzTP9em2PWwQPPXnWWjO7MvJeDF3hLy6Oxg6QcJZg
         ibPw==
X-Forwarded-Encrypted: i=1; AJvYcCUXUPhrTpVfCQ5r3JmqRE/uylsLu2ii5Vp7WOKpsrODVKbFWgVEBbnddFuBWoHM4Xhv4s9CB2UlJHbEZz9G@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3WvsWVVzZrP4K2D74qJOTWiDLhALx1C0VmQnQPuv83jrFnEzx
	hzJTqYgvJvp2KGK/0xcgT8C6ZV4rrV0WK9dOOqmhC1RmBjjceGuf9kTP
X-Gm-Gg: AY/fxX5WzV0zA9c/Y5LRg/VgkixrEYnK+rY3sHpslddmFwMiVr78GKZXopj0uudsUpK
	8R3hns2pFhuB7qC6/RqZ/rO5vclLowI8wTrq3fr3VC8G8P6ZZ8CnFCGi8ICYJmhHmDLXO64Q38D
	Ae2tOnW561ggCucBiALAyN/bbRdD+cu+ZDL4OQ5pkPPgV5HKdMj2qKyQGgj+CiuXXURf8MUVl29
	6hFYOVrMiI9MAP5WQhGQyDW/Tqn7WjswmHB8kLhwWwUNYHjhTJVjicyjD4Co/ywNEn6jYfw0+Yi
	YQAY0rugLRJVdvezxFFI9fUok4R2/lExnX8y1yyR1TPLIH1utqgDjpu7Pzq/eXG38UCkqpkWRKt
	aoFZ8bvg54aQ4dXdsN1mY8ZqGZpqkjLAb68Nrw29+VFp8ztZaXPKS/pqTTQmdt/0EUf+am3Bpo+
	YxGAj32JBHblfVW+6eJto9
X-Google-Smtp-Source: AGHT+IEbWq4yTW3u8qCnDpUbORvSRb4NZt4rSdm7NjJXGh/uo2D7ABpBgyf/vXDj7WfyXzHRF1BnPw==
X-Received: by 2002:a05:600c:3106:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-47d195a0feamr306789345e9.33.1766870877205;
        Sat, 27 Dec 2025 13:27:57 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:57 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 8/9] staging: axis-fifo: Remove redundant comments
Date: Sat, 27 Dec 2025 23:26:39 +0200
Message-ID: <20251227212640.3321310-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
References: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop banner-style section header comments and also remove comments
around self-explanatory code to reduce clutter and improve
readability.

No functional changes.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 105 +++-----------------------
 1 file changed, 10 insertions(+), 95 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index bce32e9da347..adb2e872e692 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -9,11 +9,6 @@
  * See Xilinx PG080 document for IP details
  */
 
-/* ----------------------------
- *           includes
- * ----------------------------
- */
-
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -34,22 +29,12 @@
 #include <linux/debugfs.h>
 #include <linux/poll.h>
 
-/* ----------------------------
- *       driver parameters
- * ----------------------------
- */
-
 #define DRIVER_NAME "axis_fifo"
 
 #define READ_BUF_SIZE 128U /* read buffer length in words */
 
 #define AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN	4
 
-/* ----------------------------
- *     IP register offsets
- * ----------------------------
- */
-
 #define XLLF_ISR_OFFSET  0x00000000  /* Interrupt Status */
 #define XLLF_IER_OFFSET  0x00000004  /* Interrupt Enable */
 
@@ -66,20 +51,10 @@
 #define XLLF_TDR_OFFSET  0x0000002C  /* Transmit Destination */
 #define XLLF_RDR_OFFSET  0x00000030  /* Receive Destination */
 
-/* ----------------------------
- *     reset register masks
- * ----------------------------
- */
-
 #define XLLF_RDFR_RESET_MASK        0x000000a5 /* receive reset value */
 #define XLLF_TDFR_RESET_MASK        0x000000a5 /* Transmit reset value */
 #define XLLF_SRR_RESET_MASK         0x000000a5 /* Local Link reset value */
 
-/* ----------------------------
- *       interrupt masks
- * ----------------------------
- */
-
 #define XLLF_INT_RPURE_MASK       0x80000000 /* Receive under-read */
 #define XLLF_INT_RPORE_MASK       0x40000000 /* Receive over-read */
 #define XLLF_INT_RPUE_MASK        0x20000000 /* Receive underrun (empty) */
@@ -92,26 +67,21 @@
 
 static DEFINE_IDA(axis_fifo_ida);
 
-/* ----------------------------
- *            types
- * ----------------------------
- */
-
 struct axis_fifo {
 	int id;
-	void __iomem *base_addr; /* kernel space memory */
+	void __iomem *base_addr;
 
-	unsigned int rx_fifo_depth; /* max words in the receive fifo */
-	unsigned int tx_fifo_depth; /* max words in the transmit fifo */
-	int has_rx_fifo; /* whether the IP has the rx fifo enabled */
-	int has_tx_fifo; /* whether the IP has the tx fifo enabled */
+	unsigned int rx_fifo_depth;
+	unsigned int tx_fifo_depth;
+	int has_rx_fifo;
+	int has_tx_fifo;
 
-	wait_queue_head_t read_queue; /* wait queue for asynchronos read */
+	wait_queue_head_t read_queue;
 	struct mutex read_lock; /* lock for reading */
-	wait_queue_head_t write_queue; /* wait queue for asynchronos write */
+	wait_queue_head_t write_queue;
 	struct mutex write_lock; /* lock for writing */
 
-	struct device *dt_device; /* device created from the device tree */
+	struct device *dt_device;
 	struct miscdevice miscdev;
 
 	struct dentry *debugfs_dir;
@@ -122,11 +92,6 @@ struct axis_fifo_debug_reg {
 	unsigned int offset;
 };
 
-/* ----------------------------
- *        implementation
- * ----------------------------
- */
-
 static void reset_ip_core(struct axis_fifo *fifo)
 {
 	iowrite32(XLLF_SRR_RESET_MASK, fifo->base_addr + XLLF_SRR_OFFSET);
@@ -167,10 +132,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	u32 tmp_buf[READ_BUF_SIZE];
 
 	if (f->f_flags & O_NONBLOCK) {
-		/*
-		 * Device opened in non-blocking mode. Try to lock it and then
-		 * check if any packet is available.
-		 */
 		if (!mutex_trylock(&fifo->read_lock))
 			return -EAGAIN;
 
@@ -179,10 +140,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 			goto end_unlock;
 		}
 	} else {
-		/* opened in blocking mode
-		 * wait for a packet available interrupt (or timeout)
-		 * if nothing is currently available
-		 */
 		mutex_lock(&fifo->read_lock);
 
 		ret = wait_event_interruptible(fifo->read_queue,
@@ -208,9 +165,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		goto err_flush_rx;
 	}
 
-	/* read data into an intermediate buffer, copying the contents
-	 * to userspace when the buffer is full
-	 */
 	copied = 0;
 	while (words_available > 0) {
 		copy = min(words_available, READ_BUF_SIZE);
@@ -282,10 +236,6 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		return -EINVAL;
 
 	if (f->f_flags & O_NONBLOCK) {
-		/*
-		 * Device opened in non-blocking mode. Try to lock it and then
-		 * check if there is any room to write the given buffer.
-		 */
 		if (!mutex_trylock(&fifo->write_lock))
 			return -EAGAIN;
 
@@ -295,11 +245,6 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 			goto end_unlock;
 		}
 	} else {
-		/* opened in blocking mode */
-
-		/* wait for an interrupt (or timeout) if there isn't
-		 * currently enough room in the fifo
-		 */
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
@@ -317,7 +262,6 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	for (int i = 0; i < words_to_write; ++i)
 		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
 
-	/* write packet size to fifo */
 	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
 
 	ret = len;
@@ -508,18 +452,12 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 static int axis_fifo_probe(struct platform_device *pdev)
 {
-	struct resource *r_mem; /* IO mem resources */
-	struct device *dev = &pdev->dev; /* OS device (from device tree) */
+	struct resource *r_mem;
+	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = NULL;
 	int rc = 0; /* error return value */
 	int irq;
 
-	/* ----------------------------
-	 *     init wrapper device
-	 * ----------------------------
-	 */
-
-	/* allocate device wrapper memory */
 	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
 	if (!fifo)
 		return -ENOMEM;
@@ -533,38 +471,20 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	mutex_init(&fifo->read_lock);
 	mutex_init(&fifo->write_lock);
 
-	/* ----------------------------
-	 *   init device memory space
-	 * ----------------------------
-	 */
-
-	/* get iospace for the device and request physical memory */
 	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-	/* ----------------------------
-	 *          init IP
-	 * ----------------------------
-	 */
-
 	rc = axis_fifo_parse_dt(fifo);
 	if (rc)
 		return rc;
 
 	reset_ip_core(fifo);
 
-	/* ----------------------------
-	 *    init device interrupts
-	 * ----------------------------
-	 */
-
-	/* get IRQ resource */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	/* request IRQ */
 	rc = devm_request_irq(fifo->dt_device, irq, &axis_fifo_irq, 0,
 			      DRIVER_NAME, fifo);
 	if (rc) {
@@ -573,15 +493,10 @@ static int axis_fifo_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	/* ----------------------------
-	 *      init char device
-	 * ----------------------------
-	 */
 	fifo->id = ida_alloc(&axis_fifo_ida, GFP_KERNEL);
 	if (fifo->id < 0)
 		return fifo->id;
 
-	/* create character device */
 	fifo->miscdev.fops = &fops;
 	fifo->miscdev.minor = MISC_DYNAMIC_MINOR;
 	fifo->miscdev.parent = dev;
-- 
2.51.0

