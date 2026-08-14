Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7947FB0E
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720291; cv=none; b=Qq+F+AqHz9FL50cPYOAgInZB7s0hQB2MK3xHFjU5uJ1+fzeMUdbUPfLDRCkv93PGd2IIbAd0k9NSF/HNGTFDCyCt27qH9VdjMhPNlKVafXPXAhfdNGyZZl2kCRcl/qdhnhdVFdazf39SR3GWIJdaF/UVojpaihuW/G9+P5ty/cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720291; c=relaxed/simple;
	bh=Zb0JdRTTBpBFvd+zpRkd3VNQu6Q9tb1qFNVb5sh9jvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O71+WiPpcxl5aJ2fY3ICI6LSTYizEJ7ZZZuj+4HS3C5IYqJWXIzVUImDnr33ozGEf+dnwnQWb/MM/vuRvpHSlZJk57eIck90yUzSIZoUbNYQMR10p/h3CQHwd8RAGb4w0psaVObD3+b2emfOa9eFcOwRKQUHmR5Hx1iqoqKrNJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9L1qouV; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9L1qouV"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39f20d19895so7662321fa.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720287; x=1787325087; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhSnA/jaMSVMwo72ij4kRp0HfOxnSGz5aEjAkXrBOFU=;
        b=W9L1qouVVe8BhkwWhDZr0X0R716rPAVEdM6Q5FIkLwTrcJhX/uAIKKhFJ2aw0HM+MR
         8hSeNjY5XeX29yziFFjvW3pw4Az3nJe8JZDRI/5Wb2ZZvZ960Ix3o7dNGsAAT1t3abhI
         bk12bih+AVNU8UN8BwkJuasrcrnjTBNDcgqDU5IqpXD2atpCfpT1wlTUTzCVBOJs29FD
         OSHSOR/2vwKGXRajAyOBnHIkoYVnBhUIK7mBkzmHcn/dNQpfoOTFSO8Ru78F8qCoqXFh
         nBO6DHjjSTO3KqyL7qANZJfx3UGvqcKZ5BIV1kbzQ/6xTwmfD+TUMBQLVYAY9+hfZ6Q0
         eGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720287; x=1787325087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhSnA/jaMSVMwo72ij4kRp0HfOxnSGz5aEjAkXrBOFU=;
        b=OtYjtkEsBJtwcLNgOpeTQvr+ZaTE/Jq011bhxGnwJDTCuXWdddFXC5zfx7nm4lNVlX
         TjaMDDGINE116DALpEGOothhC3wxdf7clK0z1zX4z3BWIHFny7qoPd8mNFLg8/K8mEoF
         opwnk8KdBkiJ/apRCkg5q2wPu8qX0M4Mf3+pPognF4/7p3N+ygjyyxo5Dg5kOkQYlhEg
         1GIejpW0DKiugEcJugMGT9Ga8UZMWF1Di6ZG+fSpZoZmokOqvS7qm1wujPFaXPwCgBHr
         56GwrjjrqOAvKsPM9wctim/C/vvNcXOCzz+mbwoyvoe6ZvqXko3PF9l9zj4XTjLqcuW/
         yERA==
X-Forwarded-Encrypted: i=1; AHgh+RpLviNuxX0MKzPp+DVOTRDJ3GHV8n3ePrnnxnYzI4w/9XvmoB4mz/TpEWq3Y3faRA6lVyIFPbml+YUtuBKU@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb4T8pAfz8A/WOyL4dCJ0HdiCgt0VVSYqIyLKMuqNmb0e+pCbl
	MABUtmJk92aCUZdW36AJllIK+UeTPUSSGb5tZ7icQn/MtoI3x1y5bQwX
X-Gm-Gg: AR+sD10fZoQ6BaxAdvOID5mxpQi8dWtsUISEzJwW1ia2ehy0HP30ZJimzam7TvhWmoR
	XlTs1htmB7sleEZGLqeTusde7+fxEYa3oOctFem8QRgAkLDetz/6nmBu3MxcOlzrFouoPMFyM/8
	L4YaiJ5cXYyrZw2EpvObFQufrbFAIlxRPI7di4JjMInd79ol+Fq+EMFCT1NF7ZXtyQDlxmcRMcc
	dLCaZMyEnlRKmLy7uTFvMV5MiQbQcLNYk7GTu0TrJqa2/qc5+gVeJ1oQxQetHvuG6C8Mfl2KvSY
	Xz+SUMnhFz8Yntv8jonWJ1g/sp/jnGMqgNpHymbp8wgr08a4GVCCqaurDlIaJFw3I7DYqGACSRp
	HnNO9kN38RfqouylDN0IHP+GF1CyS95jQAIlZK3OYRyq4jKz3cA7XOO0XWi3/U9cmgZjijk8zcU
	yjYZCwaJUtzaVB9btnf2i2uzlbucxiT9KlPddjKyv9tS96/eUn1Khajh0ckXTkJdVUsnEzqw==
X-Received: by 2002:a2e:be85:0:b0:39c:8124:93b0 with SMTP id 38308e7fff4ca-3a1323d507bmr6746051fa.7.1786720287081;
        Fri, 14 Aug 2026 08:11:27 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:26 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:09 +0300
Subject: [PATCH v4 2/5] staging: media: atomisp: inline macros for checking
 the bo/bodev pointer
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-2-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=8419;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=Zb0JdRTTBpBFvd+zpRkd3VNQu6Q9tb1qFNVb5sh9jvk=;
 b=65vpxuAVvuqdRi/k+3qLyhNb5H++kFh8R8LHKfTviMxK1fGP2z3RoVvectNgNU6hv6+rA3Ccz
 3meV1B1nqTFCFoON7mmV2W7gi6jIZODVXXwUROxYkhCLi9M6/T/OnoH
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These macros perform a pointer check. Replace it with direct conditional
expressions to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 14 ----
 .../staging/media/atomisp/include/hmm/hmm_common.h |  6 --
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 96 +++++++++++++++++-----
 3 files changed, 76 insertions(+), 40 deletions(-)

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
index fd40e64e660e..9b29b6381abf 100644
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

-- 
2.55.0

