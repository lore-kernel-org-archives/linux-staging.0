Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3F263F2A
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533661; cv=none; b=S937B3TAEn9GlSua1YFI/Ng3oJJ+4zySUO8XF05S7h14BnVmPPTqbdgIYNHlMMW50SQ9yprZmolV/2KcRsvAfFsK3ZckWTMKdNW3DwSxvtaB59gvPAA026pESsbe2b6/wautVxtWGnOBQFU9/QplVccPZuLXkuUFxTA8/6KPDSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533661; c=relaxed/simple;
	bh=rUGDhfFDrk0MWHqYT1IWrnxD3W6PCHEf+7PmS9Epz3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFDVnMaS7JQ+SFxuSIkaL/Nr7T/kp4768yVDi2v8powJT0sKmI9psAtrz57w7K/7W8sk+0Tkd0RDoCDbXRAhm1ZURU/K8DpF7mRLizRBPh1OZGnCGxlMtTYIw8xTZzJzlZ6QUTxoSJYiFh2UMnJ4/0Y2f3rJ6pTid3tY+KDf2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4VSrAE0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4VSrAE0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394036c0efso12192335e9.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 03:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739533658; x=1740138458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUv19RGcYQpZSEBJ0Vtlqw1z83q+vhXACeQec7ri6KQ=;
        b=c4VSrAE0EuPPKBeq0JJZWbnKqcenwDD5WKp4Gf+09BPuEw+kR0I4zxr6bn5N8t3dn/
         TpareHGnyPVwuciCHqXB1SN9XhzvmQSiFNQLAjTDLUqGIjfwZrO9+kTvTh35tBnN1ZN6
         E2Pbo2ZSbqhxRwAa1pp6uGM5Lbjz1gboqJfYnQA6KNCpmO1iUu6vSZP/phpV+TUBrd0v
         6ms9irr6s7SaAb0Z3Fn0IfazQ7rqlDFctjXJvBWFPpTONuMcv7Wj3Uj9ATX780Lbmln6
         YI+tMQeR5bzvKY4QDkIczKt/eN0ReTwfhZVv8clJj5JJ/6eehButGZ8sAO11kqFaVBT7
         HrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533658; x=1740138458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUv19RGcYQpZSEBJ0Vtlqw1z83q+vhXACeQec7ri6KQ=;
        b=R1l5iw7M0IAVdGb4g4kfDYpo0RQEZjezdmhCvknUElmkFbvkKq4iiZJohWFZ0f125r
         0ho/y9X/Y4q2Z/QQGm/uPB1+rl5xT1D4L7f0ERoFQWs7vcqrLxaE4D+6tw8nmKyMZxZy
         Yden1mn/HAEJEpK/ErVT+RZnzG319+3NuqgrftihKKTAp4B6LX07c2h6ZdOWHsPrbADX
         3XBBAfVqoTcEd53674jrlLx34aHYAlVI73dKDC8kaOebR9H8RG7I9gG0rdev95s5HwZv
         iXZ4rL0jpFCTDRhU4FlIh6IgDjt0qfi8G98vjzUTuko9l+jQ37+xRT4JSM7d4TQ1SFz2
         6XVA==
X-Forwarded-Encrypted: i=1; AJvYcCU1rQwvJRsbPSygrWJ5aDF1JqiAiXZugxOTqZjQAOhHcOrB5MqtPjajL7n/IvK+qozNIp8yHhf9BQhhgIc/@lists.linux.dev
X-Gm-Message-State: AOJu0YzLi0ywGni+xqz6Gxh5E87p7BH4S8n4tT/s/A2zmIIIJ6POzyh8
	XLvdUfnO3bEgim6V9RwSsqo8bQwZtEReswqHJAlQawvlBHlWLvK9
X-Gm-Gg: ASbGnctlPQITotD9LZbCWzvg8NlNDiUyJbzMStAdCk/ag2Sb32eaWpdhzg7Sc0LFWv/
	eIJw+EtD3VGxMf5uarWejSJ26sxBXPnkkUITTQkY7COTb3P1QLY8sySOooEpvkNQUeBiiVTNyvA
	aZ4bFb5TGHCk0Gq/xLKHVljbLtCt8YdPm23aWyES/iWWwCJqd+zc79bxKNyeDd11A7FuSK6jlP0
	eJCscevXs9Ge4XkLlQ+FbylZObqGV1DqiU7VNGFuX9XJLwdsDxlFpZUt778HqBxyitcj3zUhkG6
	8/cP2qKR1EpAo3Fx4f5245A1uAhMOSJYu0GCTfslmqp7HBT+VJE=
X-Google-Smtp-Source: AGHT+IGEj1EojGorZkgQLdLeySDwST5jQV8w0POuV9puJVnFIALlKFtVNBNwfiSpVsq2bxTCXrNkrA==
X-Received: by 2002:a05:600c:4f0b:b0:439:554e:70da with SMTP id 5b1f17b1804b1-439581cbcfemr135289865e9.31.1739533657879;
        Fri, 14 Feb 2025 03:47:37 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fccfesm41945245e9.11.2025.02.14.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:47:36 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 04/17] staging: gpib: cec_gpib console messaging cleanup
Date: Fri, 14 Feb 2025 12:46:55 +0100
Message-ID: <20250214114708.28947-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214114708.28947-1-dpenkler@gmail.com>
References: <20250214114708.28947-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable module name to be printed in pr_xxx and dev_xxx
Use DRV_NAME defined as KBUILD_MODNAME instead of hard coded
string "cec_gpib" in pci_driver struct.

Remove "cec_gpib:" string prefix in messages since module name
printing is enabled.

Change pr_err to dev_err where possible.

Return consistent error codes with error messages:
   -EBUSY when resources are busy
   -ENODEV when device is not present
   -EIO for others.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cec/cec_gpib.c | 32 +++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 18933223711e..8f2b4b46a446 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -4,6 +4,10 @@
  *   copyright            : (C) 2002 by Frank Mori Hess
  ***************************************************************************/
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
+#define DRV_NAME KBUILD_MODNAME
+
 #include "cec.h"
 #include <linux/pci.h>
 #include <linux/io.h>
@@ -284,31 +288,29 @@ static int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config
 			break;
 	}
 	if (!cec_priv->pci_device) {
-		pr_err("gpib: no cec PCI board found\n");
-		return -1;
+		dev_err(board->gpib_dev, "no cec PCI board found\n");
+		return -ENODEV;
 	}
 
 	if (pci_enable_device(cec_priv->pci_device)) {
-		pr_err("error enabling pci device\n");
-		return -1;
+		dev_err(board->gpib_dev, "error enabling pci device\n");
+		return -EIO;
 	}
 
 	if (pci_request_regions(cec_priv->pci_device, "cec-gpib"))
-		return -1;
+		return -EBUSY;
 
 	cec_priv->plx_iobase = pci_resource_start(cec_priv->pci_device, 1);
-	pr_info(" plx9050 base address 0x%lx\n", cec_priv->plx_iobase);
-	nec_priv->iobase = pci_resource_start(cec_priv->pci_device, 3);
-	pr_info(" nec7210 base address 0x%x\n", nec_priv->iobase);
+		nec_priv->iobase = pci_resource_start(cec_priv->pci_device, 3);
 
 	isr_flags |= IRQF_SHARED;
-	if (request_irq(cec_priv->pci_device->irq, cec_interrupt, isr_flags, "pci-gpib", board)) {
-		pr_err("gpib: can't request IRQ %d\n", cec_priv->pci_device->irq);
-		return -1;
+	if (request_irq(cec_priv->pci_device->irq, cec_interrupt, isr_flags, DRV_NAME, board)) {
+		dev_err(board->gpib_dev, "failed to obtain IRQ %d\n", cec_priv->pci_device->irq);
+		return -EBUSY;
 	}
 	cec_priv->irq = cec_priv->pci_device->irq;
 	if (gpib_request_pseudo_irq(board, cec_interrupt)) {
-		pr_err("cec: failed to allocate pseudo irq\n");
+		dev_err(board->gpib_dev, "failed to allocate pseudo irq\n");
 		return -1;
 	}
 	cec_init(cec_priv, board);
@@ -355,7 +357,7 @@ static const struct pci_device_id cec_pci_table[] = {
 MODULE_DEVICE_TABLE(pci, cec_pci_table);
 
 static struct pci_driver cec_pci_driver = {
-	.name = "cec_gpib",
+	.name = DRV_NAME,
 	.id_table = cec_pci_table,
 	.probe = &cec_pci_probe
 };
@@ -366,13 +368,13 @@ static int __init cec_init_module(void)
 
 	result = pci_register_driver(&cec_pci_driver);
 	if (result) {
-		pr_err("cec_gpib: pci_register_driver failed: error = %d\n", result);
+		pr_err("pci_register_driver failed: error = %d\n", result);
 		return result;
 	}
 
 	result = gpib_register_driver(&cec_pci_interface, THIS_MODULE);
 	if (result) {
-		pr_err("cec_gpib: gpib_register_driver failed: error = %d\n", result);
+		pr_err("gpib_register_driver failed: error = %d\n", result);
 		return result;
 	}
 
-- 
2.48.1

