Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A433E5EC3
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916663; cv=none; b=DtU+fA9dSwsd6Za6KILikgamIS1pBk1WYQQeNbB275SAFJuwIW1ksCJPUWkVXecNWEP2eddpPLaNpJeO/qC0pOnyRFTXmxtNnvuOVEg29+3sW8uDHczqeYn6Usaq1H4wugbxTxyF7ujRPt9+u33k/swg2Iy/uFpX4PN5SpSn61c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916663; c=relaxed/simple;
	bh=UVPIF+sdrfM6NBHHlN4FeC/sqESWRpaMVlGigUdv/SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+YAhkpFhuR945yFyViypQM9g0qXNH7jJ6boS95ZgWusOiKFhgudI70qTwLcb63Rm6QA1SJjOgjxetU+fAGNitEtnberNm9o67yUG3YnahH2eEvAcTNE3v5LpAlK2+uV90o8UOBus77ecaISKr7feZGdYAayCZcCR1xTkrsBxas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaInA3ED; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaInA3ED"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-837b704783bso122724b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916662; x=1778521462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3r7HpB0/DU/QpLYQMcgaK+OCH5zehE0tbXldsuLb0A=;
        b=KaInA3EDNdRPmO1TRsXO0wayY7PN81fIAU/4FaVGxk1LrnTHtJV8ti9iTQ8QddwnuH
         p90uG+PS++1PUTCJFmzCqkCdHA5lyM3gXik16LXyspzfjB+yxE5hl0qz9dcn4rDu/yKK
         3HH6At7UcbXhcwKuCFGEjwKvJuTPJz+FocmTEEAuMEK4J5r/N2wthFV9IUTOlcLcivhB
         bWHyyKMRDK69u5Qweb8KBC0lLTMK1g4Pka1HAVDa6jg9NjEvdY4llTZAYcozhtCMYFTq
         c0vUY5IGICtF3fEgdW13elZ2apoHPYM+tCGlCQr6u5bGGZOP61c3CvSOlJ7zDXwPf51w
         Nsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916662; x=1778521462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3r7HpB0/DU/QpLYQMcgaK+OCH5zehE0tbXldsuLb0A=;
        b=TnS2IncgFMpkEnIDtOHRGPvhZFUbD2wluPVwVJ7oW0b1gZL7Tm6xUHv+fGZJ+/Utia
         CWO29l5H8dX+kUx6PwTc65nfjHkRbdule5WGckF6O0NBzwaUSfABDeiCqWVn4a5cMazN
         AYtzxYfTCw6DcD+TSkOhZ4jH1mioB210wqHtZnOCq7yqqG7AJjm0HOQmp2BIV0cM/Sv9
         Hcum8x74/GuOBuEnPtbmLaaKHSfKvxSiIHPp5KhluCMCdlqMJ8FLv7bkqAF/r6nGvv+e
         aPVF30UgJi0Pd/0pUa0SkBjptgA4TQdrbA2FKp88G5sIdNfxEU8QVqXtJcUVlSU+k2UY
         aSMw==
X-Gm-Message-State: AOJu0YysoIAcM1o1NlRZ6gEHAWwdPLXWpi1f0dqKGUMMZpBUEREiX3VJ
	xH8A4EIMckjuASDr0+y+hjPg6kLUfSYsUDVmJ8E4gu+oegDPhzukJ9YK
X-Gm-Gg: AeBDiesqLcBXl9nX9iV20prrKAYQhhAawiW6t7qPNv6yqI2E2k7pYudsz/Isz0pdvpy
	Vhdtu5OFXsxoldG79L0nWcoAE3tK9YQjis42wogM+VquOFqgq9n5cVc/epNEBmbq9y0H3R/k/42
	HC4jrETciQCQ55JbilRk0L0EjOf2Zor0tnMOx3NRhcoE45ymcuz856ByKevTaSdh8/CIvLtyVaq
	AZ3IkZz7oB77iW65ziJkmkvBenD/33iNLNsgELXxNGC7dpns3JFBJl+dSXxNUwKK9Yuruc32i8G
	FmdhP7NnZ8lCXQ0n4grRpGXB6eXLzjkAUsPVyvdr4wY5AM7Z77xNxhlFCYS0+CsiohqcUBzK4p7
	PSHlcY0rpramVi8VDwufDmqL2R8lGO3hKAf7m+XNrn3DjrrO5FdUCK3HzaKxTjCz2OIX3a2nyxr
	Dz4//HwYGzMOnRZnPGH70s7vdRC0PpjMZm0du0cd1BwTdODQmjnhvRro0yOXUvlHUh6XQl3xXFu
	Y2No6Tzw5ZHs8fZ6CGZDNpnLIs=
X-Received: by 2002:aa7:88c8:0:b0:837:42a6:58a8 with SMTP id d2e1a72fcca58-83742b5accdmr2731386b3a.2.1777916661377;
        Mon, 04 May 2026 10:44:21 -0700 (PDT)
Received: from fedora ([2401:4900:a3fd:82cb:c080:4c49:655c:41ba])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83707fab756sm5923388b3a.44.2026.05.04.10.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:44:21 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v6 1/3] staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free functions
Date: Mon,  4 May 2026 23:11:44 +0530
Message-ID: <20260504174146.117026-2-ayushmukkanwar@gmail.com>
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
index 532594957ebc..11036c6eb36f 100644
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
+ * @pdev:      Platform device for logging
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
+ * @pdev:      Platform device for logging
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
index eadb74fc14c8..badf5ceaf5b4 100644
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

