Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0BE14284
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 10:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017491; cv=none; b=mskj7OQbaiKL3kpy3Rasn7rKnGqhhTEkCilt3eXM0LXstHZst3wzTRxeZIEdF0kqhLjoE6GkoZe6k7jONzBE3CTWTqbZEebiO3RYn9YTxslzvqyur8QiqUAAN/jnxxXgHgaPIoWTA4c+mDuPg3RuQ6IWtfGxZsOtxcVUJ5Mfub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017491; c=relaxed/simple;
	bh=43e39Dgfe0eQlpPbovIOeYL1rL5mFfyr+x2U9JxOtQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mK3WZ3Fgz+QUDYU8pMK+Kjly3bOCIxR+tu6W60M3cRorW7IgGefzaxqJz8uolASJlj9c87IvIJOseiFh9+/DMaZPMspDbxm8MAAa0YZye+m4D9ZofBIZCjlrC3oAavjZ2axeJrXk3JV86GqfWBKegHpUVcu8+oYYJ/+m9VWWYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fx6ZG+8c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fx6ZG+8c"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B24612B3;
	Thu, 21 Mar 2024 11:37:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711017460;
	bh=43e39Dgfe0eQlpPbovIOeYL1rL5mFfyr+x2U9JxOtQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fx6ZG+8ceE0EfQLgEEfbWQwoV8qd3mxQmrOVwjHsrq7qu1zzD9FfQhI2BQOVmE8z4
	 tjv19MOLNFdPx4EFEZrY/caQZbiSUN43HTzozBuQmVvaGrsThh3n/ECLW7tfgM78RZ
	 Yut8uMIaeUfH9XU6R+qYzrr86WXCWlifIv3lPfZg=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 3/6] staging: vc04_services: vchiq_arm: Drop g_cache_line_size
Date: Thu, 21 Mar 2024 16:07:37 +0530
Message-ID: <20240321103740.808561-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321103740.808561-1-umang.jain@ideasonboard.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cache-line-size is cached in struct vchiq_platform_info.
There is no need to cache this again via g_cache_line_size.
Instead use the value from vchiq_platform_info directly.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 49 +++++++++++--------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 73405a1f50ee..01b4e4b010c6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -71,6 +71,17 @@ static struct vchiq_device *bcm2835_audio;
 static struct vchiq_device *bcm2835_camera;
 
 static struct vchiq_platform_info bcm2835_info = {
+	/*
+	 * This value is the size of the L2 cache lines as understood by the
+	 * VPU firmware, which determines the required alignment of the
+	 * offsets/sizes in pagelists.
+	 *
+	 * Modern VPU firmware looks for a DT "cache-line-size" property in
+	 * the VCHIQ node and will overwrite it with the actual L2 cache size,
+	 * which the kernel must then respect.  That property was rejected
+	 * upstream, so we have to use the VPU firmware's compatibility value
+	 * of 32.
+	 */
 	.cache_line_size = 32,
 };
 
@@ -130,17 +141,6 @@ struct vchiq_pagelist_info {
 };
 
 static void __iomem *g_regs;
-/* This value is the size of the L2 cache lines as understood by the
- * VPU firmware, which determines the required alignment of the
- * offsets/sizes in pagelists.
- *
- * Modern VPU firmware looks for a DT "cache-line-size" property in
- * the VCHIQ node and will overwrite it with the actual L2 cache size,
- * which the kernel must then respect.  That property was rejected
- * upstream, so we have to use the VPU firmware's compatibility value
- * of 32.
- */
-static unsigned int g_cache_line_size = 32;
 static unsigned int g_fragments_size;
 static char *g_fragments_base;
 static char *g_free_fragments;
@@ -211,6 +211,8 @@ static struct vchiq_pagelist_info *
 create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 		size_t count, unsigned short type)
 {
+	struct platform_device *pdev;
+	struct vchiq_drv_mgmt *drv_mgmt;
 	struct pagelist *pagelist;
 	struct vchiq_pagelist_info *pagelistinfo;
 	struct page **pages;
@@ -225,6 +227,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	if (count >= INT_MAX - PAGE_SIZE)
 		return NULL;
 
+	pdev = to_platform_device(instance->state->dev->parent);
+	drv_mgmt = platform_get_drvdata(pdev);
+
 	if (buf)
 		offset = (uintptr_t)buf & (PAGE_SIZE - 1);
 	else
@@ -367,9 +372,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 
 	/* Partial cache lines (fragments) require special measures */
 	if ((type == PAGELIST_READ) &&
-	    ((pagelist->offset & (g_cache_line_size - 1)) ||
+	    ((pagelist->offset & (drv_mgmt->pinfo->cache_line_size - 1)) ||
 	    ((pagelist->offset + pagelist->length) &
-	    (g_cache_line_size - 1)))) {
+	    (drv_mgmt->pinfo->cache_line_size - 1)))) {
 		char *fragments;
 
 		if (down_interruptible(&g_free_fragments_sema)) {
@@ -395,12 +400,17 @@ static void
 free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo,
 	      int actual)
 {
+	struct platform_device *pdev;
+	struct vchiq_drv_mgmt *drv_mgmt;
 	struct pagelist *pagelist = pagelistinfo->pagelist;
 	struct page **pages = pagelistinfo->pages;
 	unsigned int num_pages = pagelistinfo->num_pages;
 
 	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
 
+	pdev = to_platform_device(instance->state->dev->parent);
+	drv_mgmt = platform_get_drvdata(pdev);
+
 	/*
 	 * NOTE: dma_unmap_sg must be called before the
 	 * cpu can touch any of the data/pages.
@@ -416,10 +426,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 			g_fragments_size;
 		int head_bytes, tail_bytes;
 
-		head_bytes = (g_cache_line_size - pagelist->offset) &
-			(g_cache_line_size - 1);
+		head_bytes = (drv_mgmt->pinfo->cache_line_size - pagelist->offset) &
+			(drv_mgmt->pinfo->cache_line_size - 1);
 		tail_bytes = (pagelist->offset + actual) &
-			(g_cache_line_size - 1);
+			(drv_mgmt->pinfo->cache_line_size - 1);
 
 		if ((actual >= 0) && (head_bytes != 0)) {
 			if (head_bytes > actual)
@@ -434,8 +444,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 		    (tail_bytes != 0))
 			memcpy_to_page(pages[num_pages - 1],
 				(pagelist->offset + actual) &
-				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1),
-				fragments + g_cache_line_size,
+				(PAGE_SIZE - 1) & ~(drv_mgmt->pinfo->cache_line_size - 1),
+				fragments + drv_mgmt->pinfo->cache_line_size,
 				tail_bytes);
 
 		down(&g_free_fragments_mutex);
@@ -478,8 +488,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (err < 0)
 		return err;
 
-	g_cache_line_size = drv_mgmt->pinfo->cache_line_size;
-	g_fragments_size = 2 * g_cache_line_size;
+	g_fragments_size = 2 * drv_mgmt->pinfo->cache_line_size;
 
 	/* Allocate space for the channels in coherent memory */
 	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
-- 
2.43.0

