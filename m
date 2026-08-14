Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA0C4749EE
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720289; cv=none; b=RcmErdbRTMbk/7CtNR5J3iA9ztrTNuNLdop6N6Gk3lBPviiGCKIag1IZ3DpuFhB8Y3YgaHfPr3ht2YU5ewW3IMhUZU8By5dBrIC6TGZEDXv/Aw3oJr0raRuTAORBlqZfz76na5tm4TALJU5FWnmgKEvTtDDpswwfhqMXL8mEkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720289; c=relaxed/simple;
	bh=0BrBkcX9UcEVHPKeK7NYdXxTwBJE9wFp4qVEes7QwFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBbZfXXXoSakh7/ahC+/8b7/YexpfjQKKlkpWXXFkbo/OobTEi66Dpt7xqnI3bzmEf+kC4d3P2ebMZ6AYnq1Ve3PM168aueuvg4kr0QUw1tF3CahK4e8rJAE/yQjBKCqZKkK7H48BpMB/z6HAJ6rL8rPVvy1XueVEzepAzh2kCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3uoxWLQ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3uoxWLQ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso6403281fa.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720285; x=1787325085; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRvtXqxadNf2/AlBnV7jwVTo92rSYf1Qe1Qdjea6EK4=;
        b=A3uoxWLQUmy/74IHwZIeuZtxJJmP172BTQ6LYBgTwBeu8L2VpmgUZGFx+EhuzNFxRN
         3we+f6MS2AWYpMTIuuDaNi7Lz4iYxEMhRlRqXQD3QoyymACnHLgsdvddXuh9Au+sBZ04
         FPk1EqA06PUY4GhdrqQrcQVG7vMrSCxbezZ0U+jBfOnColBaA9Qy/fRb2r5Q4bT5vDSD
         bt9qtFZz+/v8zHWVNNLwhOfbutgrhmYycItfJZUQHJ4pBig+M3ZgRo5YYbWtGNKAp43h
         9LGYTqO754bkaCAjgqb16WIuU/jJy2A+OX3WpzO8SxWHeUCGAHHzblm1bN8SLYzbhcih
         t8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720285; x=1787325085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRvtXqxadNf2/AlBnV7jwVTo92rSYf1Qe1Qdjea6EK4=;
        b=hOqsoVedW3df0kOdiT8CWt6gj3DEYui9nbBZAzFSp5WX4Pohnjx52vGJ6V9lcmj0UR
         H5NmkShpsNaWcEyOBNBlB7xfrytp9iO9FzGh/QqvkofJxxwGk/G5a9rD0lHDO0lxuEnM
         ECFpwOSmd1HQzQwYFBGKBkkiQ1RvU48EtHkrrjADINCvkIiIqxLo193gUjTUk83bVa3O
         ko2P4xipuJcOOGR+TB9H+Vt9uSVgBZK2IYClxt65P3Isb6UvOuN/x5iRzyjxFLhrOnFo
         vUn36u/juAJA0HIt0LmwT4HNn8L8jYAXrtvnLU9uZ/7VZa/4UDQVI6Svy9d3wgbR40rs
         5vpg==
X-Forwarded-Encrypted: i=1; AHgh+RqeVtzTmSq4//3/LhwWOMwEKM3wVW7Mm1cPDPTQ8mX8xMnww2ecukulN4oWfdCR9PLnKZ7S8Fv7d4jLGO9X@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/ZCWr8V6bbYlTfsIW1t892/cLt3TAj9I2WlM/icBwgY1JsIs2
	DcJzliZFWYlDL+fLCGNUripM40dv5PG9I/uS1Qk5kibhsBFfMjC3OSvc
X-Gm-Gg: AR+sD100m66dGvqf5fwX45DpuCvDrrLryUCF+nwl6rsJfbAEQ+J5hc/r/wcqaRdd0wr
	+yCORcul0W3+bcnpep4uEojYwii8F8ztt1zQOIRkTcJam8BIIFAJp1I+IWlViUD1AXgjmYEFiyS
	UxA0oROklsvD7X8kGBSnk1BuZsFjyOLYn0XOHgqHIkEqh1LaTnjzguxRxy5Ztt9QBrbNF+BKm0H
	HKrSuzE3d6fKCLiDCQRzsJK2NNhRODZj8QtVpP9cj70jnfGYheIhC3qZdIPu24m6sKrPnYBivwt
	080OhRtXnOidix8PQmKds7MYi+/WPvmZaQkLG8GNdHcaBDWLUkKKnjpXj4tE0TrmXm9TKcZvDft
	YIjdF2JfSKgnttAYDd1a3L+2SJ6JTPJiEeSS9JYhJIMcm08gc0EozIpPCM8C26XRwmaRbXvvPqx
	P6CosEqZ82FrYrkfDOuUOqfaWm8SNXBnv0PXzmohBXN5hT3K8L+ZAC5I9UB2UF0t8VP0Gv0w==
X-Received: by 2002:a2e:be9b:0:b0:39c:650c:4540 with SMTP id 38308e7fff4ca-3a132498229mr7305901fa.15.1786720284542;
        Fri, 14 Aug 2026 08:11:24 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:24 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:08 +0300
Subject: [PATCH v4 1/5] staging: media: atomisp: remove unused functions
 from pci/hmm/
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-1-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=8865;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=0BrBkcX9UcEVHPKeK7NYdXxTwBJE9wFp4qVEes7QwFQ=;
 b=17ov1ejH9Y4fmeXP3BlwdLqNSouwa2H9tDhTC1BBA95xdO1q9x28gFeTjPyboMALzh/ZhO6UL
 KTKPOMuChCSBH14x5SiQ9dtCl7PsP1+wvBSgtfUFKqiKmbTOGkSuNdW
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These functions are declared and defined but are not called anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h    |  16 ---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |  19 ---
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  41 ------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 139 ---------------------
 4 files changed, 215 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f54de..6bda02b9ff85 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,12 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
-
-/*
- * get kernel memory physical address from ISP virtual address.
- */
-phys_addr_t hmm_virt_to_phys(ia_css_ptr virt);
 
 /*
  * map ISP memory starts with virt to kernel virtual address
@@ -55,16 +49,6 @@ void hmm_vunmap(ia_css_ptr virt);
  */
 void hmm_flush_vmap(ia_css_ptr virt);
 
-/*
- * map ISP memory starts with virt to specific vma.
- *
- * used for mmap operation.
- *
- * virt must be the start address of ISP memory (return by hmm_alloc),
- * do not pass any other address.
- */
-int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt);
-
 extern struct hmm_bo_device bo_device;
 
 #endif
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
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..8130be4a30e3 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -262,12 +262,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 	return load_and_flush(virt, data, bytes);
 }
 
-/* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
@@ -411,41 +405,6 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
 	return 0;
 }
 
-/* Virtual address to physical address convert */
-phys_addr_t hmm_virt_to_phys(ia_css_ptr virt)
-{
-	unsigned int idx, offset;
-	struct hmm_buffer_object *bo;
-
-	bo = hmm_bo_device_search_in_range(&bo_device, virt);
-	if (!bo) {
-		dev_err(atomisp_dev,
-			"can not find buffer object contains address 0x%x\n",
-			virt);
-		return -1;
-	}
-
-	idx = (virt - bo->start) >> PAGE_SHIFT;
-	offset = (virt - bo->start) - (idx << PAGE_SHIFT);
-
-	return page_to_phys(bo->pages[idx]) + offset;
-}
-
-int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt)
-{
-	struct hmm_buffer_object *bo;
-
-	bo = hmm_bo_device_search_start(&bo_device, virt);
-	if (!bo) {
-		dev_err(atomisp_dev,
-			"can not find buffer object start with address 0x%x\n",
-			virt);
-		return -EINVAL;
-	}
-
-	return hmm_bo_mmap(vma, bo);
-}
-
 /* Map ISP virtual address into IA virtual address */
 void *hmm_vmap(ia_css_ptr virt, bool cached)
 {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401a1ca1..fd40e64e660e 100644
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
@@ -981,102 +941,3 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
 
 	kref_put(&bo->kref, kref_hmm_bo_release);
 }
-
-static void hmm_bo_vm_open(struct vm_area_struct *vma)
-{
-	struct hmm_buffer_object *bo = vma->vm_private_data;
-
-	check_bo_null_return_void(bo);
-
-	hmm_bo_ref(bo);
-
-	mutex_lock(&bo->mutex);
-
-	bo->status |= HMM_BO_MMAPED;
-
-	bo->mmap_count++;
-
-	mutex_unlock(&bo->mutex);
-}
-
-static void hmm_bo_vm_close(struct vm_area_struct *vma)
-{
-	struct hmm_buffer_object *bo = vma->vm_private_data;
-
-	check_bo_null_return_void(bo);
-
-	hmm_bo_unref(bo);
-
-	mutex_lock(&bo->mutex);
-
-	bo->mmap_count--;
-
-	if (!bo->mmap_count) {
-		bo->status &= (~HMM_BO_MMAPED);
-		vma->vm_private_data = NULL;
-	}
-
-	mutex_unlock(&bo->mutex);
-}
-
-static const struct vm_operations_struct hmm_bo_vm_ops = {
-	.open = hmm_bo_vm_open,
-	.close = hmm_bo_vm_close,
-};
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

