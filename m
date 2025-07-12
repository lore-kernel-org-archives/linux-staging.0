Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60F28EA70;
	Sat, 12 Jul 2025 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347639; cv=none; b=Lwe01ZivxhLbl3GT/53p8kHCz5SL6pauCzDdpuAi+37kSsKH5N+UItmD8WVKzXk2miRxrK1RwaOt9z3OK4qMETzjsJAVwMA3BrwUsa2/3ps8Cmj/bWPsAlv9b4JcuUblQZuDFvuVxy2a/bwGTREbYZJhKWumB/SEg9uq8EnvQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347639; c=relaxed/simple;
	bh=eIGX6hfIjI3Ap8U+0nUV7eri5iFkpqTQ9XPJWOYk7E8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5GP5FHpxtnNUlihgi9CUNt40lF0Ex9bB1SRX1LTbdy3STkyKp9INUcyqtUWdtuRwmmG30gbmQ6tWz2d4b4A9Yo+wLE3oZYH7KncYcU11sD0Pt4e4ek48ScpMPo/y3s4ehRc/oy9rF49chkPesBTMDZo3jtn9vQgo1dXqTKo/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAX/a6rU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAX/a6rU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ddb35583so3294895e9.1;
        Sat, 12 Jul 2025 12:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347636; x=1752952436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU+STJheJ2cRenZESzxe2umi5oxN08RJOdFFWhNYDDU=;
        b=kAX/a6rUqkIQ+lmKjgpXpkl3RI25qpdiu/cXcVZUZTV4ElW8wzt30nEnJdyQZTqnrW
         SDSZPdBg40bkLRSowVspWjpBtG21EDVHvUcVFBCaEysAokl+rwZrJA6p6ZbEmUtXf5/e
         LlRxk2UlCGKTNv/PNWQVJHr130jJgtjSQnRjS7xJqBNWfOsRamxqgKK+82HLXG868lPo
         x775cgMauzN3Ah90kyEA9aBWjfHwKpWM8XM8B5p1VmE8dUec1g7uMxjJK3QQmt3yWdew
         WFaZmreKllhatadSg6FHmNEhuTMR+i3scLXMTsWMUXUkbvZyFQk+ZlnQVs5P4sYFc8QS
         SZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347636; x=1752952436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU+STJheJ2cRenZESzxe2umi5oxN08RJOdFFWhNYDDU=;
        b=pVjSheePdwkCVQexuWY1qPesIe44IquI3p8P8rCZZEnuvRClu+LKwohPv5SWJQ9tOO
         LG4dN7BtMpUkEbGAoQIVrYavnCqe3hBM/rKEtiFcqLOBB7KwU7O3HYUcTYi6rpCfVTsQ
         x1d4hDHmXsllAoKL9XGUPlyHYFj9F6U/JbMgCD68tua2onwoI0CMkWwp+gPMMQZ0PS9T
         Wd7azxC7kbtC8j7/h5gN/AmKGualckybXaVJhHRLlAi0Y+bT8x/PaTZEj+Fg4xEYIoZB
         XfQrWMIp0hyre5y/ezxuy419bnkgspUPwezs0EncJFNHEWezRJbypdIEqDL86LUvTPPr
         vW5g==
X-Forwarded-Encrypted: i=1; AJvYcCWpHXIRWNHzGkMGK2FAim1HbHco7dm3mfKvJRCujYGuYhC1FRca4ciLlce7WLUx9tnBt/TZq9xZrtpXE/HIvw==@lists.linux.dev, AJvYcCXG8ySBv6vWwLnA4d36yEbtleWMsWR8yyuGyy+/0boW26pBEwszjHZjIrAU3YmK6aFFfXk70TOcFkK0B09qxXelcoabEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YySLXP7LQDVq+jVYTlAeqmt9qPJkvBf6aTVU6NZp5qIz9M4K75L
	moSGWLvKojJTof4Z0Gabw45ChGjWEQQ8rTZGDnxiN4qhVfi2iJcdDWd0
X-Gm-Gg: ASbGncvu7PW8FXi1gJX0YGsn0BBuEc0cK1cDs0sctQro9+GQ2NjafJk6ORT2+KVzy75
	fWnCl6P5QEeFsxITjVWIJBD7j+ieRGpBYuys51i9XX5NCBzlR3p9hblxoRRwCYmlwoCequHUarE
	qHACxboDTTok3zUBpo1IBYjw3frcDMbYcirUkxSvOHA5CYf3vkoRr/bzQbtyvsuFul7NUapynFu
	DptW+KfGDJtFxd1FW+M7II6ySX2C8rUat+elC0+4pCLc+zunkoxCg4R5WYwr5lPSP++MmOjbK//
	mgGOBX1CJt8/GjfDbE4jnI65XMz6QvhkK4DhLLn5ZWWwc9Yc9IIm69Ehicdyr1J6SrQPK/dDUNh
	eRWV+y1l6mNhYUEkdv27k7uXHfHEKH/jz2VMEHKuNeNZTaUr38AS2jYhBBQ==
X-Google-Smtp-Source: AGHT+IECUvBi1C3fpaJkeu378YHO/wUV8hQgmJwaGFvLP5vaqOMKI5NAjpaj+pRBjjSsm8+4eTD1lg==
X-Received: by 2002:a05:6000:228a:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3b5f2d5f16amr2112016f8f.0.1752347635853;
        Sat, 12 Jul 2025 12:13:55 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:55 -0700 (PDT)
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
Subject: [PATCH 3/3] staging: media: atomisp: move hmm_get_mmu_base_addr()
Date: Sat, 12 Jul 2025 22:13:25 +0300
Message-Id: <20250712191325.132666-4-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
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

