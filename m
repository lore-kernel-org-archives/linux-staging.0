Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7801332E128
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303083; cv=none; b=DuOuXqiY9t9nLrce+5mk0oZlmFlLgE24swecUygSmJ0bZxoygInjfZUoI+6HKrIop1YS+YKClsuOov/8AaVCOLFv2+xtyuAWCTf6r+7yuQcgWOLoMlcI1i/HevuFgpobnibzXTI1Q2AwrhLEM0qdgH/kPQ0nJWoy+QmPn7TuYRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303083; c=relaxed/simple;
	bh=eI7uK9JgIZGXm+y6YPkBJPVNHd21oGhz4Zduel6JvOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSNKuT/cku4L0TDUMAhNVbIN3vgTec3/wel/MB9mdHhjlGRgj/VeP+wfMRDNRb0NzZMzDacSWIRPQmy+s+BonQJfFd2V1ocdNZmoLUg7e0znqXjT4WYCiYLfKmDRDmE8q8HMJwap2QI0dgqqxuyXDu/9Grp1bhFeELmCQHCM0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRIqqY8z; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRIqqY8z"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f0647ce27so677107b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777303082; x=1777907882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzp2ryRQt9RDlOVSqTdsO/fnm73ORdbk3rSWRNH/Bqs=;
        b=oRIqqY8zI1ga3InUiaBVlDtHqCDWRDcIxrLMWbJ9yucxCRkfRlERb8BSZR/07aBALa
         3fX3Wq2ot+lV7Ov5tnpMxJKt5AixE6KANojvxKYlHlXWOeoKhRTBMVsNHUQHLMQy8wqd
         bDPNod35sczv2+hCR0UztiLl5wGsWyrABhtsI/VVUgJj7qp3OPqhTty/ihatzGeP6SkL
         n00k2bl9acq8NBjd8i5p0sipqbSmS4hbUHW/Rmfg60xM2KdN03JaFGMw2i6z43Em+GW6
         k/yWilUYvNDqiM0ntFpMZMOVak3wTRSf7pYj0Jbw2caWJVLVs852gl7yP8YmQ7rIM/fA
         Yr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303082; x=1777907882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzp2ryRQt9RDlOVSqTdsO/fnm73ORdbk3rSWRNH/Bqs=;
        b=nWQKpQqgb2tALcyCGMuANhPvuXy6/mNHnqjUBQXzs/Rn7nVQDeHuFRYzBDJ6XVtOOs
         leMB0BlHApnC/Qqb8Be6+Ejtvbwruzc97Uhosk1fS57L3KZSxZG/o1n+/l+IHnHUpbCx
         F9LE32nxKQNLcnGeyf5Vfy/kxly6+vkcTT40c61BP8nS54HHZRbWkw2pCltBM9zfadvR
         /IMH4w8WMpHmohwPKCdeB5tJ1YSTXz6CupkcyLn1sHx2O1u46sW7duUwOxhne5gX28t0
         di/smXo+nwto3Wz1p17uCEzzvXtaXuSdAvcHHvJCATp1bxxqf4xBFttXpG/kGwONF8lr
         vmUw==
X-Forwarded-Encrypted: i=1; AFNElJ/WUX1ftQsaWcNMSVo5GEXbv8uVgpwzUgMaMnw6huyJbORt+CfLYraskZ7wzud/eoRTO6m/yvDgEaAoExFu@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3nx5oa4VliPI2FGWmGVgWUwYX//+yeIcQNcfnnMCj3PZkLE/i
	qmueg37SEjS4T13D1rS8uUO/m96yT3ArbJd+vqCZIpTTUee4N+fDKABf
X-Gm-Gg: AeBDietA5sRkLw2lRfwuhTdjSITcygEoGtY8sXdZ9gFO+2cQQ1FpglbariM7UxaPKtU
	dNwDcYQeCLLp9ezPf26J+oAQZpTsTekhN6ygIrBn2dzjeJZySqdPnvX0GC99L2NXj562jMD/8v2
	vTeqnGeSWdKAODrDsGqyRnsVt9eMpsDmYE1TWBaYF9MD1+UE9QKIOPfYnnb+4Hxjoha5q+aZCYc
	NRV7ZCuXJ0UQXw3R2wAs82Ev/bQV1qZHYNmb7Iph0BOyD4WdQ0/DgESBadmzLq3fYOQE9HK5j51
	cywOwyUqNSw+W7ch1aTli4GtwAc53hecKozA/VRLq5OZVOcv1LAsVaSXHH6clQd4QS3pvUNOmsz
	HRmO8VvxoooAfYB9/+ulsr0bC0hoXkCjuEfiWKtyICFkdzbRWSySJ7I7k7B/J/h6IvT2kKjog52
	xVTzIsGbQjpNf9LO/zxNvR9D3KTTI1Yc8zwyeUXGjmMPOygc8N6Ox0Q5RbfV8cfGbJIDJDzBvxO
	oFdmupd9CTCRq0P8gwYyiJ5ShE9rhtZKdmnbg==
X-Received: by 2002:a05:6a00:bd86:b0:82f:1da:9781 with SMTP id d2e1a72fcca58-82f8c2c243emr23308200b3a.0.1777303081703;
        Mon, 27 Apr 2026 08:18:01 -0700 (PDT)
Received: from fedora ([2401:4900:d824:7468:545f:3159:76d5:30ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm37652931b3a.58.2026.04.27.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:18:01 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ayushmukkanwar@gmail.com
Subject: [PATCH v5 1/4] staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free functions
Date: Mon, 27 Apr 2026 20:45:52 +0530
Message-ID: <20260427151556.91153-2-ayushmukkanwar@gmail.com>
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

Replace pr_warn() calls with dev_warn() in the hardware pool free
functions (cvm_oct_free_hw_skbuff and cvm_oct_free_hw_memory)
to include device information in log messages. The struct device
pointer is passed from cvm_oct_remove() through
cvm_oct_mem_empty_fpa() to the internal free functions.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c | 30 +++++++++++++++------------
 drivers/staging/octeon/ethernet-mem.h |  2 +-
 drivers/staging/octeon/ethernet.c     |  6 +++---
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 532594957ebc..501a2f7487c1 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -40,11 +40,13 @@ static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
 
 /**
  * cvm_oct_free_hw_skbuff- free hardware pool skbuffs
+ * @dev:      Device for logging
  * @pool:     Pool to allocate an skbuff for
  * @size:     Size of the buffer needed for the pool
  * @elements: Number of buffers to allocate
  */
-static void cvm_oct_free_hw_skbuff(int pool, int size, int elements)
+static void cvm_oct_free_hw_skbuff(struct device *dev,
+				   int pool, int size, int elements)
 {
 	char *memory;
 
@@ -59,11 +61,11 @@ static void cvm_oct_free_hw_skbuff(int pool, int size, int elements)
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
@@ -107,11 +109,13 @@ static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
 
 /**
  * cvm_oct_free_hw_memory - Free memory allocated by cvm_oct_fill_hw_memory
+ * @dev:      Device for logging
  * @pool:     FPA pool to free
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers that should be in the pool
  */
-static void cvm_oct_free_hw_memory(int pool, int size, int elements)
+static void cvm_oct_free_hw_memory(struct device *dev,
+				   int pool, int size, int elements)
 {
 	char *memory;
 	char *fpa;
@@ -127,11 +131,11 @@ static void cvm_oct_free_hw_memory(int pool, int size, int elements)
 	} while (fpa);
 
 	if (elements < 0)
-		pr_warn("Freeing of pool %u had too many buffers (%d)\n",
-			pool, elements);
+		dev_warn(dev, "Freeing of pool %u had too many buffers (%d)\n",
+			 pool, elements);
 	else if (elements > 0)
-		pr_warn("Warning: Freeing of pool %u is missing %d buffers\n",
-			pool, elements);
+		dev_warn(dev, "Freeing of pool %u is missing %d buffers\n",
+			 pool, elements);
 }
 
 int cvm_oct_mem_fill_fpa(int pool, int size, int elements)
@@ -145,10 +149,10 @@ int cvm_oct_mem_fill_fpa(int pool, int size, int elements)
 	return freed;
 }
 
-void cvm_oct_mem_empty_fpa(int pool, int size, int elements)
+void cvm_oct_mem_empty_fpa(struct device *dev, int pool, int size, int elements)
 {
 	if (pool == CVMX_FPA_PACKET_POOL)
-		cvm_oct_free_hw_skbuff(pool, size, elements);
+		cvm_oct_free_hw_skbuff(dev, pool, size, elements);
 	else
-		cvm_oct_free_hw_memory(pool, size, elements);
+		cvm_oct_free_hw_memory(dev, pool, size, elements);
 }
diff --git a/drivers/staging/octeon/ethernet-mem.h b/drivers/staging/octeon/ethernet-mem.h
index 692dcdb7154d..591e0bbb6f10 100644
--- a/drivers/staging/octeon/ethernet-mem.h
+++ b/drivers/staging/octeon/ethernet-mem.h
@@ -6,4 +6,4 @@
  */
 
 int cvm_oct_mem_fill_fpa(int pool, int size, int elements);
-void cvm_oct_mem_empty_fpa(int pool, int size, int elements);
+void cvm_oct_mem_empty_fpa(struct device *dev, int pool, int size, int elements);
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..9eed0a89a2f3 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -958,12 +958,12 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	cvmx_ipd_free_ptr();
 
 	/* Free the HW pools */
-	cvm_oct_mem_empty_fpa(CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
+	cvm_oct_mem_empty_fpa(&pdev->dev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
 			      num_packet_buffers);
-	cvm_oct_mem_empty_fpa(CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
+	cvm_oct_mem_empty_fpa(&pdev->dev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
-		cvm_oct_mem_empty_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
+		cvm_oct_mem_empty_fpa(&pdev->dev, CVMX_FPA_OUTPUT_BUFFER_POOL,
 				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
 }
 
-- 
2.53.0

