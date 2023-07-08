Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F7A7E2
	for <linux-staging@lists.linux.dev>; Sat,  8 Jul 2023 03:55:18 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-635f293884cso16210856d6.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Jul 2023 20:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688788517; x=1691380517;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TCnZ9Yp/QzfZmo6gCMRZiYF2goV1i5forJ0EUEXVqU=;
        b=g7RF9azNYneFpUruGq9YDr0wn5usxd4szawIy9Lg6/SYNBWeoinWHFZ7BO2JI6Enki
         tB6yKCYwNTy0IGmNI/HtlbL30Knr+Gbga60YLmWoKo/RPE0Q6hFxaXRani3ZLO60zPAx
         17I1NwMDq9xcPcXdmBzAfgYqxh5Z4b5ju2A7fEphRNM6bQFAWovjAZFsUfQs5mTTk4QV
         67GhjP+MatcTi/XK8gF8LpAIKY9y23sYYte2atISKLbpO1ScjJKQWweAXlllZe47NkwA
         u8n9CfzP3tGs10u0P8kydE/QgRzfjAsX7UU1BnvVKjCB+JIA2NqWB8JCTLxMsddeo0QP
         /hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688788517; x=1691380517;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TCnZ9Yp/QzfZmo6gCMRZiYF2goV1i5forJ0EUEXVqU=;
        b=Rurw55d39AJ0IWFq8RIwNH3SF+wPhkR7EKk3t3TMx10FjFcv6MJ8SBodSJ/hkEgPNt
         xBX1ZmetSoqD0i+eBaWs2HYU4i7X8z1olZQ4WWP8A4oRaOKPS615bb6H8qzkzYkTNbJL
         A0/i0k1X96Uw7PMz8rc78JXs535x2xei2O9IffPeNyMd/ahZ2txC6VJpo7fw0UdxQ9o9
         M+NCeozQNRbNq/G+ApfPkjqBacpeIbjUGHjhADdmo3UaSLryHG+tckbVSbPEM1cvjWZq
         CckOYJVgFpFXUMs2SjvR11k7oGvyTA+DTB5SvH8rmcWLfqmm6s/3OKy8PDWSnAKVmjXh
         qlCA==
X-Gm-Message-State: ABy/qLbSCBDHwXfAJdynKML8hfIBFA7lXsYwTnbLtiiRsqoZXqYdmCBc
	m0Wq4FgywdxGdCbI3y8L1B4=
X-Google-Smtp-Source: APBJJlEOGagFHHurWncBynYTK88uwhhhzivFeH5m1wh3fYG6q0kQtHjFzx3PJlCrHJDF0AqThpprcQ==
X-Received: by 2002:a0c:e44f:0:b0:635:3892:a2b0 with SMTP id d15-20020a0ce44f000000b006353892a2b0mr6101298qvm.15.1688788517523;
        Fri, 07 Jul 2023 20:55:17 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id p8-20020a0c8c88000000b006300ff90e71sm2850435qvb.122.2023.07.07.20.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 20:55:16 -0700 (PDT)
Date: Sat, 8 Jul 2023 00:55:11 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: alexondunkan@gmail.com
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Alignment should match open parenthesis

#132: FILE: drivers/staging/vme_user/vme_bridge.h:132
#135: FILE: drivers/staging/vme_user/vme_bridge.h:135
#139: FILE: drivers/staging/vme_user/vme_bridge.h:139
#142: FILE: drivers/staging/vme_user/vme_bridge.h:142
#144: FILE: drivers/staging/vme_user/vme_bridge.h:144
#146: FILE: drivers/staging/vme_user/vme_bridge.h:146
#148: FILE: drivers/staging/vme_user/vme_bridge.h:148
#152: FILE: drivers/staging/vme_user/vme_bridge.h:152
#163: FILE: drivers/staging/vme_user/vme_bridge.h:163
#173: FILE: drivers/staging/vme_user/vme_bridge.h:173
#175: FILE: drivers/staging/vme_user/vme_bridge.h:175

    Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 11df0a5e7f7b..a0d7a8db239d 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -128,28 +128,21 @@ struct vme_bridge {
 	struct mutex irq_mtx;

 	/* Slave Functions */
-	int (*slave_get)(struct vme_slave_resource *, int *,
-		unsigned long long *, unsigned long long *, dma_addr_t *,
-		u32 *, u32 *);
-	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long,
-		unsigned long long, dma_addr_t, u32, u32);
+	int (*slave_get)(struct vme_slave_resource *, int *, unsigned long long *,
+			 unsigned long long *, dma_addr_t *, u32 *, u32 *);
+	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long, unsigned long long, dma_addr_t, u32, u32);

 	/* Master Functions */
-	int (*master_get)(struct vme_master_resource *, int *,
-		unsigned long long *, unsigned long long *, u32 *, u32 *,
-		u32 *);
-	int (*master_set)(struct vme_master_resource *, int,
-		unsigned long long, unsigned long long,  u32, u32, u32);
-	ssize_t (*master_read)(struct vme_master_resource *, void *, size_t,
-		loff_t);
-	ssize_t (*master_write)(struct vme_master_resource *, void *, size_t,
-		loff_t);
-	unsigned int (*master_rmw)(struct vme_master_resource *, unsigned int,
-		unsigned int, unsigned int, loff_t);
+	int (*master_get)(struct vme_master_resource *, int *, unsigned long long *,
+			  unsigned long long *, u32 *, u32 *, u32 *);
+	int (*master_set)(struct vme_master_resource *, int, unsigned long long,
+			  unsigned long long,  u32, u32, u32);
+	ssize_t (*master_read)(struct vme_master_resource *, void *, size_t, loff_t);
+	ssize_t (*master_write)(struct vme_master_resource *, void *, size_t, loff_t);
+	unsigned int (*master_rmw)(struct vme_master_resource *, unsigned int, unsigned int, unsigned int, loff_t);

 	/* DMA Functions */
-	int (*dma_list_add)(struct vme_dma_list *, struct vme_dma_attr *,
-		struct vme_dma_attr *, size_t);
+	int (*dma_list_add)(struct vme_dma_list *, struct vme_dma_attr *, struct vme_dma_attr *, size_t);
 	int (*dma_list_exec)(struct vme_dma_list *);
 	int (*dma_list_empty)(struct vme_dma_list *);

@@ -159,24 +152,19 @@ struct vme_bridge {

 	/* Location monitor functions */
 	int (*lm_set)(struct vme_lm_resource *, unsigned long long, u32, u32);
-	int (*lm_get)(struct vme_lm_resource *, unsigned long long *, u32 *,
-		u32 *);
-	int (*lm_attach)(struct vme_lm_resource *, int,
-			 void (*callback)(void *), void *);
+	int (*lm_get)(struct vme_lm_resource *, unsigned long long *, u32 *, u32 *);
+	int (*lm_attach)(struct vme_lm_resource *, int, void (*callback)(void *), void *);
 	int (*lm_detach)(struct vme_lm_resource *, int);

 	/* CR/CSR space functions */
 	int (*slot_get)(struct vme_bridge *);

 	/* Bridge parent interface */
-	void *(*alloc_consistent)(struct device *dev, size_t size,
-		dma_addr_t *dma);
-	void (*free_consistent)(struct device *dev, size_t size,
-		void *vaddr, dma_addr_t dma);
+	void *(*alloc_consistent)(struct device *dev, size_t size, dma_addr_t *dma);
+	void (*free_consistent)(struct device *dev, size_t size, void *vaddr, dma_addr_t dma);
 };

-void vme_bus_error_handler(struct vme_bridge *bridge,
-			   unsigned long long address, int am);
+void vme_bus_error_handler(struct vme_bridge *bridge, unsigned long long address, int am);
 void vme_irq_handler(struct vme_bridge *, int, int);

 struct vme_bridge *vme_init_bridge(struct vme_bridge *);
