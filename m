Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDA4289378
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853710; cv=none; b=t9QI71rRNWEtcPy+vAiTx9s6anF5sI/yG73VSCr33ivGX1Hun1zJALaPE5wU7/BEOe4scuPjlJi9fv6tgwT8H8Id68qE1Cx4QYPEY89UGJzI8N3yJUt3BtQSUzWWGhQREsq8q3c6Q1LyilkaWuRnHQ7/t3wg7Yld5W4AzlBvWEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853710; c=relaxed/simple;
	bh=qmm88Q3R4+5i5LLT6DYh6JPd2MSRrSK5lg/+Y+n1XFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BukJ6sVIwkAJL1aM2GlJz4e6Wuu1tMJb6USOPu+OFPC7P/8rJpyie8HTcoTWvswSaIfWqKJaXYeZud1XOCsxoAzqmyyby7QFbUuTaPIjMr4WtXyQ/R7ZU5inaQWDYXaam5ScmS0KbkZDdWYBGHdIDAg+W1AYW47ngOW6JTjWajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8wzU2w8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8wzU2w8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so690485e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773853707; x=1774458507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwzj2gDw7TQBmXoEYBsIkPtXCiHwzDroMiNr++cs6Qw=;
        b=m8wzU2w86VXxu6qfCGAsAzyv14F91Q9XjhzkHffAZgroCP6XByrpziyKRKjE0dCGnY
         1V7hW//XUrRr9sdagH7A3wW5ZczTFZqkIQMleFc5PtZYWZsZ+6Exxo59GloNCOIVrZTD
         Qr3vSgRxHih/4nr98fe6aMIve0qY6DqBhMv3/cWcQZjsON5Z+xklBptuV3yc0pMgZi6n
         txxzMvG8NDzoodBznIQstu5pEwWlcwbEfeosrs+wbCM4WH+4ONyVe//VIYBeINvPMLV1
         OGIFFrwfTR0hnaXHtAQx/qXnb6JZOfPgV3xhxLf8lbtNTP7SQLCUPAfGPgiKNxJXeGG7
         dmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853707; x=1774458507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwzj2gDw7TQBmXoEYBsIkPtXCiHwzDroMiNr++cs6Qw=;
        b=rO5jomALlkI9GwHOtZybVVeMlbG5kVh4kWK8Qasg71p2XeW9YxNEbiz1Re5D0mp3IL
         IizzyTuESTKQJxIcL2cbyuDngdQGnDXw2WzMVcDI48rxuEl4CqUQnqk/JBEW4kBy3LTU
         hU81HITf5ECmz0DADc1VNPfh8CyxUwzJBYOE7pY2SILdAXOuGRb0xSR1t5XTj+JB9/n3
         +/R/Z051xdgpZ5IAu1SpTx+snUa3twyRYMUFyqGUGTdXH1LK2+BlT59yGZPTIBkdDW1V
         uBDve+/nu/SB8SycunIcpOIRi+V98U1D+TNKcnpQ9fWPqclbvCxW+ADltxK02RjrUvWN
         Ed/A==
X-Gm-Message-State: AOJu0Yw1AzhbiKSh0SWC+vZ94kaugAEKCFnWvfiu7LLeYtQ3Lnp3aWmi
	ayE9u5cnj06x/F3oZ0lZ8Z5fV8QxCoZ0dyqRewG9AlOK9tQH6Yifv/Og
X-Gm-Gg: ATEYQzzFViz+3AjwKQjPUe88tpqCrvhUHhyopPb94MVN1G+WXA8GiACCOE+zaX55pCL
	ruJWePZqirdg1LgrWV8XpMw6iLZBrBh3ylGwlq0IuyEVDNWg+yyQx0TEOD1sykF8P8GqQvB0otc
	TFlqHI4lb/lNh89vOiu71gcnOwifrjCd9YRTA7nEsSnJqe/Jkx/EwLP4WnPaJn0MW/jDccg+WFA
	urNIereECG2JUquZ7M08FxgRZpGJ2CE+MspfZhs07lvegYgi+qH5GuUDaytOrwtJrFAnJr47JCl
	TokxkwpFQF8onO9fm1HGLr+E8G5jVBAODOsjnZ3o6jum2JXkte8ZLjSfMxUaPadbSIJWyyzd51M
	eyF6xwrV5oM7EYggvrgDsbfJXT7r674azagHvXdL/Vbb2Emx674046xSxU3SiwvnCeOi8ZGdZcX
	w/98dYj0+Tj45wIYN1p6Qj/PJibhVHqDTtKXArTTooSNPHOFtvVYnfZ9e75DdQbg9AjtTKNdzjt
	Rg3YOkk8O99IB5V09mL7TKR
X-Received: by 2002:a05:600c:4fc6:b0:485:ae14:8173 with SMTP id 5b1f17b1804b1-486f442e5edmr66722145e9.1.1773853707142;
        Wed, 18 Mar 2026 10:08:27 -0700 (PDT)
Received: from 192.168.1.39 ([105.156.117.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e162e2sm19096095e9.34.2026.03.18.10.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:08:26 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v2 1/2] staging: sm750fb: rename pvReg to mmio
Date: Wed, 18 Mar 2026 17:08:22 +0000
Message-ID: <20260318170823.53345-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318170823.53345-1-inasj268@gmail.com>
References: <20260318170823.53345-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename 'pvReg' to 'mmio', a more meaningful name that reflects its purpose as a memory-mapped I/O pointer. This improves readability and aligns with kernel naming conventions by removing Hungarian notation ('pv').
---
 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..56c03078f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -764,7 +764,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->mmio +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
@@ -1121,7 +1121,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->mmio);
 	iounmap(sm750_dev->pvMem);
 	kfree(g_settings);
 }
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index fcb7d586e..f7501a46d 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *mmio;
 	unsigned char __iomem *pvMem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..e62c090b2 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -49,19 +49,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->mmio =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->mmio) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
+	pr_info("mmio virtual addr = %p\n", sm750_dev->mmio);
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->mmio + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->mmio + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->mmio;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -79,7 +79,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvMem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pvMem) {
-		iounmap(sm750_dev->pvReg);
+		iounmap(sm750_dev->mmio);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
-- 
2.53.0

