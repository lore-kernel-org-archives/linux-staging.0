Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2B279358
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 03:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637095; cv=none; b=Ruel4EnNPIMNsZVNt/cV2kbl7p/py2Xe3a1RWwPwRTs+aS11LGdQufyV57nrG09eiMJ3ZqwaFe8f/OjcvT/EyKvtj3mhh9mUzqoR3d28WVPTpuAlqyMGDKG+yOcYqcT/eMn9HO/pgvBmfdxjqkc5OXmnysvYn6//OXXzFxQNIyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637095; c=relaxed/simple;
	bh=m4veNJrjCLTKvu1iSBXId7E1tBvXo4OimoJ/Mueem9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ct5aCx9s//vHe0aM3J6tVfCbbZ1aTNOpDKx4euAy0tg/Re3t3Nle5MKlxU3peoMtSnSvoDHvP1sBeNKs2A2m3a5OLZ6OxWv5fsrv54Emgv/7Uc115/hcYbZxIxsD4blgELI8yJf6xca9F+rxECCk+/e6D6uDgYZ0UuVaUNoWxgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me8VvN2Q; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me8VvN2Q"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-40a55314d06so1876838b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 20:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752637092; x=1753241892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV0AnC79VI6gCrCB07gTOb5HX2nG6iuSm2nLX9idpbI=;
        b=Me8VvN2QftAWKcqfB8vB0vxbZlhjs1IKlcxzAIGku4qoSpZuf+aUwokrYDHTZCwd8R
         efgW9HC1U+gYC5vOBGEYiPw7NWELh/WLz+RmnocXZyJWdq4cy27rmrGBAicJSfPNVfnK
         cuZXBu9xxlRY1fbcIbGv6y8eXtwj/Ov4G00IZiStMAOPqnYCLiIs/3zBGzYAvpKiEuZj
         1D7zalQJssUyBVEZ1A+akXmDDfMW3i9ZkEeMThrZInHmUrept7ePt/4TyIrmjol188SJ
         ZTIKGw+l0mS63R3qt7QwKjYLNWvQfb/XxQnHWPKopymar/rZonq8c0jy93xkZ+vIrdSy
         96Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752637092; x=1753241892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xV0AnC79VI6gCrCB07gTOb5HX2nG6iuSm2nLX9idpbI=;
        b=f6S7jScOECnyF8zxidTA+MlLyKEbPHNoWe2zanLp+xsTX4W9aAjz4wdZX0UScnQsWQ
         0W/jpykWk6G3xN64I+edwi+n7W33zZMbrwWcK6iMgu6bigCyrahh1/tTcAZP+B7Ykgas
         Qbwg9b70CmxMHnqTnYY+Qvl1SvX93v5J0G22qpDaKWgArjFc2ktifz8xfE50Dlq/QWSl
         debGQsRg2J2dseEgOK4PdbZ2gn5JrKtaVh4FMXQZ0tP8A7sD+oyjza1Q5uSfM66+7Lxw
         eAuPiIbWsYJUPF2ee9kzPSfocxFb4TVssJJrGbe+z+Qczw1E5JQHR0dMtOVH6VdOjtpv
         HiRA==
X-Gm-Message-State: AOJu0Yy4FMtBRSvZUvy8/E/8pHMco7Yrtw6XAyBzuLhCGWdLrK77hHqG
	3YMopzYHJlE/R90b57+lOmkQnSw1SHlpEai/Z5kvPYZGHRXwnOFWQH9bjo34pBhr
X-Gm-Gg: ASbGncsY+ONYV2iye8NbPY+AffUddgpHQ6hELol4WUDYnvuCokvIaJ+np1PDVrXLgSb
	1aZ/A4eHjNwoS6HCZFCTBo7NWRtmYJw6VmPovWxDFg1NHWhyzW3hDMKQpAsuZXcgPDDI7MITgQS
	hdUWnqHldo05NBiL+/aJEq2xN9HWWTKgSYFcSERVkss57yxLspGn3TI2826t4RkdmLYz0ZScS4V
	qUQ/z3V5wV8R8z2dKP5+gyofIakGNaTXCsdk3QZ31UKw8oSmrS7xTEg85saSs1gq5NrzjlBeQ28
	3wk/S8tKeoEGggLcBE2bl61jSSUs84DRBxYwznwkOZQiFahKfC+nwVVsPUtl4Vn27KqcjKzKEip
	xpAcm1nkWwNxvIPjPQ7iNIMTsP2qh/3PV0FdoC0JQKjcBtzUDTK3LcqRvIapt0Iw=
X-Google-Smtp-Source: AGHT+IEr5iLn9be4GrnFM45RjIpjgyYaTlcLT7ci1XZtjOeq/uRd1wyTTBOpNbesKlRS67XBqEwcrw==
X-Received: by 2002:a05:6870:304a:b0:2fe:f4f4:8501 with SMTP id 586e51a60fabf-2ffaf4dd538mr1364166fac.22.1752637092573;
        Tue, 15 Jul 2025 20:38:12 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116d22easm3140980fac.33.2025.07.15.20.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 20:38:12 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH v2 3/3] staging: sm750fb: Fix CamelCase variable naming
Date: Tue, 15 Jul 2025 23:38:04 -0400
Message-Id: <20250716033804.59650-4-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716033804.59650-1-ignacio.pena87@gmail.com>
References: <20250716033804.59650-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename variable 'Bpp' to 'bpp' to fix checkpatch.pl warnings about
CamelCase variable names. Use lowercase naming convention for
local variables.

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
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

