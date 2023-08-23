Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4ED10E9
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 01:56:30 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-64a5bc52b0aso29272006d6.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 18:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692755789; x=1693360589;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPwz2guvxWTesYeLbnBS+USxZkPGmHJTAv/y5EAHQAk=;
        b=b5gS2nUC9aWd0EeUq+33K1BU99UQqM8ro/2+mYrVyE8dZyrCBEwjLVg+dp2OljOE6j
         4lKYWDQAjfF1pdFFz0xeahWCZd7r6b9enub479JBwJXQvwxT9p8nWg001yJ+1A3j1Sce
         4wbapIAI0BbC9gnJke0t+na4N7tGA2mxku9vuwFNOqxRc89YMYjRB+MaHEnxnDbZrWnt
         N2IPv6K0FPK5MIymqeUA/k5wIiEVrvvJwTQn9OQ/QtQHcbX2FmnOUXRJkLlxHGsV3imh
         4otLb1OyRTpP/LxfrhnIu6PNDr7Tcb+vqG8VMstkN9l59BMtLyYrfp6+hB67pM/l8//R
         HBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692755789; x=1693360589;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPwz2guvxWTesYeLbnBS+USxZkPGmHJTAv/y5EAHQAk=;
        b=DfGAC9i1kSG3Bd9OtBkr2aj8G6YwdtYfAoEqZLzjL1hPr+ZwlqfcRDS3Y5I+qz+TRS
         4WLgKADM8ZA7gxoTNJZ5AfnB3dFbKDx9M4MsL989CKmSWsxUA6CHQU1zDbA0GqVuQ7PF
         ejnT82AsF4wfAUcjGWAslblHlXHRxMjYVYt6DHEAnXIc4m10dJW0thsID463myqNlzut
         SpJ76V/NS+HXEJU+Nws2w8i9N/H25wq1ysnyV7m2tK/Jlt1j4uN7Lv7WFJhSMRF/WOMd
         mSQz61PuNjcoTnimQ2G+XJSS6kGezEvjWMStRLcc6VJ25ixGfqtaYNti0EnmNiWRZrby
         DV7g==
X-Gm-Message-State: AOJu0YyZS8Hm+UNepCJGfRMAItj2yFeR8Q0ycW2+9yu3Tw6xJ13YivcR
	ljQdh0tvqQLv8D9CRx1xLws=
X-Google-Smtp-Source: AGHT+IH75JtFZGYpnxBHGghNjPBBSqygdG8Cgt9jf5ZT1uJY6FfVjZA+xHfFgG04YyNGB9zW9DVcgg==
X-Received: by 2002:a0c:f484:0:b0:64f:4e7a:bc3a with SMTP id i4-20020a0cf484000000b0064f4e7abc3amr4030453qvm.26.1692755789584;
        Tue, 22 Aug 2023 18:56:29 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id d22-20020a05620a141600b00767f00a9c67sm3580020qkj.95.2023.08.22.18.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 18:56:29 -0700 (PDT)
Date: Tue, 22 Aug 2023 22:56:25 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check alignment to match open
 parenthesis
Message-ID: <ZOVnSXle3bYYQD27@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Alignment should match open parenthesis
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index faa9816046a9..5e2744d0de08 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -130,7 +130,7 @@ struct vme_driver {
 
 void *vme_alloc_consistent(struct vme_resource *, size_t, dma_addr_t *);
 void vme_free_consistent(struct vme_resource *, size_t,  void *,
-	dma_addr_t);
+			 dma_addr_t);
 
 size_t vme_get_size(struct vme_resource *);
 int vme_check_window(u32 aspace, unsigned long long vme_base,
@@ -138,20 +138,20 @@ int vme_check_window(u32 aspace, unsigned long long vme_base,
 
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
 
@@ -162,13 +162,13 @@ struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t);
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
2.41.0

