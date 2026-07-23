Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4A474264
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 18:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832759; cv=none; b=ZJLTzOQE7/RXSClx0jOMrTmxUNVgvFoE14tBaXpC5gO4qCPUo5iw3y51vmnod1+ECMpPe2ndO3d68U8Z9GlsmAF2MdxN5s4rHsIvnCyn4VhCMjEtQyhVkI+buoxUq+1e7o3Yu0kzbEvcZnKin77bVtKc93LAKpM/v+bALtIIXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832759; c=relaxed/simple;
	bh=OVmx7bz1anzh7SJEzCCdyFNH42oX0UnoJzEUACuGO0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJfTv2yIaVWgyk/u74IKlhf+KGbZ97to7w/Yl9BiUu7a7wRw9PvGQvuD14uzl1z+dNy8lyNXifyfm28QiFPNRzVCf7sdnyupBdN/mqhDit3kp3lLTyz3ogLdBLI0LvMUkwtJTHVDK4p3xtlHynpqVBAQYYOFE7tpEB2jD9bIJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjJfEcYo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjJfEcYo"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39dbe684115so6449651fa.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832749; x=1785437549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfpo1gIaGV53zHpPh1d3zVcmwfOmBbYJTZ53Q0pKaz8=;
        b=WjJfEcYoWioS+sPM2Td1jcRS0QPUJDqBNoo8kOuD0h0BGOtUI4Iii/hYaRBAFSLAst
         ZOmqwNKwSSV1DwLY7SFbMd9ISYrsp63nb9t04rmsGVb74C3TKRvUZUseXclHh9uSrpcS
         iWQp2G3AGuNI2QgwSMgD5JVgNcEhpW7sO8Mbzs89qiUSdSTYMmMr9LusAN6PAwmC+Ve1
         S2SFqWzcd1zoVd3DWmRg4+G9nMmINRK9ymG72LyrtrddKRogCm+9Xx6Xzm2JHr4Pzceh
         k6Hwk4y9l3xc/I3+Dlzy1CmXSpDibJGrV6og++1KxZ/kB5R6DwJIi6CGRJl29b2vI0eF
         ur3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832749; x=1785437549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfpo1gIaGV53zHpPh1d3zVcmwfOmBbYJTZ53Q0pKaz8=;
        b=oulu/gT3Ik698wYlJWzbFPCK/SDggARsbSeHkJU4e2QJg7z1Z00Y+1CXxb+YwY7jX9
         JpQSP+kIlyBgEG5era5+blnu0W7NOPJXaak+BwXAKr0W3iRqAQeHN9JFLvkv0CoseUsE
         MtEAuBr2lkJFAH9JRmZD4SX3qpT+feXS3/F1ZRWiy7g6zyhqIr/uXHYWo9wNyi5GS1TB
         rB8vnKT6u1WOOxY1t2Rr/QE3uZu58Bv1SUUBlJ1OsdMnBAERHoUMgCozBlzolBAQosuw
         7EcSj/icCBYnKvvx4i2AF29+o9gV8/PH96Heymtvu/ptyC1RdCNMJdwmPbcEiu71ARaf
         2tXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrgth+REPlkBzcUSX+AyO+fZksyKRXKQlO+wQBHc+teoqrQyv7J7YiSehCV0GOFt9aY1mVkveNETuMifDTU@lists.linux.dev
X-Gm-Message-State: AOJu0YxTTWEIcukIxVPEsNtkinWi6bbZy7RBQfuhouOSExYeauHqe1ZC
	9e4ll3/0sZwtr7eoQWGilpf5n3znptOUd8dQaBsxdlatOWFQmf3eOrp1
X-Gm-Gg: AR+sD12Q+sPf55ajo3EHGRXe0LW2OpEJDHcXl0dcwn6wGY/pa7kk2LicVFVCROSXsuS
	sArevEqe1fp/Y+8jGu5BS3tFNW/zWN5V3umRwrJ/M+GG1cK22llBeCZyP8FVeY1hMIiyMnmDNbP
	VdlYRpvQz9jtCpnhtmAGl4puRkGTv+ctqz26M+DhUTJNY1OmGe33mwVxTBzLo3y0KhFKqWxmSWL
	gtSxepBzFJYNs/KVwFN+s2HJkbzBpNHJIiwXrbbXw5dvnduV9qQG74DgPPH0EIN1o7/B0tNxbwh
	OcuMGwrlMmocaHTKFlJY6LQK4J6b2yi/3l+S7VIol6z8Q6tj7JRukW5TH4469KhFY2vE2lTyjRf
	1JpXM3zRc/4OwhQzmq1DaB0fu6NZLF76vwNIDH7HTQyfdPqTq2R135uqKE/T83vH484d3zeaZp3
	wHz9rnv+9iXw==
X-Received: by 2002:a2e:b887:0:b0:39c:753a:853f with SMTP id 38308e7fff4ca-39f0948cf0bmr7754951fa.3.1784832749380;
        Thu, 23 Jul 2026 11:52:29 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm11601731fa.10.2026.07.23.11.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:52:29 -0700 (PDT)
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
Subject: [PATCH v2 2/4] staging: media: atomisp: inline macros for checking the bo/bodev pointer
Date: Thu, 23 Jul 2026 21:51:19 +0300
Message-ID: <20260723185217.317981-3-nikolayof23@gmail.com>
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

These macros perform a pointer check. Replace it with direct conditional
expressions to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  14 ---
 .../media/atomisp/include/hmm/hmm_common.h    |   6 -
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 104 ++++++++++++++----
 3 files changed, 83 insertions(+), 41 deletions(-)

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
index 837077f1d229..b9949cc080e5 100644
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
@@ -655,7 +681,10 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 {
 	int ret = -EINVAL;
 
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
@@ -937,7 +990,10 @@ static void kref_hmm_bo_release(struct kref *kref)
 
 void hmm_bo_unref(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	kref_put(&bo->kref, kref_hmm_bo_release);
 }
@@ -946,7 +1002,10 @@ static void hmm_bo_vm_open(struct vm_area_struct *vma)
 {
 	struct hmm_buffer_object *bo = vma->vm_private_data;
 
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	hmm_bo_ref(bo);
 
@@ -963,7 +1022,10 @@ static void hmm_bo_vm_close(struct vm_area_struct *vma)
 {
 	struct hmm_buffer_object *bo = vma->vm_private_data;
 
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	hmm_bo_unref(bo);
 
-- 
2.55.0

