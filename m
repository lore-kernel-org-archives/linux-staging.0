Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994A9D314
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 15:13:11 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-565f2567422so1101360eaf.2
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693062790; x=1693667590;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oq0LI/KHNjL7zR7iCS3xzTn6IPXIg6mMh2WLQOgxI9E=;
        b=dswIM4ZEspbehdc0BviHUuPZ3qYBEGHkbBMqWpX0s9G1E6mzT7faVXa6xNcrMB5u+1
         OVe34pCr+nor0yESX+c6Ok00btZqXLITDpx1em9GpK2tUDizv2p3FCl1e9QwPWmZBUVi
         sVOseqwtqKxa9kK3lhuJAroQE5xZ1/TBZGBORjwCUQY3L2xTvC05lq1CvV6O9JTCbWaD
         IToXq748mSbIgXrUIKJ1EzDLLH9e0kcd9ZuUwwuOTE8JUhK4jEzwYYttSBlr3kHZPYsx
         CeUySVuQN8Czd+iwCuBxRUK6KVvXNUZmz0szQ7yLx8ySnaZWXQ7bfuw7SzFonOSkn0z1
         DPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693062790; x=1693667590;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oq0LI/KHNjL7zR7iCS3xzTn6IPXIg6mMh2WLQOgxI9E=;
        b=HqsWqRqy//FfFsPtbfAwZXvF/aZydgDyADH9FDsptfc9cJgjmUwrvFOkaa870u/i5g
         s8qg/w3LWzp5BZqUtB94ZzyfixlzalRlpw1D85XQLR7V8M0opYXQyTB6MnmlIRvZy6hJ
         5Y3rTXqBBOSHQbw95UsOooijGwTXowzzRmthqNIGfFTREIKKws04I0tQJUgDrBc+6Z8P
         EqTWGJrI2viMX2TpOXVlJrs4bV9d/hnCwkuxvbtiJEf9/OCqJRsULtYO/9CI1UQ8fdb0
         BbTgkuWz6mK8Fm2wMRt6sRIKARBoByOzhCzHpqGgr1aS1ShZpWjT9jiZFq1jbOAKsSc4
         Qytw==
X-Gm-Message-State: AOJu0YyDKY8FKBmY3UlsUo1NpbAJy0+I90wyjmujoVz/R07U6QVyP2Cg
	TJlMEae6A7YUR/4NSq0+kOM=
X-Google-Smtp-Source: AGHT+IGewxSj9vk2klSCoa7YR1d3nQChWtgREK/UP7UCZHlpqrPHyFswYJjCKLORo5K62zm/fR9S9g==
X-Received: by 2002:a05:6870:46a0:b0:1bf:ec67:f2c6 with SMTP id a32-20020a05687046a000b001bfec67f2c6mr6347628oap.17.1693062790316;
        Sat, 26 Aug 2023 08:13:10 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id o6-20020a4a2c06000000b0057353c46b6bsm1351976ooo.2.2023.08.26.08.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:13:10 -0700 (PDT)
Date: Sat, 26 Aug 2023 12:13:05 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 1/4] staging: vme_user: fix check alignment of open
 parenthesis in vme_fake.c
Message-ID: <ZOoWgZ7ZnGyWHUKe@alolivei-thinkpadt480s.gru.csb>
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

Changes in v2:
- Fixed summary phrase with tags to indicate commit order
in the patch series, noted by Greg KH

 drivers/staging/vme_user/vme_fake.c | 65 +++++++++++++++--------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7c53a8a7b79b..a88d2c8a785b 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -105,7 +105,7 @@ static void fake_VIRQ_tasklet(unsigned long data)
  * Configure VME interrupt
  */
 static void fake_irq_set(struct vme_bridge *fake_bridge, int level,
-		int state, int sync)
+			 int state, int sync)
 {
 	/* Nothing to do */
 }
@@ -125,7 +125,7 @@ static dma_addr_t fake_ptr_to_pci(void *addr)
  * interrupt to be acked.
  */
 static int fake_irq_generate(struct vme_bridge *fake_bridge, int level,
-		int statid)
+			     int statid)
 {
 	struct fake_driver *bridge;
 
@@ -152,8 +152,8 @@ static int fake_irq_generate(struct vme_bridge *fake_bridge, int level,
  * Initialize a slave window with the requested attributes.
  */
 static int fake_slave_set(struct vme_slave_resource *image, int enabled,
-		unsigned long long vme_base, unsigned long long size,
-		dma_addr_t buf_base, u32 aspace, u32 cycle)
+			  unsigned long long vme_base, unsigned long long size,
+			  dma_addr_t buf_base, u32 aspace, u32 cycle)
 {
 	unsigned int i, granularity = 0;
 	unsigned long long vme_bound;
@@ -221,8 +221,8 @@ static int fake_slave_set(struct vme_slave_resource *image, int enabled,
  * Get slave window configuration.
  */
 static int fake_slave_get(struct vme_slave_resource *image, int *enabled,
-		unsigned long long *vme_base, unsigned long long *size,
-		dma_addr_t *buf_base, u32 *aspace, u32 *cycle)
+			  unsigned long long *vme_base, unsigned long long *size,
+			  dma_addr_t *buf_base, u32 *aspace, u32 *cycle)
 {
 	unsigned int i;
 	struct fake_driver *bridge;
@@ -249,8 +249,8 @@ static int fake_slave_get(struct vme_slave_resource *image, int *enabled,
  * Set the attributes of an outbound window.
  */
 static int fake_master_set(struct vme_master_resource *image, int enabled,
-		unsigned long long vme_base, unsigned long long size,
-		u32 aspace, u32 cycle, u32 dwidth)
+			   unsigned long long vme_base, unsigned long long size,
+			   u32 aspace, u32 cycle, u32 dwidth)
 {
 	int retval = 0;
 	unsigned int i;
@@ -335,8 +335,8 @@ static int fake_master_set(struct vme_master_resource *image, int enabled,
  * Set the attributes of an outbound window.
  */
 static int __fake_master_get(struct vme_master_resource *image, int *enabled,
-		unsigned long long *vme_base, unsigned long long *size,
-		u32 *aspace, u32 *cycle, u32 *dwidth)
+			     unsigned long long *vme_base, unsigned long long *size,
+			     u32 *aspace, u32 *cycle, u32 *dwidth)
 {
 	unsigned int i;
 	struct fake_driver *bridge;
@@ -356,15 +356,15 @@ static int __fake_master_get(struct vme_master_resource *image, int *enabled,
 }
 
 static int fake_master_get(struct vme_master_resource *image, int *enabled,
-		unsigned long long *vme_base, unsigned long long *size,
-		u32 *aspace, u32 *cycle, u32 *dwidth)
+			   unsigned long long *vme_base, unsigned long long *size,
+			   u32 *aspace, u32 *cycle, u32 *dwidth)
 {
 	int retval;
 
 	spin_lock(&image->lock);
 
 	retval = __fake_master_get(image, enabled, vme_base, size, aspace,
-			cycle, dwidth);
+				   cycle, dwidth);
 
 	spin_unlock(&image->lock);
 
@@ -511,7 +511,7 @@ static noinline_for_stack u32 fake_vmeread32(struct fake_driver *bridge,
 }
 
 static ssize_t fake_master_read(struct vme_master_resource *image, void *buf,
-		size_t count, loff_t offset)
+				size_t count, loff_t offset)
 {
 	int retval;
 	u32 aspace, cycle, dwidth;
@@ -700,7 +700,7 @@ static noinline_for_stack void fake_vmewrite32(struct fake_driver *bridge,
 }
 
 static ssize_t fake_master_write(struct vme_master_resource *image, void *buf,
-		size_t count, loff_t offset)
+				 size_t count, loff_t offset)
 {
 	int retval = 0;
 	u32 aspace, cycle, dwidth;
@@ -739,7 +739,7 @@ static ssize_t fake_master_write(struct vme_master_resource *image, void *buf,
 		if ((addr + done) & 0x2) {
 			if ((count - done) < 2) {
 				fake_vmewrite8(bridge, (u8 *)(buf + done),
-						addr + done, aspace, cycle);
+					       addr + done, aspace, cycle);
 				done += 1;
 				goto out;
 			} else {
@@ -768,7 +768,7 @@ static ssize_t fake_master_write(struct vme_master_resource *image, void *buf,
 		count32 = (count - done);
 		while (done < count32) {
 			fake_vmewrite8(bridge, (u8 *)(buf + done), addr + done,
-					aspace, cycle);
+				       aspace, cycle);
 			done += 1;
 		}
 
@@ -784,7 +784,7 @@ static ssize_t fake_master_write(struct vme_master_resource *image, void *buf,
 
 	if ((count - done) & 0x1) {
 		fake_vmewrite8(bridge, (u8 *)(buf + done), addr + done, aspace,
-				cycle);
+			       cycle);
 		done += 1;
 	}
 
@@ -802,8 +802,8 @@ static ssize_t fake_master_write(struct vme_master_resource *image, void *buf,
  * Requires a previously configured master window, returns final value.
  */
 static unsigned int fake_master_rmw(struct vme_master_resource *image,
-		unsigned int mask, unsigned int compare, unsigned int swap,
-		loff_t offset)
+				    unsigned int mask, unsigned int compare,
+				    unsigned int swap, loff_t offset)
 {
 	u32 tmp, base;
 	u32 aspace, cycle;
@@ -848,7 +848,7 @@ static unsigned int fake_master_rmw(struct vme_master_resource *image,
  * callback is attached and disabled when the last callback is removed.
  */
 static int fake_lm_set(struct vme_lm_resource *lm, unsigned long long lm_base,
-		u32 aspace, u32 cycle)
+		       u32 aspace, u32 cycle)
 {
 	int i;
 	struct vme_bridge *fake_bridge;
@@ -894,7 +894,8 @@ static int fake_lm_set(struct vme_lm_resource *lm, unsigned long long lm_base,
  * or disabled.
  */
 static int fake_lm_get(struct vme_lm_resource *lm,
-		unsigned long long *lm_base, u32 *aspace, u32 *cycle)
+		       unsigned long long *lm_base,
+		       u32 *aspace, u32 *cycle)
 {
 	struct fake_driver *bridge;
 
@@ -917,7 +918,7 @@ static int fake_lm_get(struct vme_lm_resource *lm,
  * Callback will be passed the monitor triggered.
  */
 static int fake_lm_attach(struct vme_lm_resource *lm, int monitor,
-		void (*callback)(void *), void *data)
+			  void (*callback)(void *), void *data)
 {
 	struct vme_bridge *fake_bridge;
 	struct fake_driver *bridge;
@@ -995,7 +996,7 @@ static int fake_slot_get(struct vme_bridge *fake_bridge)
 }
 
 static void *fake_alloc_consistent(struct device *parent, size_t size,
-		dma_addr_t *dma)
+				   dma_addr_t *dma)
 {
 	void *alloc = kmalloc(size, GFP_KERNEL);
 
@@ -1006,7 +1007,7 @@ static void *fake_alloc_consistent(struct device *parent, size_t size,
 }
 
 static void fake_free_consistent(struct device *parent, size_t size,
-		void *vaddr, dma_addr_t dma)
+				 void *vaddr, dma_addr_t dma)
 {
 	kfree(vaddr);
 /*
@@ -1094,7 +1095,7 @@ static int __init fake_init(void)
 	mutex_init(&fake_device->vme_int);
 	mutex_init(&fake_bridge->irq_mtx);
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
-			(unsigned long) fake_bridge);
+		     (unsigned long) fake_bridge);
 
 	strcpy(fake_bridge->name, driver_name);
 
@@ -1118,10 +1119,10 @@ static int __init fake_init(void)
 			VME_PROG | VME_DATA;
 		master_image->width_attr = VME_D16 | VME_D32;
 		memset(&master_image->bus_resource, 0,
-				sizeof(struct resource));
+		       sizeof(struct resource));
 		master_image->kern_base  = NULL;
 		list_add_tail(&master_image->list,
-				&fake_bridge->master_resources);
+			      &fake_bridge->master_resources);
 	}
 
 	/* Add slave windows to list */
@@ -1144,7 +1145,7 @@ static int __init fake_init(void)
 			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		list_add_tail(&slave_image->list,
-				&fake_bridge->slave_resources);
+			      &fake_bridge->slave_resources);
 	}
 
 	/* Add location monitor to list */
@@ -1179,7 +1180,7 @@ static int __init fake_init(void)
 	fake_bridge->free_consistent = fake_free_consistent;
 
 	pr_info("Board is%s the VME system controller\n",
-			(geoid == 1) ? "" : " not");
+		(geoid == 1) ? "" : " not");
 
 	pr_info("VME geographical address is set to %d\n", geoid);
 
@@ -1220,7 +1221,7 @@ static int __init fake_init(void)
 	/* resources are stored in link list */
 	list_for_each_safe(pos, n, &fake_bridge->master_resources) {
 		master_image = list_entry(pos, struct vme_master_resource,
-				list);
+					  list);
 		list_del(pos);
 		kfree(master_image);
 	}
@@ -1275,7 +1276,7 @@ static void __exit fake_exit(void)
 	/* resources are stored in link list */
 	list_for_each_safe(pos, tmplist, &fake_bridge->master_resources) {
 		master_image = list_entry(pos, struct vme_master_resource,
-				list);
+					  list);
 		list_del(pos);
 		kfree(master_image);
 	}
-- 
2.41.0

