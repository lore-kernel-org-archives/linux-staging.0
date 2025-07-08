Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B272E5B3C;
	Tue,  8 Jul 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751993104; cv=none; b=kiI7GQdjI426SQAzhlbWUNBD9se0WJx+kvzAvJTOU/D+7rN15rmSCwXFBymqShqs/q7pvGJZ2UTq0jiEPPoMsp89Yml4hJdzoW/NR0iRwNDXFvJ1E0Qgn8noL8vzaRYuPXYhL1nNvSu4stuBAeqSr+Ax3eqTyFillfdX37x58Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751993104; c=relaxed/simple;
	bh=pHamtUUjOA8ryouu3snUtyAR27Apfiwqlbd0r/Sargc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pmlzHye0ATDWmEgMcP5IbRUDifWrb6W6N4++5Nju8kDYmjO9p5wt/ng0HYbLbS2h774ifWAFAwf1IUnNWGgdcxi/GOs9qi4whyFUAMlVg/fT+xT4rmhTQ6B9EWP7/fF8zwaSZbeiuZZxJMltygCvsk/YBHbpgrFgnj9LpsPTGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDsBJb6u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDsBJb6u"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45362642f3bso4718385e9.2;
        Tue, 08 Jul 2025 09:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751993101; x=1752597901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLk2b9xAs78jTwaFIbSGjv7ZXKL01z3N/m48S9+9wRQ=;
        b=TDsBJb6uSfjXzB9cs9NNEsKUu7nDaAqVsiG+uhSa3GHwA7xGLAL+R0CcM50PF0kMQp
         E8n1iqw1KxFUMkQfMz+h7O4mVtN1VuV3wS5EVChwPS8kzr8GZiETp/bNC0VVrrfQNJRn
         RSc65byfIz1zxO8Cw3UNhNmk8jcEFgacdxbrciOh2GZp304FLgQfmQTDSwOZyzzvkrpf
         50ntecCgdid0ZeuqkG5eoQnbxdzJegwBZ5Hs887FJz69OVdKqeFtYWM+eZKCaJhHE8DQ
         gcWy4kOVh7cmvAlug+TX5z037MY/hsaRQVnreLjZ7hKi5TdKYy9ENNSqauKI0SzH2cf7
         8WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751993102; x=1752597902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLk2b9xAs78jTwaFIbSGjv7ZXKL01z3N/m48S9+9wRQ=;
        b=oYuvHS7cWHdfbJUSa/fOwCBd1WVn4cTSoP4RgG2SR6iAaTiqqp7k04M5g17cJwBIOA
         +ruRluisdDjI5DakPlFS78i7+S0vp6/iaRrDdLOQIXnoDqyEWYRsBVkZGo5hfztfpgZQ
         FyA+ekKKRE6NewWYl6Icp9pLOa0Ne8/HTOVk1fYmmx+0hmU70RSh09ZsLTWBCJbovEfo
         LPZ7lgxstY0qDRfB1SlEh/xVTKscScakq2Sv0Q+kGsfK7cTVEASEwK2+BRgCAqqD4J4F
         Bm+9IqJ6Sy2mA4nrgAiZkx45V38vjLq8UUwyR7FS6ycCcVzfhZJYmkPMlc3FV+jOJahs
         I+NA==
X-Forwarded-Encrypted: i=1; AJvYcCVG9Phw3VyUmKnnXGwWnP55aSrUPX2dgK3/e7oWRanLdUSQ1F/R+S2uciQx8NC54e2pMsj4AIeTtV23FR61eEaTJjWwWQ==@lists.linux.dev, AJvYcCWUP5DI779JbCnghrLxWUu6gtKfgoTQom3rxUyxoPtkk66HnxIwm9WSLCxeitgFSzMxKp3ZODxG4pWKCKJqsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLgFj9VVX9xh0ATXyHJ3o92wW81jqVoseutXz0TDlNttYWR5Rx
	8ykxDbAnAc/9fE12mukmyUk50jow6zvooXBLjkH59KNWbwyYnIXuwlbB
X-Gm-Gg: ASbGncuXtPUzm+vHtrj9kbQbm2DNsrdccGa+pNkGnzQueDv9daVOI88/07aFzLzyC+C
	r609Bi69WazLTP5iAWOYeKyaGTV2THgYoWb62lO780FFT/SQEooIbLWghFHALrhiuALgBhh/gYA
	VH+tKu11r1daCdCxrMvMuCqqiZvaZBe5/b2V/zVziBab5tGA344EGlGUZwObjEQqyBkgKPRh5O/
	NoJwgyLc+KJjwB7dHEoLEQl2+V2gYJn5QWIA0VoaA1nsL9VtSGHeRggpxEYGDL9d6B/fU4pDrpL
	a0CGz651jaWdRnDhJsmMdYdmAvwW50DENU5c7LqnJuTANb5ihg24E+zjtTpdpwnGd5F3ZfZCYTc
	p8ux2jmYbmgeDbJU1/ox1kA==
X-Google-Smtp-Source: AGHT+IEiIM5e80NzDGvoO0PEoXobTmaoyRMDUTlMa0fnINQdt1Hc+MrCGBWhG9etfLV1Zx0zsGRGog==
X-Received: by 2002:a05:600c:3153:b0:453:6124:e70e with SMTP id 5b1f17b1804b1-454b384e532mr59938705e9.9.1751993101215;
        Tue, 08 Jul 2025 09:45:01 -0700 (PDT)
Received: from localhost.localdomain ([156.208.8.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd42sm13184563f8f.5.2025.07.08.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:45:00 -0700 (PDT)
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
Subject: [PATCH v2 2/2] staging: media: atomisp: unify HMM initialization tracking
Date: Tue,  8 Jul 2025 19:44:08 +0300
Message-Id: <20250708164408.79863-2-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250708164408.79863-1-abdelrahmanfekry375@gmail.com>
References: <20250708164408.79863-1-abdelrahmanfekry375@gmail.com>
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

This patch:
- Replaces the device-specific `flag` with a boolean `initialized` field
- Removes the global `hmm_initialized` variable
- Eliminates the hmm_bo_device_inited() helper function since we can
  now simply check the boolean
- Removes the redundant hmm_init() call from __hmm_alloc() since its 
  always called after hmm_init()
  
Tested by:
- Building the Driver.
- Applying to media-committers [1] tree.


Link: https://gitlab.freedesktop.org/linux-media/media-committers.git [1]
Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- replaces the init state enum used in v1 with boolean
- moves setting the flag uninited to hmm_bo_device_exit()
  
v1: https://lore.kernel.org/all/20250707140923.58935-3-abdelrahmanfekry375@gmail.com/
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

