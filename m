Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE33914FF
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 03:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776434; cv=none; b=dMtjhM1Q+81i5YnIv/nYtyOcNIkibrTtfsLXYXRqX1Fc1FcuXzu65LKT0SoKf+oc1k2h3sHJXB0EgixnPDpIX6qhhXhDP0bs/qtTpmjjALralS3AUe8+WI+PNzEB2q2ihdmWiVTlyLU2uYKjSCH9KGUfmPJP9CdJeAPLIldWe64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776434; c=relaxed/simple;
	bh=YzZg1+gUIs5Df6KMIHtH6J4c2+lVLSU0eCXJOmn+lAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cqCC/Sfbb6iGosWCcjCi9h3LjSeDFupill9DAY7Hslkg7N/cYGIkpWRzU/EI1nr6pPwOGZruvi04AYf0+xPLdd+dwBi+e14fne+DmB1mIRVYz1bu36VoUqXL5TJEoi7JPI1vFq+EShlGJMhNoMKectaY9tvEdDbfAbqDnzBRThE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFmlDC07; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFmlDC07"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-919abb3335fso20558756d6.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Oct 2026 20:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791776431; x=1792381231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTa4f6Jpo9bbyJgbZsVx5DPWhH7RO4U0C8aC28e9B8o=;
        b=EFmlDC07MO5+SvDnVsl/LRl+oSSmdDmOXNaTUyKKZXj4CRG4w9ugYOfnvVhBGX/Y1N
         ryKiI/FRjeSD0nuCPuojYwkPXHw5rI2dnaWO71EtHHNElEtsLJip6Ugbq+jR9yRuIgCu
         4DS76OhPjUzBb5v9hOMHdYNr/cjdeQds7QhUiS566M641ZtyEVIYfDIz68jJS9T1ddNx
         8sU0oO38atzEqfANi6xyiGiN6FlWIJL5Y2LSZsgUEtJu66B5vz8PUOHBVi2snOUFOr4L
         bjgyddp4j6eeRSzgdNUOYNf2wcL+hcPQUY29D6IF+WZnMQNbTz81O5b1bvthNUnSnS0F
         V53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791776431; x=1792381231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTa4f6Jpo9bbyJgbZsVx5DPWhH7RO4U0C8aC28e9B8o=;
        b=ufgc+3434PHOE8QDpIrX/E1aIfxfjtt+U7Rt1uhO3sjhWH7aOQXORk0EjtRz8pM8B3
         Tj8awwTr8k8Qh8FzvD4+D3P1bSKR7vEY+LFf01VGRcZSbn+IDe+p00VI7ymqRGLTGK2K
         Hah0edoQSR9Z9l1brvcIqqyF4azJaa6enkcf7+1Y30QP3z738VdRyQmQMbKtDL1Q2eBi
         FZxXoSHrENPfcsnE+rUKsaqj7JQR25ETI/Do7HY/1Tc4drHZsg7FBH8f51S7Ed8ssfUL
         J+3nXIIdQYqRAuyfiUMqx5c9fsYFY9WamNa4Y/EUBq6hrwy8vdPFy/hDh7W4FJ41NMch
         Zk5g==
X-Forwarded-Encrypted: i=1; AKwUvBxbRq6GvnboIrw+yIE3wb6kqSS2OdlLLBgFqyoOrzd+OcdmylPqgaeFRA0zesrfB62SX6NBrxjPH4HOdQLL@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9Eq+9jVi+g4DcnqtI8S1WPlYBTYsTG3W/tuvKOz+hHnm84mue
	tGmUfjkZlgTJo7MrMUJmNIpDBuReBykcw5QsO5XJwaChrH+x/1d4UvLz
X-Gm-Gg: AYBFou3wfiohGabeVhyAk4XEQLjzDCWqZw3T+GBUknqAUVYx2wBEs1ET8z7m6sWKa1C
	4Hi882KTce/OkJ08adxFPD4Qny5Pwc78+rs7xHi9qnzC1NGTIbYcbZBj3qngCdqakstW9kzjrHb
	MoSqCDA9EwBj6gUTp5ReF7B8R79jZLBbRNIdqv0dEwEXyvWuiubGrJ5Obw2Bt+AaYv2V2/maVEy
	SfyYo99bxZ/Wox/obw+kTbVv6TsUKVCSu5RBfTJZL2dnSJfya0CXdwIcn9pwWJwroX6dHWN18oF
	eLLw3q+DBO+RLD2DN7C4xtMsi9c7EFQYqmCWvGiRyd6GA5zLnLzEhfB/49JCPN6jEHu2OeVJ5z8
	LowIVCcjgp77dDPOYMCtW6peMXpcEt6oEVoDz75txf5d8A6DwhI8RRAQshPVJuffiIRBo/t2oU0
	stD0ar4t7TtFo6U4Kjks/hQZIXC/hI/uhvZ1qdLn42ublpQ8PcMeRjHiVYKkaYmEM1UvctyyBGM
	Kf3UwBbjCMGTqPJlvwV+91ZyfOd/6UabYwl2FL65KMQb9wt9bAZqKkFQyTBgK5Ja64tVhCQ7uo0
	iLmA2zPtICxExPXbSSB+nUR+sn9b0F0okJOLpkAeratomHRLgslviI1LNGJ1bard3jfAu8oqRdh
	jcm3vdKZ4MYzptY/tct1UHvpZZ1Ip5alfsQAAv5UeUCAikU30
X-Received: by 2002:a05:620a:271a:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93ebd2598c1mr1409753185a.43.1791776430907;
        Sun, 11 Oct 2026 20:40:30 -0700 (PDT)
Received: from localhost.localdomain (wnpgmb0311w-ds01-161-139-200.dynamic.bellmts.net. [142.161.139.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb984845csm763316085a.14.2026.10.11.20.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:40:30 -0700 (PDT)
From: Riccardo Oliva <oliva.scorza@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	oliva.scorza@gmail.com
Subject: [PATCH] staging: vme_user: avoid iterator variable access outside list loop
Date: Sun, 11 Oct 2026 22:40:20 -0500
Message-ID: <20261012034020.100737-1-oliva.scorza@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In vme_slave_request(), vme_master_request(), vme_dma_request(), and
vme_lm_request(), the list iterators (slave_image, master_image,
dma_ctrlr, and lm) are accessed in the err_alloc error paths after
exiting the list_for_each_entry() loops.

While the iterator variable retains its pointer value upon hitting a
break, accessing list iterators outside the loop body violates modern
kernel coding standards.

Fix this by referencing the dedicated allocated resource pointers
(allocated_image, allocated_ctrlr, allocated_lm) in the error cleanup
blocks instead.

Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
---
Hi! This is my first patch to the kernel. I am learning the submission 
workflow. Any feedback is very much appreciated. Thanks!

 drivers/staging/vme_user/vme.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5c66b66c..d38c792eb 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -298,9 +298,9 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 
 err_alloc:
 	/* Unlock image */
-	mutex_lock(&slave_image->mtx);
-	slave_image->locked = 0;
-	mutex_unlock(&slave_image->mtx);
+	mutex_lock(&allocated_image->mtx);
+	allocated_image->locked = 0;
+	mutex_unlock(&allocated_image->mtx);
 err_image:
 err_bus:
 	return NULL;
@@ -495,9 +495,9 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 
 err_alloc:
 	/* Unlock image */
-	spin_lock(&master_image->lock);
-	master_image->locked = 0;
-	spin_unlock(&master_image->lock);
+	spin_lock(&allocated_image->lock);
+	allocated_image->locked = 0;
+	spin_unlock(&allocated_image->lock);
 err_image:
 err_bus:
 	return NULL;
@@ -865,9 +865,9 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 
 err_alloc:
 	/* Unlock image */
-	mutex_lock(&dma_ctrlr->mtx);
-	dma_ctrlr->locked = 0;
-	mutex_unlock(&dma_ctrlr->mtx);
+	mutex_lock(&allocated_ctrlr->mtx);
+	allocated_ctrlr->locked = 0;
+	mutex_unlock(&allocated_ctrlr->mtx);
 err_ctrlr:
 err_bus:
 	return NULL;
@@ -1469,9 +1469,9 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 
 err_alloc:
 	/* Unlock image */
-	mutex_lock(&lm->mtx);
-	lm->locked = 0;
-	mutex_unlock(&lm->mtx);
+	mutex_lock(&allocated_lm->mtx);
+	allocated_lm->locked = 0;
+	mutex_unlock(&allocated_lm->mtx);
 err_lm:
 err_bus:
 	return NULL;
-- 
2.43.0

