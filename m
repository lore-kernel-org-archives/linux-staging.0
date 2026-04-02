Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117FB390205
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130219; cv=none; b=mjkJ/J4pKpKEw/FMAKf2l+jNfzwCRrrnFSBi1hX1Fqgag1KLUG3mdhOPUlCzCG4yJLmn+F6fOh+0QT3tzByR6l7iQy3w0OI+7zH1hvdPHeoiopILrutG9uxyOOmypq0ifzExnQa6bTm/SzBegQ5e5P1h/Fk3FY/nv25jcMXJoFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130219; c=relaxed/simple;
	bh=IkMdwB5+mP8kQ7jd9LRTgObJFqi06jGriYgjQi/dgYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVo8nP7230Wwfse+AwuqURWjSbf6jS2uHobafQpHHbOQSW8tI9gbd7KEzCDa4l/L/I37eQtNbrGdQdeE6gRSjFqVGRaQ24r4NBJkPahtlmUCmXwOdbzD4Prazl2OTMuTT6jdhyTrEeTLxx6JcBiJ+cgn5AUwaaqNAF3Cq1kK/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhbdCc3g; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhbdCc3g"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b0baebcb55so2686125ad.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775130206; x=1775735006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B4/Z8VlQ0Zk02tll8xObdk/FFHwhV2xVgavwF/166s=;
        b=IhbdCc3gNo7uBV/qQUZ029cc0SeEsEsaRlcnqv34M/ezRoGSub72cmrlk6VaVTDwbi
         gG3z9PeOZD7Ed8Dcy/psGPYf8pVTwvHaDrXWSpOw9e2Nl8MwgolBiBH6w+a024U6bLRJ
         hGM2VJAW2uiwzyCbuvw8cHp2/nAp4CiP3zvCCVIqQ22HAe+nVmYuS20sqGsWgZf0D5zk
         DoD89A/M/JM4XK94qWT1JDfRxA4s4wMPndvJXLAL8HR4LN9W28zzRZ1gzjKP3etCi63g
         f55N8eHs6ZBPYvO7p4unAtQUAIR/qrDotMzUWhC4OEmOoMOywUtKXUSzx6ufYMuzhlOc
         My6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130206; x=1775735006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4B4/Z8VlQ0Zk02tll8xObdk/FFHwhV2xVgavwF/166s=;
        b=pzj32xw03a6iqPrzFkwQbB3agGGVOwUCsv9obk6vZBs2oJY5yQmO4ePboMXJ4gxEw5
         YB4UPdW2TtgbNhZQc8FBMjxKdlz8CcHJ5ttvaLZqpAqQE5wm22+cDeRJRftBwfKEXP5N
         dY/Nc0C1WzQEzkXobSb9B1Xy2roYXPPv/bjcJlOjoydkDLQB0eV4OtK0fghsPaYWFDS1
         SBjpWzrdrsfJV6gUdd22cU5/GK05/B9ULLlLDdHtD0qPrTctHykwiMjL75Q425OXCboh
         EdMaqg1awtPsGiEoJs928zJ9m9vgrpJN/IaqfHHa0vw315Iuo29weP8LSykff17jIv1A
         mgLA==
X-Gm-Message-State: AOJu0YwqPHPcNS2yUQQfOpqEZbfoI5mnHkjSi6Qo6N/k1yWTHoczIC2p
	OZGRvLCDuYDYrfNYzN6hF1IdvkjCARBaBk9Cy3PCkDq/4+Z3wjFKt49O
X-Gm-Gg: AeBDievDieydT49O0fQMwDQ7p8MzNh5tXc15XOki+p1PgaCSWzkiaaH1GR7I6ioY6NI
	SseVcW0VeXaBUNK7qQCZ4RG3qk7tue7CC1Y8KEjOBtjbVCkdSX/VmbQrJP+iOwTlYdZafQbhZpS
	Kx3RMla62ciz0aFN4sHNn4ndsQcfCxAdA1ciuZLh6inoi1awKssIZ5lDxqrr1rCkhoP49zWke6c
	8ITsrhFJy4tKlUSUvxpg6AG30pv5PU5fKbZpwGqZb/EFYeDKkaMHcliQIW8GrlvN57mzWFoG67r
	g+Ev6DQSdwVFsQXNsNtkdVSADqsd2Cd1zaNHOhEKI4iRcmhnqOYgM40aBJ7zmqIWxi6vNxYCeLx
	16xF62tSgVk59eQSj5hKXOLjrddvtyiJFNNeYqFIQghB3E2KbXj3KH36v3LOOJ3iWyYZGoYVw1T
	JZcrjDutkbDAe1FNaDuAWF1sJLjQ==
X-Received: by 2002:a17:903:37cd:b0:2b0:ac1e:972e with SMTP id d9443c01a7336-2b269d869f4mr42374275ad.8.1775130206192;
        Thu, 02 Apr 2026 04:43:26 -0700 (PDT)
Received: from fedora ([2401:4900:85cc:66d7:5e4d:2506:ea1:a781])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274779b48sm37505805ad.25.2026.04.02.04.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:43:25 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v3 2/2] staging: octeon: ethernet: replace pr_* with dev_* and netdev_*
Date: Thu,  2 Apr 2026 17:12:42 +0530
Message-ID: <20260402114242.57411-3-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402114242.57411-1-ayushmukkanwar@gmail.com>
References: <20260402114242.57411-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_*() calls with dev_*() and netdev_*() to include device
information in log messages. A per-device struct
octeon_ethernet_platform is introduced to pass the device pointer
through work queue callbacks via container_of. The device pointer
is also stored in oct_rx_group to make it available in the NAPI
poll function and propagated through the memory pool functions by
adding a struct device * parameter.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c | 39 +++++++++--------
 drivers/staging/octeon/ethernet-mem.h |  4 +-
 drivers/staging/octeon/ethernet-rx.c  |  6 ++-
 drivers/staging/octeon/ethernet-rx.h  |  6 +--
 drivers/staging/octeon/ethernet.c     | 63 ++++++++++++++++-----------
 5 files changed, 68 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 532594957ebc..d5caefe68608 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -43,8 +43,9 @@ static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
  * @pool:     Pool to allocate an skbuff for
  * @size:     Size of the buffer needed for the pool
  * @elements: Number of buffers to allocate
+ * @dev:      Device to pass to dev_warn()
  */
-static void cvm_oct_free_hw_skbuff(int pool, int size, int elements)
+static void cvm_oct_free_hw_skbuff(int pool, int size, int elements, struct device *dev)
 {
 	char *memory;
 
@@ -59,11 +60,11 @@ static void cvm_oct_free_hw_skbuff(int pool, int size, int elements)
 	} while (memory);
 
 	if (elements < 0)
-		pr_warn("Freeing of pool %u had too many skbuffs (%d)\n",
-			pool, elements);
+		dev_warn(dev, "Freeing of pool %u had too many skbuffs (%d)\n",
+			 pool, elements);
 	else if (elements > 0)
-		pr_warn("Freeing of pool %u is missing %d skbuffs\n",
-			pool, elements);
+		dev_warn(dev, "Freeing of pool %u is missing %d skbuffs\n",
+			 pool, elements);
 }
 
 /**
@@ -71,10 +72,11 @@ static void cvm_oct_free_hw_skbuff(int pool, int size, int elements)
  * @pool:     Pool to populate
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers to allocate
+ * @dev:      Device to pass to dev_warn()
  *
  * Returns the actual number of buffers allocated.
  */
-static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
+static int cvm_oct_fill_hw_memory(int pool, int size, int elements, struct device *dev)
 {
 	char *memory;
 	char *fpa;
@@ -93,8 +95,8 @@ static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
 		 */
 		memory = kmalloc(size + 256, GFP_ATOMIC);
 		if (unlikely(!memory)) {
-			pr_warn("Unable to allocate %u bytes for FPA pool %d\n",
-				elements * size, pool);
+			dev_warn(dev, "Unable to allocate %u bytes for FPA pool %d\n",
+				 elements * size, pool);
 			break;
 		}
 		fpa = (char *)(((unsigned long)memory + 256) & ~0x7fUL);
@@ -110,8 +112,9 @@ static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
  * @pool:     FPA pool to free
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers that should be in the pool
+ * @dev:      Device to pass to dev_warn()
  */
-static void cvm_oct_free_hw_memory(int pool, int size, int elements)
+static void cvm_oct_free_hw_memory(int pool, int size, int elements, struct device *dev)
 {
 	char *memory;
 	char *fpa;
@@ -127,28 +130,28 @@ static void cvm_oct_free_hw_memory(int pool, int size, int elements)
 	} while (fpa);
 
 	if (elements < 0)
-		pr_warn("Freeing of pool %u had too many buffers (%d)\n",
-			pool, elements);
+		dev_warn(dev, "Freeing of pool %u had too many buffers (%d)\n",
+			 pool, elements);
 	else if (elements > 0)
-		pr_warn("Warning: Freeing of pool %u is missing %d buffers\n",
-			pool, elements);
+		dev_warn(dev, "Warning: Freeing of pool %u is missing %d buffers\n",
+			 pool, elements);
 }
 
-int cvm_oct_mem_fill_fpa(int pool, int size, int elements)
+int cvm_oct_mem_fill_fpa(int pool, int size, int elements, struct device *dev)
 {
 	int freed;
 
 	if (pool == CVMX_FPA_PACKET_POOL)
 		freed = cvm_oct_fill_hw_skbuff(pool, size, elements);
 	else
-		freed = cvm_oct_fill_hw_memory(pool, size, elements);
+		freed = cvm_oct_fill_hw_memory(pool, size, elements, dev);
 	return freed;
 }
 
-void cvm_oct_mem_empty_fpa(int pool, int size, int elements)
+void cvm_oct_mem_empty_fpa(int pool, int size, int elements, struct device *dev)
 {
 	if (pool == CVMX_FPA_PACKET_POOL)
-		cvm_oct_free_hw_skbuff(pool, size, elements);
+		cvm_oct_free_hw_skbuff(pool, size, elements, dev);
 	else
-		cvm_oct_free_hw_memory(pool, size, elements);
+		cvm_oct_free_hw_memory(pool, size, elements, dev);
 }
diff --git a/drivers/staging/octeon/ethernet-mem.h b/drivers/staging/octeon/ethernet-mem.h
index 692dcdb7154d..22a38846c751 100644
--- a/drivers/staging/octeon/ethernet-mem.h
+++ b/drivers/staging/octeon/ethernet-mem.h
@@ -5,5 +5,5 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
-int cvm_oct_mem_fill_fpa(int pool, int size, int elements);
-void cvm_oct_mem_empty_fpa(int pool, int size, int elements);
+int cvm_oct_mem_fill_fpa(int pool, int size, int elements, struct device *dev);
+void cvm_oct_mem_empty_fpa(int pool, int size, int elements, struct device *dev);
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index d0b43d50b83c..461f9077742e 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -35,6 +35,7 @@ static struct oct_rx_group {
 	int irq;
 	int group;
 	struct napi_struct napi;
+	struct device *dev;
 } oct_rx_group[16];
 
 /**
@@ -397,7 +398,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
 		/* Restore the scratch area */
 		cvmx_scratch_write64(CVMX_SCR_SCRATCH, old_scratch);
 	}
-	cvm_oct_rx_refill_pool(0);
+	cvm_oct_rx_refill_pool(0, rx_group->dev);
 
 	return rx_count;
 }
@@ -448,7 +449,7 @@ void cvm_oct_poll_controller(struct net_device *dev)
 }
 #endif
 
-void cvm_oct_rx_initialize(void)
+void cvm_oct_rx_initialize(struct device *dev)
 {
 	int i;
 	struct net_device *dev_for_napi = NULL;
@@ -475,6 +476,7 @@ void cvm_oct_rx_initialize(void)
 
 		oct_rx_group[i].irq = OCTEON_IRQ_WORKQ0 + i;
 		oct_rx_group[i].group = i;
+		oct_rx_group[i].dev = dev;
 
 		/* Register an IRQ handler to receive POW interrupts */
 		ret = request_irq(oct_rx_group[i].irq, cvm_oct_do_interrupt, 0,
diff --git a/drivers/staging/octeon/ethernet-rx.h b/drivers/staging/octeon/ethernet-rx.h
index ff6482fa20d6..443c6208d09d 100644
--- a/drivers/staging/octeon/ethernet-rx.h
+++ b/drivers/staging/octeon/ethernet-rx.h
@@ -6,10 +6,10 @@
  */
 
 void cvm_oct_poll_controller(struct net_device *dev);
-void cvm_oct_rx_initialize(void);
+void cvm_oct_rx_initialize(struct device *dev);
 void cvm_oct_rx_shutdown(void);
 
-static inline void cvm_oct_rx_refill_pool(int fill_threshold)
+static inline void cvm_oct_rx_refill_pool(int fill_threshold, struct device *dev)
 {
 	int number_to_free;
 	int num_freed;
@@ -22,7 +22,7 @@ static inline void cvm_oct_rx_refill_pool(int fill_threshold)
 				      -number_to_free);
 		num_freed = cvm_oct_mem_fill_fpa(CVMX_FPA_PACKET_POOL,
 						 CVMX_FPA_PACKET_POOL_SIZE,
-						 number_to_free);
+						 number_to_free, dev);
 		if (num_freed != number_to_free) {
 			cvmx_fau_atomic_add32(FAU_NUM_PACKET_BUFFERS_TO_FREE,
 					      number_to_free - num_freed);
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..89df2a691a0d 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -104,11 +104,18 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
 
 u64 cvm_oct_tx_poll_interval;
 
-static void cvm_oct_rx_refill_worker(struct work_struct *work);
-static DECLARE_DELAYED_WORK(cvm_oct_rx_refill_work, cvm_oct_rx_refill_worker);
+struct octeon_ethernet_platform {
+	struct device *dev;
+	struct delayed_work rx_refill_work;
+};
+
+static struct octeon_ethernet_platform *oct_plt;
 
 static void cvm_oct_rx_refill_worker(struct work_struct *work)
 {
+	struct octeon_ethernet_platform *plt = container_of(work, struct octeon_ethernet_platform,
+		rx_refill_work.work);
+
 	/*
 	 * FPA 0 may have been drained, try to refill it if we need
 	 * more than num_packet_buffers / 2, otherwise normal receive
@@ -116,10 +123,11 @@ static void cvm_oct_rx_refill_worker(struct work_struct *work)
 	 * could be received so cvm_oct_napi_poll would never be
 	 * invoked to do the refill.
 	 */
-	cvm_oct_rx_refill_pool(num_packet_buffers / 2);
+
+	cvm_oct_rx_refill_pool(num_packet_buffers / 2, plt->dev);
 
 	if (!atomic_read(&cvm_oct_poll_queue_stopping))
-		schedule_delayed_work(&cvm_oct_rx_refill_work, HZ);
+		schedule_delayed_work(&plt->rx_refill_work, HZ);
 }
 
 static void cvm_oct_periodic_worker(struct work_struct *work)
@@ -138,17 +146,17 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
 		schedule_delayed_work(&priv->port_periodic_work, HZ);
 }
 
-static void cvm_oct_configure_common_hw(void)
+static void cvm_oct_configure_common_hw(struct device *dev)
 {
 	/* Setup the FPA */
 	cvmx_fpa_enable();
 	cvm_oct_mem_fill_fpa(CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
-			     num_packet_buffers);
+			     num_packet_buffers, dev);
 	cvm_oct_mem_fill_fpa(CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
-			     num_packet_buffers);
+			     num_packet_buffers, dev);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_fill_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
-				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
+				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024, dev);
 
 #ifdef __LITTLE_ENDIAN
 	{
@@ -685,11 +693,17 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	pip = pdev->dev.of_node;
 	if (!pip) {
-		pr_err("Error: No 'pip' in /aliases\n");
+		dev_err(&pdev->dev, "Error: No 'pip' in /aliases\n");
 		return -EINVAL;
 	}
 
-	cvm_oct_configure_common_hw();
+	oct_plt = devm_kzalloc(&pdev->dev, sizeof(*oct_plt), GFP_KERNEL);
+	if (!oct_plt)
+		return -ENOMEM;
+	oct_plt->dev = &pdev->dev;
+	INIT_DELAYED_WORK(&oct_plt->rx_refill_work, cvm_oct_rx_refill_worker);
+
+	cvm_oct_configure_common_hw(&pdev->dev);
 
 	cvmx_helper_initialize_packet_io_global();
 
@@ -783,16 +797,15 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
 
 			if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for POW\n");
+				netdev_err(dev, "Failed to register ethernet device for POW\n");
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
-				pr_info("%s: POW send group %d, receive group %d\n",
-					dev->name, pow_send_group,
-					pow_receive_group);
+				netdev_info(dev, "POW send group %d, receive group %d\n",
+					    pow_send_group, pow_receive_group);
 			}
 		} else {
-			pr_err("Failed to allocate ethernet device for POW\n");
+			dev_err(&pdev->dev, "Failed to allocate ethernet device for POW\n");
 		}
 	}
 
@@ -812,8 +825,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			struct net_device *dev =
 			    alloc_etherdev(sizeof(struct octeon_ethernet));
 			if (!dev) {
-				pr_err("Failed to allocate ethernet device for port %d\n",
-				       port);
+				dev_err(&pdev->dev, "Failed to allocate ethernet device for port %d\n",
+					port);
 				continue;
 			}
 
@@ -897,8 +910,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			if (!dev->netdev_ops) {
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for interface %d, port %d\n",
-				       interface, priv->port);
+				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
+					   interface, priv->port);
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;
@@ -912,14 +925,14 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	}
 
 	cvm_oct_tx_initialize();
-	cvm_oct_rx_initialize();
+	cvm_oct_rx_initialize(&pdev->dev);
 
 	/*
 	 * 150 uS: about 10 1500-byte packets at 1GE.
 	 */
 	cvm_oct_tx_poll_interval = 150 * (octeon_get_clock_rate() / 1000000);
 
-	schedule_delayed_work(&cvm_oct_rx_refill_work, HZ);
+	schedule_delayed_work(&oct_plt->rx_refill_work, HZ);
 
 	return 0;
 }
@@ -931,7 +944,7 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
-	cancel_delayed_work_sync(&cvm_oct_rx_refill_work);
+	cancel_delayed_work_sync(&oct_plt->rx_refill_work);
 
 	cvm_oct_rx_shutdown();
 	cvm_oct_tx_shutdown();
@@ -959,12 +972,12 @@ static void cvm_oct_remove(struct platform_device *pdev)
 
 	/* Free the HW pools */
 	cvm_oct_mem_empty_fpa(CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
-			      num_packet_buffers);
+			      num_packet_buffers, &pdev->dev);
 	cvm_oct_mem_empty_fpa(CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
-			      num_packet_buffers);
+			      num_packet_buffers, &pdev->dev);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128, &pdev->dev);
 }
 
 static const struct of_device_id cvm_oct_match[] = {
-- 
2.53.0

