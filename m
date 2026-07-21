Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577D43B3F8
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670185; cv=none; b=gD4e2O2WQoQgmjlzkvTKCIIG8LxqkmCj2toui+iRgYyxjVhVlAdU7z4KCFHcGdmheBCM6Y/dZFVcM2WQHzT0FByOewKHgYJSWB7/i78GQeIm5IdDb/Tz4hgFhrf3jD+YO3K/jKDHDlFP79vdtsPb83ncvc2JmkUgUQhbWLyiNRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670185; c=relaxed/simple;
	bh=DefLr6N+E9PvdVZ8GGKHB1D7oDumfhx69XLAlNfBtz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYOAvGwF9j2jIiLVFLJWabvH92m4XmFGkDOEISnn0qGA3EAMQakYx4AEcl8O64/tIazgVIwXGeVNVm79nmnhCcWBM12RSxGXQ/H0OE5IlBAt72NIm5gNiTM4Ryi9J+yhP/4b2tuyL/V9nZ4rZObko2rL2HT4AzKL/CgaSARKcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeiAq1wC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeiAq1wC"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so14428994e87.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670182; x=1785274982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok5uMFFrIqvWj5X3glWDZ3EQJA6Z86TLs/gXGnbTACs=;
        b=TeiAq1wCQBKLxrCrCb18gcP1eCCL0gEhc7XefndH18j7bqvexNmM6ruTVvLkEwXGYW
         3cCTgO9P5Ix5IlS6wBeKYUEDudP7ctBiyPhZwQj+Uhnt4+jDhSPPVGagdOdQc3M5Ls3u
         M12UMAZkBjA8Go7zJvlou8q2fyq5STEPQgGy+5YgDQtYozkG4dr29PiTsWs+ET3BfDbF
         89Ew21ZLP/1kqQ4mvYP9Nj+rvhk3ZDDve1PEbBcVr2Mc1u197j7kjJ5XKse9dxZuRdue
         KUb/ihe3fLkRCgwXGmTi3dPIwhk0HYv+Ryybva1pJ/+69FqshmbnOBac8DGqn7Wy3FgT
         PDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670182; x=1785274982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ok5uMFFrIqvWj5X3glWDZ3EQJA6Z86TLs/gXGnbTACs=;
        b=j76CXX0+dA5DJe6iLwvN87FtvuceJ+gDuYBfsPIo37dQgs/Pmy0rv0bi/oyUiHbx4l
         Je01Lw8SOv1sfEzs0ZV9rur5vqUotdbIwvGVdk5bGpcpJ7FEaAgvgKLTz92KhWisvXEq
         m4x45og5DrNMs5wX7+YVZem0aKSonYWJwQRxbkuldXnyYk5UiZRuLwqPQMidg/cV6tL+
         b6AZZNnvdMGJzozsvn3HWuJEe3OQbGSxC5aiyTKg1LM2ji371qBUA01BA1OqobmmHPWv
         EwH+ci2KgFblL5vn6qjkFGx4tfpwd8QeUPYEt0UHC11jgY8F+ChF6P+4WiETKH3A+VtY
         TlGA==
X-Forwarded-Encrypted: i=1; AHgh+RrzEhlGRzMYcyFyhWWb2B92xN+UwvT5O+lixsXtqkRgKVvXInF9HjwgmP20qHY3TZh7IzRnQPyQ7sxZQd1y@lists.linux.dev
X-Gm-Message-State: AOJu0YwD/oahwTbHZ1mhgmYo1y4altfMLj86wenqh6VmbQ/gATjq/Vpw
	bTCW1/cuChRlcmmlFGGwEna/8KVOm8p029wBez5SMCxwMfxRLMU+qOda
X-Gm-Gg: AR+sD10SlN8djf60Z9BM9+K2C0F4D1fr/qhXGSttRok/CgvfEtQ6ux1h2RqGyH6azKR
	eNNo3qMPe6aFDTbYr12t1oF6wT/EM5+72aaW8PXB5mt3Nz3MQrON0Zva83Nv7l9mTleOkKKzGCv
	rV/78rxUbxPldvb+dCXeUmdaALHuCPDSnj/g4WqB6PdhCb+M+bSFWwzCPG2Y/QIqwFwAyI8LO+f
	3Ho6OqBR39GgvB54m8M24MlgKxLNfq4f+QVRO8yDqc6ZeqFumIQhMH0hWq3Gut/9oTGrKd4yD1Q
	HEmUc0ruGoufvp3J8OuKJfvsx5Q0qFQlqEK6nvFzdNL/rjTbsyeSBhZiqxoF9+JPE9kZfMP5sZr
	n0OxTibDGV5bLO4m/3OVWp0malz2erQAaVhNKKb3hv2thMClLFAN+wm6aDlIi2chGJWMiCWBKbg
	c=
X-Received: by 2002:a05:6512:61d3:20b0:5ae:b135:64de with SMTP id 2adb3069b0e04-5b28f9ac22amr3357626e87.31.1784670182135;
        Tue, 21 Jul 2026 14:43:02 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bada25sm131509e87.30.2026.07.21.14.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:43:01 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/2] staging: media: atomisp: remove unused functions from hmm_bo.c
Date: Wed, 22 Jul 2026 00:42:33 +0300
Message-ID: <20260721214238.840406-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721214238.840406-1-nikolayof23@gmail.com>
References: <20260721214238.840406-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove several functions that are defined but never called.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        | 19 ----
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 97 -------------------
 2 files changed, 116 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e09ac29ac43d..ba3c582a0f89 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -205,7 +205,6 @@ int hmm_bo_page_allocated(struct hmm_buffer_object *bo);
  */
 int hmm_bo_bind(struct hmm_buffer_object *bo);
 void hmm_bo_unbind(struct hmm_buffer_object *bo);
-int hmm_bo_binded(struct hmm_buffer_object *bo);
 
 /*
  * vmap buffer object's pages to contiguous kernel virtual address.
@@ -224,17 +223,6 @@ void hmm_bo_flush_vmap(struct hmm_buffer_object *bo);
  */
 void hmm_bo_vunmap(struct hmm_buffer_object *bo);
 
-/*
- * mmap the bo's physical pages to specific vma.
- *
- * vma's address space size must be the same as bo's size,
- * otherwise it will return -EINVAL.
- *
- * vma->vm_flags will be set to (VM_RESERVED | VM_IO).
- */
-int hmm_bo_mmap(struct vm_area_struct *vma,
-		struct hmm_buffer_object *bo);
-
 /*
  * find the buffer object by its virtual address vaddr.
  * return NULL if no such buffer object found.
@@ -251,11 +239,4 @@ struct hmm_buffer_object *hmm_bo_device_search_start(
 struct hmm_buffer_object *hmm_bo_device_search_in_range(
     struct hmm_bo_device *bdev, ia_css_ptr vaddr);
 
-/*
- * find the buffer object with kernel virtual address vaddr.
- * return NULL if no such buffer object found.
- */
-struct hmm_buffer_object *hmm_bo_device_search_vmap_start(
-    struct hmm_bo_device *bdev, const void *vaddr);
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401a1ca1..837077f1d229 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -578,31 +578,6 @@ struct hmm_buffer_object *hmm_bo_device_search_in_range(
 	return bo;
 }
 
-struct hmm_buffer_object *hmm_bo_device_search_vmap_start(
-    struct hmm_bo_device *bdev, const void *vaddr)
-{
-	struct list_head *pos;
-	struct hmm_buffer_object *bo;
-	unsigned long flags;
-
-	check_bodev_null_return(bdev, NULL);
-
-	spin_lock_irqsave(&bdev->list_lock, flags);
-	list_for_each(pos, &bdev->entire_bo_list) {
-		bo = list_to_hmm_bo(pos);
-		/* pass bo which has no vm_node allocated */
-		if ((bo->status & HMM_BO_MASK) == HMM_BO_FREE)
-			continue;
-		if (bo->vmap_addr == vaddr)
-			goto found;
-	}
-	spin_unlock_irqrestore(&bdev->list_lock, flags);
-	return NULL;
-found:
-	spin_unlock_irqrestore(&bdev->list_lock, flags);
-	return bo;
-}
-
 static void free_pages_bulk_array(unsigned long nr_pages, struct page **page_array)
 {
 	unsigned long i;
@@ -885,21 +860,6 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 		"buffer vm or page not allocated or not binded yet.\n");
 }
 
-int hmm_bo_binded(struct hmm_buffer_object *bo)
-{
-	int ret;
-
-	check_bo_null_return(bo, 0);
-
-	mutex_lock(&bo->mutex);
-
-	ret = bo->status & HMM_BO_BINDED;
-
-	mutex_unlock(&bo->mutex);
-
-	return ret;
-}
-
 void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 {
 	check_bo_null_return(bo, NULL);
@@ -1023,60 +983,3 @@ static const struct vm_operations_struct hmm_bo_vm_ops = {
 	.open = hmm_bo_vm_open,
 	.close = hmm_bo_vm_close,
 };
-
-/*
- * mmap the bo to user space.
- */
-int hmm_bo_mmap(struct vm_area_struct *vma, struct hmm_buffer_object *bo)
-{
-	unsigned int start, end;
-	unsigned int virt;
-	unsigned int pgnr, i;
-	unsigned int pfn;
-
-	check_bo_null_return(bo, -EINVAL);
-
-	check_bo_status_yes_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
-
-	pgnr = bo->pgnr;
-	start = vma->vm_start;
-	end = vma->vm_end;
-
-	/*
-	 * check vma's virtual address space size and buffer object's size.
-	 * must be the same.
-	 */
-	if ((start + pgnr_to_size(pgnr)) != end) {
-		dev_warn(atomisp_dev,
-			 "vma's address space size not equal to buffer object's size");
-		return -EINVAL;
-	}
-
-	virt = vma->vm_start;
-	for (i = 0; i < pgnr; i++) {
-		pfn = page_to_pfn(bo->pages[i]);
-		if (remap_pfn_range(vma, virt, pfn, PAGE_SIZE, PAGE_SHARED)) {
-			dev_warn(atomisp_dev,
-				 "remap_pfn_range failed: virt = 0x%x, pfn = 0x%x, mapped_pgnr = %d\n",
-				 virt, pfn, 1);
-			return -EINVAL;
-		}
-		virt += PAGE_SIZE;
-	}
-
-	vma->vm_private_data = bo;
-
-	vma->vm_ops = &hmm_bo_vm_ops;
-	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
-
-	/*
-	 * call hmm_bo_vm_open explicitly.
-	 */
-	hmm_bo_vm_open(vma);
-
-	return 0;
-
-status_err:
-	dev_err(atomisp_dev, "buffer page not allocated yet.\n");
-	return -EINVAL;
-}
-- 
2.55.0

