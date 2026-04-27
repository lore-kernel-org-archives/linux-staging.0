Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB6330324
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303089; cv=none; b=ikjWEBXd0qQj/fz5ZP8gEQwkUPZkZwDlvchP7sLvz2mYDtB+ryC++jMSSIwiMzKSTDQxtFIaCNG+ZXys2DxdH/sxh04hRe69udX/mK5MryjC01NJtBmVP3eWS7J0nNFasybDvieLF9XNuVZ+NF7I81v/c2gNpZYqBdv8IhlMRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303089; c=relaxed/simple;
	bh=5iwJhQYYbwsxuTbKD8nCPs9tkmq0GQfZLkUvDMAr7J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ds9yIy+b5JzSqzozNvL3u71cN6OR8WQemObxBhChFlwmClCIdckwsMJ8b6M5rYff6Z/F8bvKAPRrTC7IaeQolVi1rFqqMbf+VRhEMsKPD/c4Y1BVcwHb9+nU50fqMgoONekwvUYe62yotCLzVtIM7GurdS0djPs2tKWz1rFZoZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBiEkt5E; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBiEkt5E"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c76bb670cbfso318889a12.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777303086; x=1777907886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR/dnlHtCukrPdxSjUklKCl3P9S0GVej8h4yO/skypk=;
        b=KBiEkt5E/RaOQgbMyUxYHeldWal12wVoIYreF4e7ignm5mp+B7ucZM4sfagl43i0Eb
         XEUDhWnvoPCkXTwRNG5MxqDO7Vi1rL97c5Eo7IbVwbI0iQFRRgBfJ73hZdoGI89v3sda
         cvkMZZWPYN8UKGVNeGInzqbr/NY01vQKVi7ZewRxstvw2tJH3xR/lq3ld3D+GQFHUl02
         lKaKey+WaSqxOmRDoAjR7a/dkdr/29u505ytNH2CWObbssytKHkfWp+94SQmLXwwuMoa
         n+4dNgfTx6eImVqusy63Q6jSc7cYHvz6tvSoBWCS+2JIY2jjfSitM6EczuG/6qv2AMVa
         t5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303086; x=1777907886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jR/dnlHtCukrPdxSjUklKCl3P9S0GVej8h4yO/skypk=;
        b=Hh0QutwNz4VczlrnzGF/FUZyWNHik12Nblqa8cALcGX++EfuYjnaaUDDAkNEqitQ9P
         bl3ZNDjUd4kwxAJRJNDKRxmM7Wu0eTkO6xPLTywIBdX/7mZzVOs+XxOqs3mA03/gXiP7
         ZeSrfJkTrkQ+PkmYxEYgGUbxif2+dpn1TUbsLp9lTKph3Nu1Jj2Ny3BSdRh51VdN326a
         ccHKZVS/THzD8JnFcOMT4H/+luWJN7iP2UodNndl8jcO8jTUfTT2ihaYIYOtHlP0/HES
         /Kp11yAxbTCtMMrD87J1NEXwF/XOmF9/rYJqGXBVOCcllDMT2uZJXgLyunCisot2N6Z7
         B79Q==
X-Forwarded-Encrypted: i=1; AFNElJ8j96Sg3WnfF/yFybDDccAywC1l/Q7uk70rDO6DCd+ebNNOvNx9RtS9ugphBaj1qPyWgGU1lXS7LbmdTtl1@lists.linux.dev
X-Gm-Message-State: AOJu0YxfCZxrmO6aKa9PlVzPGvyLvzR8ka8L1gk7hO2tOWgbtKxKZrSn
	aHGhcyjzMJNQaccMrYHdw18uBlFccX/pYY6qYWXlGQLVCNCTEsBe0fgG
X-Gm-Gg: AeBDievAsNllZK6Z5wxQt71Zbs5vPygavqvGsPf3/dlMJuBwTGnaVa2kZ0RYPfZoLaD
	kv8Lut9bhnrQ2hS/BCb6dbVt8gSV3J6hbEA3xrQ3qRALKsPWvKQXoWJGVX7p/f5rcmc4ziU75Iq
	UqOaz6w9nGmC/5l//8MyEo/N+iRohcntWbwQhFUEnEpHT6RAOVBtmMeKA5gm/rmGe5hzWmz9j4O
	OaYEijiohJSggqx5ghCRdjIq9LRmye1v5LLahjwp1o/BTQHratGQzKrTwWBlHHzSMFy4uKn6Ivm
	QBjwBJ/39jdDZWu7h/tP+9hBZuXzHCr2syBWBAeMr61q5cAg+eyig5cg8f28zBpNvVw0xyKWnNu
	a295bgJqn3nnUsEEEFAbmtxSO8gcS3G6/P6BL/I+UgbZG2Koi8h0MJLgxS6JKkJ3BVvNAgsSPIL
	Pp3dfyHABtCqaZ4b81DRk2ILc7sTZfHL2qJsoODdwvCgOdv1bNpyHzatvGDRLGgTwxrJ1GES4/o
	CoO2gtyucuM0Xh9MZxYRntjiQwcN3qb/F4dLQ==
X-Received: by 2002:a05:6a21:1bc8:b0:3a3:2819:5d41 with SMTP id adf61e73a8af0-3a32819819bmr10513908637.5.1777303085373;
        Mon, 27 Apr 2026 08:18:05 -0700 (PDT)
Received: from fedora ([2401:4900:d824:7468:545f:3159:76d5:30ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm37652931b3a.58.2026.04.27.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:18:05 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ayushmukkanwar@gmail.com
Subject: [PATCH v5 2/4] staging: octeon: replace pr_warn with dev_warn in fill path
Date: Mon, 27 Apr 2026 20:45:53 +0530
Message-ID: <20260427151556.91153-3-ayushmukkanwar@gmail.com>
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

Replace pr_warn() with dev_warn() in cvm_oct_fill_hw_memory() to
include device information in log messages.

To make the device pointer accessible from the workqueue callback,
introduce struct octeon_ethernet_platform to hold both a struct
device pointer and the delayed_work. This replaces the static global
cvm_oct_rx_refill_work. The struct is allocated with devm_kzalloc()
in probe() and stored via platform_set_drvdata(). The worker
retrieves it using container_of().

Add a struct device pointer to oct_rx_group and thread it through
cvm_oct_rx_initialize() to support the NAPI poll refill path.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c | 12 +++++----
 drivers/staging/octeon/ethernet-mem.h |  2 +-
 drivers/staging/octeon/ethernet-rx.c  |  6 +++--
 drivers/staging/octeon/ethernet-rx.h  |  6 ++---
 drivers/staging/octeon/ethernet.c     | 39 ++++++++++++++++++---------
 5 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 501a2f7487c1..f182698dd057 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -70,13 +70,15 @@ static void cvm_oct_free_hw_skbuff(struct device *dev,
 
 /**
  * cvm_oct_fill_hw_memory - fill a hardware pool with memory.
+ * @dev:      Device for logging
  * @pool:     Pool to populate
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers to allocate
  *
  * Returns the actual number of buffers allocated.
  */
-static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
+static int cvm_oct_fill_hw_memory(struct device *dev, int pool, int size,
+				  int elements)
 {
 	char *memory;
 	char *fpa;
@@ -95,8 +97,8 @@ static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
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
@@ -138,14 +140,14 @@ static void cvm_oct_free_hw_memory(struct device *dev,
 			 pool, elements);
 }
 
-int cvm_oct_mem_fill_fpa(int pool, int size, int elements)
+int cvm_oct_mem_fill_fpa(struct device *dev, int pool, int size, int elements)
 {
 	int freed;
 
 	if (pool == CVMX_FPA_PACKET_POOL)
 		freed = cvm_oct_fill_hw_skbuff(pool, size, elements);
 	else
-		freed = cvm_oct_fill_hw_memory(pool, size, elements);
+		freed = cvm_oct_fill_hw_memory(dev, pool, size, elements);
 	return freed;
 }
 
diff --git a/drivers/staging/octeon/ethernet-mem.h b/drivers/staging/octeon/ethernet-mem.h
index 591e0bbb6f10..edfc93b2b23b 100644
--- a/drivers/staging/octeon/ethernet-mem.h
+++ b/drivers/staging/octeon/ethernet-mem.h
@@ -5,5 +5,5 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
-int cvm_oct_mem_fill_fpa(int pool, int size, int elements);
+int cvm_oct_mem_fill_fpa(struct device *dev, int pool, int size, int elements);
 void cvm_oct_mem_empty_fpa(struct device *dev, int pool, int size, int elements);
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index d0b43d50b83c..a2f4e52d69f3 100644
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
+	cvm_oct_rx_refill_pool(rx_group->dev, 0);
 
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
index ff6482fa20d6..636ee7d549f6 100644
--- a/drivers/staging/octeon/ethernet-rx.h
+++ b/drivers/staging/octeon/ethernet-rx.h
@@ -6,10 +6,10 @@
  */
 
 void cvm_oct_poll_controller(struct net_device *dev);
-void cvm_oct_rx_initialize(void);
+void cvm_oct_rx_initialize(struct device *dev);
 void cvm_oct_rx_shutdown(void);
 
-static inline void cvm_oct_rx_refill_pool(int fill_threshold)
+static inline void cvm_oct_rx_refill_pool(struct device *dev, int fill_threshold)
 {
 	int number_to_free;
 	int num_freed;
@@ -20,7 +20,7 @@ static inline void cvm_oct_rx_refill_pool(int fill_threshold)
 	if (number_to_free > fill_threshold) {
 		cvmx_fau_atomic_add32(FAU_NUM_PACKET_BUFFERS_TO_FREE,
 				      -number_to_free);
-		num_freed = cvm_oct_mem_fill_fpa(CVMX_FPA_PACKET_POOL,
+		num_freed = cvm_oct_mem_fill_fpa(dev, CVMX_FPA_PACKET_POOL,
 						 CVMX_FPA_PACKET_POOL_SIZE,
 						 number_to_free);
 		if (num_freed != number_to_free) {
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 9eed0a89a2f3..a7ac29c0a4ca 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -104,11 +104,15 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
 
 u64 cvm_oct_tx_poll_interval;
 
-static void cvm_oct_rx_refill_worker(struct work_struct *work);
-static DECLARE_DELAYED_WORK(cvm_oct_rx_refill_work, cvm_oct_rx_refill_worker);
+struct octeon_ethernet_platform {
+	struct device *dev;
+	struct delayed_work rx_refill_work;
+};
 
 static void cvm_oct_rx_refill_worker(struct work_struct *work)
 {
+	struct octeon_ethernet_platform *plt = container_of(work,
+		struct octeon_ethernet_platform, rx_refill_work.work);
 	/*
 	 * FPA 0 may have been drained, try to refill it if we need
 	 * more than num_packet_buffers / 2, otherwise normal receive
@@ -116,10 +120,10 @@ static void cvm_oct_rx_refill_worker(struct work_struct *work)
 	 * could be received so cvm_oct_napi_poll would never be
 	 * invoked to do the refill.
 	 */
-	cvm_oct_rx_refill_pool(num_packet_buffers / 2);
+	cvm_oct_rx_refill_pool(plt->dev, num_packet_buffers / 2);
 
 	if (!atomic_read(&cvm_oct_poll_queue_stopping))
-		schedule_delayed_work(&cvm_oct_rx_refill_work, HZ);
+		schedule_delayed_work(&plt->rx_refill_work, HZ);
 }
 
 static void cvm_oct_periodic_worker(struct work_struct *work)
@@ -138,16 +142,16 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
 		schedule_delayed_work(&priv->port_periodic_work, HZ);
 }
 
-static void cvm_oct_configure_common_hw(void)
+static void cvm_oct_configure_common_hw(struct device *dev)
 {
 	/* Setup the FPA */
 	cvmx_fpa_enable();
-	cvm_oct_mem_fill_fpa(CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
+	cvm_oct_mem_fill_fpa(dev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
 			     num_packet_buffers);
-	cvm_oct_mem_fill_fpa(CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
+	cvm_oct_mem_fill_fpa(dev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
-		cvm_oct_mem_fill_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
+		cvm_oct_mem_fill_fpa(dev, CVMX_FPA_OUTPUT_BUFFER_POOL,
 				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
 
 #ifdef __LITTLE_ENDIAN
@@ -678,6 +682,15 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	int qos;
 	struct device_node *pip;
 	int mtu_overhead = ETH_HLEN + ETH_FCS_LEN;
+	struct octeon_ethernet_platform *plt;
+
+	plt = devm_kzalloc(&pdev->dev, sizeof(*plt), GFP_KERNEL);
+	if (!plt)
+		return -ENOMEM;
+
+	plt->dev = &pdev->dev;
+	INIT_DELAYED_WORK(&plt->rx_refill_work, cvm_oct_rx_refill_worker);
+	platform_set_drvdata(pdev, plt);
 
 #if IS_ENABLED(CONFIG_VLAN_8021Q)
 	mtu_overhead += VLAN_HLEN;
@@ -689,7 +702,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cvm_oct_configure_common_hw();
+	cvm_oct_configure_common_hw(&pdev->dev);
 
 	cvmx_helper_initialize_packet_io_global();
 
@@ -912,26 +925,28 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	}
 
 	cvm_oct_tx_initialize();
-	cvm_oct_rx_initialize();
+	cvm_oct_rx_initialize(&pdev->dev);
 
 	/*
 	 * 150 uS: about 10 1500-byte packets at 1GE.
 	 */
 	cvm_oct_tx_poll_interval = 150 * (octeon_get_clock_rate() / 1000000);
 
-	schedule_delayed_work(&cvm_oct_rx_refill_work, HZ);
+	schedule_delayed_work(&plt->rx_refill_work, HZ);
 
 	return 0;
 }
 
 static void cvm_oct_remove(struct platform_device *pdev)
 {
+	struct octeon_ethernet_platform *plt = platform_get_drvdata(pdev);
 	int port;
 
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
-	cancel_delayed_work_sync(&cvm_oct_rx_refill_work);
+
+	cancel_delayed_work_sync(&plt->rx_refill_work);
 
 	cvm_oct_rx_shutdown();
 	cvm_oct_tx_shutdown();
-- 
2.53.0

