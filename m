Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361021C165
	for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 04:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086786; cv=none; b=DFpzfw8CqH/h4wx0vbwcE9fw+abzLHv1w0LcUfjItP5bXdiw54nlnlSXr0rq0n8DtwJwpR2DEtfk3szkVdz5UDcLSDysyNm7BsLXOtzJwuq5fTqkYM+RilsI+Vh9L4TvfJrW/zJsqX40ei53CdMG+qeU7NmMFYsUVIBR487Lpqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086786; c=relaxed/simple;
	bh=3AtvpzDjfslHPDxlxx8QNEQnI1HnDgZjUZovpUJ1MOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBkDGYeHcCWDlUdnj2ZzBQBxVIkLD2a9jiyInNA6Y8TLsbDDGCTvUGTVTrBV0yZ+0jDsnontWDwFTI8kKmafLb0l7zsdGda2C5WG0ekfcyC5Nm/+euEoiI2LwsYd9jbsbAi1J7vSVpgqJF8+bvBdBv/ShT1H4d/QB4ISWeBKgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7MTP2i6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7MTP2i6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso173013a91.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 21:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751086784; x=1751691584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6KFydMvKM3jMgYcZFX5+YrAej6q1x9tbL+4kgM9zm0=;
        b=V7MTP2i6HTp+UWJihz8GF/fYqoJuGfweOjLt4TB35Sw8jkwNQ4u/LlQ81sGzcvNBmT
         OXXB0o0ryYs7kKIsp/XdOV7YvSwfxQN/srE3/hiOMJJjXm+UBgydtJhJaMSYFvHSuG6r
         0m7wDtxGoytL4nTOoDcgJV7fLAbwZfDtj7FcJLrcVAMSPdBl7dlGhYU8T8f4uBlYHyh/
         IjtH5yQugeQictiIPsvGa89Ll2zJQQW3kRsxtNlNocARxUNEoOsSviRaUiS3TyJCdulK
         Ev7rHbmoMPIQZ0sdnxiDfp+iC2P76MKx37VIeg3xblPJeUCwD7MMDaoDQk5bIbTtfSe9
         Danw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086784; x=1751691584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6KFydMvKM3jMgYcZFX5+YrAej6q1x9tbL+4kgM9zm0=;
        b=pVoNdTRcDOCl3bujj0id8w6O85XWoF9O42zGIqvbuwL1GsXgwi0rKSurinzJOYGMtI
         FQazUcHOtBTU00otrFa3YFDERpTO0WJ5QJoOQNletKbI6l4bdeIluZpdQV1AVI/Jf8cK
         3lREsbCi9KzQZnT0UbBBaZvU6Do/Tnw6slgi/A94As1ONYRFIxAvVa3RUhT7l3tcoKE9
         SJwkeELVydzOtO1lJmp5G0o8lVWyJX2BwPfRFfkvqlVPPB4y3M7nT6uIPTJN3x+ASDzR
         kMctIWpxajAsxyySd1TCqgpRDnh6pu8kGov6SMapKJddI1QeCFpQojuIYpQtxcQQ/5CY
         gKPg==
X-Forwarded-Encrypted: i=1; AJvYcCVLNwG6uVnZyV0C35eH9DBh2lxo1zJ+OCUPAoBgvIMu0CZ2GdJjdrnAS4HmYeuM9YaKbqZUQRaJjz9SZved@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi+B5yEQM2vSusGRasdPk1vAOKKvMg1GqkwRrNHWd6LgpvZbqU
	OpwbD44d4S3Zqg+toMJoq3BVMBHqJ1ug5cqAnspaUCkYHbIeV5/wP+YM
X-Gm-Gg: ASbGncvXfEajZNANJ5oVtkjvxvO2dBb3/hRwgfwFlfq4/oTHvcZc7MhTGcPymNi0FRH
	9cuunT+4ezHKRjm/qpAIKvTS5eGU+wy/YsfQsBZhdCibNKgTMyu/gzOZUInmKwOaDnKgRTrvhyE
	MR687YRzK/ncFKZ49SQKrNLantnVPBSZAjFJb175apdEwsSofLvALMP7DyNtFNxFgg828KQRWq+
	ZRN9x3XNq3Z4kgCe7beCBziqoFsDR5YkWOhj6yciesfib2TILTGSilmQSWZefRFo4XdqaFkOzUl
	NTRP/thsQSEmriF0ePDo8Voyt+NiShi98uT+cqm7JE+/z3PJsDWO2FCDgRR4PU0+fyGpGV+LD9l
	x4DusOzrBInxC
X-Google-Smtp-Source: AGHT+IHa+w+z2zouG9On8VvcTYwX0uju2SQmEjN08Q4IjPHgE02aAZdf8HosYP7aHwVRvq+HXQ+62g==
X-Received: by 2002:a17:90b:582d:b0:312:f650:c795 with SMTP id 98e67ed59e1d1-318c923b91bmr6942314a91.21.1751086784526;
        Fri, 27 Jun 2025 21:59:44 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-318c13a271asm3659713a91.17.2025.06.27.21.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 21:59:44 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de,
	riyandhiman14@gmail.com,
	willy@infradead.org,
	notro@tronnes.org,
	thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/2] staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()
Date: Sat, 28 Jun 2025 10:29:07 +0530
Message-ID: <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751086324.git.abdun.nihaal@gmail.com>
References: <cover.1751086324.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error handling in fbtft_framebuffer_alloc() mixes managed allocation
and plain allocation, and performs error handling in an order different
from the order in fbtft_framebuffer_release().

Fix them by moving vmem allocation closer to where it is used, and using
plain kzalloc() for txbuf allocation.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
Newly added in v2

 drivers/staging/fbtft/fbtft-core.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8538b6bab6a5..f6a147cf0717 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -568,18 +568,13 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		height = display->height;
 	}
 
-	vmem_size = display->width * display->height * bpp / 8;
-	vmem = vzalloc(vmem_size);
-	if (!vmem)
-		goto alloc_fail;
-
 	fbdefio = devm_kzalloc(dev, sizeof(struct fb_deferred_io), GFP_KERNEL);
 	if (!fbdefio)
-		goto alloc_fail;
+		return NULL;
 
 	buf = devm_kzalloc(dev, 128, GFP_KERNEL);
 	if (!buf)
-		goto alloc_fail;
+		return NULL;
 
 	if (display->gamma_num && display->gamma_len) {
 		gamma_curves = devm_kcalloc(dev,
@@ -588,12 +583,17 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 					    sizeof(gamma_curves[0]),
 					    GFP_KERNEL);
 		if (!gamma_curves)
-			goto alloc_fail;
+			return NULL;
 	}
 
 	info = framebuffer_alloc(sizeof(struct fbtft_par), dev);
 	if (!info)
-		goto alloc_fail;
+		return NULL;
+
+	vmem_size = display->width * display->height * bpp / 8;
+	vmem = vzalloc(vmem_size);
+	if (!vmem)
+		goto release_framebuf;
 
 	info->screen_buffer = vmem;
 	info->fbops = &fbtft_ops;
@@ -613,7 +613,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
 	if (fb_deferred_io_init(info))
-		goto release_framebuf;
+		goto release_screen_buffer;
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
@@ -668,7 +668,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 #endif
 
 	if (txbuflen > 0) {
-		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
+		txbuf = kzalloc(txbuflen, GFP_KERNEL);
 		if (!txbuf)
 			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
@@ -694,12 +694,10 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 cleanup_deferred:
 	fb_deferred_io_cleanup(info);
+release_screen_buffer:
+	vfree(info->screen_buffer);
 release_framebuf:
 	framebuffer_release(info);
-
-alloc_fail:
-	vfree(vmem);
-
 	return NULL;
 }
 EXPORT_SYMBOL(fbtft_framebuffer_alloc);
@@ -712,6 +710,10 @@ EXPORT_SYMBOL(fbtft_framebuffer_alloc);
  */
 void fbtft_framebuffer_release(struct fb_info *info)
 {
+	struct fbtft_par *par = info->par;
+
+	if (par->txbuf.len > 0)
+		kfree(par->txbuf.buf);
 	fb_deferred_io_cleanup(info);
 	vfree(info->screen_buffer);
 	framebuffer_release(info);
-- 
2.43.0

