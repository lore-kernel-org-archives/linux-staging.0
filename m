Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A892749FE
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478627; cv=none; b=hhZ3GqZOnG/CGa6vqQcfcsiT8SLSfcU6KGQaEioTKBDl4iDpTBbv62WZw52lM5i3zBR5681EFcM0BhaibdhnVAWMfIyaDkK1eO4lA2xhaiHjnDgyWj9RnQC9FN3f09lY3g0puFjclLvrQUSfS15wHnRxMvvJlJsOhK5fG8v10s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478627; c=relaxed/simple;
	bh=mmsOF+8mCTmv4usEVa5LGRU6vlMDYRpG+4LhjzRz1oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MF2A17jaVlkHYV4jr4xCO1VN7g6i6fMKL2+xna1eVV4lBxdxtvUB3AgDvjn3LTsX+4vdEgCut9X/a+3P8f9140MrI5JhlQJGxYB35eiu2cPJELFGv7ZzZmgHCrtUBaZK7DIc5g75oG40TRG4P/CpmG7wU2UNHLsLSM7OsYLVFew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1nbn+bc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1nbn+bc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so477070466b.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 07:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770478626; x=1771083426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H7/AHvvBIzcS+9ZNqDlojVn7lEdnc7V72Tg1pliomM=;
        b=f1nbn+bcztdsx4R66c3U5idX3eT3T5/AOEM3ttWHXEsRzyBcHpSCW7+qflwRBQ3YuV
         zsSggULcTPohHDPinXPdcybqc9XBH4mcB8g5VcgEqZCQ4b4ABuwTGiZ1SDvhXMz4N1bN
         zuSSFGJ2wDOYuFRbR/b7wgEK0csr9WDiaHOKLR5JpK8DtCVkhjIEo7To7s9ZPjMHvcaS
         wVYUBtW0nCrMShNMLLb5pJFsk11JqeABhFggn5NQyTWgOzMocNVWxGx7p4e/Y5QbX6d/
         Q7Ur8taxis/HyxhqyhOSAZdeU0chuEyBA4Kzy3HLXxbpBWn7+8z2PlYCSk3w9xnaI/wu
         aBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770478626; x=1771083426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1H7/AHvvBIzcS+9ZNqDlojVn7lEdnc7V72Tg1pliomM=;
        b=Ll1/3xukh22MDVv9zS4BPIDLcBHcVYZHmMczuqMhi3REWg8akdv/4xJIntlMBvt2PN
         oce2ii62vPktYzUKzCfGeMbI+L2U34DDmfpn0n9STbdGE5TBoe4aiO+wA2+VJHZ91f+b
         RqgZNFttB2Id/dmQlCvzQFc7VbhGk29MSZK8BC2hi1A/KQX3wWtOJduBqKC0Pz7V3yYz
         hz8/10rRk2QjyO0ntMuPzTMfMow17z1OlWujSOroqsp9a5MyBrS4IJCnRFhDYCae0jaT
         lyuFn0wC/Dr3BqF8PXt5mM7UP8EHSi6O2iFzyZZH9ILTw8mB1HMY1PCgpFfspR3IuCgo
         isPg==
X-Forwarded-Encrypted: i=1; AJvYcCVCulr7dsuWlbK6bWDCrr0dHaWgOaV/VRRjnRIyr1yhv3bRZN1BM1fiU04xtxvSozWC2rpe5EoqsSBfRkR7@lists.linux.dev
X-Gm-Message-State: AOJu0YzW0i3mo12SmZuqbnLtR6hA1hkPjENjTYC5HSTgpW7KL98EmYsT
	Kh4dVrCwba292znfVLNRWcUvCzoHlmVrt5e454PKbPiYZlrFvDlNZg3B
X-Gm-Gg: AZuq6aIgU7gbp8+tMQUT2wugLm700aIAa6gdYD3F1gHMDjrsM26+JKGt3wQ7xMB+uqq
	1v6H9PekPkeTZw37pAd5OMxXtwou9MVEw7/QtedpT+LbWivK07kJfV9sIHd9RVrHLt7OjXxzBXi
	u7dzhkOXpbXnkBERTv5O1hZt9WQshFyAn1JN6J14033XYGWff/CGqxF26kQh2l9kzCV8UGZl7Of
	Fcstvu9a1qHQbVOStb10f+cs+1NTikHdv1huQvK6RGYxU2XCtwZSUrgnqhPinD5GWF2YrvOZyYi
	oGjsEDnXGVgqlCQ8OELB6a/tlcxTrZ/Eb9r1ZJrF8+kbFtkqZsBWS48QpFCSiBygTvLy+9TCv4z
	QjRdSQD6CqhlTYOE7HIqBha4pQmgZUkAES0RRk7OmcZxp21quSRHkkiweZFLPmxzW3mVT3XvwO0
	Oh61jY6Hs8gwsaX2PMhSTvSEKvjfzpSVq98ZYFNwrR62Y6mXI4PTQfZuU2aAT9tp25DYz/au8x2
	U7iR3pOZfT4EZ1Rf2bNku5Uv/uyGj6fXtU830Ua7pKU6qhWk1s/8W+GXBUNhnH5
X-Received: by 2002:a17:907:9717:b0:b87:2c3d:ef08 with SMTP id a640c23a62f3a-b8edf2feb09mr390835566b.33.1770478625495;
        Sat, 07 Feb 2026 07:37:05 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (170.249.141.34.bc.googleusercontent.com. [34.141.249.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda748aa6sm181308666b.1.2026.02.07.07.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 07:37:04 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v4 1/3] staging: sm750fb: remove debug and diagnostic prints
Date: Sat,  7 Feb 2026 15:37:01 +0000
Message-ID: <20260207153703.2049-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207153703.2049-1-iprintercanon@gmail.com>
References: <20260207153703.2049-1-iprintercanon@gmail.com>
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
index fecd7457e..987ba8772 100644
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
@@ -734,12 +726,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		lynx750_ext, NULL, vesa_modes,
 	};
 	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
-	static const char * const mdb_desc[] = {
-		"driver prepared modes",
-		"kernel prepared default modedb",
-		"kernel HELPERS prepared vesa_modes",
-	};
-
 	static const char *fixId[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
@@ -767,7 +753,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	crtc->cursor.mmio = sm750_dev->pvReg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
-	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
@@ -801,47 +786,10 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
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
 
@@ -851,7 +799,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 
 	info->pseudo_palette = &par->pseudo_palette[0];
 	info->screen_base = crtc->v_screen;
-	pr_debug("screen_base vaddr = %p\n", info->screen_base);
 	info->screen_size = line_length * var->yres_virtual;
 
 	/* set info->fix */
@@ -865,7 +812,6 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	strscpy(fix->id, fixId[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
-	pr_info("fix->smem_start = %lx\n", fix->smem_start);
 	/*
 	 * according to mmap experiment from user space application,
 	 * fix->mmio_len should not larger than virtual size
@@ -874,13 +820,10 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
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
 
@@ -889,22 +832,12 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
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
@@ -1131,12 +1064,8 @@ static int __init lynxfb_setup(char *options)
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
@@ -1173,7 +1102,6 @@ static int __init lynxfb_setup(char *options)
 	}
 
 	/* misc g_settings are transport to chip specific routines */
-	pr_info("parameter left for chip specific analysis:%s\n", g_settings);
 	return 0;
 }
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..983b51164 100644
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

