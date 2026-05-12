Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2990388876
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600434; cv=none; b=naxi9cJ1xh945gqgHibbVPXGFFxPlaBIrTTEfk5ljqcbjdlVy9OKVjhGX/ztuYNTkru8u8Okujkm59dB2ZQNgEs3A37eHbWEQb9AwO5fsTLVHUXCEM2fEs0A6DVGWYe82+pkBm5o/TjNf/73W1tCv8dIouDw5naoGW/fuNXlfBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600434; c=relaxed/simple;
	bh=PaZMN89IHn/wFbg5hgovrYAp+4Zznpag3UuFUs1j92s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BiIbPkiXDZEiYt4n/jY+f/3JgMaqyyBg+pCd5lt7vFvD0qy3FZypDJXIbSrc1/mmZDut+wfi/g/WMfsSFt1r5JjkvreBgj5o6mS3346okPF1Hi5K/KD/jEZRL8Yew7ePDCeYqHsYWX1jfmc4VPQCKBQzlVRY1Oewj+V3Fg1i7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDOeAm1R; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDOeAm1R"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-367d88b9940so2464998a91.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 08:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778600431; x=1779205231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4NG8vlL+mes7MiiJOxHX7lkSrabjJ+5OdqFIdZ9ZH+I=;
        b=JDOeAm1RNwKFpHPdcQwnbR3RmhX6cO8GAoZPYHqQBOpaEZ9jMEBwSPp9/GwiVJAxSP
         9kHpXGoB0SK/AfVRauXFxfJWMYWOIEOeAtFj7ch/UgN5FuuBlUcMiTF0hnlsnMjQuqgc
         adA5jNLyD7cjUD8st+65kz3QAwVJoOJUUMkkJGZCN9ziDtox7kS8kd+FGnX0I8msg44/
         ItNd3o2p+FY5gQaQjkwBb97e0cs0DXJNJzvIuZWPauQEdNOnjR9fZvYIF6CMJmf7KBHm
         QL5ejWKPqahsQb8oSGozpLI4J55TZEv4XFvp2z8SMlD9evWFLcdVkIe5r1XJG5SawW00
         Xwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600431; x=1779205231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NG8vlL+mes7MiiJOxHX7lkSrabjJ+5OdqFIdZ9ZH+I=;
        b=mnMRMIA12st5eW248D20qGCISghL+GdBsxVnMm2gMTyPgP87H4KIvwzcJti0AZrEUO
         BjBKVQ9JXnrOyEsTsFhOz+hC9JwNQRTZL3LYGHlK8NiboLX0S9KBdww6voIujN13AvQu
         EVy1mps+GEEYEj0T4AAENk7EguVVJdhWrIvR7YbjIolJhTBBhyO/dutgqivTGnDjLPgO
         6Ux7qKfo7SFvyTLt3umyH/OnAQGlph/AwImoD7FqIAEAP8PT19Nu4Wa6Z9+ExPfnv6I8
         S+rtJxYNKlA+QugsSjgwBLwNJ5JDhA9kSgcmt8DeMh+R5K8F5t/H3fogJpOtlyw5A5nx
         p47g==
X-Forwarded-Encrypted: i=1; AFNElJ/y4Idd44BVx/2SS2yxaVnJl21W9HhBnZrrlBqykxNBTLvSUqRkey2vFwkERyaxdQHI4FNxq0vVLFMqIB/H@lists.linux.dev
X-Gm-Message-State: AOJu0YzSe/4oBlT6Z+C+ZeZzdIFqpYAE0HLQYqeuXfwpkquzCKXdzBo2
	YXNPyCCQ3zaaFqstoVkaGTWq0FacarD39xGejqguiBXLnYBTTLiBZ3UX
X-Gm-Gg: Acq92OHn5WElWmDCWWH+A4PIz0TGumepoNx46lB5SWIXzc+mO2/cUiJwm4Racv5ef38
	jULXSMPwYQDw8kWngA2goqoBW5oFV7yIhLUlO7/c8RzNVGmR058sr3YMkm1pSI5C88ThigjMYQh
	uaqd4AwHf3Up8ECwU18X3uloeDvzEVZOCqoTexAwdgAZaLfsTc7WcmaiwVVLpMQgT1a994AFsIN
	HUpHGfbKYFM0x4mCKeGmtr5tvlVFnTvNIBbYqmuDPGTyeAfxj8zycplNVmKzE3Yoho3dd/c/aBP
	2WSmfY28VHW+RjcvO4oUJq3aLsA/Us0igPr+Wc7R5D5mX06BWOCdd+lZu7C1g0V/9a6DvKvQjez
	NCgtyBItPQZvuWswGE+sWLTbyH9qPpN7717s4tCnoGpYfb1amo5lVUxuz98IyMj56jTR5SkQsYL
	uwYKMxUIB95GqXfZN1Dle8XwFnWMWc37ZuyUlAenGa
X-Received: by 2002:a17:90b:3c0e:b0:368:7536:b5b7 with SMTP id 98e67ed59e1d1-3687536bc68mr8136793a91.16.1778600430829;
        Tue, 12 May 2026 08:40:30 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.135.229.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ed962120sm244980a91.0.2026.05.12.08.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:40:30 -0700 (PDT)
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
Date: Tue, 12 May 2026 15:40:19 +0000
Message-ID: <20260512154020.491-1-shawharshit116@gmail.com>
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
v2: Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
    structure instead of using sysfs_create_group() directly,
    as suggested by Greg KH.

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

