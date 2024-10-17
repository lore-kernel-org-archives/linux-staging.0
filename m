Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FFC1DE2D7
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729172217; cv=none; b=lyCX22yU+v7KTRx7wiopH9ff68U/VoovbM5bng4URYeISOdpTG40nT0EoJZI6YiP7TJ7xAl9NKOjFPpnwpL+iKO1mkgSM5/4HpErkYmXXny2BLLTI6Fwj2nsN71/vur4Y6h5tATOb63wzgJkD6yYncDUZEfYvI6uAbxXUTOX9RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729172217; c=relaxed/simple;
	bh=VVbdhvswgcK0hNwOCk9Bu1h2AYBoxHKL9pS7jwGQ1eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdcIq/UnIaS5ul4lh9JucaWohptIOYsYXFtG+J6qS59KiF6i9O4DVUMMjvpdiy3+hDmseERjFy1kSUn5lQfQ9V5lfGgniRuZzYyhSvgzXFeS3ACOAIC7xXUY15jw153wQjGh+gJVEnHEwo60L2YNduKQv+jZExrNtLSgMFYfBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aTsekc2Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aTsekc2Z"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8D54827;
	Thu, 17 Oct 2024 15:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729172102;
	bh=VVbdhvswgcK0hNwOCk9Bu1h2AYBoxHKL9pS7jwGQ1eQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aTsekc2Zd5wf34cDRNnf+deotirBwDGPBXhkcDPfGzlf7OcMWc8ryPij7ge94cxXU
	 mVLXeq4ycV0a3nAzaPoNFKssy2RP2m85Q19enOvqxdNO4RJhSFtawWnw+l9AiGj3sd
	 fuXWCIKfUqyKmhucXU3+hsezKTK/rvD4LAQVRZVM=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/6] staging: vchiq_core: Subsume 'offset' in struct vchiq_bulk
Date: Thu, 17 Oct 2024 19:06:24 +0530
Message-ID: <20241017133629.216672-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017133629.216672-1-umang.jain@ideasonboard.com>
References: <20241017133629.216672-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subsume offset and uoffset inside struct vchiq_bulk instead of
open-coding them in vchiq_prepare_bulk_data() function. It helps in
reducing function parameters and can be easily retrieved from the
struct vchiq_bulk pointer for creating pagelist.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 27 ++++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  2 ++
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3d347b425f20..7c6f09a9d917 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1482,7 +1482,7 @@ is_adjacent_block(u32 *addrs, dma_addr_t addr, unsigned int k)
  * cached area.
  */
 static struct vchiq_pagelist_info *
-create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
+create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk,
 		size_t count, unsigned short type)
 {
 	struct vchiq_drv_mgmt *drv_mgmt;
@@ -1503,10 +1503,10 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 
 	drv_mgmt = dev_get_drvdata(instance->state->dev);
 
-	if (buf)
-		offset = (uintptr_t)buf & (PAGE_SIZE - 1);
+	if (bulk->offset)
+		offset = (uintptr_t)bulk->offset & (PAGE_SIZE - 1);
 	else
-		offset = (uintptr_t)ubuf & (PAGE_SIZE - 1);
+		offset = (uintptr_t)bulk->uoffset & (PAGE_SIZE - 1);
 	num_pages = DIV_ROUND_UP(count + offset, PAGE_SIZE);
 
 	if ((size_t)num_pages > (SIZE_MAX - sizeof(struct pagelist) -
@@ -1554,14 +1554,14 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	pagelistinfo->scatterlist = scatterlist;
 	pagelistinfo->scatterlist_mapped = 0;
 
-	if (buf) {
+	if (bulk->offset) {
 		unsigned long length = count;
 		unsigned int off = offset;
 
 		for (actual_pages = 0; actual_pages < num_pages;
 		     actual_pages++) {
 			struct page *pg =
-				vmalloc_to_page((buf +
+				vmalloc_to_page(((unsigned int *)bulk->offset +
 						 (actual_pages * PAGE_SIZE)));
 			size_t bytes = PAGE_SIZE - off;
 
@@ -1578,8 +1578,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 		}
 		/* do not try and release vmalloc pages */
 	} else {
-		actual_pages = pin_user_pages_fast((unsigned long)ubuf & PAGE_MASK, num_pages,
-						   type == PAGELIST_READ, pages);
+		actual_pages =
+			pin_user_pages_fast((unsigned long)bulk->uoffset & PAGE_MASK, num_pages,
+					    type == PAGELIST_READ, pages);
 
 		if (actual_pages != num_pages) {
 			dev_dbg(instance->state->dev, "arm: Only %d/%d pages locked\n",
@@ -1739,12 +1740,12 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 }
 
 static int
-vchiq_prepare_bulk_data(struct vchiq_instance *instance, struct vchiq_bulk *bulk, void *offset,
-			void __user *uoffset, int size, int dir)
+vchiq_prepare_bulk_data(struct vchiq_instance *instance, struct vchiq_bulk *bulk,
+			int size, int dir)
 {
 	struct vchiq_pagelist_info *pagelistinfo;
 
-	pagelistinfo = create_pagelist(instance, offset, uoffset, size,
+	pagelistinfo = create_pagelist(instance, bulk, size,
 				       (dir == VCHIQ_BULK_RECEIVE)
 				       ? PAGELIST_READ
 				       : PAGELIST_WRITE);
@@ -3070,8 +3071,10 @@ vchiq_bulk_xfer_queue_msg_killable(struct vchiq_service *service,
 	bulk->userdata = userdata;
 	bulk->size = size;
 	bulk->actual = VCHIQ_BULK_ACTUAL_ABORTED;
+	bulk->offset = offset;
+	bulk->uoffset = uoffset;
 
-	if (vchiq_prepare_bulk_data(service->instance, bulk, offset, uoffset, size, dir))
+	if (vchiq_prepare_bulk_data(service->instance, bulk, size, dir))
 		goto unlock_error_exit;
 
 	/*
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 400472f1aa06..05ef0666c2b3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -120,6 +120,8 @@ struct vchiq_bulk {
 	void *remote_data;
 	int remote_size;
 	int actual;
+	void *offset;
+	void __user *uoffset;
 };
 
 struct vchiq_bulk_queue {
-- 
2.45.2

