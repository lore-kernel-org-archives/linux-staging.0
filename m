Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5094D22CBF1;
	Thu,  3 Jul 2025 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560468; cv=none; b=poBo/tsv5P5BswPUf4ktDST3UV8F0DQzgSskqteq6uWbLz7/SVdrXjneiPnnPLXAiUvQ+sSx9dLSkuR+TehOun522SgRCOgtZiU1ycy6lxbBKHqF1SrC3DF/sydLS7abiuzdgobW0M0/x2egjjxKIB3Z14BDuqbFtuoIGdnpy3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560468; c=relaxed/simple;
	bh=VKwdBc7nBeYzyYiWahHZprHF+d0zFQMTpiieOfjnnbs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rvq+/1PhPUtOVaFZLO82MjLMz6VEMr8sy+qXK6sY0cAzPHwq1CQRvVEPbluB9pe6zZl+4QerqdrQkf1Y6tmGTzGsYCZLm8o+AWRepYzxx1KXHC9jsXnZpm3uU5QTiv2OwGymqFjEEAYYwK9M+iY+WKIS558oMHkyfqHRUfwapN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLnIRspR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLnIRspR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453442d3a15so26425e9.0;
        Thu, 03 Jul 2025 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751560465; x=1752165265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Srec9QR/GmFsR6ZG7Q56odxAHiKleEbcbPmhdL22Zbg=;
        b=fLnIRspRq2aWBwDA7TucyyjrnBUqtVMizQF8xQLe95eFXqxE1ts+gARkB547H0TZGG
         5vr03rps5M2AXG0zFfoEfE6Z1y2NyTQtZi3PHzjUPzj3Mngu8pW57WaSBoZMBi20hp/h
         fogDWj171giekhNNm9NLam4in1IcHmf/QvL8N3YnSP3OyAQOvX7Jp/nJtmbgqf6UOHIo
         9pl66zh9Q0Jvcrvc4+u2pYSfMMU6U1jIwCuD5jOt9M2zD429a5VrGPReOYfOjTZRAEej
         Gkjz/45mO+oA+rHkLY1IpZmFvRB4iESFSwtb9VtXJST9+A3lq1Ydi4LUNZuprs18fF3A
         Hf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560465; x=1752165265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Srec9QR/GmFsR6ZG7Q56odxAHiKleEbcbPmhdL22Zbg=;
        b=lTF/GvqVHgjY7YJ+JWCnG6T8GN+HkbXFQp7rauIFAAf1xVauV1meE96zVti6K/W02G
         Jn/7rX0oKhvqVq52rBvgEF+AxK8GAp/YWQM6XGq34NxpiByi9Wogi3/So1yUjXqNOuJa
         NPk4RpghxBRb0GQEHI7sqJIseWSYycJSgjRqR4m9AZN9Zc+LRbnFACvcrc9/w2e+fyzW
         ECDfiZwbdilJf2Hgdqy2yFnuykohK+6KZ3ajp3Byg12GaxG8NW7XgbZy95j4XMUeSHOL
         qtbU9PKQjBbSPaQY+TQ7VvxWheG1sMOZujOaTuF5LtgvhYBYZ3gQo+JtDYokvDNYF0hC
         HCxw==
X-Forwarded-Encrypted: i=1; AJvYcCVnLcsbtWu0AIFpbqbcff3MtaW27D3jnMG+mdB2D6gV/6Fx9lVdXLM9Fc2XWSiULB4nVMtNXCGaP3f+h1kTclGRVbC7Sw==@lists.linux.dev, AJvYcCXacKH+IQ3uNbiZN7PMA/IV+zkP46PULQ2+xHAff/lRZh4xT9NvvK+YR2gV+04D27N2ut+skFlv5OI68huBwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9D9rLbd7nEi6YSA1KjBpK9H99QjmJG4Hafava9Xxf8kyOi0h8
	pxU27Z5bwkWN+R5JFgquEswCgZ0qCWJProGk+xsF03JiWGgRD49HsV8l
X-Gm-Gg: ASbGncuLLLHNpWs0mxeHmS6/b7tGvaE/G9q2oyAAPz0AelPHgSY1n1ITD9waJwBNV64
	CCwk7RcIxUz84QEWJ2gxTdOxS3iSiVQ4Phr2mONBvKIkeQKrY2WZRQy9DsG4/sRdx06G0MbIT0z
	KSn/gyBWA6UvQsRzTmPKOcf/nv5Exu6NubAgF580RkgIkKQLHpUyYsiO1VtGTdPj1cOfIlTRFME
	PTx4h/TjBRPz1RE5GjeG/OfCM2O9jBkvubsSPPKBtLefpD9+YX7p2q9sBgFc5fLxhEDpIz7kbdl
	tM5FtPjGz/7x4M32nb7/oYZDWylubx2Tpx4Km6GLL8PfwdADkoArj/gX/RvYvF+AnI4Idrp+Yno
	nxuSNwMyLVFa4n8GOqRLP
X-Google-Smtp-Source: AGHT+IF1gdEMbWmckU8zZNqNOEiPSgfYqKdroPQU+DWQMNKxl4cBvFKaJ1cKNO2FmfxqEFvic+P0nQ==
X-Received: by 2002:a05:600c:a30a:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-454a373583cmr21491165e9.8.1751560463966;
        Thu, 03 Jul 2025 09:34:23 -0700 (PDT)
Received: from localhost.localdomain ([102.42.87.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b168673asm2153235e9.26.2025.07.03.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:34:23 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c
Date: Thu,  3 Jul 2025 19:33:50 +0300
Message-Id: <20250703163350.5163-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continue the process of atomisp driver cleanup as dicussed with hans
and andy in [1].

Tackle TODO item "Remove custom sysfs files created by atomisp_drvfs.c":
- Removing dbglvl, dbgfun, and dbgopt sysfs attributes
- Eliminating their show/store handler functions
- Deleting the attribute group definitions
- Preserving dbg_attr_groups[] as an empty array for compatibility

[1]: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org/

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_drvfs.c | 138 ------------------
 1 file changed, 138 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index 31c82c3c0d33..c25fd3ff003d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -1,9 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-/*
- * Support for atomisp driver sysfs interface
- *
- * Copyright (c) 2014 Intel Corporation. All Rights Reserved.
- */

 #include <linux/device.h>
 #include <linux/err.h>
@@ -16,140 +11,7 @@
 #include "hmm/hmm.h"
 #include "ia_css_debug.h"

-#define OPTION_BIN_LIST			BIT(0)
-#define OPTION_BIN_RUN			BIT(1)
-#define OPTION_VALID			(OPTION_BIN_LIST | OPTION_BIN_RUN)
-
-/*
- * dbgopt: iunit debug option:
- *        bit 0: binary list
- *        bit 1: running binary
- *        bit 2: memory statistic
- */
-static unsigned int dbgopt = OPTION_BIN_LIST;
-
-static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
-				    unsigned int opt)
-{
-	int ret = 0;
-
-	if (opt & OPTION_VALID) {
-		if (opt & OPTION_BIN_LIST) {
-			ret = atomisp_css_dump_blob_infor(isp);
-			if (ret) {
-				dev_err(isp->dev, "%s dump blob infor err[ret:%d]\n",
-					__func__, ret);
-				goto opt_err;
-			}
-		}
-
-		if (opt & OPTION_BIN_RUN) {
-			if (isp->asd.streaming) {
-				atomisp_css_dump_sp_raw_copy_linecount(true);
-				atomisp_css_debug_dump_isp_binary();
-			} else {
-				ret = -EPERM;
-				dev_err(isp->dev, "%s dump running bin err[ret:%d]\n",
-					__func__, ret);
-				goto opt_err;
-			}
-		}
-	} else {
-		ret = -EINVAL;
-		dev_err(isp->dev, "%s dump nothing[ret=%d]\n", __func__, ret);
-	}
-
-opt_err:
-	return ret;
-}
-
-static ssize_t dbglvl_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	unsigned int dbglvl = ia_css_debug_get_dtrace_level();
-
-	return sysfs_emit(buf, "dtrace level:%u\n", dbglvl);
-}
-
-static ssize_t dbglvl_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t size)
-{
-	unsigned int dbglvl;
-	int ret;
-
-	ret = kstrtouint(buf, 10, &dbglvl);
-	if (ret)
-		return ret;
-
-	if (dbglvl < 1 || dbglvl > 9)
-		return -ERANGE;
-
-	ia_css_debug_set_dtrace_level(dbglvl);
-	return size;
-}
-static DEVICE_ATTR_RW(dbglvl);
-
-static ssize_t dbgfun_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	unsigned int dbgfun = atomisp_get_css_dbgfunc();
-
-	return sysfs_emit(buf, "dbgfun opt:%u\n", dbgfun);
-}
-
-static ssize_t dbgfun_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t size)
-{
-	struct atomisp_device *isp = dev_get_drvdata(dev);
-	unsigned int opt;
-	int ret;
-
-	ret = kstrtouint(buf, 10, &opt);
-	if (ret)
-		return ret;
-
-	return atomisp_set_css_dbgfunc(isp, opt);
-}
-static DEVICE_ATTR_RW(dbgfun);
-
-static ssize_t dbgopt_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	return sysfs_emit(buf, "option:0x%x\n", dbgopt);
-}
-
-static ssize_t dbgopt_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t size)
-{
-	struct atomisp_device *isp = dev_get_drvdata(dev);
-	unsigned int opt;
-	int ret;
-
-	ret = kstrtouint(buf, 10, &opt);
-	if (ret)
-		return ret;
-
-	dbgopt = opt;
-	ret = iunit_dump_dbgopt(isp, dbgopt);
-	if (ret)
-		return ret;
-
-	return size;
-}
-static DEVICE_ATTR_RW(dbgopt);
-
-static struct attribute *dbg_attrs[] = {
-	&dev_attr_dbglvl.attr,
-	&dev_attr_dbgfun.attr,
-	&dev_attr_dbgopt.attr,
-	NULL
-};
-
-static const struct attribute_group dbg_attr_group = {
-	.attrs = dbg_attrs,
-};

 const struct attribute_group *dbg_attr_groups[] = {
-	&dbg_attr_group,
 	NULL
 };
--
2.25.1

