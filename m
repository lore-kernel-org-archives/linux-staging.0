Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF5EC2
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665880; cv=none; b=TPGtufds07LVgWJAXZ2q4i08j3UEMEr0Rf0sdK7QD4q1PuqWJRQsUsGSQwjxD05qQM2pBjrYTqM95lmailCPh9DYyxYBM0bCMIewrWMPI8ItpwD3ruyVc9RoAh2EBIz0bMoW0cpNVHSEw7OzGWAW3k1B9NVGAq2XesrYjeSNQRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665880; c=relaxed/simple;
	bh=A2w7RJXAhqoRBWOQGaYfWo/GT4kUhEb6X9z3WsncHS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XY0zstARyD1v8m8G8suqI7X11rvjSjlKGjNf71go2xDNEJl/pC/bItzNm3GIEd1L2pXqFUkXohS1Lbti2KA4/EPD0XDociDA16/VJUEcG7KM64y0BZ5chYN0qYgVISx/kAk2fohEIhwH0zo4AsZnwA/i0bREbXaryXFDBGHHnVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqLvRo/K; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqLvRo/K"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73cddf31d10so3019091a34.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665878; x=1753270678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWoRRsfuFxqz+HuApf6zc8xTju1vm8BEJoWoZrivWw0=;
        b=JqLvRo/KnQNYUOS4B25n8FLNQYojE68Q75qSEGZ1kJpCDkLDlP/t/Fy6BJSVq5N5gZ
         j4MVo5J2t9Qkiu5UWpKedSQujFCzXMHd53e3fu4H2ikgS+8SdDzy2wcdH5X9DQ+Wc7JU
         GpvidwFFBOqmQLju9cKzDDCJwKsk6sb+iGgnTdV9fmQwM/PX64FQuMHpCEjaLrXo8YbB
         40H35MvoNwmIw8XVN2YsPWSiQje1FrzsQDZLOvtC0uzB1DTFMy2lNWRocP57Dnj9M6be
         r+ydrPDajxDDkqijqUyrfcQuE5wkJ1lLpxkYrMXibGO6cfBJtZxIea60IkkzwQpCgWp+
         C6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665878; x=1753270678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWoRRsfuFxqz+HuApf6zc8xTju1vm8BEJoWoZrivWw0=;
        b=dvWNHDuJm/bUI98LPPupORziKLfzb6Q5K7abl7qTn8MSqjld+kQ42PnsbQaBAYoELA
         kweogD5GXjVQCT873pZItZ6CnQQV6V7nA5pWurPV0L3kf5tfeht/sGluibXR1b80Pzt9
         ugMmYaEPASGSZ3HfJY0PD7mxD845ax1d+rMAcoX13gHR7fGT7SSd4nejfYOc55DrXyLT
         pASac7AHx/0is/F3Nkce0mngp2jyqzNad40VLsIoCPLpVL3KQ7bcXcCO9k7KeGoyEgKf
         +WmLkQ3nNxzUz5P0zcrI5cq9Nl2jGOOHwADfAZIIBo2rqWep17KOoU3g51K5KcoOXc+U
         juEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE7hDqILkB3OPW05UScVHECRL8PDm4qyrUmUV1zSBzX4jh8G2rqYVN34/iR7Wi4nO8tS1RbjI5QiLbaiwT@lists.linux.dev
X-Gm-Message-State: AOJu0YxqX3M+Q5IR25MKWmrLO0/BxP8SB0+2d8SW4gqjWiLim+xL2R+p
	Zw40EF156Ved/JafhL7lE+c56+sV7COoUwx/tMN/63vwUkrYff2MoVTiJ0ZSXLIY
X-Gm-Gg: ASbGncsSgM3m0oPVNWaUlA0Pfu1uOf3akUhS6e4/zZMJPmsB/TyGmb+wk3puhawN68g
	lb1obvIuUoTS3LFLUMKiOgpi207Y7U30nHEAxYoDhYmVjIqCf7Tv52h/5kOLG7cP/xZ7tzpqPPu
	vr6NcQakOCQ8LoECJ7JZURoQn7/5uI38xflnzRVcrEFCZZ6CrT29yVzDzs8sxs8RHaKlWNUF5y6
	o+sII+Abvtww4BboxPrbPNAw9GKh7sLiZth7nqWhnOvjWFo/w+3vm7+8tftrPjcg+FFGoZpPaUw
	OGhakQlAFBcExJXPqDkOf5Ol8bR7w2WqRrVP4u2/RCiXpaYG9qShMlQk5sHGqVTMOoOvy1uZc28
	eeG/XgQlF24LrsEZwBTH4yzP/usgkHl5FVjKv44iVQGq1+bWL8cvr
X-Google-Smtp-Source: AGHT+IGIoNL9P74VuYdr4g3HlLOko4BCrS3MGLk8nHnGwUs8CCAc2/bbMN9NC5/g1yaQbGy5+SVLtg==
X-Received: by 2002:a05:6830:7204:b0:739:f13a:6f41 with SMTP id 46e09a7af769-73e662c791dmr1429619a34.25.1752665878122;
        Wed, 16 Jul 2025 04:37:58 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e5fc7c942sm949307a34.31.2025.07.16.04.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:37:57 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@linaro.org,
	Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v4 2/2] staging: sm750fb: fix CamelCase variable naming
Date: Wed, 16 Jul 2025 07:37:55 -0400
Message-Id: <20250716113755.73068-1-ignacio.pena87@gmail.com>
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
