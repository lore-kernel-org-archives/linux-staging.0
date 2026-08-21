Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F14CA26D
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325350; cv=none; b=GnNFT8RPXmyWILFoImWHC7A/7ihODxzMa7Pi7vr55O1qTTNa0D8uFQnGijDCX0juMfiRx/A3RptOY3PUaMWhqoy/AKK6N01E0MBpsbGbbPgu/AinThD4qK7sjk/cKqM+9+mFNyzPY/kmloZ9d1UUsFZKhnShzcJvmUBm/jRF/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325350; c=relaxed/simple;
	bh=VWprNmqQgfznUUymEi7MLyrplr+mofikIGdmMHvaI5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCfvR7Xv9IPZMUudinfLdM7ll5Cm1mxZjZJ7NxG/ZmBaIcxz3SYasQK4vGznGoZRjqo4e/OFba5pIabLphlrvIraljMr8XR+Af/sXx6nkq6KwV571I2TlUFvHOu3Xjpu7yRYGf10pjg/hEmDnb+EifotFfnmzsuhr7bQIBFPX1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxSUyyAI; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxSUyyAI"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e6391b114so82304885a.3
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325348; x=1787930148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpgB6bU5DPvqDeHFBiZr0voqp9OUP9pmguygZ0b0Ukw=;
        b=FxSUyyAIv/QgCuwqGZfDhJXFNd25ZY/hfywix7h2JOxq3x001IX5491Fd5w3JoamVZ
         lsuGvxdXbcsJAdLym0uxHi2Ai57HiRFQXZyhWQGPNGWcq1Eg20U7sr0GAgw+/EDpH5y/
         wugbVFu3GRxKTJmAvrhFnuipRsdAsCTviZJzyOlEXwu3zcIOj8MgGol6R9pY9fXBREPn
         MEA6I/sB5SbrMQZG7+pKb38IWYl2CMDa7H/IkjerIFiR5tVteoE/Pwniy2OyugyfOcob
         bPr4cYCnzq50Xtci3ZtSGI1H6Kbi9kTTMpUQotjBNWhGE4wM41cwjfunn9H0T2kP7kt/
         FASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325348; x=1787930148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpgB6bU5DPvqDeHFBiZr0voqp9OUP9pmguygZ0b0Ukw=;
        b=ZsBPtdfFn32VIVpENQz3Ddmg8/3schp3nVQZAZK9U9pEOXX8+YCMVhRWYQWDCz0ESy
         mmArwcKZ9X0bszGgPtmvzFbki3q33mS69FD5+4x1x5wO9P0cV+YqxGh7JwrKqm2LMGY2
         /m5qErIxHR9eGdXhokFjNLqLuNQ3kihuhkk5lCDIM/KdMr/F1UJ0fZNZaoHS5o+v6P3O
         czg5+X7ln+vRRlu1lJdKWn0oLgdmAUi/bxsRYSi1qMBbw3P+lYSGrRim1h9czUl7drT5
         2ox4Vz+NT8wc24IeA71DCMym1JLRXnBxXr/6clo0YCNIt2X4Bo4XKxbNBdVVTUneIMf6
         b54Q==
X-Forwarded-Encrypted: i=1; AHgh+RrfkuCaPCe06l3iVCB2Qcgi9jplXmsZisgopZthCGUWrroC6aEWV1GsOhnJtLloZdfkdHY4hYAGzhz54ekT@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/4x3ZCSc94WItLiLKAr7mc6C0/ljWWz590N6HdYw/V88+kgFg
	Ugt0iq410MzvJqonGYk60Al/kjbKy0FQh9+TBPkvMRRVHQ0ggCBbg7Ea
X-Gm-Gg: AR+sD131ABY0prJ3iG1gxTSTJSVEIR0zLEhOqUWBY8+XpxO1JOaA5pF9dd4WKC8W9xF
	EPhDJlYeZmeB+5DCnu2rZ4SGz7WcDPjtb1FVc4Dq4ZWRLycByOQMs2qevretJWjpBzobrf5eIoe
	JZPzDiZl/907qRttbnU0qhJtI88bmys3pfAeu2cU6ZiYJxPh9VkAqb7V0L4y2RuIhoCqMNPMDl0
	5IKAXlxQ9VbeQrrmwbP+ScqCVuYAsV7heMqnDrlqkJtGhX+aBwnsTrdLTEUqTmBOE2rKq2rC03C
	ujauVzMcIUp7dpR9atP5S0XEhRfH+hdVqtIDpJDaIHEcNDwXL/AqRG8I1/ea3wysGnfMnIFVs3H
	SkvYl8shXkK8Tj+MwVDIODe4sDjIfuxgWdcOcs6zVMLA8qdq0KXJVrhV27csrQNPmIbhJs1e79w
	6a+KWSA3+WopAunrc8bvdsaUAztgGOXfeZTRFM8ELPgg==
X-Received: by 2002:a05:620a:f0d:b0:936:48f2:b04f with SMTP id af79cd13be357-93739432247mr652456285a.6.1787325347871;
        Fri, 21 Aug 2026 08:15:47 -0700 (PDT)
Received: from fedora ([2601:5c2:8600:6e00::18ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720493f35sm614552785a.9.2026.08.21.08.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:15:47 -0700 (PDT)
From: jaiden.linux@gmail.com
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jaiden Magnan <jaiden.linux@gmail.com>
Subject: [PATCH] staging: sm750fb: rename CamelCase variable pvReg to vreg
Date: Fri, 21 Aug 2026 11:15:25 -0400
Message-ID: <20260821151525.54751-1-jaiden.linux@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jaiden Magnan <jaiden.linux@gmail.com>

Rename CamelCase variable pvReg to vreg. This is to fix the following:

CHECK: Avoid CamelCase <pvReg>

Assisted-by: LLM
Signed-off-by: Jaiden Magnan <jaiden.linux@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..0bfda7508bb5 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->vreg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->vreg);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..a40dbcc2e6c8 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *vreg;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 34a837fb4b64..03c951619c70 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->vreg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->vreg) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->vreg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->vreg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->vreg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->vreg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.55.0

