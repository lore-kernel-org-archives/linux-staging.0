Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3BD20C00C
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644045; cv=none; b=qfL1IP7FywpUo45YD7+J3AGcMBiN9zCWYSZZ3xipI8vBE1f+Vdtpj9F9mBuQr3RKzgF9Xr6Q9A86vJoRuvL9A+BIVyqcuOY5myblG5bMJop25j4ATFHv/EZRUaHOh7mHN4iyUSfF6Tw+HxSOCp5d4qLHf/z/DoGlvQ6xgj0vW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644045; c=relaxed/simple;
	bh=b/4jnK7wBCumwLbQfLBj7/XTNYkNE0d7MMEpOcHfxtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GoifKk/RRSTArYdhYb//nWCvSxORcY3DXBnTX/mtbsbIgE+yDSxXzg+7ZQyACdLkhaqSuJVRs2ZdA/F0oQpGgfY8kDUrCyaoanpuxrC3xGHzFsWix6swNg2u3ODrRFXm+ML2xIiXxrpDbb11KhG1viCrp6mozhVdxJIQLjRbICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxYZhOTu; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxYZhOTu"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-41b4bf6ead9so1113019b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 22:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752644043; x=1753248843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtVAs0dckty3rF9uFcThORweDhh8/fwqpb41aaKhbks=;
        b=YxYZhOTuLJawUJqFKRV9X8uqIWtnDi+Vp1VzHDWZCPvj5tBVrGUzUBkymmbtqrNzxZ
         iQLXSTv1KWqNog9THurVD65Pk8u0hYtKCipwNikGpTMu8osl0WfVE+Ug1x+5rkh+CKRg
         hGi0jYDjq7LDZr1AMl+YgVsrEBI9LRqMs7e7sNY4rsO64Wqwv3nczJ2GZlfvFEL+WWWC
         T239epjCdYGLNBE9FgB8iTR3CUj3rmcJXfroq2qWeGerihQBoej6b+WAMrEmfyd57QcD
         MdCevEKOkMyeOkpBe9uIdqcgFPVQiDfHoKqjspJ5XxX0BES192qjTTOceO60vrnKYrna
         z25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752644043; x=1753248843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtVAs0dckty3rF9uFcThORweDhh8/fwqpb41aaKhbks=;
        b=xDEvNEPbT1saiKADf9rHAzqwTw+PoAO5vcGsh6bCdnNS0JgQeLzG3fF2lOev7UeOuq
         KcAs4639lwtc8Ff+sEtdISVQW5H4BxOELNad1u99ZZIfFLRpweb+Nqi4DajiVJ69qZky
         sWFs0vQnCWa+6Z+1lMQ007jKinVFLzQC6i4Gw17fPcAAXlt/oBvwYGen8TN73yNyjKQU
         hWhCLzm31nhpLL3V7XNeTwjrttHQIEyabN5UOxe9GmSAHTobNfs12N1GfbwQ2hch2Jph
         qHzcx4SigEnFR+kDSlHYgneNnkT+ToDPVDq5zMee9hGtjmbjm9qAAa0cnivFLU9rL/75
         0UQw==
X-Forwarded-Encrypted: i=1; AJvYcCUdl/fINHvd+D5e+S+AZFPD5rWk/Q812SWloYs79G6exjKJx6IGmRd434Z4YTGKQL5t2Fj4IKCpGUBYxSBN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7LYy7vK+zf4QtHBy3csInMSSzIpVdmPozA5x7MuoPMhhD+P0n
	ryB+uwQSilIr1e3h+UC0W5hPqZZrlNO6ZUFu4RlSMJX6WFtnQemWhkrV
X-Gm-Gg: ASbGncvZ8wWbwKflzplCKYhuCWc68TLMvlYghxsZLHF7x457z+BvUEb0uadGwsuN3K6
	UHNIJusrnSHQ7RYuqg2wZxFp3JIpenyGdzePJ7wkVoOnAf0UyvhYQdCb77HyM+j00mGxAZJRQnr
	lMxxnySHPuZKBY7SngVaco+OYO8FyOzRE/gwSDyfWlx3wjlOk2sl+A5J/oFSypZMmADIuA6nnhY
	1GoX/8jSWkPYNUBd85PXlPTqsQDJMy64RSkbcRW8b1yuDsLvZ0XDmd8wbqw0ND4gGpYL38V/wQ5
	D4LVimfIdEPpKQacKptUP/vWdMNZyUMIUY0/TUm4hhGcOG8gD/z6RJCia9fr5RwAqZulaMGnzyt
	cTWMCOqCkjvcqsmoL9xlDRdpBeu+vIXswhVgn49UnZeL4jxt/FDcp
X-Google-Smtp-Source: AGHT+IGQeWUtcX4ONb5+oo1zJNydqczAFN9t20DW1rCwQcnbWKUbkfn5+jG1r+xJ4gt/kHGNfqDCEQ==
X-Received: by 2002:a05:6808:50a4:b0:405:6b13:ca55 with SMTP id 5614622812f47-41d05c3ca63mr1063722b6e.37.1752644043054;
        Tue, 15 Jul 2025 22:34:03 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff8ede965fsm1264461fac.40.2025.07.15.22.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 22:34:02 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@linaro.org,
	Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v3 2/2] staging: sm750fb: fix CamelCase variable naming
Date: Wed, 16 Jul 2025 01:33:57 -0400
Message-Id: <20250716053357.64711-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716053357.64711-1-ignacio.pena87@gmail.com>
References: <20250716053357.64711-1-ignacio.pena87@gmail.com>
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

Changes in v3:
- Removed the const declaration patch as g_fbmode is modified at runtime
- Split only into alignment and naming fixes

 drivers/staging/sm750fb/sm750.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index def456abc123..789abc123def 100644
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
@@ -175,10 +175,10 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	 */
 	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
-	color = (Bpp == 1) ? region->color :
+	color = (bpp == 1) ? region->color :
 		((u32 *)info->pseudo_palette)[region->color];
 	rop = (region->rop != ROP_COPY) ? HW_ROP2_XOR : HW_ROP2_COPY;
 
@@ -191,7 +191,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	spin_lock(&sm750_dev->slock);
 
 	sm750_dev->accel.de_fillrect(&sm750_dev->accel,
-				     base, pitch, Bpp,
+				     base, pitch, bpp,
 				     region->dx, region->dy,
 				     region->width, region->height,
 				     color, rop);
@@ -203,7 +203,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 {
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
-	unsigned int base, pitch, Bpp;
+	unsigned int base, pitch, bpp;
 
 	par = info->par;
 	sm750_dev = par->dev;
@@ -214,7 +214,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 	 */
 	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
 	/*
 	 * If not use spin_lock, system will die if user load driver
@@ -226,7 +226,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 
 	sm750_dev->accel.de_copyarea(&sm750_dev->accel,
 				     base, pitch, region->sx, region->sy,
-				     base, pitch, Bpp, region->dx, region->dy,
+				     base, pitch, bpp, region->dx, region->dy,
 				     region->width, region->height,
 				     HW_ROP2_COPY);
 	spin_unlock(&sm750_dev->slock);
@@ -235,7 +235,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
 	unsigned int base, pitch, Bpp;
+	unsigned int base, pitch, bpp;
 	unsigned int fgcol, bgcol;
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
@@ -248,7 +248,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
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
2.39.3
