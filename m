Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0337998B
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769361; cv=none; b=GyyGIqbo6loaUV9yOYbunKoAeM44gVABcGo9nUdf5v5FMi7p9+q+WKH/cL1Bd5QDo/6WdOmRnIoMnvoEkqnK04yNIAHSKvO8tiHomtlG4ZqXXC1EXnmG6WJVydHf5Dl5yOic8EtHQPtZmvHjOzhat3Xw7IwDMV3/4SJDgJwhUNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769361; c=relaxed/simple;
	bh=8S894g+of+KgLmYXhYG1kA9Nib+4DdoIynUfUkLZNgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGVA4GJZLMpEf8I0i8mW4BShRhK45Iqk4SZCQ4VYHi2Vprt3wWfYrgfMwQjO9pozG3rmNf5Q6TSDxkv1Sbr0+A+vXPFe5U15xZdaOdsMSJGzr298ztOrv6qHY3JDA0fWb9R+kJO46OjxCWKzg1DKcdmgh+zcPMozIGBVbB8So2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqsQwxs1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqsQwxs1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso37886665e9.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773769358; x=1774374158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1V68afDhSsVKc73b2xEDN0RHCVmZFBkyIM/RChmJJA=;
        b=EqsQwxs1HuPcVOhTxc0Voy0qPEQ+j8lfD+OLekyHMKOUXUpKLGvR3pLL0Os1/ZaaeV
         Th6b0xbjxfk9Bef/d/u/thA6op1lwUebH1SLRHW9Ti72LarJsrTfhgpiZYSFme6aFzvD
         +yChDp3brTKrYmxfbN8znCtbMoIshrzwyBm+TfztT4prwzNV4hW8V/bJSGer71ocYR1C
         MkzJ8UuLwXNVfVLkDsquD8+zDn6w1dkeOsIM210NVx+d+JgFPFvcsTELXcAu1sOzkYaX
         0U5jY1S3S3ooWkWZytiHGmdk8LL6EYOqBV+QOScpwmQHLjSmBOKqyu2k3RP0GU82F/nA
         KW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773769358; x=1774374158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1V68afDhSsVKc73b2xEDN0RHCVmZFBkyIM/RChmJJA=;
        b=YamHDSTzZ2iV7VwAr3D+Eh9CA3fFSiIHtQboQLFaR6BKhnor3S9/WtcJeEDxbxfPMg
         rSPhWcAreAhFRg2B+Cs0hRDgfFW1UAEbaWZdGORKS2AKb61+g1h2yTomM31sCFCxl9dK
         kTs0IN7byzv0oH/3VVdyLj5BZUglOgFS5Benas05VkYpxWLiapFapnalDm5VhoFtfzle
         THNCJ5v2qVnlUSs9R3fprRPhqVzOAST6kEb3MjAhdTSsGcBjdWRZ9m6QBFpK/YfxWNRo
         j85YKyVb5xuMwa5neWkSVtdJRCeFSwdEZdf5QK0/b2X5D1ismAGNg8rg19BfqON3unp/
         xj+w==
X-Gm-Message-State: AOJu0Yw1iJNHjXWtWoWd7LTXOdl8Hh8RNb103O7uQUBbHvGSdiGctlPQ
	AabDlfh/+hpcuAyq1x7RwJHhJYlSRtReX0rN50D+mljwrGxEp2yR4EiT
X-Gm-Gg: ATEYQzzWP26Oui766i5p9TfHV7tGsOVb+NLq+YUyi9Ip1n5C2xZ6OYk7gewQ9Diy3mS
	0jmbHd+UnYblV0Sg87LhFgF23DODnpMdW5mN5z5GrXp7yxfHV8qpV8SBTLbw4+YpFfNnhEEBbra
	rbJi/w0KxDHsNdYCGv1X3givA4JqALIIJZVTiKenIZ9ss6O/FElL1bCUNb6r5veUqt1K8A0Ngvx
	qPnZNfeBlciwPQACr+8/MpeIGM6wMJT//CEFwtHMYcZsskqbFY+/32fxJZvmBkFJb6xJzs/fnWx
	go11tNNeTWx8gqestrzC3AUYM9NGnC77n7bgGM/ov62w/pK5HoKpuoc3C8K/Yv5ZfjQgtkRpM/r
	4ERWm2uxmU5LorpgbGZMi9Qh+F8fY9x5J1ZSC2q1QkUMrnFTjvwBDe1HBIpjRaYw3q9QXZjRvje
	D0RtF9qQOKHSiLapchcRoj35wQ0Lzt190GirT5SnwsRvbYspD8lhtgwYoMOuMaq2WdwU8mL/YAG
	+yimCcZxFA=
X-Received: by 2002:a05:600c:46cb:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-486f441fa89mr7064325e9.7.1773769357434;
        Tue, 17 Mar 2026 10:42:37 -0700 (PDT)
Received: from 192.168.1.39 ([196.77.30.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3037sm80725375e9.11.2026.03.17.10.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:42:37 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: sm750fb: fix CamelCase naming crimes
Date: Tue, 17 Mar 2026 17:42:26 +0000
Message-ID: <20260317174226.167865-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750fb driver had several variables using CamelCase, which is
discouraged in the Linux kernel coding style.

Rename the following variables to use snake_case:
- pvMem -> pv_mem
- pvReg -> pv_reg
- fixId -> fix_id
- initParm -> init_parm
- powerMode -> power_mode
- setAllEngOff -> set_all_eng_off
- resetMemory -> reset_memory

This improves readability and brings the driver closer to the
official kernel coding standards.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 38 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 12 +++++-----
 drivers/staging/sm750fb/sm750_hw.c | 24 +++++++++----------
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..967fd2180 100644
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
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char *fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
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
@@ -862,7 +862,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strscpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
@@ -918,12 +918,12 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 
 	swap = 0;
 
-	sm750_dev->initParm.chip_clk = 0;
-	sm750_dev->initParm.mem_clk = 0;
-	sm750_dev->initParm.master_clk = 0;
-	sm750_dev->initParm.powerMode = 0;
-	sm750_dev->initParm.setAllEngOff = 0;
-	sm750_dev->initParm.resetMemory = 1;
+	sm750_dev->init_parm.chip_clk = 0;
+	sm750_dev->init_parm.mem_clk = 0;
+	sm750_dev->init_parm.master_clk = 0;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
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
 	kfree(g_settings);
 }
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index fcb7d586e..f17a2392f 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
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
@@ -97,12 +97,12 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
-	unsigned char __iomem *pvMem;
+	void __iomem *pv_reg;
+	unsigned char __iomem *pv_mem;
 	/* locks*/
 	spinlock_t slock;
 
-	struct init_status initParm;
+	struct init_status init_parm;
 	enum sm750_pnltype pnltype;
 	enum sm750_dataflow dataflow;
 	int nocrt;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..ce6a0d2eb 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -49,19 +49,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pv_reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
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
@@ -76,15 +76,15 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->pv_mem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
-		iounmap(sm750_dev->pvReg);
+	if (!sm750_dev->pv_mem) {
+		iounmap(sm750_dev->pv_reg);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
+	pr_info("video memory vaddr = %p\n", sm750_dev->pv_mem);
 exit:
 	return ret;
 }
@@ -93,7 +93,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 {
 	struct init_status *parm;
 
-	parm = &sm750_dev->initParm;
+	parm = &sm750_dev->init_parm;
 	if (parm->chip_clk == 0)
 		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
 					       DEFAULT_SM750LE_CHIP_CLOCK :
@@ -104,7 +104,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	if (parm->master_clk == 0)
 		parm->master_clk = parm->chip_clk / 3;
 
-	ddk750_init_hw((struct initchip_param *)&sm750_dev->initParm);
+	ddk750_init_hw((struct initchip_param *)&sm750_dev->init_parm);
 	/* for sm718, open pci burst */
 	if (sm750_dev->devid == 0x718) {
 		poke32(SYSTEM_CTRL,
-- 
2.53.0

