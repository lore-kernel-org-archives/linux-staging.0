Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F137326923
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855338; cv=none; b=OnOuktrTqtTFkpdnYj4QtCYkzQe25wxR/Auz6bOjJTyn5KufPFpJxSG6B+ax6h/jYmizpd3ow9zTnr2bX1jrLBgzGTEm5R5nsYJ/4q/fzDUBJY0Bn8H7GqQ8q9/tQK/vX+7oXfZiV3qrXeGWccNQddp8LwRcguolK8F4XBHONBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855338; c=relaxed/simple;
	bh=JZN/Sf7S8MZqsy5dV2hcfkkN1gQiAk5D6N7QGuLcopE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcFs2e3SI2RARlJ8ZpjE7UvNxKAt2x8nX92DCzQ8hhBHP7vE2B+KwlSIivwKcjNJH8C/8wyLQb8MqLsXRQXuw0gg6nB4M+iZwJu0YrCuxn/44PthFOVhP63oIC0uYJz6ex3e1BkxXtfEZ0zSC5YIVqVNtm/8JP2EQvtpsSSYWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xy2pBHdA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xy2pBHdA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3591cc98871so104005a91.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855334; x=1774460134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVrzVgKBVzV1WI1Cg1lfykJIIDMEjWWUc4jXfvsbWKY=;
        b=Xy2pBHdAe0nUA2VS2SVEHen/pRLOY6AD89iZNjv/+y3httm97fphA3LnNI1QjWvZ89
         cXoVptiqFt/7SoEdTP+9yucyLnpo1EtgkSs+hk8Ro4sSFU4/ydN/AxWlx0/JU3itNBMG
         6YnGxd0q5Ub+bazM8H8tuweRQ2lSxdmYSBT5t1SrynxqO+NUXAt8OC5mA79/LrZiL/mf
         QZheOMN8xbitFsR7vy/pOIkQ9tK9o+2IIJQ3gLWi1IIWsiD9M0EhHTGdnOWtngXIG6u/
         /R6eZQPWtNeIfHTeer9q7DzvhLNoqhM7zLQiJkXmjXwb+p2JN8qGIXU0K3S1XaNLQWwD
         KMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855334; x=1774460134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVrzVgKBVzV1WI1Cg1lfykJIIDMEjWWUc4jXfvsbWKY=;
        b=hhEIND3u6s2JaCJfOZ6L5EP8Ym68/ZY2DLZkb2E7/lYxkb1Z87tOgauVMvcLLufs10
         ciu7znfFrEJ2RhPIZRpWkAwIE/o8nxwsuA8/Aii1W8Wy4teQDUShIkEB2H9sHRH2tuib
         NVc8z8u8LDdHz4f43dZ77mAngmMypaKMEg4Go/yjxHqWp5S9+eaFKrxvEUhoso9bBw+X
         srxaFBoZRsEeabjxcP4tJbSOUnEBazXVM93VErI9b8ZO8n3cqEjByeo9/Ps23DeRbwDf
         N+cRaILn5Ky2151w6kiIJYjutnb1sXVl1sXoWqedyT9AcHJEMOr0BZmTHMNdMkeYTh4y
         gmBg==
X-Forwarded-Encrypted: i=1; AJvYcCXejIChtC+GPo4RZbyYKqurj9y7xtaPkwVQBfvUfOGrRSjNxSMDgTvHM2lHBYvfbilBTc+QNCZGWtAlS0Iz@lists.linux.dev
X-Gm-Message-State: AOJu0YzrpRDxVITq2jSaVyPY05innX6di2a6IbNLWgX+sXFHgneSbzC3
	69l2RWCp+rNKFMURiYTmrb4eZMAgS06VkCUn3y2hj3fFx4oBxcZSNES5
X-Gm-Gg: ATEYQzykil7/vwMqTHclgXxYc5xk8DNa83aZc4HVCMQ2epnp3xxSaqrMPAjqyU8XbVf
	Tw4RfhrjwsqHLb3J8xlMDueCK8EkefnutBhaix+v3zuSuCJVeLuFUtQXH6NGmo23/henoFxPTfm
	rcCDtQ3YBR9x5ViCgxJWsIzevMKdOXsGM/P8Vvt+XiZBihIyniELInGifhUeytBBe+24urRzTJS
	iQqhDHFpp3U/cB7LUrxGAUkjsTrEHFm9hICSCkqBqitWdd+U+9KKIglH9WLBj7O1VBA36AJ+kji
	IW5IKLyWQFlOzvKntfvs2Pq9g2F6laU/TcJtlZ1ECWGVX0KxeDeDizuygMmKWovSXk4TZmSGAsH
	GImaQmtj4jBAqZMdQ72PW2sCoOc4nbXG45M0pn1zMVf6jMfI2byprIlEeqxjcHgHDG4SvrU6BOS
	I9Cd+Lh0Ge8q0yizLccvpV4k168fvTBdOE8wM=
X-Received: by 2002:a17:90b:1dc6:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-35bb9e41137mr3490835a91.1.1773855333955;
        Wed, 18 Mar 2026 10:35:33 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:3b6f:933a:89fd:e530])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm247103a91.2.2026.03.18.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:35:33 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 3/3] staging: sm750fb: Rename struct sm750_dev members to snake_case
Date: Wed, 18 Mar 2026 23:04:40 +0530
Message-ID: <20260318173440.9457-4-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
References: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase members pvReg and pvMem to follow the Linux kernel
coding style.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 22 +++++++++++-----------
 drivers/staging/sm750fb/sm750.h    |  4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 20 ++++++++++----------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index c30ffab8a5f3..1c60ba056719 100644
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
index b683a82af349..3f6570fc8f08 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
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
index 0e594734a8b9..32b3813d0d8b 100644
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
-- 
2.53.0

