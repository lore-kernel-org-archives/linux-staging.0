Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA2E3C3C00
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585611; cv=none; b=XrXpgL0+N9fWDIsgdkY2HywXGK8NogMycwjgFlrB2X08jUHzEx5QKb8PWazLJHIhU9ZP6wawYDkjvgkANE1gI/R9DaY0tJDcbktQxE7tptDenra3SWEchGvg73b9X3M2MN+MRMGihh+H6YmZSYas+gh9famz5qgy5pUSf04VaHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585611; c=relaxed/simple;
	bh=oV5trSatd2lnbsbgX/P/vC/Kfmo1mxbnyMoUebtCz1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PuZmUF8OeKwiB7RlpeRWEVNUzrIDGlhrdE0v2eGz3fXRStLZarYqndEYwwSCDZVHyJiLuN3RYO7BJPihjW5qpl2sVWBr7iQY2kly8JjKZ5mLi8IuA4D9wTNqN58eSnujCjgfOF5F/jzTGSM/TllLq0Yd7hdIvzj3BeJVWROdp1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meM57hN/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meM57hN/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b9705613ddso33294165ad.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 04:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778585609; x=1779190409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6u7C+42zkCS/N/7M4vn74eaOM1O2j7PPPzqiyejc6HA=;
        b=meM57hN/i18/rhsdAEDLZkFrq9tAmcQXtrq6sB/0Q2kpPrfRydsmaaRFzJfd7dhpsm
         HQEtnrinze93NB76AygsYSEZ2YibZvJhXW9G8LiGh3FRhKwf1P3XbMa9Yf6makwCOYDd
         5A4UvYfvrdiL6WhQo3lLcx9Vxo1+4UF6/ROoqj9ZBRSieY31XLlirtjJ+kAkqjkcCnql
         8WAoPycBddYo+MU4oKNGmUBjd+2LbrjAQoPEWHTmVh2ll7geXYJpOHHCcYWsRGfu7XMT
         yje/d2NiyosIG5zO1Y1amWZfykVWl+Y/s0dPLqdazWQmDzPy9ykhTmpiCsHrOH6qRK+c
         dV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778585609; x=1779190409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u7C+42zkCS/N/7M4vn74eaOM1O2j7PPPzqiyejc6HA=;
        b=py3Fh7y2LEwgUY1Z+GUYkrb+qfKpG9Yba9/dEP1YTvaXyJ1u2aVogmtJqm8oojfSV8
         bPFEC8lJp5HSSFR62qG1rVMLpNFuGy3yMwLqMuwSE1vPAewCiCcQ6VIV7phLm2sN5Gmw
         yva0cpqfggPHRCPL0ZQtCj8dHG52ZC7Xz7nGQvGmXj9YuWjQ0+Txr/jdhm/il9f9LNLD
         owv/jo6HCpdBZrwDqN3Fosj0Pd31Wma8CQQnAzrwrPC10RaSeuFMq9eCMZwRp9cmnTJ7
         y/dRlGwsVTOooBR0dTjHqTrsg5gsfgYuW9FWGvUlMaHHSi4MzH6KqFGpna3WEOeYIUIC
         wYbg==
X-Forwarded-Encrypted: i=1; AFNElJ+7NOn4IIJY7a3wii+tbvsvxiGhR/C1U92NN+qhSTFhgB+To6PuFQFEUpv6SvtzBp1VzTdHvaT3qvAzLnYv@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg2Wdrv3FSyPOp/TOIHhpmvgkbhv7ZYKVIO+gr9WMI0Gp1M3la
	d26nNnx/ybtbgmR/ABBk3S4goA6a8A3Mv25TObQbCC9GyoOuLgcRZdxH
X-Gm-Gg: Acq92OGGKufGabL7bn80TESNfM1+15vuJNSG54qxDbUty2FfwYmFNXgOpMalqb83tvA
	F7bFn99pnj3lyBOY0L/EmXBJEUPCYxSZc6+P+R8HBmE+fFTqgR4G59zYyBUgHQ1HqDwSUY/tWaO
	14mRsmjys2AmcIBvJPU/+b3g1vV3Fjufqtxp7qvTdGZT5zGOo2iPD7nf2yoh4q1D4/5lpKp301L
	IKfHhKP0EEdwArGxjW7g4rjGPdUZjPqcvAjB+xces2kqWqQtHK9O9TBtCknDh5WAn6rOlRR2eMk
	XqetQ0OqGgwSuasPra79dmdiWe06oYakAmNrCEcjPw7oc1e+VmeCyg1MD5jNic1e7v756r8sHzV
	+QxxTyqjDxfk3sVVZ9U6vghbDlR5YjHSRSpG3vx+o1Ezf7HKTyCkHsjHDliiiqwIGDglMi6r5LX
	xtK/p01VLsny6MOrz2JQ+k5D+dwAtHuwfDgi8+HFq/
X-Received: by 2002:a17:903:1ab0:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2ba798c0a22mr259852635ad.24.1778585608644;
        Tue, 12 May 2026 04:33:28 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.135.229.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm136279535ad.28.2026.05.12.04.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:33:28 -0700 (PDT)
From: Harshit Shaw <shawharshit116@gmail.com>
To: andriy.shevchenko@intel.com
Cc: gregkh@linuxfoundation.org,
	error27@gmail.com,
	deller@gmx.de,
	chintanlike@gmail.com,
	tzimmermann@suse.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Harshit Shaw <shawharshit116@gmail.com>
Subject: [PATCH] staging: fbtft: convert sysfs attributes to use ATTRIBUTE_GROUPS
Date: Tue, 12 May 2026 11:33:20 +0000
Message-ID: <20260512113320.2548-1-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace direct device_create_file() calls with the correct
ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
driver structure so the driver core automatically adds and removes
the sysfs attributes when a device is bound or unbound.

Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c  |  3 -
 drivers/staging/fbtft/fbtft-sysfs.c | 86 +++++++++++------------------
 drivers/staging/fbtft/fbtft.h       |  2 +
 drivers/staging/fbtft/internal.h    |  3 +-
 4 files changed, 35 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 3da42c8ca6e3..e6d33127cecc 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -782,8 +782,6 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (ret < 0)
 		goto reg_fail;
 
-	fbtft_sysfs_init(par);
-
 	if (par->txbuf.buf && par->txbuf.len >= 1024)
 		sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len >> 10);
 	if (spi)
@@ -826,7 +824,6 @@ int fbtft_unregister_framebuffer(struct fb_info *fb_info)
 
 	if (par->fbtftops.unregister_backlight)
 		par->fbtftops.unregister_backlight(par);
-	fbtft_sysfs_exit(par);
 	unregister_framebuffer(fb_info);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index d05599d80011..416172533e33 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -142,37 +142,6 @@ static ssize_t show_gamma_curve(struct device *device,
 	return sprintf_gamma(par, par->gamma.curves, buf);
 }
 
-static struct device_attribute gamma_device_attrs[] = {
-	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
-};
-
-void fbtft_expand_debug_value(unsigned long *debug)
-{
-	switch (*debug & 0x7) {
-	case 1:
-		*debug |= DEBUG_LEVEL_1;
-		break;
-	case 2:
-		*debug |= DEBUG_LEVEL_2;
-		break;
-	case 3:
-		*debug |= DEBUG_LEVEL_3;
-		break;
-	case 4:
-		*debug |= DEBUG_LEVEL_4;
-		break;
-	case 5:
-		*debug |= DEBUG_LEVEL_5;
-		break;
-	case 6:
-		*debug |= DEBUG_LEVEL_6;
-		break;
-	case 7:
-		*debug = 0xFFFFFFFF;
-		break;
-	}
-}
-
 static ssize_t store_debug(struct device *device,
 			   struct device_attribute *attr,
 			   const char *buf, size_t count)
@@ -198,31 +167,40 @@ static ssize_t show_debug(struct device *device,
 	return sysfs_emit(buf, "%lu\n", par->debug);
 }
 
-static struct device_attribute debug_device_attr =
-	__ATTR(debug, 0660, show_debug, store_debug);
-
-void fbtft_sysfs_init(struct fbtft_par *par)
+void fbtft_expand_debug_value(unsigned long *debug)
 {
-	struct device *dev;
-
-	dev = dev_of_fbinfo(par->info);
-	if (!dev)
-		return;
-
-	device_create_file(dev, &debug_device_attr);
-	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(dev, &gamma_device_attrs[0]);
+	switch (*debug & 0x7) {
+	case 1:
+		*debug |= DEBUG_LEVEL_1;
+		break;
+	case 2:
+		*debug |= DEBUG_LEVEL_2;
+		break;
+	case 3:
+		*debug |= DEBUG_LEVEL_3;
+		break;
+	case 4:
+		*debug |= DEBUG_LEVEL_4;
+		break;
+	case 5:
+		*debug |= DEBUG_LEVEL_5;
+		break;
+	case 6:
+		*debug |= DEBUG_LEVEL_6;
+		break;
+	case 7:
+		*debug = 0xFFFFFFFF;
+		break;
+	}
 }
 
-void fbtft_sysfs_exit(struct fbtft_par *par)
-{
-	struct device *dev;
+static DEVICE_ATTR_RW(debug);
+static DEVICE_ATTR_RW(gamma);
 
-	dev = dev_of_fbinfo(par->info);
-	if (!dev)
-		return;
+static struct attribute *fbtft_attrs[] = {
+	&dev_attr_debug.attr,
+	&dev_attr_gamma.attr,
+	NULL,
+};
 
-	device_remove_file(dev, &debug_device_attr);
-	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(dev, &gamma_device_attrs[0]);
-}
+ATTRIBUTE_GROUPS(fbtft);
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 317be17b95c1..ab71db017d05 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -299,6 +299,7 @@ static struct spi_driver fbtft_driver_spi_driver = {				\
 	.driver = {								\
 		.name = _name,							\
 		.of_match_table = dt_ids,					\
+		.dev_groups = fbtft_groups,					\
 	},									\
 	.id_table = _spi_ids,							\
 	.probe = fbtft_driver_probe_spi,					\
@@ -328,6 +329,7 @@ static struct platform_driver fbtft_driver_platform_driver = {             \
 		.name   = _name,                                           \
 		.owner  = THIS_MODULE,                                     \
 		.of_match_table = dt_ids,                                  \
+		.dev_groups = fbtft_groups,                                \
 	},                                                                 \
 	.probe  = fbtft_driver_probe_pdev,                                 \
 	.remove = fbtft_driver_remove_pdev,				   \
diff --git a/drivers/staging/fbtft/internal.h b/drivers/staging/fbtft/internal.h
index ae2ff4a4a472..39fd1e167b41 100644
--- a/drivers/staging/fbtft/internal.h
+++ b/drivers/staging/fbtft/internal.h
@@ -4,8 +4,7 @@
 #ifndef __LINUX_FBTFT_INTERNAL_H
 #define __LINUX_FBTFT_INTERNAL_H
 
-void fbtft_sysfs_init(struct fbtft_par *par);
-void fbtft_sysfs_exit(struct fbtft_par *par);
+extern const struct attribute_group *fbtft_groups[];
 void fbtft_expand_debug_value(unsigned long *debug);
 int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
 			  const char *str, int size);
-- 
2.53.0

