Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89DB3E9C27
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662803; cv=none; b=jyyqKIlKhyYwNQ2JSdcrQx7AseFkm/SjkteI2AcBmyj43TvQJ/xctKgXlq7tOCws2PPXX66jF58mwyudvF7p2hMo8JNhD58i1XyJML1T0/0qSbKSJ6BIXKY1JkO+jzxGRwnM7qU/5TWynjGh8jwm9IIIjeXJg8gTYprenlbnQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662803; c=relaxed/simple;
	bh=v8Avp42kXMAsSvvR9Jc738A2v5Ntsr2lW6IyLYVX9tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/fCJ/3a+DElWjtn+EUBfgusVwHGjdwApLWzyDovlgw8opqZ40O6zTrnmQOOgEyHnJfwFF/xi5+Rns0MPiJhvwB33eA00xcfvKxfeCHOFYtBPLdDaEsOGujH04FY5b5jG/1vmad5w9r3eF3WV3UjqlrSxGYSBdnQ7ulEpT/A+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgVfNtEB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgVfNtEB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-834da62e52dso2870718b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778662801; x=1779267601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GabNSEuAYvaR9AKYGanWxt9kny3Yc8mvnIIULdwXh9E=;
        b=IgVfNtEBQflVjPNA++PKm7GgjL3OX0FJibJ+HuEP5ivhC3luyk/iD5ZxVg6Yv1RpHX
         u1gBtmwEGH6fFbsy9MzZDvAq33p0jSBkEKkwTOw2nnMk5jXAAsG67VMj4aMldUOrWXSB
         DUY5nCTuVoAGv/jgBBMTFntCBAVWX0aX1a3ZHf7YLNo2ZtfEs4sOn0FLC2XtruMvuRZe
         hpNx4OnBoiSNzwDG8X9tSdLdkDkY6wtevsfHAvla9KKEtVcOIeFp3KhDFhKF5ypFpSts
         oCoTGhuJ0XLsiB8KC8yS3WNpo5nGdVPJAbNQyCPKsvY3VFuR3+ROlOUDG2BGFSmQSU1g
         C+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778662801; x=1779267601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GabNSEuAYvaR9AKYGanWxt9kny3Yc8mvnIIULdwXh9E=;
        b=pVhXIBnbU1ZeS18tnvWpkyVZ+6wgMkuUD+1vajaXTHNWZ0OEZneTGhWPJ/xkE3wPyj
         irpqTkAPJliqOQTzBLFTT1QPS+eBo8Tb9CTFXU5kZVO5JDJPZpy6AgDQkLDY1q2u1Zm3
         NYUXYAME76zvhzJKJCWlKWhYeJV+1woCOtb0BV9yWNh0nUKsib6r/WSKMqBtR7X8nwVU
         GsITA5U/ztFBgidDdjI+HhDh0XBzMrEu4LaAh+NIVeqGIgXIcrbKT7vfQ4PzYchevgBn
         6ZygPXxEbjgHvFCPOSfwHLUoC/noWcAbL3Pi0OJRL2c2GQU0lZwttOock3VG1Q/rZdCe
         z45A==
X-Forwarded-Encrypted: i=1; AFNElJ+X59eylJ1S+gd9RgiUpajxR7gkLggTYEnEMPQYVt3wtkNEP/ssDit8XKTfqTFLtQfx79wzQxgVwcpkTOgX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+a/ST4rF0TqC0Ys/tpx1HUSaF7TyQttkwXwUxT2iD0YLUbcKX
	f9kY9uy9kkLQrkNGUztl7i3ZD09yc3u9ty+5PK2etXiu2KTvubCgrgaD
X-Gm-Gg: Acq92OGvSTsiUXexVIz/7uHPOf+T6Zs6e203Gd6ZfasqOqMZX0qjh5OaCB8wPgFqjWW
	U2nvUpKMAYtalUQG1zB5gMHHxeOkgSZWvRk+JatP1TphU/3aBt+A1Tt+jc8kTfHPSu8tblgMXj7
	klAff+LwGLQFiPKDsNQ5b+7u6G9TQJB++Ga8IT3rwHg5OY6yMYEAScCpVBXGzSADGZA8Ug3F9yB
	tqZPasqpPq1tJY7TaKvafPHaM192+iFDpzlzM+wgFcFAPVtwG5V2DHJUgUgwuFAfZmaO+mnz1Yp
	5LgjplNanK2yggyZdZK+vUb2D12mHUru3rV33tvp02TtY9IBrUMLDFgMcSpyaKRpPzTNJp//2Hx
	KTn/x3uV8RKP3dAnMkKvZTU9XMFLwP9WFSJw7/LYXpbMudGaOT1O7IzNP55Ug31RL4kICYFsGDh
	hgsFajXBVMqSpchXNvnmIrhT9LwKHuH4Z1XpqJFl/z9r5zzVGpIvA=
X-Received: by 2002:a05:6a00:2291:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-83f042bc770mr2421983b3a.35.1778662800834;
        Wed, 13 May 2026 02:00:00 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.175.168.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c80e7sm32396396b3a.31.2026.05.13.01.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:00:00 -0700 (PDT)
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
Subject: [PATCH v4] staging: fbtft: convert sysfs attributes to use ATTRIBUTE_GROUPS
Date: Wed, 13 May 2026 08:59:48 +0000
Message-ID: <20260513085949.484-1-shawharshit116@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v4: Fix build error - add extern declaration of fbtft_groups in
    fbtft.h so all drivers using FBTFT_REGISTER_DRIVER macro can
    see the symbol
v3: Remove stray blank line in fbtft_attrs[] array
v2: - Use DEVICE_ATTR_RW() macro instead of DEVICE_ATTR()
    - Move DEVICE_ATTR_RW() definitions closer to their callbacks
    - Remove trailing comma after NULL in attribute array
    - Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
      structure as suggested by Greg KH and Andy Shevchenko
    - Compile tested with: make M=drivers/staging/fbtft modules

 drivers/staging/fbtft/fbtft-core.c  |  3 --
 drivers/staging/fbtft/fbtft-sysfs.c | 81 +++++++++++------------------
 drivers/staging/fbtft/fbtft.h       |  6 +++
 drivers/staging/fbtft/internal.h    |  2 -
 4 files changed, 36 insertions(+), 56 deletions(-)

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
index d05599d80011..579ac9dcdd9f 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -107,9 +107,18 @@ sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 	return len;
 }
 
-static ssize_t store_gamma_curve(struct device *device,
-				 struct device_attribute *attr,
-				 const char *buf, size_t count)
+static ssize_t gamma_show(struct device *device,
+			  struct device_attribute *attr, char *buf)
+{
+	struct fb_info *fb_info = dev_get_drvdata(device);
+	struct fbtft_par *par = fb_info->par;
+
+	return sprintf_gamma(par, par->gamma.curves, buf);
+}
+
+static ssize_t gamma_store(struct device *device,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
 	struct fbtft_par *par = fb_info->par;
@@ -133,18 +142,7 @@ static ssize_t store_gamma_curve(struct device *device,
 	return count;
 }
 
-static ssize_t show_gamma_curve(struct device *device,
-				struct device_attribute *attr, char *buf)
-{
-	struct fb_info *fb_info = dev_get_drvdata(device);
-	struct fbtft_par *par = fb_info->par;
-
-	return sprintf_gamma(par, par->gamma.curves, buf);
-}
-
-static struct device_attribute gamma_device_attrs[] = {
-	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
-};
+static DEVICE_ATTR_RW(gamma);
 
 void fbtft_expand_debug_value(unsigned long *debug)
 {
@@ -173,7 +171,16 @@ void fbtft_expand_debug_value(unsigned long *debug)
 	}
 }
 
-static ssize_t store_debug(struct device *device,
+static ssize_t debug_show(struct device *device,
+			  struct device_attribute *attr, char *buf)
+{
+	struct fb_info *fb_info = dev_get_drvdata(device);
+	struct fbtft_par *par = fb_info->par;
+
+	return sysfs_emit(buf, "%lu\n", par->debug);
+}
+
+static ssize_t debug_store(struct device *device,
 			   struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
@@ -189,40 +196,12 @@ static ssize_t store_debug(struct device *device,
 	return count;
 }
 
-static ssize_t show_debug(struct device *device,
-			  struct device_attribute *attr, char *buf)
-{
-	struct fb_info *fb_info = dev_get_drvdata(device);
-	struct fbtft_par *par = fb_info->par;
-
-	return sysfs_emit(buf, "%lu\n", par->debug);
-}
+static DEVICE_ATTR_RW(debug);
 
-static struct device_attribute debug_device_attr =
-	__ATTR(debug, 0660, show_debug, store_debug);
-
-void fbtft_sysfs_init(struct fbtft_par *par)
-{
-	struct device *dev;
-
-	dev = dev_of_fbinfo(par->info);
-	if (!dev)
-		return;
-
-	device_create_file(dev, &debug_device_attr);
-	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(dev, &gamma_device_attrs[0]);
-}
-
-void fbtft_sysfs_exit(struct fbtft_par *par)
-{
-	struct device *dev;
-
-	dev = dev_of_fbinfo(par->info);
-	if (!dev)
-		return;
+static struct attribute *fbtft_attrs[] = {
+	&dev_attr_debug.attr,
+	&dev_attr_gamma.attr,
+	NULL
+};
 
-	device_remove_file(dev, &debug_device_attr);
-	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(dev, &gamma_device_attrs[0]);
-}
+ATTRIBUTE_GROUPS(fbtft);
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 317be17b95c1..1a3b9691f24a 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -8,6 +8,7 @@
 #include <linux/spinlock.h>
 #include <linux/spi/spi.h>
 #include <linux/platform_device.h>
+#include <linux/sysfs.h>
 
 #define FBTFT_ONBOARD_BACKLIGHT 2
 
@@ -274,6 +275,9 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...);
 void fbtft_write_reg16_bus8(struct fbtft_par *par, int len, ...);
 void fbtft_write_reg16_bus16(struct fbtft_par *par, int len, ...);
 
+/* fbtft-sysfs.c */
+extern const struct attribute_group *fbtft_groups[];
+
 #define FBTFT_DT_TABLE(_compatible)						\
 static const struct of_device_id dt_ids[] = {					\
 	{ .compatible = _compatible },						\
@@ -299,6 +303,7 @@ static struct spi_driver fbtft_driver_spi_driver = {				\
 	.driver = {								\
 		.name = _name,							\
 		.of_match_table = dt_ids,					\
+		.dev_groups = fbtft_groups,					\
 	},									\
 	.id_table = _spi_ids,							\
 	.probe = fbtft_driver_probe_spi,					\
@@ -328,6 +333,7 @@ static struct platform_driver fbtft_driver_platform_driver = {             \
 		.name   = _name,                                           \
 		.owner  = THIS_MODULE,                                     \
 		.of_match_table = dt_ids,                                  \
+		.dev_groups = fbtft_groups,                                \
 	},                                                                 \
 	.probe  = fbtft_driver_probe_pdev,                                 \
 	.remove = fbtft_driver_remove_pdev,				   \
diff --git a/drivers/staging/fbtft/internal.h b/drivers/staging/fbtft/internal.h
index ae2ff4a4a472..7869cf8dbf2a 100644
--- a/drivers/staging/fbtft/internal.h
+++ b/drivers/staging/fbtft/internal.h
@@ -4,8 +4,6 @@
 #ifndef __LINUX_FBTFT_INTERNAL_H
 #define __LINUX_FBTFT_INTERNAL_H
 
-void fbtft_sysfs_init(struct fbtft_par *par);
-void fbtft_sysfs_exit(struct fbtft_par *par);
 void fbtft_expand_debug_value(unsigned long *debug);
 int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
 			  const char *str, int size);
-- 
2.53.0

