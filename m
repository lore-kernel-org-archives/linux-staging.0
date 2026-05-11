Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9018D453482
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522969; cv=none; b=DmCgiQvcKIeuXXU/aORL50nMrqPRJwBSbVFpV9b8wQ0EjxG5qOyt34SqAZC0fib7fV7hNSfTSKfmPDdEoRWteGTW1ZU7hW8BZ47oa4eWmpIVroFdPDgixhugVfRtAzbSqCZLmrxFg7rVO8cgJUTW9l63h2yOWAr6GEKH1mDDchY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522969; c=relaxed/simple;
	bh=RJwhKWq1q4cC0DhfWRzXW3lNPbjFUnyGf7PG+mA6qcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ups9jUYZpsho3Hah7JxK+AYjl1Dur/5XrF5rlxJxuUQhys1FzNayNR9aX96piYLTvGmAk7T51mDBzuQTGJjvsSqYnH5g69DUioqemoSxkf8Gjk4dHIg4Ud90xrss7OsCcvIYslW8Ds929bMUUe/RS+uVYjyyhbnTlIFTK0UMrWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpj/xD19; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpj/xD19"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8028fa6039so2987266a12.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778522966; x=1779127766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDqgtJ0sNizJWJ37Sh3odA8hFyog7jKHPg2WF6sY334=;
        b=Hpj/xD196KCNY1ci7moAfjwLlWtK4CTAm1wyT6CIslr1FW4VUPaAJoS3himUzDQrdK
         MGH9+mXJkrXMUK2prtX+/60HKwpVKceD5eaInjMuRVKHsuyCCiARU0ZwRl2Ys/pIRc+O
         s0MIAKLGWDIXMzhwoyC4P+0E4bsEx9Pq9bWiARo2RxRrPJC8zwSjQndysYjkfI8Ha6pz
         fnVkNbBjWIofGDD5iXpsmZ/rsEnU12XA0XQeOnNbsexBycFIBQoVu1sj93o3U5BxDhPM
         eT0v463kcjo1m1Qhji6lDxGh83deNAA3EaqAsr3xZ26FFtW5nI/aiCj0quxakEOQvZrW
         oIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778522966; x=1779127766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDqgtJ0sNizJWJ37Sh3odA8hFyog7jKHPg2WF6sY334=;
        b=iyvoc2TUxKdOA+nce4IaWtHeKxP56IoqalxLsXfgJTUsPddo+16+Bgf/JrdXvft9oB
         RQCxh4Fy+9VweJ9VA21tN83RH5wOMTPKUxUX43W5TD3wxMhLhnLaAkytoR1FmaZW2drq
         B/XhWpP5Vp9hHUX3bXhFKEClbMy0CLk7nI+ubwsYaq1yUWbN9Ky+raJ9ENlCn60nhi6B
         8/5bEuwlpPaUL72jGJ95kccmxS1ta31vdFmHYt7bpq0erlWI7ntT5MVz9etqur9xsKER
         wBX9CDfDNM6/R6I67NH9eI/GwJK2IyH/i0++Qt7TBnBithIA5r3E1Cxj6D60IT+iSSZu
         foUw==
X-Forwarded-Encrypted: i=1; AFNElJ9oHV3THwNzajXPkMl2i2rL4W5vl2hjZdy482QEco8LFAfQgrO2ZCqsTFEENHXejR1uiQKnwZa6YQ1S/sDb@lists.linux.dev
X-Gm-Message-State: AOJu0YwYGNwxqzegsngAxSH2rqYPi6MQtpAn9n3sAFsgISlYjS2FMVgI
	lAmbK/SeHdwE9Mol6dSG5JRcJn/euxcWTXNJCn3lBCvciyRgkmYznudK
X-Gm-Gg: Acq92OHTmq/idJtWLPWjVTt9EzeX19LmT4VYrqeydz7NBhUrm2Z1UqX9VoeGFy/WOVC
	st5958mSzC3cbDVUv2AJJSybGJk+3m5sycfT+ZLxy4OiJ/Ix6V5en/TFfGfWedOieRikq+QonLF
	0uQLMAhmDyeDYhgl7QgI0KUQCvnyuicV+mEVQjMdBrtFU4ON3u5MaSG3lZbZoGGP6sO+FvHofI4
	6rW+DfQ2IB/+Q8zElb1cFTxfHHR3/EGc/5EhFsxCNy4Fkj4HLPD+WOeFEtnG35ftD/mAKyR32Y0
	9W+PLWQ7fkpnZzIJyL4HyMO32vb/t+N7sD8FDdqk0ze5sMsszXzfdlVxIe7dAd5K5mE/rgrds4h
	laArs8ygrxbv4dqIGWcGYzqJwg3NBvtSD9DdPalBZ76nflLjw33m9jsDalJlMkvxvvIAPPodLcy
	IKdE0nD/dUYc+Zcnxre9hY6+hYm5Qld7/8eM2EARwp
X-Received: by 2002:a05:6a21:6d88:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3aa5a983571mr27958430637.25.1778522965670;
        Mon, 11 May 2026 11:09:25 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.211.132.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771026dsm9949832a12.21.2026.05.11.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:09:25 -0700 (PDT)
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
Subject: [PATCH] staging: fbtft: remove sysfs debug interface
Date: Mon, 11 May 2026 18:09:12 +0000
Message-ID: <20260511180912.1625-1-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug sysfs entry exposed via device_create_file() is not the
correct approach. Remove fbtft_sysfs_init() and fbtft_sysfs_exit()
along with the debug sysfs attribute. Drivers should use the standard
kernel debug API (dev_dbg/pr_debug) instead.

Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c  |   3 -
 drivers/staging/fbtft/fbtft-sysfs.c | 111 ----------------------------
 drivers/staging/fbtft/internal.h    |   2 -
 3 files changed, 116 deletions(-)

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
index d05599d80011..925b6c699599 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -89,63 +89,6 @@ int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
 	return ret;
 }
 
-static ssize_t
-sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
-{
-	ssize_t len = 0;
-	unsigned int i, j;
-
-	mutex_lock(&par->gamma.lock);
-	for (i = 0; i < par->gamma.num_curves; i++) {
-		for (j = 0; j < par->gamma.num_values; j++)
-			len += scnprintf(&buf[len], PAGE_SIZE,
-			     "%04x ", curves[i * par->gamma.num_values + j]);
-		buf[len - 1] = '\n';
-	}
-	mutex_unlock(&par->gamma.lock);
-
-	return len;
-}
-
-static ssize_t store_gamma_curve(struct device *device,
-				 struct device_attribute *attr,
-				 const char *buf, size_t count)
-{
-	struct fb_info *fb_info = dev_get_drvdata(device);
-	struct fbtft_par *par = fb_info->par;
-	u32 tmp_curves[FBTFT_GAMMA_MAX_VALUES_TOTAL];
-	int ret;
-
-	ret = fbtft_gamma_parse_str(par, tmp_curves, buf, count);
-	if (ret)
-		return ret;
-
-	ret = par->fbtftops.set_gamma(par, tmp_curves);
-	if (ret)
-		return ret;
-
-	mutex_lock(&par->gamma.lock);
-	memcpy(par->gamma.curves, tmp_curves,
-	       par->gamma.num_curves * par->gamma.num_values *
-	       sizeof(tmp_curves[0]));
-	mutex_unlock(&par->gamma.lock);
-
-	return count;
-}
-
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
-
 void fbtft_expand_debug_value(unsigned long *debug)
 {
 	switch (*debug & 0x7) {
@@ -172,57 +115,3 @@ void fbtft_expand_debug_value(unsigned long *debug)
 		break;
 	}
 }
-
-static ssize_t store_debug(struct device *device,
-			   struct device_attribute *attr,
-			   const char *buf, size_t count)
-{
-	struct fb_info *fb_info = dev_get_drvdata(device);
-	struct fbtft_par *par = fb_info->par;
-	int ret;
-
-	ret = kstrtoul(buf, 10, &par->debug);
-	if (ret)
-		return ret;
-	fbtft_expand_debug_value(&par->debug);
-
-	return count;
-}
-
-static ssize_t show_debug(struct device *device,
-			  struct device_attribute *attr, char *buf)
-{
-	struct fb_info *fb_info = dev_get_drvdata(device);
-	struct fbtft_par *par = fb_info->par;
-
-	return sysfs_emit(buf, "%lu\n", par->debug);
-}
-
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
-
-	device_remove_file(dev, &debug_device_attr);
-	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(dev, &gamma_device_attrs[0]);
-}
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

