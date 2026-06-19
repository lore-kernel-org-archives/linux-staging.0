Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C858A34E763
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860428; cv=none; b=pLd8WgnmtFRpXbNKPFOxShf3rGOG0xUxWB/+pX0Ar3p1b1F6Q5TcmtpyRXYoWQYWqUQQm7cMRn3xv40jlrcGSu8tMyjMyrqQc/VclhwaFUSexU7Md6b6za/ld0E290EcbD2919fVqQp7OGvsY/dB2YqmaVuJk7RYLChMQxUTSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860428; c=relaxed/simple;
	bh=A4R9hM3zphKIlQy7fSKobMGGuksvhH2HVxuiJVlmIPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKy/W34cSFRvpFJduIib9VrxoVrJeR8OEY5eYSS2S0VdaDbpvtCvnLNbjOcb/JvY2Zfv76tPrULV0UZdYySrzYP1xKJhuWdn0MZQ5T4EOxe7hHwDQ+XPgnptsAOZ8M+CRC4MK6GYK24HjoioTsG+xVA4t0LaMW0Cl2n+JuO5frI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+Hrto1e; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+Hrto1e"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13736575e9.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860425; x=1782465225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAQ5csjl8oxIj8s6D8Km4LqE5SyKx2h6r4DVyh0qIFA=;
        b=L+Hrto1et+Cbp2JroFwjUSuA9Pdcx/6ia5S8Kqh5pRH3e3sW+yhjNh8HEp90vLkejR
         4gkYpdHxpNTN6t5pzI8wIDIx2w056+HlVj036cv3rZFeWcOvoci9CFti++pIL1jXAFP/
         flQMVXUdr3iqjmwqOZSuoVa3vK4lI/X8VKwiWiNisaeSbeUAlPDzFvwmCwlCO9igWY34
         dOG0RThxW22CG8m0RkpePn1cFStVVHO+eAn/zU7fHGSDHGXBlrbYzIzAhtK3KglE/EV1
         VeE6h/31JuX76ejqcp6vEArwgJb4d6wrHkBk3kNRCovP/nyiOih2CunFRZPnqTRE+dNu
         12UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860425; x=1782465225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAQ5csjl8oxIj8s6D8Km4LqE5SyKx2h6r4DVyh0qIFA=;
        b=nbyDg2okB4x0gp2agkuMYN7EMzy849fa2dBdI/9u2VZBBL3vabeE5Ngw2/zWOL4voC
         v+NpVJjK+/t5XcXY6hIUKrXYp/mVqGcvvasAS1MRmboI/YJdGCs07km4WuPgt6EiSJ4E
         kBh08/7bAY/hOw2gl9yUgPAx1mkfM9+pY81vAXZE+FwEzTfXjjBoEOLZ/l981SjGee9I
         1DwJP7JEo8QxkLglB/M1FpWj3vjWniVCTAON2tk0KfqulRp0Vlgco0DK1XU6ebh19hiQ
         bFa2W2vbxPyELKaQ1IRQyQEQJXJXDgUQP9cq5fo1793V6Vl5xNybZlA0JFtdIsOlNiiJ
         Ll2g==
X-Gm-Message-State: AOJu0Yylf/YHWpJxEfG6+7TTOgbeq7nq8G1xTZIX/8xZkQFGmr2SiU3n
	c3mf0VpoJjwj+DJoVcR17sQOfkcoVruLi7YWQZMTgjLHF+Fd8e0DTexD
X-Gm-Gg: AfdE7ckpMiTW/BrV7GmR2GCgQXYtcIdEtQKPj4L7W4zN2unX4stN6YOP8muy+BTJ+S9
	c93wLlvXjJh67zGq+rW9AN7TET5szZxe0hUV5yGCZVI7AoDtv0mrKembdMQsFJnxXwUYnEfRtv6
	5KPjIRl8zttfsJprDM0sUW4wTKzAUT+2oVwle42ncgwjhaBMr1urubMUkzxbn/V+qmMpY4EKgV+
	fUc+E863NP8GfWrp4vKIFYl1dJ4DNhghgwEna70aR9KzF3ZlkvQ/7Fg6eK/WvDxRyELlnQLSA4P
	3QDPkVYdPs9/nSQWoZtdsLd9kr8qCcEIwZjCkao9SWcZwjnoQEj/zIgEXmEWEWhIghbxaQocnz6
	gpjt8DeVWk62mm+04B8u0vXAw35acQiq3K7sySGWzCsvdtWiYbTEnFvH5AY2KnHv0SOE3gXTsbT
	G1r4W7zJBX77EvyVpoX6FatJkUssp4UYwJdp/LznPhMw4l95GPtMAYdrC0o6hRuBhCLK5E8jM6i
	AaMrA==
X-Received: by 2002:a05:600c:8489:b0:490:d354:bd0a with SMTP id 5b1f17b1804b1-4923f582d5bmr49182045e9.31.1781860425104;
        Fri, 19 Jun 2026 02:13:45 -0700 (PDT)
Received: from fedora ([196.112.134.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650b67a3f3sm7077826f8f.20.2026.06.19.02.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:13:44 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: sm750fb: rename pvReg to mmio
Date: Fri, 19 Jun 2026 10:13:32 +0100
Message-ID: <20260619091332.622116-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the Hungarian-notation pvReg field to mmio, which describes
what it is (memory-mapped I/O) rather than what type it is (pointer
to void).

This is a purely mechanical change with no functional difference.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..2d6b4bdbbdd8 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->mmio +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->mmio);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..f4dbe161bc56 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *mmio;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 34a837fb4b64..bebbd50db7ac 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->mmio =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->mmio) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->mmio + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->mmio + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->mmio;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->mmio);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.54.0

