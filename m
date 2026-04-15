Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A252868B4
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 03:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222562; cv=none; b=fLV99FcxBr5YR0VXP9HNeLL824tDkR9JNVGVACiK9A9w4chTPpFvNatoKrdzQD8YASqKV06SBI9EuhMq3CUFO/wqsdrTrhrPJWsb0j+r3DkudyqmHjWl4PrT3my7GIo1aTK7roR3x5mKt3+AU/4pvT6Lu1kivCjyo0Dh+C2OeYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222562; c=relaxed/simple;
	bh=P+/fpaiOr+yGx8YxhbOZLBJcdwRPhGp6xwPHSxQ09Ng=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KHzyIQWrF/WSDwEcSja1SWhqUzQKXrcG/Z8n5a8jid2k1eXndBTx+Ax4t21yNcWAk/Vo57/Unv9wu/8M2oGna7RCv9SkwpGst6le9HEN7hU/jiTkgEejdn5tXr7GgPFQhHf55C7VevD0pw5q8Ium4C574cvMKt/wTpGzh99PN4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfR+wTdn; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfR+wTdn"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-605823aec55so3684899137.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 20:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776222559; x=1776827359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4rltyAtkLRVvEAe+zRYD1vWrUOy3L/rsK75uT6GJfc=;
        b=mfR+wTdnxw5X+ndVROibQqGf2ItWzF1cn/BIBQf1gCnoShocCm03BlhiwHF1Stufmm
         OggMA6rueQop3Mnyjtc8/GJlCL3YqYjuojKiab5A6A1qdlLYM0UiUU2vJ8hpgu/GYATb
         0njOU0XRFTOBaH+QI9VV2E9DY/PD+qMRjsnZkcKp6mdxWJClmUYqg8wlZI83gAGPR/IZ
         Cs7AM1UJykGVMSbzyI6YzqUKhVGkFhAjpi5JynClZTmy9jF/q7P7kG3/WBNnDI3tCV+0
         3T4NivBKpsxYuSjnabspImYh4LbAqvOEYb6xBxpK1DYMCP4DW4vC93Q1zvM72MRlGgjJ
         p2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776222559; x=1776827359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4rltyAtkLRVvEAe+zRYD1vWrUOy3L/rsK75uT6GJfc=;
        b=Qf7ICUXT07MGhteJzr8D1Zvd1eosme+uebU3CU/npDWOsHjp7/K5z5l/gIkMtZleAa
         swY5oJ91saoaPSFlBqHw70+h1hU2fOYtBWxuCHFupE3PrUscdRIstxpY6cftW6puSFul
         u05lMzlkP1uMYAKEvml4/4opy/PLFQRQtd0wRpI2ycPrGdsawxZgm1qhikEQ5+JdIQ5A
         +WidFEMagz6FWgef7V77JIB3LGGSI8zI2ZdwOJKjhT+vzDcqgFg91P7SOx8espMxxOoZ
         xH9L5w43+JQQFWPuozqzzA1e/UeVSUIUVEJAYXS2DHE3TYua0lqRDdkFM2u8RoH0nSXX
         7zBg==
X-Forwarded-Encrypted: i=1; AFNElJ/CKwQbzMVHSgD4L5nZMs2RZDkzs/Djx/DfmBEY1gW4U9jxKlk8GAk2kQfzSjYStxj3WM5AXR8E6lAHsx3E@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1ImWqBZ9Ll8+kS1wFE7SLQaQ9bwxNkA8NNHPfM+9YwoQSqOk5
	MIBdGZJS4gsgHUZvkZrVlYwpKwIPlgXziDRj0EBoY0g9lqhcTR0KPFZ604Fp74Gw
X-Gm-Gg: AeBDieu62Ldlq01fj9dcuebCCvsKqHMhpsAak5nL/8Awuzy4jsryeQQGeby12cXPwzy
	D30PE93I2EpiodR1eTgmyINnZ8vxG5/1yqo7SNgeoj0Kx6GGxUI+pF+Y1Dujy1xbn1KDjiLhlX9
	mHljxNXa58eAGYbnRGFjVLh6HNEe2FFlR60ZrCqm8oC5YPgXhNNzCjl4wIll8din15zRBkWxDlN
	5nvYG94+PIePkkH2E+VV5Jfw5Gnr3zBK4LRmPsD5aviH/iGN+/wYueKCoeuzyBtKWv0jPVWZWna
	9TkmNJiM8WnzMzRZeuPTxaRdiFGDzrGORpzglEpm0TyUV0r2ja4eE37l+cL7FzvjzvK3BIViPww
	HJ7NCTz8Yqsb8OK25ciXMaJdAgy1FRGOhViizpn2+7FKxs3AqCZ5vy3y7/jMIKqDhJuU8M4aP1K
	XUP0ozN6jvQQQAE2c53AJRXRleZTy1K7Dm+8HHU/aCmB98hNiXdqABZdI9SdBLSleOA9N4nbaEC
	PdVhxTPw9eISJRLeRkJiDdoaskLZZgw017iic5zMbPvUzMZbxT001vv
X-Received: by 2002:a05:6102:b15:b0:607:b901:5d74 with SMTP id ada2fe7eead31-609fedc3ab4mr9535394137.9.1776222558608;
        Tue, 14 Apr 2026 20:09:18 -0700 (PDT)
Received: from Robertld.localdomain (99-32-177-208.lightspeed.wepbfl.sbcglobal.net. [99.32.177.208])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612cf10c20csm182298137.9.2026.04.14.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 20:09:18 -0700 (PDT)
From: Robert DeRienzo <rlderienzo@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Robert DeRienzo <rlderienzo@gmail.com>
Subject: [PATCH] staging: sm750fb: rename CamelCase variables to snake_case
Date: Tue, 14 Apr 2026 23:08:55 -0400
Message-Id: <20260415030855.433270-1-rlderienzo@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - pvMem -> p_mem
 - pvReg -> p_reg
 - powerMode -> power_mode
 - setAllEngOff -> set_all_eng_off
 - resetMemory -> reset_memory
 - sm750_doubleTFT -> sm750_double_tft
 - sm750_dualTFT -> sm750_dual_tft

Compile-tested only.

Signed-off-by: Robert DeRienzo <rlderienzo@gmail.com>
---
This is my first contrib, tried something approachable. Feedback
obviously welcome.

 drivers/staging/sm750fb/sm750.c    | 32 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 14 ++++++-------
 drivers/staging/sm750fb/sm750_hw.c | 24 +++++++++++-----------
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 62f6e0cdf..399a48df8 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -624,27 +624,27 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pv_mem;
 		pr_info("use simul primary mode\n");
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pv_mem;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
 			/* not consider of padding stuffs for o_screen,need fix */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
@@ -652,7 +652,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -660,7 +660,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	default:
@@ -764,14 +764,14 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pv_reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->pv_mem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
@@ -921,9 +921,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
@@ -942,9 +942,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = sm750_double_tft;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = sm750_dual_tft;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
 			sm750_dev->pnltype = sm750_24TFT;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
@@ -1090,7 +1090,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->pv_mem, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1121,8 +1121,8 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->pv_reg);
+	iounmap(sm750_dev->pv_mem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
 }
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 67b9bfa23..19dbb9120 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -14,8 +14,8 @@
 
 enum sm750_pnltype {
 	sm750_24TFT = 0,	/* 24bit tft */
-	sm750_dualTFT = 2,	/* dual 18 bit tft */
-	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
+	sm750_dual_tft = 2,	/* dual 18 bit tft */
+	sm750_double_tft = 1,	/* 36 bit double pixel tft */
 };
 
 /* vga channel is not concerned  */
@@ -39,13 +39,13 @@ enum sm750_path {
 };
 
 struct init_status {
-	ushort powerMode;
+	ushort power_mode;
 	/* below three clocks are in unit of MHZ*/
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
-	ushort resetMemory;
+	ushort set_all_eng_off;
+	ushort reset_memory;
 };
 
 struct lynx_accel {
@@ -97,8 +97,8 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
-	unsigned char __iomem *pvMem;
+	void __iomem *pv_reg;
+	unsigned char __iomem *pv_mem;
 	/* locks*/
 	spinlock_t slock;
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index f60b152a6..756b9beb2 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -44,19 +44,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pv_reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
+	pr_info("mmio virtual addr = %p\n", sm750_dev->pv_reg);
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pv_reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -71,19 +71,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->pv_mem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
+	if (!sm750_dev->pv_mem) {
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto err_unmap_reg;
 	}
-	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
+	pr_info("video memory vaddr = %p\n", sm750_dev->pv_mem);
 
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
@@ -136,10 +136,10 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		switch (sm750_dev->pnltype) {
 		case sm750_24TFT:
 			break;
-		case sm750_doubleTFT:
+		case sm750_double_tft:
 			val |= PANEL_DISPLAY_CTRL_DOUBLE_PIXEL;
 			break;
-		case sm750_dualTFT:
+		case sm750_dual_tft:
 			val |= PANEL_DISPLAY_CTRL_DUAL_DISPLAY;
 			break;
 		}
-- 
2.34.1

