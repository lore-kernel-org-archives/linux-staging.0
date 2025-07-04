Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CEC309DCE;
	Fri,  4 Jul 2025 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645461; cv=none; b=Q/iTtU8LlKakDDA38AWl7KLRPXII9sXiJ4OLosS25F/WppRs1vgRMVuKvfcj8anwHooBOm8SnvVK2PAGMw1rj+TKt/VFf3H/r/7SMYhSdvoIOVdRkqnIrRVTpkcSTVgBeuCUKTN+YFZkbHgLTViIkho6VE2pKMY7TUMFhEX11Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645461; c=relaxed/simple;
	bh=cwdZtGz3IXQ1EG/p34K3KVA9kUdd0ZAHJagpVOIanHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VGYHwMPGFZl0og21crruIXT+By+fjiuPYm+CmhFOK1MHcaJm/uv5vMRHNuyaYSNFfCnzL1XAbSakxvzVqOqmP8GoPmIwq5HeXFK/YJHiYOqnAnW/iabKzyiYqQBckGrv67/gC/ArMsGa4LaGvyWsoNJWjY697DK3giIQ0csmnvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqa0HdUO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqa0HdUO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0df0bb8fbso18709166b.3;
        Fri, 04 Jul 2025 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751645458; x=1752250258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWKv6PM/BcPQ/i8arO/1LhjBpgoq9M2qMlX7Y0R2Fpg=;
        b=dqa0HdUOl4yPn0qQI30b5654uN7euhxtmJGMom7096qa9qEr2dO+qKrVt3DzzjVGOT
         rRN6QVmjTmkXSTEZCv35+yrtWachzd9jYpHeU5DZyUXKY+qOG0uR5KNuT8ZsYIx7RypN
         jZC0RnoTdFh/u7RIiHlekI5gNLLcQzSBZtM+OQXO1ZmM0Uc3S4ef2eUwYT+D4sYedtbt
         L8VfBoM2MEB6iBCbcGUZHojqbARkTVtnkno4s5MZOicJkT1qD3XYfrQ6SxvLX9Co8jij
         j8uqeRCUX1JzABYBTEUdiP0A8BLX1IZ3A2CsbuVbaID8KxbqpYdxh4SzUstnQ2HQ3DrG
         qN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645458; x=1752250258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWKv6PM/BcPQ/i8arO/1LhjBpgoq9M2qMlX7Y0R2Fpg=;
        b=Xzno7llc+os9KjNfNL86iNjdU2X+LefBAiYXnbt1ygJIWuwcyqUvitv1QI6VyeJnYv
         IYNjkF9zvkPP20xYO6hdtu9mtukcu9vecEC4TGHAbUNk1Dq1pqI+2J1FWpS8kjlBSICE
         3IhxNJgtSIbuMX+P1VfwPhsMuIAa1gJgRQC8ZTmh2tuK81jvgjNtVq0DZYeXEJYxd17S
         h52lPbmRwUgFCJIS+MWgkQeEc/nN/UBPGbFdtNdN5BUVV+8pXDs6IxO/sXjtfnBAg2ri
         nq2gMpNI0CXewSk6Qrbo0QdAkJOQOjFESMQ5M8BhH/o6XIGzVbxtJq/IPIkqF7nLcZaY
         27Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUvE6YoAWLvmjXGkVayEw86WQeEZXu9s/FiwHo+R/7c0NTgLu7kWIkSm8zpKaYRnTEGZmcUZ9mcdzNXASPdxw==@lists.linux.dev, AJvYcCVz3Ss0C6fTpyAnJYC6PB1QHhhCCiowGD50g6bIQOcPac1Fw96K0+o0p3SIVHr7eiru+lm92d73ZdG0eUHmm2cnPpTywA==@lists.linux.dev
X-Gm-Message-State: AOJu0YydhHzcfpK9f/HLFccLrlhqNLAXXBSar2yKzingjLvTQiCTvER7
	GQNUZVVjmABafkTeJBtkvalrjX3pMpbUGYfeqdbGFEI7s4HHT+k7hSU5
X-Gm-Gg: ASbGncvXUvGZ+z2lgGDPQP8bz/meGxt2opFwOt2iv3aLYXQ6wQPvLALfA5PUvwReKpa
	D338w1fOKZWhBy9oGjzTcdG8bMFfMUi5Gzp5q6hFYE6Rlagif9Fzz9VobuzbZaJ8MStJVXL+GVo
	cxkvWe1CXnu2ywBZ8Snc7kFcFNvWEeYc3cg7Ictzj3qDe1uzgZBQlWlkT0Xzylwu9Tl9MYOtg1l
	BD8o1/rsH20t5jTMlvDRvKp389lcza6Po3JOuMrpg0FDYdlnLsnFhCsl0bGQDgbt7q4ZViHO43t
	KgDKN84Yn/cvU0dY/KqTiL4We9gAfPqK4+F/bGYqjd6ZUj+Rxyf0GPIGMdDU5ZAljESq08kKZgg
	oroxThtf/FwKGYFPGKuTz6IAB7NkPveLx
X-Google-Smtp-Source: AGHT+IEi7/w7Pg0qVqgIrY+90Z1GOtJ0vUjMDQm+fZE47PMuaudthmL0Fjysm83XElDu8wKctqr5kA==
X-Received: by 2002:a17:906:f583:b0:ade:40ed:9f3e with SMTP id a640c23a62f3a-ae3fbe6027amr111119666b.0.1751645457649;
        Fri, 04 Jul 2025 09:10:57 -0700 (PDT)
Received: from localhost.localdomain ([41.37.222.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b04d30sm192940066b.133.2025.07.04.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:10:57 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c
Date: Fri,  4 Jul 2025 19:10:51 +0300
Message-Id: <20250704161051.16733-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continue the cleanup of the AtomISP driver as discussed with Hans and Andy
in [1].

Tackle TODO item: "Remove custom sysfs files created by atomisp_drvfs.c":
- Remove the sysfs attributes `dbglvl`, `dbgfun`, and `dbgopt`.
- Delete their associated show/store handler functions.
- Remove the corresponding attribute group definitions.
- Keep `dbg_attr_groups[]` as an empty array to preserve compatibility.

Link: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org/ [1]
Suggested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v3:
- fix style warning
v2:
- modify the reference link line.

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

