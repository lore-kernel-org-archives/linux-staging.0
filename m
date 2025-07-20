Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA4198E9B
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753036768; cv=none; b=lz6M9RXd30vPGztvg0vKyfixPGWjfCH649aBGoA+p5sReK491NDuswYMzCIPyGwc7mp2aMcVM0JCLayBdgY10vPSTjrMsp88YPC/fmon/VEXstoiPtWXJWEOBdTddU4s5PAPxrHlpEBYSo6+RcENOdbTuE2rCpkThv4cV8LX4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753036768; c=relaxed/simple;
	bh=RKWMvO/fU/WNbKhEbWzWLXnCbkLXkt7iP1OUIspJ5CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBH6lukn96R9BuKKBesuxpfc1r0JdXHPMNeOv28URnT6Yam8BLKHnLIn0WxkF2WjLM/aYY3+63Q2F+fmIACqLxdwzbnVkN3r48aTiz/dX6TyRZKzgdQsyVOcG1ECULIZjKdakfMSZOHrqiGlQqLYB1IDlmBN+EqufCFY9BmJvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtRyqXqg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtRyqXqg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so647969166b.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753036765; x=1753641565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HXTUbomF0Mo0J64mxyhOwMmyRS3EiCAcZKo6eJmSg=;
        b=DtRyqXqgei6PEutHYdF9CSPFfWayhrgIFbnPz9WXLGfxZMPp6PsySzKgaDtMJZSj9d
         zd9ZeMhqv+TMZ7CKU89AIZgY581ywFXqf3Q4XqIBRPpK/yuo6ZhDaSiL9vxHywshORDH
         bl8lJdkAvgB8WKGgVpLf23mUyhJZXDhk493R4IY8yaE/bUeddgHUm55P6Dpd2hUkH51C
         A62fTSr2KsYAZ9QsiZxJCbQRStbp7RBzwiAQSu5y8FLS7GtyDBSz+KAHZEUa7MH5Zvea
         UtBEH2LmUtO/VL6NTIxKktmGPgbPd3slWXwZ7jxbi45qRopjWmCRe/t9virFI7B9F9jK
         PnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753036765; x=1753641565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8HXTUbomF0Mo0J64mxyhOwMmyRS3EiCAcZKo6eJmSg=;
        b=cK3b92WkYmvSXryyT6+yMJFz9bnUh6/R9J5mvRmUMj/he2Z2pLd0GT4Fk3rtRHNlN0
         3fnV+EO0+0uiJ+cA05djfWn+d8WpxA2CJjXKtFNoWyajIDAaY8RsJ5exksuu9upSKsJA
         QFNQgAG1hOr2ytMlhKftzuGvtteb7+TIdD8QlwLIXn9K83Qa+7UEAHBTJJ8r6G4Vxs7l
         la9hSg9RDRt7y4oIvCusn79HaaqnyTMLgU5b4iv4/V9Ju1DDtvAFjH9GUrCU38DPxcm6
         ge94bneHVGYuyYq7GImiVHQKyKIWEtiUE+x/F5aHSpA1AOskoXBtXp2UZpoglBbrlsN8
         9FIA==
X-Gm-Message-State: AOJu0Ywg4yeBUyjoHEAuRG7xFXRIWs82Zf3regoszQVcLId8g0i22FN8
	zWwjbB0/46y4N3p/qlgFlf1Q9MGfVcuF+BXyf3Gw+lEc7mSukBnn/7cW
X-Gm-Gg: ASbGncv0OHRPAhl7SmAD6NfoMStxlSXsBMf5W9jYuOwdo2m4ekaf/rUOp8gyegvvU4S
	G/D9OExeSad07GMZEm4PywKfd3leGmSN3KJ07mXtQkPjRBsz4zoUTSPTwIAcH0rDpcvut5DC2Zz
	OSAJJtd97WzCmFLjRQVIEmvQyJ9LdcsBBCwhHZZ5NruaPZXfzWqIZ+6HxAnI5yWZDBpWpJXEY0r
	38vr9s5dfqv7bk8dz1rUTOOwE7LcrDv5ZOpvonugLjLEdQsNp5FaifBcUnfqjIw927aOe4Nt/We
	Od3HQs8rVvOa+noFm9F+Cy4CglwmcGa5mWsUJKx8cyq10vKfLW3RciteozU8EAP63qrQWW9SWFo
	fHEyZoNw/zwbYTfKqC7XofIApzB/mMXK+K3k=
X-Google-Smtp-Source: AGHT+IHhhas8FsUsqJ6j67fNaXZBQPkxFiyb2zLje7llhnSBFbWAr4qyV+hOsdj+z7+wjEqYzgGNqA==
X-Received: by 2002:a17:906:4789:b0:ae3:eed1:d018 with SMTP id a640c23a62f3a-ae9c9982735mr1752341666b.9.1753036764679;
        Sun, 20 Jul 2025 11:39:24 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c703:7100:a4d7:50f8:78a7:9bfc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca5a029sm533406366b.75.2025.07.20.11.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:39:24 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/2] staging: axis-fifo: add debugfs interface for dumping fifo registers
Date: Sun, 20 Jul 2025 21:38:33 +0300
Message-ID: <20250720183833.3570345-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250720183833.3570345-1-ovidiu.panait.oss@gmail.com>
References: <20250720183833.3570345-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For debugging purposes, add a simple, read-only debugfs interface to dump
the following fifo registers:
ISR  - Interrupt Status Register
IER  - Interrupt Enable Register
TDFV - Transmit Data FIFO Vacancy
RDFO - Receive Data FIFO Occupancy

$ cat /sys/kernel/debug/43c00000.axi_fifo_mm_s/regs
 isr: 0x00000000
 ier: 0xfe000000
tdfv: 0x000001fc
rdfo: 0x00000000

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7897434f2441..57ed58065eba 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -33,6 +33,7 @@
 #include <linux/uaccess.h>
 #include <linux/jiffies.h>
 #include <linux/miscdevice.h>
+#include <linux/debugfs.h>
 
 /* ----------------------------
  *       driver parameters
@@ -44,6 +45,8 @@
 #define READ_BUF_SIZE 128U /* read buffer length in words */
 #define WRITE_BUF_SIZE 128U /* write buffer length in words */
 
+#define AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN	4
+
 /* ----------------------------
  *     IP register offsets
  * ----------------------------
@@ -137,6 +140,13 @@ struct axis_fifo {
 
 	struct device *dt_device; /* device created from the device tree */
 	struct miscdevice miscdev;
+
+	struct dentry *debugfs_dir;
+};
+
+struct axis_fifo_debug_reg {
+	const char * const name;
+	unsigned int offset;
 };
 
 /* ----------------------------
@@ -537,6 +547,37 @@ static const struct file_operations fops = {
 	.write = axis_fifo_write
 };
 
+static int axis_fifo_debugfs_regs_show(struct seq_file *m, void *p)
+{
+	static const struct axis_fifo_debug_reg regs[] = {
+		{"isr", XLLF_ISR_OFFSET},
+		{"ier", XLLF_IER_OFFSET},
+		{"tdfv", XLLF_TDFV_OFFSET},
+		{"rdfo", XLLF_RDFO_OFFSET},
+		{ /* Sentinel */ },
+	};
+	const struct axis_fifo_debug_reg *reg;
+	struct axis_fifo *fifo = m->private;
+
+	for (reg = regs; reg->name; ++reg) {
+		u32 val = ioread32(fifo->base_addr + reg->offset);
+
+		seq_printf(m, "%*s: 0x%08x\n", AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN,
+			   reg->name, val);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(axis_fifo_debugfs_regs);
+
+static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
+{
+	fifo->debugfs_dir = debugfs_create_dir(dev_name(fifo->dt_device), NULL);
+
+	debugfs_create_file("regs", 0444, fifo->debugfs_dir, fifo,
+			    &axis_fifo_debugfs_regs_fops);
+}
+
 /* read named property from the device tree */
 static int get_dts_property(struct axis_fifo *fifo,
 			    char *name, unsigned int *var)
@@ -708,6 +749,8 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (rc < 0)
 		goto err_initial;
 
+	axis_fifo_debugfs_init(fifo);
+
 	return 0;
 
 err_initial:
@@ -720,6 +763,7 @@ static void axis_fifo_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = dev_get_drvdata(dev);
 
+	debugfs_remove(fifo->debugfs_dir);
 	misc_deregister(&fifo->miscdev);
 	dev_set_drvdata(dev, NULL);
 }
-- 
2.50.0

