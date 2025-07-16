Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA6421CA00
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752627366; cv=none; b=sWBMNyl1KSNhjOvuGhvpauzkHDMLxcJD4tNXSDjxqkXnV8uPcsJFH2XgavqmhxzZi5py/OGHYq5VzllRgCetq4S7Dl/2tMunvU+Wa03bq3Skj0WxtkX4qeWFB6Xiov+XdD1347CGpR9TPcuySSUsh6/+Mmq3CdYffPUDQqxuLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752627366; c=relaxed/simple;
	bh=EmmzgkVB7k8qEfWpf38+xKgwFpjcfTTpniiW5vyi0bg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CCxATX+PBcYtOpIrbkfGCeYFzyOpE9+6sXmzUcBJ4n1/hos983w7pTmj87653/Cym1wqwlcctel9EVm2YiX5TUbQ+2VvN4NOZEYtzaUtrtBPdL6nsl+jlpcvRs2eAEuV/32qgZ3DmF5im2fypCXVeX+jLypJ0NW2ByiiHco6Um0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKhGuJ4J; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKhGuJ4J"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73e65c09828so125482a34.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 17:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752627364; x=1753232164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQCsspFtp3aJ1IuBIDFYtYNze/nuPurknN4UsanwySM=;
        b=PKhGuJ4JqfKXiiTYyaPXZ8ITpOmVdJRbKKpeUMhJvmvcHaP8LOn2EtE9WwaeghDWqm
         ZR1sL556Ks8yz/ILIXmNExe630Prq2n7PN4zmp+iQPpbFRmZeOOB+tDLwrEFgjIKjBtH
         fHOFTOhaR6W1eTyy2mlzPgMeDWXhpgGCtInRISXcGFTQZZK16WdeZZuWALDuQWgl8IMe
         aBwauygyxT5JCfmTLpMrdIyHRK36HgZzdPWsAAHB3JaUQYaFB4DBquCgKggLRPjMr50k
         q509LGedU36POkkViJYYRz22zCffS5ZXYOaTDMXYPa9GhKLL8f27O2o46A6V4idly+lj
         g0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752627364; x=1753232164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQCsspFtp3aJ1IuBIDFYtYNze/nuPurknN4UsanwySM=;
        b=D0wvdM5jnFqvaVqyZGMdzKnIWeN3LkZA+X9IY6Sby6gHb0hl7p/vOwT1ULqljOJ9lx
         te3MGKt3199WcMZyCsRd9LrRjuUXtu9UpFNnRemwUVnNTiETBLPFxy/SjAMHXcRsAsdc
         oQbwXyATCwGWeBmxvyL7LcDUJEwLvkHj1Ub8Q56VxKK3u6YqoKJL44iRqgzQPD7a1izX
         Wgu8OB4+Pri4jm6uoqQ0NUMtqZT5011U4MaQTqKmnzF0qQkIrMbn9/yPBo8c17wumo09
         ixSYqiz7uhH3V38g5Vqt/o1hVMMVyPJ2n6dV1UqFYHPs9jvQyoWsNAZZWaABan5Hw3wV
         EqKA==
X-Forwarded-Encrypted: i=1; AJvYcCX5F99635rM1OxjC+b6BEhQXbttX/6VmU1X/j9brVzj3yntBsYz7jHb3MsltqO2w2uL7LFFV9RIyNpqFlpW@lists.linux.dev
X-Gm-Message-State: AOJu0YwX/qF8Sz2XfnKnFH95fOoboG4EHWJ/05P1+m0RI86EJhoVn8E6
	MMo4W06qJBz2+pc7dznhe7CN0NoND6WVMLKvvnrc5/DncaqwSu73FF/4
X-Gm-Gg: ASbGncvn9qH1tCOyGe39iZt19Jegb3gWSk840WqCXIZ8qjY46DlmmSIdt3V5NS36uJI
	IHSl2Fz6Gi//pUfALXRk21FncM5K8JGQgKkSDQWQCmshDa+tf98zg3ZDm0D4YpgVRbh3r/GqsRY
	c4bv1V6ca5N9fgYSgjhiBfvJKKdmnbtRjljdQ8ycUgm5JyL9RphQPF537VT26Fy+haBTXkAWo36
	GieMjzXqRS3PTgT4X4MtVunASzXfZ7872wMFpmlWZ1i9wQU2xDkzGAuCCRGEenhSOCwB2vpSsd8
	BXIHNJ3xjiZH4ZANFQ5c++vSVNAoiQcTPLODUj4Y7QjZm32p3GY8LnyhcUHWAxnMMdq3QBYog7I
	sB5lYqcY28amKWaaCs43yr51hmMYLqFaVwlgh6q50mLoibFKhKar7
X-Google-Smtp-Source: AGHT+IETyTSobPkwH83OPqixRGjz/UNSynFtFOv06uXpLjjGXOB10TZv1bKbTzz/6C7be2D1OpRT/g==
X-Received: by 2002:a05:6830:f8a:b0:72b:9d2d:804 with SMTP id 46e09a7af769-73e64b4d42bmr1189795a34.26.1752627364117;
        Tue, 15 Jul 2025 17:56:04 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e56024edasm1035047a34.34.2025.07.15.17.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:56:03 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH 3/3] staging: sm750fb: Fix CamelCase variable naming
Date: Tue, 15 Jul 2025 20:55:53 -0400
Message-Id: <20250716005553.52369-4-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716005553.52369-1-ignacio.pena87@gmail.com>
References: <20250716005553.52369-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable 'Bpp' to 'bpp' to fix checkpatch.pl warnings about
CamelCase variable names. Use lowercase naming convention for
local variables.
---
 drivers/staging/sm750fb/sm750.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index a896227ef..f36ad8324 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
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

