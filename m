Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3331289378
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853712; cv=none; b=tapuCByxBMztmgOVWpTMqm7yGXxmkWpEirLD6eu4yX0Vaesb+E9uNsZ+hmXD2ye/i7dm5ruqXUMpDaoQEtIuBjoOX1oVuGMl7nGak6luCqe6tkUHs0q4ecH78YhZAtNNayalWmpJGlwWYJGhc/hi6Y/qb44JM+vyUB+p1HrwMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853712; c=relaxed/simple;
	bh=p29wva+jJqC/hIU5BhheNL5z6MA7bSiRzu1aIjR+dls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGnafMVsCSfyASgP75Mqx8bNyevBuCJjmRCaJgI7nHQaIvPImGDeWooNJ6MXEfCC8SMg2f85XGo3bmQ/Fuy2RyqCRLBq8cm3wKiMCZkWYMVYVFFardlt0EJdRpZbTH0WFwuhSY52paeMoTKCwHzcUZXG7MrQikZQ9j1SJvK0K3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3EfPZzM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3EfPZzM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so482715e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773853709; x=1774458509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbKbA54bpLrr7nc+5Q2BzYvj9tL5NCb8UyUtsi1ImL0=;
        b=V3EfPZzMD3pesyeMSYmnloeRzUVnxMDufeU6mFQCeMnTwyjBtlBrOwvhPj+EqWQ2Pq
         yIYFpuLYmfe4/zAu2yC90rZl86JM/qW6lo45OkF2qrBNEKhqAArrd5AQ3cWGyyLphjv6
         d37y/YXqwKUCL63ogc35FpGmp444CD5jTHrofrzFvIAbaOUYNUMIQ14UK1g/onNZ2MXb
         JDVLpvziatLAdp9TaYG6G1jqvUGqxjfs0HOCX4YD0TR1WZ8PaGbKDlenIv+G+N/pXqrt
         9WzN424x8D0onhcfI/0V5I9oY+ptBfELr3JDzdkD/5DXNgQMBJqgWBJa1/usMHbDb9NI
         Hy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853709; x=1774458509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IbKbA54bpLrr7nc+5Q2BzYvj9tL5NCb8UyUtsi1ImL0=;
        b=TdgYWF2gPOkGPC2y0bgpYyVVsxsvOHRX9bNQ7d3KgjgchzNG3ppJBI2UWr3v364cnf
         hAj+uEBShCL1nUlhszehv4XkLKkPZvAxx8/s52Iy0sKak5GX9ctMPEXGbFI3fDK2vfh7
         Zz1gtGiu83nfgHNlbcoDZ1r9j2HacjZcYKTzGiRMz4Wb4OGtIiaMQLHz/1XBCvHNpFYN
         EG2VihEs1hRTC0uM+s93onKjuEuW5kgnupeLDVTlP1bO+wl6FJ2OK6eO7xLNPWF0FoXO
         87lZSGkgotizg2KkEv4WuvJjQgybJtCDbZ+PVAGdWrZ4JZo83pb78e5s7fs0DSYa685b
         oj6w==
X-Gm-Message-State: AOJu0YwiDGxgJiu09JksCDRJwwNfEDEhR7+71L+WvZ4seqiWEi/RCILh
	eEcnzNPq+1Q+8rjoHEBrvKyAE2W0wB1FTZTj6R0IQxHFV0fRBavyEvQIEaNswU+I
X-Gm-Gg: ATEYQzyaUsFyqoHAKV7/Uv4VyfnGOfMOyofjLBZyLS7FkWOYKKdSJe3MI2fJx0fVzmm
	CMyLLJdP1uOvN2f69hoOQsOCXnFmpsAXzUQoZr14zNaO43PhbKvk3VC2ELscnBlhtHTFcpYIuEu
	PGjQvQw3Jbjs5HVNFP4uveBHxhyDCrdJ6xb3omFfFVqefK/h05Nx7uw6KESJh3DVWSh14xxNsT/
	xu5w34ihy0bogjyY3bZ4inhVXn520U6PdiBpr1svjn6TkiIvLulcU0auZ34GebQ08t4+Bla3P9a
	Zv3/Fape5ri0PLD/HtA9dkil4W+gI6KRfNW1/R/Ms/B0k5RPzdVhy4Hbd4xxMndiCJHADIql6mO
	6zdkGoX6neNM150gaO3yM7+LrK60RoPJV6CtjveYbxOrn9c2uDWSP0CLSNUtV8oGKeKOGJVc8+o
	tvIED6a2gJWGvF3dUtdi7QE5XopAp7Hf+4NazU4n/7E69C31zCL2S7/51RSyb7LWNriSFs2CKgZ
	6zKXttVKR11RD2wKimguppT
X-Received: by 2002:a05:600c:4712:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-486f442922fmr67006465e9.11.1773853708908;
        Wed, 18 Mar 2026 10:08:28 -0700 (PDT)
Received: from 192.168.1.39 ([105.156.117.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e162e2sm19096095e9.34.2026.03.18.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:08:27 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v2 2/2] staging: sm750fb: rename pvMem to vram and fix CamelCase
Date: Wed, 18 Mar 2026 17:08:23 +0000
Message-ID: <20260318170823.53345-3-inasj268@gmail.com>
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

Rename 'pvMem' to 'vram' to better describe the video RAM and remove Hungarian notation. Additionally, convert remaining CamelCase members in 'struct init_status' to snake_case to follow kernel coding standards.
---
 drivers/staging/sm750fb/sm750.c    | 30 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 10 +++++-----
 drivers/staging/sm750fb/sm750_hw.c | 10 +++++-----
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 56c03078f..3d96f7976 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -624,27 +624,27 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->vram;
 		pr_info("use simul primary mode\n");
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->vram;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->vram;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
 			/* not consider of padding stuffs for o_screen,need fix */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->vram + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
@@ -652,7 +652,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->vram;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -660,7 +660,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->vram + crtc->o_screen;
 		}
 		break;
 	default:
@@ -771,7 +771,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->vram + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
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
+	memset_io(sm750_dev->vram, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1122,7 +1122,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
 	iounmap(sm750_dev->mmio);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->vram);
 	kfree(g_settings);
 }
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index f7501a46d..bc0ef3e02 100644
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
@@ -98,11 +98,11 @@ struct sm750_dev {
 	__u32 vidmem_size;
 	__u32 vidreg_size;
 	void __iomem *mmio;
-	unsigned char __iomem *pvMem;
+	unsigned char __iomem *vram;
 	/* locks*/
 	spinlock_t slock;
 
-	struct init_status initParm;
+	struct init_status init_parm;
 	enum sm750_pnltype pnltype;
 	enum sm750_dataflow dataflow;
 	int nocrt;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index e62c090b2..11834aa2f 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -76,15 +76,15 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->vram =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
+	if (!sm750_dev->vram) {
 		iounmap(sm750_dev->mmio);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
+	pr_info("video memory vaddr = %p\n", sm750_dev->vram);
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

