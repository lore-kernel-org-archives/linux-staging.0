Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694093D2FF4
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053591; cv=none; b=NT/sLqsOklohKj7/zIGLstkro9QQvTuG53xbJMcbRabzXocdMqhaE7ZRWwEcOJbOo2/ooZduqP/+ftI0y48XAlvPGmS/q82hwnf3+IzQAZrEIvCLEVlfSpie3550CePFyCKvOpwLlArf384ekhpwF1CR4dAIbSYNxyYf5qRAVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053591; c=relaxed/simple;
	bh=OGcciJ6W6CeaavRf76dr+/31XpWcTllTwZpLV2apEtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPo+fY4HJ8SrHa9LBm8i+jCoK8aQqyfc0w2JIyGc7Ufm5MLoAkPPv1uqB4XU3qIR8piEBk/2k7CH1gZeq7wkP8NU58NlkXLDG5oMOP8+Qk5/Fec6LKhgkJHeorPbz0zzuaILb3aFHUsDzk2O9G45XuyKMNdT1IMAdZZ+8mRxEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXKkCMDf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXKkCMDf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3698e34a567so12656769a91.2
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780053588; x=1780658388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWrnxSsae63bDDyuIeyXqVcedd+iF5iTIGjUSHH9BKM=;
        b=bXKkCMDfVaKasWJ0RulkdNtgp1UECV4LzwrrwifbPbzqOOqPac+HiH3Hd0Vfjds+VY
         FvYXnLfIAM5/GaF3qW/BamIa3tM+wF2o3Ovte3tR6t5pJEie2hphoaPfbZQ/Y2fWVxwQ
         RsdtRUGkd3K6sxIkkgoJ0fCG+jtH9vQubGF1u8nBKtJljkZvlLuPAamY328DkD4EuT4Q
         xhwUxg0KIo81NPh5Qaynb3vvUkP5t8qOPLAEcgwmtP9X9qeEXALNMIyE/fJu9+deOBI3
         FD4yFsNItmVJ6sKC1GAwR/+h/s0+3tzWf+OvORNSk3H/pkiFIOa0WzkuvEziNIK5Fpke
         15Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053588; x=1780658388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWrnxSsae63bDDyuIeyXqVcedd+iF5iTIGjUSHH9BKM=;
        b=XF5HAvnYKIJBYyxgRrnSkYLfIGgfVImwIvsF83ZcPp6fV65nh/0FNrN7IB4V7saRUJ
         qAM3YN5YFOXgB5Y2gE2TC9s0atgQKuML2SaxWO6otO5LC7lStwe3tGm4pab1kwZM+p5A
         MlrTImJth+DONQihv9v8yzMwbdPMk1taM2IxpZlDtxCB0lab0cILhzMYQwpY9mtWv+aZ
         1nNPNErxb0VtAKid805f8M6whq4CPUTjkmH2KPM1tFZ7C9aM1us7qLNURSV5Uf5LfZmK
         ZAqkhdlITvXJ71j9emjdzmoQNGZdaM5haMDq6iQCtt8Gq0SGZMvu1ps9LC3aXtWIOgHY
         5qEA==
X-Forwarded-Encrypted: i=1; AFNElJ9UurLcxxZd2GlB07uKqAzPv/rzvjeNbxH35Q4Tlprj6DFmBlMiL9NS7yMX96gFwPr35Ot8oN82zc3JkPL2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7JL7603JtfbFKi7Gm1e/++mz+Ey4d5wMklnlzZBjaYuuFvb2g
	F1ULPn3qLHMVC4gwT66DZyvFOjrqHwvwLbrixP9JhGmw9ef5jkcwoDPn
X-Gm-Gg: Acq92OE6myhygQ/r94piVdUTRnqxZqyIeSWhTritlkVuJKAR/9+0NCrfSGY+FWhKAfl
	t1dOcJSo0hS4DtTEEJ/FOssp4i0aAfGavdNACyX2k1OGTw7ob5NUZqJFca+oHTsPasiFjuuBzJu
	LU2rGdEhOCj7mpK4Bu/NLpVaenDAjzv4Qxpu3MSsi3ZMIKMW35RczlyOvtN2lVrs1fzm4zF/UlQ
	YV69XtODLsloAlGM/GqM7pbjbkylP9RjtPVQHxuxabBbn5tGLAhxLvzB8TxkDDKMG/unR/qzjfk
	hhbpLH0q2ODM2MquWVBnOcVLxKA3+vyd2uCUqRz+x5ARXiA7uybqojm3WrZXYBx+AdZg4uEZcOE
	VP9LAFG5rB36rumQoJUfadiOEPSbardlfRSnSBBWCBTS05r1Br3VMU01Y43mKAMQnwQPDkpNXRI
	H3OKuDSfKnH19ddVSbimkVYmSIHhg22kNh
X-Received: by 2002:a17:90b:3c09:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-36bbcd63077mr2994526a91.9.1780053587514;
        Fri, 29 May 2026 04:19:47 -0700 (PDT)
Received: from onish ([2404:7c80:75:55f3:d423:9757:6acf:6ef9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0c1ab21sm1826945a91.14.2026.05.29.04.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:19:46 -0700 (PDT)
From: Onish Sharma <neharora23587@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Onish Sharma <neharora23587@gmail.com>
Subject: [PATCH v3] staging: sm750fb: rename pv_reg to io_base
Date: Fri, 29 May 2026 16:49:27 +0530
Message-ID: <20260529111927.14138-1-neharora23587@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename pv_reg to io_base to follow kernel naming style and improve
readability.

No functional changes intended.

Signed-off-by: Onish Sharma <neharora23587@gmail.com>
---
Changes in v3:
- Added mandatory Signed-off-by line.
- Rename pv_reg to io_base to remove hungarian notation

 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 716a8935f58d..c2d2864f135b 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pv_reg +
+	crtc->cursor.mmio = sm750_dev->io_base +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pv_reg);
+	iounmap(sm750_dev->io_base);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index e8885133da2e..c42800313c6a 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pv_reg;
+	void __iomem *io_base;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 95f797e5776a..dc1118808b4f 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pv_reg =
+	sm750_dev->io_base =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pv_reg) {
+	if (!sm750_dev->io_base) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->io_base + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->io_base + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pv_reg;
+	mmio750 = sm750_dev->io_base;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pv_reg);
+	iounmap(sm750_dev->io_base);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.54.0
