Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B80E483BD8
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832768; cv=none; b=hwTGDeE9bBEcbiwGBElO3RIUXQsVO2JgEzIeVBZBat1ScvOiqjcAZctDzl0JHIiTOQXvhrkmFChCK/HjLtZA6X6rJsHiCIUH1uqmEmRbZMxSGyWSpa7haVBWNfaniKMj2A6OU0WX5aeJdUi6MTLShK8NlSbbh3PG6hAUrO+GizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832768; c=relaxed/simple;
	bh=2bkdw8OxJrwnYUGhU/fhin1Aq0ZRsS8rd/JhENskV60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpdtdsqZJ5FS+CQvbn4M4zPBNTr+73fEWjxjGC8Y1S8/abli6AY/7/IX5BAW9ZZZx5ytvMyCuvAkhKMbH2GmChqUmW7bdnj+7yfOEZPTJxSZx/FQAkXnVqHWpoxrHXvhkiAjDNBMq5xDXchu56LUqSDmkzGQEDTAUlRGfwMJNMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ah/PW0n4; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ah/PW0n4"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so7661921fa.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832757; x=1785437557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75cngzgMY/OVAP7GKlxdzDklRXPgWBQ/BrWuJHHZzts=;
        b=ah/PW0n4LtGMQdaLasvQIt+c8XysFNKmuy/sbFNaxDOQzkgibthFSy6lzf8Q8/sWEH
         qDMRidqtV3nKeIMnllr5Na9cZzVRSJHZb4qCQaWewo3xENWHvOdmziRU5JkrgW9i90s8
         X33qhvRIfRBqErK1LYI6SfloWwk/jvUQYG6q8dX8n9oRxTqi7NeMk2b1IhB2Ca9Wexq0
         EkZOlePW/w/B4qhrEsrehhxh+Adf6TfgcDnmKgDm0Xggh1lKe+HOzVcIPmKxBp+ngI5c
         9zgFq/1kikWntJAZs3LWiVDQ6da6vI5qUuwx2ZgE2ni/H1FObNvidLv64/lPpksjn1qZ
         s9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832757; x=1785437557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75cngzgMY/OVAP7GKlxdzDklRXPgWBQ/BrWuJHHZzts=;
        b=j4w361T8/AEz9pUnsrV5qqIqdvtidJ0ov1N4q/ZTjlF8zMzmTW6pp49aBgjjixJ4xV
         Zu0ZF447GodqNQytXO4elY1Jj2qqSUCdvqwFKRK6pcqKB6o8E3gbyhe+NuUqqS+uLF2v
         4Mlw2US2c5BFzkS6Z1E7pnWZ29wkzbd/zmUpxB4Y3EsE4Jv+BXDrcm9YnP5yYusXocFD
         8VcQM5K88tmuNHUJiZC+1ZjiuKgR6DhpiJ+s5scyDV65XLUZpE9g21lcyAyL7zzUQtR7
         ET4721CB8U6QDbsWrNuTxKB6dTvvxct+ktGM2zD0sVM9DJCiws8Q66LqBKQT+KCSke7o
         WZSQ==
X-Forwarded-Encrypted: i=1; AHgh+RroNKWaHvhzFtwpGtcZJLUwufDqOObkSXpHKel1hD+GQE26XXmMg2Y6oDGuzb0iF15xPSYdvUTBZjRVj8mE@lists.linux.dev
X-Gm-Message-State: AOJu0YzAulLHYPFog3hRFQN+NCLKptOs9fs/WfeYsY93HGqX6J1lxznY
	tpB/n0iy9RTKZe/kAMClfeBT3G7ZrkBGX+k7q7PaYh28JF9pksYPQ75K
X-Gm-Gg: AR+sD13/v2Bvm0UsxFizwjEPyJTzSHuzCG1YTA8O0/I1eJkFpRcQj9GsGuGuhYXhA0b
	Ba1cjWjnWKrBuDl4EWWBf2efALEnXHWg4hu1FT9+2p2U20yBDjVqgZMdxlUmvLukuBlT5ZSBI88
	odZg1P7u0kADVXXtFO6srWprrFfRsQSiKUqIagweTxJbj4Aer2NDpjAs3aGFQ4DUkIZwZu9RRCN
	gXt9V89L8xO2hdg0Y0LsopDbqJwhtIq3KRWILIGAv8vYKBTMR2zYncBUvACwCGd9H8YsKSnTJv7
	IbCAxXAGHFVavF0YKTVHWj238sjDcXBD0cerOxgE7PzUoOqKAumqH+asSZX1OLFgNp0960DWSAu
	QRmYZMC5pLPeGXzVGyM8s4vzpg3vye4L2KmTH6SfjjE3FVq4PSdqGyGljxXWtAK14JUku47ZRWd
	g=
X-Received: by 2002:a2e:a88a:0:b0:39e:b257:e878 with SMTP id 38308e7fff4ca-39f07bdfdafmr9749291fa.8.1784832756862;
        Thu, 23 Jul 2026 11:52:36 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm11601731fa.10.2026.07.23.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:52:36 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 4/4] staging: media: atomisp: remove include/hmm/hmm_common.h file
Date: Thu, 23 Jul 2026 21:51:21 +0300
Message-ID: <20260723185217.317981-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723185217.317981-1-nikolayof23@gmail.com>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the last used macro with a conditional expression and remove
this header file, as it no longer contains any code that is being used.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   |  1 -
 .../media/atomisp/include/hmm/hmm_bo.h        |  1 -
 .../media/atomisp/include/hmm/hmm_common.h    | 36 -------------------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  9 +++--
 4 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_common.h

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index 6bda02b9ff85..be92a9c9046f 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/mm.h>
 
-#include "hmm_common.h"
 #include "hmm/hmm_bo.h"
 #include "ia_css_types.h"
 
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 69cf490bd88c..2a19e3b2c1f9 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -16,7 +16,6 @@
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
 #include "mmu/isp_mmu.h"
-#include "hmm/hmm_common.h"
 #include "ia_css_types.h"
 
 #define rbtree_node_to_hmm_bo(root_node)	\
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
deleted file mode 100644
index c406fe8b1345..000000000000
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Medifield PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- */
-
-#ifndef	__HMM_BO_COMMON_H__
-#define	__HMM_BO_COMMON_H__
-
-#define	HMM_BO_NAME	"HMM"
-
-/*
- * some common use micros
- */
-#define	var_equal_return(var1, var2, exp, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return exp;\
-		} \
-	} while (0)
-
-#define	var_equal_return_void(var1, var2, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return;\
-		} \
-	} while (0)
-
-#endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index e92538ab025e..dd1897cdf662 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -30,7 +30,6 @@
 #include <asm/set_memory.h>
 
 #include "atomisp_internal.h"
-#include "hmm/hmm_common.h"
 #include "hmm/hmm_bo.h"
 
 static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
@@ -389,6 +388,7 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 {
 	struct hmm_buffer_object *bo, *new_bo;
 	struct rb_root *root;
+	int ret;
 
 	if (!bdev) {
 		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
@@ -396,8 +396,11 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 	}
 
 	root = &bdev->free_rbtree;
-	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
-			 "hmm_bo_device not inited yet.\n");
+	ret = hmm_bo_device_inited(bdev);
+	if (!ret) {
+		dev_err(atomisp_dev, "hmm_bo_device not inited yet.\n");
+		return NULL;
+	}
 
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
-- 
2.55.0

