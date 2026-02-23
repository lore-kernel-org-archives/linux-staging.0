Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447E3783C9
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879241; cv=none; b=aO+BtvCEmG+nLeFFT1xZK6ME3NQNg54F5ha69k1SaMvGT2p8BDYaqxEZzBwFwM1rn9MdQbCwYCPnzXaMDR1tH3/4a8wphHwk0OokmkVALBL4jiwyLYpU8SZ8+a25hdAIjivgOocX/9VD3S2zZkevZxyznmCYv/7lsvshv/Z7l48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879241; c=relaxed/simple;
	bh=7wdFTk7EsuTQD40sYbGLO9uGMcqCjsrVcLiUODy0QW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVwxL7sM3z1b0OSp6uZOXcEdGiTnnNcKFz5YjvUIMs0BWcK+UkIoLJAerxcyN+Or/569pDKhzLZuY5+cK2z2aSfrrjbLuVk5mkkozmUiRYFdm7nfnqycjgutv0iy4Xyw2amBCwVnKshaRw6F1YbVjxSHBDZCfEhaL8ymlBH2FMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lnu/nivZ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lnu/nivZ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65a40f3f048so8862058a12.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771879238; x=1772484038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3NO8KBFUMkdcX0z3WtXfxlYbuD2YI3n3NEoGhLgBt0=;
        b=Lnu/nivZ4F5z/lOqDfpzLhW8oLNZnjLze9how0I8us6uXg+DtytKMVkpHDhzFIrXUo
         e8hPEzerviJ6lbn3RTQ4DZqO63yfoZLa6ECrArW7dOBYOVQ2AAYf2PjZ9r3gvTknIRBn
         taDVN0oERJemoTWzjKKPSYY+EtKh3e7JIg3HhAnnSvPHgw6Tlk5xf5MuaQW7uU7QdR3s
         RUpq6djFoqj701zv1mYTGbuiVUv9T4gv6iqVLsp64DZA+tBHW+fn3TXzw2MsjWexmV45
         elTkiYlGGXU0g9UXtt3T105KQian+mzewDDqDY0ABzTMhHRxMs0Dbcuy0WusXqgw2p1z
         M95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879238; x=1772484038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q3NO8KBFUMkdcX0z3WtXfxlYbuD2YI3n3NEoGhLgBt0=;
        b=W+2J8J+s2rL9SiPuckLK05vWU5KTUHoEySLWw9UtzPPelTBLfz6i1XTkkXzr9BA8q8
         jqt1PDRiEe8IHH2Kvf0pxfFEyko0f0viP7J7Hx6Y8WUvUI0W757yjWqg2JrAX+6l+BpK
         82il47qD6TPvdpB9tVbB3Zcq06IFhOmFegdgRzW0yNGT6ABCvD0cdPAJpFX0JWKUnEe2
         uoUpd89kKQLsQwlhhvDK1lKFZs2jS+3Tc81IhDOBOE3/s6uNEvvxyZ12WEFnua1oy4vi
         1DZed5YkIaghamvRejbIYcb8P/FNK2kTt0e/x+VERL8FGOvzyVsRvWpqnw/KX/2Avhh0
         x3CA==
X-Forwarded-Encrypted: i=1; AJvYcCUydRVEvRlT7/hd2bbl5VFoi0vnUUeGY81zoydSFdp724XBzQUxfI05dH0gsY66HxYcyERoeNF/7VYwUOL8@lists.linux.dev
X-Gm-Message-State: AOJu0YzMBpaDAzhhxxZoyw/eQMvrokHstY7b2pELHJmzyup6CiqTnIf3
	rjswk6V/x3+YMd56oN+5F137wor7zTtgb8VbAI1v6787g1a0goMkP3qY
X-Gm-Gg: ATEYQzwhg7W2JABA15fw2tJK1Fz1UHpRYFncKmx4rPH2Vt+nR7EZhkTU7Cb7B58L3g8
	Rdjv6C7Zh/OvceXN1bqBW3weo46N4Og5A8GDizTcWyTNyBXmDgvnUIPr0Y7WBUjq9NffBRKmEwJ
	WKelgoW/bWXtf85Kwhrgfihr1oeEyMdCmaUNA5jaHM+BBKE070eL9KE1qW3HgUUrUEQBf69l77l
	aevh/NBBztuWE8mMgTqQ8BD5AltHvJlQ/4peByonAlnd1EBLBAq9P6vdZrSktPlm/hGLriuC7BA
	sC3IwGOsZMRSRtT/kfgPLultwRphAtEpn8AGMnMfcoDUKtYLxDs88B4BsF+GhPpVDHcNbfaA9Pr
	PzGKZjbcjolJd9xlVFhcTgQ42joZifsVAUSYVCxgGNFGP/tJMSKG0bkBvROElZTutUCtesdxwjm
	Yg630AFpS24+RxPfHYwjP0W1eAs99PLPQqV32N7FehfYylH1Tth62BgDvOwhbtowO6y/XA/XN8Q
	bhyqW7ixMCDmm55jpIl++gnrhrHmEJPFtMOUneOIngOJl3pX1zuvv29S8iq0D++qWTonNx2aA2l
	t+yFIKhrnXI=
X-Received: by 2002:a05:6402:3496:b0:658:b4b9:c73a with SMTP id 4fb4d7f45d1cf-65ea4ec02e4mr5310098a12.2.1771879237947;
        Mon, 23 Feb 2026 12:40:37 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (186.209.141.34.bc.googleusercontent.com. [34.141.209.186])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9aae0csm2818662a12.10.2026.02.23.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:40:37 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v5 1/2] staging: sm750fb: remove debug and diagnostic prints
Date: Mon, 23 Feb 2026 20:40:35 +0000
Message-ID: <20260223204036.1780-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223204036.1780-1-iprintercanon@gmail.com>
References: <20260223204036.1780-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all pr_info, pr_debug, and pr_warn calls that dump internal
variable values, pointer addresses, and structure contents not useful
for production use. This includes the complete fb_find_mode() result
logging in lynxfb_set_fbinfo(), the CH7301 DVI chip status messages
in hw_sm750_inithw(), and various debug prints throughout the driver.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 76 +-----------------------------
 drivers/staging/sm750fb/sm750_hw.c | 18 +------
 2 files changed, 3 insertions(+), 91 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 5c8f2ea784b2..0670b1b0881c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -375,7 +375,6 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 	line_length = var->xres_virtual * var->bits_per_pixel / 8;
 	line_length = ALIGN(line_length, crtc->line_pad);
 	fix->line_length = line_length;
-	pr_info("fix->line_length = %d\n", fix->line_length);
 
 	/*
 	 * var->red,green,blue,transp are need to be set by driver
@@ -486,11 +485,6 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	par = info->par;
 	crtc = &par->crtc;
 
-	pr_debug("check var:%dx%d-%d\n",
-		 var->xres,
-		 var->yres,
-		 var->bits_per_pixel);
-
 	ret = lynxfb_set_color_offsets(info);
 
 	if (ret) {
@@ -582,7 +576,6 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
 	struct lynxfb_par *par;
 	struct lynxfb_output *output;
 
-	pr_debug("blank = %d.\n", blank);
 	par = info->par;
 	output = &par->output;
 	sm750_dev = par->dev;
@@ -627,7 +620,6 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
 		crtc->v_screen = sm750_dev->pvMem;
-		pr_info("use simul primary mode\n");
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
@@ -736,12 +728,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		lynx750_ext, NULL, vesa_modes,
 	};
 	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
-	static const char * const mdb_desc[] = {
-		"driver prepared modes",
-		"kernel prepared default modedb",
-		"kernel HELPERS prepared vesa_modes",
-	};
-
 	static const char *fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
@@ -769,7 +755,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	crtc->cursor.mmio = sm750_dev->pvReg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
-	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
@@ -803,47 +788,10 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		ret = fb_find_mode(var, info, g_fbmode[index],
 				   pdb[i], cdb[i], NULL, 8);
 
-		if (ret == 1) {
-			pr_info("success! use specified mode:%s in %s\n",
-				g_fbmode[index],
-				mdb_desc[i]);
+		if (ret == 1 || ret == 2)
 			break;
-		} else if (ret == 2) {
-			pr_warn("use specified mode:%s in %s,with an ignored refresh rate\n",
-				g_fbmode[index],
-				mdb_desc[i]);
-			break;
-		} else if (ret == 3) {
-			pr_warn("wanna use default mode\n");
-			/*break;*/
-		} else if (ret == 4) {
-			pr_warn("fall back to any valid mode\n");
-		} else {
-			pr_warn("ret = %d,fb_find_mode failed,with %s\n",
-				ret,
-				mdb_desc[i]);
-		}
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
 
@@ -853,7 +801,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 
 	info->pseudo_palette = &par->pseudo_palette[0];
 	info->screen_base = crtc->v_screen;
-	pr_debug("screen_base vaddr = %p\n", info->screen_base);
 	info->screen_size = line_length * var->yres_virtual;
 
 	/* set info->fix */
@@ -867,7 +814,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
-	pr_info("fix->smem_start = %lx\n", fix->smem_start);
 	/*
 	 * according to mmap experiment from user space application,
 	 * fix->mmio_len should not larger than virtual size
@@ -876,13 +822,10 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
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
 
@@ -891,22 +834,12 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	var->accel_flags = 0;
 	var->vmode = FB_VMODE_NONINTERLACED;
 
-	pr_debug("#1 show info->cmap :\nstart=%d,len=%d,red=%p,green=%p,blue=%p,transp=%p\n",
-		 info->cmap.start, info->cmap.len,
-		 info->cmap.red, info->cmap.green, info->cmap.blue,
-		 info->cmap.transp);
-
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (ret < 0) {
 		dev_err(info->device, "Could not allocate memory for cmap.\n");
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
@@ -1133,12 +1066,8 @@ static int __init lynxfb_setup(char *options)
 	int len;
 	char *opt, *tmp;
 
-	if (!options || !*options) {
-		pr_warn("no options.\n");
+	if (!options || !*options)
 		return 0;
-	}
-
-	pr_info("options:%s\n", options);
 
 	len = strlen(options) + 1;
 	g_settings = kzalloc(len, GFP_KERNEL);
@@ -1175,7 +1104,6 @@ static int __init lynxfb_setup(char *options)
 	}
 
 	/* misc g_settings are transport to chip specific routines */
-	pr_info("parameter left for chip specific analysis:%s\n", g_settings);
 	return 0;
 }
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a29faee91c78..a5c2dbca00ec 100644
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
 
@@ -192,14 +184,12 @@ int hw_sm750_output_set_mode(struct lynxfb_output *output,
 
 	if (sm750_get_chip_type() != SM750LE) {
 		if (channel == sm750_primary) {
-			pr_info("primary channel\n");
 			if (output->paths & sm750_panel)
 				disp_set |= do_LCD1_PRI;
 			if (output->paths & sm750_crt)
 				disp_set |= do_CRT_PRI;
 
 		} else {
-			pr_info("secondary channel\n");
 			if (output->paths & sm750_panel)
 				disp_set |= do_LCD1_SEC;
 			if (output->paths & sm750_crt)
@@ -215,7 +205,6 @@ int hw_sm750_output_set_mode(struct lynxfb_output *output,
 		poke32(DISPLAY_CONTROL_750LE, reg);
 	}
 
-	pr_info("ddk setlogicdispout done\n");
 	return ret;
 }
 
@@ -232,10 +221,8 @@ int hw_sm750_crtc_check_mode(struct lynxfb_crtc *crtc,
 	case 16:
 		break;
 	case 32:
-		if (sm750_dev->revid == SM750LE_REVISION_ID) {
-			pr_debug("750le do not support 32bpp\n");
+		if (sm750_dev->revid == SM750LE_REVISION_ID)
 			return -EINVAL;
-		}
 		break;
 	default:
 		return -EINVAL;
@@ -302,7 +289,6 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 	else
 		clock = SECONDARY_PLL;
 
-	pr_debug("Request pixel clock = %lu\n", modparm.pixel_clock);
 	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
 		pr_err("Set mode timing failed\n");
@@ -431,12 +417,10 @@ int hw_sm750_set_blank(struct lynxfb_output *output, int blank)
 
 	switch (blank) {
 	case FB_BLANK_UNBLANK:
-		pr_debug("flag = FB_BLANK_UNBLANK\n");
 		dpms = SYSTEM_CTRL_DPMS_VPHP;
 		pps = PANEL_DISPLAY_CTRL_DATA;
 		break;
 	case FB_BLANK_NORMAL:
-		pr_debug("flag = FB_BLANK_NORMAL\n");
 		dpms = SYSTEM_CTRL_DPMS_VPHP;
 		crtdb = CRT_DISPLAY_CTRL_BLANK;
 		break;
-- 
2.43.0

