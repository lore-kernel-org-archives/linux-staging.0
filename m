Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08DE3BA243
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912999; cv=none; b=ukPdbXlG6gkOLtrthQOxTPVsF5MWtv/9YO9dhCED9zCEjkOWOSU6wFYYPg73SsWV0dIRx0oOXRRj+fPMnDsXKCZMR5+KyGMgTA29lmgrU7Ghjoy5j1vdfj+JoMUcUvx4MFrVubtb7gU5cNR/ukKcYgMpy5EcWpU7bw9fZ4AuUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912999; c=relaxed/simple;
	bh=ALCZuyCbQDE4PR0CBGgDwNFq5F9+cHZWAcLlCPhCigs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXErpmNuuJ8EIUu2UmM5JFJfMEjjvgRsxh1pHl9+mW9qaV/VVUViPvZFtSBNtr5/HyBGXBOdy7DAH6889jdPD5hg+or3XX8cXikVuL4ZFFIJhtxW/Dct/yLrdQa7bf2I2AYJpxpHsIzHOeN1sVTstZ54KGZitblrZR4DmGNdJYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLPs9uVP; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLPs9uVP"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so341622a91.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773912996; x=1774517796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afv3PFH4437gcExyVUtKDrjEDhRt4MOcfGEC4ZdfMa4=;
        b=lLPs9uVPz8FKYMrSuZLwTa0raX4zGePRQuitT71cHQ9xUeJZoa7N4DmTyOGKypQMpA
         CWf6nExW9i5uX+mHuI5BArK+a4MgVgfik4yKibNrranzKXk5ujK7SKRN5bUF5bqEX0aZ
         8xz4DnfENL97UyFinph5gxGx16fwvxcvUPdoKA+bH57bLot9YApTrjneWbpgs0FbqLlg
         Ic+pFVfepM7ybgnf+Ky9cw/8PE6pvmzFjZeHlU2Ndz3eRzGdLCQ/w+EQCCFp6t8sgZ1r
         gVsZ8gOY7v6F+yxfDDeJsAsgVqFoVdXkK63eBAQSZ/Umn1reEsYqQNfCBWLPSLpUzruQ
         C1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912996; x=1774517796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afv3PFH4437gcExyVUtKDrjEDhRt4MOcfGEC4ZdfMa4=;
        b=VR/aMmWG4HYDquOIiwSHwze506t2nNsIo904R8Cc36a9re4Z5aagsHJwjpZPMsfb2P
         5cTR/255VGqS+lcJp3udwjzgUh/+BopqZTY2hQeRIiyeXSEkpWQeS8n3WkaRryNm2PpT
         DcqBtJUFLwNQYZdkadKArFsnrQJiY095wBk+DIQ9B8fgS5UKtzCm2SLrBHDF/7duq1jr
         BphgtPasU4vSXvpbKLAlmUywPkDO2gjIhmwf3Amw6Wmt4NMWeH0Jzxu2bOJyz+tzJ/Cv
         +dssnLw2Y4X0ZvDPcBV2a+lGKy8J+tX6GXRa3aBdCucOowqFHTx3pM5PHTbawKxhg9X0
         FtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsSiM8lziXj/nKpwUFdop/b6pLr1RwuoWz8eXJWc2yrZseImyDcZZC97rMD0IfxCCZRkmqt9oTia0u26jD@lists.linux.dev
X-Gm-Message-State: AOJu0YwsWTjd5Dod/VKsyC3R0yz6kchTWi6b2S9j1bZIYxlS3sF3KwbI
	gdxjk3fD2tQt/JWdHVT6I3rK/mMt7T0KrKQ/yJV4sKEoEBBcTo1qkNkP
X-Gm-Gg: ATEYQzxV2PruoU/iDl7lgmv37Q/pCFJ4PaQ5AWegorYyZwQIW16JchARXmNedQ9cfBn
	iWRAdzcTJtPIlR8I25hBTpOViF2CA3w8tr34IJ2C32i/tqophW2k1VOfNQkwNQxskcgm42XCP/J
	J/VG7713A9jXgNigcwWbN6L6usTwRCd+h1JTvb0jL4PH+f2zdyYroTHpSOorQyC5cNA3Uebp8kl
	o3D7O7opZgBdD2wD1GHdloa+q284oQ+zDDYsrtPzDUtl/SiR167x2xB3XuUBgLCUBd948AtPmvh
	jwtgkOZWMLearzea2fhNYwLAAOl93r40x/NzkfQNvmHaG+hfPs/IDWq5ETGlHZ7gwkIdcA1ZiQx
	yvaLa/kfgYVWfSK0NoB3q6y3eaMF25Aib2Kwmn64hLQTx/EGevSTZnmRWJxxwc/gArDpu5eNRkO
	zjv0WoY048YZjRkj5uAtojoynZY1jOOlveNOzXbOB/sWSHDNRDgW9k3RlCvkOHwCi2DAPjDKgqS
	+ooh1TXpuzpoXxyvLtNj5mLh7xbNi2lkXngjbiBobeYqWIKUL8=
X-Received: by 2002:a17:90b:4ccb:b0:356:1db4:8fe5 with SMTP id 98e67ed59e1d1-35bb9f477f0mr5945568a91.29.1773912996005;
        Thu, 19 Mar 2026 02:36:36 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6026a5asm2663607a91.8.2026.03.19.02.36.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 02:36:35 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH] staging: media: atomisp: hmm: remove unnecessary casts
Date: Thu, 19 Mar 2026 17:36:25 +0800
Message-ID: <20260319093625.3225-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary casts when accessing vma->vm_private_data.

No functional change.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 856561e951a5..68116edda591 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -975,9 +975,7 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
 
 static void hmm_bo_vm_open(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
-
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 	check_bo_null_return_void(bo);
 
 	hmm_bo_ref(bo);
@@ -993,8 +991,7 @@ static void hmm_bo_vm_open(struct vm_area_struct *vma)
 
 static void hmm_bo_vm_close(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 
 	check_bo_null_return_void(bo);
 
-- 
2.39.5

