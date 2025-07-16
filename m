Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76941D90DD
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752688266; cv=none; b=dOHcazBp/+dAmHyVIWzrurXpEM+uYUQwR/3xt8go57vBH09TpcYCvlCugQm01bHr29gFBJmvKtz5PCuyRDlkfJafw1gItQ+UC+5VOXn+w9S/DMnZ5auWIfD1E3dq5Rwcatb1IFcS2t88/jz0QrnFE8vcSHba3eM0uS7DxgnVgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752688266; c=relaxed/simple;
	bh=OrM8fXnPivq9Sra9C0UVe65losTKv7eATzo9n8JU/O8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pn2f7825B6kjT5PP4A2rSZPSyDViBMu37pv9i8tTq/9nO5PB82HowGzJ1CT42E6gj+LS65M6GJMxfe3YNjHK/syWtu9Qe6wtI5AXZIQHKYQtWyWll3OlX3qPkT/TesNAC7t3uN1+tP0sKZtIkTeq0hnGZ8v511V/227rhtWV21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRr0Aq/c; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRr0Aq/c"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-73e650f3c31so34273a34.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752688263; x=1753293063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hP0JkKnymLbal5NIT3RzZGlvG+uRcuppiT/rv5YrFIo=;
        b=BRr0Aq/cxRvVFa6KTMtglp9l4E9bUay0f9sQAtyFZNnLdbPDATfC+Uq+HyLKGyBpW2
         saxuYSFh/oea4P/i46LmalLnr5uNmEQ8Rt6jDUIDhUrnudEuEoIaIkhd/blDfwtXIy/w
         A8bDlWnQuhhWGB2K0fL3niGnuhmMWkJ1q9TZr+jYUbfr98RALhLyg2vOkByXU+vFsXFD
         lKurCyDbu0iUUMIvCS4NHclVYvEe+Ju57BEqgz/cIGZuh/cB3d0biTPbWK/WOChWTVuw
         pRplN789i/RVDaXf/15fjbGTxmU2kkXiFkNP5D6zNtsHhWacxlloBnA2eWl7Cj8yXMNA
         gteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752688263; x=1753293063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP0JkKnymLbal5NIT3RzZGlvG+uRcuppiT/rv5YrFIo=;
        b=f7/aPPk55rhsDQ4MKDVqour9yDLlRnOanzaDO87psYmAB1W/Qh8/CFv2yDaEuiZfNm
         ES8exl+wAFY88Cw7Ehq+r546PqhnFicy7UuaYrgy8VzFPZOHZlCB82EY8fw+Y+YwfDVC
         fvz1dn8QBiUrXVaj0dTMkS4zKNas8GrIG0LCxT0h2XkjQU2lXa7j/JUJqRX4pVygqxFc
         u/yopKqFphfTlNBta8hFoJO1ms3gnnk29CHtmpSaNuF3wX5SqJuNKGeN/ycslvDtn44U
         lYYoURxLenNW19JJnsW30kkQHzn1eF40expmXNRZ9xMSuonCG1McVgUJ/19eGZCJhOZY
         9yvw==
X-Forwarded-Encrypted: i=1; AJvYcCUylcCQ5cOXMnekm0dDJ0/W8yVofkAL+/7/84ZLmdEcf0YB/iaiGgE9DZ7itvZ5eEve8g6kiQueEvSUgYmx@lists.linux.dev
X-Gm-Message-State: AOJu0YzmSxK7tTLmrgo4tFd11w8aj747F2ccfnOQVmDxt7Gr9RS9Kt8c
	Sx8HBbOL3YNX+y52QP2834wO6say4VSvBAVRpJlLm38KqOpWDIx7lIqR
X-Gm-Gg: ASbGncu1+jOohHUcoCr2l/4SicJiyH6Du8swl2Jqx47SrpGjWgPn0oa4vWgu9h7RPuq
	5JJyvx1owMSWPbS4V2f5RETw4LuisaaN326IgAHK9rfxaW4wemIlyMzDAuhj18uXI0fQYbL0d44
	mSdbaYpCvGKA226uUh29V1sRYSjB7oyEbJN3v0GUf+mYuwaka/Qw8JkjwIrF/SxNaR/+70FBSbx
	JJGXF+7gi/DD6lvDH8KGY0SYgS2IYsPM7JIJtMgCLVW0SB5Yc+vyyEQ4ODoVY/vD34L76TpauxI
	Hsc5Sk4/sNJAkg1Lvai5+Cni8crNcnFKriSyHN38TqCX2X9NqD7iwKdbVapbKjzrxnodjFdG0WO
	OMnywX6+PMkaN3J20v46Iz/U3LE1yRvnsgRnzUFFiLDkuWQvQWJvc
X-Google-Smtp-Source: AGHT+IHotZrkYrFbMmkGJtK3KK2zt7eX4fjc/e2aLC8vPsF0/rHC/D0V8BJ5AZjM1E5RhzxkV30flw==
X-Received: by 2002:a05:6871:5409:b0:29e:766d:e969 with SMTP id 586e51a60fabf-2ffaf29a5damr3446428fac.10.1752688263572;
        Wed, 16 Jul 2025 10:51:03 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff11686ad2sm3626680fac.28.2025.07.16.10.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:51:03 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@linaro.org,
	Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v5] staging: sm750fb: fix CamelCase variable naming
Date: Wed, 16 Jul 2025 13:51:00 -0400
Message-Id: <20250716175100.81482-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Replace CamelCase variable 'Bpp' with lowercase 'bpp' to fix
checkpatch warnings about improper variable naming convention.

Note: This patch depends on the alignment fix patch that was already
accepted into staging-testing.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
Changes in v5:
- Resend as standalone patch since patch 1/2 was already accepted
- Fixed date to 2024 instead of 2025

Changes in v4:
- Fixed patch corruption issue by removing duplicate variable declaration

Changes in v3:
- Removed the const declaration patch as g_fbmode is modified at runtime
- Split only into alignment and naming fixes

 drivers/staging/sm750fb/sm750.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index ac3a4d5eae9d..039e6875c894 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -161,7 +161,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
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
@@ -273,7 +273,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 
 	sm750_dev->accel.de_imageblit(&sm750_dev->accel,
 				      image->data, image->width >> 3, 0,
-				      base, pitch, Bpp,
+				      base, pitch, bpp,
 				      image->dx, image->dy,
 				      image->width, image->height,
 				      fgcol, bgcol, HW_ROP2_COPY);
-- 
2.39.5
