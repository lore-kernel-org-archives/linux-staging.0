Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF833B47D2
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568131; cv=none; b=KRTFUGnDAPrnF+qaB0SjbSxMZYtB90xouClGaTDmTBaLtKSP3sHg/Z6kIbKv7Ki1Sy6+/zPojQvu9fKNoZlpSPnuVfO6gfPFonkIq2kd/C1kdXBGGEIkAh3JzlLFNgFo4yCL2UN9y4Q6a1MshZgCnr1Y3ZpY/DULyZVOPPyxBMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568131; c=relaxed/simple;
	bh=6wQICQWyKl2ibwonxaDxgd+QgHh/waAeDTj7EAFYDcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO3g4K9p+Rz86u/nySmC0+mj1/gvWVBhJNsliUotQJDmLZebR+JerscknagOFxluhaZWui7hV3PdItawvnsq7W57S6K9k2bk4Wz1kBhbh9Ihporcsg9Awq2jn3BXnN5xDUWX46YxwkqvNqUAymUlaX0peLz1mj9K/mBrSfV+vrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbV5rCsE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbV5rCsE"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b015532f7bso54777e87.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 13:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568123; x=1787172923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9idjNb9qT7I+5v2/X0Rr3tnkcDS+t1O2ybb3dbA6Ps=;
        b=PbV5rCsEjIgo6SzwJDct26urxsc/LTA76cUFIwlKmoZqfb1b+dzHm84i5lFLL1MIJV
         yDk9pKrsvTG8f8w7d/Z2mWc0FC2p/duPhddeqhbABz93oxwu6fBvsPRTPzyHXdIM+afo
         F4mCF606FiXXTsNntsvu+kN9MW0g6P63tYFbAGo78csCn1RzZNIEmy22+aU34nfgppvj
         CLgSuHx5TCPJI1mbo7RFW7nKV+hXBCGryXsIfX02eizep+jDNbTlC/RnMmNMwNiJ2cKC
         K3akNfb7wIR//J0CrcQF/JD9zlfCQXHZ0vb7rJZ3il4rQOUUg84p7l8cmdozW20WdE0a
         pDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568123; x=1787172923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L9idjNb9qT7I+5v2/X0Rr3tnkcDS+t1O2ybb3dbA6Ps=;
        b=EtUdk/J5J5xwPAPKVU3e/VX1YDYOQEgnzzJkfpNLQVSIFLy4hXvlyfQNaJ6hjMqEa2
         bN446wcRgkojtpJIXbJIkLMkbLAO/iEkYDR1vXUWL+bYj3ce/ugSfza7JPXuFub2U/QT
         m6Mm8bNSDa+iSlCvWguRu5rYkL14IpbO80GjzaYyuQKgsGI9ARpJyovNoBUY25zzPeCz
         W7xaybZ7PkN9MejcaiTs/A3GTTk54XyBY3tVv9K65LXAhEoio6xFApi2Wzf23g7GySig
         9x5vXNnhtSIwlc4mJ7UE+YUO0jK5WPfsMYhi1E5twe0SBPPD16EcNzzkJbtOG7lct3sj
         MA0w==
X-Forwarded-Encrypted: i=1; AHgh+RpRTtyliRCF8Or2e8WmKAl2d9yeSKNo5x8U693UXOVhSjcD4fRRvalsK05BIDzv6SXqdYkMDj083A88A8Rq@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh4iImB5zpHkD4A5ip2aEicPB6QUvWiIxJrHOhINpwC856cEMs
	GRfvDo+OlOt4n6DF5U/eI1s7Rd/RispKsBK+d/hg4UIiy5PJyq5q3GTrKEqCVA==
X-Gm-Gg: AR+sD10iCrShyQBBog84AozfV5qtm3guhw9VykAm2r0PXZmXafEen04tc1E9UynsDlh
	UQ6LhMLh8/zQvmujclNB5Pmpoi/TQ+oln5DHjfE2yDkimbuSYdPeg7CNHNsk9jgAw7/r/hNlWAq
	NTcwGocSktN4ja/vWRq9tzvxeAPqel2/ph/jThs98Y4MAr228MslQYbJ2vObEp/Re2AdVXYr65x
	VpDwquy5iUm/UXs4rfK7W5Vk72FfWqkGDPDDFjyWqSRCem0GldlSDBX2Ap9LQTkvSI2fUd/XVd5
	SNBvXbAt6Hd/J2lAuuKcBWRkwDQYwW/XvpbsNevk6UasPVkpzF+0MUwGk2gvxgbYSKchoSuElY4
	4Gp7O9GmB80zTtwoINnGSwMiH3ZGdGHpRU5qXoqh9nSTAscVuRiJaaOaVHXvrAMaF59++5/ucF1
	xUDbt34tNZrRcOgrsA0ZmV3WzeLb3zMzXDIbgyqN8Y4r7qEnMjjw34Z2EZyBcg82b0X6Cnzw==
X-Received: by 2002:a05:6512:8383:b0:5ae:b6b1:5fcd with SMTP id 2adb3069b0e04-5b453f37160mr41200e87.10.1786568122505;
        Wed, 12 Aug 2026 13:55:22 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:21 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 2/5] staging: media: atomisp: inline macros for checking the bo/bodev pointer
Date: Wed, 12 Aug 2026 23:51:35 +0300
Message-ID: <20260812205429.39181-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812205429.39181-1-nikolayof23@gmail.com>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros perform a pointer check. Replace it with direct conditional
expressions to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  14 ---
 .../media/atomisp/include/hmm/hmm_common.h    |   6 -
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 112 ++++++++++++++----
 3 files changed, 88 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index ba3c582a0f89..e974ab5ca2fc 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -19,14 +19,6 @@
 #include "hmm/hmm_common.h"
 #include "ia_css_types.h"
 
-#define	check_bodev_null_return(bdev, exp)	\
-		check_null_return(bdev, exp, \
-			"NULL hmm_bo_device.\n")
-
-#define	check_bodev_null_return_void(bdev)	\
-		check_null_return_void(bdev, \
-			"NULL hmm_bo_device.\n")
-
 #define	check_bo_status_yes_goto(bo, _status, label) \
 	var_not_equal_goto((bo->status & (_status)), (_status), \
 			label, \
@@ -48,12 +40,6 @@
 #define	kref_to_hmm_bo(kref_ptr)	\
 	list_entry((kref_ptr), struct hmm_buffer_object, kref)
 
-#define	check_bo_null_return(bo, exp)	\
-	check_null_return(bo, exp, "NULL hmm buffer object.\n")
-
-#define	check_bo_null_return_void(bo)	\
-	check_null_return_void(bo, "NULL hmm buffer object.\n")
-
 #define	ISP_VM_START	0x0
 #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
 #define	ISP_PTR_NULL	NULL
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index b251e96cc19d..f215130e5e17 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -51,10 +51,4 @@
 		} \
 	} while (0)
 
-#define	check_null_return(ptr, exp, fmt, arg ...)	\
-		var_equal_return(ptr, NULL, exp, fmt, ## arg)
-
-#define	check_null_return_void(ptr, fmt, arg ...)	\
-		var_equal_return_void(ptr, NULL, fmt, ## arg)
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 837077f1d229..ecd920e49488 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -36,7 +36,10 @@
 static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
 		     unsigned int pgnr)
 {
-	check_bodev_null_return(bdev, -EINVAL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return -EINVAL;
+	}
 	/* prevent zero size buffer object */
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
@@ -324,7 +327,10 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 	unsigned long flags;
 	int ret;
 
-	check_bodev_null_return(bdev, -EINVAL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return -EINVAL;
+	}
 
 	ret = isp_mmu_init(&bdev->mmu, mmu_driver);
 	if (ret) {
@@ -382,9 +388,14 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 				       unsigned int pgnr)
 {
 	struct hmm_buffer_object *bo, *new_bo;
-	struct rb_root *root = &bdev->free_rbtree;
+	struct rb_root *root;
+
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return NULL;
+	}
 
-	check_bodev_null_return(bdev, NULL);
+	root = &bdev->free_rbtree;
 	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
 			 "hmm_bo_device not inited yet.\n");
 
@@ -493,7 +504,10 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev)
 
 	dev_dbg(atomisp_dev, "%s: entering!\n", __func__);
 
-	check_bodev_null_return_void(bdev);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return;
+	}
 
 	/*
 	 * release all allocated bos even they a in use
@@ -526,14 +540,20 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev)
 
 int hmm_bo_device_inited(struct hmm_bo_device *bdev)
 {
-	check_bodev_null_return(bdev, -EINVAL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return -EINVAL;
+	}
 
 	return bdev->flag == HMM_BO_DEVICE_INITED;
 }
 
 int hmm_bo_allocated(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return(bo, 0);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return 0;
+	}
 
 	return bo->status & HMM_BO_ALLOCED;
 }
@@ -543,7 +563,10 @@ struct hmm_buffer_object *hmm_bo_device_search_start(
 {
 	struct hmm_buffer_object *bo;
 
-	check_bodev_null_return(bdev, NULL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return NULL;
+	}
 
 	mutex_lock(&bdev->rbtree_mutex);
 	bo = __bo_search_by_addr(&bdev->allocated_rbtree, vaddr);
@@ -563,7 +586,10 @@ struct hmm_buffer_object *hmm_bo_device_search_in_range(
 {
 	struct hmm_buffer_object *bo;
 
-	check_bodev_null_return(bdev, NULL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return NULL;
+	}
 
 	mutex_lock(&bdev->rbtree_mutex);
 	bo = __bo_search_by_addr_in_range(&bdev->allocated_rbtree, vaddr);
@@ -653,9 +679,12 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type,
 		       void *vmalloc_addr)
 {
-	int ret = -EINVAL;
+	int ret;
 
-	check_bo_null_return(bo, -EINVAL);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return -EINVAL;
+	}
 
 	mutex_lock(&bo->mutex);
 	check_bo_status_no_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
@@ -702,7 +731,10 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
  */
 void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 
@@ -731,7 +763,10 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 
 int hmm_bo_page_allocated(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return(bo, 0);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return 0;
+	}
 
 	return bo->status & HMM_BO_PAGE_ALLOCED;
 }
@@ -746,7 +781,10 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)
 	struct hmm_bo_device *bdev;
 	unsigned int i;
 
-	check_bo_null_return(bo, -EINVAL);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return -EINVAL;
+	}
 
 	mutex_lock(&bo->mutex);
 
@@ -823,7 +861,10 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 	struct hmm_bo_device *bdev;
 	unsigned int i;
 
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 
@@ -862,7 +903,10 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 
 void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 {
-	check_bo_null_return(bo, NULL);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return NULL;
+	}
 
 	mutex_lock(&bo->mutex);
 	if (((bo->status & HMM_BO_VMAPED) && !cached) ||
@@ -893,7 +937,10 @@ void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 
 void hmm_bo_flush_vmap(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 	if (!(bo->status & HMM_BO_VMAPED_CACHED) || !bo->vmap_addr) {
@@ -907,7 +954,10 @@ void hmm_bo_flush_vmap(struct hmm_buffer_object *bo)
 
 void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 	if (bo->status & HMM_BO_VMAPED || bo->status & HMM_BO_VMAPED_CACHED) {
@@ -922,7 +972,10 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 
 void hmm_bo_ref(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	kref_get(&bo->kref);
 }
@@ -937,16 +990,23 @@ static void kref_hmm_bo_release(struct kref *kref)
 
 void hmm_bo_unref(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	kref_put(&bo->kref, kref_hmm_bo_release);
 }
 
 static void hmm_bo_vm_open(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo = vma->vm_private_data;
+	struct hmm_buffer_object *bo;
 
-	check_bo_null_return_void(bo);
+	bo = vma->vm_private_data;
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	hmm_bo_ref(bo);
 
@@ -961,9 +1021,13 @@ static void hmm_bo_vm_open(struct vm_area_struct *vma)
 
 static void hmm_bo_vm_close(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo = vma->vm_private_data;
+	struct hmm_buffer_object *bo;
 
-	check_bo_null_return_void(bo);
+	bo = vma->vm_private_data;
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	hmm_bo_unref(bo);
 
-- 
2.55.0

