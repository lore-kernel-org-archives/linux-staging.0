Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8C2BEC44;
	Mon,  7 Jul 2025 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897421; cv=none; b=CKkq/fCJGmzIwEx1HTsKDUd/1thDJvMnkVFuHou+4aqzqHqLweDXCOHkvvgRCt7JpgYSactv9k8fUYSfbTyk6y2U0Bv+hSFLda4sue2RDTEvq4ULJnyqM8rtA8ERwZvMssEVen9t/jIKh5mPYZmRMVBPEkPCxz3YocJnSc6WARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897421; c=relaxed/simple;
	bh=b/B3k1831vUi2pwNP8MdNzWU1miTvc6hCuBnBbTpojo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IiFqlzLjaZOgQBT75M2fD+kK8HP4F4uApjcQxvf9Dqifwmuxmne91r/Ks/hPdR56s+V04ibS0d3SqtZyi4fdXLMeTcs0xjiS9+gXsf/nY0F1Q2y3HhneyT5U1zHqdw6msgPdk0lGtvlHRjLePJrvOepUwKmYH3aoqf65TmdKSN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exLvDsVj; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exLvDsVj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606aadc1433so609141a12.2;
        Mon, 07 Jul 2025 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897418; x=1752502218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG5eCNv6FpOvgmpPlEUgxQt8hhDv8eg5LGuMjXE/ZtE=;
        b=exLvDsVji+XgdMYEEl/cx+RLdJhrg8Mlvp/y15nXy5us8MDmbX4c/WeN40MZVBkZL2
         muBQMyGV+Jkz6AfQTUw8BeYGEHoMeWXItCAcr5h3tAjcEEN+jNoGZ4cnNWYKUM0ofIjK
         AzY22FILd5RbPrZ7tz94jZl5DmoZu92bC0bo9DByevQIOFVOq4U99g1C9YUMgYKjGBoN
         g1DeBxemt922y0Lul2k2YCSITo6JOKDAFesqHkNp1fRBZ4HhzQJ1lsVCh+NZgyhoWuS8
         lct8h/vMOk7c6xILrNIEoinzUeJRhQlPFJ9j188zcsEMSM5DbgeRsVf9FoXsB1DmJ1Ow
         RHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897418; x=1752502218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG5eCNv6FpOvgmpPlEUgxQt8hhDv8eg5LGuMjXE/ZtE=;
        b=NbQIXKRQxjHOUz3j5aVF1TENMuqVsdiKsKSr1A90LSEzJpbUOSy/E0v69BYja/VBnI
         4yp35j7bHM1ltZXkv/qHnZPMzDGa5+i69nWrCSMJxzPcDucdugu7/Tx7ZhSuvOWDRxdH
         8YZbKsI5PQjTAFXdfYCSRcMfAiRhI5yfV1SDDb+lh1/WgDtorV06V1fgzrVhCLMtj1jX
         l8cAZZ7sey7nxruf8F80bMwYk0mp2WJkJB0tuQwpw6GMSh3KvmCCyLY1hS+deqTxoWkn
         uX96+JYFXl+rVWtQXHqnqyKrSJCddyHCA/R82cUZvcogJ303iJJPCXdZ/itLWQkmMiWD
         RbQw==
X-Forwarded-Encrypted: i=1; AJvYcCUyWcUl3TaMaltEaQ+R5SCsZA6rT9kMAnXQsRFy12cmsTVrQwNIRS0Dhvl2EdP+njRE0mSq3uduo6IM24IguoEtP8E9BQ==@lists.linux.dev, AJvYcCVCGC2P2FDJp1BdsQpxVesZspJC8Bty53G+VWcLJeQxeJPXq/71ckB6cPvPVk3yPl2ZJutr6XvRSpD8mpPG4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNTT/5Bju7QpXAJcT0Am9IYoPOmbVl8lDOGlGAIg/OWQa2vPft
	txp2OiHTCLrU2eW+PbLJBcexcJT00YG8QkqHcytkPps40QyuW5ywQJQzTy5wEZPz
X-Gm-Gg: ASbGncvIBe+0NMgaB2eMc8yt22OgUSAFuJCoPIlj3HnAnHC8eiYa+3C2RgXCmwJG4d8
	3eFoVocLY8+1+m1nW8kKgTNUva/6EQar6s9/sN5QgjM1WCJCZls0MQM18hC1dPLirgbt3a3s5Q8
	Br8VzjvhVA6zNJEgR8YEHSilZGx56+eJsiWAnLEKiFzG/EiF5ZIwj23EqEB3ww6B7gcmcltuq7V
	vwzEHHHWtUrOHSGj88XWgR6XJClYKM0dcxWojOYW1UrR8p/GG7r27eZI1iW12+EcxJZIc210QY6
	5NACnJTWJMO11XiIuJG8dvq3uueX43TlJa9AHdDzX/UGRmqruJz0DwPhUqxEf45tDJFt4TX7F5M
	IU4JEvl8xCPYLWdj/M3//dRrT9Wz1te06VRy+5flSwWw9UaVOCUpvCXornzX2
X-Google-Smtp-Source: AGHT+IF9z5sVVDWOycBuMijosCyGfwSOuw8mnL36RrKe51aZtDKZ8djtk/Tm+po0MIBLgZLcfzMdvg==
X-Received: by 2002:a17:907:6d28:b0:ad8:882e:38a with SMTP id a640c23a62f3a-ae3fc4b69d3mr413085966b.14.1751897417713;
        Mon, 07 Jul 2025 07:10:17 -0700 (PDT)
Received: from yousrii-VirtualBox.hotspot.internet-for-guests.com ([82.129.154.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm710370466b.7.2025.07.07.07.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:10:17 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 2/2] staging: media: atomisp: unify initialization flag usage in HMM
Date: Mon,  7 Jul 2025 17:09:23 +0300
Message-Id: <20250707140923.58935-3-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the initialization state of the `hmm_bo_device` was tracked
in two places: a global `hmm_initialized` boolean in `hmm.c`, and a local
integer `flag` in the `hmm_bo_device` struct. This was redundant and could
lead to inconsistent state checks.

- Removes the global `hmm_initialized` variable and all checks against it.
- Replaces the `int flag` in `struct hmm_bo_device` with a strongly-typed 
 `enum hmm_bo_device_init_flag flag` (values: UNINITED = 0, INITED = 1).
- Initializes `flag` to `HMM_BO_DEVICE_UNINITED` at declaration to 
  ensure a well-defined starting state.
- Removes a redundant `hmm_init()` call inside `__hmm_alloc()` since its
  always called after hmm_init()

This change improves type safety, consistency, and readability when
handling the HMM initialization state.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm_bo.h   |  9 +++++++--
 drivers/staging/media/atomisp/pci/hmm/hmm.c      | 16 ++++------------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e09ac29ac43d..155f9d89b365 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -58,7 +58,10 @@
 #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
 #define	ISP_PTR_NULL	NULL
 
-#define	HMM_BO_DEVICE_INITED	0x1
+enum hmm_bo_device_init_flag {
+	HMM_BO_DEVICE_INITED	= 0x1,
+	HMM_BO_DEVICE_UNINITED	= 0x2,
+};
 
 enum hmm_bo_type {
 	HMM_BO_PRIVATE,
@@ -86,7 +89,9 @@ struct hmm_bo_device {
 
 	/* list lock is used to protect the entire_bo_list */
 	spinlock_t	list_lock;
-	int flag;
+
+	/* flag to indicate whether the bo device is inited or not */
+	enum hmm_bo_device_init_flag flag;
 
 	/* linked list for entire buffer object */
 	struct list_head entire_bo_list;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index c2ee9d2ec0d5..767a3a24f8e5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -24,9 +24,10 @@
 #include "mmu/isp_mmu.h"
 #include "mmu/sh_mmu_mrfld.h"
 
-struct hmm_bo_device bo_device;
+struct hmm_bo_device bo_device = {
+	.flag = HMM_BO_DEVICE_UNINITED,
+};
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
-static bool hmm_initialized;
 
 int hmm_init(void)
 {
@@ -38,8 +39,6 @@ int hmm_init(void)
 		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
 		return ret;
 
-	hmm_initialized = true;
-
 	/*
 	 * As hmm use NULL to indicate invalid ISP virtual address,
 	 * and ISP_VM_START is defined to 0 too, so we allocate
@@ -62,7 +61,7 @@ void hmm_cleanup(void)
 	dummy_ptr = 0;
 
 	hmm_bo_device_exit(&bo_device);
-	hmm_initialized = false;
+	bo_device.flag = HMM_BO_DEVICE_UNINITED;
 }
 
 static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
@@ -72,13 +71,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	struct hmm_buffer_object *bo;
 	int ret;
 
-	/*
-	 * Check if we are initialized. In the ideal world we wouldn't need
-	 * this but we can tackle it once the driver is a lot cleaner
-	 */
-
-	if (!hmm_initialized)
-		hmm_init();
 	/* Get page number from size */
 	pgnr = size_to_pgnr_ceil(bytes);
 
-- 
2.25.1

