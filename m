Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05D3D9021
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200141; cv=none; b=IU9/EIQQJEj6I8daX6J4RO10F2bhKDez9PWFrpq4a5H8zO5d4L6IwrEqRAjrllrwVWq64sSP53aagv3ogq9r7R/4LkAyhqLCYISqVGKhL8CoTioFpVnT7TX1fLMo9ctejZG1l8D2pQ0sZABTnnU7xdnxjtiMxPF87Y9jvhtrSPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200141; c=relaxed/simple;
	bh=bMxUq70RwVuk5iigpePsp7XMrOK64peoAD9t3HviJFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlQedzPyEmNuLmll9qwTiNWInI4FDdRn/gXpGDHQqVgoH8eQTO37AqFzFHOmqKK2nJMrB5/+co2kSlKLThY/Lydvgdv0yah8HQFOJII+i9LYgCR6KyfggUgY6kgNgGxVI7VpbwLgeOLzdZA5Zq732UDtr7XpVEcr5xiMnG0rqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThNEqVN2; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThNEqVN2"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65939428896so2551162a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 02:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200140; x=1770804940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McnoIwHymvcTqEFWu2XGqZPzlmsKHzZzIUqEBe0TJKw=;
        b=ThNEqVN2vEEQ/Z55fwi1Q910XfYzhNcgmOuGaKOULuPTc5fswK8j3MINoch1wplNLk
         9gIOIMNE/h7Visj4W9EM6bWLyuS42rIQpu9UfPSWFW/VhdpWJHRx9xND4BJpmj5uRp7e
         Kab+qyVxoh2Wb90ymAmWIoUCKC879uWeNkSTB8NV6JrFqDj/JdJySccnSsREopqRm1Jx
         +oW/8kQkWqKQz+S+ntCGUZA8YhbCa+QZHdw494zxMD5Yqriy6pNIbPEjOGah2Ys6TLvZ
         7NNgmre1/buYyRxIi4rWDHd2bE2yjjbb09e5yNFcgx8V9EDN+VjIq0g2W7Tjv+27ZAhn
         G+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200140; x=1770804940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=McnoIwHymvcTqEFWu2XGqZPzlmsKHzZzIUqEBe0TJKw=;
        b=gRtCqlivWIfd4Dc91xVEp34pqYveR6c+k6NphwbGoVGebaJM/6+WoxtS43BtOrVaxt
         BO3F3kizHQiCbQnSZ/DM+xtklBubSk/Li8Gv3Q3QH2Ah6Tbf7vMVOf6ktKGimpYu8pjs
         G4XKgwQaRFIKIbSfln9OZ2BHAP4TPU/wSubanyL+3kgTwa+tJ3xs3SQX0uONkVV8cGl6
         PJungIV7Faow5uctIZjPPFnWRqi8my37J8bzidnI76wS1E6ca8OPpKSatIahtWvncnpv
         7pifKde0MSDAUqjNeOKKQaTrGXysDO0HdLbJAKniUdQl4uE9emQdUn20Sh9H9J8eG6QD
         m+7w==
X-Forwarded-Encrypted: i=1; AJvYcCU/f9Ywt2bYSInAnhosrJOhL9dI6kEgnQOusJEyOqOLq/U85MJVspQHrw+DFTVzO1D1SgA9ybBU9BvA7s76@lists.linux.dev
X-Gm-Message-State: AOJu0YzhKpbY9AKbYGzHPZgvJEDuNPs1IKb4KH+lplmvMXu8eT/Yey/b
	ezYL1mKrDMprBrLIDCWeUupMN/ds1xVVxVWid5zeyMPOdFxeHGMxWczu
X-Gm-Gg: AZuq6aKG7AJN3vmzmi8zOqfa9jZtzSViqwHBgrYYHbzKIUV5ctnlFJlIEjOsopmnCSh
	eZu0HmCbQt0AdniETBlgnZ0iE+1UT6jqiP7QM9LRPHPXRy51OepS5OuOn2ccmMuFqpQGnURNV4X
	ZMQmodlH5oMTJSCW5fxVn6Rc1oFLcH+zZswnJGHUFbL2DZ089mw68AnqY4L88grhNii96U+4Yxy
	V+OM9XlgUGsjBQTEkJrlaHJvplg2ayI23d8JZ1/dPNiGpYJqEousroKS67uvEhoKbyLY6nSbS4G
	TQHHQn2cZBbjIxDRHTkZk1N1VQ5nQOrjv6a6DSguYMB/Th6ho7BPE3ryTembQ3GyQgaONMKbBiA
	7uqMCE71SXat3fKRVGnoOA323RAbIT4qRm+FispFYoIb3USjhOaR8WoU6eUSgsyV+DA9pbYHBkg
	5JH9teuJY0rWuPJPSlLEB0WHIIWbrj1G2bxajB6H8YR6SEPd87wsD1i69wCk/SSsKE+N4WJ7Xay
	0UnnhhPvx23pJrF9zzorc5trsgRFlEEVo2ITMaKC9Q/ss7NUAP4TwVOd9nzmQ==
X-Received: by 2002:a17:907:9409:b0:b8e:8874:8384 with SMTP id a640c23a62f3a-b8e9ef30487mr155370566b.4.1770200139491;
        Wed, 04 Feb 2026 02:15:39 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.od237066db22328bb-tp.internal (181.183.90.34.bc.googleusercontent.com. [34.90.183.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fef0e17sm106440366b.33.2026.02.04.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:15:39 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 4/4] staging: sm750fb: remove debug prints and convert logging in sm750_hw.c
Date: Wed,  4 Feb 2026 10:15:36 +0000
Message-ID: <20260204101536.3311-4-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204101536.3311-1-iprintercanon@gmail.com>
References: <20260204101536.3311-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove diagnostic pr_info prints that dump physical and virtual
memory addresses. Convert remaining pr_err calls to dev_err in
hw_sm750_map() where struct pci_dev *pdev is available.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..420ebe057 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -34,8 +34,6 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->vidreg_start = pci_resource_start(pdev, 1);
 	sm750_dev->vidreg_size = SZ_2M;
 
-	pr_info("mmio phyAddr = %lx\n", sm750_dev->vidreg_start);
-
 	/*
 	 * reserve the vidreg space of smi adaptor
 	 * if you do this, you need to add release region code
@@ -44,7 +42,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 */
 	ret = pci_request_region(pdev, 1, "sm750fb");
 	if (ret) {
-		pr_err("Can not request PCI regions.\n");
+		dev_err(&pdev->dev, "Can not request PCI regions.\n");
 		goto exit;
 	}
 
@@ -52,12 +50,10 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvReg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
 	if (!sm750_dev->pvReg) {
-		pr_err("mmio failed\n");
+		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
-
 	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
 	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
 
@@ -72,19 +68,16 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 * @ddk750_get_vm_size function can be safe.
 	 */
 	sm750_dev->vidmem_size = ddk750_get_vm_size();
-	pr_info("video memory phyAddr = %lx, size = %u bytes\n",
-		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
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
 exit:
 	return ret;
 }
@@ -163,11 +156,11 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
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

