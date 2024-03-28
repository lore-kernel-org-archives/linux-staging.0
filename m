Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95865535CA
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649518; cv=none; b=OqNHP8ruleUURYclG2CD/NgdwvowkDzPafYpXGAgwJaxDArhy6CCa42dCBd73EK40xH6fywEUe5JwPkiHufCdkeMNupjLt0P33r6xUdOsDQ+8UmPO9Uh4bMLFpnHHiEZfNvOn1qdDKL400vWjnAPyvUA6wu28aJTiguha6cav1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649518; c=relaxed/simple;
	bh=HcepYLF8BpHcMeB5V+lHzT+rlKHt1ewDB9gODL70kYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWTXPLEsjknY6KQT/kbKjQcB9zE81eTZRr0AChYG5FfgPK9G8RAAbMJjgHNVJeIWn6R+yE7GlXv1Huy3V16eEXuQrpTa9rMGoDrDlSXPaxePDqU9C5gNuRTHtLE6f8AsvKqZeRihdUiHzj6kyzbFlhixzVhmtJt8V3AynNz/vrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wSi0YqiW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wSi0YqiW"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6DF5475;
	Thu, 28 Mar 2024 19:11:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711649481;
	bh=HcepYLF8BpHcMeB5V+lHzT+rlKHt1ewDB9gODL70kYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wSi0YqiWqShNrw5+6LbqvvJtZhlckXmg7XeYA21RKREQinxyhmL2bfde9xdEkpPxF
	 xaY3Rzuf7oPF8lAuvf9KCsSrBrY+E8XUA5H8mfh1EX6r4w0iwPoU1ARMr+YWVPPshf
	 GDE5BKVW50dGLSzl+hxo6pwcNV2JbGsCN5xQrIsI=
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
Subject: [PATCH v4 03/11] staging: vc04_services: vchiq_arm: Drop g_cache_line_size
Date: Thu, 28 Mar 2024 23:41:25 +0530
Message-ID: <20240328181134.1548799-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
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

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 34 ++++++++-----------
 .../interface/vchiq_arm/vchiq_arm.h           | 15 ++++++++
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9273767f25df..0dffc36dccd7 100644
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
index 04683d98cd00..378415b205ef 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -27,6 +27,21 @@ enum USE_TYPE_E {
 	USE_TYPE_VCHIQ
 };
 
+/**
+ * struct vchiq_platform_info - Platform information related to
+ * underlying hardware.
+ *
+ * @cache_line_size: value of L2 cache line
+ *
+ * cache_line_size is the size of the L2 cache lines as understood by the
+ * VPU firmware, which determines the required alignment of the offsets/sizes
+ * in pagelists.
+ *
+ * Modern VPU firmware looks for a DT "cache-line-size" property in the
+ * VCHIQ node and will overwrite it with the actual L2 cache size, which
+ * the kernel must then respect. That property was rejected upstream, so
+ * we use a value derived from the compatible string.
+ */
 struct vchiq_platform_info {
 	unsigned int cache_line_size;
 };
-- 
2.43.0

