Received: from cvsmtppost08.nm.naver.com (cvsmtppost08.nm.naver.com [114.111.35.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6473921FC
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312136; cv=none; b=OSe3cxe0BgXW4uR2woshlmFQiX2ORwDOyO4/LxfUE0TKCDZktKtvkA7olf6nOORqCpLYkv8Y6RGovFuEppIOwY20QGGdE3SaDaulaSKQNXcXoG5Sqny3c8pV9IX//XWmowmywLhXEg1mvLeys0iC8AbC1EzTyBRkhdOneH5sQNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312136; c=relaxed/simple;
	bh=ddDmhaouarvXwMVBvnX89f4wLPTRj5iUM6KsiUA/Lp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1+CiH1TVh2poCv0KmRRGrC02nlqTPv227KfeLkTimc+Wbp7SfsTw6Sf40fOegOdVItkrWMWb1aEZHSToEjGLb27XuvKcvZ+xqE7fh3C5u5wyEKbfMfuFlSwRGMhWHpMB9IJa8NKrhNI+1SuMDW3SO5YA9tBX/i+u7MB45kKkuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=TaQpIloZ; arc=none smtp.client-ip=114.111.35.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="TaQpIloZ"
Received: from cvsendbo004.nm ([10.112.24.36])
  by cvsmtppost08.nm.naver.com with ESMTP id An2lZNRpR2mVPdy7dJwxhQ
  for <linux-staging@lists.linux.dev>;
  Tue, 13 Jan 2026 13:38:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768311525; bh=ddDmhaouarvXwMVBvnX89f4wLPTRj5iUM6KsiUA/Lp0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=TaQpIloZTkZ5iDFX8+Qc6YhdtlNKkfTbW0N79tJHulae3yqZ7vr8a33BmoTNA5Q/J
	 phBmysf6APqgHjmTCBDmLq9BwzaJpp8xqTkK1eqFW1Prn0k/bka63GSIyIp48dt1cH
	 OGDirMoA+Ae9OmjYPuWbujdvn7B0Z6ncesey2wFxxJxflSQfeMs6Th/MCCGUObZuAw
	 q6iN4kjFsHUQ+QINiz5IJlWkWY7oD4fADRPn3yA8f8LHPa2XuapT16nXoEw2MyMfeo
	 DQnDPRVxSDxejaqlnZrm87CGHUQtdKXI84cRUaxavcOWaVVt88P81SnxINrOxJySu0
	 hCQZQYAwDkBZg==
X-Session-ID: jPQjYJIoTmusI7Jqqh6YuA
X-Works-Send-Opt: 6/Y9jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: fqbXKo2rFqJZ+Hm9Koul+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id jPQjYJIoTmusI7Jqqh6YuA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 13 Jan 2026 13:38:45 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH 1/2] staging: axis-fifo: introduce helper functions for register access
Date: Tue, 13 Jan 2026 22:38:30 +0900
Message-ID: <20260113133831.3422480-2-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113133831.3422480-1-s9430939@naver.com>
References: <20260113133831.3422480-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces axis_fifo_read_reg(), axis_fifo_write_reg()
to wrap raw ioread32, iowrite32 calls. Using these helper functions
improves code readability and provides a cleaner abstraction for
hardware register access.

All existing single register I/O calls updated to use these
new helpers. This refactoring also ensures a consistent access
pattern and makes future maintenance easier.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 45 ++++++++++++++++-----------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..525156583c4a 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -145,16 +145,26 @@ struct axis_fifo_debug_reg {
  * ----------------------------
  */
 
+static inline u32 axis_fifo_read_reg(struct axis_fifo *fifo, int offset)
+{
+	return ioread32(fifo->base_addr + offset);
+}
+
+static inline void axis_fifo_write_reg(struct axis_fifo *fifo, int offset, u32 val)
+{
+	iowrite32(val, fifo->base_addr + offset);
+}
+
 static void reset_ip_core(struct axis_fifo *fifo)
 {
-	iowrite32(XLLF_SRR_RESET_MASK, fifo->base_addr + XLLF_SRR_OFFSET);
-	iowrite32(XLLF_TDFR_RESET_MASK, fifo->base_addr + XLLF_TDFR_OFFSET);
-	iowrite32(XLLF_RDFR_RESET_MASK, fifo->base_addr + XLLF_RDFR_OFFSET);
-	iowrite32(XLLF_INT_TC_MASK | XLLF_INT_RC_MASK | XLLF_INT_RPURE_MASK |
+	axis_fifo_write_reg(fifo, XLLF_SRR_OFFSET, XLLF_SRR_RESET_MASK);
+	axis_fifo_write_reg(fifo, XLLF_TDFR_OFFSET, XLLF_TDFR_RESET_MASK);
+	axis_fifo_write_reg(fifo, XLLF_RDFR_OFFSET, XLLF_RDFR_RESET_MASK);
+	axis_fifo_write_reg(fifo, XLLF_IER_OFFSET, XLLF_INT_TC_MASK |
+			XLLF_INT_RC_MASK | XLLF_INT_RPURE_MASK |
 		  XLLF_INT_RPORE_MASK | XLLF_INT_RPUE_MASK |
-		  XLLF_INT_TPOE_MASK | XLLF_INT_TSE_MASK,
-		  fifo->base_addr + XLLF_IER_OFFSET);
-	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);
+		  XLLF_INT_TPOE_MASK | XLLF_INT_TSE_MASK);
+	axis_fifo_write_reg(fifo, XLLF_ISR_OFFSET, XLLF_INT_CLEAR_ALL);
 }
 
 /**
@@ -192,7 +202,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		if (!mutex_trylock(&fifo->read_lock))
 			return -EAGAIN;
 
-		if (!ioread32(fifo->base_addr + XLLF_RDFO_OFFSET)) {
+		if (!axis_fifo_read_reg(fifo, XLLF_RDFO_OFFSET)) {
 			ret = -EAGAIN;
 			goto end_unlock;
 		}
@@ -203,7 +213,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       axis_fifo_read_reg(fifo, XLLF_RDFO_OFFSET),
 						       read_timeout);
 
 		if (ret <= 0) {
@@ -218,7 +228,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		}
 	}
 
-	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
+	bytes_available = axis_fifo_read_reg(fifo, XLLF_RLR_OFFSET);
 	words_available = bytes_available / sizeof(u32);
 	if (!bytes_available) {
 		dev_err(fifo->dt_device, "received a packet of length 0\n");
@@ -334,8 +344,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		if (!mutex_trylock(&fifo->write_lock))
 			return -EAGAIN;
 
-		if (words_to_write > ioread32(fifo->base_addr +
-					      XLLF_TDFV_OFFSET)) {
+		if (words_to_write > axis_fifo_read_reg(fifo, XLLF_TDFV_OFFSET)) {
 			ret = -EAGAIN;
 			goto end_unlock;
 		}
@@ -347,7 +356,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+						       axis_fifo_read_reg(fifo, XLLF_TDFV_OFFSET)
 								>= words_to_write,
 						       write_timeout);
 
@@ -373,7 +382,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
 
 	/* write packet size to fifo */
-	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
+	axis_fifo_write_reg(fifo, XLLF_TLR_OFFSET, len);
 
 	ret = len;
 	kvfree(txbuf);
@@ -388,8 +397,8 @@ static irqreturn_t axis_fifo_irq(int irq, void *dw)
 	struct axis_fifo *fifo = dw;
 	u32 isr, ier, intr;
 
-	ier = ioread32(fifo->base_addr + XLLF_IER_OFFSET);
-	isr = ioread32(fifo->base_addr + XLLF_ISR_OFFSET);
+	ier = axis_fifo_read_reg(fifo, XLLF_IER_OFFSET);
+	isr = axis_fifo_read_reg(fifo, XLLF_ISR_OFFSET);
 	intr = ier & isr;
 
 	if (intr & XLLF_INT_RC_MASK)
@@ -414,7 +423,7 @@ static irqreturn_t axis_fifo_irq(int irq, void *dw)
 		dev_err(fifo->dt_device,
 			"transmit length mismatch error interrupt\n");
 
-	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);
+	axis_fifo_write_reg(fifo, XLLF_ISR_OFFSET, XLLF_INT_CLEAR_ALL);
 
 	return IRQ_HANDLED;
 }
@@ -464,7 +473,7 @@ static int axis_fifo_debugfs_regs_show(struct seq_file *m, void *p)
 	struct axis_fifo *fifo = m->private;
 
 	for (reg = regs; reg->name; ++reg) {
-		u32 val = ioread32(fifo->base_addr + reg->offset);
+		u32 val = axis_fifo_read_reg(fifo, reg->offset);
 
 		seq_printf(m, "%*s: 0x%08x\n", AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN,
 			   reg->name, val);
-- 
2.43.0

