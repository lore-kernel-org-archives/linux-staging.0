Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3273B4417
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664550; cv=none; b=l16OO4x6X31jcusUyDDSZthQK/ECQ37VtTg/zn6nkzeLPTASRpzuZMYRShrP7jEWM2kigBezj/kw0XQ+bBNEEx79f8W5ze1RIVc9nPpUdd29zb4eht0Uzlvu25cINLjK/cugyezR1RojliY1PmoPNNnAophVRwA5uqAaoBAhGx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664550; c=relaxed/simple;
	bh=R8HH9LkEOmCtSPM3nqsmnqfr8yvO/w0/cKwJO4nfKBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYXb1FkdVwG1xyukrgNiBLlkL241UlQSYxke1wX97e5cIw88KjPTbocNHGLya7MzeYgyvZsiPPShsNi9+SnT3u3pVxfSoPd32oEhi0OAbYcb3mJeSn7+B+WmdjxMh3RW4YlNelkASmsO2e63wKxf92/LkBzYdQbwn5yElzqdjpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k67iv3gs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k67iv3gs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49050bfe053so16240085e9.3
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 16:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779664547; x=1780269347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOw794GgxaqZfd5jkfXrvTqVTMmQaQeV6xdMiXoheSg=;
        b=k67iv3gsyLk/y3X9iT1JwXlcxR85JPj3Nr/GqKbdcmbvmgz6LzAFezkoJe56mfuVg4
         qDchhrhMQxtrodPRU4XCuWOL/6alt19JDe1mY/hqmCQJHfZG1n540LUehiut5y9pJFP0
         hw8pUjbvhAMS9KMsxfmwZqRVG8Sz2sRUWbOIxioBQs1dS5RDOpjrRKDGvjPSoNBqG7F6
         vmCwTIYhtbS7hOsN1vUOOIRXMlfDztWG/GvmmwHE4eA8MuDqWg4AeJwG2Batd2TJkFYv
         IqnEAjLpFB9TdckX0KI7FHvC8g0yqmrI7tWq2qlVznbPjnFK30ArT/oRGEazvnokvyZl
         SDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779664547; x=1780269347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QOw794GgxaqZfd5jkfXrvTqVTMmQaQeV6xdMiXoheSg=;
        b=O1zlRLq2xIc5aHL/HU4m/wx4ggpMO67BW6XE75opjn8LuTm+g+4dWGrmV13ZGibjbo
         bb1oukOVihnOCKWTJSyNrtNrlysVy5RcPP5KcSytEyELhok2+N36HSF4vXfC2wajZRWT
         RWsonvxdC2nR0D2Iv2rFXDWsUPQIuBWZBcTXlWGBSIyPogIFKN+28QqteoCAmqKQA3DH
         O8e/bZYVx7Q2zAnWemRnyCm4cfmOznZW3c1Aw7SyWG5a8aSs/ajAOGcD9W73PCrTXMoU
         SUAUJOBYsvToFa+TVbTsF1HS9ewIVbz8an5Z3ZR9h+6mbnPbnH35pcbRU4I5XKuxpH92
         ylcg==
X-Forwarded-Encrypted: i=1; AFNElJ+mn05SpaE3C8V/Q2PM/DFAo2e107HHJk5g7oUGSJ0VR1xl0iDIKzRQ2kVuaj9RLD0hdKShgNBu+owL7TwN@lists.linux.dev
X-Gm-Message-State: AOJu0YwjrgssjNf4rJ26Nd6Zm9l8TZVQIInPpq+e0rhnPM/3TdEzfb2J
	aUxzgCFzlyfuDPb9XcuZK9Ll6/QSGpUQc3TV6oHH4E376NQtG+lq8oy/
X-Gm-Gg: Acq92OEuR4xmsbi1SSPcGyG+uqDs8Na7uWRbGT/IAxHNn7YXi3RgO8iycS6qs5+MfLa
	w67NvYktP/VLzIt8CkH4GslGfxJJaxJZipSdtPI0eqmcXnsCDKDU9l3ZlU7C7ALqTgJfG7sCJoW
	ci8Sa4XCX3xb8Z0k/k3HdoNyWV7CiudCPVPxLfOCiPOViYhw+oWlRz/PlEf+XoNa04SsSVMznuf
	7cU9zwT0meOa45SaeVEtk0Raa2/1AyaRAKXv+RAuX3e62YsXgVtWOAAhR2SWdwr12Dcuv6fOOHn
	6z9S3O2t+y6BnJ/mvM90J4myIhVavGrNHUy0JL0X2A9cpHiJB5wfvUJmLjzW2eLah8YtCLDIgU9
	fYwC7uydX+14K/aIw5mmb3r6v3ZRwISGopZmafGD0D6Hq7rWrw+wER9xcM5joq9wfWj1YRffNrE
	xL3QOQ+wGL5fRwcLwUgMhEpel4VedFrAoZMmZXExVIT1EHnovA5p1xMrze9y8=
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr181385095e9.11.1779664546865;
        Sun, 24 May 2026 16:15:46 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49041787932sm95960575e9.1.2026.05.24.16.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:15:46 -0700 (PDT)
From: Michail Tatas <michail.tatas@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michail Tatas <michail.tatas@gmail.com>
Subject: [PATCH v2 2/2] staging: sm750fb: rename pvReg to pv_reg
Date: Mon, 25 May 2026 02:15:38 +0300
Message-ID: <fae018f80f61acea030d9893f3085998a78e4edf.1779661132.git.michail.tatas@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779661132.git.michail.tatas@gmail.com>
References: <cover.1779661132.git.michail.tatas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pvReg to pv_reg as per
the Linux coding standards

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 00c293430a7d..716a8935f58d 100644
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
@@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 589ae51444f8..e8885133da2e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
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
index 34a837fb4b64..95f797e5776a 100644
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

