Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D915528DB5D;
	Sat, 12 Jul 2025 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347636; cv=none; b=VkrhJtKtHBkGPSexezHya405RskBCaDRkVPMK2OCQD5lacGNHFfwmBW3OM7fGnLdlQt191v8B9aNYIZxZvQKQGk+50Bm5UktcPEeiJPbBoImdAQ00yjxhw3HPkCOvJKXvbUHFnVgfzt8Rg5YIlYYQby0kfVwzjBCI22I8NvEAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347636; c=relaxed/simple;
	bh=OTZbWuBUP0apZL41jRuXYeU7ZawKrlOCNUiC4UM4KSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jzHXw0uTgKoquhlxcs2zszmIXJLwWiGr7JNv1GUa+FekNavw2IRrwjiikk2jB4GWkJtiL31QW9St7LA5+o2yPNVBc1SxiUC9TuJqenLxyd6TT/ZtgwxBgZVlcm3l2uzeSs6gJYhSzfqMIF9kJhu9ZOgIPvVk0ak7YXeVVz+gVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWwJajhS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWwJajhS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e62619afso319959f8f.1;
        Sat, 12 Jul 2025 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347633; x=1752952433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0pvYq16cvHI4govEM6VgKCqJMNYGnXFAARo3AapR7A=;
        b=gWwJajhShFF2bSR12o3aqKJ1yqJ5r/BANA9ckW479w8OnOAEy6vb6NLCVp0ApGfYaD
         GGSFwee7yNMU4599AzP8oH7FmMJnbFup/zRidWemcQuqK3SHfFgZGK1V/ytWucY8VnWd
         YE0ii9UPP7nEkkOnEEYoSe8rynDHMeX3lmnyYPaajZoNduZU0GUsMmsUg7rr5a3tHEVT
         3jfOxs5HZltrH16AJWno2OCgXOqUXyrCpQmLRzDqP/iN/BhqE3tLV8FKz3AriMJu9RYz
         9RmePFnjouH3ht1Pvtx7GKhTCod5/KM4N5CQL58N0WKPI2oSHwMF7h4q3N5fHhlcm/2z
         Tv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347633; x=1752952433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0pvYq16cvHI4govEM6VgKCqJMNYGnXFAARo3AapR7A=;
        b=Xn51T5Y/qQ8d8mzwTGflAIBKGcrka/v7GdyaDqI6m1nedGY5wv22TZJBDhhq4gIlIC
         QyOyBrDqx1WP43TdkUWlKpAX+vToeiiM4tdAYBdQ9kZ2nbn0x5KAWXNAGZt4xR3qC+sL
         KN6v9+40qCWJEGZ/SuOq1QRSwzrvx50YiRO5ejvEGKU+dGKrg57F0T0BKxsS+vYZci30
         K1F+fa6vBi6sTBgH6IcyEs8+MqCfr2g7U2t5kJsErDfRDHxoOJt4jDn1J18tc5F9KjXr
         zHaXOrJ11Tuh5E5jK8Cvv2q3GkdAauAPL7pGEA7ml8hEZQphH6zZk6PCNcck8S1i0l2J
         7vgA==
X-Forwarded-Encrypted: i=1; AJvYcCUWD+ZeUrhcg0szg14094Xqybfd1jaTVJEfTDIqj4+maquchz1eqD/2lg7imD+PxNl0tGDUkcVuBwgCoYvJqA==@lists.linux.dev, AJvYcCVWDzdBSxgZFwaJ+06e2VKlM9/Jjr5z0I1LK8lKmVFA1Q1zl/6Yzi543/KMZeG02Ra9B32Pi167e07a6Ulm4nDEhAgE1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAyVA+LrP7pvzVcvM1pYKyGLP7NUiHRt6WXPq7EwUit/EMpMRG
	Y/9D2Iq04KFZJx94hfAgCNf3k5j/D91X+BNQgnOOm26iqaDpwA88du9I
X-Gm-Gg: ASbGncu82i4Q+BCsxc+GFz86L5Kj8ZgXREGDMZMUWYMM7qzyRIb7e8dhr2GDMuUi0KZ
	82QHyl2+MlRZadmRmZPGy3IYoMnUByAG56VjYAlI6k6MI5RCAiFTmYUw2A045dnKV1oaIpw7E4x
	R+XAg+bRweutNNQ9Wjg4g7z6mrV0uuL+ZhgkeoldoJslUs84uSQLR+KQ1EPJHonlp9gXZMbzPg7
	4optb5/QwoFYcp4LhkHu1QdjxOlYcK9JFAw+NdRbaydgb8UsA0QOAeP04LhZ8JY8Ghp1l2+1CXB
	omuVuOJ10vj0ZvrLFStptrZiVT1dPKcUAFfO7PzOzdTmQnB05zNl6PTuvtIZgRSJq4EfYmr7ib5
	bopKHYixVgsFh+S7ABcGnYe7fskvG4hdHTwIfLHqd1lPTJ/dPDCAnvKDo4Q==
X-Google-Smtp-Source: AGHT+IF4xHdrbMof8MSup6DPX1MvMV0SmDtV4pn1bO4gAJpdVgg+02aR+oiNNd7QW5WZw915Yrod9Q==
X-Received: by 2002:a05:6000:2f84:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3b5f2db436cmr1967373f8f.3.1752347632831;
        Sat, 12 Jul 2025 12:13:52 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:52 -0700 (PDT)
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
Subject: [PATCH 2/3] staging: media: atomisp: unify HMM initialization tracking
Date: Sat, 12 Jul 2025 22:13:24 +0300
Message-Id: <20250712191325.132666-3-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HMM subsystem previously used two separate mechanisms to track
initialization state:
1. A global boolean `hmm_initialized` in hmm.c
2. A device-specific `flag` in struct hmm_bo_device with magic values

This dual approach was redundant and error-prone. Additionally, a
redundant hmm_init() call existed in the allocation path.

- Replaces the device-specific `flag` with a boolean `initialized` field
- Removes the global `hmm_initialized` variable
- Eliminates the hmm_bo_device_inited() helper function
- Removes the redundant hmm_init() call from __hmm_alloc()

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm_bo.h  | 11 +++--------
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 11 -----------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c  | 17 ++++++-----------
 3 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e09ac29ac43d..ac556c1d71bb 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -58,8 +58,6 @@
 #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
 #define	ISP_PTR_NULL	NULL
 
-#define	HMM_BO_DEVICE_INITED	0x1
-
 enum hmm_bo_type {
 	HMM_BO_PRIVATE,
 	HMM_BO_VMALLOC,
@@ -86,7 +84,9 @@ struct hmm_bo_device {
 
 	/* list lock is used to protect the entire_bo_list */
 	spinlock_t	list_lock;
-	int flag;
+
+	/* boolean to indicate whether the bo device is inited or not*/
+	bool initialized;
 
 	/* linked list for entire buffer object */
 	struct list_head entire_bo_list;
@@ -142,11 +142,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
  */
 void hmm_bo_device_exit(struct hmm_bo_device *bdev);
 
-/*
- * whether the bo device is inited or not.
- */
-int hmm_bo_device_inited(struct hmm_bo_device *bdev);
-
 /*
  * increase buffer object reference.
  */
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 97c7ce970aef..8d64e5fd812c 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -26,7 +26,6 @@
 
 struct hmm_bo_device bo_device;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
-static bool hmm_initialized;
 
 int hmm_init(void)
 {
@@ -39,8 +38,6 @@ int hmm_init(void)
 		return ret;
 	}
 
-	hmm_initialized = true;
-
 	/*
 	 * As hmm use NULL to indicate invalid ISP virtual address,
 	 * and ISP_VM_START is defined to 0 too, so we allocate
@@ -63,7 +60,6 @@ void hmm_cleanup(void)
 	dummy_ptr = 0;
 
 	hmm_bo_device_exit(&bo_device);
-	hmm_initialized = false;
 }
 
 static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
@@ -73,13 +69,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	struct hmm_buffer_object *bo;
 	int ret;
 
-	/*
-	 * Check if we are initialized. In the ideal world we wouldn't need
-	 * this but we can tackle it once the driver is a lot cleaner
-	 */
-
-	if (!hmm_initialized)
-		hmm_init();
 	/* Get page number from size */
 	pgnr = size_to_pgnr_ceil(bytes);
 
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 5d0cd5260d3a..aabb2a126caa 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -373,7 +373,7 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
-	bdev->flag = HMM_BO_DEVICE_INITED;
+	bdev->initialized = true;
 
 	return 0;
 }
@@ -385,9 +385,10 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 	struct rb_root *root = &bdev->free_rbtree;
 
 	check_bodev_null_return(bdev, NULL);
-	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
-			 "hmm_bo_device not inited yet.\n");
-
+	if (!bdev->initialized) {
+		dev_err(atomisp_dev, "hmm_bo_device is not initialized!\n");
+		return NULL;
+	}
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
 		return NULL;
@@ -522,13 +523,7 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev)
 	kmem_cache_destroy(bdev->bo_cache);
 
 	isp_mmu_exit(&bdev->mmu);
-}
-
-int hmm_bo_device_inited(struct hmm_bo_device *bdev)
-{
-	check_bodev_null_return(bdev, -EINVAL);
-
-	return bdev->flag == HMM_BO_DEVICE_INITED;
+	bdev->initialized = false;
 }
 
 int hmm_bo_allocated(struct hmm_buffer_object *bo)
-- 
2.25.1

