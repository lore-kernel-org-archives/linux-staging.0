Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DEB3A0E93
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548147; cv=none; b=H/bC+RAS7Nyz9J8isAf/1BvY/1lor5hNEi3dk0D1wx4n5D/Kp/ncjY+uvtZ6rDB62p1+Fy52ckRTlknR6bJendXvu06ExKsXjwNJUj+NYSfcp/m+XNdP7M9uLbOlXOTJzMDu1I7hB2Sqm8xqszf6qkR0EtiB85VCViL2/ktUf0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548147; c=relaxed/simple;
	bh=lTgQ6P82H63rquzLxY2/WnhMS6d1SxwK0O7GAUYbnnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOFzx7utIjlrgQ/M3iezQK1ZVtwteklS6P3Bx/ntTK9iJJz3nuTGgARMFLSgcHN+EzwoR4nOEqbW9BgG4nQyHk9e3XnKTmTVkOyrk31GU7af4gmq+G9XSBlsAZ8JXFUFYpEiOuq1TF3UvHMzuEJ++0rQm/aLZfAKpEbcdMmCfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5SqscBr; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5SqscBr"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82cf96ca071so2053815b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775548145; x=1776152945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me0CKHf/sm8CRWgP3GPZt1y+gKBd/mvXJslLZ2AW7O0=;
        b=q5SqscBr2Hyiwh1tivKHGE+by0lYOwHLMiUDEXDTQdrHVeLfZKIS60sNCDnRxNJlKm
         1dzAg1Vx1E11ORT4ipcV6AOe1k/FXH5qFHszKwXSE5AIP27P1Z4G/e2p2nh5IA7+5+nV
         Rla7uYEkdHq8hwY81KE2lqt2VlcVYPL2qpXcXttsmDLU9PbnPvGubAsd8D25GYciRZ9c
         iwST6iyie1L4OhIOM9haQiHg0a5bANd6HzKnApZ63U/ooTu/+mm5hwYpedJldSwj3K3I
         bHMqqaciI8I6h0Ha7LtzgO4EQG91SzRUnIt8PaDFrbU/n54y++BMtByUY6+ZuHs6YqOK
         QZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775548145; x=1776152945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=me0CKHf/sm8CRWgP3GPZt1y+gKBd/mvXJslLZ2AW7O0=;
        b=GPMQp6eQglSpamyyTdBWF0pjlfMJyd8MCMNOQaGK2HKtThSKVkDwutKQS5DRB0iTH4
         URPdQWXrt6SCFlOK0hSuM6yNQcn2vwMItwHlzG418BeOpDL9EffVK1p9JtDACdXF6p7r
         iiT0dJ6ddyPsuuwH5Amr2Lklfc9b2FPXr/VWFu7szA3BEknbIrAx6HSb2ym+ndj4iw5l
         iyuC3zu8gscqquU6yO6grlvZUt5/1WVPONE7EpRAYlUyFWOd+4WI4jvps4jhK+hS41Ic
         9+eKFBvJx9k4y7/52GbVcOvGFrYsiFnUcYkdywcFb2j6AC0s3R5O4+K/5cVY9ob+U4x/
         cFJg==
X-Forwarded-Encrypted: i=1; AJvYcCUCC4FvOTYucEVebPNmzxSorJvmc1+T48ZJC1aY+HBK7zs2IeQ3LeQN+QG6LP2KpbMXCKfFYDFHcy1Erq7d@lists.linux.dev
X-Gm-Message-State: AOJu0YxEDWEWxxPxa9KjVu0lwqE3XYqZkwh0JWmvZ4tvlfUZV+6/L8+s
	z0tuVMWHLcOFzkYipWhwzb01Tpk/hAuEmeCVBH8GxHSC0C1gYRk1c4vy4FVD9TZvmotAfQ==
X-Gm-Gg: AeBDies0Lvu53VNA9OeURKCgu9J7hJulbMeHHObPch4TZ3855e9z/3486jFg7l21eSt
	knZMFEzGn4fqxVh5TDK0cS+nQrFpwmxMvgL/LCH9TBDZ4Eex3maEJRy3FHCtF9QLT14/ird7i59
	8fKO/bHQqxObHApPzMVqrlVVOhEjzigYpqT2wCr6ey3B79Hov9A6DYvkoihbYZ+yrAKDVOsBdS0
	ak5dsNhgBchasvPkDN98Ou1SlJpNWafcirbUjFvdU00/mWBamkV4pNFVYPLwtMePn1xCeXpRt8S
	RLSckHtnd3A6G3z4OmAyR2lch67VawYCIl6IZ38mzAxGeporLqaTJP0dx8N8T/1YQmn2UKsnUAV
	TFS6GMoEkZ8ILwbmigbbr7/DiDWByRYWAJ9yiZE1R2xifQ2+0KCIC+bR9y+EmAiJuM5pRKgp7h3
	h5o+NGizCWWdYAK+F4c0USBssivYkoBeMc1/NofCyPBxEuJg==
X-Received: by 2002:a05:6a00:800f:b0:82c:e60c:f36d with SMTP id d2e1a72fcca58-82d0dbf1a4emr14179901b3a.48.1775548145206;
        Tue, 07 Apr 2026 00:49:05 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm22093716b3a.51.2026.04.07.00.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:49:03 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 3/3] staging: sm750fb: Rename sm750_dev members to snake_case
Date: Tue,  7 Apr 2026 13:18:05 +0530
Message-ID: <20260407074805.14505-4-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
References: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the sm750_dev structure members pvReg and pvMem to snake_case to
follow the kernel coding style.

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

