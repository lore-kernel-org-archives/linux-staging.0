Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062BCD26D;
	Thu, 19 Oct 2023 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahqTpKJV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ca052ec63bso52441015ad.1;
        Thu, 19 Oct 2023 00:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697700023; x=1698304823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAQbNfa8BHxfgReN6qdaYul2aXhYc+/aEm7bq8OvEsI=;
        b=ahqTpKJVaZtgEFcuM1BcxbptCS3EU+J21yI9PFBFco0gveivDBT/zTxps7A4YUtcAQ
         0VTiRhYNqZU2Rx8VJqxbkdYTOyWmMRza2VeVQjT5c4he/gcBI6uqFlx/JcRACYyze8VD
         gOz+zEidlIyaXmgYO/pskq1K4VRrjSslzJWuj2Cc6zs7UW2cP7FpZOZ0V0+YvmINonkN
         kcuuiHirLLTTu6BC15P9xlL9CD8ozoR5CrjMzDh1I64BVw43lj/dnb3EQMfXSn6gq0pi
         /RCbliToOp4kb20AJDALc8l20vBpYJCne6rodCNYpf3GxN0vCf9tZyfA5XJacNfWDPS2
         TKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700023; x=1698304823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAQbNfa8BHxfgReN6qdaYul2aXhYc+/aEm7bq8OvEsI=;
        b=b5RpFFws/ptS6XHSwz1GakTIInYs/lxhrx9TTvww6MIoUiGM5G70gDNRIeWZFRUrVA
         P3ZtiPXjJr0o/4FC/L8zCUXM6kbdEWYNgmdBbE9LSfZN4ZCcEjMCfqgs0KcX3iL0Q8RE
         N5xb6K+82Us1Sc41OmQLaidPFIv2fLE89pjZdnto5PLhgZH7WUDCpCWxaDBOHegZNjSa
         6TeK/MB1WKxSKG3M7mPuGMoQ7oz3Q/6BUMFyXpv9UOiurxRlbFHSxv5Ke89ZB19NJpEY
         M0d2wNl6kXplYv/1yktcF46QyusbAXSjmwRlUmNpNYvQ7cp+ROHbT3hohqJJqzLsab/R
         iv1Q==
X-Gm-Message-State: AOJu0Yw4hFn0gE6nriOL2AIGVaEM9ixz0ZZger9n/Q2scKQ+oWX+y1pv
	4nKiEnmdMV9gE1J0+zglCHc=
X-Google-Smtp-Source: AGHT+IG8GN7ND3R1T531oyYt5AVEAPBiYBJ+0aSBVsBlnhQfHEDcI2PbOTsqIOpyKzFdsz+9cDucbw==
X-Received: by 2002:a17:902:d4c9:b0:1b9:de75:d5bb with SMTP id o9-20020a170902d4c900b001b9de75d5bbmr1943676plg.7.1697700023121;
        Thu, 19 Oct 2023 00:20:23 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902d50300b001b8622c1ad2sm1144013plg.130.2023.10.19.00.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:20:22 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v2 1/2] staging: vme_user: Replace printk() with pr_*(),dev_*()
Date: Thu, 19 Oct 2023 00:20:09 -0700
Message-ID: <cad6da28b5f772957ced5b561b21b5d8c8204bc9.1697696951.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697696951.git.soumya.negi97@gmail.com>
References: <cover.1697696951.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vme.c uses printk() to log messages. To improve and standardize message
formatting, use logging mechanisms pr_err()/pr_warn() and
dev_err()/dev_warn() instead. Retain the printk log levels of the
messages during replacement.

Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
Changes in v2:
* Change the pr_*() calls used to replace printk's in v1 to dev_*() 
  wherever possible, as it adds more context to the message.
  (as per feedback from julia.lawall@inria.fr & 
  gregkh@linuxfoundation.org)

 drivers/staging/vme_user/vme.c | 193 +++++++++++++++++++--------------
 1 file changed, 109 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 6519a7c994a0..640b2dda3ac6 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -9,6 +9,8 @@
  * Copyright 2004 Motorola Inc.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/mm.h>
@@ -62,7 +64,7 @@ static struct vme_bridge *find_bridge(struct vme_resource *resource)
 		return list_entry(resource->entry, struct vme_lm_resource,
 			list)->parent;
 	default:
-		printk(KERN_ERR "Unknown resource type\n");
+		pr_err("Unknown resource type\n");
 		return NULL;
 	}
 }
@@ -84,24 +86,25 @@ void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
 	struct vme_bridge *bridge;
 
 	if (!resource) {
-		printk(KERN_ERR "No resource\n");
+		pr_err("No resource\n");
 		return NULL;
 	}
 
 	bridge = find_bridge(resource);
 	if (!bridge) {
-		printk(KERN_ERR "Can't find bridge\n");
+		pr_err("Can't find bridge\n");
 		return NULL;
 	}
 
 	if (!bridge->parent) {
-		printk(KERN_ERR "Dev entry NULL for bridge %s\n", bridge->name);
+		pr_err("Dev entry NULL for bridge %s\n", bridge->name);
 		return NULL;
 	}
 
 	if (!bridge->alloc_consistent) {
-		printk(KERN_ERR "alloc_consistent not supported by bridge %s\n",
-		       bridge->name);
+		dev_err(bridge->parent,
+			"alloc_consistent not supported by bridge %s\n",
+			bridge->name);
 		return NULL;
 	}
 
@@ -124,24 +127,25 @@ void vme_free_consistent(struct vme_resource *resource, size_t size,
 	struct vme_bridge *bridge;
 
 	if (!resource) {
-		printk(KERN_ERR "No resource\n");
+		pr_err("No resource\n");
 		return;
 	}
 
 	bridge = find_bridge(resource);
 	if (!bridge) {
-		printk(KERN_ERR "Can't find bridge\n");
+		pr_err("Can't find bridge\n");
 		return;
 	}
 
 	if (!bridge->parent) {
-		printk(KERN_ERR "Dev entry NULL for bridge %s\n", bridge->name);
+		pr_err("Dev entry NULL for bridge %s\n", bridge->name);
 		return;
 	}
 
 	if (!bridge->free_consistent) {
-		printk(KERN_ERR "free_consistent not supported by bridge %s\n",
-		       bridge->name);
+		dev_err(bridge->parent,
+			"free_consistent not supported by bridge %s\n",
+			bridge->name);
 		return;
 	}
 
@@ -161,6 +165,7 @@ EXPORT_SYMBOL(vme_free_consistent);
  */
 size_t vme_get_size(struct vme_resource *resource)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	int enabled, retval;
 	unsigned long long base, size;
 	dma_addr_t buf_base;
@@ -184,7 +189,7 @@ size_t vme_get_size(struct vme_resource *resource)
 	case VME_DMA:
 		return 0;
 	default:
-		printk(KERN_ERR "Unknown resource type\n");
+		dev_err(bridge->parent, "Unknown resource type\n");
 		return 0;
 	}
 }
@@ -225,7 +230,7 @@ int vme_check_window(u32 aspace, unsigned long long vme_base,
 		/* User Defined */
 		break;
 	default:
-		printk(KERN_ERR "Invalid address space\n");
+		pr_err("Invalid address space\n");
 		retval = -EINVAL;
 		break;
 	}
@@ -288,14 +293,15 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		goto err_bus;
 	}
 
 	/* Loop through slave resources */
 	list_for_each_entry(slave_image, &bridge->slave_resources, list) {
 		if (!slave_image) {
-			printk(KERN_ERR "Registered NULL Slave resource\n");
+			dev_err(bridge->parent,
+				"Registered NULL Slave resource\n");
 			continue;
 		}
 
@@ -362,20 +368,20 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 	int retval;
 
 	if (resource->type != VME_SLAVE) {
-		printk(KERN_ERR "Not a slave resource\n");
+		dev_err(bridge->parent, "Not a slave resource\n");
 		return -EINVAL;
 	}
 
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_set) {
-		printk(KERN_ERR "Function not supported\n");
+		dev_err(bridge->parent, "Function not supported\n");
 		return -ENOSYS;
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
 	      ((image->cycle_attr & cycle) == cycle))) {
-		printk(KERN_ERR "Invalid attributes\n");
+		dev_err(bridge->parent, "Invalid attributes\n");
 		return -EINVAL;
 	}
 
@@ -411,14 +417,14 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 	struct vme_slave_resource *image;
 
 	if (resource->type != VME_SLAVE) {
-		printk(KERN_ERR "Not a slave resource\n");
+		dev_err(bridge->parent, "Not a slave resource\n");
 		return -EINVAL;
 	}
 
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_get) {
-		printk(KERN_ERR "vme_slave_get not supported\n");
+		dev_err(bridge->parent, "vme_slave_get not supported\n");
 		return -EINVAL;
 	}
 
@@ -435,24 +441,25 @@ EXPORT_SYMBOL(vme_slave_get);
  */
 void vme_slave_free(struct vme_resource *resource)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_slave_resource *slave_image;
 
 	if (resource->type != VME_SLAVE) {
-		printk(KERN_ERR "Not a slave resource\n");
+		dev_err(bridge->parent, "Not a slave resource\n");
 		return;
 	}
 
 	slave_image = list_entry(resource->entry, struct vme_slave_resource,
 				 list);
 	if (!slave_image) {
-		printk(KERN_ERR "Can't find slave resource\n");
+		dev_err(bridge->parent, "Can't find slave resource\n");
 		return;
 	}
 
 	/* Unlock image */
 	mutex_lock(&slave_image->mtx);
 	if (slave_image->locked == 0)
-		printk(KERN_ERR "Image is already free\n");
+		dev_err(bridge->parent, "Image is already free\n");
 
 	slave_image->locked = 0;
 	mutex_unlock(&slave_image->mtx);
@@ -484,14 +491,15 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		goto err_bus;
 	}
 
 	/* Loop through master resources */
 	list_for_each_entry(master_image, &bridge->master_resources, list) {
 		if (!master_image) {
-			printk(KERN_WARNING "Registered NULL master resource\n");
+			dev_warn(bridge->parent,
+				 "Registered NULL master resource\n");
 			continue;
 		}
 
@@ -511,7 +519,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 
 	/* Check to see if we found a resource */
 	if (!allocated_image) {
-		printk(KERN_ERR "Can't find a suitable resource\n");
+		dev_err(&vdev->dev, "Can't find a suitable resource\n");
 		goto err_image;
 	}
 
@@ -561,21 +569,21 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	int retval;
 
 	if (resource->type != VME_MASTER) {
-		printk(KERN_ERR "Not a master resource\n");
+		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
 	}
 
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_set) {
-		printk(KERN_WARNING "vme_master_set not supported\n");
+		dev_warn(bridge->parent, "vme_master_set not supported\n");
 		return -EINVAL;
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
 	      ((image->cycle_attr & cycle) == cycle) &&
 	      ((image->width_attr & dwidth) == dwidth))) {
-		printk(KERN_WARNING "Invalid attributes\n");
+		dev_warn(bridge->parent, "Invalid attributes\n");
 		return -EINVAL;
 	}
 
@@ -611,14 +619,14 @@ int vme_master_get(struct vme_resource *resource, int *enabled,
 	struct vme_master_resource *image;
 
 	if (resource->type != VME_MASTER) {
-		printk(KERN_ERR "Not a master resource\n");
+		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
 	}
 
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_get) {
-		printk(KERN_WARNING "%s not supported\n", __func__);
+		dev_warn(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -650,12 +658,13 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 	size_t length;
 
 	if (!bridge->master_read) {
-		printk(KERN_WARNING "Reading from resource not supported\n");
+		dev_warn(bridge->parent,
+			 "Reading from resource not supported\n");
 		return -EINVAL;
 	}
 
 	if (resource->type != VME_MASTER) {
-		printk(KERN_ERR "Not a master resource\n");
+		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
 	}
 
@@ -664,7 +673,7 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 	length = vme_get_size(resource);
 
 	if (offset > length) {
-		printk(KERN_WARNING "Invalid Offset\n");
+		dev_warn(bridge->parent, "Invalid Offset\n");
 		return -EFAULT;
 	}
 
@@ -698,12 +707,12 @@ ssize_t vme_master_write(struct vme_resource *resource, void *buf,
 	size_t length;
 
 	if (!bridge->master_write) {
-		printk(KERN_WARNING "Writing to resource not supported\n");
+		dev_warn(bridge->parent, "Writing to resource not supported\n");
 		return -EINVAL;
 	}
 
 	if (resource->type != VME_MASTER) {
-		printk(KERN_ERR "Not a master resource\n");
+		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
 	}
 
@@ -712,7 +721,7 @@ ssize_t vme_master_write(struct vme_resource *resource, void *buf,
 	length = vme_get_size(resource);
 
 	if (offset > length) {
-		printk(KERN_WARNING "Invalid Offset\n");
+		dev_warn(bridge->parent, "Invalid Offset\n");
 		return -EFAULT;
 	}
 
@@ -749,12 +758,12 @@ unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask,
 	struct vme_master_resource *image;
 
 	if (!bridge->master_rmw) {
-		printk(KERN_WARNING "Writing to resource not supported\n");
+		dev_warn(bridge->parent, "Writing to resource not supported\n");
 		return -EINVAL;
 	}
 
 	if (resource->type != VME_MASTER) {
-		printk(KERN_ERR "Not a master resource\n");
+		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
 	}
 
@@ -777,12 +786,13 @@ EXPORT_SYMBOL(vme_master_rmw);
  */
 int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
 	phys_addr_t phys_addr;
 	unsigned long vma_size;
 
 	if (resource->type != VME_MASTER) {
-		pr_err("Not a master resource\n");
+		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
 	}
 
@@ -791,7 +801,7 @@ int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma)
 	vma_size = vma->vm_end - vma->vm_start;
 
 	if (phys_addr + vma_size > image->bus_resource.end + 1) {
-		pr_err("Map size cannot exceed the window size\n");
+		dev_err(bridge->parent, "Map size cannot exceed the window size\n");
 		return -EFAULT;
 	}
 
@@ -809,24 +819,25 @@ EXPORT_SYMBOL(vme_master_mmap);
  */
 void vme_master_free(struct vme_resource *resource)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *master_image;
 
 	if (resource->type != VME_MASTER) {
-		printk(KERN_ERR "Not a master resource\n");
+		dev_err(bridge->parent, "Not a master resource\n");
 		return;
 	}
 
 	master_image = list_entry(resource->entry, struct vme_master_resource,
 				  list);
 	if (!master_image) {
-		printk(KERN_ERR "Can't find master resource\n");
+		dev_err(bridge->parent, "Can't find master resource\n");
 		return;
 	}
 
 	/* Unlock image */
 	spin_lock(&master_image->lock);
 	if (master_image->locked == 0)
-		printk(KERN_ERR "Image is already free\n");
+		dev_err(bridge->parent, "Image is already free\n");
 
 	master_image->locked = 0;
 	spin_unlock(&master_image->lock);
@@ -854,18 +865,19 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	struct vme_resource *resource = NULL;
 
 	/* XXX Not checking resource attributes */
-	printk(KERN_ERR "No VME resource Attribute tests done\n");
+	dev_err(&vdev->dev, "No VME resource Attribute tests done\n");
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		goto err_bus;
 	}
 
 	/* Loop through DMA resources */
 	list_for_each_entry(dma_ctrlr, &bridge->dma_resources, list) {
 		if (!dma_ctrlr) {
-			printk(KERN_ERR "Registered NULL DMA resource\n");
+			dev_err(bridge->parent,
+				"Registered NULL DMA resource\n");
 			continue;
 		}
 
@@ -917,10 +929,11 @@ EXPORT_SYMBOL(vme_dma_request);
  */
 struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_dma_list *dma_list;
 
 	if (resource->type != VME_DMA) {
-		printk(KERN_ERR "Not a DMA resource\n");
+		dev_err(bridge->parent, "Not a DMA resource\n");
 		return NULL;
 	}
 
@@ -1098,12 +1111,13 @@ int vme_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 	int retval;
 
 	if (!bridge->dma_list_add) {
-		printk(KERN_WARNING "Link List DMA generation not supported\n");
+		dev_warn(bridge->parent,
+			 "Link List DMA generation not supported\n");
 		return -EINVAL;
 	}
 
 	if (!mutex_trylock(&list->mtx)) {
-		printk(KERN_ERR "Link List already submitted\n");
+		dev_err(bridge->parent, "Link List already submitted\n");
 		return -EINVAL;
 	}
 
@@ -1131,7 +1145,8 @@ int vme_dma_list_exec(struct vme_dma_list *list)
 	int retval;
 
 	if (!bridge->dma_list_exec) {
-		printk(KERN_ERR "Link List DMA execution not supported\n");
+		dev_err(bridge->parent,
+			"Link List DMA execution not supported\n");
 		return -EINVAL;
 	}
 
@@ -1160,12 +1175,13 @@ int vme_dma_list_free(struct vme_dma_list *list)
 	int retval;
 
 	if (!bridge->dma_list_empty) {
-		printk(KERN_WARNING "Emptying of Link Lists not supported\n");
+		dev_warn(bridge->parent,
+			 "Emptying of Link Lists not supported\n");
 		return -EINVAL;
 	}
 
 	if (!mutex_trylock(&list->mtx)) {
-		printk(KERN_ERR "Link List in use\n");
+		dev_err(bridge->parent, "Link List in use\n");
 		return -EBUSY;
 	}
 
@@ -1175,7 +1191,7 @@ int vme_dma_list_free(struct vme_dma_list *list)
 	 */
 	retval = bridge->dma_list_empty(list);
 	if (retval) {
-		printk(KERN_ERR "Unable to empty link-list entries\n");
+		dev_err(bridge->parent, "Unable to empty link-list entries\n");
 		mutex_unlock(&list->mtx);
 		return retval;
 	}
@@ -1197,22 +1213,24 @@ EXPORT_SYMBOL(vme_dma_list_free);
  */
 int vme_dma_free(struct vme_resource *resource)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_dma_resource *ctrlr;
 
 	if (resource->type != VME_DMA) {
-		printk(KERN_ERR "Not a DMA resource\n");
+		dev_err(bridge->parent, "Not a DMA resource\n");
 		return -EINVAL;
 	}
 
 	ctrlr = list_entry(resource->entry, struct vme_dma_resource, list);
 
 	if (!mutex_trylock(&ctrlr->mtx)) {
-		printk(KERN_ERR "Resource busy, can't free\n");
+		dev_err(bridge->parent, "Resource busy, can't free\n");
 		return -EBUSY;
 	}
 
 	if (!(list_empty(&ctrlr->pending) && list_empty(&ctrlr->running))) {
-		printk(KERN_WARNING "Resource still processing transfers\n");
+		dev_warn(bridge->parent,
+			 "Resource still processing transfers\n");
 		mutex_unlock(&ctrlr->mtx);
 		return -EBUSY;
 	}
@@ -1290,8 +1308,9 @@ void vme_irq_handler(struct vme_bridge *bridge, int level, int statid)
 	if (call)
 		call(level, statid, priv_data);
 	else
-		printk(KERN_WARNING "Spurious VME interrupt, level:%x, vector:%x\n",
-		       level, statid);
+		dev_warn(bridge->parent,
+			 "Spurious VME interrupt, level:%x, vector:%x\n", level,
+			 statid);
 }
 EXPORT_SYMBOL(vme_irq_handler);
 
@@ -1319,17 +1338,18 @@ int vme_irq_request(struct vme_dev *vdev, int level, int statid,
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		return -EINVAL;
 	}
 
 	if ((level < 1) || (level > 7)) {
-		printk(KERN_ERR "Invalid interrupt level\n");
+		dev_err(bridge->parent, "Invalid interrupt level\n");
 		return -EINVAL;
 	}
 
 	if (!bridge->irq_set) {
-		printk(KERN_ERR "Configuring interrupts not supported\n");
+		dev_err(bridge->parent,
+			"Configuring interrupts not supported\n");
 		return -EINVAL;
 	}
 
@@ -1337,7 +1357,7 @@ int vme_irq_request(struct vme_dev *vdev, int level, int statid,
 
 	if (bridge->irq[level - 1].callback[statid].func) {
 		mutex_unlock(&bridge->irq_mtx);
-		printk(KERN_WARNING "VME Interrupt already taken\n");
+		dev_warn(bridge->parent, "VME Interrupt already taken\n");
 		return -EBUSY;
 	}
 
@@ -1368,17 +1388,18 @@ void vme_irq_free(struct vme_dev *vdev, int level, int statid)
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		return;
 	}
 
 	if ((level < 1) || (level > 7)) {
-		printk(KERN_ERR "Invalid interrupt level\n");
+		dev_err(bridge->parent, "Invalid interrupt level\n");
 		return;
 	}
 
 	if (!bridge->irq_set) {
-		printk(KERN_ERR "Configuring interrupts not supported\n");
+		dev_err(bridge->parent,
+			"Configuring interrupts not supported\n");
 		return;
 	}
 
@@ -1415,17 +1436,18 @@ int vme_irq_generate(struct vme_dev *vdev, int level, int statid)
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		return -EINVAL;
 	}
 
 	if ((level < 1) || (level > 7)) {
-		printk(KERN_WARNING "Invalid interrupt level\n");
+		dev_warn(bridge->parent, "Invalid interrupt level\n");
 		return -EINVAL;
 	}
 
 	if (!bridge->irq_generate) {
-		printk(KERN_WARNING "Interrupt generation not supported\n");
+		dev_warn(bridge->parent,
+			 "Interrupt generation not supported\n");
 		return -EINVAL;
 	}
 
@@ -1452,14 +1474,15 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		goto err_bus;
 	}
 
 	/* Loop through LM resources */
 	list_for_each_entry(lm, &bridge->lm_resources, list) {
 		if (!lm) {
-			printk(KERN_ERR "Registered NULL Location Monitor resource\n");
+			dev_err(bridge->parent,
+				"Registered NULL Location Monitor resource\n");
 			continue;
 		}
 
@@ -1511,10 +1534,11 @@ EXPORT_SYMBOL(vme_lm_request);
  */
 int vme_lm_count(struct vme_resource *resource)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
 	if (resource->type != VME_LM) {
-		printk(KERN_ERR "Not a Location Monitor resource\n");
+		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
 	}
 
@@ -1545,14 +1569,14 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 	struct vme_lm_resource *lm;
 
 	if (resource->type != VME_LM) {
-		printk(KERN_ERR "Not a Location Monitor resource\n");
+		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
 	}
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_set) {
-		printk(KERN_ERR "vme_lm_set not supported\n");
+		dev_err(bridge->parent, "vme_lm_set not supported\n");
 		return -EINVAL;
 	}
 
@@ -1581,14 +1605,14 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
 	struct vme_lm_resource *lm;
 
 	if (resource->type != VME_LM) {
-		printk(KERN_ERR "Not a Location Monitor resource\n");
+		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
 	}
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_get) {
-		printk(KERN_ERR "vme_lm_get not supported\n");
+		dev_err(bridge->parent, "vme_lm_get not supported\n");
 		return -EINVAL;
 	}
 
@@ -1618,14 +1642,14 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
 	struct vme_lm_resource *lm;
 
 	if (resource->type != VME_LM) {
-		printk(KERN_ERR "Not a Location Monitor resource\n");
+		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
 	}
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_attach) {
-		printk(KERN_ERR "vme_lm_attach not supported\n");
+		dev_err(bridge->parent, "vme_lm_attach not supported\n");
 		return -EINVAL;
 	}
 
@@ -1651,14 +1675,14 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
 	struct vme_lm_resource *lm;
 
 	if (resource->type != VME_LM) {
-		printk(KERN_ERR "Not a Location Monitor resource\n");
+		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
 	}
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_detach) {
-		printk(KERN_ERR "vme_lm_detach not supported\n");
+		dev_err(bridge->parent, "vme_lm_detach not supported\n");
 		return -EINVAL;
 	}
 
@@ -1680,10 +1704,11 @@ EXPORT_SYMBOL(vme_lm_detach);
  */
 void vme_lm_free(struct vme_resource *resource)
 {
+	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
 	if (resource->type != VME_LM) {
-		printk(KERN_ERR "Not a Location Monitor resource\n");
+		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return;
 	}
 
@@ -1720,12 +1745,12 @@ int vme_slot_num(struct vme_dev *vdev)
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		return -EINVAL;
 	}
 
 	if (!bridge->slot_get) {
-		printk(KERN_WARNING "vme_slot_num not supported\n");
+		dev_warn(bridge->parent, "vme_slot_num not supported\n");
 		return -EINVAL;
 	}
 
@@ -1748,7 +1773,7 @@ int vme_bus_num(struct vme_dev *vdev)
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		pr_err("Can't find VME bus\n");
+		dev_err(&vdev->dev, "Can't find VME bus\n");
 		return -EINVAL;
 	}
 
-- 
2.42.0

