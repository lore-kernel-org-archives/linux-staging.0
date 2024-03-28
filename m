Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA812F391
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649529; cv=none; b=b9rQ4BucElF5sbypOHP5DQUC6Tvkth6HE9vyoukIPBoXrwRxjaZ0TM4s3GVy3JAofVwigLCYopqMPJgb0ulr4Fl+FfVd55V8it4Ad4V/gfckFnoDG1cVkb9cTtvbog5nawKbvnQ3qkn3cMtfezrBhntnJfFf/M05qdJcsYYO2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649529; c=relaxed/simple;
	bh=mt2L2yL/LQTIIRHAOE5DbvQY2a8INrmNPvCS3sE4nNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkHXwDjiQOEBx4/pnIb0XaUBvEu5774ZF7fbLoaV0UcDc0s/ji/3MjxWcGyn/0C6kP9llx6eAZg1Lcy6yjkiCjI0uv5IMC+fY0uCuCne07Av9YHjUUwFEhFhJs+2/sV6QLfGqwR0LbuKnwp24ZUtkPOHertoYHzET5cwKszbnxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UgKuOvk7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UgKuOvk7"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B7CFD20;
	Thu, 28 Mar 2024 19:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711649494;
	bh=mt2L2yL/LQTIIRHAOE5DbvQY2a8INrmNPvCS3sE4nNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UgKuOvk7UFZzP+4mXS9W6rkgZIGReCClsJih1pwNmAvirJ6D9wXIP9V5gq0wqxz1j
	 UlLcWPJ1f0RLtCrVBRSqMMqGplePuqlDTAsRBScvG3/CBOxr/KU3WIto2U17wpNVtV
	 3p8GXOfpW1AYQWpvlmNjrzrHtOLZXM4EM6qAT7Ds=
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
Subject: [PATCH v4 06/11] staging: vc04_services: Move global variables tracking allocated pages
Date: Thu, 28 Mar 2024 23:41:28 +0530
Message-ID: <20240328181134.1548799-7-umang.jain@ideasonboard.com>
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

The variables tracking allocated pages fragments in vchiq_arm.c
can be easily moved to struct vchiq_drv_mgmt instead of being global.
This helps us to drop the non-essential global variables in the vchiq
interface.

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 53 +++++++++----------
 .../interface/vchiq_arm/vchiq_arm.h           |  6 +++
 2 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 2005d392d0b7..b335948f4b0c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -130,12 +130,6 @@ struct vchiq_pagelist_info {
 };
 
 static void __iomem *g_regs;
-static unsigned int g_fragments_size;
-static char *g_fragments_base;
-static char *g_free_fragments;
-static struct semaphore g_free_fragments_sema;
-
-static DEFINE_SEMAPHORE(g_free_fragments_mutex, 1);
 
 static int
 vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
@@ -414,20 +408,20 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	    (drv_mgmt->info->cache_line_size - 1)))) {
 		char *fragments;
 
-		if (down_interruptible(&g_free_fragments_sema)) {
+		if (down_interruptible(&drv_mgmt->free_fragments_sema)) {
 			cleanup_pagelistinfo(instance, pagelistinfo);
 			return NULL;
 		}
 
-		WARN_ON(!g_free_fragments);
+		WARN_ON(!drv_mgmt->free_fragments);
 
-		down(&g_free_fragments_mutex);
-		fragments = g_free_fragments;
+		down(&drv_mgmt->free_fragments_mutex);
+		fragments = drv_mgmt->free_fragments;
 		WARN_ON(!fragments);
-		g_free_fragments = *(char **)g_free_fragments;
-		up(&g_free_fragments_mutex);
+		drv_mgmt->free_fragments = *(char **)drv_mgmt->free_fragments;
+		up(&drv_mgmt->free_fragments_mutex);
 		pagelist->type = PAGELIST_READ_WITH_FRAGMENTS +
-			(fragments - g_fragments_base) / g_fragments_size;
+			(fragments - drv_mgmt->fragments_base) / drv_mgmt->fragments_size;
 	}
 
 	return pagelistinfo;
@@ -455,10 +449,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	pagelistinfo->scatterlist_mapped = 0;
 
 	/* Deal with any partial cache lines (fragments) */
-	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && g_fragments_base) {
-		char *fragments = g_fragments_base +
+	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && drv_mgmt->fragments_base) {
+		char *fragments = drv_mgmt->fragments_base +
 			(pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
-			g_fragments_size;
+			drv_mgmt->fragments_size;
 		int head_bytes, tail_bytes;
 
 		head_bytes = (drv_mgmt->info->cache_line_size - pagelist->offset) &
@@ -483,11 +477,11 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 				fragments + drv_mgmt->info->cache_line_size,
 				tail_bytes);
 
-		down(&g_free_fragments_mutex);
-		*(char **)fragments = g_free_fragments;
-		g_free_fragments = fragments;
-		up(&g_free_fragments_mutex);
-		up(&g_free_fragments_sema);
+		down(&drv_mgmt->free_fragments_mutex);
+		*(char **)fragments = drv_mgmt->free_fragments;
+		drv_mgmt->free_fragments = fragments;
+		up(&drv_mgmt->free_fragments_mutex);
+		up(&drv_mgmt->free_fragments_sema);
 	}
 
 	/* Need to mark all the pages dirty. */
@@ -523,11 +517,11 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (err < 0)
 		return err;
 
-	g_fragments_size = 2 * drv_mgmt->info->cache_line_size;
+	drv_mgmt->fragments_size = 2 * drv_mgmt->info->cache_line_size;
 
 	/* Allocate space for the channels in coherent memory */
 	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
-	frag_mem_size = PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
+	frag_mem_size = PAGE_ALIGN(drv_mgmt->fragments_size * MAX_FRAGMENTS);
 
 	slot_mem = dmam_alloc_coherent(dev, slot_mem_size + frag_mem_size,
 				       &slot_phys, GFP_KERNEL);
@@ -547,15 +541,16 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =
 		MAX_FRAGMENTS;
 
-	g_fragments_base = (char *)slot_mem + slot_mem_size;
+	drv_mgmt->fragments_base = (char *)slot_mem + slot_mem_size;
 
-	g_free_fragments = g_fragments_base;
+	drv_mgmt->free_fragments = drv_mgmt->fragments_base;
 	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
-		*(char **)&g_fragments_base[i * g_fragments_size] =
-			&g_fragments_base[(i + 1) * g_fragments_size];
+		*(char **)&drv_mgmt->fragments_base[i * drv_mgmt->fragments_size] =
+			&drv_mgmt->fragments_base[(i + 1) * drv_mgmt->fragments_size];
 	}
-	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
-	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
+	*(char **)&drv_mgmt->fragments_base[i * drv_mgmt->fragments_size] = NULL;
+	sema_init(&drv_mgmt->free_fragments_sema, MAX_FRAGMENTS);
+	sema_init(&drv_mgmt->free_fragments_mutex, 1);
 
 	err = vchiq_init_state(state, vchiq_slot_zero, dev);
 	if (err)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 4a5b5ae9625a..a3bba245bfe2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -59,6 +59,12 @@ struct vchiq_drv_mgmt {
 	struct mutex connected_mutex;
 
 	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
+
+	struct semaphore free_fragments_sema;
+	struct semaphore free_fragments_mutex;
+	char *fragments_base;
+	char *free_fragments;
+	unsigned int fragments_size;
 };
 
 struct user_service {
-- 
2.43.0

