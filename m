Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE9D3218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908690; cv=none; b=VndUooV3ZLBAGDtkhaUIcjkiLojnO1hdERCI94UxWIbfKNszIaizF/vIeW6mLZK2X1SX1KIB9lBZMdQi2w1mz8RMmxUvxI6RP1qsXC4Ea8otBR4PBVHUEO59ak45cnSyOFf52HBuwMdnhav4PgY/REBViFmXxC+VO67o7bFz4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908690; c=relaxed/simple;
	bh=G+ohfpMSCh1lF6XA7Jw9v/5Zlo0lqbclORMoAh7/ONE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6k6a9ksidYruAzqGIMeWs36N0Q08lulzBxPh85MHlzSWbETS2xI566lzBne86DC63X0oLCDqtAG/GlVCNQoeCWn/rR6WTLXRTaf9HTEMAYoOuKsO5U9JEjuS0acepOM1hvU9XLU4sfZl5tSX3sj6gYfLqfTfW+EBJDHMNR9Muc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kXwXuDKj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kXwXuDKj"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E899A68;
	Fri, 12 Apr 2024 09:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908643;
	bh=G+ohfpMSCh1lF6XA7Jw9v/5Zlo0lqbclORMoAh7/ONE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kXwXuDKjnJ4UmrXeEijFtV8fOkJWaTYE/nrrGUL/YwleXVmLvu9bTx8MoYmE0Z93s
	 aR2GaDGPefnnzk0ash1kj0DiXMYQLII9GuVOpPpnKYVKfd9cZf4Azi/MDbTp0TWr6A
	 rFXF+bRHtmzdPWjqu/xqkLrwGZ4yJ6NJP238iZiM=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v5 03/11] staging: vc04_services: vchiq_arm: Drop g_cache_line_size
Date: Fri, 12 Apr 2024 13:27:35 +0530
Message-ID: <20240412075743.60712-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412075743.60712-1-umang.jain@ideasonboard.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cache-line-size is cached in struct vchiq_platform_info.
There is no need to cache this again via g_cache_line_size
and use it. Instead use the value from vchiq_platform_info directly.

While at it, move the comment about L2 cache line size in the kerneldoc
block of struct vchiq_platform_info.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 34 ++++++++-----------
 .../interface/vchiq_arm/vchiq_arm.h           | 11 ++++++
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 7cf38f8581fa..af74d7268717 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -131,17 +131,6 @@ struct vchiq_pagelist_info {
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
@@ -212,6 +201,7 @@ static struct vchiq_pagelist_info *
 create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 		size_t count, unsigned short type)
 {
+	struct vchiq_drv_mgmt *drv_mgmt;
 	struct pagelist *pagelist;
 	struct vchiq_pagelist_info *pagelistinfo;
 	struct page **pages;
@@ -226,6 +216,8 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	if (count >= INT_MAX - PAGE_SIZE)
 		return NULL;
 
+	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
+
 	if (buf)
 		offset = (uintptr_t)buf & (PAGE_SIZE - 1);
 	else
@@ -368,9 +360,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 
 	/* Partial cache lines (fragments) require special measures */
 	if ((type == PAGELIST_READ) &&
-	    ((pagelist->offset & (g_cache_line_size - 1)) ||
+	    ((pagelist->offset & (drv_mgmt->info->cache_line_size - 1)) ||
 	    ((pagelist->offset + pagelist->length) &
-	    (g_cache_line_size - 1)))) {
+	    (drv_mgmt->info->cache_line_size - 1)))) {
 		char *fragments;
 
 		if (down_interruptible(&g_free_fragments_sema)) {
@@ -396,12 +388,15 @@ static void
 free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo,
 	      int actual)
 {
+	struct vchiq_drv_mgmt *drv_mgmt;
 	struct pagelist *pagelist = pagelistinfo->pagelist;
 	struct page **pages = pagelistinfo->pages;
 	unsigned int num_pages = pagelistinfo->num_pages;
 
 	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
 
+	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
+
 	/*
 	 * NOTE: dma_unmap_sg must be called before the
 	 * cpu can touch any of the data/pages.
@@ -417,10 +412,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 			g_fragments_size;
 		int head_bytes, tail_bytes;
 
-		head_bytes = (g_cache_line_size - pagelist->offset) &
-			(g_cache_line_size - 1);
+		head_bytes = (drv_mgmt->info->cache_line_size - pagelist->offset) &
+			(drv_mgmt->info->cache_line_size - 1);
 		tail_bytes = (pagelist->offset + actual) &
-			(g_cache_line_size - 1);
+			(drv_mgmt->info->cache_line_size - 1);
 
 		if ((actual >= 0) && (head_bytes != 0)) {
 			if (head_bytes > actual)
@@ -435,8 +430,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 		    (tail_bytes != 0))
 			memcpy_to_page(pages[num_pages - 1],
 				(pagelist->offset + actual) &
-				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1),
-				fragments + g_cache_line_size,
+				(PAGE_SIZE - 1) & ~(drv_mgmt->info->cache_line_size - 1),
+				fragments + drv_mgmt->info->cache_line_size,
 				tail_bytes);
 
 		down(&g_free_fragments_mutex);
@@ -479,8 +474,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (err < 0)
 		return err;
 
-	g_cache_line_size = drv_mgmt->info->cache_line_size;
-	g_fragments_size = 2 * g_cache_line_size;
+	g_fragments_size = 2 * drv_mgmt->info->cache_line_size;
 
 	/* Allocate space for the channels in coherent memory */
 	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 7844ef765a00..04683d98cd00 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -20,11 +20,22 @@
 #define MAX_ELEMENTS 8
 #define MSG_QUEUE_SIZE 128
 
+struct rpi_firmware;
+
 enum USE_TYPE_E {
 	USE_TYPE_SERVICE,
 	USE_TYPE_VCHIQ
 };
 
+struct vchiq_platform_info {
+	unsigned int cache_line_size;
+};
+
+struct vchiq_drv_mgmt {
+	struct rpi_firmware *fw;
+	const struct vchiq_platform_info *info;
+};
+
 struct user_service {
 	struct vchiq_service *service;
 	void __user *userdata;
-- 
2.44.0

