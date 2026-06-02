Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8533D16F0
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396361; cv=none; b=LlvMaxm8L11C5oqrx6WM+ela5fCAZzRP4p9UHPgLTaMiNU/uBwlIc/GpRqydzcLQClup67zdK9Ia/Uj1mLyhns9IEW4ZKYbWtN18RR56e6H6fg7+XOkmOTADucGVT5L5HHIP/1HA+/QmDOwcGjtXWlbUg02mDhlUjU0A1apYptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396361; c=relaxed/simple;
	bh=BFNvUU1hn9eQRQ3N4WJxokwDZ0OH/YjDcOfu+uZI9f4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=InVXn3ITnxjPomDf3mKBJ7wbcZR0zuHe9vq311bf+3sTBSp4gkFuQMwrfD1hapnQP7eUe67HRcI6Zk9m+tgtSsslyPw6PW4c7aQkmSli6DwFhMY5eyBNfFe5tTqBjDWTe9XXOF79aB4qZpTRCY6Y3wj3DRLPhu6OLXuUQlRNOzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p962YLbu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p962YLbu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so1738273a91.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780396358; x=1781001158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwWlftO5kMJEmOwAN+6vuw2BGg6VPYxQhceLMDQTX9Q=;
        b=p962YLbuL9ysrEtGnTZcz5u2k71NBDbRbE5cZD45TYDiEFXwo9a6xBcWEPQfDir+5T
         5jkUDtN+ER8xJmSrUMUaSHY7Yn1BsArd5I/HJsvRXHBIEqB1Unc5ywKp9ilKEc3uu5om
         m/ttLtQfdMq6G/K4qon+d0NGffBzbYPYSxib8A1g0nAOdvWGOHBFu8WKpWNZBs1G01ue
         aa1QJzLhmF8u/tPTOG3cD+x+tlJBiFIYwFFX463c4Ekujs60lzynaa6FOZ8rCPXHy5FN
         nLmctJycN7dCc84tivfIGC0iiR+BtuySkuNMcB+BXI6GSLf/gQieMeJzn6Z7pgb7d/Ti
         bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780396358; x=1781001158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwWlftO5kMJEmOwAN+6vuw2BGg6VPYxQhceLMDQTX9Q=;
        b=YYmbyS4nhlNR7h5AX2mj1yqNHedI4ahGuiiZFzkgxxMLaAg/ML2NRoAf6cvUfsKlzT
         LaqW0r425jSSWtdYwA6bP2MsaB+mNYa/PQcb+Ccfas4ta2YR7Lkh5ht8C3RTOJugHcqS
         g/+T75oNlNgHjBVtXcS+yZEUYKLyCFjxjAa6lLNLqwEmzLcq4ldDLTKUQ8i4fGTBB4zh
         AvGBn+PZHgwFPl6/nx61vr4Kf7O1/NMcpgGBIJh0aLY07eRNdXi0Mk8NWIFMAOwgFuIf
         v0JbF7WMEvfkjvNShveEUAjLW3iOKm6TpO/dIP7GplenJLZ3EYcFArNC5R/Ff7q+1rmH
         JSww==
X-Forwarded-Encrypted: i=1; AFNElJ99OSa9JSsESa/gof5KXHyKoBfRQ5y5XcdHAjskVFF/3YyVPNNftQSWLIx1q8HfBMzqbLcuyVGU/2/E0fqN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8ESU72Fvgxec+e4ElW6XaiunJeYuLJV3akz6jyh4rORka18Bw
	2oHHdg+JUEJXlu0japyquXsGcB2r/KQ58JN2adbk/ljSKWlT8sWL14pj
X-Gm-Gg: Acq92OG/MCTkLXba2Obdeb4uOcCDIBO2At1CaSRyUWxu4mf31eEPim/iyKeLVicqLf7
	WmIgl2M/ruVxh/W9XSS7a230sfTcY3fg8mnGbLYIIege9h4Cak1fgSKdjosP3PJg92+XLt4eQO/
	A53UQ/WUCzV62Z8sKgNlrBWX+azLVFdwZOZN0bl7dylZks2mCypS3hXser+ShIznyyvHmtotEd1
	Drt6Dss5BpnUueZobqvJsN8n1FWxXtbfUJX5YT3gs9rkjlX6VExENxAW89yxl1KwakqERePbbi1
	HwJPXxHEeIuqwXoTyyxi81wBOj58RpjOtkUeb6Bd9xLQhRk83UiG19k2K/JV3dIcOXBCaY3Vy5p
	LjkQcFtwt5ePkXbUdU6h1iYmpE0GEgngyKDPJMvvwysHXtdCM7o1udB4X9K5isUQ3jHA1yi5cK0
	qJAD4iQaVGuq/tMyc2fqpKdwRtW+hX/L5r
X-Received: by 2002:a05:6300:8197:b0:3b4:65d3:17b1 with SMTP id adf61e73a8af0-3b465d33d43mr6845431637.43.1780396357920;
        Tue, 02 Jun 2026 03:32:37 -0700 (PDT)
Received: from archterra ([219.91.178.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422a63537bsm9258941b3a.37.2026.06.02.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:32:37 -0700 (PDT)
From: Arihan Bhor <dogestad24@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Arihan Bhor <dogestad24@gmail.com>
Subject: [PATCH] staging: axis-fifo: remove driver
Date: Tue,  2 Jun 2026 16:01:53 +0530
Message-ID: <20260602103208.15799-1-dogestad24@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Arihan Bhor <dogestad24@gmail.com>
---
 drivers/staging/Kconfig                 |   2 -
 drivers/staging/Makefile                |   1 -
 drivers/staging/axis-fifo/Kconfig       |  12 -
 drivers/staging/axis-fifo/Makefile      |   2 -
 drivers/staging/axis-fifo/README        |   0
 drivers/staging/axis-fifo/axis-fifo.c   | 542 ------------------------
 drivers/staging/axis-fifo/axis-fifo.txt |  96 -----
 7 files changed, 655 deletions(-)
 delete mode 100644 drivers/staging/axis-fifo/Kconfig
 delete mode 100644 drivers/staging/axis-fifo/Makefile
 delete mode 100644 drivers/staging/axis-fifo/README
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.c
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 2f92cd698..ad085c190 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -44,8 +44,6 @@ source "drivers/staging/greybus/Kconfig"
 
 source "drivers/staging/vc04_services/Kconfig"
 
-source "drivers/staging/axis-fifo/Kconfig"
-
 source "drivers/staging/vme_user/Kconfig"
 
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index f5b8876aa..20757e140 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -12,4 +12,3 @@ obj-$(CONFIG_FB_TFT)		+= fbtft/
 obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
-obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
diff --git a/drivers/staging/axis-fifo/Kconfig b/drivers/staging/axis-fifo/Kconfig
deleted file mode 100644
index f180a8e9f..000000000
--- a/drivers/staging/axis-fifo/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# "Xilinx AXI-Stream FIFO IP core driver"
-#
-config XIL_AXIS_FIFO
-	tristate "Xilinx AXI-Stream FIFO IP core driver"
-	depends on OF && HAS_IOMEM
-	help
-	  This adds support for the Xilinx AXI-Stream FIFO IP core driver.
-	  The AXI Streaming FIFO allows memory mapped access to a AXI Streaming
-	  interface. The Xilinx AXI-Stream FIFO IP core can be used to interface
-	  to the AXI Ethernet without the need to use DMA.
diff --git a/drivers/staging/axis-fifo/Makefile b/drivers/staging/axis-fifo/Makefile
deleted file mode 100644
index c626005c9..000000000
--- a/drivers/staging/axis-fifo/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_XIL_AXIS_FIFO) += axis-fifo.o
diff --git a/drivers/staging/axis-fifo/README b/drivers/staging/axis-fifo/README
deleted file mode 100644
index e69de29bb..000000000
diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
deleted file mode 100644
index 3aa2aa870..000000000
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ /dev/null
@@ -1,542 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Xilinx AXIS FIFO: interface to the Xilinx AXI-Stream FIFO IP core
- *
- * Copyright (C) 2018 Jacob Feder
- *
- * Authors:  Jacob Feder <jacobsfeder@gmail.com>
- *
- * See Xilinx PG080 document for IP details
- */
-
-#include <linux/kernel.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/wait.h>
-#include <linux/mutex.h>
-#include <linux/device.h>
-#include <linux/cdev.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/io.h>
-#include <linux/interrupt.h>
-#include <linux/fs.h>
-#include <linux/types.h>
-#include <linux/uaccess.h>
-#include <linux/jiffies.h>
-#include <linux/miscdevice.h>
-#include <linux/debugfs.h>
-#include <linux/poll.h>
-
-#define DRIVER_NAME "axis_fifo"
-
-#define READ_BUF_SIZE 128U /* read buffer length in words */
-
-#define AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN	4
-
-#define XLLF_ISR_OFFSET		0x00 /* Interrupt Status */
-#define XLLF_IER_OFFSET		0x04 /* Interrupt Enable */
-#define XLLF_TDFR_OFFSET	0x08 /* Transmit Reset */
-#define XLLF_TDFV_OFFSET	0x0c /* Transmit Vacancy */
-#define XLLF_TDFD_OFFSET	0x10 /* Transmit Data */
-#define XLLF_TLR_OFFSET		0x14 /* Transmit Length */
-#define XLLF_RDFR_OFFSET	0x18 /* Receive Reset */
-#define XLLF_RDFO_OFFSET	0x1c /* Receive Occupancy */
-#define XLLF_RDFD_OFFSET	0x20 /* Receive Data */
-#define XLLF_RLR_OFFSET		0x24 /* Receive Length */
-#define XLLF_SRR_OFFSET		0x28 /* Local Link Reset */
-#define XLLF_TDR_OFFSET		0x2C /* Transmit Destination */
-#define XLLF_RDR_OFFSET		0x30 /* Receive Destination */
-
-#define XLLF_RDFR_RESET_MASK	0xa5 /* Receive reset value */
-#define XLLF_TDFR_RESET_MASK	0xa5 /* Transmit reset value */
-#define XLLF_SRR_RESET_MASK	0xa5 /* Local Link reset value */
-
-#define XLLF_INT_RPURE_MASK	BIT(31) /* Receive under-read */
-#define XLLF_INT_RPORE_MASK	BIT(30) /* Receive over-read */
-#define XLLF_INT_RPUE_MASK	BIT(29) /* Receive underrun (empty) */
-#define XLLF_INT_TPOE_MASK	BIT(28) /* Transmit overrun */
-#define XLLF_INT_TC_MASK	BIT(27) /* Transmit complete */
-#define XLLF_INT_RC_MASK	BIT(26) /* Receive complete */
-#define XLLF_INT_TSE_MASK	BIT(25) /* Transmit length mismatch */
-
-#define XLLF_INT_CLEAR_ALL	GENMASK(31, 0)
-
-static DEFINE_IDA(axis_fifo_ida);
-
-struct axis_fifo {
-	int id;
-	void __iomem *base_addr;
-
-	unsigned int rx_fifo_depth;
-	unsigned int tx_fifo_depth;
-	u32 has_rx_fifo;
-	u32 has_tx_fifo;
-
-	wait_queue_head_t read_queue;
-	struct mutex read_lock; /* lock for reading */
-	wait_queue_head_t write_queue;
-	struct mutex write_lock; /* lock for writing */
-
-	struct device *dt_device;
-	struct miscdevice miscdev;
-
-	struct dentry *debugfs_dir;
-};
-
-struct axis_fifo_debug_reg {
-	const char * const name;
-	unsigned int offset;
-};
-
-static void reset_ip_core(struct axis_fifo *fifo)
-{
-	iowrite32(XLLF_SRR_RESET_MASK, fifo->base_addr + XLLF_SRR_OFFSET);
-	iowrite32(XLLF_TDFR_RESET_MASK, fifo->base_addr + XLLF_TDFR_OFFSET);
-	iowrite32(XLLF_RDFR_RESET_MASK, fifo->base_addr + XLLF_RDFR_OFFSET);
-	iowrite32(XLLF_INT_TC_MASK | XLLF_INT_RC_MASK | XLLF_INT_RPURE_MASK |
-		  XLLF_INT_RPORE_MASK | XLLF_INT_RPUE_MASK |
-		  XLLF_INT_TPOE_MASK | XLLF_INT_TSE_MASK,
-		  fifo->base_addr + XLLF_IER_OFFSET);
-	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);
-}
-
-/**
- * axis_fifo_read() - Read a packet from AXIS-FIFO character device.
- * @f: Open file.
- * @buf: User space buffer to read to.
- * @len: User space buffer length.
- * @off: Buffer offset.
- *
- * As defined by the device's documentation, we need to check the device's
- * occupancy before reading the length register and then the data. All these
- * operations must be executed atomically, in order and one after the other
- * without missing any.
- *
- * Returns the number of bytes read from the device or negative error code
- *	on failure.
- */
-static ssize_t axis_fifo_read(struct file *f, char __user *buf,
-			      size_t len, loff_t *off)
-{
-	struct axis_fifo *fifo = f->private_data;
-	size_t bytes_available;
-	unsigned int words_available;
-	unsigned int copied;
-	unsigned int copy;
-	unsigned int i;
-	int ret;
-	u32 tmp_buf[READ_BUF_SIZE];
-
-	if (f->f_flags & O_NONBLOCK) {
-		if (!mutex_trylock(&fifo->read_lock))
-			return -EAGAIN;
-
-		if (!ioread32(fifo->base_addr + XLLF_RDFO_OFFSET)) {
-			ret = -EAGAIN;
-			goto end_unlock;
-		}
-	} else {
-		mutex_lock(&fifo->read_lock);
-
-		ret = wait_event_interruptible(fifo->read_queue,
-					       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET));
-		if (ret)
-			goto end_unlock;
-	}
-
-	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
-	words_available = bytes_available / sizeof(u32);
-
-	if (bytes_available > len) {
-		ret = -EINVAL;
-		goto err_flush_rx;
-	}
-
-	if (bytes_available % sizeof(u32)) {
-		/* this probably can't happen unless IP
-		 * registers were previously mishandled
-		 */
-		dev_err(fifo->dt_device, "received a packet that isn't word-aligned\n");
-		ret = -EIO;
-		goto err_flush_rx;
-	}
-
-	copied = 0;
-	while (words_available > 0) {
-		copy = min(words_available, READ_BUF_SIZE);
-
-		for (i = 0; i < copy; i++) {
-			tmp_buf[i] = ioread32(fifo->base_addr +
-					      XLLF_RDFD_OFFSET);
-		}
-		words_available -= copy;
-
-		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
-				 copy * sizeof(u32))) {
-			ret = -EFAULT;
-			goto err_flush_rx;
-		}
-
-		copied += copy;
-	}
-	mutex_unlock(&fifo->read_lock);
-
-	return bytes_available;
-
-err_flush_rx:
-	while (words_available--)
-		ioread32(fifo->base_addr + XLLF_RDFD_OFFSET);
-
-end_unlock:
-	mutex_unlock(&fifo->read_lock);
-
-	return ret;
-}
-
-/**
- * axis_fifo_write() - Write buffer to AXIS-FIFO character device.
- * @f: Open file.
- * @buf: User space buffer to write to the device.
- * @len: User space buffer length.
- * @off: Buffer offset.
- *
- * As defined by the device's documentation, we need to write to the device's
- * data buffer then to the device's packet length register atomically. Also,
- * we need to lock before checking if the device has available space to avoid
- * any concurrency issue.
- *
- * Returns the number of bytes written to the device or negative error code
- *	on failure.
- */
-static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
-			       size_t len, loff_t *off)
-{
-	struct axis_fifo *fifo = f->private_data;
-	unsigned int words_to_write;
-	u32 *txbuf;
-	int ret;
-
-	words_to_write = len / sizeof(u32);
-
-	/*
-	 * In 'Store-and-Forward' mode, the maximum packet that can be
-	 * transmitted is limited by the size of the FIFO, which is
-	 * (C_TX_FIFO_DEPTH–4)*(data interface width/8) bytes.
-	 *
-	 * Do not attempt to send a packet larger than 'tx_fifo_depth - 4',
-	 * otherwise a 'Transmit Packet Overrun Error' interrupt will be
-	 * raised, which requires a reset of the TX circuit to recover.
-	 */
-	if (!words_to_write || (len % sizeof(u32)) ||
-	    (words_to_write > (fifo->tx_fifo_depth - 4)))
-		return -EINVAL;
-
-	if (f->f_flags & O_NONBLOCK) {
-		if (!mutex_trylock(&fifo->write_lock))
-			return -EAGAIN;
-
-		if (words_to_write > ioread32(fifo->base_addr +
-					      XLLF_TDFV_OFFSET)) {
-			ret = -EAGAIN;
-			goto end_unlock;
-		}
-	} else {
-		mutex_lock(&fifo->write_lock);
-
-		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
-		if (ret)
-			goto end_unlock;
-	}
-
-	txbuf = vmemdup_user(buf, len);
-	if (IS_ERR(txbuf)) {
-		ret = PTR_ERR(txbuf);
-		goto end_unlock;
-	}
-
-	for (int i = 0; i < words_to_write; ++i)
-		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
-
-	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
-
-	ret = len;
-	kvfree(txbuf);
-end_unlock:
-	mutex_unlock(&fifo->write_lock);
-
-	return ret;
-}
-
-static __poll_t axis_fifo_poll(struct file *f, poll_table *wait)
-{
-	struct axis_fifo *fifo = f->private_data;
-	__poll_t mask = 0;
-
-	if (fifo->has_rx_fifo) {
-		poll_wait(f, &fifo->read_queue, wait);
-
-		if (ioread32(fifo->base_addr + XLLF_RDFO_OFFSET))
-			mask |= EPOLLIN | EPOLLRDNORM;
-	}
-
-	if (fifo->has_tx_fifo) {
-		poll_wait(f, &fifo->write_queue, wait);
-
-		if (ioread32(fifo->base_addr + XLLF_TDFV_OFFSET))
-			mask |= EPOLLOUT | EPOLLWRNORM;
-	}
-
-	return mask;
-}
-
-static irqreturn_t axis_fifo_irq(int irq, void *dw)
-{
-	struct axis_fifo *fifo = dw;
-	u32 isr, ier, intr;
-
-	ier = ioread32(fifo->base_addr + XLLF_IER_OFFSET);
-	isr = ioread32(fifo->base_addr + XLLF_ISR_OFFSET);
-	intr = ier & isr;
-
-	if (intr & XLLF_INT_RC_MASK)
-		wake_up(&fifo->read_queue);
-
-	if (intr & XLLF_INT_TC_MASK)
-		wake_up(&fifo->write_queue);
-
-	if (intr & XLLF_INT_RPURE_MASK)
-		dev_err(fifo->dt_device, "receive under-read interrupt\n");
-
-	if (intr & XLLF_INT_RPORE_MASK)
-		dev_err(fifo->dt_device, "receive over-read interrupt\n");
-
-	if (intr & XLLF_INT_RPUE_MASK)
-		dev_err(fifo->dt_device, "receive underrun error interrupt\n");
-
-	if (intr & XLLF_INT_TPOE_MASK)
-		dev_err(fifo->dt_device, "transmit overrun error interrupt\n");
-
-	if (intr & XLLF_INT_TSE_MASK)
-		dev_err(fifo->dt_device,
-			"transmit length mismatch error interrupt\n");
-
-	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);
-
-	return IRQ_HANDLED;
-}
-
-static int axis_fifo_open(struct inode *inod, struct file *f)
-{
-	struct axis_fifo *fifo = container_of(f->private_data,
-					      struct axis_fifo, miscdev);
-	unsigned int flags = f->f_flags & O_ACCMODE;
-
-	f->private_data = fifo;
-
-	if ((flags == O_WRONLY || flags == O_RDWR) && !fifo->has_tx_fifo)
-		return -EPERM;
-
-	if ((flags == O_RDONLY || flags == O_RDWR) && !fifo->has_rx_fifo)
-		return -EPERM;
-
-	return 0;
-}
-
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	.open = axis_fifo_open,
-	.read = axis_fifo_read,
-	.write = axis_fifo_write,
-	.poll = axis_fifo_poll,
-};
-
-static int axis_fifo_debugfs_regs_show(struct seq_file *m, void *p)
-{
-	static const struct axis_fifo_debug_reg regs[] = {
-		{"isr", XLLF_ISR_OFFSET},
-		{"ier", XLLF_IER_OFFSET},
-		{"tdfv", XLLF_TDFV_OFFSET},
-		{"rdfo", XLLF_RDFO_OFFSET},
-		{ /* Sentinel */ },
-	};
-	const struct axis_fifo_debug_reg *reg;
-	struct axis_fifo *fifo = m->private;
-
-	for (reg = regs; reg->name; ++reg) {
-		u32 val = ioread32(fifo->base_addr + reg->offset);
-
-		seq_printf(m, "%*s: 0x%08x\n", AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN,
-			   reg->name, val);
-	}
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(axis_fifo_debugfs_regs);
-
-static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
-{
-	fifo->debugfs_dir = debugfs_create_dir(dev_name(fifo->dt_device), NULL);
-
-	debugfs_create_file("regs", 0444, fifo->debugfs_dir, fifo,
-			    &axis_fifo_debugfs_regs_fops);
-}
-
-static int axis_fifo_parse_dt(struct axis_fifo *fifo)
-{
-	int ret;
-	unsigned int value;
-	struct device_node *node = fifo->dt_device->of_node;
-
-	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
-				   &value);
-	if (ret)
-		return ret;
-	if (value != 32)
-		return -EINVAL;
-
-	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
-				   &value);
-	if (ret)
-		return ret;
-	if (value != 32)
-		return -EINVAL;
-
-	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
-				   &fifo->rx_fifo_depth);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
-				   &fifo->tx_fifo_depth);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32(node, "xlnx,use-rx-data",
-				   &fifo->has_rx_fifo);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32(node, "xlnx,use-tx-data",
-				   &fifo->has_tx_fifo);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int axis_fifo_probe(struct platform_device *pdev)
-{
-	struct resource *r_mem;
-	struct device *dev = &pdev->dev;
-	struct axis_fifo *fifo = NULL;
-	int rc = 0; /* error return value */
-	int irq;
-
-	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
-	if (!fifo)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, fifo);
-	fifo->dt_device = dev;
-
-	init_waitqueue_head(&fifo->read_queue);
-	init_waitqueue_head(&fifo->write_queue);
-
-	mutex_init(&fifo->read_lock);
-	mutex_init(&fifo->write_lock);
-
-	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
-	if (IS_ERR(fifo->base_addr))
-		return PTR_ERR(fifo->base_addr);
-
-	rc = axis_fifo_parse_dt(fifo);
-	if (rc)
-		return rc;
-
-	reset_ip_core(fifo);
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	rc = devm_request_irq(fifo->dt_device, irq, &axis_fifo_irq, 0,
-			      DRIVER_NAME, fifo);
-	if (rc) {
-		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
-			irq);
-		return rc;
-	}
-
-	fifo->id = ida_alloc(&axis_fifo_ida, GFP_KERNEL);
-	if (fifo->id < 0)
-		return fifo->id;
-
-	fifo->miscdev.fops = &fops;
-	fifo->miscdev.minor = MISC_DYNAMIC_MINOR;
-	fifo->miscdev.parent = dev;
-	fifo->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
-					    DRIVER_NAME, fifo->id);
-	if (!fifo->miscdev.name) {
-		ida_free(&axis_fifo_ida, fifo->id);
-		return -ENOMEM;
-	}
-
-	rc = misc_register(&fifo->miscdev);
-	if (rc < 0) {
-		ida_free(&axis_fifo_ida, fifo->id);
-		return rc;
-	}
-
-	axis_fifo_debugfs_init(fifo);
-
-	return 0;
-}
-
-static void axis_fifo_remove(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct axis_fifo *fifo = dev_get_drvdata(dev);
-
-	debugfs_remove(fifo->debugfs_dir);
-	misc_deregister(&fifo->miscdev);
-	ida_free(&axis_fifo_ida, fifo->id);
-}
-
-static const struct of_device_id axis_fifo_of_match[] = {
-	{ .compatible = "xlnx,axi-fifo-mm-s-4.1", },
-	{ .compatible = "xlnx,axi-fifo-mm-s-4.2", },
-	{ .compatible = "xlnx,axi-fifo-mm-s-4.3", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, axis_fifo_of_match);
-
-static struct platform_driver axis_fifo_driver = {
-	.driver = {
-		.name = DRIVER_NAME,
-		.of_match_table	= axis_fifo_of_match,
-	},
-	.probe		= axis_fifo_probe,
-	.remove		= axis_fifo_remove,
-};
-
-static int __init axis_fifo_init(void)
-{
-	return platform_driver_register(&axis_fifo_driver);
-}
-
-module_init(axis_fifo_init);
-
-static void __exit axis_fifo_exit(void)
-{
-	platform_driver_unregister(&axis_fifo_driver);
-	ida_destroy(&axis_fifo_ida);
-}
-
-module_exit(axis_fifo_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Jacob Feder <jacobsfeder@gmail.com>");
-MODULE_DESCRIPTION("Xilinx AXI-Stream FIFO IP core driver");
diff --git a/drivers/staging/axis-fifo/axis-fifo.txt b/drivers/staging/axis-fifo/axis-fifo.txt
deleted file mode 100644
index 413b81a53..000000000
--- a/drivers/staging/axis-fifo/axis-fifo.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Xilinx AXI-Stream FIFO v4.1 IP core
-
-This IP core has read and write AXI-Stream FIFOs, the contents of which can
-be accessed from the AXI4 memory-mapped interface. This is useful for
-transferring data from a processor into the FPGA fabric. The driver creates
-a character device that can be read/written to with standard
-open/read/write/close.
-
-See Xilinx PG080 document for IP details.
-
-Currently supports only store-forward mode with a 32-bit
-AXI4-Lite interface. DOES NOT support:
-	- cut-through mode
-	- AXI4 (non-lite)
-
-Required properties:
-- compatible: Should be one of:
-    "xlnx,axi-fifo-mm-s-4.1"
-    "xlnx,axi-fifo-mm-s-4.2"
-    "xlnx,axi-fifo-mm-s-4.3"
-- interrupt-names: Should be "interrupt"
-- interrupt-parent: Should be <&intc>
-- interrupts: Should contain interrupts lines.
-- reg: Should contain registers location and length.
-- xlnx,axi-str-rxd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-rxd-tdata-width: Should be <0x20>
-- xlnx,axi-str-txc-protocol: Should be "XIL_AXI_STREAM_ETH_CTRL"
-- xlnx,axi-str-txc-tdata-width: Should be <0x20>
-- xlnx,axi-str-txd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-txd-tdata-width: Should be <0x20>
-- xlnx,axis-tdest-width: AXI-Stream TDEST width (ignored by the driver)
-- xlnx,axis-tid-width: AXI-Stream TID width (ignored by the driver)
-- xlnx,axis-tuser-width: AXI-Stream TUSER width (ignored by the driver)
-- xlnx,data-interface-type: Should be <0x0> (ignored by the driver)
-- xlnx,has-axis-tdest: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tid: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tkeep: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tstrb: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tuser: Should be <0x0> (this feature isn't supported)
-- xlnx,rx-fifo-depth: Depth of RX FIFO in words
-- xlnx,rx-fifo-pe-threshold: RX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,rx-fifo-pf-threshold: RX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,s-axi-id-width: Should be <0x4> (ignored by the driver)
-- xlnx,s-axi4-data-width: Should be <0x20> (ignored by the driver)
-- xlnx,select-xpm: Should be <0x0> (ignored by the driver)
-- xlnx,tx-fifo-depth: Depth of TX FIFO in words
-- xlnx,tx-fifo-pe-threshold: TX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,tx-fifo-pf-threshold: TX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,use-rx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-rx-data: <0x1> if RX FIFO is enabled, <0x0> otherwise
-- xlnx,use-tx-ctrl: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-data: <0x1> if TX FIFO is enabled, <0x0> otherwise
-
-Example:
-
-axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
-	compatible = "xlnx,axi-fifo-mm-s-4.1";
-	interrupt-names = "interrupt";
-	interrupt-parent = <&intc>;
-	interrupts = <0 29 4>;
-	reg = <0x43c00000 0x10000>;
-	xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-rxd-tdata-width = <0x20>;
-	xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
-	xlnx,axi-str-txc-tdata-width = <0x20>;
-	xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-txd-tdata-width = <0x20>;
-	xlnx,axis-tdest-width = <0x4>;
-	xlnx,axis-tid-width = <0x4>;
-	xlnx,axis-tuser-width = <0x4>;
-	xlnx,data-interface-type = <0x0>;
-	xlnx,has-axis-tdest = <0x0>;
-	xlnx,has-axis-tid = <0x0>;
-	xlnx,has-axis-tkeep = <0x0>;
-	xlnx,has-axis-tstrb = <0x0>;
-	xlnx,has-axis-tuser = <0x0>;
-	xlnx,rx-fifo-depth = <0x200>;
-	xlnx,rx-fifo-pe-threshold = <0x2>;
-	xlnx,rx-fifo-pf-threshold = <0x1fb>;
-	xlnx,s-axi-id-width = <0x4>;
-	xlnx,s-axi4-data-width = <0x20>;
-	xlnx,select-xpm = <0x0>;
-	xlnx,tx-fifo-depth = <0x8000>;
-	xlnx,tx-fifo-pe-threshold = <0x200>;
-	xlnx,tx-fifo-pf-threshold = <0x7ffb>;
-	xlnx,use-rx-cut-through = <0x0>;
-	xlnx,use-rx-data = <0x0>;
-	xlnx,use-tx-ctrl = <0x0>;
-	xlnx,use-tx-cut-through = <0x0>;
-	xlnx,use-tx-data = <0x1>;
-};
-- 
2.54.0

