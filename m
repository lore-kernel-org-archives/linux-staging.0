Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01242F28E3
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775398433; cv=none; b=fiQ+QN6y+0vducst/GdwiRH8F+WHKSjgD7+w6MmiwLsxhLFJNQv2dhEIyvpc0qRtdSmwkrRvezyVag6O7Cg1hBUL1s6drDO3Ja7uq0sxQSPe7sUKw1wbwB7CeP3F8mzhCAYsf8zfJhHQZzFV3sqAtzN3BNbVYAv2yhdlKZ0TBuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775398433; c=relaxed/simple;
	bh=eI7uK9JgIZGXm+y6YPkBJPVNHd21oGhz4Zduel6JvOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jr8+v2Tzlyw8eU45f6A4zzdn8OGSgSNjuD8GcLr9+8r9XTjqweSNPbr6QzPBoVDP9vCVra9DAe9NtsyGyf6vf7b39lDo5Il132m+4lAsOUlW7Kl1wBddV3bY+HFuXEENWZieuMjmEtudJ2s/oJEuUnHaUdTGPK3f9hwrS3NcyOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLbge0Mc; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLbge0Mc"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c741c1a656aso209732a12.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775398430; x=1776003230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzp2ryRQt9RDlOVSqTdsO/fnm73ORdbk3rSWRNH/Bqs=;
        b=XLbge0McFbM9PJZrqKPMyA/o2feoBCpjccyFBV8/kx1fpf7cITwW0PjDUONCnF/3B4
         Ay2WND/KX0YMdkKAkk+d/+z4ffMEJj8rCiiBmtc2WGk7d3U8DpVDw5YXTSSwwNqC/y6s
         4RHLBE90XSrPTWaUPInle/GqhpqXUvB2azaycj1BD/2/Kmyo8HTxVcCio22oDroxf5Yt
         g+sh98QcgpWA3c+9PqzhnaLNRFfzNBP/d6zBNrH5NC0iB8/EyEuWphKuU70DJierelY3
         OLEwK1er5yxYgxSccQehgJaFdOQzRteatNsf25k7FqkRSfb4JVO342YTElWA6/lWucKZ
         4+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775398430; x=1776003230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzp2ryRQt9RDlOVSqTdsO/fnm73ORdbk3rSWRNH/Bqs=;
        b=CRqIGMrk83FOlQlu9+JGGCTii2pzH6usTBGBCDIDNW+I9FOTFDQnUnb/iO3RKeEwYS
         O6UcTirLkuooj0JNlB6IS4U/5eeebgjH16wcnzbnXryDJcAu0LtkYwTDHyZ7T9oBPf6e
         BgFYrx33tIfwKwQArcu5NSpuN5FkJHM0j5//hZAlnZ3ZTQLGWLv0IK1JEfLfyRtMY6HB
         +RyizBopYX93HfjCGsByeTkqjouXQCg4AVrltwxqtVwlxFc98jP256tCRcTu97eQJWGa
         NflLrNPscJ8weqNYfAj90kIQPc/+3b6956KdApU4MJIKy0j5JixXq98CTvhQLP/OvdQd
         TwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1C8Jz0itNVZcVi99//6HbpH0uZk0172IDsLwg1BaONhkQ+Nxv2Wxou9yAv0NOnXHFptia6I4vr8T5LpiR@lists.linux.dev
X-Gm-Message-State: AOJu0YxICo5t8cvNEEip9AUy+fOo8Sf1BJpdaWo/zUDkbLGlISXBdFC3
	kb5z+Nx7x3dtYyjstVvE8HfhsPJ5XyoN3WvIVP1LEnaqQ6foWy070q1Z
X-Gm-Gg: AeBDies7Cb5mVqaoen7zRRYrH3ri7+AgnITW9Ks9mR5m1V6VzN2rOlMEQ3LsNCUeFjD
	xmJnypyFNshJPLAJn4S8GiMpM8g6Dwj20Dg12DhgKJQIwUiEqgR21MZyl3raa2VxRedKH6MQLTZ
	Q4E8cxPX4Adpe2MowBpvnJDi5v4oZHHH260asvoroL8c7eW+YdmNyi4D3ew+tiaPp1xsQGs7yPl
	/bRUhkYQZ+QdCJb5FjpD61VEnhV82luwB7o0uo3qs00k0ORuNkAm6oFYlozEs+00y2DTgHwG6k/
	Mwb6NumcB5ZJeOZ/QeUBQTPQLleqDOFsHPtVphyN1TQwz8LZvFUoYSJzNKc0uNWjTI4Pxm1WXS8
	KmsVSAU0m3BO+BGCqfNAcR5upfp/mjLM9lGcMElJuC+JI8zLy8baDy2HjiYQ2bICCk/D+QbzzQb
	NPRPBvySZIlag8BScNmBIvhkJD01Pz
X-Received: by 2002:a05:6a00:14c8:b0:82c:ae58:46a5 with SMTP id d2e1a72fcca58-82d0dbad46amr5686710b3a.5.1775398430045;
        Sun, 05 Apr 2026 07:13:50 -0700 (PDT)
Received: from fedora ([2401:4900:82af:33ce:56b8:b90b:816d:c3d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm11244051b3a.0.2026.04.05.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:13:49 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v4 1/3] staging: octeon: ethernet-mem: replace pr_warn with dev_warn in free functions
Date: Sun,  5 Apr 2026 19:41:08 +0530
Message-ID: <20260405141111.87925-2-ayushmukkanwar@gmail.com>
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

