Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DB22F74A
	for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208087; cv=none; b=mG2XqmcAQsPDs0QMyxZlnbwlMq5Jqs5VPynCrn2tsCbrigQtu1eE1Gf1PFblnprAScj4JhQyBW/TMuSGdKJrJ/9yEzbSBNoNIGlSmHOTR1VLxMUrJHJx1QiJlisYvlAc7WYv9360ip/B+FzGgc5haWeOrgfOqCthLfXXi0m/gPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208087; c=relaxed/simple;
	bh=4iptySoXMXJs2UzWlhwIPyIT0WKR/AuX6Cj72Rs0gYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXlPI2JHWmNvxMFM49VXF5KxCrIz6Hq7sYyVYvXS77CWFytkUIPAlzOwgDYTxFVWnxI5UhuMXx1mRHlfA2XzLl00mdDUJ9qXrDNPIUHrnQ17bw6CyZxdEiW1vVwn4vf5Q/9ohPMaN1AbJ1hfrBn4GQrARCfk7sP7RoMVhVdr2QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj6QkXqy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj6QkXqy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3910563b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751208085; x=1751812885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkH6WZ47tB33hOq1ktfgw4nXcDuqU5IvVV0uN0/lGcY=;
        b=Mj6QkXqyxzZ/1tfYDQp4yMsxO6jhOrOJdRFwvnFlXGFZeDuxug97/QS1MeyhkOlJzO
         3mXCO3qGXz8MOtWfAf7UPAM14TKZJYBOa09aw7BnopUCp9AAbKju5rJtfFUbA9oNVknv
         3yr4ckBmuCeN/cx+Kun3XSd3IUxGU3YUhrc+jxaBB3K95jzjWKfkQqr0PH2t82HusO1I
         XgIcuOf+wiB0R811JmpfcU2QxBgCLDkdn+0sK9oQn+sTjjB/r3H8jSlT28x1LBOkiPh5
         fhexLVtL4PCaK6Hxxogz9HQMer+T3YnAB6oPMzELl/iMAqXv4+Mq6rc98MHJmZ9RB9Pq
         DmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208085; x=1751812885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkH6WZ47tB33hOq1ktfgw4nXcDuqU5IvVV0uN0/lGcY=;
        b=VmyoWm8AY6J6TEd6ondVLvc44wYgWidOS2Rq4aamF08YbtZwZ+OlKarZtJIintN02j
         zpo49gEsP18QyFXF87n4orwKfgEbCeOyvu0jLUJ4Hhh1M1qiwSPX69jOkUzAVlsW7DCO
         g8cBS5hSRR0BnQEcqiA7N28qVVh0pb3nW2jq7VY1Rs6CBzdEcqRaZ2cy5wozPp7EfB+V
         YBQkzPUG0eu4uZDOMJ1U6SfazdOJUZhM45LbRfjsyBu9jR6kBQg+NL/VIIrtoxc1jCcV
         Ebwr/OgoCgep+3Pu1nV+LYZ9XmpWdTBLuUgOvf1PfTR6Gzc8c91aIgopI3FmC10yDlfX
         QRQA==
X-Forwarded-Encrypted: i=1; AJvYcCWScbLN50EeeYOllLi6zaiFiHJYmlSD9nzqFDCFjszbUX3WF5kokEvEr6kOXP7LoKK/MA5+RPhW6ZOfNAm5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0US+5zOHjrpSxQTHiLgxbcYVrOD1QjjHgqrsC3MkF+RCflyG+
	6rBPUBAaJ5p0peg8fDcK6tDQgVDLC4DdPJpojWpFqyp1OlrZBmQ5zWt6
X-Gm-Gg: ASbGncvbhgBQDQ0Nf8/T55lUTkwin86pJWDMMUCsx6HkRVM41ebja1BatVguw5A2V1c
	zPlwnHW+G4U/xxEpEI0S+ahG+q+siTgPvK8gS9x3DwjdWMOumXXM1lwjqaGtCMJz35r53YAlb6t
	OAbY6z/oRNIcwxZQefiWT3AljdhsvayOoMP7pq1aKsIPaKGdE85h1mZc61PYy0vY/r9B3nTOBer
	9nPuQ2GdVjVNPWg3cN8X73FQOQuVsDuZCtWJyguAWZF+kb8BD5v91Gl3nd+BOWu/ONRM2zRSPVA
	oS5qfEUyRJDaGjpGHoeoZq2Mxxo5ejWSA0KEzGXYdoAW9unkwLrhCwVSrEB/y+xYeHg6L+aS5w0
	oNQ==
X-Google-Smtp-Source: AGHT+IFBiKmBx9yH5kYGSYjeMY9rQSEBpTMve8iNeUO9mG9D8vqHt/VBUqvbXcqaLSd2ovKMv+M48A==
X-Received: by 2002:a05:6a00:2d07:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-74af6e6659bmr12804699b3a.10.1751208085209;
        Sun, 29 Jun 2025 07:41:25 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af55c7e89sm7039127b3a.109.2025.06.29.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:41:24 -0700 (PDT)
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
Subject: [PATCH v3 2/2] staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()
Date: Sun, 29 Jun 2025 20:10:11 +0530
Message-ID: <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751207100.git.abdun.nihaal@gmail.com>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
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

