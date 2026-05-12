Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C625B084
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610619; cv=none; b=kgz64PmQZMDQ9e5ZFGYuYI4A2DyEf9C56dH7aELunSI/gkYASGZt5b+FIkOL3np0rYrYfGt2Rq+T+Goy7SX5QxAcDUx7cMRlYw7YF2kpL6/DHHnFnIYJjotnnh1JSv/tJ37oQWXR7ts8P2KriKzWMYq1xjN/XeEcg2/rFSvT32w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610619; c=relaxed/simple;
	bh=Ev8+ae7yxH6LIx0vV16mfuXO7NpD41J+W6pwdhrch+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBkEa4rT7w7ocyPSXnTOQBtCgUWUe1OrcmtyEYkGk4+CjkF4k7lEAtWHcK07sV/HrWaNwbv2Ma5Q1DB4eVAeZgZOVbNGEwNUlLKh743PscAB0AyRn1Bv/qenvoWuKw4hw1jDLR4cv2AUg7DKWPbPbmI0g60cFmIO6mgrnWj92Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRMryfqR; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRMryfqR"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c802803ac17so2659303a12.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778610617; x=1779215417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mKZMv11nwqLYu9TXYZdupqbbdF1zc6hH1M/c3s/e/XQ=;
        b=CRMryfqRKDoQ9zMd4mmSZzDaOb+2bNKE2rRZUmcRN1J/LB2uymCAsdwAM5d/9sgAZL
         EpNX8YZvvrhk8GpPjzeqIQs7nf8WpkRhPzcnjmLBwV7bXxWVS4Fyy93dfI7jhAFB/HBH
         /Ci4z6b53egkXMS9bnRc0jk0lV6O9HsiLqTyR+rufHH4Tn59QiNSMsmZiTZkWdpuHPJR
         aVr3zf5d/GlgNHaxrusDrd6CaQ+bEdCdGDzKVSttxZcBGGU80TMjlMFu6ds3VavO5qNP
         o4FMd+l8ltHXTUXg8GH44MrcsXCr+jx/AHQbQ3Rk4i8/H34+YcFpC6cNpaoyYVin0aAe
         5jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778610617; x=1779215417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKZMv11nwqLYu9TXYZdupqbbdF1zc6hH1M/c3s/e/XQ=;
        b=rEPs7OnohIhLX+auSHt1+4hbCQJHErpxtOE8CWCdDfYDTPnlJWJPvhScMmhmGwM5ul
         oZ8JDbdUutqSyhhi7tGxAD79Lq1xv6UvuPfgz1vHMtHWRcP38WtTZzXHGEg21FINBsH1
         /c5RfSu6XcM/xM9GlXc3v1/6CGCYioRLfDXFqlSAVygGZHM8geS1bKJOL6nZj5nZW2gY
         9fRI81eooeJY3aIe4WueikeBuSPnisqA9Hc/veZsSfV//f4hifn7bZXIR+yszFcMP/js
         vW+EvO7Mz/EqZoSifcE5MV4ZnmntlSKDRJpim3FWjIr5cGVhJzbD5hpUn7ZqCBBFSLtg
         dnIA==
X-Forwarded-Encrypted: i=1; AFNElJ8C+9RkkLfEBxLJxL64XHQPWqKvghR7svY0tgs2uhat6KF44HzC0pC291Usc8e9oRPWAjgk97AlTbuTV6ls@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs5mKfiWeUr0YOns+vXzgApDA50evidWlynz2MAuAPVvzJycQr
	HbTHyy1ySC9q6GIAYtNnQoWvvNCgvEvEHdlahbxv6IXhvL+1OntHq1tP
X-Gm-Gg: Acq92OEj0hhqVlOdG9YZbmZluAGWgIt8rArUa68J510wCOXWAod3jaLyXLv8VzWgnzh
	yTHrOPLqdDlFNdNen158evzaBkfkjtT+Is2dx5199Vr6rhR/rmZ/U8XO2dAIG6AeXLqH9726g9p
	NPGGKpb1fWeNZxTSFx7Zp3X0jERfIEj3kVGe6rEDUOBI7ldpCtoc70IV+s9k78WQNvG0AVh8IB6
	T7CkzTdG3JED2phorcUKfAIH/2wcJjNwyqpPP1kW3orFQrWcLITyog0340ejIKNEYR3/vhB+1uZ
	K1+MpUYptYpQEbZ0LVdZqBp+ZhHZn22EwmErUhSGiNwDDVBjnP76nvEoZpvzuMFzI6j7agZoyhU
	8+YM0pMAUYNVw+Fmn+LvFBeCKVZ6vlTyq3BCsiM0fkvat7s/546K/rjAbZ2deiX1qXb6vlOX1Zr
	hMyMAyyhOtfP7ucT/bIsCJlD14BWjVbRCS6tshs1nX
X-Received: by 2002:a05:6a21:32a0:b0:3a2:d838:bfd1 with SMTP id adf61e73a8af0-3ad99611749mr5199023637.30.1778610616853;
        Tue, 12 May 2026 11:30:16 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.135.229.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771e730sm12650097a12.26.2026.05.12.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:30:16 -0700 (PDT)
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
Subject: [PATCH v2] staging: fbtft: convert sysfs attributes to use ATTRIBUTE_GROUPS
Date: Tue, 12 May 2026 18:30:06 +0000
Message-ID: <20260512183007.14511-1-shawharshit116@gmail.com>
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
v2: - Use DEVICE_ATTR_RW() macro instead of DEVICE_ATTR()
    - Move DEVICE_ATTR_RW() definitions closer to their callbacks
    - Remove trailing comma after NULL in attribute array
    - Remove extern declaration from internal.h, not needed
    - Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
      structure as suggested by Greg KH and Andy Shevchenko
    - Compile tested with: make M=drivers/staging/fbtft modules

 drivers/staging/fbtft/fbtft-core.c  |  3 --
 drivers/staging/fbtft/fbtft-sysfs.c | 80 +++++++++++------------------
 drivers/staging/fbtft/fbtft.h       |  2 +
 drivers/staging/fbtft/internal.h    |  2 -
 4 files changed, 32 insertions(+), 55 deletions(-)

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
index d05599d80011..92d9e237123a 100644
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
@@ -189,40 +196,13 @@ static ssize_t store_debug(struct device *device,
 	return count;
 }
 
-static ssize_t show_debug(struct device *device,
-			  struct device_attribute *attr, char *buf)
-{
-	struct fb_info *fb_info = dev_get_drvdata(device);
-	struct fbtft_par *par = fb_info->par;
+static DEVICE_ATTR_RW(debug);
 
-	return sysfs_emit(buf, "%lu\n", par->debug);
-}
+static struct attribute *fbtft_attrs[] = {
 
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

