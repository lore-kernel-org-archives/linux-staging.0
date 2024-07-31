Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE4A16CD03
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409519; cv=none; b=Ut53d+N8tRN6A6gX2WU+WscR5izVDhrMwld+FF4OzHyl715Q5om9KofRW/w9jlV5VV3qK/JS56zcJPAVScJAPh20skEWcTiI2f62TrLaIEuUT9BtniHq4hIkrXvmxy8ukCWiy5OxrQSv7TYh/k2Q19UMMMhHwolK4JGZDfYbQPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409519; c=relaxed/simple;
	bh=FonBXi+Q3MfNSZ+aBoUgss5VhQKs37vqijFK12+g2IY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=beWYpddB8um1jwV9VBikwscHcFbzQgSZQtMrJ21u8RQ8toYjG8ehq8irqq4pwoaWTeRHonXwumwfhmY3/asFw680gJA8M3/0WvZ61do6v5AX6Ld4NYCqoXSTSjmtLryfQ8AutSXErCv70SwX0plxVm1q+9iz8EdvKeZXBXuOo9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqYUBBxY; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqYUBBxY"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5d5b850d969so3331947eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 00:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722409517; x=1723014317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrCAXXCSMmjbL6R33sl32ct6gbQlsIym8nsT33zM3Rc=;
        b=TqYUBBxYB04WiRdtMDsUaEpDbciA2Vud5KqRG9y9VzYU9zuUvqyVdvUgH+xPKO6ijQ
         awHcRAUstq51avmU0GbT6+GMcBYWkvakDxHWtKt51RkP1PjrGvogFXeNvn4ebkeQx8T9
         fgFXnIYYEpDBuw5Ceu/rOKoZT6JLJALF9ZHNVOgcCqVgCwyuLAHND60VdUE6Ai5Omssg
         PaWZAiqa/O+Zh+nAAVMdb9d15uy/KI9t1lYUKQKi78rrr3A1GmrXeuIPrZccW9vCUzr7
         q3Y67eqYcGKPT6WxOoFw4giw0jlIWPjQDj2Vq+8HEfcezKu1sKJc6njlOncJLgzA5FQR
         9JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722409517; x=1723014317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrCAXXCSMmjbL6R33sl32ct6gbQlsIym8nsT33zM3Rc=;
        b=IIClziDi6J7ngvss3Scx4g5pwDp425URJ6ZqWsGx9+iJyXrJvY1Sh3b4MxnX3mr3xt
         OgaIPu2eWgK7rhc3ScwhdB36EIz06sCGIIGaHQr3apTnwVvOnWsGFkOFtYNN1JPTsz7Y
         /eLaLYDtQZOTaAhEda0pXGpKd8MVoUVFyVG+lndVoVLyAh7dEbnvXdeFs/o+UDcighet
         egmhySeZleJ+uj48dRttLLL7Drj2JL9SZm7FQzrbO9pn/jZgySpNENhkyMP8BByL35ud
         gwbIJzhNjk3TzJEdObWp1zpNgvrB6zECa8SwHBzmGQf5ltVtO/ikcgnozgeyl0alrlxQ
         16xg==
X-Forwarded-Encrypted: i=1; AJvYcCWZfRhRyPeR8rG7+SaD1R5oM71Kdn0BoTtIW12YHzFTbQcf+uuqFi28Z3zXDtuIFI9nPozCzNiNBYUpTcBPVY7C2PcfxfTDVT+xXp/OgA==
X-Gm-Message-State: AOJu0YwviFeo/8nW+v5AI06GyZC/7GrVUdGjaz5h9ztTc9higERJtuvk
	cQvLW74LY+gFOAT/+qmcKn6IbgZFVyMAt+LyEO4yWHsYk1hfeOaw
X-Google-Smtp-Source: AGHT+IGr572fiibvBQPX2H/P2UU6sDQCN8guL81ZBr4lGrTb8rxtV2x6+RVC46jqxQD7x55AYK4KPA==
X-Received: by 2002:a05:6870:2d4:b0:261:198f:13cd with SMTP id 586e51a60fabf-267d4ef04e5mr16428624fac.32.1722409516886;
        Wed, 31 Jul 2024 00:05:16 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.203.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead7120f6sm9447234b3a.50.2024.07.31.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:05:16 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: vme.h: alignment of closing parenthesis should match open parenthesis in function declaration
Date: Wed, 31 Jul 2024 12:35:07 +0530
Message-Id: <20240731070507.6290-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 26aa40f78a74..7753e736f9fd 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -129,8 +129,7 @@ struct vme_driver {
 };
 
 void *vme_alloc_consistent(struct vme_resource *, size_t, dma_addr_t *);
-void vme_free_consistent(struct vme_resource *, size_t,  void *,
-	dma_addr_t);
+void vme_free_consistent(struct vme_resource *, size_t,  void *, dma_addr_t);
 
 size_t vme_get_size(struct vme_resource *);
 int vme_check_window(struct vme_bridge *bridge, u32 aspace,
@@ -138,20 +137,20 @@ int vme_check_window(struct vme_bridge *bridge, u32 aspace,
 
 struct vme_resource *vme_slave_request(struct vme_dev *, u32, u32);
 int vme_slave_set(struct vme_resource *, int, unsigned long long,
-	unsigned long long, dma_addr_t, u32, u32);
+		  unsigned long long, dma_addr_t, u32, u32);
 int vme_slave_get(struct vme_resource *, int *, unsigned long long *,
-	unsigned long long *, dma_addr_t *, u32 *, u32 *);
+		  unsigned long long *, dma_addr_t *, u32 *, u32 *);
 void vme_slave_free(struct vme_resource *);
 
 struct vme_resource *vme_master_request(struct vme_dev *, u32, u32, u32);
 int vme_master_set(struct vme_resource *, int, unsigned long long,
-	unsigned long long, u32, u32, u32);
+		   unsigned long long, u32, u32, u32);
 int vme_master_get(struct vme_resource *, int *, unsigned long long *,
-	unsigned long long *, u32 *, u32 *, u32 *);
+		   unsigned long long *, u32 *, u32 *, u32 *);
 ssize_t vme_master_read(struct vme_resource *, void *, size_t, loff_t);
 ssize_t vme_master_write(struct vme_resource *, void *, size_t, loff_t);
 unsigned int vme_master_rmw(struct vme_resource *, unsigned int, unsigned int,
-	unsigned int, loff_t);
+			    unsigned int, loff_t);
 int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma);
 void vme_master_free(struct vme_resource *);
 
@@ -162,13 +161,13 @@ struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t);
 struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long, u32, u32, u32);
 void vme_dma_free_attribute(struct vme_dma_attr *);
 int vme_dma_list_add(struct vme_dma_list *, struct vme_dma_attr *,
-	struct vme_dma_attr *, size_t);
+		     struct vme_dma_attr *, size_t);
 int vme_dma_list_exec(struct vme_dma_list *);
 int vme_dma_list_free(struct vme_dma_list *);
 int vme_dma_free(struct vme_resource *);
 
 int vme_irq_request(struct vme_dev *, int, int,
-	void (*callback)(int, int, void *), void *);
+		    void (*callback)(int, int, void *), void *);
 void vme_irq_free(struct vme_dev *, int, int);
 int vme_irq_generate(struct vme_dev *, int, int);
 
-- 
2.39.2

