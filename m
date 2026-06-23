Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510433C1961
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 22:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252487; cv=none; b=pA36LQzANeICwXfbM27R0/B52tWyymBlVJY6m9DhXB2oz5j1oJfEmcSNrbW/xivBepOecYPrp7P7ZRCmJf8QLdj3hokZuUJWzc+XKiuFXRzn/Wd2rgOSKKPrpeJvRg0TiQuY9J6inv0QV6XZfjwGI3aeNs8pPrlFYk1ZcORqZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252487; c=relaxed/simple;
	bh=lNXn1c7ul1Qw9cqjrQBp7PVBWt6LnOI3GgUPNKi5+4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WQRbvd5z3emJ5IgbyivuIAFLNReCh0hiMmua3Zk+/pDqhsoBUMS6uWa5RM7o7XJ0Jlx05E9HO57zjWmmusVse0oyMFpnQd+xk1OblXoUJ15FYEWPZL6jUjIE3EDKIdKcDlTggoi012RH+2e6mBttjo6r1/+/qwaQ4nwPtc1714M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4GKDRxd; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4GKDRxd"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13981833e13so431166c88.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 15:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252484; x=1782857284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOL8VtWrnRwJt4crP4/M+gcAvtEL34NsfOvVl0X3Szg=;
        b=Q4GKDRxdKDNVncArDm51DVMU4gtvL49nUTH3uFxUo90pIYq7x6KC64KZ2m0h3YN+AK
         5rrLbit24H9wrPwhCzfUkPtdwFxog0Nhqi+p1YjpUqBfW+3p/YZ3UId+mope8GqzC6PO
         UlNooM78dVVTZTkfZbLNxtxNjq4WRLiy4RxJfbd2A3uge21h3OSDXlY42suwcQfVcFET
         Zr3Xvo0bJUz5a/YdzaIo75DRhs4MbfLJDtlGz5fIJqMfwV2qhEPmG5gaxrOAKaxSVShy
         DNyBG7ZqoLpklVMKyKUpcSwToIF5fgRciGfy4/cP1dW2V03qqBK2qZe2ZBbrbZb3oqgq
         UdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252484; x=1782857284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOL8VtWrnRwJt4crP4/M+gcAvtEL34NsfOvVl0X3Szg=;
        b=fG2Rz20xVGLB4iJNkwD2dGkVmC304bkFqqdKbZVMgUNiYpUeZEZ7qBTko0NprMnYLC
         p2YIhXmkIjw0CwP894wuxuWGv+TM06fMyK37snR6sPSadeJrUS0xWLtTH3hxbnxP3bbi
         NtBgkIyTRmjp5pgFH2m9AorXX7Q9exQHU0w1VaYp1NLg3he2+G62l5Ygebze71KFHUY3
         3mPk+EkJDjXYQr7ryVKCAkSxnuFQ+900hhDWKyHMQu3HrCYEDnPNd1QX/6rpKyLbWYVm
         A9/9qQu4QBur6z3EU5B+COMYN286PK4QRIhQokRz3XLpMouE83lvf5uFCRI2tCaOGvjQ
         xrBw==
X-Forwarded-Encrypted: i=1; AFNElJ+4pqLd/JIRNFinPXgLTi6CnT1EoO+FOQsjQgjmEv72a6jc0PimFabl6TaqUlf/UQ6MRBmhfe6QyrNI4l4U@lists.linux.dev
X-Gm-Message-State: AOJu0YzxMUC+5F4OVKazhr2LOO4Hcz/tCAHebA3EvZByQsXID9o+w/kj
	2rz7kd9SM9mRPXDONBv1RtJcDNtMhnVG7Eudpm2k0Ia/Y8+QEy08yukcJQJ+K7Ff7LaFnGB7xNQ
	=
X-Gm-Gg: AfdE7cl3KdFqTfe0Z2zJkro5DdrmoNQq8cgF5EfWzxdPOPPqyUQEALLxpVmyGymM94/
	OEQk0AH40H6ncD+8LoZt68UVHN+WPIkfWaouhI9nD3pMsRKzvXMBZ1JzX8ldaa1kn/KW5B5R6QA
	A0SLorxLk+NOVP3HrvrecGe1vG2mboeVdVGRUbwMiqt+oNXgUoCQqX9sFRAhB+DR2Vhb6AC8jH8
	Qg9E4s7V38jfYJemIz0GpDVURFkq17bDe1W7y9l4S0FbZGcEwrEwjOOk5UFmNrx8cCJcl3SKXM4
	i+lKoHPF62GX7CKQ+sAPcqCl/iHmbrn+ig43zzBbYgXRBupFrOC2M0pyqtavOHeO1qdYpNEVYak
	xnb0hJ0HiE2i7cVTnNIuDAkRiZ6tm72si/ScufSsBw7K8P8b+CsmHj0bquq8ijZlo/TApMGFGoc
	JPGCpFJ74X
X-Received: by 2002:a05:7022:2606:b0:139:9e79:43fa with SMTP id a92af1059eb24-139c5cfe482mr3602277c88.9.1782252484284;
        Tue, 23 Jun 2026 15:08:04 -0700 (PDT)
Received: from adr.. ([103.216.221.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139c2f622d1sm8699410c88.7.2026.06.23.15.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:08:03 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] staging: sm750fb: rename variables to avoid CamelCase
Date: Tue, 23 Jun 2026 19:06:14 -0300
Message-ID: <20260623220614.29682-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename 'pvReg' to 'pv_reg' and 'setAllEngOff' to 'set_all_eng_off'
throughout the driver to comply with the Linux kernel coding style.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  6 +++---
 drivers/staging/sm750fb/sm750.h    |  4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c4..716a8935f58d1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pv_reg +
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
+	iounmap(sm750_dev->pv_reg);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26a..e8885133da2e1 100644
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
+	void __iomem *pv_reg;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 34a837fb4b649..95f797e5776a2 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
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
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.43.0

