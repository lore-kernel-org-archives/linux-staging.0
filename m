Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789325B085
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779623915; cv=none; b=IboenGVh/iEBoo8O6tICegxm0VoMlDQofxQXKkPhyBMUyA6YCA2ELwZqP5+B0FPWZgCiywNHOMCQymtxqq4PWGgP4eBMOOrpeO4IS9IBMU9hnXW6hHp8qwYeF6Cme3oeUcOv9bZwr8tUwPDMZsAVV3lBIpqzJoLfdIj/0KXSSJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779623915; c=relaxed/simple;
	bh=7VfTCIbS8V5j8B01Tv93WANp8R0M6PVgfVtvUybFHVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwkqrlHA9QerBo+FSa4A6pd7KM/7GnLYAxZj5b7n9eq9cA85gthNKPLmzYoMJdTO1OgWrylxgdWyXt0yRAG4a/knYnbE0huPF6aNJsqs46ppOZsYnp7sOp20mHAa4Ct7gKWpIChkuwG8QDl1uoyR428ixpmdBWz9diGH3WUxreU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjLbKt13; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjLbKt13"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba928852a5so60751145ad.1
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 04:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779623912; x=1780228712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZj/YanuZsoxlwxdQNTJdjcC3kFstTno1fYVBLW1C+U=;
        b=XjLbKt133FP0LfMnxyJDtULz4CdMscBTanochsD0CBly9ExvOZABhPVECPGGtWbehQ
         xW1KBijqUA665zblshy/eyaBORUXnfPd23+L6t+ooW0EjgA0OAb7ZiP+fLFrYfzhI+ET
         d/2voMNViCkbWq6Egawv6x5jw87p4J3LxykiWL9KVvZldSI3OTRDJFtHeaf4xIZmNnuD
         JHBvDekDwCEjVYZZ6EhcwXdaa4//+fbyzP7HmbFFA5R/CPNU6XMuPv/B+eFwdTkpNq26
         dz4w+2CAcmDNFd2sUZ+gIgQpK5sxErKzhrMNhqd7vG6bYyjxvk6KbmtQB3nf8ZoXsi/p
         QyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779623912; x=1780228712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZj/YanuZsoxlwxdQNTJdjcC3kFstTno1fYVBLW1C+U=;
        b=D5S/1wPet3Z8rjBWNgDGT8ZiAmnnHon8JWEzThHWnE6EgL7BeOA9yUGXHCTAZLThvX
         TcBR7sOooacEP0sbdmOsCcJcz9OX6RUwAjsm34U5SjSpUAeEl7DSjj/LVTzQCP0DCegt
         KAJ9btoHu82CRSTq1U1JBfsl48FzhYPiWwg1LAVU2RdKigMqlMQrp35R9yySjdjwQo5t
         FkIPytCyzjmL3WYVH15xYM5A6FInbzA5Zdt2riWXEdQeNu1OZxzgCgrCC9Z/HXXYXi07
         o/iw5Bh8THQdkoKijnRpoIZs18lqGSwnBa6ByuSTV8T6EdZ4merrHQdv5BA+jo1CykhQ
         j5UA==
X-Forwarded-Encrypted: i=1; AFNElJ9bQ8ZqaEIK7sCl4ULpjbEmNXr7QPx8GddqRG2zz4gOJxo7FopPeH7/lTVr9qF1wEYzzf8v8uCy+EIyb/RI@lists.linux.dev
X-Gm-Message-State: AOJu0YzqGwn8Zj81tIKBE+/q5qO1ZnQoF7Z0OjsYnjxOC5BbRvF5nRQ9
	8HUEPla09OvRG+4fs/EUIAKN2Tnndkjt/iZsirnD5NSrAdB3uIRR/8XJ
X-Gm-Gg: Acq92OGvSvQNAN9B4UY0tagpZewLCZI+g3oF7zx2G5aP537g9C9vp0Oe+tf4+DS5XXU
	gx3hE7sTh227DAQMLR/YW+jot6UwuMAXMZOoFwmlNLw95F7Ke7lzPkNdqJlUTMuEqtWAjyutosH
	Wx8ofWIakIaVbX77tGHOGUsgh5iLkjOh0dhmQAvue010XKTBxeUhE3gKwfxAB9xbYtMBKYWjv7F
	rOJpVlphjrswrQ+urRPhEcwB0oLKRNdwGcVrn92XCtA5GkILm170rGjMeg/pa/ZzeaGVGMqlNaa
	9W/uTigfcNGroRtXLq93gJcn3Nf9sIORirQI4QoNO7Pw2y579RJQsEn5cMdavTIncKEZVeE6q0Z
	To418INs5J2g923gzjTilblpvQF1faW4QcXQq65tAmbhRXDhkt56+rNT6sbl3fV1WwcYUjr2AmD
	Jgga2PptCQMOrSfQx0GyPZUaRSZ+Tjesyd
X-Received: by 2002:a17:90b:3b8a:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-36a6749eb2cmr10712658a91.5.1779623912042;
        Sun, 24 May 2026 04:58:32 -0700 (PDT)
Received: from onish ([2404:7c80:75:55f3:d423:9757:6acf:6ef9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm6658155a91.7.2026.05.24.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:58:31 -0700 (PDT)
From: onish-cmd <neharora23587@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Onish Sharma <neharora23587@gmail.com>
Subject: [PATCH] staging: sm750fb: Fix CamelCase style issues
Date: Sun, 24 May 2026 17:28:23 +0530
Message-ID: <20260524115823.8813-1-neharora23587@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Onish Sharma <neharora23587@gmail.com>

- Rename struct members: powerMode -> power_mode, pvReg -> pv_reg,
  pvMem -> pv_mem, setAllEngOff -> set_all_eng_off,
  resetMemory -> reset_memory.
- Rename enum members: sm750_24TFT -> SM750_24TFT, etc.
- Corrected MODULE_PARM_DESC formatting to comply with kernel style.
- Note: g_fbmode warning intentionally kept to allow runtime assignment.

Signed-off-by: Onish Sharma <neharora23587@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 220 ++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    |  74 +++++-----
 drivers/staging/sm750fb/sm750_hw.c |  26 ++--
 3 files changed, 157 insertions(+), 163 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..6dda8ccdb 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *g_fbmode[] = { NULL, NULL };
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
@@ -41,64 +41,62 @@ static char *g_option;
 
 static const struct fb_videomode lynx750_ext[] = {
 	/*	1024x600-60 VESA	[1.71:1] */
-	{NULL,  60, 1024, 600, 20423, 144,  40, 18, 1, 104, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1024, 600, 20423, 144, 40, 18, 1, 104, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1024x600-70 VESA */
-	{NULL,  70, 1024, 600, 17211, 152,  48, 21, 1, 104, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 70, 1024, 600, 17211, 152, 48, 21, 1, 104, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1024x600-75 VESA */
-	{NULL,  75, 1024, 600, 15822, 160,  56, 23, 1, 104, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 75, 1024, 600, 15822, 160, 56, 23, 1, 104, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1024x600-85 VESA */
-	{NULL,  85, 1024, 600, 13730, 168,  56, 26, 1, 112, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 85, 1024, 600, 13730, 168, 56, 26, 1, 112, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	720x480	*/
-	{NULL, 60,  720,  480,  37427, 88,   16, 13, 1,   72,  3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 720, 480, 37427, 88, 16, 13, 1, 72, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1280x720		[1.78:1]	*/
-	{NULL, 60,  1280,  720,  13426, 162, 86, 22, 1,  136, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1280, 720, 13426, 162, 86, 22, 1, 136, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1280x768@60 */
-	{NULL, 60, 1280, 768, 12579, 192, 64, 20, 3, 128, 7,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1280, 768, 12579, 192, 64, 20, 3, 128, 7,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1360 x 768	[1.77083:1]	*/
-	{NULL,  60, 1360, 768, 11804, 208,  64, 23, 1, 144, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1360, 768, 11804, 208, 64, 23, 1, 144, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1368 x 768      [1.78:1]	*/
-	{NULL, 60,  1368,  768,  11647, 216, 72, 23, 1,  144, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1368, 768, 11647, 216, 72, 23, 1, 144, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1440 x 900		[16:10]	*/
-	{NULL, 60, 1440, 900, 9392, 232, 80, 28, 1, 152, 3,
-	 FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1440, 900, 9392, 232, 80, 28, 1, 152, 3,
+	  FB_SYNC_VERT_HIGH_ACT, FB_VMODE_NONINTERLACED },
 
 	/*	1440x960		[15:10]	*/
-	{NULL, 60, 1440, 960, 8733, 240, 88, 30, 1, 152, 3,
-	 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1440, 960, 8733, 240, 88, 30, 1, 152, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED },
 
 	/*	1920x1080	[16:9]	*/
-	{NULL, 60, 1920, 1080, 6734, 148, 88, 41, 1, 44, 3,
-	 FB_SYNC_VERT_HIGH_ACT,
-	 FB_VMODE_NONINTERLACED},
+	{ NULL, 60, 1920, 1080, 6734, 148, 88, 41, 1, 44, 3,
+	  FB_SYNC_VERT_HIGH_ACT, FB_VMODE_NONINTERLACED },
 };
 
 /* no hardware cursor supported under version 2.6.10, kernel bug */
@@ -120,8 +118,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
-		sm750_hw_cursor_set_size(cursor,
-					 fbcursor->image.width,
+		sm750_hw_cursor_set_size(cursor, fbcursor->image.width,
 					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
@@ -134,19 +131,23 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 		u16 fg, bg;
 
 		fg = ((info->cmap.red[fbcursor->image.fg_color] & 0xf800)) |
-		     ((info->cmap.green[fbcursor->image.fg_color] & 0xfc00) >> 5) |
-		     ((info->cmap.blue[fbcursor->image.fg_color] & 0xf800) >> 11);
+		     ((info->cmap.green[fbcursor->image.fg_color] & 0xfc00) >>
+		      5) |
+		     ((info->cmap.blue[fbcursor->image.fg_color] & 0xf800) >>
+		      11);
 
 		bg = ((info->cmap.red[fbcursor->image.bg_color] & 0xf800)) |
-		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
-		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
+		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >>
+		      5) |
+		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >>
+		      11);
 
 		sm750_hw_cursor_set_color(cursor, fg, bg);
 	}
 
 	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
-		sm750_hw_cursor_set_data(cursor, fbcursor->rop, fbcursor->image.data,
-					 fbcursor->mask);
+		sm750_hw_cursor_set_data(cursor, fbcursor->rop,
+					 fbcursor->image.data, fbcursor->mask);
 	}
 
 	if (fbcursor->enable)
@@ -178,7 +179,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	bpp = info->var.bits_per_pixel >> 3;
 
 	color = (bpp == 1) ? region->color :
-		((u32 *)info->pseudo_palette)[region->color];
+			     ((u32 *)info->pseudo_palette)[region->color];
 	rop = (region->rop != ROP_COPY) ? HW_ROP2_XOR : HW_ROP2_COPY;
 
 	/*
@@ -189,11 +190,9 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	 */
 	spin_lock(&sm750_dev->slock);
 
-	sm750_dev->accel.de_fillrect(&sm750_dev->accel,
-				     base, pitch, bpp,
-				     region->dx, region->dy,
-				     region->width, region->height,
-				     color, rop);
+	sm750_dev->accel.de_fillrect(&sm750_dev->accel, base, pitch, bpp,
+				     region->dx, region->dy, region->width,
+				     region->height, color, rop);
 	spin_unlock(&sm750_dev->slock);
 }
 
@@ -223,10 +222,9 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 	 */
 	spin_lock(&sm750_dev->slock);
 
-	sm750_dev->accel.de_copyarea(&sm750_dev->accel,
-				     base, pitch, region->sx, region->sy,
-				     base, pitch, bpp, region->dx, region->dy,
-				     region->width, region->height,
+	sm750_dev->accel.de_copyarea(&sm750_dev->accel, base, pitch, region->sx,
+				     region->sy, base, pitch, bpp, region->dx,
+				     region->dy, region->width, region->height,
 				     HW_ROP2_COPY);
 	spin_unlock(&sm750_dev->slock);
 }
@@ -272,12 +270,11 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	 */
 	spin_lock(&sm750_dev->slock);
 
-	sm750_dev->accel.de_imageblit(&sm750_dev->accel,
-				      image->data, image->width >> 3, 0,
-				      base, pitch, bpp,
-				      image->dx, image->dy,
-				      image->width, image->height,
-				      fgcol, bgcol, HW_ROP2_COPY);
+	sm750_dev->accel.de_imageblit(&sm750_dev->accel, image->data,
+				      image->width >> 3, 0, base, pitch, bpp,
+				      image->dx, image->dy, image->width,
+				      image->height, fgcol, bgcol,
+				      HW_ROP2_COPY);
 	spin_unlock(&sm750_dev->slock);
 }
 
@@ -385,7 +382,7 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 
 	var->height = -1;
 	var->width = -1;
-	var->accel_flags = 0;/*FB_ACCELF_TEXT;*/
+	var->accel_flags = 0; /*FB_ACCELF_TEXT;*/
 
 	if (ret) {
 		dev_err(info->device, "bpp %d not supported\n",
@@ -498,7 +495,7 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 
 	var->height = -1;
 	var->width = -1;
-	var->accel_flags = 0;/* FB_ACCELF_TEXT; */
+	var->accel_flags = 0; /* FB_ACCELF_TEXT; */
 
 	/* check if current fb's video memory big enough to hold the onscreen*/
 	request = var->xres_virtual * (var->bits_per_pixel >> 3);
@@ -514,12 +511,9 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	return hw_sm750_crtc_check_mode(crtc, var);
 }
 
-static int lynxfb_ops_setcolreg(unsigned int regno,
-				unsigned int red,
-				unsigned int green,
-				unsigned int blue,
-				unsigned int transp,
-				struct fb_info *info)
+static int lynxfb_ops_setcolreg(unsigned int regno, unsigned int red,
+				unsigned int green, unsigned int blue,
+				unsigned int transp, struct fb_info *info)
 {
 	struct lynxfb_par *par;
 	struct lynxfb_crtc *crtc;
@@ -556,8 +550,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 	if (info->fix.visual == FB_VISUAL_TRUECOLOR && regno < 256) {
 		u32 val;
 
-		if (var->bits_per_pixel == 16 ||
-		    var->bits_per_pixel == 32 ||
+		if (var->bits_per_pixel == 16 || var->bits_per_pixel == 32 ||
 		    var->bits_per_pixel == 24) {
 			val = chan_to_field(red, &var->red);
 			val |= chan_to_field(green, &var->green);
@@ -616,32 +609,33 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				    hw_sm750le_de_wait : hw_sm750_de_wait;
+					   hw_sm750le_de_wait :
+					   hw_sm750_de_wait;
 	switch (sm750_dev->dataflow) {
 	case sm750_simul_pri:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pv_mem;
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pv_mem;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
 			/* not consider of padding stuffs for o_screen,need fix */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
@@ -649,7 +643,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -657,7 +651,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	default:
@@ -670,7 +664,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 static const struct fb_ops lynxfb_ops = {
 	.owner = THIS_MODULE,
 	FB_DEFAULT_IOMEM_OPS,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
@@ -680,7 +674,7 @@ static const struct fb_ops lynxfb_ops = {
 static const struct fb_ops lynxfb_ops_with_cursor = {
 	.owner = THIS_MODULE,
 	FB_DEFAULT_IOMEM_OPS,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
@@ -691,7 +685,7 @@ static const struct fb_ops lynxfb_ops_with_cursor = {
 static const struct fb_ops lynxfb_ops_accel = {
 	.owner = THIS_MODULE,
 	__FB_DEFAULT_IOMEM_OPS_RDWR,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
@@ -705,7 +699,7 @@ static const struct fb_ops lynxfb_ops_accel = {
 static const struct fb_ops lynxfb_ops_accel_with_cursor = {
 	.owner = THIS_MODULE,
 	__FB_DEFAULT_IOMEM_OPS_RDWR,
-	.fb_check_var =  lynxfb_ops_check_var,
+	.fb_check_var = lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
@@ -728,11 +722,14 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	struct fb_fix_screeninfo *fix;
 
 	const struct fb_videomode *pdb[] = {
-		lynx750_ext, NULL, vesa_modes,
+		lynx750_ext,
+		NULL,
+		vesa_modes,
 	};
-	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
+	int cdb[] = { ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE };
 	static const char *fix_id[2] = {
-		"sm750_fb1", "sm750_fb2",
+		"sm750_fb1",
+		"sm750_fb2",
 	};
 
 	int ret, line_length;
@@ -755,13 +752,13 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
-		0x800f0 + (int)crtc->channel * 0x140;
+	crtc->cursor.mmio =
+		sm750_dev->pv_reg + 0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->pv_mem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
@@ -788,8 +785,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	}
 
 	for (i = 0; i < 3; i++) {
-		ret = fb_find_mode(var, info, g_fbmode[index],
-				   pdb[i], cdb[i], NULL, 8);
+		ret = fb_find_mode(var, info, g_fbmode[index], pdb[i], cdb[i],
+				   NULL, 8);
 
 		if (ret == 1 || ret == 2)
 			break;
@@ -859,9 +856,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
@@ -880,11 +877,11 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = SM750_DOUBLE_TFT;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = SM750_DUAL_TFT;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
-			sm750_dev->pnltype = sm750_24TFT;
+			sm750_dev->pnltype = SM750_24TFT;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
 			g_hwcursor &= ~0x1;
 		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
@@ -901,7 +898,8 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 				dev_info(&sm750_dev->pdev->dev,
 					 "find fbmode1 : %s\n", g_fbmode[1]);
 			} else {
-				dev_warn(&sm750_dev->pdev->dev, "How many view you wann set?\n");
+				dev_warn(&sm750_dev->pdev->dev,
+					 "How many view you wann set?\n");
 			}
 		}
 	}
@@ -1028,7 +1026,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->pv_mem, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1059,8 +1057,8 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->pv_reg);
+	iounmap(sm750_dev->pv_mem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
 }
@@ -1112,8 +1110,12 @@ static int __init lynxfb_setup(char *options)
 }
 
 static const struct pci_device_id smi_pci_table[] = {
-	{ PCI_DEVICE(0x126f, 0x0750), },
-	{0,}
+	{
+		PCI_DEVICE(0x126f, 0x0750),
+	},
+	{
+		0,
+	}
 };
 
 MODULE_DEVICE_TABLE(pci, smi_pci_table);
@@ -1121,11 +1123,11 @@ MODULE_DEVICE_TABLE(pci, smi_pci_table);
 static SIMPLE_DEV_PM_OPS(lynxfb_pm_ops, lynxfb_suspend, lynxfb_resume);
 
 static struct pci_driver lynxfb_driver = {
-	.name =		"sm750fb",
-	.id_table =	smi_pci_table,
-	.probe =	lynxfb_pci_probe,
-	.remove =	lynxfb_pci_remove,
-	.driver.pm =	&lynxfb_pm_ops,
+	.name = "sm750fb",
+	.id_table = smi_pci_table,
+	.probe = lynxfb_pci_probe,
+	.remove = lynxfb_pci_remove,
+	.driver.pm = &lynxfb_pm_ops,
 };
 
 static int __init lynxfb_init(void)
@@ -1162,9 +1164,7 @@ MODULE_PARM_DESC(g_option,
 		 "\t\tdualview:dual frame buffer feature enabled\n"
 		 "\t\tnohwc:disable hardware cursor\n"
 		 "\t\tUsual example:\n"
-		 "\t\tinsmod ./sm750fb.ko g_option=\"noaccel,nohwc,1280x1024-8@60\"\n"
-		 );
-
+		 "\t\tinsmod ./sm750fb.ko g_option=\"noaccel,nohwc,1280x1024-8@60\"\n");
 MODULE_AUTHOR("monk liu <monk.liu@siliconmotion.com>");
 MODULE_AUTHOR("Sudip Mukherjee <sudip@vectorindia.org>");
 MODULE_DESCRIPTION("Frame buffer driver for SM750 chipset");
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 67b9bfa23..68237d8dc 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -6,24 +6,24 @@
 
 #define MHZ(x) ((x) * 1000000)
 
-#define DEFAULT_SM750_CHIP_CLOCK	290
-#define DEFAULT_SM750LE_CHIP_CLOCK	333
+#define DEFAULT_SM750_CHIP_CLOCK 290
+#define DEFAULT_SM750LE_CHIP_CLOCK 333
 #ifndef SM750LE_REVISION_ID
 #define SM750LE_REVISION_ID ((unsigned char)0xfe)
 #endif
 
 enum sm750_pnltype {
-	sm750_24TFT = 0,	/* 24bit tft */
-	sm750_dualTFT = 2,	/* dual 18 bit tft */
-	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
+	SM750_24TFT = 0, /* 24bit tft */
+	SM750_DUAL_TFT = 2, /* dual 18 bit tft */
+	SM750_DOUBLE_TFT = 1, /* 36 bit double pixel tft */
 };
 
 /* vga channel is not concerned  */
 enum sm750_dataflow {
-	sm750_simul_pri,	/* primary => all head */
-	sm750_simul_sec,	/* secondary => all head */
-	sm750_dual_normal,	/* primary => panel head and secondary => crt */
-	sm750_dual_swap,	/* primary => crt head and secondary => panel */
+	sm750_simul_pri, /* primary => all head */
+	sm750_simul_sec, /* secondary => all head */
+	sm750_dual_normal, /* primary => panel head and secondary => crt */
+	sm750_dual_swap, /* primary => crt head and secondary => panel */
 };
 
 enum sm750_channel {
@@ -35,19 +35,18 @@ enum sm750_channel {
 enum sm750_path {
 	sm750_panel = 1,
 	sm750_crt = 2,
-	sm750_pnc = 3,	/* panel and crt */
+	sm750_pnc = 3, /* panel and crt */
 };
 
 struct init_status {
-	ushort powerMode;
+	unsigned short power_mode;
 	/* below three clocks are in unit of MHZ*/
-	ushort chip_clk;
-	ushort mem_clk;
-	ushort master_clk;
-	ushort setAllEngOff;
-	ushort resetMemory;
+	unsigned short chip_clk;
+	unsigned short mem_clk;
+	unsigned short master_clk;
+	unsigned short set_all_eng_off;
+	unsigned short reset_memory;
 };
-
 struct lynx_accel {
 	/* base virtual address of DPR registers */
 	unsigned char __iomem *dpr_base;
@@ -57,26 +56,21 @@ struct lynx_accel {
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
 
-	int (*de_wait)(void);/* see if hardware ready to work */
+	int (*de_wait)(void); /* see if hardware ready to work */
 
-	int (*de_fillrect)(struct lynx_accel *accel,
-			   u32 base, u32 pitch, u32 bpp,
-			   u32 x, u32 y, u32 width, u32 height,
+	int (*de_fillrect)(struct lynx_accel *accel, u32 base, u32 pitch,
+			   u32 bpp, u32 x, u32 y, u32 width, u32 height,
 			   u32 color, u32 rop);
 
-	int (*de_copyarea)(struct lynx_accel *accel,
-			   u32 s_base, u32 s_pitch,
-			   u32 sx, u32 sy,
-			   u32 d_base, u32 d_pitch,
-			   u32 bpp, u32 dx, u32 dy,
-			   u32 width, u32 height,
-			   u32 rop2);
+	int (*de_copyarea)(struct lynx_accel *accel, u32 s_base, u32 s_pitch,
+			   u32 sx, u32 sy, u32 d_base, u32 d_pitch, u32 bpp,
+			   u32 dx, u32 dy, u32 width, u32 height, u32 rop2);
 
 	int (*de_imageblit)(struct lynx_accel *accel, const char *p_srcbuf,
-			    u32 src_delta, u32 start_bit, u32 d_base, u32 d_pitch,
-			    u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
-			    u32 height, u32 f_color, u32 b_color, u32 rop2);
-
+			    u32 src_delta, u32 start_bit, u32 d_base,
+			    u32 d_pitch, u32 byte_per_pixel, u32 dx, u32 dy,
+			    u32 width, u32 height, u32 f_color, u32 b_color,
+			    u32 rop2);
 };
 
 struct sm750_dev {
@@ -89,7 +83,7 @@ struct sm750_dev {
 	int accel_off;
 	int fb_count;
 	int mtrr_off;
-	struct{
+	struct {
 		int vram;
 	} mtrr;
 	/* all smi graphic adaptor got below attributes */
@@ -97,8 +91,8 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
-	unsigned char __iomem *pvMem;
+	void __iomem *pv_reg;
+	unsigned char __iomem *pv_mem;
 	/* locks*/
 	spinlock_t slock;
 
@@ -136,11 +130,11 @@ struct lynxfb_crtc {
 	unsigned char __iomem *v_screen; /* virtual address of on_screen */
 	int o_cursor; /* cursor address offset in vidmem */
 	int o_screen; /* onscreen address offset in vidmem */
-	int channel;/* which channel this crtc stands for*/
-	resource_size_t vidmem_size;/* this view's video memory max size */
+	int channel; /* which channel this crtc stands for*/
+	resource_size_t vidmem_size; /* this view's video memory max size */
 
 	/* below attributes belong to info->fix, their value depends on specific adaptor*/
-	u16 line_pad;/* padding information:0,1,2,4,8,16,... */
+	u16 line_pad; /* padding information:0,1,2,4,8,16,... */
 	u16 xpanstep;
 	u16 ypanstep;
 	u16 ywrapstep;
@@ -206,8 +200,8 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 			   struct fb_var_screeninfo *var,
 			   struct fb_fix_screeninfo *fix);
 
-int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
-			 ushort red, ushort green, ushort blue);
+int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index, ushort red,
+			 ushort green, ushort blue);
 
 int hw_sm750_set_blank(struct lynxfb_output *output, int blank);
 int hw_sm750le_set_blank(struct lynxfb_output *output, int blank);
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428..5af1cdcea 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -42,18 +42,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
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
@@ -66,9 +66,9 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->vidmem_size = ddk750_get_vm_size();
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->pv_mem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
+	if (!sm750_dev->pv_mem) {
 		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto err_unmap_reg;
@@ -77,7 +77,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
@@ -90,8 +90,8 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	parm = &sm750_dev->init_parm;
 	if (parm->chip_clk == 0)
 		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
-					       DEFAULT_SM750LE_CHIP_CLOCK :
-					       DEFAULT_SM750_CHIP_CLOCK;
+					 DEFAULT_SM750LE_CHIP_CLOCK :
+					 DEFAULT_SM750_CHIP_CLOCK;
 
 	if (parm->mem_clk == 0)
 		parm->mem_clk = parm->chip_clk;
@@ -128,12 +128,12 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		      ~(PANEL_DISPLAY_CTRL_DUAL_DISPLAY |
 			PANEL_DISPLAY_CTRL_DOUBLE_PIXEL);
 		switch (sm750_dev->pnltype) {
-		case sm750_24TFT:
+		case SM750_24TFT:
 			break;
-		case sm750_doubleTFT:
+		case SM750_DOUBLE_TFT:
 			val |= PANEL_DISPLAY_CTRL_DOUBLE_PIXEL;
 			break;
-		case sm750_dualTFT:
+		case SM750_DUAL_TFT:
 			val |= PANEL_DISPLAY_CTRL_DUAL_DISPLAY;
 			break;
 		}
-- 
2.54.0

