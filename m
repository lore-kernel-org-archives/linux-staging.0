Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7665A2DC323
	for <linux-staging@lists.linux.dev>; Tue,  9 Dec 2025 04:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254500; cv=none; b=aRf2ZJTx4GPR4owSrMVWUpMfFD2y8XVWIBq0kyPTbewDCOD26Sv1d7LVQ8v8AxxZbhqoDubP4nVfxDcrhu1vXCNwj0pSvLp4k7DQD92/hORsXVTAmNbmmnwoj5kNL+XbJPfECkxiq3EItpLg1O4dWjrv2ho7fn9+bCt2PrtUJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254500; c=relaxed/simple;
	bh=nshWNu78Q/XMh0LlE3oui168SyNeyp8mzorR1kZ8bsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lysyg7Ktbs5DwlTtCMP/rhmue5S7VdTqKhhWw9+4UQjroipAWXaD8IhNFtP6/cF4lXxEkMLoWOmil3euQzszpA8j396zvtpnXWxxw1zVhVP7Z46J+sOesOmZcD2f0PhlLp+Bw9tV2gIpgJorhNnJWjPqprzmh/UdE1748Ti4/98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLqbfIaz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLqbfIaz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so5599742a91.3
        for <linux-staging@lists.linux.dev>; Mon, 08 Dec 2025 20:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254499; x=1765859299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okmIi4vWYl0QHDsaJwQNy/3wmdsCyJzm0p/g7ebWdjU=;
        b=QLqbfIazE3l9dmnmDg3nSvv2+v6lKiOsJC3uesVN5nrXIGKcdSMyXTBkoBbYOr5CVK
         ihknfXHnHGu/zCQ4xGMyWboomke2rJx+XG+blh4mQBrcpjV5D0XcQUQYl/T4LP7Xddru
         invjzUCuY6GyGdyL6aLnXVfFOc6OSImieeW2Gy8INxvI5FbZypPI4F3gwpmGXOlUQr3P
         jDvyHk1J/SThdmOC1TXa8zWk0Pmp+Gi/ZX950L/76h7gIoxpKwdGWeYJ1WKi9gvj5LVP
         mAt8TWwQleaT2Bar6woi17Ny+EBjf6cy8lBD1++fBFSqg3OukrUzUC4Id5Iy+YkiBJPV
         GavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254499; x=1765859299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okmIi4vWYl0QHDsaJwQNy/3wmdsCyJzm0p/g7ebWdjU=;
        b=XVPNMK4lZ0Pk+nQyQHN1wpD1EYWZL6VEK3n/SXlKiA9ssUAxgsioZcwFTCjSc6qqIY
         l0ufK4gmI4F/+zgw/cfogwsiKE8wKG6OClkk1pvPqQX3hvConLtcenxIEPYxd3sDSSA9
         l4rTHCl0ahpcXJA3wQAuhdweEqph5aqVVAl0l5+acoxb9JYkJa+VViWYHbxlpe/jwuJP
         Zj1/2bvzfc9H7Pseh92nDKQ5jYnoLs7JRi9KQf5yCzCDyBRHjkal2Gp5Z8vwH8pQq2Aq
         iVI+5BtSY0uzGqQ0HycHyvZ1gCdnIYBG+xi91WgTOJSuJ7/s1ik2CB0yVBZjEpMdfk9L
         jJEg==
X-Forwarded-Encrypted: i=1; AJvYcCWYCKu3BNGe2WkxO9b7kxmjb4VXjsujn2RhIlLyf4eiiMtkKwyTMm1ReyblSfuaF4jLrIdUyT97hqlVAflq@lists.linux.dev
X-Gm-Message-State: AOJu0YwxgAJNInCEko6M1P79XXkDr/OJ8GKTXfZrwaztOPXkjZIBaiIi
	o0bA9hxhJ5OKZYIxRRugiJHWfpRkUrTQu7DwkFucDanKsJmUX+9G6xUq
X-Gm-Gg: ASbGncs9d/60z9EyjoVRGNAth4n1/whuhQ1wT1tNzNwRcTZU7fYxlXegZrtUV4G45cF
	gqcw4upPsZ9MPupQ7ScUwxV7r/5XOHhALyxxoUdaqussb7nog+f711dW9LRKltBhJCSi1PcdGKh
	Taij+2QBpmDqy5sZzmco95/2jUSOi8+lCuR8bLj7Zf3NmuiVkRmMjy489Ig8LKENjOEVmuk3RPb
	VGeol2sxGUqbOSvGXzQ87SXSMGEKIiPzbW2fjtwVdFr5VF2zedDKd6Puka8+YTuNuRuualVSSg6
	pUr8uVuxYHsFYe6Y0CKJw6aHKd0AK8/dGdc7hENl2v+d9XflCs0qBoLCJ0RG0+K83Mv3nkjgPWP
	L0CIXA2vtpmJaIyk5CM4WHZzxI6P0Atxj+IFa7iq4qrsDskuEQz4ikH3zw6/b9dFtWxVhvOcSBJ
	JET5kOyaXF2VMzgtC3EdzCZs4+1oXrtRJeGdK/b/slLHQ=
X-Google-Smtp-Source: AGHT+IH/sZjDstHQBk/4kkoOc4q4BWQ69NzeICX5PBywIS3oa9fbeB6YzchPZljjw9QmJ7GHpZIn7A==
X-Received: by 2002:a17:90b:1801:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-349a260ac22mr8426365a91.37.1765254498693;
        Mon, 08 Dec 2025 20:28:18 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:18 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 1/3] fbtft: Make sysfs and dev_*() logging conditional on FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:42 -0800
Message-ID: <20251209042744.7875-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
References: <20251209042744.7875-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fbtft core and sysfs implementation unconditionally dereference
fb_info->dev and register sysfs attributes. When FB_DEVICE=n, these
fields are unavailable, leading to build failures.

This patch wraps all sysfs attribute creation/removal and dev_dbg/dev_info
logging in #ifdef CONFIG_FB_DEVICE, with pr_*() fallbacks for the
non-FB_DEVICE case. This makes fbtft fully buildable when FB_DEVICE is
disabled.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c  | 20 ++++++++++++++++++--
 drivers/staging/fbtft/fbtft-sysfs.c |  8 ++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9e7b84071174..dc967bdeabe8 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,14 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
+#ifdef CONFIG_FB_DEVICE
 	dev_dbg(info->dev,
 		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
 		__func__, regno, red, green, blue, transp);
+#else
+	pr_debug("%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
+		 __func__, regno, red, green, blue, transp);
+#endif
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +396,11 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+#ifdef CONFIG_FB_DEVICE
+	dev_dbg(info->dev, "%s(blank=%d)\n", __func__, blank);
+#else
+	pr_debug("%s(blank=%d)\n", __func__, blank);
+#endif
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,6 +801,8 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
+
+#ifdef CONFIG_FB_DEVICE
 	dev_info(fb_info->dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
@@ -804,6 +814,12 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 		fb_info->bl_dev->props.power = BACKLIGHT_POWER_ON;
 		fb_info->bl_dev->ops->update_status(fb_info->bl_dev);
 	}
+#else
+	pr_info("%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
+#endif
 
 	return 0;
 
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a90..944f74f592d0 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -89,6 +89,7 @@ int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
 	return ret;
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t
 sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 {
@@ -145,6 +146,7 @@ static ssize_t show_gamma_curve(struct device *device,
 static struct device_attribute gamma_device_attrs[] = {
 	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
 };
+#endif
 
 void fbtft_expand_debug_value(unsigned long *debug)
 {
@@ -173,6 +175,7 @@ void fbtft_expand_debug_value(unsigned long *debug)
 	}
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t store_debug(struct device *device,
 			   struct device_attribute *attr,
 			   const char *buf, size_t count)
@@ -200,17 +203,22 @@ static ssize_t show_debug(struct device *device,
 
 static struct device_attribute debug_device_attr =
 	__ATTR(debug, 0660, show_debug, store_debug);
+#endif
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
+#ifdef CONFIG_FB_DEVICE
 	device_create_file(par->info->dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
 		device_create_file(par->info->dev, &gamma_device_attrs[0]);
+#endif
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
 {
+#ifdef CONFIG_FB_DEVICE
 	device_remove_file(par->info->dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
 		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
+#endif
 }
-- 
2.43.0

