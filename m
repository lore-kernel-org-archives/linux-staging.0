Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B5E2C17A0
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 20:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612489; cv=none; b=EBTM1Epa142jKPL1N5OFUdaq2Ls9GgVE5E+78QH1dRo7LR2/4lsQUjNmJ4rOxcczQlXCva4oRvtYKZGOfW9+GAfsYAmmVyvJvkzo5uA+JFW1qY3Qe0mHgOy0lNe9T83W9duyXoKn0tx04a6eff7OZO+2f1qYZPtQSLxp2NrbfNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612489; c=relaxed/simple;
	bh=MmjF4zOxAcXh1fxyxypmBCi31e0kCddMEICEOIXtgb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=O3TC1rPd5QH8NBCWNdDYMp7LDDq0ogF4cXBl0IXMn2XqXS14QF6qf9h5Ds+esuWKaWr+OhY6NwpqTRxhgcXq0VVebeH9mNcOUruMQEyAJpqtRTYH8gt+qMdD5kSGtuRkgaUBICKYZRycXd+9CZgDft9BQ8rORbtu6yvBmOELWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeGQKLm9; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeGQKLm9"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-41cfa50c73dso49086b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752612485; x=1753217285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8Vz2CZMV2vKDYQvb72/FeUb1gFMhQDy+4DurVPlGRU=;
        b=MeGQKLm9YDC29oguKVqwqPMXmEflVXCUCYVreBMwfo1hqvZf77Ps2JU1C3uQymC0fJ
         OnVlJT4irRaW34FBotgMw5s/zZMUwljCY9lPIHpqXRlXWdyiF6EX0go+qfW+NKHBgW5N
         ai9e0qHTlmhWVuZ2HF2SPXX4Nm9vdm1okm9jR4To+jyTzBnyjSY3XrmkZ00/Riv4pY/C
         Rx4PHk7NwiBFeWhJvMI4l9MyYVQIbbTXOKuiAw9PUF9aAab5r/Psih5HpWBxP9HSeCAB
         RVc7XC+nauvuddcHv9WTpKdn4zOA9/KeM/z/ZxvAGlE2ZwW61aFRnu+UUmO/OkXkwX1O
         hhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612485; x=1753217285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8Vz2CZMV2vKDYQvb72/FeUb1gFMhQDy+4DurVPlGRU=;
        b=wK/G3qya8P/xOJpRvyqKElie3E5lnZV8i4D6IXHnCKVd7vE7qeP1bNc6QjosDY+hOG
         vlRlJEm2CkJwXv9IBxjOwUHznNBC2pmnZhI8xhtoFSQUtzY9vIcCe+B9fFVTGT3UbVE9
         ZKeGhIsGtmXOz3O8A+ditXaMAu90/VqhAisTgvQ9X761UaI5Dvbsu77urr0vQBupl7c6
         ejuxZ9pAFybCBUgdJWgo/6J2U9pVxWGSKC/5pJ8fkqbN9wN/poQ+8UhVZsG1cSNaOsri
         MuVoHy0fb31ZyPB7l2mQrtV128lDRIyOz1YxDZ+PNIaaRUs6+RxJYmJ+ItYhw2keBa4S
         mhuA==
X-Forwarded-Encrypted: i=1; AJvYcCXVHWU4sRHjgAj+QswScVh/dTZddVTVPzXUf3AGs/j1wI4xs3D2Hx//IhAmvOQKi7HkDEvORh64ycEHw/NI@lists.linux.dev
X-Gm-Message-State: AOJu0YxJccfXJl+/fbNfwE9GRzgczjIuIQpxezsdmdgEWfmmNEap0nXF
	tfebrZyGjP9tlmV4yB1KOwAahv+H/AZoduJaQZNhk5lwroyNDhsJznxJ
X-Gm-Gg: ASbGncvcUMlgGDW3OK3sdguzb91ENffwvQHyR12gWKexjDitL0OpD8at1ORDDI8tbm6
	+xaFUBsJRFN9oKGCG+Sjbf1Oe2XdubqDumrBXL2o310pGMQVSlkEHNx1c5+EGBTKSIhNsMJTRVp
	qdf2bGjXJh/mZcjnLiNIos79l+/67HlboSv8FtGb6VU4wC9ZQ4X4xCEcbADXBpVJhE4rE5Zk9Kh
	gfDbZo28Tx3nQYLWUHhT2KXt+T5FAWz8rgNJpchZy4Fy2t1lmu+LdYtRMHaL49Mp5ytZSmlCfoR
	VimPANxq0EaFzeZe8HMJ7zmYONj+wAd8IPeeY2cyf6spJT9l2R5lHFOR1kPEG0B/tF0DgOlS5D/
	kuYuUSvMoDKkmqU8zi6m5lgT42naXZQYyiIlj8AIgcmVnma5ZZyUW
X-Google-Smtp-Source: AGHT+IGBefood9YVhRWUHRKITBcoY2rpnWTH4Yi5cfOmcElBnl75/DCrxwGYnuvzRNswvrA/08/KUA==
X-Received: by 2002:a05:6808:4fd3:b0:40b:1b09:2608 with SMTP id 5614622812f47-41cede8611amr421128b6e.1.1752612484995;
        Tue, 15 Jul 2025 13:48:04 -0700 (PDT)
Received: from localhost.localdomain ([181.161.31.179])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141c1ac493sm2290959b6e.38.2025.07.15.13.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:48:04 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>,
	linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [PATCH] staging: sm750fb: Fix checkpatch warnings in sm750.c
Date: Tue, 15 Jul 2025 16:48:04 -0400
Message-Id: <20250715204804.44380-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix multiple checkpatch warnings:
- Change 'static const char *' to 'static const char *const'
- Fix alignment issues with function arguments
- Change CamelCase variable 'Bpp' to 'bpp' following kernel style

These changes improve code readability and compliance with Linux
kernel coding style without changing functionality.

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca3..f36ad8324 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
@@ -121,13 +121,13 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
-				       fbcursor->image.dx - info->var.xoffset,
-				       fbcursor->image.dy - info->var.yoffset);
+					fbcursor->image.dx - info->var.xoffset,
+					fbcursor->image.dy - info->var.yoffset);
 
 	if (fbcursor->set & FB_CUR_SETCMAP) {
 		/* get the 16bit color of kernel means */
@@ -160,7 +160,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 {
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
-	unsigned int base, pitch, Bpp, rop;
+	unsigned int base, pitch, bpp, rop;
 	u32 color;
 
 	if (info->state != FBINFO_STATE_RUNNING)
@@ -175,9 +175,9 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	 */
 	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
-	color = (Bpp == 1) ? region->color :
+	color = (bpp == 1) ? region->color :
 		((u32 *)info->pseudo_palette)[region->color];
 	rop = (region->rop != ROP_COPY) ? HW_ROP2_XOR : HW_ROP2_COPY;
 
@@ -190,7 +190,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	spin_lock(&sm750_dev->slock);
 
 	sm750_dev->accel.de_fillrect(&sm750_dev->accel,
-				     base, pitch, Bpp,
+				     base, pitch, bpp,
 				     region->dx, region->dy,
 				     region->width, region->height,
 				     color, rop);
@@ -202,7 +202,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 {
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
-	unsigned int base, pitch, Bpp;
+	unsigned int base, pitch, bpp;
 
 	par = info->par;
 	sm750_dev = par->dev;
@@ -213,7 +213,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 	 */
 	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
 	/*
 	 * If not use spin_lock, system will die if user load driver
@@ -225,7 +225,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 
 	sm750_dev->accel.de_copyarea(&sm750_dev->accel,
 				     base, pitch, region->sx, region->sy,
-				     base, pitch, Bpp, region->dx, region->dy,
+				     base, pitch, bpp, region->dx, region->dy,
 				     region->width, region->height,
 				     HW_ROP2_COPY);
 	spin_unlock(&sm750_dev->slock);
@@ -234,7 +234,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 static void lynxfb_ops_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
-	unsigned int base, pitch, Bpp;
+	unsigned int base, pitch, bpp;
 	unsigned int fgcol, bgcol;
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
@@ -247,7 +247,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	 */
 	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
 	/* TODO: Implement hardware acceleration for image->depth > 1 */
 	if (image->depth != 1) {
@@ -274,7 +274,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 
 	sm750_dev->accel.de_imageblit(&sm750_dev->accel,
 				      image->data, image->width >> 3, 0,
-				      base, pitch, Bpp,
+				      base, pitch, bpp,
 				      image->dx, image->dy,
 				      image->width, image->height,
 				      fgcol, bgcol, HW_ROP2_COPY);
-- 
2.39.5 (Apple Git-154)

