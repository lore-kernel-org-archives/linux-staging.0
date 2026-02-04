Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612E3ED125
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206766; cv=none; b=rE91o7T3orissLmz3A1nArLwOKbhLqKrSi/smsHUJ4wt2nN6SioJ7zQeMEUyEhTEVWyVr8JwcnSEbR0TLW8voEnL90h/uF797YKGyPtFmRk7QmxJNykCQsVrDgSTEXj0aIfiMMMwXtJ56SyBVlzF2HTlqaDrDR5hXIcPCfwU7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206766; c=relaxed/simple;
	bh=ePDCvki57IJq/w/pNpzUuf4VyUgtAe/vLy0/4UvtQ9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udFTWL54PUwS/+02wLWpSR6pvjDNGBaeTr4sQtstfy5Dk4fLkG5oKbMPxTxC8mTzyUCbZ0WFoxq/SDkF4xZtD1IiQ0ahc7isI0iT9GTCiAjceBMi5vJZo/yd4WteuXWBbflIkjRpiTB7bEQsBjw4KnqMDmqV1eqxDiqEIzbYkFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y401xbbJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y401xbbJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8876d1a39bso959963566b.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 04:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770206764; x=1770811564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/LLBXkrnZYijKL1yhvHY8dsQ5h0wnJhN7v4B6DmqbY=;
        b=Y401xbbJeicmIZ0GqSQkeHG7uIn63LAESAACgd4lASJmSUUDUc1rm5P0U/B2htAqRg
         PcoK5YJTPZmSP0ZkjSAb+/r14CpTUdMfWeMDVK6tM4rdA7SeYMWTSqQoBFSLyR9Nrz8h
         vZ6Nt/kmetqxNuvpyBiUo3PVQlFSmZkzqwt9r/O5oSPnSRj+82gfx7Kml+ufDgOcUcCs
         SNwuRfEtSCz9nW/TB1ufBYJqLw71vctjEBqJpcf8wXO0BTp9FrEDRqr2vG8vn0VTp8kX
         +nQlJ5cTYMYZopCNREN4sRoMBQUcrVLzoMvgcpKGkrbTpG9z4mFNaIyOaiaCJCgPrEhZ
         w0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206764; x=1770811564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/LLBXkrnZYijKL1yhvHY8dsQ5h0wnJhN7v4B6DmqbY=;
        b=uk2ldK+DJnH82W1e56XVFpYZZAVyqztqgBZZ+HOh82oW0V63sHMHwpdBSYDh9KME7u
         WMkjFXJvjS2TZKbdjB1r5ghFQrz0Qx0LQArUuLx6086hPdsnWFP8N87OwOG7Lx5B954G
         StMHxd+rCOSk0jmJvvNt4IYlexBRZN+wIXpAxyKJEZqG/L+tlDy6Pi+YV5brwf3E0N+5
         17gnHKoOLGGlqzKGS54mJtJs7iZF8XzImQD6rbmQ84kBepXYlz23VmlYrT+Sa87bX4LY
         vLSrf+Q5xa9hM6Vjc2mmccMeOl5wKgB+kKrK84xU0tLpRUFm6rKYJBgONYlIYgEz0sv1
         iKsg==
X-Forwarded-Encrypted: i=1; AJvYcCWMm8oLjgzpdQR3gyuKbJ/yy9EmreqeTkPqpa+aZxmLuJasrsix7DPHRsoBk63JexGj2HU0qXhVAbNfiueC@lists.linux.dev
X-Gm-Message-State: AOJu0YxJj6L5GPbMB3Wl5vYmajnYmRTWnUOLUkyeIsJXJKCrK43YHAYg
	cwZeigMrUKqfr1xioPRsZDJ6vPRY5arOeDM9gerujyLJ0o23ALGK2b4b
X-Gm-Gg: AZuq6aK5YwDqFnJueD4sFWw3Of73ozVP1XWdSdvTnqt3FciLhUMY3HJZOQe9drD37hM
	sacQrhZkl6nQHfaQnoWugfmatKOFuGveZ94eD0Pj3cx1RLvwtMf680Roho5USX/qjAemx88ZW+4
	yDtbGE8HNTuIbN3vNPj6OHzoFXUSRMO9Et6qgPeLuAN0nHLYwu0hwRTg6sBAmtCn6hacYefpTiJ
	Oo8RBH17u3Iyo8vOkQp5MzXkvzU6Kf1AoINrbHUcxVWOz6XpuQvhTzctSm4grsZXqvxvpu44sh0
	0A5xht8P7WoZ23aXEtOGmwGDRawI0jOtxWGzG3HovM+Zy6hzlsqcB9uSOqWYEKhpZTl/BoxQwHb
	LBpJjPHg+tKIx+Eabw/zEQb+IWkS8ah2lCepNYQaZVMjO4GsAb14HkdwthyqefCpYFNTNRj25n7
	APkpQ3nwUY7wvEqPUApq+ZIZwVUrUnHINkJbVXCsNlOOenJmmm5w0GbZsL+nfKp75r8gWbD0JU0
	khK3IRmrB9Cq3jOTrqmTDyVoBETqrA13NGbaJKOoVUNBVl+6aaEuEoIhig=
X-Received: by 2002:a17:907:3cc5:b0:b8e:5e2:79fc with SMTP id a640c23a62f3a-b8e9f0a8cc5mr188804266b.14.1770206764200;
        Wed, 04 Feb 2026 04:06:04 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.79.91.34.bc.googleusercontent.com. [34.91.79.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8be3sm117979666b.10.2026.02.04.04.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:06:03 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 3/5] staging: sm750fb: remove debug and diagnostic prints
Date: Wed,  4 Feb 2026 12:06:00 +0000
Message-ID: <20260204120602.6715-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204120602.6715-1-iprintercanon@gmail.com>
References: <20260204120602.6715-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove pr_info, pr_debug, and pr_warn calls that dump internal
variable values, pointer addresses, structure contents, and
other diagnostic information not useful for production use.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 53 ++----------------------------
 drivers/staging/sm750fb/sm750_hw.c |  8 -----
 2 files changed, 2 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index bd2d4a290..050408af2 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -375,7 +375,6 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 	line_length = var->xres_virtual * var->bits_per_pixel / 8;
 	line_length = ALIGN(line_length, crtc->line_pad);
 	fix->line_length = line_length;
-	pr_info("fix->line_length = %d\n", fix->line_length);
 
 	/*
 	 * var->red,green,blue,transp are need to be set by driver
@@ -485,11 +484,6 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	par = info->par;
 	crtc = &par->crtc;
 
-	pr_debug("check var:%dx%d-%d\n",
-		 var->xres,
-		 var->yres,
-		 var->bits_per_pixel);
-
 	ret = lynxfb_set_color_offsets(info);
 
 	if (ret) {
@@ -580,7 +574,6 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
 	struct lynxfb_par *par;
 	struct lynxfb_output *output;
 
-	pr_debug("blank = %d.\n", blank);
 	par = info->par;
 	output = &par->output;
 	sm750_dev = par->dev;
@@ -625,7 +618,6 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
 		crtc->v_screen = sm750_dev->pvMem;
-		pr_info("use simul primary mode\n");
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
@@ -767,7 +759,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	crtc->cursor.mmio = sm750_dev->pvReg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
-	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
@@ -811,11 +802,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 				g_fbmode[index],
 				mdb_desc[i]);
 			break;
-		} else if (ret == 3) {
-			pr_warn("wanna use default mode\n");
-			/*break;*/
-		} else if (ret == 4) {
-			pr_warn("fall back to any valid mode\n");
+		} else if (ret == 3 || ret == 4) {
+			continue;
 		} else {
 			pr_warn("ret = %d,fb_find_mode failed,with %s\n",
 				ret,
@@ -823,25 +811,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		}
 	}
 
-	/* some member of info->var had been set by fb_find_mode */
-
-	pr_info("Member of info->var is :\n"
-		"xres=%d\n"
-		"yres=%d\n"
-		"xres_virtual=%d\n"
-		"yres_virtual=%d\n"
-		"xoffset=%d\n"
-		"yoffset=%d\n"
-		"bits_per_pixel=%d\n"
-		" ...\n",
-		var->xres,
-		var->yres,
-		var->xres_virtual,
-		var->yres_virtual,
-		var->xoffset,
-		var->yoffset,
-		var->bits_per_pixel);
-
 	/* set par */
 	par->info = info;
 
@@ -851,7 +820,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 
 	info->pseudo_palette = &par->pseudo_palette[0];
 	info->screen_base = crtc->v_screen;
-	pr_debug("screen_base vaddr = %p\n", info->screen_base);
 	info->screen_size = line_length * var->yres_virtual;
 
 	/* set info->fix */
@@ -865,7 +833,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	strscpy(fix->id, fixId[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
-	pr_info("fix->smem_start = %lx\n", fix->smem_start);
 	/*
 	 * according to mmap experiment from user space application,
 	 * fix->mmio_len should not larger than virtual size
@@ -874,13 +841,10 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * data into the bound over virtual size
 	 */
 	fix->smem_len = crtc->vidmem_size;
-	pr_info("fix->smem_len = %x\n", fix->smem_len);
 	info->screen_size = fix->smem_len;
 	fix->line_length = line_length;
 	fix->mmio_start = sm750_dev->vidreg_start;
-	pr_info("fix->mmio_start = %lx\n", fix->mmio_start);
 	fix->mmio_len = sm750_dev->vidreg_size;
-	pr_info("fix->mmio_len = %x\n", fix->mmio_len);
 
 	lynxfb_set_visual_mode(info);
 
@@ -889,22 +853,12 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	var->accel_flags = 0;
 	var->vmode = FB_VMODE_NONINTERLACED;
 
-	pr_debug("#1 show info->cmap :\nstart=%d,len=%d,red=%p,green=%p,blue=%p,transp=%p\n",
-		 info->cmap.start, info->cmap.len,
-		 info->cmap.red, info->cmap.green, info->cmap.blue,
-		 info->cmap.transp);
-
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (ret < 0) {
 		pr_err("Could not allocate memory for cmap.\n");
 		goto exit;
 	}
 
-	pr_debug("#2 show info->cmap :\nstart=%d,len=%d,red=%p,green=%p,blue=%p,transp=%p\n",
-		 info->cmap.start, info->cmap.len,
-		 info->cmap.red, info->cmap.green, info->cmap.blue,
-		 info->cmap.transp);
-
 exit:
 	lynxfb_ops_check_var(var, info);
 	return ret;
@@ -934,9 +888,6 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	}
 
 	while ((opt = strsep(&src, ":")) != NULL && *opt != 0) {
-		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
-		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
-
 		if (!strcmp(opt, "swap")) {
 			swap = 1;
 		} else if (!strcmp(opt, "nocrt")) {
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..e3e4b75d6 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -34,8 +34,6 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->vidreg_start = pci_resource_start(pdev, 1);
 	sm750_dev->vidreg_size = SZ_2M;
 
-	pr_info("mmio phyAddr = %lx\n", sm750_dev->vidreg_start);
-
 	/*
 	 * reserve the vidreg space of smi adaptor
 	 * if you do this, you need to add release region code
@@ -56,7 +54,6 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 
 	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
 	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
@@ -72,8 +69,6 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 * @ddk750_get_vm_size function can be safe.
 	 */
 	sm750_dev->vidmem_size = ddk750_get_vm_size();
-	pr_info("video memory phyAddr = %lx, size = %u bytes\n",
-		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
 	sm750_dev->pvMem =
@@ -84,7 +79,6 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
 exit:
 	return ret;
 }
@@ -163,11 +157,9 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 			 * The following register values for CH7301 are from
 			 * Chrontel app note and our experiment.
 			 */
-			pr_info("yes,CH7301 DVI chip found\n");
 			sm750_sw_i2c_write_reg(0xec, 0x1d, 0x16);
 			sm750_sw_i2c_write_reg(0xec, 0x21, 0x9);
 			sm750_sw_i2c_write_reg(0xec, 0x49, 0xC0);
-			pr_info("okay,CH7301 DVI chip setup done\n");
 		}
 	}
 
-- 
2.43.0

