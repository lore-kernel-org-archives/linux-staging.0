Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BE323D7E3
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 10:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420329; cv=none; b=r/S6fRkzN6h4R0wwpEu+e8wg1czNYETacpqm8Ql5z7VMMrxE+/CrDb8R76GjnUSfFYlHbdD3W2K6GKIBxxEgszf6PDni/yD8g540otPEamL/vzLOPlCR6v7Lfeoj8CczQo94vG7K1FY3Vsa5JP0SHqznZrqTQYtPpJDJ3QSFzi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420329; c=relaxed/simple;
	bh=j1XBFunEU6BwQkC5nNZIrOSvYAs4W1maioqJqDuKPAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7Em/ueqWc5dFtghwbtf3oCLt/5Obg88YcJcqSFnY+dnwLl1Oy4rzlPFsyoYHltqrmrMBt0hLExv2NQO+uaxzHafZSxQxU3S7DtnsiNQaNhUPBMHFZ/Ns57OeqqluQyYL7tQ7/znSkh0JQJbCJj4fODghweLJdEA1Tt97d0sBbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0sIQIPz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0sIQIPz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so4036676a91.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783420325; x=1784025125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6xy7w3iaM3CPGjGH2norsW2YY0eS10nlgFN5gxOYh8k=;
        b=b0sIQIPzERx4/SwZNgC8jRfURpnFMPkTBCMjRyeCiAnmvH0Hn4jr5I5sb5b0Yq3qBH
         0mRxRF/imDmK9h1eoOjD1IaEzlGm+ahM1I/I7v6xXaGq5pTCSMqr7EMk0/EhXyMXIHoe
         fhevAccZdl+7CbmA65DZf5ulw/JKNYiPfSSzXMM4BptNJ11nj+2aVdgQHjOof+V+rgaW
         48X835kNeYntiefcNTJrI+VqH//8K6MFbto5j/Ejs40xZgC8ZblvZAb72rTLv3+iU9t8
         EHReQv3lsAO1hhyPnbSytJ+hpPMRUIer7wsCbi074piklQjBmtD+fuklT0PMVJGIEtez
         ZYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420325; x=1784025125;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xy7w3iaM3CPGjGH2norsW2YY0eS10nlgFN5gxOYh8k=;
        b=Y9GY+MfIuBfBqEJQb1QKvcBJN+4ksaNN7MndvYgZUy2KpU9Eq1Nuyvk4JwN04Skqom
         Mk/3bhbneyDTVFXXUqH49oyj7hWeYmAN+C+wZTwrRBSvvSby0//JMTroylaNZkMNJQFV
         V/hKRNG3iygZt+DZKk/Yclrs7vCt+S6h9SB1IkfF5h6kzZf0q1mTxUyRvIJGaEBvK3H1
         Ute7ZWmUJn9y2ASKcxbmRE5oU6K3oIzCaLLHMHnmckYKzP4i4VoRVEkPKu/JdPWivLsQ
         90qGZEG4v3R6mtCvWxKJyJwK+QKFOsoHcNqmlVY1cCUsqYcIC+qtm11G70GNa9a7uvD/
         tNVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrz/dM+p/iabPMRep/BXMoTLW/Cu2hxmL5Iuryqk/26DmLNYGI54TdoCvYsQFfU5nea9WdVn7Gk9TsHDjKJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxDE/4cvIo1f2RbBp4aTLfvAXH6Et6K3Csz1o/Fqi9ZCM8j48Wy
	pTfJ0pSHLRjhh6W1cmnSrZD5urpcQWoXTEyDnz1xvWCrevzOqmWamAma
X-Gm-Gg: AfdE7ckqFPa7rdAqC/Sfe68KCL1yfxQkso6c6hCiUyu98UuBCpnnzqkeePimUpuvSOf
	vWoFYbhzEZ0u0INHGJiqTHm+SCA/oroGhOmYTmRxqRKlLNwDR0Inm7X3gwCLogQZsIDoOtiGAsj
	tOCtkUjv/YG59o05Juk0T6jTWEORKkXu5Tfp8OqSEx9XhMU3wT6GC7hj1IWKxoyLAyE/St8HY6U
	YLSqQrO5KQjjECGr3DMR/iZerFNe7URlnu9v8y3bpk/+dZHx6cfI5+LghC7UaCdIM1TERH7GFYl
	4yrLEWH040S0MCKHIhJ4nDF5ToWfvKLBjfJvWD+xhZrBN2ifm5165r6dzsmdFIAhKRROns9lwEA
	W6PhBj7pf84Hc84W5N98Y5YfSOOnsCDJU8lm6lChx+oB+btrSpJQnPSsUdHqrf67e8YHM8QI7yj
	EePq1Zybo=
X-Received: by 2002:a05:6a20:cf88:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c08ec71668mr6396365637.4.1783420325236;
        Tue, 07 Jul 2026 03:32:05 -0700 (PDT)
Received: from adr.. ([103.216.221.83])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7264138c88.10.2026.07.07.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:32:04 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH v2] staging: sm750fb: rename variables to comply with kernel style
Date: Tue,  7 Jul 2026 07:27:48 -0300
Message-ID: <20260707102749.15163-1-andrem.33333@gmail.com>
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
the driver. This complies with the Linux kernel coding style.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
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

