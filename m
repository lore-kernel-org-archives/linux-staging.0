Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B63ED132
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424736; cv=none; b=RWvOqOEaxUaJs68vfgbKVm9Q0J0RRKJsrF0Kg2pI/PwAnk7HDi4AcywKtIF6gs9KsX82aklrsCL23MSkEfbobflQNNePfkfrvFF65aPqe5eubQhZ6cyX6FLVGjXMToRkwnQwseNQx26xAQVi7JY3+CfWix5CzMiwRP77vZ92lUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424736; c=relaxed/simple;
	bh=SoJJ8BOMf7cdzDJ0cUre6solF4ZSDAQO1ZeC2RRfv6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7/AzKAIZW0bGGd8VtfRfKQmVFGbiHKn1n93rCxBzB1T8w5dU2sUbB9epKocL/HnR39cLnjoH5QG/qBrK1Z3Wm1TbzIgLe+1Aoh6Kh5rmgSEHovE9J1x/V3uqCsGr0n6eQtEnl4fkfRV8peSxIPwntc2AvLZ2wJPGsb9BvFyiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCu6mYTj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCu6mYTj"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381b831d535so4607107a91.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783424735; x=1784029535; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qxi6illuNTTea6xdL0f4eYIc+eOVoLU4Wgp7U1BzVO0=;
        b=rCu6mYTjRCNZi9ZX4Zg3y5UHaLumjGExo3Yu6L/QwPZGf/bqLPGSXqY2n7Y7P85eNt
         Fi+zdbECve6EifAj8Z63GkM02xCHPZhcsAO/QlPu8FpRt/I3+76hm0v6sri9/krU/Bxa
         n1+l4UxtAyh0b7nCt/W6Zq69pEbhJ4xGbUOGtG+kPhLRQX19mcc3HsiSXpHk7lXDslH3
         zO+X5Higm6roLG/28DQTs2TgArx7jRJZSv4QbxQzFe5sd+8rnsRQPU27I+g2wuzdRT2G
         l+Vqz1RGeuLzNX/Z/Vf5/hZG5ymGSr7Lc+6kwcypuntBCg1l/CTopvkaNJw/mr7rrYb7
         uVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783424735; x=1784029535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxi6illuNTTea6xdL0f4eYIc+eOVoLU4Wgp7U1BzVO0=;
        b=jGUWDLWSwG61puIl/nrn0yLkPU3IdGPA/sO5f2U+tOLH4FV6s2+sa64I+U65Ol1zvB
         5dV9N6OHt73LSmzoLFXQG6isVFqQ73s10dqnLUDsHOWRkDLtm9xQ+v4yhDC9LAmfLpxe
         Qeb8QHdINLPAWLzUMUbRvYvVaU4Tibcqg1BQi/8ugeoIlwLTQa8emhHLPxoWitPhWDIM
         rs2sZKh7dI8an46WslmLafV9Hy5gt2P7ZTjrR8vNqtAhzDB2qvnx4LMpZyuzdBsAAlms
         FYh8tL/uTPVjlPFEIs6cSGRfin0YW/uHKLvfg7Bt9FZnag527afzBnW/noLh/iwciFLT
         ff2A==
X-Forwarded-Encrypted: i=1; AHgh+RrgsukcbJSpBStYqHnRnBRMSAimVfb3P47NGY6lRlq77WUJq1I/wiWDw/UPKyxYtkEMBHq0ufTwsMExIZkL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy62L8iHdqO0gDWWiFVG6hG/Z+Ha+V2l5VVmRVpXYMqwZmrcK4B
	YI2Q9K9NtdXL+/CNJ6GutUEJM2CY20MlG+fJ0Xxb/gDXqFQj1m5ujscunj2rXXAxd3OtMPuH
X-Gm-Gg: AfdE7clI1Px7jsdSiwawPqIy8X2XGhJTVVQPtiuC7b0IcK+B7hn2Opho+QIl4Sv/Wg9
	pJkgbyH3lvE2E0QjcYajNznNigsC4mL+KRs5f31rFXp/WvFqMO9gjCAqdaO3HWOVVgOCdjQ7qkI
	QhfH+hL/NdukB+YsteL6tvffwjMXdGrjUqCoP1tSKeSr5Xv1t2xYV3GoKnKLgq7/plX3M9AhS1O
	p988hkkqOVoZcShRhuCcaZlgrzZpthbmUdIXOqKWJzYjOj4gatFOXD8vJGzixyAlq5MfX+iR/gC
	4J+8jcfvrhKqbBYcNxL1/gqM2bSbz0JLVVNLNJGu+w42US7vF53Y5YY9cYNG4nN1FWC5CgU3/q0
	G0TWtqI8/LiXQVUPLiP46o1fitGWxcvChulNqXgXtcp+iCzyofyIt2iJCfs7vlT3GiTBB70rEoC
	aprypwnGA=
X-Received: by 2002:a17:90b:4f47:b0:387:e0db:3fa9 with SMTP id 98e67ed59e1d1-387e0db4809mr2744852a91.34.1783424734563;
        Tue, 07 Jul 2026 04:45:34 -0700 (PDT)
Received: from adr.. ([103.216.221.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f598dsm8204137eec.6.2026.07.07.04.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:45:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH v3] staging: sm750fb: rename variables to comply with kernel style
Date: Tue,  7 Jul 2026 08:43:27 -0300
Message-ID: <20260707114327.22950-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026070710-exact-unveiling-e321@gregkh>
References: <2026070710-exact-unveiling-e321@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename 'pvReg' to 'regs' to remove Hungarian notation, and rename
'setAllEngOff' to 'set_all_eng_off' to avoid CamelCase throughout
the driver.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
Changes in v3:
  - Added changelog history to satisfy the bot.

Changes in v2:
  - Renamed 'pv_reg' to 'regs' to completely remove Hungarian notation, based on Greg KH's feedback.

 drivers/staging/sm750fb/sm750.c    |  6 +++---
 drivers/staging/sm750fb/sm750.h    |  4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c4..7cd9cb0b3498c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->regs +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -848,7 +848,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
@@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->regs);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26a..32f9a9ac7be73 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -44,7 +44,7 @@ struct init_status {
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
+	ushort set_all_eng_off;
 	ushort reset_memory;
 };
 
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *regs;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 34a837fb4b649..c5a495bb5ac57 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->regs =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->regs) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->regs + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->regs + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->regs;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->regs);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.43.0

