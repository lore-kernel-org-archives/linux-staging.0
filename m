Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7542DECBA
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011326; cv=none; b=fv8QNznOpyjiJejGetqIUIg8XSbeZUs7KacEp6ULPrQGsQ16WdmeyPy3K6fOIE3sv90gEfZe8RmGtiKW8D1Zrmyr23XfDuJALJmixnmeeOVUKNz4towL+/B9uN6gjYKNJe30lASKezNhCsJTAJHONlWypFvh05nRCpmxPxSUCxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011326; c=relaxed/simple;
	bh=91DLaN/3BVvZ9S6UHIjeYt/SdwvJPtarQvJUB5BQDSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1ZY9oABEu8j9zHDgJLht7VJagY4HOqQxeBhreAicvyNfsH9puzb2dwYNXskNICWoLROmc0AQP6EIzxAcFnfvmaj3gPgjgkuTEcf3UBC2lghxwcOn872OOc+0lzUTEIDZzt3jWXLGd6d+bPeWkqqEzYG/fDdwfprH5lHJC+n6/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKs0EIkO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKs0EIkO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36520a83186so2356362a91.3
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778011325; x=1778616125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oCn3me6EDFiFJl+CH6FX/tjgPWIDDCQbDsRzkrvnXhc=;
        b=HKs0EIkOBnYSd77EcezdtyHca1esXcwqpTl4KlsnsrP8kU19tu3axXZs4h5vyIbpUb
         htn8ySYLeW/z+kab47Rf5FYidZ/hmIyWKtXeenRQOQAkevU0fxIdCuhKLEpnCowQogXM
         zd7h6ZgiIwdPv4SMCaTFityBzQMKgMtrgCy9JOeoeSO0nx5u/1B3EbzsFsHojeeQY3hC
         fzggs7vjBLHRM7Ns8ZPebOgazvH7MTTH2JOwj/UN9F/7bS/bfjKfi5EaSlPmeeOz8EBp
         UZzCaERPlvHUI3ZAwbAEyInFzTHSvqwvM2aToCAEPKuLxjY9jSdbIPXyUzTRWhOC7oyP
         t+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011325; x=1778616125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCn3me6EDFiFJl+CH6FX/tjgPWIDDCQbDsRzkrvnXhc=;
        b=HcxqzFYSNZLMhFk4weLbvMKL4HRlS9iFpzeHx8dQTzd0e+RhFmGDnadadcwqvTcyN9
         5chuk0Dfqv+hA5MUtRkdDVBWx0vCCKytLJ29edrxlvamg2PSJM7jOb6kX8/DaEaZA5kF
         YdvT8r+So3F3A6rPcRbchke9TsiAta8/9kH6dUlljZBfSFBW2AFjxdRHC4LPi5vx1K2r
         44R5lFUGL2zpiolw1FYspeEVy+ww+3t4pWWg20C59gfHpgbM/fwKIkuvZG1XnTSydF36
         vka2rh9wP0MlQwSxoEcMv+QicQjrK6hCq5mwFZNZODAjj/Q4O6jRlGxHPloQCAWaPAyw
         KazQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zzWpXMlrfbGp7P9mVzz2dZvrJIvpR77LHeHEAKDOZcwDN/R2ehBBiss77xNLwaqq6yvANKZR8oWXlhr3V@lists.linux.dev
X-Gm-Message-State: AOJu0YywauKDp80F6hFiUNXPnN930pm/SCfJ0eC8qA0bR6g5hrtU5LXZ
	3jg8ZwtywbesAY8jh2RYpOwy3R0EMZaTFp4yMl12zj+uPERAyE24p9w2
X-Gm-Gg: AeBDieuL7TWRCqyFdc6KYkxzRWzS5l0pO5ySxmFLDIDwYcM97FPJePSX6T5zjTcSGDP
	kSkxZ1G84GMJj9f9kdeT9+hgPfDcUOQ1V+fr4cKT1PFT9RGPpaxGLF3AUIjNGwv8J/p9wb1fGO7
	rfnVkqsEfDe44LIuZ1WXTVPtI4C1ZJL6nGrPJLpNkH9+O2akOl0NgdjlmZI94/MfO/OFnRRiI//
	sog09BaXN7XF5uIT/1bhIWBK9G736fxfjTyXwUibMe2IZloI19B6vBwnOiRIkSr0zWwHzkHSirH
	fKqsZbzLIb0uUFu2wQtfvBcsz1mfj8fYM3dBGTa1nFH4sY99HRZFgd22txsX3NfG9a3EGgRp0H+
	0AZ9IfcNJfgM5pVPWzyzxfHXyWy/8hxpNgpz8PqOWKk+S0Nj4AP005H8m7LgU73qARCZ+aHkEsx
	SMDpJ8OMePEyDe6ipk2jR9YeI8IV0Bj1ly9Vkc5T8gYE5d1BWN5n4n8cpR4kAhNGx5jb8FHwMKw
	JxpSOmUD5d1Q6L73buvEZkALm1JFljy
X-Received: by 2002:a17:90b:3f45:b0:364:a497:dc4d with SMTP id 98e67ed59e1d1-365ac47c44bmr287052a91.24.1778011324312;
        Tue, 05 May 2026 13:02:04 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365af92b9c3sm24809a91.12.2026.05.05.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:02:03 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: vme_user: simplify boolean comparisons
Date: Wed,  6 May 2026 01:31:44 +0530
Message-ID: <20260505200145.160377-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace explicit comparisons against zero with logical Not operator.
This follows the standard kernel coding style for boolean logic.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/vme_user/vme.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index cb9796c87ee8..b5c66b66ce32 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -274,7 +274,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 		mutex_lock(&slave_image->mtx);
 		if (((slave_image->address_attr & address) == address) &&
 		    ((slave_image->cycle_attr & cycle) == cycle) &&
-		    (slave_image->locked == 0)) {
+		    !slave_image->locked) {
 			slave_image->locked = 1;
 			mutex_unlock(&slave_image->mtx);
 			allocated_image = slave_image;
@@ -419,7 +419,7 @@ void vme_slave_free(struct vme_resource *resource)
 
 	/* Unlock image */
 	mutex_lock(&slave_image->mtx);
-	if (slave_image->locked == 0)
+	if (!slave_image->locked)
 		dev_err(bridge->parent, "Image is already free\n");
 
 	slave_image->locked = 0;
@@ -469,7 +469,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		if (((master_image->address_attr & address) == address) &&
 		    ((master_image->cycle_attr & cycle) == cycle) &&
 		    ((master_image->width_attr & dwidth) == dwidth) &&
-		    (master_image->locked == 0)) {
+		    !master_image->locked) {
 			master_image->locked = 1;
 			spin_unlock(&master_image->lock);
 			allocated_image = master_image;
@@ -793,7 +793,7 @@ void vme_master_free(struct vme_resource *resource)
 
 	/* Unlock image */
 	spin_lock(&master_image->lock);
-	if (master_image->locked == 0)
+	if (!master_image->locked)
 		dev_err(bridge->parent, "Image is already free\n");
 
 	master_image->locked = 0;
@@ -841,7 +841,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 		/* Find an unlocked and compatible controller */
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
-		    (dma_ctrlr->locked == 0)) {
+		    !dma_ctrlr->locked) {
 			dma_ctrlr->locked = 1;
 			mutex_unlock(&dma_ctrlr->mtx);
 			allocated_ctrlr = dma_ctrlr;
@@ -1365,7 +1365,7 @@ void vme_irq_free(struct vme_dev *vdev, int level, int statid)
 	bridge->irq[level - 1].count--;
 
 	/* Disable IRQ level if no more interrupts attached at this level*/
-	if (bridge->irq[level - 1].count == 0)
+	if (!bridge->irq[level - 1].count)
 		bridge->irq_set(bridge, level, 0, 1);
 
 	bridge->irq[level - 1].callback[statid].func = NULL;
@@ -1445,7 +1445,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 
 		/* Find an unlocked controller */
 		mutex_lock(&lm->mtx);
-		if (lm->locked == 0) {
+		if (!lm->locked) {
 			lm->locked = 1;
 			mutex_unlock(&lm->mtx);
 			allocated_lm = lm;
@@ -1766,7 +1766,7 @@ int vme_register_bridge(struct vme_bridge *bridge)
 
 	mutex_lock(&vme_buses_lock);
 	for (i = 0; i < sizeof(vme_bus_numbers) * 8; i++) {
-		if ((vme_bus_numbers & (1 << i)) == 0) {
+		if (!(vme_bus_numbers & (1 << i))) {
 			vme_bus_numbers |= (1 << i);
 			bridge->num = i;
 			INIT_LIST_HEAD(&bridge->devices);
-- 
2.43.0

