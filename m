Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19703FE37F
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512349; cv=none; b=N+roaBxfc3cZ7fDFg8YaglQFTjAsAMMMYbBVn0tPGVcsWuZfT5OjB2gGOojMLOB7Mg6OUpSQZYi2qSpUY03apZbNOdRg0iCn+VJ/VaAfgfiqIxCcdbUzUbtJtl7HnzDkAO4Najcjve+K/fKK0GvqcoTutOopya9i48lXGBbM1JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512349; c=relaxed/simple;
	bh=vwvnf6ebNn/NdvRMiSmEWSC8RhjdM5BZPGxzZ8bBLlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f532pvkJYyXRCWa5tTYmZFxXHckLXurVa13k/5iJjh6mQMG0tHrgYmpX31AA8HGTuu+/VVdQ+/eiB5y9LiJDZXqD/V6KRwGd0VQs0ay0AuVlYaHBnyuIbCjdsEKL/SKJL3r/7ZePxoSMjwZoxeyPEo9l4nIwShmhVejeNCkHEs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiO+iV4q; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiO+iV4q"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-366419bd034so520115a91.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778512347; x=1779117147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0LAxw+DkAOqO35713IXuk7e1h9XlRq1lhurgaJrZFk=;
        b=IiO+iV4qk9j9Ce5vaIKwufFdVt405F6B4desL1kVyH7aJC9JmNUl9drEy73qfC03nE
         l8GWcNuQCad+zqVJvKCuNgP9UREeK70N5xMW7gPSkvT192y4kTavKpMBsQPcHL4U7P6c
         +vykyTH/GHDfFhiyoua8YC5OeOcECZcIVwI0Z13G8oCfhLAQbadOKzyvCHDoEEOihG6M
         958QJ3GUZqqIewfqJrVSh9B9o/bgt8DQvqIRloCSf2Si/kILrB6ITrhBqfWTFPqrsvGt
         YuK4aufarvaC6jeiJqBw6K2FjhxUmTgNvJzspHjGwyrtR3wNJnJufD7POEy3tdxDB3I8
         XPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512347; x=1779117147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0LAxw+DkAOqO35713IXuk7e1h9XlRq1lhurgaJrZFk=;
        b=jOP2uUDHHJjSh3PqLdklynwRmqZJtr6tBgTjUC/MuAeDPNSs6c10fFBe7fqiMBivAH
         n9FGNunnUo+YHylE9knkzzVx6DYv602+JCDMpR/xvccmI9JTxW9Byow7YkPAzFKzsSAw
         Ard33r0RNuzzRDr+YcK6AStyDfpekrvHIhh7yVJHv63LJFq9IoxcInjkLuhnk/DElEIU
         LSeKNFbqQQ5LOW9bIA9tCEOKNv0h7YXngvnoYj5Y2Oi/uSr4Gh3+IFeRxdsL89GvWjU7
         /rj0ZrxH0qDWl4S5qd993iPdvfcTriYXylLSNSRrL43C5GrXZswcp8vwUIQsT8z8FQrd
         PGzA==
X-Forwarded-Encrypted: i=1; AFNElJ8t3izymt8G4dWw/dQcbfv7PQ9EderVAY8EI/eRn1V4UoeZXoT0vACq6x99Vhpxu5D1zWe1NrclfNsrDfYR@lists.linux.dev
X-Gm-Message-State: AOJu0YxRvl6j2rfgY+02BormDXZ+Rvjqy7QZYXT53i2ZSqB9S5qcYinh
	Gq8930BXih9T5j5p47B89FTJ877/cHz75maCqK6UAJ/thX3/5qzqCBuU
X-Gm-Gg: Acq92OGh6n4jRi2HUsh5Y5AeDYubqNtBheEt48yVJjUoG49UJkx0KxZ/kDyscNirxk2
	7myyZ55ztWRjD6v0XkKZDVqHvm4vXDyJB+1JL15TJD26+N5QWJMgJ/lbVBXw2/tKFGobm2CmclC
	wWitjsqdbAZzIxAPmkUop5F71wK135BbgN4ix4F7prLIdNfWpMaR6DSDeB1a+822bUhjvd6qvqQ
	9Xxvyx4VinM7uPygnL79xyYy9T8xugZAw+XdjQBxPHvHsIJlRB9w/UulKVZU9yolc0Qadt77kP/
	Wo/dy/rng32N26RWztDCchzmQ6SUH0KxWWHd/U306m7wq69wHRoGkSLgs0o47rGllfFSpvO9g9A
	aEx4YVgS+oAIfHfjSNpefXONATj/pvGMThIJeZojNyjE9okt3RescwNBxVn12N4ovJab6UjwsSL
	HddXanlgNUjgbQXt1g7gqfxlA4ZQBJrre0wUp4L3NaDPCSiZ51uAVPwJLbFZ4ATUYrSTh46di4L
	OWwTQoTqgoxBNKlmA==
X-Received: by 2002:a17:90b:2246:b0:362:be3b:c8d4 with SMTP id 98e67ed59e1d1-365ad70fe5fmr13683480a91.3.1778512346904;
        Mon, 11 May 2026 08:12:26 -0700 (PDT)
Received: from fedora ([2401:4900:bffc:e9a7:49ca:5a41:a2bb:6936])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fa7asm9932363a91.10.2026.05.11.08.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:12:26 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v7 1/3] staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free functions
Date: Mon, 11 May 2026 20:39:29 +0530
Message-ID: <20260511150931.93382-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511150931.93382-1-ayushmukkanwar@gmail.com>
References: <20260511150931.93382-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct platform_device parameter to cvm_oct_free_hw_skbuff,
cvm_oct_free_hw_memory and cvm_oct_mem_empty_fpa. Replace pr_warn
calls with dev_warn, using &pdev->dev for device-aware logging.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c | 31 ++++++++++++++++-----------
 drivers/staging/octeon/ethernet-mem.h |  5 ++++-
 drivers/staging/octeon/ethernet.c     |  6 +++---
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 532594957ebc..af79b2bdac27 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2003-2010 Cavium Networks
  */
 
+#include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
 #include <linux/slab.h>
@@ -40,11 +41,13 @@ static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
 
 /**
  * cvm_oct_free_hw_skbuff- free hardware pool skbuffs
+ * @pdev:     Platform device for logging
  * @pool:     Pool to allocate an skbuff for
  * @size:     Size of the buffer needed for the pool
  * @elements: Number of buffers to allocate
  */
-static void cvm_oct_free_hw_skbuff(int pool, int size, int elements)
+static void cvm_oct_free_hw_skbuff(struct platform_device *pdev,
+				   int pool, int size, int elements)
 {
 	char *memory;
 
@@ -59,11 +62,11 @@ static void cvm_oct_free_hw_skbuff(int pool, int size, int elements)
 	} while (memory);
 
 	if (elements < 0)
-		pr_warn("Freeing of pool %u had too many skbuffs (%d)\n",
-			pool, elements);
+		dev_warn(&pdev->dev, "Freeing of pool %u had too many skbuffs (%d)\n",
+			 pool, elements);
 	else if (elements > 0)
-		pr_warn("Freeing of pool %u is missing %d skbuffs\n",
-			pool, elements);
+		dev_warn(&pdev->dev, "Freeing of pool %u is missing %d skbuffs\n",
+			 pool, elements);
 }
 
 /**
@@ -107,11 +110,13 @@ static int cvm_oct_fill_hw_memory(int pool, int size, int elements)
 
 /**
  * cvm_oct_free_hw_memory - Free memory allocated by cvm_oct_fill_hw_memory
+ * @pdev:     Platform device for logging
  * @pool:     FPA pool to free
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers that should be in the pool
  */
-static void cvm_oct_free_hw_memory(int pool, int size, int elements)
+static void cvm_oct_free_hw_memory(struct platform_device *pdev,
+				   int pool, int size, int elements)
 {
 	char *memory;
 	char *fpa;
@@ -127,11 +132,11 @@ static void cvm_oct_free_hw_memory(int pool, int size, int elements)
 	} while (fpa);
 
 	if (elements < 0)
-		pr_warn("Freeing of pool %u had too many buffers (%d)\n",
-			pool, elements);
+		dev_warn(&pdev->dev, "Freeing of pool %u had too many buffers (%d)\n",
+			 pool, elements);
 	else if (elements > 0)
-		pr_warn("Warning: Freeing of pool %u is missing %d buffers\n",
-			pool, elements);
+		dev_warn(&pdev->dev, "Freeing of pool %u is missing %d buffers\n",
+			 pool, elements);
 }
 
 int cvm_oct_mem_fill_fpa(int pool, int size, int elements)
@@ -145,10 +150,10 @@ int cvm_oct_mem_fill_fpa(int pool, int size, int elements)
 	return freed;
 }
 
-void cvm_oct_mem_empty_fpa(int pool, int size, int elements)
+void cvm_oct_mem_empty_fpa(struct platform_device *pdev, int pool, int size, int elements)
 {
 	if (pool == CVMX_FPA_PACKET_POOL)
-		cvm_oct_free_hw_skbuff(pool, size, elements);
+		cvm_oct_free_hw_skbuff(pdev, pool, size, elements);
 	else
-		cvm_oct_free_hw_memory(pool, size, elements);
+		cvm_oct_free_hw_memory(pdev, pool, size, elements);
 }
diff --git a/drivers/staging/octeon/ethernet-mem.h b/drivers/staging/octeon/ethernet-mem.h
index 692dcdb7154d..ff10ba4525ee 100644
--- a/drivers/staging/octeon/ethernet-mem.h
+++ b/drivers/staging/octeon/ethernet-mem.h
@@ -6,4 +6,7 @@
  */
 
 int cvm_oct_mem_fill_fpa(int pool, int size, int elements);
-void cvm_oct_mem_empty_fpa(int pool, int size, int elements);
+struct platform_device;
+
+void cvm_oct_mem_empty_fpa(struct platform_device *pdev, int pool, int size,
+			   int elements);
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index d85a9991faf6..31464ed63b58 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -958,12 +958,12 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	cvmx_ipd_free_ptr();
 
 	/* Free the HW pools */
-	cvm_oct_mem_empty_fpa(CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
+	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
 			      num_packet_buffers);
-	cvm_oct_mem_empty_fpa(CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
+	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
-		cvm_oct_mem_empty_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
+		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
 				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
 }
 
-- 
2.53.0

