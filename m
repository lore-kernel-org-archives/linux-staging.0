Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB401FC7C5
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 23:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779406747; cv=none; b=ovtU9a45F6dX4qopsUv0lb78FVOQDeSXBgl+j6t6kBbvgTY0umpUTJxxfFexGcnwf6re1Yn/tWAL7GyAIhuOmFNj/ZIoAAfIcz9SrWZtM0S6WQAcs8sU2gXkDeoW+REOVYVL3bbtepLFWA72e2vi07kJXgDK4aX8+Hmg9IBlQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779406747; c=relaxed/simple;
	bh=VgM4P6VmmQDAtVUzLux6lDPATGngLORmv8sNqhiPQ48=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZGYBNMSwny7AtuRKocGrf3JI+37i63LVZfwaSGywRUEyaQZ/ThZuwKGLb0INYlZa+J23cdHxEmTj3YwtNdqBGkMX7c1RHWAgPsomfmtImVK0qwQSoeWpc4CWBYdWQsXFgp1e+jLYwp/tMY1OAaow8tQ2jQnWH12O583LOWEl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiR42DHS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiR42DHS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d75312379so5605351f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 16:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779406744; x=1780011544; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t02izQ9e9TF/DbVEahlzgCAQs0LqsXIISEUmrJQz72U=;
        b=UiR42DHS3SDH3SvdLVnA9Cd8lObHDJPuqmQ9QLX80nMet5a255PVIqM6y7NV3WT9nG
         ivQAHny9Z7zo1zJap7+j8Ox7qt/pFdI3Dk4wllRrKWsJinHiKennFziY0mfPU9YmUG1p
         lJjr1wzLxoC+LO/BZTg2z1hgQoTRTwfDFlDmP6wGXSDW7O1+ffLlLqMlBo7P+k2SEtCF
         TPInoBV8H2KZwW0EMyJuVxL/gA3xQ/00SNmeja6jYlDr93AgRu498fNRmlJFVoJOMs+r
         o8FVHtyL9twAqrbXCJ85cSNo7clxnh86LnqSJ9uJjDOD+I1fcYeqGda4QruI4ryhPCG6
         Z27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779406744; x=1780011544;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t02izQ9e9TF/DbVEahlzgCAQs0LqsXIISEUmrJQz72U=;
        b=soj4kI/dcr2asjgUCxIO6iiIed1h2cEI24J6JDVRebik8/r1PTxElZ4lJB/+3rnqjh
         33VHTRmHzg5b+lOYbdlnkCCXNggPXSOdvwsQ0hOgeZoIq5FA1c3e/UNQMa2F4idoEuhJ
         nj8Gk4/3FtwhPCkHFQjdvZ2Pwd9uyrZU+eGnrloGy1Cr1MUZqxEmTDyjmIHkyH33BAE+
         JBapB/9DJJhFiZIkZdD5j5/JVoUMzYX46ws0nt6stIhRGt/TtbUeoDCgz0vrAo8UL9yl
         OARaN5KhKKDcTXXTBqbspQkjX9pIWYsrWW5zDa2zEDNlpvXvwTGzXBz+E+dgklXOmlRO
         coqA==
X-Forwarded-Encrypted: i=1; AFNElJ+ltUQD4kxjAuYCC8D8M8vAT02oyMMnZtYwcizS8UYIlQ61oi9nJuCgZQQRY/1Av9TWZ1oCD/i4qCULotuC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0KJSYteGbhXJsRaeDLT1+RRWYu2KSUqAW+Nzkdz2iykeIYz1+
	DIhNX9bC6AcjIth4VFWjACNUxBsn12+CBDD++0cuVjGVFBKPt8qC13L3
X-Gm-Gg: Acq92OEl7pF0ZSPLsf5rZVvcwULezQr0RbupoOU3rCylFMHKpd33T9OpQgXSmgQAL6x
	oB79zH+WF4Ymn6qg6LMpwoZdn218+YhCgToNnTd3FO3fhrdbeaZFum0nKQyN81tiJaN8QANSS/i
	MaBDHV4s44bYHDXJkrBh98TcTkhSz89UdO1bPSKN4/B4M16y1bDWkyDASWggSh/a3M2ItiiTURp
	0XXY7MP7kOk/eVLgaMdvLxQK40fFp1S5t5VcoeOb5ZCOY9qCnysbQEXaQicKflZVujl8Itudlc3
	7XZUX/lWl/XQISIxglrb/hhaxe0gNZuVkKCopDImH1GGYoqg3uD/jMk62E4X8IYPk0qdgbsEArS
	ePXPsX9Mh5rM3bikEWfI/GFiONvnBWxn5eDgA8bRRTfaLKVSsksoNCGXwJ96gJ/w9z5pRlz8ZnN
	3ZFhfetnHpJtsGmWzPRx9Q4Mf6jp26GuA35vmazXWNP2LEd3DmqhxlOSPd/gRHVMS1lbIVlA==
X-Received: by 2002:a05:6000:2283:b0:43e:a8d8:f3dc with SMTP id ffacd0b85a97d-45ea31626abmr7678753f8f.13.1779406743555;
        Thu, 21 May 2026 16:39:03 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb496d451sm997903f8f.4.2026.05.21.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:39:03 -0700 (PDT)
Date: Fri, 22 May 2026 02:39:01 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: sm750fb: Change camelCase to snake_case
Message-ID: <ag-XlRifxjqXF-Zx@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change variable names from camelCase to snake_case
as per the Linux Kernel standards.

These changes remove 9 CHECK messages from checkpatch.pl
regarding sm750.c, sm750.h and sm750_hw.c

Tested changes by building the module sm750fb/

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 32 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 14 ++++++-------
 drivers/staging/sm750fb/sm750_hw.c | 20 +++++++++----------
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e82a..3124380beb81 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -622,26 +622,26 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pv_mem;
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
@@ -649,7 +649,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -657,7 +657,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	default:
@@ -755,13 +755,13 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pv_reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->pv_mem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
@@ -859,9 +859,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
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
@@ -880,9 +880,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
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
@@ -1028,7 +1028,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->pv_mem, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1059,8 +1059,8 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
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
index 67b9bfa23f41..19dbb91201e3 100644
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
index a2798d428663..238f3e97fa05 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -42,18 +42,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pv_reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pv_reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -66,9 +66,9 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->vidmem_size = ddk750_get_vm_size();
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->pv_mem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
+	if (!sm750_dev->pv_mem) {
 		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto err_unmap_reg;
@@ -77,7 +77,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
@@ -130,10 +130,10 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
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
2.43.0

