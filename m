Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B487D2750ED
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775398436; cv=none; b=plLtLduS5041SyAr3HMyND5IjP2akDNiIFZ9wzJ24E+D0oelBXlI4lObX5DzmHT6wpk0AhHxM4A1I6Qb6CHvqRh7n4pLghDmzbwZZmvPEVPlHi7udhhXZyKHdrddTdo9uXbI0i+unADgR6QE25kOoW5zKN5lxRgh6mxaTeWJE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775398436; c=relaxed/simple;
	bh=5iwJhQYYbwsxuTbKD8nCPs9tkmq0GQfZLkUvDMAr7J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Okht/wQorWzxaUPTOU9dpk8M+LbCRFguHKnFN9LpfEjeBy7bf+Vv/xOnxwUG0xlVKmYraU9VBjjq4tNrsawCMuKAsCiD37KhWfwG9usbRqJCJvgxtdvXUwkYfZIoQI9ukzb7QHqvabfW6gxOkKBuKolahKeubcyqdDOMzlHJw8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jU8LLbda; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jU8LLbda"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d9493c39eso186589a91.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775398434; x=1776003234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR/dnlHtCukrPdxSjUklKCl3P9S0GVej8h4yO/skypk=;
        b=jU8LLbdal+Ia3djWNlLIYIJ92OSHh0iP9C4vzCvpzdTQP4JrZ24QCH8AXmFF/n86l2
         GSpUm7oOSdERZk1sz1NigJtCHvfDpfF4/+6cTTqqVdV/i0N1gZ7XgXMZZdEsmnOkEG8t
         XWzQtAwxSVyTf8DeOCQjhqKX9TEPCga11FeHY3mcZgnN0C2by7kau/qnrYjFGhOr7Y5b
         K89Ch3Rlcd2i0bLuBdKwJIQ3DFP3ZApDfKdhX81JTkvR6VgpkZliVCV9jJq8kdVo2ac5
         BCLEEHGk7aHZI32q9rdxuh3yPSFw5kIHtAJzSoRYW8qkIoOHHpny6e6r1tSK9DW5+nId
         VCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775398434; x=1776003234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jR/dnlHtCukrPdxSjUklKCl3P9S0GVej8h4yO/skypk=;
        b=JP5byTXHJa5ZT7i2tJ22qikSSmTdRe7lGqZJ/1unCDvZ/tFOMD24acidQkVIfYF6Ic
         NLJrk6GBtIpAuJJjwgy0cQJVH5etFi+7QlFSdvOolBx0Zv9dHN+0f574BgROUVeRYQJI
         uq7tQD6Mi4vGVx7Yp5kUBYmES7oazG1NAZ1rRxwb4hCatRgCLC8eiS70nQIE0CkTKRqV
         0BaFCV3PWHQmtqY6DCwriNtd8kqrruAUuwvhmmpSiZtvnAoEH/P+edNecN+NUSnjn6TX
         rphudV+Zwxay2AABIqBANMuaGVMi1099QUi66mFdErXVCRaX9XDG6DoZtBJAgVipFpO8
         LYjA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7cmEsWqksQjYrA65i9P/76qxrdfGlBhTOaKWUE7ZY42lioCW6VDbS1z9EtXU51MHjIrcVPS27Pc+6Ert@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0WBVNs/DZhTl2IRcigzWiqUTOGwiFknNblRy4rpSi8EyMf8n/
	7ErpMIFcoV6bzS4wJCAHOIVBLavO5+mKt4LnSco1e4M0e3FubxdzsBya26vTS9Mj
X-Gm-Gg: AeBDiesIg08aCbkM05nhBW7u3CJSvx8ob6hrJn9hjXMQJRwFzSJutfCPD9uG5s0xeZV
	GECYWCfCcfo7Ow5FAwNlc+0lvs9QTW8RhECRv/Q42X3Dg7EfJ9t7nXGCGoaGRAcKcY+pCqbwrzA
	fv6UULZW/oC5XX60ASO/GixVnLeVuans/IDiZosKkyzCqkJFKEhsHCQFRPc0AHR+ZVwncKUHM7F
	F/wVyL6HXt8P21n3Vgw9SEeLeSfl3jRG7Z/tSjPC9Y1V4MriZaLmFbJxBdwsnqZzDLrL7qsimr/
	wlDwKMgMwAH9xtfHDT5Y5tjYmEPz70EXcuFURPpXqyVNMJXv2CVlY2tizZ3JGSWM+4L+Jpq9dWa
	lUsWZevu+aBIRF6h8Z+KOxuUkQUHwjOwz6hE6i+ThxVuX256f43caLwIp9bukw7/wfFrFWw1zcA
	22NS3h7zU3UNNjK4uCIRP3vNgDQ6/Y
X-Received: by 2002:a05:6a00:2d25:b0:82c:de99:3302 with SMTP id d2e1a72fcca58-82d0da41d7cmr6005413b3a.1.1775398433934;
        Sun, 05 Apr 2026 07:13:53 -0700 (PDT)
Received: from fedora ([2401:4900:82af:33ce:56b8:b90b:816d:c3d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm11244051b3a.0.2026.04.05.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:13:53 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v4 2/3] staging: octeon: replace pr_warn with dev_warn in fill path
Date: Sun,  5 Apr 2026 19:41:09 +0530
Message-ID: <20260405141111.87925-3-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405141111.87925-1-ayushmukkanwar@gmail.com>
References: <20260405141111.87925-1-ayushmukkanwar@gmail.com>
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

