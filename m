Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A636F913
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618087; cv=none; b=rNjkupm7Ge6+2KLFVRH3UZlVwS3vmqLcoF/iB2EGAPWOd+cU0mg3ZisqATBecwo9CySuXI1drHMYtiCWtWkGpdHML95siDqjuIXftceWyFkxohupG/j+V9ewotDTIUZNJVPhDd8Dxuuoyj8SBcOgnwShJsjYCBonozItD8goc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618087; c=relaxed/simple;
	bh=SeWjaicGTxc9F9a1gqIP9rxdvGj/DAyb2BzM0m5MYmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDXD/2oZt4+b5IxvqUpxy+ieHE4AE4FrnYBbKBpqSOYSmEiIYRhGpaFx29+wj/bXpEUKWQm/StwFfFKUIJywiGHP+vu0W4QOAB0ke0oYayPY2kqOfzzMd965hzVjCfxK6yMIpzGwkBAS273q0MiC3i50EkzneZJEDVbzeBI/uJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFa9fVTJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFa9fVTJ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82faf871346so4370919b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778618086; x=1779222886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqSki7EtIyCFyTP9UCMR7OLooGGbaVv4NcZs7Mg9aBw=;
        b=sFa9fVTJccwDYljy02WrrOeehW4WWJBoH9L9YNlcOvkVamRziq8vtfQzmZeWDIJ82p
         6KCJIu9FOj2T7ds99WAVnQzMjIt9EIt5Q987JauIVfhiI97OXaSeLiedQkv2V/GnPWK8
         VXtnBo5Qo2jIAbAFGLcyVcxhtqOZsFqgJutqEzYCwBTPZhjUhqnXrQ1yPHfmyF7eveRC
         1I4jrbzW131lo1cor1qbJPTVW9dgvrl1WTQzjB+NoKuGsRo7ZgXkycpjMtWx4U22kTq1
         V34sUlT33ecU9KV6TLh6NdOOgZDAQH5BIVS3zLu04G1qrIXpaGpgjxv9b3piqYGKUL0K
         Ccww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778618086; x=1779222886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqSki7EtIyCFyTP9UCMR7OLooGGbaVv4NcZs7Mg9aBw=;
        b=Rzzx5nxFSta+ayu8/Ea2sa6wUbUz7H65ZQAUWmzgrSoW6LngkKhvNKPmj9j4tbMCAY
         QG/+GQulSv7kXuIf477C6wz4PSRm5hVdvlbKuABegjdnvNCdDY8Z9lZD7g76fTLCJD2O
         R/rla1gcpANfmPWiKZd0DDBT2x0r3B9sKLCI5vQcu2eQPc5wnfRPKhU7Vp3YHH4cNsPz
         2l/TrTMjiWpWfRAMTzzzsSOd84SnG2yrnp+/7dqJvnOWU4PqBvPf5camvEqS9V0lGNg4
         Egvu2O1NxunInSvLbyvHVgvlWkpVb9yqJyVvQwHVwMDMTD1bq0ktYNns6m0MwxE92cIs
         DbQA==
X-Forwarded-Encrypted: i=1; AFNElJ9MFIsr7KnQqtqRQSAqLVL8B6jfbVLyekzfEnmLJMgr6lBqHVjNDeEOQsi089lgXwXlrlWIjlS3HxV8RRoc@lists.linux.dev
X-Gm-Message-State: AOJu0YxKYO1cHuVfoWyXgxL7fYA+TxqBZGCHEM8XJdKkfGyVwvw8nBfc
	Say6rA3ycAO6xz84yZdT2tUfd1xeyjB3PGjTyfE/sIjnFZuSqbHKe9v8
X-Gm-Gg: Acq92OG4wtkxoY4MxRL1ckvrEGlsnr3Y+fdrwmVSQ0R/D3OrsS7CPCJQUkysLOh3U01
	Ej2x367jb7wDC8agiE42Igk4hviydYREIExUZTkVRz1IrfE53wIcxQ50KBRkOEdDjEuN6iGSIo3
	guXhAN1FTpsRJTXG669b/NLaIGsXBR8D9AhPaP4Hc93s2zWwOyz0t0urhXyB/LO8eLAcLeSk4Us
	2LSWTffTu6Vm5UTz8xC+m+Eb2Gu5YAQEY8T6ie25oJef7ZaYfRw07/wg5RXXhZZcmdXP7jF7FNV
	y1HV/6guYOMbPjVFyWx89px9lOexx7LUQo6ge2TDFHf3OFiiSpGI/X9BmgPX5X9KCf6IyK2sNA9
	VSl9CBuxA9fsUn9FhMNOhgDy/G9mMIzIHQQTsF8ryJico/wBS8sYen3oeXvx7atTaLbo9TPQryY
	6rCKjPCyphff5uPTGpEBvAKC8fAh+RDU/KrmGkCDEA
X-Received: by 2002:a05:6a00:a227:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83f03e71493mr269026b3a.6.1778618085670;
        Tue, 12 May 2026 13:34:45 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.135.229.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396594645csm25319428b3a.14.2026.05.12.13.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:34:44 -0700 (PDT)
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
Subject: [PATCH v3] staging: fbtft: convert sysfs attributes to use ATTRIBUTE_GROUPS
Date: Tue, 12 May 2026 20:34:35 +0000
Message-ID: <20260512203435.472-1-shawharshit116@gmail.com>
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
v3: Remove stray blank line in fbtft_attrs[] array
v2: - Use DEVICE_ATTR_RW() macro instead of DEVICE_ATTR()
    - Move DEVICE_ATTR_RW() definitions closer to their callbacks
    - Remove trailing comma after NULL in attribute array
    - Remove extern declaration from internal.h, not needed
    - Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
      structure as suggested by Greg KH and Andy Shevchenko
    - Compile tested with: make M=drivers/staging/fbtft modules

 drivers/staging/fbtft/fbtft-core.c  |  3 --
 drivers/staging/fbtft/fbtft-sysfs.c | 81 +++++++++++------------------
 drivers/staging/fbtft/fbtft.h       |  2 +
 drivers/staging/fbtft/internal.h    |  2 -
 4 files changed, 32 insertions(+), 56 deletions(-)

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

