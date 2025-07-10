Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C852627E05F;
	Thu, 10 Jul 2025 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752109312; cv=none; b=ZX/kZSIoZi2YTOa3xEQXEWCgKYBi3zw+DqPxO+Lc8kZwJ7U4wqzqZV4CGUEqfgrm1Jt8l6VNK0XjYeccaUNdrGklc2s3PXob/RhKdZ2/MTv2SRhNn7g0/6C9aOErgnQGqAC9BvjBTL5nAbVpGcZkAljInBvaI77YUZVozh+pBxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752109312; c=relaxed/simple;
	bh=M1YsmDbGJwWY/B0rcU4jVlyPC8PdNio+2N9SDx19JPA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hbqcZovLUXgb1iiG5MD2vPhkekiS7Ul/qW5n6Z1vf8HPEf5zcZ6cheRL2QhcwpSzTWWR/qrphogvhztfR1gJy/vfjhEUoeu5nNU+onez0eHAU6UMmuAtXIUz/SIWuah1z0a6qXDHwEieLf+1hsikoIdzojQ7pDy4MnGHjqTLCj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9Z+Ugue; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9Z+Ugue"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso89608f8f.1;
        Wed, 09 Jul 2025 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752109309; x=1752714109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lqJZbsPmHAs+IvsrdhKTt1/Tbcc/A+mUT/M0FKTBrw=;
        b=i9Z+UgueGRTU61JHRR9/l6roy0vL65BiuYGIgImy21T+YnoQyxZO+tixRaOhGtQ3Fl
         +B7bnu33FpJNaom+L6KxKNZacjhWgxGeoT9FRiWhUpkv5yNwH3G1GKS44ayhn3xK5Du9
         sx8203YWvsDG9NbLUgqJmjf4rwguv6GSCrO0z+tLnJ2f/zqmOKy88s/SxAQ0Y1Zuvho2
         A16DRS1hU6Sc+q0nfkJhxO1M5nQTxGa9CAglavk0vLRDr+AEDEfChSTKlRh6YRELx6yB
         Y/NIAV0YrhR00VJ4s+IoiPuY+X9ELqTw6V/2NnTKLcKYo5fwycjUs3ycXdmM9haxwAFu
         wFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752109309; x=1752714109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lqJZbsPmHAs+IvsrdhKTt1/Tbcc/A+mUT/M0FKTBrw=;
        b=ndow9wk37RjfelnRq5JC5ohAaxDQYxVODjlSRv6Di05NV9fAYhX0jn37j7oOehUdhf
         oOsf6BOK/bTc5Yv/wWYhtas2sBJu/pDFU623kyITW1rBXkpoZwiTxkkMEkqaYghV8/by
         lWlw46L6i+4GJPG50GkcvkYiKl4kwCvyTXBnR1DOYBgXJHklbAaLOFlyoBRvnLWKqPXo
         FNhm+1BP8lZ/ODcTmTEmMNvYL+kdl9fN9012f93bRIt606psitAy23JPbaDKQq7UTp1D
         0l08FJVfmf+tmX8ctYwjY63t6BC9pSL+ss7SbOsLe9iFFaSlkuvWHp5KaHW8pTlttmDe
         b7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUe4653g+1Mp0w+2Hu2z7Dwe5XKGXvcAmS5tzKOTVhosOT9OFtyVkCBJ0afW+bi6ivglN1vS+w07jp/uYLr24soEMI9xw==@lists.linux.dev, AJvYcCVPwqxY+cgDyIPuYHXEn1lYL6DtYfZV4sduHF9+GfEE/Rz7nQ5me+rlRMh7tt/NiYRhKllu+9d6e6NXLjsUHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW5qGTVtXi5Qn3uyNLZHLRxqbKz5CMgkS95DNzExNWr4rQRkek
	kbZ8BiBv7KlFcp3QZkmw7P9wHSXXIz7kbGwxJWVoA0Ys+6mcD0jGzWBn
X-Gm-Gg: ASbGncve8ee6eYA/PrHNdAqC3frxVQkT16expI9szhffsJ394sQr8VU46eK9Am+UHDC
	tpiZCu1mD8tEfeglR9XFjoqhsj9G6B+u+lxIjvZF95IPFUjQhwG0RxPHyDuRlD6hDWhB0Dh70ev
	rED5reIq95xhQEAEss3oKz2Ohoi3EaqJjgkYHnujUVoZITEhvTyQsUThDFFt1mx1tHJYWjbuUyj
	dNNQJ7i2kpRTaofhfj8Wm/G+y5NhNlXB3uS0Gd1rgHOdMH6eufqVbX7RNe0aMS6yBsnPMoksVAm
	fombBVuVBA0ocL2V9V7B22TSYCmcTkOe9XhHNnlBIDETtCtw28e6bXmERFAakSKXuvhw/OEj7NE
	OFyj37h2vg4F4mP4KqgXX+5g=
X-Google-Smtp-Source: AGHT+IF5UvDpLNDVjM54tSi8Gr5TA9ysTCFcSut/nKUTewLVf1mVhmlBgKi4jczA+xhIl606XbYwGw==
X-Received: by 2002:a05:600c:45c8:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-454d5301ea8mr16803995e9.1.1752109308466;
        Wed, 09 Jul 2025 18:01:48 -0700 (PDT)
Received: from localhost.localdomain ([154.182.167.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd43915dsm3587375e9.7.2025.07.09.18.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 18:01:48 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: move hmm_get_mmu_base_addr()
Date: Thu, 10 Jul 2025 04:01:30 +0300
Message-Id: <20250710010130.113441-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hmm_get_mmu_base_addr() is related to the functionality
of hmm so its better to be declared and defined in this scope.

- Move hmm_get_mmu_base_addr() to hmm.c.
- Change hmm_bo_device struct to be static.

Note:
This patch builds on [1], [2] that were not accepted yet.


Link: https://lore.kernel.org/all/20250708164408.79863-1-abdelrahmanfekry375@gmail.com/ [1]
Link: https://lore.kernel.org/all/20250708164408.79863-2-abdelrahmanfekry375@gmail.com/ [2]
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h    |  4 +---
 .../media/atomisp/pci/atomisp_compat_css20.c       | 12 ------------
 drivers/staging/media/atomisp/pci/hmm/hmm.c        | 14 +++++++++++++-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f54de..da85d835ec10 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -33,7 +33,7 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
 int hmm_flush(ia_css_ptr virt, unsigned int bytes);
-
+int hmm_get_mmu_base_addr(struct device *dev, unsigned int *mmu_base_addr);
 /*
  * get kernel memory physical address from ISP virtual address.
  */
@@ -65,6 +65,4 @@ void hmm_flush_vmap(ia_css_ptr virt);
  */
 int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt);
 
-extern struct hmm_bo_device bo_device;
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..b4913cb32a64 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -157,18 +157,6 @@ void atomisp_load_uint32(hrt_address addr, uint32_t *data)
 	*data = atomisp_css2_hw_load_32(addr);
 }
 
-static int hmm_get_mmu_base_addr(struct device *dev, unsigned int *mmu_base_addr)
-{
-	if (!sh_mmu_mrfld.get_pd_base) {
-		dev_err(dev, "get mmu base address failed.\n");
-		return -EINVAL;
-	}
-
-	*mmu_base_addr = sh_mmu_mrfld.get_pd_base(&bo_device.mmu,
-			 bo_device.mmu.base_address);
-	return 0;
-}
-
 static void __dump_pipe_config(struct atomisp_sub_device *asd,
 			       struct atomisp_stream_env *stream_env,
 			       unsigned int pipe_id)
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 8d64e5fd812c..321166e58bb5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -24,7 +24,7 @@
 #include "mmu/isp_mmu.h"
 #include "mmu/sh_mmu_mrfld.h"
 
-struct hmm_bo_device bo_device;
+static struct hmm_bo_device bo_device;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
 
 int hmm_init(void)
@@ -488,3 +488,15 @@ void hmm_vunmap(ia_css_ptr virt)
 
 	hmm_bo_vunmap(bo);
 }
+
+int hmm_get_mmu_base_addr(struct device *dev, unsigned int *mmu_base_addr)
+{
+	if (!sh_mmu_mrfld.get_pd_base) {
+		dev_err(dev, "get mmu base address failed.\n");
+		return -EINVAL;
+	}
+
+	*mmu_base_addr = sh_mmu_mrfld.get_pd_base(&bo_device.mmu,
+			 bo_device.mmu.base_address);
+	return 0;
+}
-- 
2.25.1

