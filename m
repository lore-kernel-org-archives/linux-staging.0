Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBE155300
	for <linux-staging@lists.linux.dev>; Wed, 23 Oct 2024 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729713879; cv=none; b=rbBzdKa+BcAlZwGgCU0YCgYUNDUYGCK2EpjveKCvqfJ0HImhFnZaZfsAsXuwRELyQF6yIB+qYAm8fffho93ru5EnzTel77Cw38f2YyxG0ney8NZzZFYZa9uCKfSbCog+nm2DSA9FwA8K9XfYBOQm/Dw3xcN+78FRHlDbpxWi1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729713879; c=relaxed/simple;
	bh=NLHyTVAsvLkSf7fYgyHVBaxhH5A+j6JytRQL/AwsTLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MqTSdclZmsa4c2cgW2KM/BsgugpQOqFLEqT2C7DDzr8oj2zzUBNLeR6kpe/Nof6CDKMBnXqWbMsWbMYtZQ4W90NJ58eEH9f08eSTxK3Kjy3sOo/Qb77l/dMRBmj66jPmWUnc4bbaWQbtA1v2l3QVI+YwADNyxuowM0eQQ8WJ+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RN4Zfti/; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN4Zfti/"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso198316276.0
        for <linux-staging@lists.linux.dev>; Wed, 23 Oct 2024 13:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729713877; x=1730318677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvmeCs4ivALx0RDr+VD+yfIRPn0WVf+CXAfO2vANeFE=;
        b=RN4Zfti/DYJmvJPbPs3n6axGhaS+M7lsT0mo4CTHTctCIk6OHg2uUUivqMkD1+wvQF
         IEB/9+6awFgncaLikuqZBWP19mtrsYS0gAlT/2R918++yLFiMblUm/3xui99ZopjFvyj
         VIdKShaPKzmEeOjiuPQaCg4YxNlreaJkIh69suzRKPC0rJSNEHnxcBttgI+3BDEGGP+U
         YAJ0OqG1AOzNcRAJjprJest++s2LnHa5ZvdTurqrDHfoMIqeuS6WC8bq1pGnZ/osRSkn
         fzk/zoDH2MQD8xApEtIyeZx8ZK5wQU/u4klPhpalxl0n/I0cueCEw7dN8Q4fJ2sqGXXi
         Bmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729713877; x=1730318677;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvmeCs4ivALx0RDr+VD+yfIRPn0WVf+CXAfO2vANeFE=;
        b=HlZCIhVDCkfodc3zJsEXZhaQVvW2tzDxiLt+HIL5k8U4Vm6sxT7oilaLx4STcCb6Qb
         ZNAbTVfvh2ZUXEMdGUw0Y9gHkmBriOY0JdROxwQazhkKOOLnxezNcCazaayEGnjf5L+I
         IOPF2wleNYxc56QVVaYK8wmbiAdqENTd9zfWHLO00VN12H8FL7kf21ELwmtRmyYce8JC
         RCMjFEl0VxVmmdjvXJsMXgwLsOPMM9OnZ9gdzAtxQkSmi9s9XFPCzPZY8mz53sE9RwCs
         2leyY6OB0h+Uk0q2kv3JzBcsym9Kg7xIJeA/S0Ir8vbVADoWhizk7aU3UxVbkIV4oEVZ
         huVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn6Acpu9iEgkzy/VM0TZ0QV2svo9SGXvXrhL/EZy53I3fL2X1yflKxEKEbPACfYcqz88GrNQTxo1v5gSdy@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp4jOaanhZvgE936HaGwhHOmRdAabB/54hyfYA6QwVIErR+io9
	+H6sKyo+vfkDuILvLuAq0VSfUTbOQ2wZnk6dIYIu2lo6jaQsFY4+
X-Google-Smtp-Source: AGHT+IHRxDDgxhtbsnEFOgZDcL0Ns56DwsgxxQjM5QfYSzCmJp16RF0qvQT/5oHFpgwHrBldLkFGkg==
X-Received: by 2002:a05:690c:6281:b0:6dd:c6e1:7570 with SMTP id 00721157ae682-6e7f0fa6d89mr46310287b3.34.1729713877135;
        Wed, 23 Oct 2024 13:04:37 -0700 (PDT)
Received: from hob ([2600:1700:5af3:4510::48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5adab49sm16930917b3.73.2024.10.23.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 13:04:37 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:04:39 -0500
From: Pedro Perez <pedropz1537@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: vme_bridge.h: Name function pointer
 arguments
Message-ID: <20241023150439.4a0dbc05@hob>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This patch names the function pointer arguments in vme_bridge
consistently with the implementations.

Signed-off-by: Pedro Perez <pedropz1537@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 56 ++++++++++++++++-----------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 9bdc41bb6602..abf880d68b12 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -128,39 +128,49 @@ struct vme_bridge {
 	struct mutex irq_mtx;
 
 	/* Slave Functions */
-	int (*slave_get)(struct vme_slave_resource *, int *, unsigned long long *,
-			 unsigned long long *, dma_addr_t *, u32 *, u32 *);
-	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long,
-			 unsigned long long, dma_addr_t, u32, u32);
+	int (*slave_get)(struct vme_slave_resource *image, int *enabled,
+			 unsigned long long *vme_base, unsigned long long *size,
+			 dma_addr_t *buf_base, u32 *aspace, u32 *cycle);
+	int (*slave_set)(struct vme_slave_resource *image, int enabled,
+			 unsigned long long vme_base, unsigned long long size,
+			 dma_addr_t buf_base, u32 aspace, u32 cycle);
 
 	/* Master Functions */
-	int (*master_get)(struct vme_master_resource *, int *, unsigned long long *,
-			  unsigned long long *, u32 *, u32 *, u32 *);
-	int (*master_set)(struct vme_master_resource *, int, unsigned long long,
-			  unsigned long long,  u32, u32, u32);
-	ssize_t (*master_read)(struct vme_master_resource *, void *, size_t, loff_t);
-	ssize_t (*master_write)(struct vme_master_resource *, void *, size_t, loff_t);
-	unsigned int (*master_rmw)(struct vme_master_resource *, unsigned int,
-				   unsigned int, unsigned int, loff_t);
+	int (*master_get)(struct vme_master_resource *image, int *enabled,
+			  unsigned long long *vme_base, unsigned long long *size,
+			  u32 *aspace, u32 *cycle, u32 *dwidth);
+	int (*master_set)(struct vme_master_resource *image, int enabled,
+			  unsigned long long vme_base, unsigned long long size,
+			  u32 aspace, u32 cycle, u32 dwidth);
+	ssize_t (*master_read)(struct vme_master_resource *image, void *buf,
+			       size_t count, loff_t offset);
+	ssize_t (*master_write)(struct vme_master_resource *image, void *buf,
+				size_t count, loff_t offset);
+	unsigned int (*master_rmw)(struct vme_master_resource *image,
+				   unsigned int mask, unsigned int compare,
+				   unsigned int swap, loff_t offset);
 
 	/* DMA Functions */
-	int (*dma_list_add)(struct vme_dma_list *, struct vme_dma_attr *,
-			    struct vme_dma_attr *, size_t);
-	int (*dma_list_exec)(struct vme_dma_list *);
-	int (*dma_list_empty)(struct vme_dma_list *);
+	int (*dma_list_add)(struct vme_dma_list *list, struct vme_dma_attr *src,
+			    struct vme_dma_attr *dest, size_t count);
+	int (*dma_list_exec)(struct vme_dma_list *list);
+	int (*dma_list_empty)(struct vme_dma_list *list);
 
 	/* Interrupt Functions */
-	void (*irq_set)(struct vme_bridge *, int, int, int);
-	int (*irq_generate)(struct vme_bridge *, int, int);
+	void (*irq_set)(struct vme_bridge *bridge, int level, int state, int sync);
+	int (*irq_generate)(struct vme_bridge *bridge, int level, int statid);
 
 	/* Location monitor functions */
-	int (*lm_set)(struct vme_lm_resource *, unsigned long long, u32, u32);
-	int (*lm_get)(struct vme_lm_resource *, unsigned long long *, u32 *, u32 *);
-	int (*lm_attach)(struct vme_lm_resource *, int, void (*callback)(void *), void *);
-	int (*lm_detach)(struct vme_lm_resource *, int);
+	int (*lm_set)(struct vme_lm_resource *lm, unsigned long long lm_base,
+		      u32 aspace, u32 cycle);
+	int (*lm_get)(struct vme_lm_resource *lm, unsigned long long *lm_base,
+		      u32 *aspace, u32 *cycle);
+	int (*lm_attach)(struct vme_lm_resource *lm, int monitor,
+			 void (*callback)(void *), void *data);
+	int (*lm_detach)(struct vme_lm_resource *lm, int monitor);
 
 	/* CR/CSR space functions */
-	int (*slot_get)(struct vme_bridge *);
+	int (*slot_get)(struct vme_bridge *bridge);
 
 	/* Bridge parent interface */
 	void *(*alloc_consistent)(struct device *dev, size_t size, dma_addr_t *dma);
-- 
2.46.1

