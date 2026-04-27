Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75A3358D3
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303095; cv=none; b=lmr+OWhPY771Fq++gidAtPI9Lrq+CJUGPVR3XuBEEo9NMyFn/aoZJf3Q8Due6iukawHvqLzixTRxqpvz85k539+n/ZlR3sUoZm868Xlmok9Wi09lqmSsVr4D4JsSzIwAGp9bw8ED4z34bUD6IiDkPD2ZCwncrKJ8P2fQnrt5rpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303095; c=relaxed/simple;
	bh=K0LimqIiSqrHSUtLwoPv3cQGCgKfxCZALm+gQtdqAbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjGZ+6J0N+Xu8gU0APwYN+zKCNb0JU5WR2T4bkgN7Ov+izkcLPIHNDBtV3xo3RrYhbN13nn5DuCY4yig5oLSxUhmCUm+KfpYTcz6KT7kQ3Z9CedDVTiJaUjUbmJ08cF+s/pSfOd5vOOctI/FYPxMMa69an/Wqvodzd1IvCEpBp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnK9hLt1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnK9hLt1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f1f03754bso504191b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777303093; x=1777907893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F9ROGKgvLVsMpv8CKey1oFnOTJMM8x5mbzOlOICtYU=;
        b=EnK9hLt1pa6FzvhkDFhpny68HheoY/diotR5gbUCfGp8ql+a2uq5H/sauiSpGN+HtX
         owK9TR6Rotkt3+IX8TiOoCgw6hr56g6ndUfmvNTyirqrT1ViRbXdMLR8XC3uhKG1pLZx
         ZY5DrkJtcWSHA0TM8Q/zWefwfahA2uCp1yfn0A5iukS3ukkurC287ZrDZdpPZsML5/aS
         rYLTkQ7EasCzgi3r+bu3hZBuR8KRCbotufQ1rLVX6jdyU4XZv3ifMetW6002murqj4N6
         WXIw4EYc6NulVVyjYRpHtMf8do5L45EvGGfom/u+mlv/lRrIVMAwO56XviaiJMGPuVr2
         HHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303093; x=1777907893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1F9ROGKgvLVsMpv8CKey1oFnOTJMM8x5mbzOlOICtYU=;
        b=iVUMmea7z+K89J1rF0P8E1HiHRJbH8M1TIWHIWhw2Gb1uvetxPL9K0aux8/ejjfLxT
         e9u9biZE8OhFehAs9AUrey1OybNpyPqncpWgx9MzFlSDsaDy438RaslGZ2HH4xXrE/5/
         rdj/u7u/BzhQzU0ix105YsLGi3lbR3IBMMgYYnaIWmCYLXTF4FTWHpN6iSYgN9SO+sxE
         V7ZjXOFLz7uXVx1SVVrKB7G6Yc8+jySmgDj+fBMCBxZ34DkPZQUrvM0Arjb8pExP4+mL
         UWxGjnkkQmKZJKVIsmuDGum7G7uDBnJsMcyhBLMaFLc1Szd5hWmbADbeavQ9GWlmW0xu
         teRg==
X-Forwarded-Encrypted: i=1; AFNElJ9HO97lhBLaVG2VhrzJFq5rkwZeVZ6xP/dvvpopt7MZsz58RkJUZDlVeQY/3TEjblLQM3NL8Wf4OkBZiOE8@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe7Nxb4OOk809EeiaUJZTT/kR1EJvF7rWg61T35HtBdKLc+Yts
	RxIH8SiBFiQ9NDVawBnDeERlAiej04dMHtbjVORENz5lhh0izj4qMny/
X-Gm-Gg: AeBDievngNR1AhPBkqQ2uRFDZZ45JybxnLCnRPT+DBqMAGWCECYLzE+GJO4VAmOJnvz
	VoGEpBprWpYIenrZbBJray3d86Fun6+/QDzqYrgJA/AApcUmSUOn6NFOblPkmLak3TCj6eJvF1+
	1LqQVKffywqN98RsezNZM3+Y5D05BaZeug/PNfGP22vqN6ivGLQabrTi+q/sb6tjvdT69i2PZqS
	NGDokMk7x+gTOVnvQV8sP/Rad5/BZrJrvBbqzD/ZjtOvx1FPdApDivmL68fiZeGeUFImYGYvAzR
	WmlNABTCncJbPDlhg5UNiGG0jVdx+lUKqyt9UUYiQ7qG1ane+lDYWA+uzufWz6j6vBrbLiWvFLo
	oSwYMvU+9Zc8reoyr0pDJWe84Yc3oc5+tNMB2nPaYflkdN1cTfpGaVcnE8uRL+VPdhqLzxB8wqf
	KY1rMNvkVoSPWTTVli8Dh0rQXlNGBSxndU6DZey19JabHqnGBqyYsoqb4jMkdyC3boX3P7k3M+U
	GJDyaWw/mWDd6754yG4L4DRi4Q=
X-Received: by 2002:a05:6a00:bd86:b0:824:9f50:83c7 with SMTP id d2e1a72fcca58-82f8c2bd514mr23153459b3a.0.1777303092994;
        Mon, 27 Apr 2026 08:18:12 -0700 (PDT)
Received: from fedora ([2401:4900:d824:7468:545f:3159:76d5:30ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm37652931b3a.58.2026.04.27.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:18:12 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ayushmukkanwar@gmail.com
Subject: [PATCH v5 4/4] staging: octeon: refactor to per-device state and pass platform_device
Date: Mon, 27 Apr 2026 20:45:55 +0530
Message-ID: <20260427151556.91153-5-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
References: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the static oct_rx_group array from ethernet-rx.c into the
octeon_ethernet_platform structure to associate receive group state
with the platform device. Pass struct platform_device instead of
struct device through the ethernet-mem and ethernet-rx call chains,
extracting &pdev->dev only at the point of use in dev_warn() calls.

Move struct oct_rx_group and struct octeon_ethernet_platform
definitions into octeon-ethernet.h so they are shared across
compilation units.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c    | 34 ++++++++--------
 drivers/staging/octeon/ethernet-mem.h    |  8 +++-
 drivers/staging/octeon/ethernet-rx.c     | 51 ++++++++++++------------
 drivers/staging/octeon/ethernet-rx.h     | 11 +++--
 drivers/staging/octeon/ethernet.c        | 29 ++++++--------
 drivers/staging/octeon/octeon-ethernet.h | 18 ++++++++-
 6 files changed, 83 insertions(+), 68 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index f182698dd057..c9b439aaf23f 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -5,13 +5,13 @@
  * Copyright (c) 2003-2010 Cavium Networks
  */
 
+#include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
 #include <linux/slab.h>
 
 #include "octeon-ethernet.h"
 #include "ethernet-mem.h"
-#include "ethernet-defines.h"
 
 /**
  * cvm_oct_fill_hw_skbuff - fill the supplied hardware pool with skbuffs
@@ -40,12 +40,12 @@ static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
 
 /**
  * cvm_oct_free_hw_skbuff- free hardware pool skbuffs
- * @dev:      Device for logging
+ * @pdev:     Platform device for logging
  * @pool:     Pool to allocate an skbuff for
  * @size:     Size of the buffer needed for the pool
  * @elements: Number of buffers to allocate
  */
-static void cvm_oct_free_hw_skbuff(struct device *dev,
+static void cvm_oct_free_hw_skbuff(struct platform_device *pdev,
 				   int pool, int size, int elements)
 {
 	char *memory;
@@ -61,23 +61,23 @@ static void cvm_oct_free_hw_skbuff(struct device *dev,
 	} while (memory);
 
 	if (elements < 0)
-		dev_warn(dev, "Freeing of pool %u had too many skbuffs (%d)\n",
+		dev_warn(&pdev->dev, "Freeing of pool %u had too many skbuffs (%d)\n",
 			 pool, elements);
 	else if (elements > 0)
-		dev_warn(dev, "Freeing of pool %u is missing %d skbuffs\n",
+		dev_warn(&pdev->dev, "Freeing of pool %u is missing %d skbuffs\n",
 			 pool, elements);
 }
 
 /**
  * cvm_oct_fill_hw_memory - fill a hardware pool with memory.
- * @dev:      Device for logging
+ * @pdev:     Platform device for logging
  * @pool:     Pool to populate
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers to allocate
  *
  * Returns the actual number of buffers allocated.
  */
-static int cvm_oct_fill_hw_memory(struct device *dev, int pool, int size,
+static int cvm_oct_fill_hw_memory(struct platform_device *pdev, int pool, int size,
 				  int elements)
 {
 	char *memory;
@@ -97,7 +97,7 @@ static int cvm_oct_fill_hw_memory(struct device *dev, int pool, int size,
 		 */
 		memory = kmalloc(size + 256, GFP_ATOMIC);
 		if (unlikely(!memory)) {
-			dev_warn(dev, "Unable to allocate %u bytes for FPA pool %d\n",
+			dev_warn(&pdev->dev, "Unable to allocate %u bytes for FPA pool %d\n",
 				 elements * size, pool);
 			break;
 		}
@@ -111,12 +111,12 @@ static int cvm_oct_fill_hw_memory(struct device *dev, int pool, int size,
 
 /**
  * cvm_oct_free_hw_memory - Free memory allocated by cvm_oct_fill_hw_memory
- * @dev:      Device for logging
+ * @pdev:     Platform device for logging
  * @pool:     FPA pool to free
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers that should be in the pool
  */
-static void cvm_oct_free_hw_memory(struct device *dev,
+static void cvm_oct_free_hw_memory(struct platform_device *pdev,
 				   int pool, int size, int elements)
 {
 	char *memory;
@@ -133,28 +133,28 @@ static void cvm_oct_free_hw_memory(struct device *dev,
 	} while (fpa);
 
 	if (elements < 0)
-		dev_warn(dev, "Freeing of pool %u had too many buffers (%d)\n",
+		dev_warn(&pdev->dev, "Freeing of pool %u had too many buffers (%d)\n",
 			 pool, elements);
 	else if (elements > 0)
-		dev_warn(dev, "Freeing of pool %u is missing %d buffers\n",
+		dev_warn(&pdev->dev, "Freeing of pool %u is missing %d buffers\n",
 			 pool, elements);
 }
 
-int cvm_oct_mem_fill_fpa(struct device *dev, int pool, int size, int elements)
+int cvm_oct_mem_fill_fpa(struct platform_device *pdev, int pool, int size, int elements)
 {
 	int freed;
 
 	if (pool == CVMX_FPA_PACKET_POOL)
 		freed = cvm_oct_fill_hw_skbuff(pool, size, elements);
 	else
-		freed = cvm_oct_fill_hw_memory(dev, pool, size, elements);
+		freed = cvm_oct_fill_hw_memory(pdev, pool, size, elements);
 	return freed;
 }
 
-void cvm_oct_mem_empty_fpa(struct device *dev, int pool, int size, int elements)
+void cvm_oct_mem_empty_fpa(struct platform_device *pdev, int pool, int size, int elements)
 {
 	if (pool == CVMX_FPA_PACKET_POOL)
-		cvm_oct_free_hw_skbuff(dev, pool, size, elements);
+		cvm_oct_free_hw_skbuff(pdev, pool, size, elements);
 	else
-		cvm_oct_free_hw_memory(dev, pool, size, elements);
+		cvm_oct_free_hw_memory(pdev, pool, size, elements);
 }
diff --git a/drivers/staging/octeon/ethernet-mem.h b/drivers/staging/octeon/ethernet-mem.h
index edfc93b2b23b..9279bb0de2db 100644
--- a/drivers/staging/octeon/ethernet-mem.h
+++ b/drivers/staging/octeon/ethernet-mem.h
@@ -5,5 +5,9 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
-int cvm_oct_mem_fill_fpa(struct device *dev, int pool, int size, int elements);
-void cvm_oct_mem_empty_fpa(struct device *dev, int pool, int size, int elements);
+struct platform_device;
+
+int cvm_oct_mem_fill_fpa(struct platform_device *pdev, int pool, int size,
+			 int elements);
+void cvm_oct_mem_empty_fpa(struct platform_device *pdev, int pool, int size,
+			   int elements);
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index a2f4e52d69f3..1afaafbcaf19 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2003-2010 Cavium Networks
  */
 
+#include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/cache.h>
@@ -31,13 +32,6 @@
 
 static atomic_t oct_rx_ready = ATOMIC_INIT(0);
 
-static struct oct_rx_group {
-	int irq;
-	int group;
-	struct napi_struct napi;
-	struct device *dev;
-} oct_rx_group[16];
-
 /**
  * cvm_oct_do_interrupt - interrupt handler.
  * @irq: Interrupt number.
@@ -398,7 +392,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
 		/* Restore the scratch area */
 		cvmx_scratch_write64(CVMX_SCR_SCRATCH, old_scratch);
 	}
-	cvm_oct_rx_refill_pool(rx_group->dev, 0);
+	cvm_oct_rx_refill_pool(rx_group->pdev, 0);
 
 	return rx_count;
 }
@@ -435,24 +429,28 @@ static int cvm_oct_napi_poll(struct napi_struct *napi, int budget)
  */
 void cvm_oct_poll_controller(struct net_device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev->dev.parent);
+	struct octeon_ethernet_platform *plt = platform_get_drvdata(pdev);
 	int i;
 
 	if (!atomic_read(&oct_rx_ready))
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(oct_rx_group); i++) {
+	for (i = 0; i < ARRAY_SIZE(plt->rx_group); i++) {
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
-		cvm_oct_poll(&oct_rx_group[i], 16);
+		cvm_oct_poll(&plt->rx_group[i], 16);
 	}
 }
 #endif
 
-void cvm_oct_rx_initialize(struct device *dev)
+void cvm_oct_rx_initialize(struct platform_device *pdev)
 {
 	int i;
 	struct net_device *dev_for_napi = NULL;
+	struct octeon_ethernet_platform *plt = platform_get_drvdata(pdev);
+	struct oct_rx_group *rx_group = plt->rx_group;
 
 	for (i = 0; i < TOTAL_NUMBER_OF_PORTS; i++) {
 		if (cvm_oct_device[i]) {
@@ -464,28 +462,28 @@ void cvm_oct_rx_initialize(struct device *dev)
 	if (!dev_for_napi)
 		panic("No net_devices were allocated.");
 
-	for (i = 0; i < ARRAY_SIZE(oct_rx_group); i++) {
+	for (i = 0; i < ARRAY_SIZE(plt->rx_group); i++) {
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
-		oct_rx_group[i].dev = dev;
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
@@ -517,16 +515,17 @@ void cvm_oct_rx_initialize(struct device *dev)
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
+	struct octeon_ethernet_platform *plt = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(oct_rx_group); i++) {
+	for (i = 0; i < ARRAY_SIZE(plt->rx_group); i++) {
 		if (!(pow_receive_groups & BIT(i)))
 			continue;
 
@@ -537,8 +536,8 @@ void cvm_oct_rx_shutdown(void)
 			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
 
 		/* Free the interrupt handler */
-		free_irq(oct_rx_group[i].irq, &oct_rx_group[i].napi);
+		free_irq(plt->rx_group[i].irq, &plt->rx_group[i].napi);
 
-		netif_napi_del(&oct_rx_group[i].napi);
+		netif_napi_del(&plt->rx_group[i].napi);
 	}
 }
diff --git a/drivers/staging/octeon/ethernet-rx.h b/drivers/staging/octeon/ethernet-rx.h
index 636ee7d549f6..6093694326cb 100644
--- a/drivers/staging/octeon/ethernet-rx.h
+++ b/drivers/staging/octeon/ethernet-rx.h
@@ -5,11 +5,14 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
+struct platform_device;
+
 void cvm_oct_poll_controller(struct net_device *dev);
-void cvm_oct_rx_initialize(struct device *dev);
-void cvm_oct_rx_shutdown(void);
+void cvm_oct_rx_initialize(struct platform_device *pdev);
+void cvm_oct_rx_shutdown(struct platform_device *pdev);
 
-static inline void cvm_oct_rx_refill_pool(struct device *dev, int fill_threshold)
+static inline void cvm_oct_rx_refill_pool(struct platform_device *pdev,
+					  int fill_threshold)
 {
 	int number_to_free;
 	int num_freed;
@@ -20,7 +23,7 @@ static inline void cvm_oct_rx_refill_pool(struct device *dev, int fill_threshold
 	if (number_to_free > fill_threshold) {
 		cvmx_fau_atomic_add32(FAU_NUM_PACKET_BUFFERS_TO_FREE,
 				      -number_to_free);
-		num_freed = cvm_oct_mem_fill_fpa(dev, CVMX_FPA_PACKET_POOL,
+		num_freed = cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_PACKET_POOL,
 						 CVMX_FPA_PACKET_POOL_SIZE,
 						 number_to_free);
 		if (num_freed != number_to_free) {
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 7c3cfd9efa7e..02984a27523c 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -104,11 +104,6 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
 
 u64 cvm_oct_tx_poll_interval;
 
-struct octeon_ethernet_platform {
-	struct device *dev;
-	struct delayed_work rx_refill_work;
-};
-
 static void cvm_oct_rx_refill_worker(struct work_struct *work)
 {
 	struct octeon_ethernet_platform *plt = container_of(work,
@@ -120,7 +115,7 @@ static void cvm_oct_rx_refill_worker(struct work_struct *work)
 	 * could be received so cvm_oct_napi_poll would never be
 	 * invoked to do the refill.
 	 */
-	cvm_oct_rx_refill_pool(plt->dev, num_packet_buffers / 2);
+	cvm_oct_rx_refill_pool(plt->pdev, num_packet_buffers / 2);
 
 	if (!atomic_read(&cvm_oct_poll_queue_stopping))
 		schedule_delayed_work(&plt->rx_refill_work, HZ);
@@ -142,16 +137,16 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
 		schedule_delayed_work(&priv->port_periodic_work, HZ);
 }
 
-static void cvm_oct_configure_common_hw(struct device *dev)
+static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 {
 	/* Setup the FPA */
 	cvmx_fpa_enable();
-	cvm_oct_mem_fill_fpa(dev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
+	cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
 			     num_packet_buffers);
-	cvm_oct_mem_fill_fpa(dev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
+	cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
-		cvm_oct_mem_fill_fpa(dev, CVMX_FPA_OUTPUT_BUFFER_POOL,
+		cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
 				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
 
 #ifdef __LITTLE_ENDIAN
@@ -688,7 +683,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	if (!plt)
 		return -ENOMEM;
 
-	plt->dev = &pdev->dev;
+	plt->pdev = pdev;
 	INIT_DELAYED_WORK(&plt->rx_refill_work, cvm_oct_rx_refill_worker);
 	platform_set_drvdata(pdev, plt);
 
@@ -702,7 +697,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cvm_oct_configure_common_hw(&pdev->dev);
+	cvm_oct_configure_common_hw(pdev);
 
 	cvmx_helper_initialize_packet_io_global();
 
@@ -925,7 +920,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	}
 
 	cvm_oct_tx_initialize();
-	cvm_oct_rx_initialize(&pdev->dev);
+	cvm_oct_rx_initialize(pdev);
 
 	/*
 	 * 150 uS: about 10 1500-byte packets at 1GE.
@@ -948,7 +943,7 @@ static void cvm_oct_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&plt->rx_refill_work);
 
-	cvm_oct_rx_shutdown();
+	cvm_oct_rx_shutdown(pdev);
 	cvm_oct_tx_shutdown();
 
 	cvmx_pko_disable();
@@ -973,12 +968,12 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	cvmx_ipd_free_ptr();
 
 	/* Free the HW pools */
-	cvm_oct_mem_empty_fpa(&pdev->dev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
+	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
 			      num_packet_buffers);
-	cvm_oct_mem_empty_fpa(&pdev->dev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
+	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
-		cvm_oct_mem_empty_fpa(&pdev->dev, CVMX_FPA_OUTPUT_BUFFER_POOL,
+		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
 				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
 }
 
diff --git a/drivers/staging/octeon/octeon-ethernet.h b/drivers/staging/octeon/octeon-ethernet.h
index a6140705706f..57e4029a13d0 100644
--- a/drivers/staging/octeon/octeon-ethernet.h
+++ b/drivers/staging/octeon/octeon-ethernet.h
@@ -11,6 +11,7 @@
 #ifndef OCTEON_ETHERNET_H
 #define OCTEON_ETHERNET_H
 
+#include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/phy.h>
 
@@ -70,8 +71,21 @@ struct octeon_ethernet {
 	u64 link_info;
 	/* Called periodically to check link status */
 	void (*poll)(struct net_device *dev);
-	struct delayed_work	port_periodic_work;
-	struct device_node	*of_node;
+	struct delayed_work port_periodic_work;
+	struct device_node *of_node;
+};
+
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
 };
 
 int cvm_oct_free_work(void *work_queue_entry);
-- 
2.53.0

