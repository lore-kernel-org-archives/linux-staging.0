Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7F495537
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578108; cv=none; b=ePhB7GVMeUwINe0TvluHH+HyLKjTyHm6wbLTtSfzQ38NlZcc3BC8bVOLN50/bJUGaEa1GM8bWwQGk8XQ405C4Z2RWsrb4I943kEgsbrSvfFM4qHeCUzEg1geuDVnyLTXYoyyY2KDbXV3wOynt9uESvHq0KMqe7aOV0CDbW5eEbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578108; c=relaxed/simple;
	bh=8h4jpBtpuKTUNnsiEKiByVl/csENa9Agi+/vr3d8Bfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AAI5u67qPNEaxHY+8Og3AmO9bLkpFwqx5Qc25uy2bAl71Bx/Z68Gkv30GG4rIpO+ZXiApI8EvrrNIv7SygRQ8FRoYmTpUnO5prdO+Lmo+mzPuuYhRkQgZ7jJMIqwl3yhyw/F1bfqqJW+PoZ1grWudD6MTSQBzVCRPCWVFvq5dS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZDgN6MU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZDgN6MU"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c828daf83e2so959434a12.2
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778578106; x=1779182906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMRpxOIbkgKf3sXMHcgjIEL2bqkfISssf7yIjTAtqzQ=;
        b=VZDgN6MUw9PQ2dMquxZcExtq92iDg702MbusdZMWtZGNrRPEfDy8mPo7VzQBU7+2jK
         6oYVfzaB61Xni/v79e6F7GzopQCfv3Cwq+kEnnU9Vwn6aRJJnvLHCdsUuCu9GaU3ppQr
         wEqNx4sAptR+tVbl4KpyS45hlkYxC8HopuUcQPrBbVMCCe/9+mAHLRcC/koc1/dSRFN5
         UUlgGaPSaALOk9tZUhw13d2P6bRGOjrio+UumSIrKqgio8I7aFkbn0A9KfRarC1qDVUa
         doqwsaj7RbmBOE2MBBKWSYQnhT4XymumrDy1UU0BZ91S5jMJaAxy9LvEyhit0L71IZ36
         bblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578106; x=1779182906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMRpxOIbkgKf3sXMHcgjIEL2bqkfISssf7yIjTAtqzQ=;
        b=Y4N3xLRwPr0lmC1e3vQi3JKTIsrQKWRVpMubCvQfbtqP5kBziSEhXitlPkhFkW1DDm
         3rUpbQHsBtznqLwL2JM7HnWk2UB6VD43YPwpacAa6IvCqFzdtoP70BsPzKZf/AwzHLiH
         xwN/DjCESl03YmkteX4K5BbmzB10Ign1+eBca0yT7dww5v++DGBMOW+6Jeb5WvDrmScl
         LImYw2gLw+HW+BDwlECVRFAcAlkH/g3VJ0wCqX50w3TVQY9OON7g53kMpCcUpEvdhI5/
         ZbnTL9nzx8nGeRnfXuys/mzQJfWXpcCLCFHMoyzt7uukXP+XlaYudbueGJ92Od7C3UAf
         Q1ig==
X-Forwarded-Encrypted: i=1; AFNElJ+r/Mj0juA5KCrGiiCr6rW5B02UT/UgEaeKjPRxUTCvREjxeQwM/z3krvDRaq56eEjPBPejrLdwLSv1PfSK@lists.linux.dev
X-Gm-Message-State: AOJu0YxRgyq9CsO7H+qisj2YKY1+emjKG1hDd101nKtAcTfj5fsstUx4
	IQQs2RJ2WEVxZjCM6MvoUSzbNdY+KEIa5w8C1DXSMMeBnaO68EI/Pb6j
X-Gm-Gg: Acq92OH+iPoL/97jYSekprzJoF67Wi6NqfWdV2S+wzWxeH2EcfpuavmlPe3F9zl1prO
	ReA7K2Y5MO7vA7G5Sf6Lf8+ZAZrOEeROKI0ilBSO4yU9ZO+vHp7Ahh1Q97/2HwKZXntDuf4JbkG
	KtffJ9D7YsyL0WDS2pNXUT6HRyUmjX/uURSC0T5/ajiB50KDnz/4Wu/N+a/Mv3bk59sQP4vQW1j
	JycCWQ0gq4LnxBtvagFu46bAeiskArDNLT8A02NlhC14dTBqN01sBG30UhC012rsneW0aS1sbgH
	wGnUs1gIjeNea448c5GUIBWL6pK9Lj9otWKnE+zk/TZHIuVwOiq05pYFc2L3fXtcIkNJ8Vuq9+Z
	S73Ew44UQMkfMn634/fZLEY6Qw5af4DbKOn5uZsDEbF2UL7qVBGu1P7KqyZfAWZyCVYtzEqtWvm
	fAXC+jgDOPYSrDjtWaEhzrL+MNd8eGkFc8EGRFA59X
X-Received: by 2002:a05:6a21:339e:b0:3aa:ca34:61e7 with SMTP id adf61e73a8af0-3aaca346b9fmr16414740637.31.1778578106317;
        Tue, 12 May 2026 02:28:26 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.135.229.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767bf53sm11351245a12.6.2026.05.12.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:28:25 -0700 (PDT)
From: Harshit Shaw <shawharshit116@gmail.com>
To: deller@gmx.de
Cc: gregkh@linuxfoundation.org,
	chintanlike@gmail.com,
	tzimmermann@suse.de,
	andriy.shevchenko@intel.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Harshit Shaw <shawharshit116@gmail.com>
Subject: [PATCH] staging: fbtft: convert sysfs attributes to use attribute_group
Date: Tue, 12 May 2026 09:28:17 +0000
Message-ID: <20260512092817.1941-1-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace direct device_create_file() and device_remove_file() calls
with the correct attribute_group API using sysfs_create_group() and
sysfs_remove_group(). This is the proper way to register sysfs
attributes in kernel drivers.

Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
---
 drivers/staging/fbtft/fbtft-sysfs.c | 83 ++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index d05599d80011..8d3c4e49b68e 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -142,9 +142,30 @@ static ssize_t show_gamma_curve(struct device *device,
 	return sprintf_gamma(par, par->gamma.curves, buf);
 }
 
-static struct device_attribute gamma_device_attrs[] = {
-	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
-};
+static ssize_t store_debug(struct device *device,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct fb_info *fb_info = dev_get_drvdata(device);
+	struct fbtft_par *par = fb_info->par;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &par->debug);
+	if (ret)
+		return ret;
+	fbtft_expand_debug_value(&par->debug);
+
+	return count;
+}
+
+static ssize_t show_debug(struct device *device,
+			  struct device_attribute *attr, char *buf)
+{
+	struct fb_info *fb_info = dev_get_drvdata(device);
+	struct fbtft_par *par = fb_info->par;
+
+	return sysfs_emit(buf, "%lu\n", par->debug);
+}
 
 void fbtft_expand_debug_value(unsigned long *debug)
 {
@@ -173,45 +194,45 @@ void fbtft_expand_debug_value(unsigned long *debug)
 	}
 }
 
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
+static DEVICE_ATTR(gamma, 0644, show_gamma_curve, store_gamma_curve);
+static DEVICE_ATTR(debug, 0644, show_debug, store_debug);
 
-	return count;
-}
+static struct attribute *fbtft_attrs[] = {
+	&dev_attr_debug.attr,
+	NULL,
+};
 
-static ssize_t show_debug(struct device *device,
-			  struct device_attribute *attr, char *buf)
-{
-	struct fb_info *fb_info = dev_get_drvdata(device);
-	struct fbtft_par *par = fb_info->par;
+static struct attribute *fbtft_gamma_attrs[] = {
+	&dev_attr_gamma.attr,
+	NULL,
+};
 
-	return sysfs_emit(buf, "%lu\n", par->debug);
-}
+static const struct attribute_group fbtft_attr_group = {
+	.attrs = fbtft_attrs,
+};
 
-static struct device_attribute debug_device_attr =
-	__ATTR(debug, 0660, show_debug, store_debug);
+static const struct attribute_group fbtft_gamma_attr_group = {
+	.attrs = fbtft_gamma_attrs,
+};
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
 	struct device *dev;
+	int ret;
 
 	dev = dev_of_fbinfo(par->info);
 	if (!dev)
 		return;
 
-	device_create_file(dev, &debug_device_attr);
-	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(dev, &gamma_device_attrs[0]);
+	ret = sysfs_create_group(&dev->kobj, &fbtft_attr_group);
+	if (ret)
+		dev_warn(dev, "failed to create debug sysfs entry\n");
+
+	if (par->gamma.curves && par->fbtftops.set_gamma) {
+		ret = sysfs_create_group(&dev->kobj, &fbtft_gamma_attr_group);
+		if (ret)
+			dev_warn(dev, "failed to create gamma sysfs entry\n");
+	}
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
@@ -222,7 +243,7 @@ void fbtft_sysfs_exit(struct fbtft_par *par)
 	if (!dev)
 		return;
 
-	device_remove_file(dev, &debug_device_attr);
+	sysfs_remove_group(&dev->kobj, &fbtft_attr_group);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(dev, &gamma_device_attrs[0]);
+		sysfs_remove_group(&dev->kobj, &fbtft_gamma_attr_group);
 }
-- 
2.53.0

