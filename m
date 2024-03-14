Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3806CDC1
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410801; cv=none; b=jrbo8wCa8WIgfp0xrOQLOYuuV4GncR6yhhanDOaywO5VRbBKFYddNeVs2bmiOnq9N0RBncZByITaHIDOmC1gSIcLe4Xb/HCpL//yOH5Ye72AH7oHVfnIMaoSOdKFWAk3Augs8ChgF3phxM/SL559DxorOCnwfeZVOxOD1+iRdz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410801; c=relaxed/simple;
	bh=QybIrJ4Jw9SqDY3j3rSIj7Xq148iB40tcl3axlvfZAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrTYfef762HAFiDZzJgrH+M+ND+ZsJSDYOLESDKWsoDIxEB0sdyYx76DFkH8XBGIXzWuh9/IhhNLMShKF9wDS/IVyHkNDh6mpvNIpu6uSjrOcfnC+CduIW505cEYJNUdhQQwQ+vmUZC7w4ZvQmX+XXAXWgWoQ481ktc+jtHSaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o6Ldsq3l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o6Ldsq3l"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4F28720;
	Thu, 14 Mar 2024 11:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710410775;
	bh=QybIrJ4Jw9SqDY3j3rSIj7Xq148iB40tcl3axlvfZAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o6Ldsq3lf8F735MIXj0HkNmXOIFMcKYqSPA/3JsWYkql6PSej7OSF4qWzHCA2rbIo
	 wqckrcN1Y3a49f8Y8G4ID6RmNDx4jvhgU17xa+MITThJxOzNQr2EPvj09Y7VC2qsQ6
	 CqnrjiYNlCtfJmZz/IWJp2gIYq1rRzywknFx2Sw4=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 5/6] staging: vc04_services: Drop global variables tracking allocated pages
Date: Thu, 14 Mar 2024 15:36:06 +0530
Message-ID: <20240314100607.336009-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314100607.336009-1-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variables tracking allocated pages fragments in vchiq_arm.c
can be easily moved to struct vchiq_drvdata instead of being global.
This helps us to drop the non-essential global variables in the vchiq
interface.

Drop the TODO item as well, as it is now totally addressed:
> Get rid of all non essential global structures and create a proper per
  device structure

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO  |  8 ---
 .../interface/vchiq_arm/vchiq_arm.c           | 53 +++++++++----------
 .../interface/vchiq_arm/vchiq_arm.h           |  6 +++
 3 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 05eb5140d096..15f12b8f213e 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -41,14 +41,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
 
-* Get rid of all non essential global structures and create a proper per
-device structure
-
-The first thing one generally sees in a probe function is a memory allocation
-for all the device specific data. This structure is then passed all over the
-driver. This is good practice since it makes the driver work regardless of the
-number of devices probed.
-
 * Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 282f83b335d4..666ab73ce0d1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -140,12 +140,6 @@ struct vchiq_pagelist_info {
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
@@ -376,20 +370,20 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	    (drvdata->cache_line_size - 1)))) {
 		char *fragments;
 
-		if (down_interruptible(&g_free_fragments_sema)) {
+		if (down_interruptible(&drvdata->free_fragments_sema)) {
 			cleanup_pagelistinfo(instance, pagelistinfo);
 			return NULL;
 		}
 
-		WARN_ON(!g_free_fragments);
+		WARN_ON(!drvdata->free_fragments);
 
-		down(&g_free_fragments_mutex);
-		fragments = g_free_fragments;
+		down(&drvdata->free_fragments_mutex);
+		fragments = drvdata->free_fragments;
 		WARN_ON(!fragments);
-		g_free_fragments = *(char **)g_free_fragments;
-		up(&g_free_fragments_mutex);
+		drvdata->free_fragments = *(char **)drvdata->free_fragments;
+		up(&drvdata->free_fragments_mutex);
 		pagelist->type = PAGELIST_READ_WITH_FRAGMENTS +
-			(fragments - g_fragments_base) / g_fragments_size;
+			(fragments - drvdata->fragments_base) / drvdata->fragments_size;
 	}
 
 	return pagelistinfo;
@@ -421,10 +415,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	pagelistinfo->scatterlist_mapped = 0;
 
 	/* Deal with any partial cache lines (fragments) */
-	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && g_fragments_base) {
-		char *fragments = g_fragments_base +
+	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && drvdata->fragments_base) {
+		char *fragments = drvdata->fragments_base +
 			(pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
-			g_fragments_size;
+			drvdata->fragments_size;
 		int head_bytes, tail_bytes;
 
 		head_bytes = (cache_line_size - pagelist->offset) &
@@ -449,11 +443,11 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 				fragments + cache_line_size,
 				tail_bytes);
 
-		down(&g_free_fragments_mutex);
-		*(char **)fragments = g_free_fragments;
-		g_free_fragments = fragments;
-		up(&g_free_fragments_mutex);
-		up(&g_free_fragments_sema);
+		down(&drvdata->free_fragments_mutex);
+		*(char **)fragments = drvdata->free_fragments;
+		drvdata->free_fragments = fragments;
+		up(&drvdata->free_fragments_mutex);
+		up(&drvdata->free_fragments_sema);
 	}
 
 	/* Need to mark all the pages dirty. */
@@ -489,11 +483,11 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (err < 0)
 		return err;
 
-	g_fragments_size = 2 * drvdata->cache_line_size;
+	drvdata->fragments_size = 2 * drvdata->cache_line_size;
 
 	/* Allocate space for the channels in coherent memory */
 	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
-	frag_mem_size = PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
+	frag_mem_size = PAGE_ALIGN(drvdata->fragments_size * MAX_FRAGMENTS);
 
 	slot_mem = dmam_alloc_coherent(dev, slot_mem_size + frag_mem_size,
 				       &slot_phys, GFP_KERNEL);
@@ -513,15 +507,16 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =
 		MAX_FRAGMENTS;
 
-	g_fragments_base = (char *)slot_mem + slot_mem_size;
+	drvdata->fragments_base = (char *)slot_mem + slot_mem_size;
 
-	g_free_fragments = g_fragments_base;
+	drvdata->free_fragments = drvdata->fragments_base;
 	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
-		*(char **)&g_fragments_base[i * g_fragments_size] =
-			&g_fragments_base[(i + 1) * g_fragments_size];
+		*(char **)&drvdata->fragments_base[i * drvdata->fragments_size] =
+			&drvdata->fragments_base[(i + 1) * drvdata->fragments_size];
 	}
-	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
-	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
+	*(char **)&drvdata->fragments_base[i * drvdata->fragments_size] = NULL;
+	sema_init(&drvdata->free_fragments_sema, MAX_FRAGMENTS);
+	sema_init(&drvdata->free_fragments_mutex, 1);
 
 	err = vchiq_init_state(state, vchiq_slot_zero, dev);
 	if (err)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index f2fd572df2b3..d5c0a8e9fa2b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -34,6 +34,12 @@ struct vchiq_drvdata {
 	struct rpi_firmware *fw;
 
 	struct vchiq_connected drv_connected;
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

