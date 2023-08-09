Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB361C9E2
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 16:09:09 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1bba254a7d4so5545780fac.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691597349; x=1692202149;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLsEc1SURoGl5rg44cC9yocFScFOQBvRbRNHW1jejec=;
        b=Im7CttedcuWS8zy5IJSJAWDgu/AjQksaATMtgYuP5+RgR3ElqVc8GqSTT93einTz6r
         9/X1sVpKu4rTMaa9WzH65Ejm7UosV5YVRBZPYm5ROIb08PN6rCOp2rxtPFhV+86rzIGA
         zkEvH5TXvTRIhiWLH73fUbB2El/LAyEUVxhEYA+Rn8vW3S91SqbMKT4gMxpPKT7kY1oB
         7GAwY7aBTCii70SNyh5CsJkDNxndHbOo44H2cWJftmdQt0IgJxmxSvdo29dQQNjFPVmb
         ZRQMeuKg1fKcpG47sGpeRXaEHh1djS64teHboAwZ0U7EY7bxFt3L7eIDA2yU6QHlusVS
         cWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691597349; x=1692202149;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLsEc1SURoGl5rg44cC9yocFScFOQBvRbRNHW1jejec=;
        b=LRh/PSqdrh9eIniezFHOdcJAgOm3lLuCa4zdDvqVV9tTbyeK594BCcNhblAqvIxnkL
         CttiGu1cxA8QPTq+9OWwmCtKnLvHGC8SP1cb/mXHQaJX86fZ1nRdyxjSAuI5O+n3jLpC
         mcXwK+mEXkfAdEP/7tvvwF1hso36r8hrX+RudUPulBphxrRBYVuD4ARxf/JWHNgBB74H
         L9OJb9q+XX+MvNDkDhxy8gheLoUhp2ESlj9himjxnZG+fyLkIg+GaSFZ5Rft/gPzMGwL
         xftuYW8F30DV3gW2FXnhK+AQEBqRUSnndFOfSFXHbbIh4u9rbg6u5rfuVIaS3XqxH9cF
         a1kA==
X-Gm-Message-State: AOJu0YzJrKV2CFXo//9feQJTN5pVfD2gykQkpEKF6wL/nYdXP44Hrsor
	1ib0SQTqG9dBaF+v1tWcVvc=
X-Google-Smtp-Source: AGHT+IH35966e6ruhqddL1XKan/DFMJpiYtBIX1m4SKFeRgHTaeNI2J5w20/BEvom99B3Z7/QvImhQ==
X-Received: by 2002:a05:6808:23c7:b0:3a7:b011:8960 with SMTP id bq7-20020a05680823c700b003a7b0118960mr3926827oib.40.1691597348034;
        Wed, 09 Aug 2023 09:09:08 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id bg36-20020a05680817a400b003a1e38362b7sm7126875oib.25.2023.08.09.09.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 09:09:07 -0700 (PDT)
Date: Wed, 9 Aug 2023 13:09:02 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix alignment of open parenthesis
Message-ID: <ZNO6HohffQlbh7jn@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Alignment should match open parenthesis
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme.c | 83 +++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5555683a069..5eb0d780c77f 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -79,7 +79,7 @@ static struct vme_bridge *find_bridge(struct vme_resource *resource)
  * Return: Virtual address of allocation on success, NULL on failure.
  */
 void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
-	dma_addr_t *dma)
+			   dma_addr_t *dma)
 {
 	struct vme_bridge *bridge;
 
@@ -119,7 +119,7 @@ EXPORT_SYMBOL(vme_alloc_consistent);
  * Free previously allocated block of contiguous memory.
  */
 void vme_free_consistent(struct vme_resource *resource, size_t size,
-	void *vaddr, dma_addr_t dma)
+			 void *vaddr, dma_addr_t dma)
 {
 	struct vme_bridge *bridge;
 
@@ -169,14 +169,14 @@ size_t vme_get_size(struct vme_resource *resource)
 	switch (resource->type) {
 	case VME_MASTER:
 		retval = vme_master_get(resource, &enabled, &base, &size,
-			&aspace, &cycle, &dwidth);
+					&aspace, &cycle, &dwidth);
 		if (retval)
 			return 0;
 
 		return size;
 	case VME_SLAVE:
 		retval = vme_slave_get(resource, &enabled, &base, &size,
-			&buf_base, &aspace, &cycle);
+				       &buf_base, &aspace, &cycle);
 		if (retval)
 			return 0;
 
@@ -279,7 +279,7 @@ static u32 vme_get_aspace(int am)
  * Return: Pointer to VME resource on success, NULL on failure.
  */
 struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
-	u32 cycle)
+				       u32 cycle)
 {
 	struct vme_bridge *bridge;
 	struct list_head *slave_pos = NULL;
@@ -296,7 +296,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 	/* Loop through slave resources */
 	list_for_each(slave_pos, &bridge->slave_resources) {
 		slave_image = list_entry(slave_pos,
-			struct vme_slave_resource, list);
+					 struct vme_slave_resource, list);
 
 		if (!slave_image) {
 			printk(KERN_ERR "Registered NULL Slave resource\n");
@@ -306,8 +306,8 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 		/* Find an unlocked and compatible image */
 		mutex_lock(&slave_image->mtx);
 		if (((slave_image->address_attr & address) == address) &&
-			((slave_image->cycle_attr & cycle) == cycle) &&
-			(slave_image->locked == 0)) {
+		    ((slave_image->cycle_attr & cycle) == cycle) &&
+		    (slave_image->locked == 0)) {
 
 			slave_image->locked = 1;
 			mutex_unlock(&slave_image->mtx);
@@ -359,8 +359,8 @@ EXPORT_SYMBOL(vme_slave_request);
  *         returned.
  */
 int vme_slave_set(struct vme_resource *resource, int enabled,
-	unsigned long long vme_base, unsigned long long size,
-	dma_addr_t buf_base, u32 aspace, u32 cycle)
+		  unsigned long long vme_base, unsigned long long size,
+		  dma_addr_t buf_base, u32 aspace, u32 cycle)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_slave_resource *image;
@@ -379,7 +379,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
-		((image->cycle_attr & cycle) == cycle))) {
+	      ((image->cycle_attr & cycle) == cycle))) {
 		printk(KERN_ERR "Invalid attributes\n");
 		return -EINVAL;
 	}
@@ -409,8 +409,8 @@ EXPORT_SYMBOL(vme_slave_set);
  *         device or if an invalid resource has been provided.
  */
 int vme_slave_get(struct vme_resource *resource, int *enabled,
-	unsigned long long *vme_base, unsigned long long *size,
-	dma_addr_t *buf_base, u32 *aspace, u32 *cycle)
+		  unsigned long long *vme_base, unsigned long long *size,
+		  dma_addr_t *buf_base, u32 *aspace, u32 *cycle)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_slave_resource *image;
@@ -448,7 +448,7 @@ void vme_slave_free(struct vme_resource *resource)
 	}
 
 	slave_image = list_entry(resource->entry, struct vme_slave_resource,
-		list);
+				 list);
 	if (!slave_image) {
 		printk(KERN_ERR "Can't find slave resource\n");
 		return;
@@ -480,7 +480,7 @@ EXPORT_SYMBOL(vme_slave_free);
  * Return: Pointer to VME resource on success, NULL on failure.
  */
 struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
-	u32 cycle, u32 dwidth)
+					u32 cycle, u32 dwidth)
 {
 	struct vme_bridge *bridge;
 	struct list_head *master_pos = NULL;
@@ -497,7 +497,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 	/* Loop through master resources */
 	list_for_each(master_pos, &bridge->master_resources) {
 		master_image = list_entry(master_pos,
-			struct vme_master_resource, list);
+					  struct vme_master_resource, list);
 
 		if (!master_image) {
 			printk(KERN_WARNING "Registered NULL master resource\n");
@@ -507,9 +507,9 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		/* Find an unlocked and compatible image */
 		spin_lock(&master_image->lock);
 		if (((master_image->address_attr & address) == address) &&
-			((master_image->cycle_attr & cycle) == cycle) &&
-			((master_image->width_attr & dwidth) == dwidth) &&
-			(master_image->locked == 0)) {
+		    ((master_image->cycle_attr & cycle) == cycle) &&
+		    ((master_image->width_attr & dwidth) == dwidth) &&
+		    (master_image->locked == 0)) {
 
 			master_image->locked = 1;
 			spin_unlock(&master_image->lock);
@@ -563,8 +563,8 @@ EXPORT_SYMBOL(vme_master_request);
  *         returned.
  */
 int vme_master_set(struct vme_resource *resource, int enabled,
-	unsigned long long vme_base, unsigned long long size, u32 aspace,
-	u32 cycle, u32 dwidth)
+		   unsigned long long vme_base, unsigned long long size,
+		   u32 aspace, u32 cycle, u32 dwidth)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
@@ -583,8 +583,8 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
-		((image->cycle_attr & cycle) == cycle) &&
-		((image->width_attr & dwidth) == dwidth))) {
+	      ((image->cycle_attr & cycle) == cycle) &&
+	      ((image->width_attr & dwidth) == dwidth))) {
 		printk(KERN_WARNING "Invalid attributes\n");
 		return -EINVAL;
 	}
@@ -614,8 +614,8 @@ EXPORT_SYMBOL(vme_master_set);
  *         device or if an invalid resource has been provided.
  */
 int vme_master_get(struct vme_resource *resource, int *enabled,
-	unsigned long long *vme_base, unsigned long long *size, u32 *aspace,
-	u32 *cycle, u32 *dwidth)
+		   unsigned long long *vme_base, unsigned long long *size,
+		   u32 *aspace, u32 *cycle, u32 *dwidth)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
@@ -653,7 +653,7 @@ EXPORT_SYMBOL(vme_master_get);
  *         returned.
  */
 ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
-	loff_t offset)
+			loff_t offset)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
@@ -702,7 +702,7 @@ EXPORT_SYMBOL(vme_master_read);
  *         returned.
  */
 ssize_t vme_master_write(struct vme_resource *resource, void *buf,
-	size_t count, loff_t offset)
+			 size_t count, loff_t offset)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
@@ -754,7 +754,7 @@ EXPORT_SYMBOL(vme_master_write);
  *         errors may also be returned.
  */
 unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask,
-	unsigned int compare, unsigned int swap, loff_t offset)
+			    unsigned int compare, unsigned int swap, loff_t offset)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
@@ -828,7 +828,7 @@ void vme_master_free(struct vme_resource *resource)
 	}
 
 	master_image = list_entry(resource->entry, struct vme_master_resource,
-		list);
+				  list);
 	if (!master_image) {
 		printk(KERN_ERR "Can't find master resource\n");
 		return;
@@ -877,7 +877,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	/* Loop through DMA resources */
 	list_for_each(dma_pos, &bridge->dma_resources) {
 		dma_ctrlr = list_entry(dma_pos,
-			struct vme_dma_resource, list);
+				       struct vme_dma_resource, list);
 		if (!dma_ctrlr) {
 			printk(KERN_ERR "Registered NULL DMA resource\n");
 			continue;
@@ -886,7 +886,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 		/* Find an unlocked and compatible controller */
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
-			(dma_ctrlr->locked == 0)) {
+		    (dma_ctrlr->locked == 0)) {
 
 			dma_ctrlr->locked = 1;
 			mutex_unlock(&dma_ctrlr->mtx);
@@ -1045,7 +1045,7 @@ EXPORT_SYMBOL(vme_dma_pci_attribute);
  * Return: Pointer to VME DMA attribute, NULL on failure.
  */
 struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
-	u32 aspace, u32 cycle, u32 dwidth)
+					   u32 aspace, u32 cycle, u32 dwidth)
 {
 	struct vme_dma_attr *attributes;
 	struct vme_dma_vme *vme_attr;
@@ -1107,7 +1107,7 @@ EXPORT_SYMBOL(vme_dma_free_attribute);
  *         Hardware specific errors also possible.
  */
 int vme_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
-	struct vme_dma_attr *dest, size_t count)
+		     struct vme_dma_attr *dest, size_t count)
 {
 	struct vme_bridge *bridge = list->parent->parent;
 	int retval;
@@ -1331,8 +1331,8 @@ EXPORT_SYMBOL(vme_irq_handler);
  *         already in use. Hardware specific errors also possible.
  */
 int vme_irq_request(struct vme_dev *vdev, int level, int statid,
-	void (*callback)(int, int, void *),
-	void *priv_data)
+		    void (*callback)(int, int, void *),
+		    void *priv_data)
 {
 	struct vme_bridge *bridge;
 
@@ -1479,7 +1479,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 	/* Loop through LM resources */
 	list_for_each(lm_pos, &bridge->lm_resources) {
 		lm = list_entry(lm_pos,
-			struct vme_lm_resource, list);
+				struct vme_lm_resource, list);
 		if (!lm) {
 			printk(KERN_ERR "Registered NULL Location Monitor resource\n");
 			continue;
@@ -1561,7 +1561,7 @@ EXPORT_SYMBOL(vme_lm_count);
  *	   errors may also be returned.
  */
 int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
-	u32 aspace, u32 cycle)
+	       u32 aspace, u32 cycle)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
@@ -1597,7 +1597,7 @@ EXPORT_SYMBOL(vme_lm_set);
  *	   errors may also be returned.
  */
 int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
-	u32 *aspace, u32 *cycle)
+	       u32 *aspace, u32 *cycle)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
@@ -1634,7 +1634,7 @@ EXPORT_SYMBOL(vme_lm_get);
  *	   errors may also be returned.
  */
 int vme_lm_attach(struct vme_resource *resource, int monitor,
-	void (*callback)(void *), void *data)
+		  void (*callback)(void *), void *data)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
@@ -1841,7 +1841,8 @@ EXPORT_SYMBOL(vme_unregister_bridge);
 /* - Driver Registration --------------------------------------------------- */
 
 static int __vme_register_driver_bus(struct vme_driver *drv,
-	struct vme_bridge *bridge, unsigned int ndevs)
+				     struct vme_bridge *bridge,
+				     unsigned int ndevs)
 {
 	int err;
 	unsigned int i;
@@ -1861,7 +1862,7 @@ static int __vme_register_driver_bus(struct vme_driver *drv,
 		vdev->dev.parent = bridge->parent;
 		vdev->dev.bus = &vme_bus_type;
 		dev_set_name(&vdev->dev, "%s.%u-%u", drv->name, bridge->num,
-			vdev->num);
+			     vdev->num);
 
 		err = device_register(&vdev->dev);
 		if (err)
-- 
2.41.0

