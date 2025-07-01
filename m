Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A1F27C875
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388374; cv=none; b=n7R0F9B0yB3bSCRR3u2pNVaoEqfjimwAkpUXFbHs6KDovRrLZh1O4yM66x2qEPTSSrrsIzbePwu0XE2Pw4A3vkeStsvAAaQvJt1/ANp4l/6cXM50eAZfaTX0Vo6RoUDQ6AGsuaUhzYifflZrKjYJEco1FCGUBkX9Fpfnn1TwdOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388374; c=relaxed/simple;
	bh=76wvwIqknZHK203y8r9Dza148N2nvEhXSSczeKFN11c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tk56JaWts9FN4uSPLpaQuba0ROcVdat96SOU959cRK1CSCsSZJe/LS90lb8ZWxmxGH0Jm2ZpU9Zm6Gq1/w5zNRZ8Gt9aPVFP6Lhteilsns2GiyhhvZDVc7Yzpf05YEXT/yCAaRrkact/3hi+azAYEjCdnsSn55bPTrafc0z8sYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8r4Y9W1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8r4Y9W1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235f9e87f78so35154875ad.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751388372; x=1751993172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88Hysw7tfEWlpEWhG5IHKz75tKeJyeimvESHZHy/1Ic=;
        b=W8r4Y9W1ROK4QwL3sPtQPPSeCbqyyJ1EgBPg9cH8a76C6i+gQnmJHkVy8Yj0nUXK0w
         FOlQKvEmd3pjKEWltG34gi71n+Ck90OXrPQ+otaVAcU27rGPd96ct3IiSlJTN7q3VuhA
         tw1oVMb4oRcA0Y89Cd9R7R3YIP1lNNYntqLuiNGGzZaDLc5JLIb6Zm3ZPqmv8mIVhwh1
         +lRfSzUnG5g3FL1lxsnUfTlQcGvvjQXVVIQoG1UokD4G5hw2ZJq281FLW1S4aWhr5gx7
         iCQlRxKJwqb0wynZ/W5108xWZItsaUVzS7UfNkPoxC2D42vru5Qbyjq0olZBrlKGGFVR
         TCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388372; x=1751993172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88Hysw7tfEWlpEWhG5IHKz75tKeJyeimvESHZHy/1Ic=;
        b=YRY7qVyduOGLitDiTe2YdQllIP4OqoSa4/207Do6UQ42+UcgXyu9G6QBOmMEDOLKoK
         EEkJIuJP0/CU/pEEnCZejJvtsJPfmrqMr1+9FHIxBSIdZDpuAu4fv/gk+DL0lm0hY/U8
         aXiYF/9gjqtMNvs2b1zxdZuc6qLpJ5LVZ1q5YlDAvHfxOiPF7iOzN5fwAy9/SyRjfhyB
         PYFbE9fsWbZeu/JIWgK3aCNEAq4Z9YuTHMCC71dYlJ6Tw+wYZNgMj4kSvLqHBTqSBSjm
         xf0A6I8r61HxP3BELoqZy0p09B54t4lDVxprs9ctQZSpJLT8JVwpZNBvJ+JMKdRxKJZ6
         JV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6tGeE2eqsn1znOfrSeuTw7lzitk9bKzBAdWcFDVveTQaN3MXPu1ruI42OyfXfIfJcHY+BLHZVM7c8bDE/@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb3uO3sz+yanwU8y34DcwamWBKNiF0YfQr2nEO7JDZv8XXGhmk
	dYDwMhNtiSFKNcvLAai/3WOEkYA+Fl/y/TFh/QAL3ly9fNOYRPCZPV0M
X-Gm-Gg: ASbGncsCCCvwGt92mfyIrqu7AvkZDxcoqzg5OiNhGY2oR4HWDM281BTPdwdqI76Xa/U
	dQs5NmOvMQ66Vo5aNhd/imWLVwC3BzN9MQZbQr5RpfC+WW/A7btcNmsub5ej1fqwwLgONuheRry
	q0IA/XBX8Q2WpdQ+s7iYI5d6ImWMl71Gp4cVyBt2FLUn+cvChaHtVScwKM2bzMZlfha/3gO6eQO
	NGQbTk2/5Tboe7SyQnwG/Pg1Z/CdaizzMs4wOk4ig7MBvQwQ/VlQvbY/pjLpjonbWyThaCfLbz9
	EY0SQ5gBAUfqtP5N2npLa9w8VF3AdgwssFpCBq4Qqqvd+U8V+f7f6nAXvpCJyACCXaPgxhVOmhQ
	OiQ==
X-Google-Smtp-Source: AGHT+IHZt0VfzJMOgeHLYEftDnYkqQIleGj42Y9oD2BZX1/zzbgD2ktrtUJsRLvt9haEWURtwL3Kfg==
X-Received: by 2002:a17:902:e849:b0:235:a9b:21e0 with SMTP id d9443c01a7336-23ac19a8a29mr306652055ad.0.1751388372372;
        Tue, 01 Jul 2025 09:46:12 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb3d11b4sm111050085ad.254.2025.07.01.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:46:11 -0700 (PDT)
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
Subject: [PATCH v5] staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()
Date: Tue,  1 Jul 2025 22:15:36 +0530
Message-ID: <20250701164537.243282-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
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
plain kzalloc() for txbuf allocation. Also remove the duplicate call to
fb_deferred_io_cleanup().

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v4->v5:
- Rebased on staging-testing, removing the duplicate call to
  fb_deferred_io_cleanup() and updating commit message.

I'm not sure if this needs a Fixes tag. If yes, please add this line
Fixes: 505bffe21233 ("staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()")
Because after that commit, there are two calls to
fb_deferred_io_cleanup() on error path causing a potential double free.


v3->v4:
- Added Reviewed-by tags

v2->v3: 
- Remove the if check before kfree of txbuf.buf, because it is zero
  initialized on allocation, and kfree is NULL aware.

Newly added in v2


 drivers/staging/fbtft/fbtft-core.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index d920164e7710..9e7b84071174 100644
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
@@ -694,13 +694,10 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 cleanup_deferred:
 	fb_deferred_io_cleanup(info);
+release_screen_buffer:
+	vfree(info->screen_buffer);
 release_framebuf:
-	fb_deferred_io_cleanup(info);
 	framebuffer_release(info);
-
-alloc_fail:
-	vfree(vmem);
-
 	return NULL;
 }
 EXPORT_SYMBOL(fbtft_framebuffer_alloc);
@@ -713,6 +710,9 @@ EXPORT_SYMBOL(fbtft_framebuffer_alloc);
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

