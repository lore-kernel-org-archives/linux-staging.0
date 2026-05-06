Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC82367B5
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079050; cv=none; b=gEseyT1y62RrWx5e7NtbjWiCt8CXNLQFI1X7SrrAerHSWjiQJqPlyqNQW3C5HS9tZZeua/CIRYL7m106F2fzgQlv12Uyp2cJ19hnBBLQn1jnYabflbuAmuJ9E6vUZidMnwsrMw+c0U6lGk+BtSkEoCs/nCWRdag5nT0YqvDV/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079050; c=relaxed/simple;
	bh=+BzPqwLY+8FlwIFVReviIfjGGsukZ0iJGHlL48cnGBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J0aL01iIO3jSd6nZMnql0T+bpEnE33jXcGTcj1zrqMrEdjvgN9SqWbta57abSzXSi1pFMc9UPp+J0h2m+0LRdwwfkYq8tzG+lhpfzpFRx6f3PvNuGACSpV8RZRMPkl5zSNOi/pXG+W+GtB1g30u6/jELj0Q0ZHGlKMU5sCDUdg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVFRnkx7; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVFRnkx7"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e9653b53cso5353891fa.3
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778079048; x=1778683848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RETNPiO12m2Ypci15ihv5Hd/tHPFt3Lht0sBTcH1260=;
        b=LVFRnkx7MJxp/Xj7rxObDzDxGjbgrpXPyz9p5JmllbhXmfxpbGK6RzOkUWz+BEIpW7
         CXsni+Yh51CzrmWaLZMW6czMp+ldAj2G1T3FEKtY/97BU6DkrKJIOEuI7k2PVXP8bPsv
         tacNNNDkMSpWK/WVVPhv0uvmL+bIeREJnKROHqhGRmqfyP4cqh6sEx885ZkUxM2EkDaI
         j6AeO4/CyC33VYGTOXkWQ6KpTCvFAtRHjT70wANTSZT4Jsh9Z4dTMUfsxU70cm1hlmrU
         9Ml/rxH6czwc9WQKi22p/yGrb7lHSGjUdc5+6UiCIfjK5mhv9z3fG2QwRt57myU47Dzj
         rgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079048; x=1778683848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RETNPiO12m2Ypci15ihv5Hd/tHPFt3Lht0sBTcH1260=;
        b=oC8aWOeo3LEpjYlrJRwLAVF6cjBU2RuyX1A6EmWAv3pUa4cOKUPrqUsDIDbxXlDF7K
         mV9UfZgwnfUXPnodnYf8dX5P/9pW7TB81oE56MO6tjLC/vA6CBw1H4VkLumcaaD2I+qY
         Ln9XDXzK3ZVHvbRg1OmqNV+TE7wATUZStyWbY5LO4OtX52FIicXlfXryVRiqgQcbUyKz
         7+ZgzkK1GPNfU39QSDz/X6/GKUN7hlgA6Xy/UX/DHaQjpbG2tEEr39G9xxe4di14LX2C
         ZkMaW6O6qErql68aSe8aUNDN4C7NkcZlrZgoxdW5mBkC4F0GtkIArZ0WlSY3TTZp/IJg
         AIHw==
X-Gm-Message-State: AOJu0YwvbrQaOO2aY/pJB25sW3ZOUBobxGA0gS++09iFQA6e95m0rX7R
	PobMU6BFKcVkm3rWh0gUT2yjFJmWKMFAsAGT27nAWTOh8TCbz30CEFfe
X-Gm-Gg: AeBDieusa1b/6A3vb67RuQAa6T9JLdUOdQdRMlLtV9Lyi324wmfy7q5Wu168xCudMgU
	TCzCzFJLJeiNAlomI15P3ya4oyyvQKEi2glbcWbfejQSc7YFyjPUWMs4u0fiT4sTibdbJVSWRi6
	JI7/bMYfGSi6NSrFAFaC7NrJQtFGzFqfbrKyOosnNSNafjbnXFE94RRvTbkEGeDNKX4Yglqsq4g
	lU0+/ra7W5b3yU0UL1v82vJfAWkq1wDoWoOg26L07eLb7u6rLtX5gpJKojMpE59bLfw7ny4P5Tq
	pK6cuLR0okw7xNbesJTOJy8xOXWok08W7SaFW9DvFRGscaDS+7KdBg90J5L4jkm7/HED9vDNXsm
	oPXSsR76lF1l1B6GARInIufhA2mA/c701Q0HLVXrnatN4H0N6D/8oKFLyNOJFuWyWJx3WaKI00A
	51AzOCRXcYM+9n6a03Dhtx9Yx7bFIDES9JyFiprlc3L5kHQ8+3aICz0gk=
X-Received: by 2002:a2e:ad85:0:b0:38c:da42:124f with SMTP id 38308e7fff4ca-393c6571f48mr5934871fa.8.1778079047164;
        Wed, 06 May 2026 07:50:47 -0700 (PDT)
Received: from LAPTOP-9UC0RPH4.localdomain ([144.124.192.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300984sm51071201fa.21.2026.05.06.07.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:50:46 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] staging: vme_user: drop dead NULL checks inside list_for_each_entry()
Date: Wed,  6 May 2026 19:48:26 +0500
Message-ID: <20260506144826.399-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

list_for_each_entry() walks list entries via container_of() on the
list head pointer; the iterator is never NULL during iteration. The
"if (!iter)" branches inside vme_slave_request(), vme_master_request(),
vme_dma_request() and vme_lm_request() are therefore unreachable.

smatch flags the inconsistency:

  drivers/staging/vme_user/vme.c:266 vme_slave_request() error: we
    previously assumed slave_image could be null (see line 267)
  drivers/staging/vme_user/vme.c:460 vme_master_request() error: we
    previously assumed master_image could be null (see line 461)
  drivers/staging/vme_user/vme.c:834 vme_dma_request() error: we
    previously assumed dma_ctrlr could be null (see line 835)
  drivers/staging/vme_user/vme.c:1439 vme_lm_request() error: we
    previously assumed lm could be null (see line 1440)

Drop the dead checks.

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/staging/vme_user/vme.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 7220aba7b..ca6c43fb3 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -264,12 +264,6 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 
 	/* Loop through slave resources */
 	list_for_each_entry(slave_image, &bridge->slave_resources, list) {
-		if (!slave_image) {
-			dev_err(bridge->parent,
-				"Registered NULL Slave resource\n");
-			continue;
-		}
-
 		/* Find an unlocked and compatible image */
 		mutex_lock(&slave_image->mtx);
 		if (((slave_image->address_attr & address) == address) &&
@@ -458,12 +452,6 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 
 	/* Loop through master resources */
 	list_for_each_entry(master_image, &bridge->master_resources, list) {
-		if (!master_image) {
-			dev_warn(bridge->parent,
-				 "Registered NULL master resource\n");
-			continue;
-		}
-
 		/* Find an unlocked and compatible image */
 		spin_lock(&master_image->lock);
 		if (((master_image->address_attr & address) == address) &&
@@ -832,12 +820,6 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 
 	/* Loop through DMA resources */
 	list_for_each_entry(dma_ctrlr, &bridge->dma_resources, list) {
-		if (!dma_ctrlr) {
-			dev_err(bridge->parent,
-				"Registered NULL DMA resource\n");
-			continue;
-		}
-
 		/* Find an unlocked and compatible controller */
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
@@ -1437,12 +1419,6 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 
 	/* Loop through LM resources */
 	list_for_each_entry(lm, &bridge->lm_resources, list) {
-		if (!lm) {
-			dev_err(bridge->parent,
-				"Registered NULL Location Monitor resource\n");
-			continue;
-		}
-
 		/* Find an unlocked controller */
 		mutex_lock(&lm->mtx);
 		if (lm->locked == 0) {
-- 
2.43.0

