Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D23A05E5
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533699; cv=none; b=t4kt+XwGKZ5c0YlbYmbmK9LwyUu21nFdFlDFcw8+SS0aLpgA9RIm4rWBOgAYiOdlPHs02g5gUP8qaKVX2upqVcvlLLdrpkZ+sQ3nzN9MteOkN1oHiHik3AsCK7yTJ1S1AcMggegprdCZA50D/+1RYaX3Eeq0jbWCw5OhC0YtMdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533699; c=relaxed/simple;
	bh=UIN0bA+YKo+3VFEKbtRjfhcpWLJzKLf0m2AAUllG/m4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n5kD1wO1MVWmwDCnxJfwHL4fwQASavsHrLOYhLV6xAeH/HU2exQyLIXpZhekY2UmTEFY2m2VYalcGDoFdArd+Hp0OyVNQnWmtc/ORT0KgqscSmcuER0WpBzeoa8d2zCCBx9IZbeLDua+NcJIVubWN3rBiFg+8r5sfuDZFa31b6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWl4pg10; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWl4pg10"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f707e5d75so621415f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533696; x=1785138496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYTY+YytUTVXh7tizlm0m+SYG2Db8OWI678d5zAl264=;
        b=DWl4pg10iZTf3WXPSnPqQ0DXS8F1abN3QKZq6pF90m4mWodEqKjOQRXcwQpg8y6wc0
         ElHPGBLAOCf8O4HLw3i2xvRqZ8NW2wpTkKUNqz4dMOgP11HuwPTDLrNHKSWI37sC8cVC
         Gbr6B2cHSro3DO7FIFMEwheQiZd4X8uh99M47ixIFEqcgALF+PfRcpBHIgrE4eVvnzMv
         D3b91N8bDmEAKjnpDAqHttcL8XKoiTT7coZh2lJhrs075Qh/PIxT7wYt/wGeZuCDkGJQ
         GTAOjsEtgHbEftnxQJKgEJsWrHYGwW1TPDblFyHkwIFd0MB0eITNd4kJCmTHB+E/jkL/
         YT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533696; x=1785138496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYTY+YytUTVXh7tizlm0m+SYG2Db8OWI678d5zAl264=;
        b=NeAE0B16AO+5lZnfI7z+4zabWR7kphZn7MMlLPYY7wRho8jOJPa3a7GJsuJkLNvO5+
         2tvyPu3kQmtZi3oyNGDStGRjChFra4L4+eAnFnHW457E/xK+zyxjzLdJXuOGDIeSR5ql
         yY9b5nTyfsYXQpcoGFWXdMXDk0szr1i8fT76JIIvEH8+QbnpP6ZG5Yc49Qd90V4Aa1zC
         t8YVLKSsViCesAxEG0c/tHDKdfokm2ubr0lOwakUst+TIJR71zR5jhpqhdqCAUcULZM2
         CtJyWLZKzM0lUKGsnAwbMFrbEj0Y7zRiDgmNZ4ttLdB4eFMLV/3AeFOd116L7LwzkpaQ
         PQUg==
X-Gm-Message-State: AOJu0YzOXYSbqh2cOvHs8oCBOOPMoprvcgE1p2WdURRjjwszcwuBpqJe
	AbWvuhxVOy4FhjZeWqeGbAh0gF9EXQfiamnri3ZotyzumvVk6aFcCoD+W7tm58me
X-Gm-Gg: AfdE7clgLhassI2Apaa9EdtDx+T9Z7I0gydYuMs3T9RkyjxD6WOaFgvfNWaA6d1fJ2h
	U+DeHAg/+SQZQ06YzA0LOxSk5HnCdf2HMTESpISsnhNv52hGKYK+BI8eLyfPtlbA2dbUKaLvEfv
	pPX6a74dqGqZOmwuH87dCjb0CpcsZ0zG4tB90+z3GIv524fbWmIQ2bDmozbQUNOtbdpjmKWlBIz
	j+oeVvUw18pbsLz5rga0W1cexA3+tjqIdnlm0Z+SVkeEPtDUuOYNqSJlso7wrSTFMCRuPv6JB5y
	LgSojoIlpMnaF47q58Es2qe9GGwv83G38vKBrLc3z4iXJwWkowLLifgwn3ptBtkbdsAsTLibTqO
	xCX7oyNElZTQ43L/d34a/BzCfQKwZJIxK3F1icvfdzFpYHt8zABOBb+6msyc5tHxm2iGqfyoA56
	vYGe979I+ryTGEpucB54ryJvnbYUzqatm1UVfmgHDIWRuNtutK
X-Received: by 2002:a05:6000:490c:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47f6230528cmr16304943f8f.11.1784533695369;
        Mon, 20 Jul 2026 00:48:15 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd27sm27544129f8f.28.2026.07.20.00.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:48:14 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH] staging: sm750fb: rename pvReg to avoid CamelCase
Date: Mon, 20 Jul 2026 09:48:04 +0200
Message-Id: <20260720074804.29657-1-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding the use of CamelCase:
CHECK: Avoid CamelCase: <pvReg>

Rename the struct member pvReg to reg across the driver to
comply with the Linux kernel coding style.

Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..c5f43a364437 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pvreg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pvreg);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..39471d7f2696 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *pvreg;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 34a837fb4b64..d1f021e31a96 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pvreg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pvreg) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pvreg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pvreg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pvreg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pvreg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.34.1

