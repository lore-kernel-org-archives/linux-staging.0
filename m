Received: from mvsmtppost19.nm.naver.com (mvsmtppost19.nm.naver.com [61.247.196.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C639A807
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768397627; cv=none; b=IWksI9MJTwd5dyyqHFRqKm/lsHuOlsVeL58gdpFtEwdS94DtnCk43/u+JMYkRmPTCVH1edtQLjQtD64NT7a8bxaArkEniFrEIh3RLNAROBa3rQHJET7FKG6xON2rVTz8vzhTl8J0oDiX4RixTH3ya0qQ+0mJnJCOOVi2ryWAzoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768397627; c=relaxed/simple;
	bh=ddDmhaouarvXwMVBvnX89f4wLPTRj5iUM6KsiUA/Lp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p4djbRXC7Eaaf8LZ3QKOz8g75/3RsuBpjy5YdNxdR8qHU+FYtSvycdsjdzFlNFkz1W6qeNN9F4f1MHy/3857zDtA9VbPFbuBtfSl27wuIT42huXsBDUyg/0Jb2V6WsDvS2wYC0NdCH6WZfhhMVrBe11XMkzKUbRC4XGPbn6ydT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=OJz+pBbB; arc=none smtp.client-ip=61.247.196.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="OJz+pBbB"
Received: from cvsendbo027.nm ([10.112.22.36])
  by mvsmtppost19.nm.naver.com with ESMTP id EZOdkq9zQ9uf-qPOq6hdhg
  for <linux-staging@lists.linux.dev>;
  Wed, 14 Jan 2026 13:23:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768397015; bh=ddDmhaouarvXwMVBvnX89f4wLPTRj5iUM6KsiUA/Lp0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=OJz+pBbB+tGPP/pkEuEccw0QP+QvkfLGcowVrpAJx1Y4vm6NOeh3FhnecqtyTMSLO
	 UPLfD4RMAE8Brx+4C7JhMbQ1mAgG8q2O+Dd3YIUhEWFsDyVWqx2lkWt8yLD82i7WSi
	 GhvxMS+fFyMZ8NN2NUQCoBT84+nKbaJDrilP2fjgnCxCSHhVduiJ/5x9IfGejGVXf5
	 LDKs4plMADKUlxqgcPW6FDl2ZnI25tEoUYt+HQPbbWQMj7LwyNRpftUPxAK2pRGN4j
	 uqlJnoG0IXNrrln8YAtP29mxrRT4Dg1XMRpEiaMvhqtuTmnwFjHHU/dDFUo9ZsdBWH
	 VKSDxpoY35kVg==
X-Session-ID: gd6fbiJQT7ONaI3sWpaL5A
X-Works-Send-Opt: B/YrjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: fqKrKq2rFqJZ+Hm9KxMd+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp005.nm.naver.com with ESMTP id gd6fbiJQT7ONaI3sWpaL5A
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 14 Jan 2026 13:23:35 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v2 1/2] staging: axis-fifo: introduce helper functions for register access
Date: Wed, 14 Jan 2026 22:23:16 +0900
Message-ID: <20260114132317.2901972-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
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

