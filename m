Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12976175A66
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 04:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782276379; cv=none; b=iW/Klh0YUEyt26TtPgdVkoF66nvjfYAnt+DTQ2TVY6cPrbzeabUNq2I7FCdkQjGFa8dvpBGqR/M/ogvbG/926fMa3NFk480hJUxR2MkGxF57UmXhLbP7YVbAER1YdYtdnoUH1OJRZFmOPF5gmnL1fpBbUusypthtN0wj2ejJwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782276379; c=relaxed/simple;
	bh=Ip1s9CHl8ZzsdAveDPfvFvSCDHHCgPFS/WQP8N+uSTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHyKFvzhjaXOp3xChsJ4IKNpS62Dcb8ffBx36TOQgTrOrHcaHGaA3uTC01VjoFWL/G3HxbfBXbjvYYzenS3voIUq93wqkvaZuz7JN8H341X95ahXmR+t40iD+xkeLNr2dkQCKzckzRLG4cxj7N60ddSSZHawge30f+YMEEPtCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUm/bfF/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUm/bfF/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8453f568e84so681925b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 21:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782276377; x=1782881177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHCLB8AQgq5vY37BJcIWdXKDYn7/wlkr75J7OWaF0kQ=;
        b=LUm/bfF/v2hn8sUinkR8zTOh8/AdNhozDT7BVH3eQFquCOd5HxZ6lDTahBhJC4ak0Z
         VQDbBjSgRQij1QS3IjYydoY219T6uYXLSOk7td8ADfmjmRZg0jIwPeVMG9n7IoLNMDau
         C9Ka9rY0hUnp2yFxpBGKgkFYpIZfTweaHwfc0hsQgCcCI5dTXT76v5blyqgj+9xZLWql
         xOox7v1wbXDh/pQmN31fHPY9Bz/O0NHxPxLL7BUxRHM0fX2SPP+z5RnPoHAprqcuBc+n
         v1R26LtZ9wQ3FyPcM2rr9waXH8nE/5GlE0SPj5E35NohgGE2yei9jKF9SSaVL77bEU7N
         TZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782276377; x=1782881177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHCLB8AQgq5vY37BJcIWdXKDYn7/wlkr75J7OWaF0kQ=;
        b=ilY+At/zf+UTGJwr07/h2MaX5npyEOBsCIwqdIdOgqXtXCon5EYTlmV0EdxmM9t1eQ
         f1+tC5xu4ZWGrMnWSNK5glUgp4a0kLuGizZnpmWTNNAD2cuZ2s0q4a6lwqMoQCLcL11n
         Kz2mG1SHQIQy41jEyH6Zrdq2n2gG97FyFXd/t/dstsWIvTUYX0xvhRAnlxr3DgH49/Z+
         +lir6ckuX7WJ4bHvwz+xLJ1UGZq0qJqKLJ3MwwNakQbarmujMy49E0qu6dN7ix43TYcp
         IzGXTIsaoYLkJZM5PZYlC005x8/FU1bzjfHDP0Bjk9oLe2Mh3pIinwswrn6XqxtvDnPm
         LBFw==
X-Forwarded-Encrypted: i=1; AFNElJ+MohncZKtLjMw9mfmBsWG7LcHjW8k0wj9025Fmor71M04KZqVj3bQ8DEtFZ4Xwa3ENwaClByR1lABYcGq6@lists.linux.dev
X-Gm-Message-State: AOJu0YzD6ExA9MgCnEG9nzej09loOtlZkRH260vtpac/axp3d/K0jsj3
	lKVSVRKX6Zp9pX3CHC45KC8JdEsm6/0rj5d0nJH2Rk6JeuafxOMQmjqm
X-Gm-Gg: AfdE7cm1wgWWTDKVLzqj8yII3onsLn+0TjSxqfaSRHCYw3xOx9GfRMj5YA1xWDzE76b
	rH2KaK4fgi7oV4o5gEswhwQAJxMiApwlDN5nwTyksYj0TBJfp280o+icodnkSrxVoNP0fbeBWrn
	HTSiAxixFMKJ/GN7/n8dvm0tzwhilxwqbwyhCMnar0bLpKS44kieFtG1dcbPMaIAC3xOW1xxn9r
	EYLdkqAJHReLpqOPCkX4HRXQxF13qsmrvcEa2BwlQwNIHQvimsMeN0Jy7xW1Ca2h7L+PlvzYC64
	pKbIFY9CH5pteLjXyEqjhKCf5vrcELs+/9Vjth5jQU9vc7DLXymGgN/IvXxUhp+LU4B46hqCPcM
	l3on9XZWDeVVxEvZWBI4S7dQ6YSuqGVgdZ5hExp5Hn7AUB3EEJ/3TSKZbxko6xPikXgZwGXf+Pm
	q/UJ+/4LR1EkPIhwiXUwh3BJ/7OWQr4HRx1YiOvWYSAXL+Qfm6qtdjk7LxTTi4bA+kNQ6DUv3De
	ulbdoeuK7rUB7N2t7rLsUwAUiw5eaoLT4lKBuB141XFbNIxSBjynniQ6QgCL5jVc2+8
X-Received: by 2002:a05:6a00:2e1f:b0:845:3b0a:aa06 with SMTP id d2e1a72fcca58-84595235580mr6925257b3a.17.1782276377293;
        Tue, 23 Jun 2026 21:46:17 -0700 (PDT)
Received: from kapoor.mahindrauniversity.edu.in ([122.184.65.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm859703b3a.10.2026.06.23.21.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:46:16 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: sm750fb: rename CamelCase pvMem and pvReg
Date: Wed, 24 Jun 2026 10:16:10 +0530
Message-ID: <20260624044610.69708-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260621045050.63460-1-kapoorarnav43@gmail.com>
References: <20260621045050.63460-1-kapoorarnav43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the remaining CamelCase structure members
to follow kernel coding style.

Rename:

* pvMem -> vram
* pvReg -> reg

Fix build errors by renaming the corresponding
structure members in sm750.h as well.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606240823.hWXfYyPf-lkp@intel.com/
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 22 +++++++++++-----------
 drivers/staging/sm750fb/sm750.h    |  4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 16 ++++++++--------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 858eda551..efadb9c73 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -622,26 +622,26 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->vram;
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
@@ -649,7 +649,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->vram;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -657,7 +657,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->vram + crtc->o_screen;
 		}
 		break;
 	default:
@@ -755,13 +755,13 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->vram + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
@@ -1028,7 +1028,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->vram, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1059,8 +1059,8 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->reg);
+	iounmap(sm750_dev->vram);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
 }
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 9da154f1a..dadf5874a 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,8 +97,8 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
-	unsigned char __iomem *pvMem;
+	void __iomem *reg;
+	unsigned char __iomem *vram;
 	/* locks*/
 	spinlock_t slock;
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 59fb3a207..1b768be20 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -42,18 +42,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->reg) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -66,9 +66,9 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->vidmem_size = ddk750_get_vm_size();
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->vram =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
+	if (!sm750_dev->vram) {
 		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto err_unmap_reg;
@@ -77,7 +77,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->reg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.53.0

