Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39F726D4D0
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362883; cv=none; b=uabMtxeHBM8mWGnufpQDSXp2uKMfD53aZ1+PSbAICY+V2qqj6rDhfv9ctGvfGKzILWIEe8WapT8FNQodoG6QSQXg8p9h/56kzzvgjToVFjkrFXQ453GR5dOYOo+rO5BIyrOiqRu3PPd4F6V4YlR2OmZzFP5SIJ8l7O2dsdG4R6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362883; c=relaxed/simple;
	bh=FaxaoUeulagyOhU2b4Z3SKWcM6w9W2nx/IlkDhnCqXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aF9yhY3NxNV12fYVZG3VIZrtkVJKCunrhWAL/cfv0Owr3CgWCiSDt9TRbCy7sMU4unKAnQVK/uhd68QWS/ClFGub8jB+pNRR21IIECkQ+KRWnN3G/YvlsrghuYuqB5Oo1iIwR3LazaqNc0CCmBWXpSKXPuCVkMAbGDNGqs0okdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAtjC2Qm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAtjC2Qm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7490acf57b9so2279425b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751362881; x=1751967681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PnEDkQYSGlej4tjD/bQ1dPRo4xaWxnAEWg0UHJoseU=;
        b=ZAtjC2QmQAtmPtXfwICdhCj2cmy9zHXIA/tVczDTMjr+YImBR0TB9X6teT5LwkuQFv
         peOK69bv3knaKxxaiNtQ6/49Dr1GiscUqQigestuWH7oDPWILACMff0FrB0a7aLJDVyb
         kdKaobM+q/CWdoE0d1/XNgYjlkybKRFqqWdA3IsV6S5oNEtGF3W5UkSx2xeF2LC5BoUt
         RToYuEJscRORDqspDHb3F3yPXiskyrFJJZ1pbnzRfqb8fLmNAWWgidso6DsBJRzAN9vc
         sKmkOmyWbny0sp/ACPMKMMPoZoI+qK1TTyvQTq5TBBdWeBCK77gBjeQJmatweMAFwaZC
         zwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362881; x=1751967681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PnEDkQYSGlej4tjD/bQ1dPRo4xaWxnAEWg0UHJoseU=;
        b=rhjVnXuepaLAS6lVAF1U6zDsjOdhzNPdHclDJbeV3lDvm4bNi54RC/D1BmWrlPXWJN
         ikQQSyDQuqS1aB4bdu/E++7KJTQA3PtES323145C3OXhVn5uzC8+4A6jplP7oZQpgAMR
         ROghmCibWGau82Ya63ZBTYZNJvpLW75pVSD76L8Vt82fSb0qSVlvytP28wQGsQ4TxDHo
         XwAaPNqRMII9ndHWhd5FA7S7HeqEtGe1M/LeH+KffO264+39ysqlg4vPx2GF0ig5hNfy
         VhuxiVAbBC9hut0b2wfE1ccEkBNBbPJQJnnZoSXsmZHomk1yVfXpjV01/sEyjEdJMYXB
         Ba+w==
X-Forwarded-Encrypted: i=1; AJvYcCW+5vOvOMarS8GQSBNYsQgl75YFqgd3a//ppTsIywwYXEfg+Os4y93G/sVP8MI80F3LOhYFfU3018tg4I+U@lists.linux.dev
X-Gm-Message-State: AOJu0YxZoze++6tvYmPCMs8byIFINNX1qYN9IfTNbi1GUHZBIZWpLTXC
	qCPqg0dWdw8H3Nh7w334v9RbtCJVsgzxJ0C4qngWwjPAE5uqMnMLbJBA
X-Gm-Gg: ASbGncuJ6R0Yo/x8bN3gUoWHfXzLvWoo55Yb3ndF102LBWZxxlXNDiBYFYdRNbstmNZ
	TXxvZq1i4UNfPMTU2HH6F1RG6adaAC66GefPhbMC0BZC1gj4pIe0WuWX6/Of2zRi01DqQMwXOhv
	E+qUc8OQbupGsu5R/2K97tV8frO95As88knQhHCKu3mA2xgYhz+XrtCoBdYoFstemwbC39z9SxL
	yLk2MyTPWzYsSOGl03IJLmV1hWqOWf4sDc52UZ3vWN9RZewqOlyYbY+SZxOuxTgB1BSToQ/rGLK
	yGmIBMpkT+kF33JEYzja1zNYVYTJF4qx+l0P5ZcUZRl554eYpY6E2lZzteuuiWHcJxFc9IC/XJ+
	t9w==
X-Google-Smtp-Source: AGHT+IEbeQc69MS0gQNp4/0czRTMPM7cTE3egdA7+5pA0TfD6EU6FUYVk5lBMVTPZAs3gk2+USbR3A==
X-Received: by 2002:a05:6a00:2302:b0:748:1bac:ad5f with SMTP id d2e1a72fcca58-74af6f22722mr22370210b3a.12.1751362880881;
        Tue, 01 Jul 2025 02:41:20 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af57e7279sm10945766b3a.150.2025.07.01.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:41:20 -0700 (PDT)
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
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/2] staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()
Date: Tue,  1 Jul 2025 15:10:23 +0530
Message-ID: <b0b55510097245e4f96663123130f197c01dca4d.1751361715.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751361715.git.abdun.nihaal@gmail.com>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3->v4:
- Added Reviewed-by tags

v2->v3: 
- Remove the if check before kfree of txbuf.buf, because it is zero
  initialized on allocation, and kfree is NULL aware.

Newly added in v2

 drivers/staging/fbtft/fbtft-core.c | 31 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8538b6bab6a5..9e7b84071174 100644
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
@@ -712,6 +710,9 @@ EXPORT_SYMBOL(fbtft_framebuffer_alloc);
  */
 void fbtft_framebuffer_release(struct fb_info *info)
 {
+	struct fbtft_par *par = info->par;
+
+	kfree(par->txbuf.buf);
 	fb_deferred_io_cleanup(info);
 	vfree(info->screen_buffer);
 	framebuffer_release(info);
-- 
2.43.0

