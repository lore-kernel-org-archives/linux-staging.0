Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B026A0B3
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354420; cv=none; b=DvdU6S+Zsn5JtTjmGWQtXJ4c28IR08ZiQkkHXk78RoiV6gLoszQO5l2s+YoQ1Kvm1z2/f79pyS+5rSvqfAyVpBn3ckYn0laTYIaeCCxNlrzg6yUGxOsuhK/hPvoi0v/jXaZwwY1xwHTmb4VgQDjNuITnPxuifXzbOKm8OAgNBHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354420; c=relaxed/simple;
	bh=Tknhp7etPYm0nFHjJ4hG5r6ADArSuOu7zTH+gboPamw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tCMKz3Pe3mPK47F0eFCFajsWIC9NAmxKWCOi7cveX3qdR79/tQiYINU3rDLId9E63+4ka+U8dpubhcKY5uMZcMlRvwjGnnklyLWumENvi4wH8Mj0WWJBwn/0Z1yt+fZF8vQTEAxpAStGAjloEGjP1xLeDrDryIyd7xEdfTKU9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBgXrhNj; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBgXrhNj"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b3220c39cffso925811a12.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 03:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753354418; x=1753959218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GiVGo6WrTbyzr1LDaIIUbkcnMnGG+Ed2yLDLSxUCvKk=;
        b=SBgXrhNjUD2jMBfk6CKpgfPWSsuaI6ZxH+/MPrvo0a5YeCLf5MJ2v3q3aw8RCjAeiO
         qNv4QeEVvErukcg84yOcArMtJLmVHr8VR0BMlco966Xd+ptMe8opd9DSHD3zUn3KcC9g
         deCN9ETY9v+QrTF1kmbOS6qvNy0v4GHkFsJQz7kRNEpb95r8bKmIZSbO54oNIbfnkwby
         l0YmeBG/z43+cz7UuqVLpHuInGCbjtABY5bOXBknj4tFKRYBHJT8egdihffzsl611LBT
         TN2e4vhyIg0UjhQE4l3WdN0m1sf1N+9Kev1rePQ2l10rYdRGP6tE06GYsAJBDl5jCcvg
         6YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354418; x=1753959218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiVGo6WrTbyzr1LDaIIUbkcnMnGG+Ed2yLDLSxUCvKk=;
        b=Nr10Rtzp0ywnM7azha0NeH4jMSQ8ygW2HC/hIp6WVFIEMMniXM/r9g3dYAWEMOO9Ao
         AjYaGAw0qsd7db01PmY+R2dK5NB8W3qy4K0B8deFlVW1nPtBACof9g0Bum1oj240/RHA
         w8tSugq8esZDfuypX/He/cV6bG5Ch6CVVpOYdRZ8e2cZGPVxpVujxLOwxDpM9Irr+145
         V+OM/2DkKyfLL2yHd3Z8pw8bJt9JvCVyblPGzTGnft5akiK+QtCAUnVlsnjtt3AhkCwQ
         MtvLP3ctWgoXsy/ro3xc3+Mfd8pJuCQtPBpnIBXApn3Tc/mf9z0rGAvCzL+z57eaXL+L
         dC8g==
X-Gm-Message-State: AOJu0YwEn0lsJ3httmFmGqhR51HTFcGoZQZIAQR0+qIuLEnSSatV/1Jg
	XyVK7imUVFJpROZFI9aa3VkSvweiOgRgwbHU8abTE2MhdJfLw3viJ8mG
X-Gm-Gg: ASbGncss+qsHzd0yYrwpLnrYcqEfVLYUbIwjtwCKVUiePX9enIEMqLH9v+M+3A1piFf
	uVosPMXbgfinO0967fpgtaxX7j2LN7GACb4lTJ2ijfGhsh7Nrv2xU4BtdGXSoxi90gXnhrwBmwv
	9Ng6cxWWpQ5OHdck5+PLZa4tr1iae1ypVtSt0pGkgu7ffctkcNJsA/bZNNSPsCYKNmAMrDwcAzT
	q8t6dxZgDgx85o9FYpwTitdDUR1gij0HIi5H81xk1M+HrpVmTWReuQB2thYH2Ksxj2esIwf2KHf
	t8rd0YIjWiaZy3ZyIaieu7FP5IfMB1ru8j1/hIrM3MvgU8s0bhZ3JQcafaiIHtgaUPV59P8SrFG
	fn4dmY8GgjkuGPszgJOLOh5aVdSIDkV2Xm0wunpkqTZW7BOwxsg==
X-Google-Smtp-Source: AGHT+IEDvLkch4Zgu8rPt919rhZOgH5TfZIeXUeAZKMyLZZgb+itbWw5nMGp/pzx1vJ6nTDXuGapfQ==
X-Received: by 2002:a17:90b:280e:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-31e5073683emr10512710a91.12.1753354417583;
        Thu, 24 Jul 2025 03:53:37 -0700 (PDT)
Received: from samiksha-Latitude-E6440.. ([106.213.81.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6639f93esm1108066a91.39.2025.07.24.03.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 03:53:37 -0700 (PDT)
From: samiksha.palav27@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	shdwcodr <samiksha.palav27@gmail.com>
Subject: [PATCH] staging: sm750fb: Add hardware acceleration for 16bpp imageblit
Date: Thu, 24 Jul 2025 16:22:08 +0530
Message-ID: <20250724105254.3926-2-samiksha.palav27@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: shdwcodr <samiksha.palav27@gmail.com>

This is my first kernel patch, as mentioned in my kernel introduction.
I'm starting out with drivers/staging, and this patch targets the
sm750fb driver.

Previously, all image depths other than 1 fell back to cfb_imageblit().
This patch adds support for hardware-accelerated blitting for 16bpp
images using sm750_hw_imageblit().

The fallback path for other depths remains unchanged, with a TODO
comment in place for future enhancements.

Signed-off-by: shdwcodr <samiksha.palav27@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 53 +++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca399c..e65b747fbfd0 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,12 +121,12 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
+					 fbcursor->image.width,
 					fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
-				       fbcursor->image.dx - info->var.xoffset,
+					fbcursor->image.dx - info->var.xoffset,
 				       fbcursor->image.dy - info->var.yoffset);
 
 	if (fbcursor->set & FB_CUR_SETCMAP) {
@@ -249,10 +249,51 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	pitch = info->fix.line_length;
 	Bpp = info->var.bits_per_pixel >> 3;
 
-	/* TODO: Implement hardware acceleration for image->depth > 1 */
-	if (image->depth != 1) {
-		cfb_imageblit(info, image);
-		return;
+	static void write_pixel(struct fb_info *info, int x, int y, u32 color)
+
+	{
+		u32 location;
+		u8 *fb_ptr = (u8 *)info->screen_base;
+
+		location = (y * info->fix.line_length) + (x * (info->var.bits_per_pixel / 8));
+
+		if (info->var.bits_per_pixel == 16) {
+			u16 c = ((color >> 8) & 0xF800) |
+				((color >> 5) & 0x07E0) |
+				((color >> 3) & 0x001F); // Convert 24-bit RGB to RGB565
+			*((u16 *)(fb_ptr + location)) = c;
+		} else if (info->var.bits_per_pixel == 32) {
+			*((u32 *)(fb_ptr + location)) = color;
+		}
+	}
+
+	void sm750fb_imageblit(struct fb_info *info, const struct fb_image *image)
+
+	{
+		/*
+		 * TODO: Add hardware-accelerated support for more image depths
+		 * Currently only 16-bit (RGB565) images are handled in fast path.
+		 */
+		if (image->depth != 16) {
+			cfb_imageblit(info, image);
+			return;
+		}
+
+		/* Accelerated rendering for 16-bit (RGB565) images */
+		const u16 *src = (const u16 *)image->data;
+
+		u32 fg_color = ((image->fg_color & 0xF800) << 8) |
+			       ((image->fg_color & 0x07E0) << 5) |
+			       ((image->fg_color & 0x001F) << 3); // RGB565 → RGB888
+
+		for (int j = 0; j < image->height; j++) {
+			for (int i = 0; i < image->width; i++) {
+				u16 pixel = src[j * image->width + i];
+
+				if (pixel) // Draw only non-zero (foreground) pixels
+					write_pixel(info, image->dx + i, image->dy + j, fg_color);
+			}
+		}
 	}
 
 	if (info->fix.visual == FB_VISUAL_TRUECOLOR ||
-- 
2.43.0

