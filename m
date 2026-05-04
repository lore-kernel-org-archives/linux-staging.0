Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9433E8695
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916671; cv=none; b=XPcslsoGKz11L8xZXOK7LpOkvIZJ3oo1X4+SMvUl6lZ44rkW7GYYbvHiQvamWwGqkGL+SHdF3pIu70jK03eXjjcdanxBBAYbiZi1w0IOcf/LD3F1JBXaU7TFvdJXuxAapWllg9tCbSZ8oiB2OlUJVu2FRyTzXb7q+h7KbQdUx64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916671; c=relaxed/simple;
	bh=ljXu06prXqeM8aN+pDkYcTLkd9uj3USoTErBoJjULMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CR3uBUOK2Lpwk+6pcOHOER6XzWcYZpb0kvt/VO4a/uGEehxLJoUm7punGman9jaKKuVdmwfAMP4xTuuJpyqD/DEalijGwl56XVO7bkArgf/uoF6Eph/iERaYa87St9o/sQYQXajj1aqNz+JixM3+41vxsUTFDgKTKzyXT/n/X90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBbutWGC; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBbutWGC"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35fb262f92cso936524a91.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916669; x=1778521469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8guKFW09aWcQMysukiayjmHpzsRdkyFcerbXkZ1AaIE=;
        b=iBbutWGCG4rQs3WRnfmHG/zgI8rzjwc1Sk39DY/WzKFmKyoJKgF/csqTrHw+eJ57oX
         aJaTgC7XlbAeswOAXsy4aQhXP4Taol10ch7o8Z81uuzAmH1wN+GjJNApAMjbOHYZMxK7
         L1kfPql7rYl9vqryCsmhAVvm8w39LinwmyWF9hqcgUC3ByVU4rnV7B49ei4Y3FajvIlL
         TFkE7nTLKnojt1au+l/RfEkg4iur/fjJ82CVqiuGmTh2PYv6YinmufCFOtf2Q2/u19r1
         LupWzvikbDuGkuY4/MMS67+3drYyPQJRf3ubB2+49uzlZsGstoerDaJGxfiS3ypv0cAa
         YtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916669; x=1778521469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8guKFW09aWcQMysukiayjmHpzsRdkyFcerbXkZ1AaIE=;
        b=aDuWErWiurYeGrlcNjH7QfEfWImLwje58gyNzcnSem65LRrZQn+7fjYgawzw14/IXn
         HnlknPwiY7SUVJK8iNKmDtrMF8hR6ikch1aSzwv+plzRopFeQk/GpGeOj6X74y6Ciz/R
         RSFzakwyeOeod09Pq1V8zj7YKi20cJkFFNgZompJqrhU7KjG9c4kAb1a6JrThgLuNMhk
         R4Tnh0GgaLSMdiUlJIIYrm219CGoD2IQEXCH1kZNsDKadIa9IJkMrC2ForLBsOUKM8H/
         CZhDHCzAi9TVXC0Is9E784M6l0Y/0LONLVLR8Z50RH4PqcyY3LHyrL2HUktmDDem9RMK
         v94A==
X-Gm-Message-State: AOJu0Yzvp5CWC07AYHOwBcoCJRsoOz6Myabpi+J1YSuMzcHdo6+FSsee
	erz8UUeml5nvK1b+G7e12Hjy6Wqg2f9sYwqScSpEjgIfo/9TYzIIRk+6
X-Gm-Gg: AeBDievXSiz7QpPrk2l/04pPOmCMvDg6z1zUNAg1tirPgTRHmfy9raNMfv3JVj3sSjY
	oqOTubG+j/I9gI7VxGIHiS1yzIDqvPskIE9/XmePw13hLVK43pTxsNAD4HSMtihY66x8sVMj5Iv
	MBe2yMS9456IEeYUjGwOawIW5HGa2opTRJUs5PUo7TurWGW+iBL4C8Seu5DZ3IoDAaEzIv5fMAJ
	C0s9gfvzXAqi4dsiBiHXdRiMR3K+w1ZIqBRZBJ5+BzZS2spF1i2mVLKiSQJCKgHJQTacJhTPm+l
	k/EEefEv5mTLz0gmF8e42Z3O1woO4Ze7dCnpBRn4ylHtGrfEEtjDMsDqiSrhRWMBfCeqmnIzfOu
	lc4MwSKLqXDyrnKqxqO2gJa8W83D+8Zdq6z8eFGYoEcZ9goDSRJV7COP4HZDyvtJbPND6lNkwLq
	erOOhxk9P/r3Y6f4QNFK9vgucvXPm2cYDW+kP4Tm4cKqgtp19lzUzF8r+G/73jHgqgfAGPyw5yj
	CXEZMtvWheSK0THCV9aawTE450=
X-Received: by 2002:a05:6a21:3202:b0:38b:d93f:bbf5 with SMTP id adf61e73a8af0-3a7f177d8b1mr5873992637.0.1777916668662;
        Mon, 04 May 2026 10:44:28 -0700 (PDT)
Received: from fedora ([2401:4900:a3fd:82cb:c080:4c49:655c:41ba])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83707fab756sm5923388b3a.44.2026.05.04.10.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:44:28 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v6 3/3] staging: octeon: replace pr_warn with dev_warn in fill path and refactor rx group to per-device state
Date: Mon,  4 May 2026 23:11:46 +0530
Message-ID: <20260504174146.117026-4-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504174146.117026-1-ayushmukkanwar@gmail.com>
References: <20260504174146.117026-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct platform_device parameter to cvm_oct_fill_hw_memory,
cvm_oct_mem_fill_fpa, cvm_oct_rx_refill_pool and
cvm_oct_rx_initialize to support device-aware logging. Replace
pr_warn with dev_warn using &pdev->dev.
To avoid passing these parameters through global state, introduce
struct octeon_ethernet_platform to hold per-device state including
the rx_refill_work and the oct_rx_group array. This ensures all
receive group state and workers are correctly associated with the
platform device.
Define struct oct_rx_group and struct octeon_ethernet_platform in
octeon-ethernet.h so they are shared across compilation units.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c    | 16 ++++----
 drivers/staging/octeon/ethernet-mem.h    |  3 +-
 drivers/staging/octeon/ethernet-rx.c     | 49 ++++++++++++------------
 drivers/staging/octeon/ethernet-rx.h     | 11 ++++--
 drivers/staging/octeon/ethernet.c        | 38 +++++++++++-------
 drivers/staging/octeon/octeon-ethernet.h | 14 +++++++
 6 files changed, 81 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 11036c6eb36f..68c3ef984e56 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -41,7 +41,7 @@ static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
 
 /**
  * cvm_oct_free_hw_skbuff- free hardware pool skbuffs
- * @pdev:      Platform device for logging
+ * @pdev:     Platform device for logging
  * @pool:     Pool to allocate an skbuff for
  * @size:     Size of the buffer needed for the pool
  * @elements: Number of buffers to allocate
@@ -71,13 +71,15 @@ static void cvm_oct_free_hw_skbuff(struct platform_device *pdev,
 
 /**
  * cvm_oct_fill_hw_memory - fill a hardware pool with memory.
+ * @pdev:     Platform device for logging
  * @pool:     Pool to populate
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers to allocate
  *
  * Returns the actual number of buffers allocated.
  */
-static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
+static int cvm_oct_fill_hw_memory(struct platform_device *pdev, int pool, int size,
+				  int elements)
 {
 	char *memory;
 	char *fpa;
@@ -96,8 +98,8 @@ static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
 		 */
 		memory = kmalloc(size + 256, GFP_ATOMIC);
 		if (unlikely(!memory)) {
-			pr_warn("Unable to allocate %u bytes for FPA pool %d\n",
-				elements * size, pool);
+			dev_warn(&pdev->dev, "Unable to allocate %u bytes for FPA pool %d\n",
+				 elements * size, pool);
 			break;
 		}
 		fpa = (char *)(((unsigned long)memory + 256) & ~0x7fUL);
@@ -110,7 +112,7 @@ static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
 
 /**
  * cvm_oct_free_hw_memory - Free memory allocated by cvm_oct_fill_hw_memory
- * @pdev:      Platform device for logging
+ * @pdev:     Platform device for logging
  * @pool:     FPA pool to free
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers that should be in the pool
@@ -139,14 +141,14 @@ static void cvm_oct_free_hw_memory(struct platform_device *pdev,
 			 pool, elements);
 }
 
-int cvm_oct_mem_fill_fpa(int pool, int size, int elements)
+int cvm_oct_mem_fill_fpa(struct platform_device *pdev, int pool, int size, int elements)
 {
 	int freed;
 
 	if (pool == CVMX_FPA_PACKET_POOL)
 		freed = cvm_oct_fill_hw_skbuff(pool, size, elements);
 	else
-		freed = cvm_oct_fill_hw_memory(pool, size, elements);
+		freed = cvm_oct_fill_hw_memory(pdev, pool, size, elements);
 	return freed;
 }
 
diff --git a/drivers/staging/octeon/ethernet-mem.h b/drivers/staging/octeon/ethernet-mem.h
index ff10ba4525ee..9279bb0de2db 100644
--- a/drivers/staging/octeon/ethernet-mem.h
+++ b/drivers/staging/octeon/ethernet-mem.h
@@ -5,8 +5,9 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
-int cvm_oct_mem_fill_fpa(int pool, int size, int elements);
 struct platform_device;
 
+int cvm_oct_mem_fill_fpa(struct platform_device *pdev, int pool, int size,
+			 int elements);
 void cvm_oct_mem_empty_fpa(struct platform_device *pdev, int pool, int size,
 			   int elements);
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index d0b43d50b83c..cd36b5ba6f6c 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2003-2010 Cavium Networks
  */
 
+#include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/cache.h>
@@ -31,12 +32,6 @@
 
 static atomic_t oct_rx_ready = ATOMIC_INIT(0);
 
-static struct oct_rx_group {
-	int irq;
-	int group;
-	struct napi_struct napi;
-} oct_rx_group[16];
-
 /**
  * cvm_oct_do_interrupt - interrupt handler.
  * @irq: Interrupt number.
@@ -397,7 +392,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
 		/* Restore the scratch area */
 		cvmx_scratch_write64(CVMX_SCR_SCRATCH, old_scratch);
 	}
-	cvm_oct_rx_refill_pool(0);
+	cvm_oct_rx_refill_pool(rx_group->pdev, 0);
 
 	return rx_count;
 }
@@ -434,24 +429,28 @@ static int cvm_oct_napi_poll(struct napi_struct *napi, int budget)
  */
 void cvm_oct_poll_controller(struct net_device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev->dev.parent);
+	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	int i;
 
 	if (!atomic_read(&oct_rx_ready))
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(oct_rx_group); i++) {
+	for (i = 0; i < ARRAY_SIZE(plat->rx_group); i++) {
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
-		cvm_oct_poll(&oct_rx_group[i], 16);
+		cvm_oct_poll(&plat->rx_group[i], 16);
 	}
 }
 #endif
 
-void cvm_oct_rx_initialize(void)
+void cvm_oct_rx_initialize(struct platform_device *pdev)
 {
 	int i;
 	struct net_device *dev_for_napi = NULL;
+	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
+	struct oct_rx_group *rx_group = plat->rx_group;
 
 	for (i = 0; i < TOTAL_NUMBER_OF_PORTS; i++) {
 		if (cvm_oct_device[i]) {
@@ -463,27 +462,28 @@ void cvm_oct_rx_initialize(void)
 	if (!dev_for_napi)
 		panic("No net_devices were allocated.");
 
-	for (i = 0; i < ARRAY_SIZE(oct_rx_group); i++) {
+	for (i = 0; i < ARRAY_SIZE(plat->rx_group); i++) {
 		int ret;
 
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
-		netif_napi_add_weight(dev_for_napi, &oct_rx_group[i].napi,
+		netif_napi_add_weight(dev_for_napi, &rx_group[i].napi,
 				      cvm_oct_napi_poll, rx_napi_weight);
-		napi_enable(&oct_rx_group[i].napi);
+		napi_enable(&rx_group[i].napi);
 
-		oct_rx_group[i].irq = OCTEON_IRQ_WORKQ0 + i;
-		oct_rx_group[i].group = i;
+		rx_group[i].irq = OCTEON_IRQ_WORKQ0 + i;
+		rx_group[i].group = i;
+		rx_group[i].pdev = pdev;
 
 		/* Register an IRQ handler to receive POW interrupts */
-		ret = request_irq(oct_rx_group[i].irq, cvm_oct_do_interrupt, 0,
-				  "Ethernet", &oct_rx_group[i].napi);
+		ret = request_irq(rx_group[i].irq, cvm_oct_do_interrupt, 0,
+				  "Ethernet", &rx_group[i].napi);
 		if (ret)
 			panic("Could not acquire Ethernet IRQ %d\n",
-			      oct_rx_group[i].irq);
+			      rx_group[i].irq);
 
-		disable_irq_nosync(oct_rx_group[i].irq);
+		disable_irq_nosync(rx_group[i].irq);
 
 		/* Enable POW interrupt when our port has at least one packet */
 		if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
@@ -515,16 +515,17 @@ void cvm_oct_rx_initialize(void)
 		/* Schedule NAPI now. This will indirectly enable the
 		 * interrupt.
 		 */
-		napi_schedule(&oct_rx_group[i].napi);
+		napi_schedule(&rx_group[i].napi);
 	}
 	atomic_inc(&oct_rx_ready);
 }
 
-void cvm_oct_rx_shutdown(void)
+void cvm_oct_rx_shutdown(struct platform_device *pdev)
 {
+	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(oct_rx_group); i++) {
+	for (i = 0; i < ARRAY_SIZE(plat->rx_group); i++) {
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
@@ -535,8 +536,8 @@ void cvm_oct_rx_shutdown(void)
 			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
 
 		/* Free the interrupt handler */
-		free_irq(oct_rx_group[i].irq, &oct_rx_group[i].napi);
+		free_irq(plat->rx_group[i].irq, &plat->rx_group[i].napi);
 
-		netif_napi_del(&oct_rx_group[i].napi);
+		netif_napi_del(&plat->rx_group[i].napi);
 	}
 }
diff --git a/drivers/staging/octeon/ethernet-rx.h b/drivers/staging/octeon/ethernet-rx.h
index ff6482fa20d6..6093694326cb 100644
--- a/drivers/staging/octeon/ethernet-rx.h
+++ b/drivers/staging/octeon/ethernet-rx.h
@@ -5,11 +5,14 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
+struct platform_device;
+
 void cvm_oct_poll_controller(struct net_device *dev);
-void cvm_oct_rx_initialize(void);
-void cvm_oct_rx_shutdown(void);
+void cvm_oct_rx_initialize(struct platform_device *pdev);
+void cvm_oct_rx_shutdown(struct platform_device *pdev);
 
-static inline void cvm_oct_rx_refill_pool(int fill_threshold)
+static inline void cvm_oct_rx_refill_pool(struct platform_device *pdev,
+					  int fill_threshold)
 {
 	int number_to_free;
 	int num_freed;
@@ -20,7 +23,7 @@ static inline void cvm_oct_rx_refill_pool(int fill_threshold)
 	if (number_to_free > fill_threshold) {
 		cvmx_fau_atomic_add32(FAU_NUM_PACKET_BUFFERS_TO_FREE,
 				      -number_to_free);
-		num_freed = cvm_oct_mem_fill_fpa(CVMX_FPA_PACKET_POOL,
+		num_freed = cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_PACKET_POOL,
 						 CVMX_FPA_PACKET_POOL_SIZE,
 						 number_to_free);
 		if (num_freed != number_to_free) {
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 27c282ef64dd..d0e5ac426e41 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -104,11 +104,10 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
 
 u64 cvm_oct_tx_poll_interval;
 
-static void cvm_oct_rx_refill_worker(struct work_struct *work);
-static DECLARE_DELAYED_WORK(cvm_oct_rx_refill_work, cvm_oct_rx_refill_worker);
-
 static void cvm_oct_rx_refill_worker(struct work_struct *work)
 {
+	struct octeon_ethernet_platform *plat = container_of(work,
+		struct octeon_ethernet_platform, rx_refill_work.work);
 	/*
 	 * FPA 0 may have been drained, try to refill it if we need
 	 * more than num_packet_buffers / 2, otherwise normal receive
@@ -116,10 +115,10 @@ static void cvm_oct_rx_refill_worker(struct work_struct *work)
 	 * could be received so cvm_oct_napi_poll would never be
 	 * invoked to do the refill.
 	 */
-	cvm_oct_rx_refill_pool(num_packet_buffers / 2);
+	cvm_oct_rx_refill_pool(plat->pdev, num_packet_buffers / 2);
 
 	if (!atomic_read(&cvm_oct_poll_queue_stopping))
-		schedule_delayed_work(&cvm_oct_rx_refill_work, HZ);
+		schedule_delayed_work(&plat->rx_refill_work, HZ);
 }
 
 static void cvm_oct_periodic_worker(struct work_struct *work)
@@ -138,16 +137,16 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
 		schedule_delayed_work(&priv->port_periodic_work, HZ);
 }
 
-static void cvm_oct_configure_common_hw(void)
+static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 {
 	/* Setup the FPA */
 	cvmx_fpa_enable();
-	cvm_oct_mem_fill_fpa(CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
+	cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
 			     num_packet_buffers);
-	cvm_oct_mem_fill_fpa(CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
+	cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
-		cvm_oct_mem_fill_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
+		cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
 				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
 
 #ifdef __LITTLE_ENDIAN
@@ -678,6 +677,15 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	int qos;
 	struct device_node *pip;
 	int mtu_overhead = ETH_HLEN + ETH_FCS_LEN;
+	struct octeon_ethernet_platform *plat;
+
+	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	if (!plat)
+		return -ENOMEM;
+
+	plat->pdev = pdev;
+	INIT_DELAYED_WORK(&plat->rx_refill_work, cvm_oct_rx_refill_worker);
+	platform_set_drvdata(pdev, plat);
 
 #if IS_ENABLED(CONFIG_VLAN_8021Q)
 	mtu_overhead += VLAN_HLEN;
@@ -689,7 +697,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cvm_oct_configure_common_hw();
+	cvm_oct_configure_common_hw(pdev);
 
 	cvmx_helper_initialize_packet_io_global();
 
@@ -912,28 +920,30 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	}
 
 	cvm_oct_tx_initialize();
-	cvm_oct_rx_initialize();
+	cvm_oct_rx_initialize(pdev);
 
 	/*
 	 * 150 uS: about 10 1500-byte packets at 1GE.
 	 */
 	cvm_oct_tx_poll_interval = 150 * (octeon_get_clock_rate() / 1000000);
 
-	schedule_delayed_work(&cvm_oct_rx_refill_work, HZ);
+	schedule_delayed_work(&plat->rx_refill_work, HZ);
 
 	return 0;
 }
 
 static void cvm_oct_remove(struct platform_device *pdev)
 {
+	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	int port;
 
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
-	cancel_delayed_work_sync(&cvm_oct_rx_refill_work);
 
-	cvm_oct_rx_shutdown();
+	cancel_delayed_work_sync(&plat->rx_refill_work);
+
+	cvm_oct_rx_shutdown(pdev);
 	cvm_oct_tx_shutdown();
 
 	cvmx_pko_disable();
diff --git a/drivers/staging/octeon/octeon-ethernet.h b/drivers/staging/octeon/octeon-ethernet.h
index a6140705706f..0ac430db1e6e 100644
--- a/drivers/staging/octeon/octeon-ethernet.h
+++ b/drivers/staging/octeon/octeon-ethernet.h
@@ -11,6 +11,7 @@
 #ifndef OCTEON_ETHERNET_H
 #define OCTEON_ETHERNET_H
 
+#include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/phy.h>
 
@@ -74,6 +75,19 @@ struct octeon_ethernet {
 	struct device_node	*of_node;
 };
 
+struct oct_rx_group {
+	int irq;
+	int group;
+	struct napi_struct napi;
+	struct platform_device *pdev;
+};
+
+struct octeon_ethernet_platform {
+	struct platform_device *pdev;
+	struct delayed_work rx_refill_work;
+	struct oct_rx_group rx_group[16];
+};
+
 int cvm_oct_free_work(void *work_queue_entry);
 
 int cvm_oct_rgmii_open(struct net_device *dev);
-- 
2.53.0

