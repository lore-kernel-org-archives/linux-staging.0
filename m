Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB4FBF6;
	Sat, 28 Jun 2025 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751088387; cv=none; b=hRHPyOIw9HL421Ncy4L/aLLKi4ow5UUxDvPh7KUXtbvx/Y9fazWXKdH6IRusDy8Eq5nuui49kHN1pbDYd3kRj5kMW6f9K6bLlgJXo/sYDq074eyI88e+JMGseLtBkeQhISK/SfoImTK2jdUP0KArbzuQJGuXyrkSDl7y3A5JdJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751088387; c=relaxed/simple;
	bh=boM0zRBXLjwthJwgYSDO0LB1VAaDDug+6PDOcd8jBGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ce1gZ3gYsMpCRDwel4wZKrftjtz3B9R1BPZtKd/8EYsnzAUcVLYJa+5slzF8u72N7idPYUOHmSYayoMwREBCCidVcuZWLDAwcvbIwpTpKOdW8Q64B/LxsC4hfAFoC6QqSivVjgf8gi/zc5Ig3PALdjiZy48r/xvEms2VqpIdk5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbtqUyOQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbtqUyOQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a6f24ef3acso303905f8f.3;
        Fri, 27 Jun 2025 22:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751088384; x=1751693184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKiNM7/pAXmiQj3djLWyWoHT8Gthrzr/6qV9hsqDsUI=;
        b=mbtqUyOQfp8Bg8QDMRbnlC0Aqz+cNMrdZZFw5eBdJTdNPD8176xwCFNT71CLAh08jL
         la380Y1rUQ+I3GnZ7ykAsVO6XUUz1hkpnOMoIqiYyQsjldMhyySSxCcIaLHnSapEZUBm
         dIss6sB8miYhs9Mq0H7uWvKsS7DBEUmO0NPFzq0CVJNoENwVZyltimWf8uXhlTY5jA51
         NId79jbozbvNPxrGWq8up0MR0ifR9GHxR6P6c9rGXSBe7gi3X29gAniQXvFRLjvmI/4l
         6R03VM5NfxqPcQQIIg1St2CrmTV9pjmixlIhG1Y6voOcLB2YqXzK41sysMf2t2rua+7Y
         d0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751088384; x=1751693184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKiNM7/pAXmiQj3djLWyWoHT8Gthrzr/6qV9hsqDsUI=;
        b=i2vpW7yzeL7rNm2ELdL2Cue8jil1+GEqjzreC+rfPPQ+UpCuRhac5yTx2zGXjTYygx
         EAx2bGr07mQ2WJUwb5MhkK4EDBY2dpbhjofDFCN2oK81UESskRKD5MmUN3cvuHNnBxWS
         TFjZyZn1C456nUE68OlgY44lFZgwfvKvX14ovZx99XlCWTZptms9lWUm15zmkUyrmt9h
         bAIx0iMeroBVqVqN+OoQn5mw58mUM2nAKuxGo+2okKrqzoe3tlX1DIZC5nBPigPDJjOr
         uRCxs2lEd3WwG3v29KiU8ML3nU/2eV7pw0HQpEH338HYXVKife3jQN99qTgq7EZ0h4ZQ
         B50w==
X-Forwarded-Encrypted: i=1; AJvYcCXtnRDQXvTGalFcqauPJurzU69uMFP4eEf5dKyxXyhfIEvTUmuonUJq1xrf/lJj/pCYKHQ93L8sOAuD6QWH@lists.linux.dev
X-Gm-Message-State: AOJu0YyPhyAuA102VX+OMISupu0SMpkq4cpKq3r18R5szs1jYTEekIjA
	LEgEMWITuStyUXMUjrzsqXWuG5L4h4z5oj0q8rDi2hu98I1Zux/JTSRD
X-Gm-Gg: ASbGncu/ukUwug+cMrdrIxoja0LPQTdnbMBG+PyotuEsMNyR+4OyxVvD3CSO1ZUlPvW
	0dfz9vphh0ejGxR6LENomGE7FTcKc6YVAFhzv7JCUjiJZ3zd1TUGF8P2xbiPu47VepEmVT2qige
	5XpRTi9opz7n6bqb3NNDPeeDq9nJhnqGK2INoSxPeZGSIYG3ORiN9+c5VxpRK1F2rr5aO87NroQ
	RJghqCmov4A9cNH3G4yvgCVMu3l5zqg1duSkKXD5eeE+6LpmdxDBTOSfdz5tHQnm9ZMWO5yIHJ5
	R05iVhFLoytidIDl0kFeBppYNDz0S+ACKJV9VtglUzJJAG3dnwcBLXgidWRFvgKC/56yAF9pze3
	f6TvJ5ZKrpjk7BSn5DCyEIDs=
X-Google-Smtp-Source: AGHT+IEhmKtKJ6ishzSKPnEF+eduFX7OxjSKBg8TeE0H+zh5uxxd+nQywKJLgF9bYCuTnjTMwE84Dg==
X-Received: by 2002:a05:600c:c0c3:20b0:453:bf1:8895 with SMTP id 5b1f17b1804b1-453955642e3mr2860875e9.5.1751088383609;
        Fri, 27 Jun 2025 22:26:23 -0700 (PDT)
Received: from localhost.localdomain ([156.208.43.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm99905265e9.22.2025.06.27.22.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 22:26:23 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix premature setting of HMM_BO_DEVICE_INITED flag
Date: Sat, 28 Jun 2025 08:25:36 +0300
Message-Id: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
before key initialization steps like kmem_cache_create(),
kmem_cache_alloc(), and __bo_init().

This means that if any of these steps fail, the flag remains set,
misleading other parts of the driver (e.g. hmm_bo_alloc())
into thinking the device is initialized. This could lead
to undefined behavior or invalid memory use.

Additionally, since __bo_init() is called from inside
hmm_bo_device_init() after the flag was already set, its internal
check for HMM_BO_DEVICE_INITED is redundant.

- Move the flag assignment to the end after all allocations succeed.
- Remove redundant check of the flag inside __bo_init()

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 224ca8d42721..5d0cd5260d3a 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -37,8 +37,6 @@ static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
 		     unsigned int pgnr)
 {
 	check_bodev_null_return(bdev, -EINVAL);
-	var_equal_return(hmm_bo_device_inited(bdev), 0, -EINVAL,
-			 "hmm_bo_device not inited yet.\n");
 	/* prevent zero size buffer object */
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
@@ -341,7 +339,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 	spin_lock_init(&bdev->list_lock);
 	mutex_init(&bdev->rbtree_mutex);

-	bdev->flag = HMM_BO_DEVICE_INITED;

 	INIT_LIST_HEAD(&bdev->entire_bo_list);
 	bdev->allocated_rbtree = RB_ROOT;
@@ -376,6 +373,8 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,

 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);

+	bdev->flag = HMM_BO_DEVICE_INITED;
+
 	return 0;
 }

--
2.25.1

