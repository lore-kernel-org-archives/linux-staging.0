Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BBE360EED
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616076; cv=none; b=iUhAHbgoZlufjZQEXcqrUAmmnX6vq3Nc1y6nsxhsUhqEWGlbwoPnH7gnptnRsbbwBB3/8/bmk8pPdRn1UebcJlrB4pGSgwRtgqsTPgjSbKsASZtFLLz9+Mjram+TBsbMdQjRUHFk7PihDFmRT5dLTUl48lBbNkWE2Z3sga7esqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616076; c=relaxed/simple;
	bh=MKDpSJRPEOkKOwK5I5btBRFs2g54luTXp+aSanxNapk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jfRUuP/SvyUO3gotrD3yXqh22nlmKI4FG9o/GBS/KAPdsFepnc40V0Gy86f7Yis1lELqDAPX8ocpUsvmbGpXCv5U203+x5h0wnnUejAqmzg0nITQ1bLDFy3/ZQ46xZeFSDHlz/IGD4QBKOCTAbdcEl995zRiXa6PNi+VsHXInnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brzC0XW4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brzC0XW4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba6485d219so39041915ad.3
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778616074; x=1779220874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=78YRgXF4hW4GjfUu2dLBslOjL8I6aeWdAJYB94/EVoA=;
        b=brzC0XW4nk1Emai4t9GIM5MMKY42j0XOG8Nd8gO2H3BJACVNw2QZq5YuePHxH2GS6T
         cmXnXLdi4kLewtlL/QPbne0Az/U6DV9ppiuDRn7+7z8M2xk6NaHWtzkvLSJtjCgnwwRz
         Ab9+IJEsL9f9ebmwOMb5KHf9YRI0YNKXM1xaPO+mNQRpXoKg5PXxB/TWVdgxjGMbQ0yZ
         F5T3MQ3BEuMkej/kY+VF/oQNRDgRPbTMBENfbhl+zsCSWd9XdoMw4IJJEV2jxLMcrcca
         BDsiiiNLRlBjqmZUxuUX82HwjHnV+ZXkeptImtQOGvc4NVZi2mrsslMfO3i3xWGvJF6S
         96pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616074; x=1779220874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78YRgXF4hW4GjfUu2dLBslOjL8I6aeWdAJYB94/EVoA=;
        b=N5FkhBdeAMMbb9D6sxRGDqsuIIDPAlHswouT/q0OjDTKLzDn6VfB+QHtZFvMN/31XY
         Ktez4FnXP0ewR8rm6qwRxM3lmAysuTj54NGUhkA+IXHCW5rbnFDV7Ev3o8fOqkh2V8EU
         UW4Z52Lh8mVUHQ/92caIgZTmeo3zJpankFeFyKbADl94dzZ2zrNlxdLYXFwlfJMz23hL
         0EwlE7tvOyGuktIA/HN2cC1iPdQ0nElEvPApXIhorre1Bi19sOOMNG2AzG1MpnlgaVUJ
         W3jqNinBV25wZtyOa/41biKNI/GmR+gFErzE2PLYlMBTWdWtCJSJkBYEL6pFiQSx2NIS
         NTyw==
X-Forwarded-Encrypted: i=1; AFNElJ87DVF3u2N9y+UOylwTB7jrx/+9S9ReGCLE/cBAHSccihs/qcrhx3bpuYR6pdDgrqEHC7TczEvt+i/1RrcP@lists.linux.dev
X-Gm-Message-State: AOJu0YwILsHZOvkOhVSLwQqr0JiEBpwuf0kvRATRvbcBYV3oWRvANky5
	D6aK2I4iGhVQZMZAD9hjbVxjOyhsiZWWw4KHxjMK5NRBPTvHfuRYTtq8
X-Gm-Gg: Acq92OH2jBuJBMfUIJP2VVEy0VoauHYQr/DsZZgb0RdJyveGF+7LqihoQ/WldsrOrax
	rvwZkOhqkEHDNFMdDXK6tW8Td+pg5ZaMnUSoixjVF0p4rbHBWwd9/B1ZHXbBgRPRYFgL16P1EpT
	G1V8+L+4V+9WDJbeunWpf4Yloe4xubhXP5rHo3lUMxJkan1emgm4+vlerdLmu0TJNovadWQTeoq
	e9kkebmrNiGKGDUXHST43SyyAZ9m8DbHEgx8+nK3g+2J9ycDqKwRVl7fFESVlpGERrddGA3Vjw2
	b1ABo6xZF2fj4/2r9oQ8wz/TjrjQi1S+idooiMohPU/Mp687Au+Y07St62byuFersbOe9f18+Xg
	RrFkRgfNNhp1MzjfZd/oO+k3mArHGaa+jZ39Zj738beRmW3j4EX370M1gPRFVEHgEG3ew0Dmo+P
	OzYJOhYG1OBHNPpBySVPJrf8mC548VVJAtkiBazO9A
X-Received: by 2002:a17:902:7042:b0:2bc:d1ec:9f09 with SMTP id d9443c01a7336-2bd274ac286mr3390575ad.40.1778616074352;
        Tue, 12 May 2026 13:01:14 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.135.229.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ff52sm146933835ad.26.2026.05.12.13.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:01:13 -0700 (PDT)
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
Date: Tue, 12 May 2026 20:01:04 +0000
Message-ID: <20260512200104.19002-1-shawharshit116@gmail.com>
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

