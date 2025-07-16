Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413D13D53B
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752689844; cv=none; b=aSEuxSGLhxoUiDYfFg7hMZGLdDYvmsM9K70GNOruS8UhtHkh2u56y3K/9qwje1bqsz3cJAwvg/WTkwF+TO2gdKf8wQ9PLNUN6MR3JoJNm8x1TB7JXZLh4wXqEGdrqunhbPGMWfkloudVahgzI/yjNkC0U9p3y7XHIzGHgK86TLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752689844; c=relaxed/simple;
	bh=2HV/UsAWELOre60rKsa0k3uq4v2ptiEhm06ZDWJruvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Neuo5tzf0CWnR1ya/ZhNKXduZoAOa9FQykmgH/n/tFsBeGhIu9L9XM0cDGVIA2iiwuRjPEVRWHYglHWLL8vyycaE+1q7lidoIJZKsNMdnfQypC7X+yL78lJt65OgoZGfQK4k/+N71lUQDP1MrPrX2qlqbgTc/qGdHQYnzPtdQh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4ZLnN5F; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4ZLnN5F"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-41bebd9dd8dso59642b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752689842; x=1753294642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KROH5PyzZED6z6wUyANbUILh7zMbfzKYPY5DhVgAhKc=;
        b=K4ZLnN5FkbaoT6dhrFwR/eKc6Q7yfuGYOMdgMZP4BfSQVndlcs9Ip7A9Sbc/jTsCx2
         MnSl0yIB2oFwXTcRAgDbU+g8bOjdaoWs5A/SLTQQLAxVveP15RGp1uiRDLjDbinPMWGU
         AhrgJR2e0+kGziz8nGh+onRSrEobWN/Gx1UF8tzr+DaHNug1r/f31rWZe/GqQJ8IRrJN
         EcsMaLZWek31m/qwMH14Aw/pZMR5Q2mfg1DVNdEU/LY9/618ocmdnhe2OcrJH8NNHvkb
         2K7Lteejwrw0rPXqiPDfPFjSCbiernghJq/QOUp2Obh/KJQqHFnyrkoWl4IgopaEQ+ZR
         D7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752689842; x=1753294642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KROH5PyzZED6z6wUyANbUILh7zMbfzKYPY5DhVgAhKc=;
        b=efiELneuBw1+9bcAzHb4XD5PbDkPoSbg548A+jYV+ymt6zmO6fAeVbYLADfdV0oAkT
         GKrLrHBo9Xi2xzLWZSWmHHO4ubIuONJrdkSPuh5rE8UTs+ZWZCYR696sDj+2gSdIrAcO
         wMPIWgCBPVBKqWpVnUzHph21CDG9D4y2W2ATprcm9uX/Hkho09gqGBOxAyFLAEHsL9FX
         lmse+8hxUuVp+FGit2jF4/hSp3BCTrNVELGt7gfgum14nemoAly4no6U+hyAqmatvui8
         gFmShU5vDxPhcgW2/ALcuCogXXbHtWHMAQYZ17+2HXyRGSxf+tuvpDFkUnfP5rDBlUrp
         Yubw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ81WRVmCl5Ss4vlLwo5M9+fm7HTSVM9WTp88vUsdmG0TvPRmIRomPDw5t4jFvKjOg5wgR2KOnRbj+sSQn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3cPva3RVfcyA5mZOYLXxALu0PkJODgyQyThIlOy4y0tmUXdqb
	mnw6igFxgW9Yan/qnulhEKhj6D3N2d262CvDXDsh/ZdSR586F9e07Mjq9HbYI/vo
X-Gm-Gg: ASbGnctbWYUmnnx8QmpkB8uFCU1iwKd4WyiRfabClZCbI5D/U9TcRtVeJZZ+WktLf9A
	aBWpx9iaIaJne7HR19ccSY6hC0bTqzI89YaTlxtkbBIBIk/x+EUZrs0YUigmiXlICFD1xk1dafK
	WQ9ux5ZnI/LwrAPcO5+D73g59xB/pqx5Tl7J/eXE0LqsqWE22TvmTXbVqYUVEeF0Nqks76cifSU
	xjq/+cz28rVpu//StjVanHqW+wmADeCrTdLrFigP9VfCMSOdB5/4aImrzNAeDgEGzQ3dSb4z38b
	fZVo9JmVSo1HcgA1BtU+i6jKoipVEMVJJIWHGfScVgG36US9iDbS6BZ2x4nJQYM/Nk9GE3CA72B
	6O4CsfHK9F+EN99bNgfz2Xp/BToAjWme56P/IUwbP/y4KD+n8pt4T
X-Google-Smtp-Source: AGHT+IG8LYRE4UW7KuQZI+nttrso5ws1H4e1Mh/a9Mff0bivhqLqurjDEmVdru2XoYuC5AiaNrDP0Q==
X-Received: by 2002:a05:6808:4f0c:b0:40b:3530:98bb with SMTP id 5614622812f47-41d033f48a4mr3231913b6e.9.1752689841795;
        Wed, 16 Jul 2025 11:17:21 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41c07419f3asm1185872b6e.45.2025.07.16.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:17:21 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@linaro.org,
	Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v6] staging: sm750fb: fix CamelCase variable naming
Date: Wed, 16 Jul 2025 14:17:18 -0400
Message-Id: <20250716181718.82227-1-ignacio.pena87@gmail.com>
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

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
Changes in v6:
- Removed unnecessary note about dependency from commit message

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
