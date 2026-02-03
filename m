Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651BC36165E
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 23:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160085; cv=none; b=Tc5W0dwQpmRL0ykLBPzOeIybMFwRDoxdr5UrVOvMSFV842nIkTuHqq0sIdEIaK42R4/Fie75dIeT8xKCs4yplvRqLzQFac1qjzU1mnbTHIY211U4juTqqgwlAy+aGeJBsJdy9F61J0PHYFH500rvUTaWHabIsdgdBfYaipm7h7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160085; c=relaxed/simple;
	bh=Gcm1Iav91TTTAVj0nriWrXeBLn3kGO49ncq0sDbIYQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JzpakD3o1rkYk1U35nAj3LJdnklio2SWQZsAKAZnjhHoHVdCJ2HaTVQAgT4hH8LI7uPpFamLMtNH2PiP1nR9R08y15JBN7Twg8L/IDz1MYAsG14RXWACfkIG2ml4PqZh6tv6OZNGLPzy8Dz3nQF6/eeTsVHA+c3sHc65Q20BPAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmcdcQB1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmcdcQB1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b884d5c787bso1087339566b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 15:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160082; x=1770764882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8eVvK0hQtAaFSe0DxVimgKjYzP0klYwJacZB1JLMGw=;
        b=QmcdcQB1NzmDVZybMo6+NRveuIPt5Yk7X/Z8dO1msQiGWshoCj2Oyw6YpK96oFBLlP
         VaeKf/fwz/5NWAmdolnmfqVCe5e8pP2aZrsWu0SVeCTnhkAhOHI0i+8cwEny8VYxZey9
         LmmF1qHmZ+Q5KqLoT3agjr+rewH9K3UKd1E2I90zKhHQmR0SLfO/GSfwYDSGb4Ct3msb
         YYkN1MbBfG5EefN/E9vW81GeXKwEkrXA72odZxtXPnm8nVMC2N2EnWCnvcSOwPsbxStw
         4T+WEoEf/3/h3Wl4N+l2vcf3laEAJXh35UVKP+GU8bElL+tlvR4ahFUgbvorq/SSdTK/
         OVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160082; x=1770764882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t8eVvK0hQtAaFSe0DxVimgKjYzP0klYwJacZB1JLMGw=;
        b=KUkbI1M4ACAE8PbV9iaLV8Kur1GLHgE0kZZJQDdQ4WfUtN3AjyvyKh8eVrOfKLRHt/
         +wYMkJpxY9eR/+rUsf9g5h71CxrXkmi3kE1PPGFlHYz50oXs5nNW1RZXMOk9cHKe0E8+
         oXlUlbrHJdvyot0AXKxDbRHgOqM0n8EIKAGFAiqO8ivRSUAhF1KdoNV57qDtfp4UWPVa
         ZYk+rCEgMSj2TFxwSiDnlkvHWkO4X8Rwhi2CngD44n1Hu5ROKQ2mbippqkhZoHY1dK1U
         HKsFp0L8slRAppZ/0oRxI5xHoeNnryRNdULgMIbc1JUelyVs3ge7aMk2/98dkhX0kwBA
         x2sw==
X-Forwarded-Encrypted: i=1; AJvYcCVpfcmzUJtbf52ym46NCq9OS8+pboVUdWjsI3XxEXJcy9vLHBb8gje+msWxxspHqtcruYQJRWJ/fWm5OQZH@lists.linux.dev
X-Gm-Message-State: AOJu0YyrFkuIofMEudOyrGF45bGD7rJIy7FYqYlTGcVUDKS9zQR9pvp7
	ljVuIBYex50cmV+vMlIjVqdQNLe9m6aevUfZCac4InJr2zS0mJ43u1KfuG3GyhGoKFXTF/HF
X-Gm-Gg: AZuq6aLPBps5uqSStCx5jiGXbF6CjfQnC5C5UWXFHmnnzEznp59hY4gCkHuC5Sv9EXr
	6t6Wg0OZXW4nm8j+u4gTXnmpVjLRPgQGRIdDWrKvErBXWiuEdanrsboeqzWYepQQKAzoz+i+17B
	fg7B+dOrLpaIUgM3VYv5dhkq9pglaWGmkjgnvayKKxL+2sU79P7rtp4v2OY1D6zj7PgUYkoAn5t
	0Kcp1XBTfz4ip8GARW/YNJckVG861DmpxKyF66ewXiL4M+LVMDYUaPRGvOmUW7QeaZ1hzTf99FH
	fiqXmhTwtKUZMRqLHemvjHQRLdYF+pLaeeNsp1G4pw8zZnQF2ZqNIak/78MWCgn5n0iESVunCWJ
	XSeDFrCnSJMm4Zsxw457wfEzYumW7UrKfhGEvj2aUQKQ67An+r8Vd2Dky4OKK6GteS7vJMdjvbt
	1LV+0jZT9TisYn19vf5J0kRxPS0jbNncdWZyOJTiYoVB4brw6QiaP4SNoK4H7zfk/nugEcpBY1c
	xyKTFw+MAbxYqODv1992pVAmzxQEYcAIkksvvPi7FKdxteOVV4Swz4Qqw8=
X-Received: by 2002:a17:906:7304:b0:b8e:3877:d1b2 with SMTP id a640c23a62f3a-b8e9f0a7a53mr74983166b.16.1770160081720;
        Tue, 03 Feb 2026 15:08:01 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.od237066db22328bb-tp.internal (33.242.13.34.bc.googleusercontent.com. [34.13.242.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0021b3bsm38486566b.49.2026.02.03.15.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:08:01 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH 4/4] staging: sm750fb: convert pr_* to dev_* logging in sm750_hw.c
Date: Tue,  3 Feb 2026 23:07:58 +0000
Message-ID: <20260203230758.3056-4-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203230758.3056-1-iprintercanon@gmail.com>
References: <20260203230758.3056-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert pr_info/pr_err calls to dev_info/dev_err in hw_sm750_map()
and hw_sm750_inithw() where struct pci_dev *pdev is available as
a function parameter. Functions without direct device pointer access
are left unchanged to avoid unnecessary signature changes.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..60f9f7135 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -34,7 +34,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->vidreg_start = pci_resource_start(pdev, 1);
 	sm750_dev->vidreg_size = SZ_2M;
 
-	pr_info("mmio phyAddr = %lx\n", sm750_dev->vidreg_start);
+	dev_info(&pdev->dev, "mmio phyAddr = %lx\n", sm750_dev->vidreg_start);
 
 	/*
 	 * reserve the vidreg space of smi adaptor
@@ -44,7 +44,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 */
 	ret = pci_request_region(pdev, 1, "sm750fb");
 	if (ret) {
-		pr_err("Can not request PCI regions.\n");
+		dev_err(&pdev->dev, "Can not request PCI regions.\n");
 		goto exit;
 	}
 
@@ -52,11 +52,11 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvReg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
 	if (!sm750_dev->pvReg) {
-		pr_err("mmio failed\n");
+		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
+	dev_info(&pdev->dev, "mmio virtual addr = %p\n", sm750_dev->pvReg);
 
 	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
 	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
@@ -72,19 +72,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 * @ddk750_get_vm_size function can be safe.
 	 */
 	sm750_dev->vidmem_size = ddk750_get_vm_size();
-	pr_info("video memory phyAddr = %lx, size = %u bytes\n",
-		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
+	dev_info(&pdev->dev, "video memory phyAddr = %lx, size = %u bytes\n",
+		 sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
 	sm750_dev->pvMem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pvMem) {
 		iounmap(sm750_dev->pvReg);
-		pr_err("Map video memory failed\n");
+		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
+	dev_info(&pdev->dev, "video memory vaddr = %p\n", sm750_dev->pvMem);
 exit:
 	return ret;
 }
@@ -163,11 +163,11 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 			 * The following register values for CH7301 are from
 			 * Chrontel app note and our experiment.
 			 */
-			pr_info("yes,CH7301 DVI chip found\n");
+			dev_info(&pdev->dev, "CH7301 DVI chip found\n");
 			sm750_sw_i2c_write_reg(0xec, 0x1d, 0x16);
 			sm750_sw_i2c_write_reg(0xec, 0x21, 0x9);
 			sm750_sw_i2c_write_reg(0xec, 0x49, 0xC0);
-			pr_info("okay,CH7301 DVI chip setup done\n");
+			dev_info(&pdev->dev, "CH7301 DVI chip setup done\n");
 		}
 	}
 
-- 
2.43.0

