Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08C8216A0B
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648625; cv=none; b=nhwcSEjGFBwiZZ2Ta7X1AaMuT+iPrepcWvLHn2y8WJJvd97T47AWTR7N1Cs6m8AX+S8PRo+VpA3rixg1XmM8jHgXfNpejOYiFWZSf/729DX8SvFek/wS7KqOlPqFwcztjwdiW2YQPpgk3PHPFULDvHq58t/bZL5XBrrk3ybJE80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648625; c=relaxed/simple;
	bh=HPzlE9sh1djReKfpWW1YtSaIElNq0n+B+WspYQFZr6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wupg5IAqNJJqpj5zxhoUbCXKDbcebil18O/D2cwwV75aMJrnyMFuItjE4z4VMyl9JKXwIk0iu66mOgP9qomo7HZolszVM+FW6SrksEiCIgtrtczYqFzcrbge8Sw63VwXHe1Bv1kaCLZdiZ2NJ8p1WQFIhrFgoqNhIaDGnNV95fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ICyiPHdU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ICyiPHdU"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2788CDB;
	Fri, 11 Oct 2024 14:08:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728648523;
	bh=HPzlE9sh1djReKfpWW1YtSaIElNq0n+B+WspYQFZr6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ICyiPHdU6z78Hq/RQKLF0mAAgd0rhXGCfJHmoeyrzMaWbe78bggGlDy4QUNXyFkBw
	 0jN17O+Z3o3zmSSNYfjzgxXvhjWjFijKSSTbCMtAdCCwakhnx0NttnNDdk53aqiip6
	 bQsV1DkQNbYxtSIdGIQ8HF+VMvcDUsWzNcXgks5Y=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 1/6] staging: vchiq_core: Locally cache cache_line_size information
Date: Fri, 11 Oct 2024 17:39:05 +0530
Message-ID: <20241011120910.74045-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011120910.74045-1-umang.jain@ideasonboard.com>
References: <20241011120910.74045-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Locally cache 'cache_line_size' information in a variable instead of
repeatedly accessing it from drv_mgmt->info. This helps to reflow lines
under 80 columns.

No functional change intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 .../interface/vchiq_arm/vchiq_core.c          | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 1e4b2978c186..e9b60dd8d419 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1490,6 +1490,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	size_t pagelist_size;
 	struct scatterlist *scatterlist, *sg;
 	int dma_buffers;
+	unsigned int cache_line_size;
 	dma_addr_t dma_addr;
 
 	if (count >= INT_MAX - PAGE_SIZE)
@@ -1638,10 +1639,10 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	}
 
 	/* Partial cache lines (fragments) require special measures */
+	cache_line_size = drv_mgmt->info->cache_line_size;
 	if ((type == PAGELIST_READ) &&
-	    ((pagelist->offset & (drv_mgmt->info->cache_line_size - 1)) ||
-	    ((pagelist->offset + pagelist->length) &
-	    (drv_mgmt->info->cache_line_size - 1)))) {
+	    ((pagelist->offset & (cache_line_size - 1)) ||
+	    ((pagelist->offset + pagelist->length) & (cache_line_size - 1)))) {
 		char *fragments;
 
 		if (down_interruptible(&drv_mgmt->free_fragments_sema)) {
@@ -1671,6 +1672,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	struct pagelist *pagelist = pagelistinfo->pagelist;
 	struct page **pages = pagelistinfo->pages;
 	unsigned int num_pages = pagelistinfo->num_pages;
+	unsigned int cache_line_size;
 
 	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
 
@@ -1685,16 +1687,17 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	pagelistinfo->scatterlist_mapped = 0;
 
 	/* Deal with any partial cache lines (fragments) */
+	cache_line_size = drv_mgmt->info->cache_line_size;
 	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && drv_mgmt->fragments_base) {
 		char *fragments = drv_mgmt->fragments_base +
 			(pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
 			drv_mgmt->fragments_size;
 		int head_bytes, tail_bytes;
 
-		head_bytes = (drv_mgmt->info->cache_line_size - pagelist->offset) &
-			(drv_mgmt->info->cache_line_size - 1);
+		head_bytes = (cache_line_size - pagelist->offset) &
+			     (cache_line_size - 1);
 		tail_bytes = (pagelist->offset + actual) &
-			(drv_mgmt->info->cache_line_size - 1);
+			     (cache_line_size - 1);
 
 		if ((actual >= 0) && (head_bytes != 0)) {
 			if (head_bytes > actual)
@@ -1707,8 +1710,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 		    (tail_bytes != 0))
 			memcpy_to_page(pages[num_pages - 1],
 				       (pagelist->offset + actual) &
-				       (PAGE_SIZE - 1) & ~(drv_mgmt->info->cache_line_size - 1),
-				       fragments + drv_mgmt->info->cache_line_size,
+				       (PAGE_SIZE - 1) & ~(cache_line_size - 1),
+				       fragments + cache_line_size,
 				       tail_bytes);
 
 		down(&drv_mgmt->free_fragments_mutex);
-- 
2.45.2

