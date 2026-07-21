Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECA39B97E
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670182; cv=none; b=mrYHoJtXloQKgkOzClPew7mf7/+GwgWpsiE/y7ezx/XWx3Mjhg730vQCcnch0TkJOVzOT3V5ZXN2w1qacTFhrNrIuAcNozzxMtzCqFqoxuAKXs97dWDaumA7QNOSSMsiM3JkgePL5wSOMQfue/WsCNlLBFarhuuDr/RYiC05tLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670182; c=relaxed/simple;
	bh=sGfBMQplWVPrUg05+eJzpMGHz3qz++af50GFuNqgMLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4arCuZmG5XpD9XoD1CY2XX2gkiWQEiJ30owqs6Ma2Um9+NAO1DPjGQ09Sb1T0No5H+HJ1HbMYxbMFKvxHqAGaOoO00lzWYvlbOufJG7Of3cA7xza1+wmMR5qaiEeJI8et5dETWxbrWbNFjHFy9kCgCUEy1/J2fH0SgwSbQAOFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCWSAu72; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCWSAu72"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so11366359e87.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670179; x=1785274979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KcmQLusWughGWb5DI4/2JeDa9Y+YQfkOsDn0H100Ow=;
        b=KCWSAu72D9fj5fhal/WJzewD2T7Ew04qgqkTkhFgrULmPb9y/2aAEeQv97SO3inSgd
         t967e1fTlTifzr/SJlDceTI/w1UGfhFfHPcp+qPwNapQvid1JAF/BbV5HlSykGKi9hn0
         0CXq0fv2cUYDxALRAB6hpeR8vnO/iWAVZ6Mtg3Ye6L6JDbyOujRC8jdVskGUhTETpt5+
         TIQP2tswWcGU/Y/XGebRo8hbF+OJ3INAZBqOmoXehdAPXzGdV65ECg/JJWMxKbX4b1/v
         Q1RGd9P76L19cD9EtltTJ+RhFsuUPIW9tOGzoBqy/ASQOm2YPSbdILw0g9GnWnMEDXI4
         pK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670179; x=1785274979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KcmQLusWughGWb5DI4/2JeDa9Y+YQfkOsDn0H100Ow=;
        b=VXlTqXdoo/BFSduT8CRzKvty6YeInTrv206XHhnfNZ28ogd948ihCa5fwW2w/QIjju
         8KyjaCUz133NLq2K5yD9+BK/eX0Ltj5EJqUaj+z8I4rONLOlzzmQUaPLvPJYWzEsJ3k4
         nUT8b5oWPR4oPZWxDMUU7k/cpG4oPTMbupnFLppEkrQyghKLZ7t1es/Bpvdrt6/K5vbR
         5InxJIx+rAJ169vsoW76+0thvmwGf5ID7GB2qWRnwJoH8xz2hl+eMUyOxhSsc5UaWh7E
         pI1orVi6ctEaLLmxD3sKKA4MJfCXXbNDnIgqaiOIXR67wZOoj+UefPsbqUEPQR/4yNBO
         myhg==
X-Forwarded-Encrypted: i=1; AHgh+RrI1+Nj4zEVSfUt9E7N0w8CfA82DaQN1zoMmvfBksAlUPM5p6dorIf1r3JH9+/31aAZQ0FXK9CUG8zBbd4y@lists.linux.dev
X-Gm-Message-State: AOJu0Yz30Uwi2oDqbqhvQpB7Dub2GXSrmwbb635czES2ZpNCv4Q1c1BA
	DJuuntUMuGlCSvJjphCR7GtjcVWfDhIhVgsDNsqRSFKHf2HM40GbZCVu
X-Gm-Gg: AR+sD11ACy6wsphHa0HzO1OuYLe/g7GvfCsCX+VOs3Did81A+6rgnPaiAQbloh3SwGM
	Hlo33J7EEqfe8u5tft3sdZacfw4upJs19IVNym1d3sBXZwQDq7s9qXwh07TH6DII7ku3mrFJOgI
	ePNM6nzzo/h/+4v1r3ziwr11CvMl6URRsEV6n8h/wOuPZtAl020MMbavdTpUe8d9WXqK77bF9SU
	GPwuGqkcJvi0+6mVyoqt7qq5N5euL2eRVyf2cUkkap4HYDQ2WjCww0BVkF5rFk/iS0mS9CnGs3E
	kfxT2LlkglfbFa0NyNuqPoojZCMf5Q5LX5Z0PSitnNoD7RAzDoC227WFnX6eLsDCRwgb21lrv21
	qRjL7d4rNKkuEywwAQAntYdMcLat3Fl03zkVaeiXmq7/7k72ugjIaAD1HVNHw/QoNH7bPjH73zK
	g=
X-Received: by 2002:a05:6512:3f03:b0:5b0:e15:772e with SMTP id 2adb3069b0e04-5b28f9bd387mr4501982e87.51.1784670179307;
        Tue, 21 Jul 2026 14:42:59 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bada25sm131509e87.30.2026.07.21.14.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:42:59 -0700 (PDT)
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
Subject: [PATCH 1/2] staging: media: atomisp: remove unused functions from hmm.c
Date: Wed, 22 Jul 2026 00:42:32 +0300
Message-ID: <20260721214238.840406-2-nikolayof23@gmail.com>
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

These functions are declared and defined but are not called anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   | 16 --------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 41 -------------------
 2 files changed, 57 deletions(-)

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
-- 
2.55.0

