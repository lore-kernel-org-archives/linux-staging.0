Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89116BA3B
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 14:50:43 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a3c78ede4bso1599323b6e.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691160642; x=1691765442;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apFnjtanFsvDoH1r3hzAONCxf1mKf/JHgQxxZH0tN3c=;
        b=ZRQtjbNEfchbovSeLOfZ4APCu47TlxciFiXER8UDuDo58CMb2QFNqStAhMzgND8eXC
         gux7m8TlxVtMsEn18AAKgnnzGj1EiPWkr41D6NK19ukdVHXqiWEdyW7ofV6DHKMiO3r+
         0mN+cyxXFUg0zdLO08nkLl/Lsqz+a27jks82DSPNZ6cQRqC6VZcGk4XGR3extHIA+xVV
         8fxy6F1DUFZHucBiYyn+nHrXkIoEHll+QU2vrtDnof2MCtU0fDosEKOH8YNJQ+PrGrIE
         I7pgbzA2TI/SNOw7NX74gxMZsK0rF6R/FqFNws7N1slSA0WvSQT0Q+rYtmA1sE5X1w8H
         AuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691160642; x=1691765442;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apFnjtanFsvDoH1r3hzAONCxf1mKf/JHgQxxZH0tN3c=;
        b=RYJuO4VECqfh0ueIW+oG9IZJP6NBGH3Ks9sAwq8KXcvAFLLN++5o6xfUETUV3ZHl9S
         Eal+nYVod3oa/LPNNsopgGHiijvTGvYMauEtkpRdvcu8Io0ive7m2xD5a9h8HqRIZryk
         S+n4ENfJwP5IndBKGYJFmdf/ZxJobxCIDhaRtwCAqG/Y+iADgBWx/Sr1KEDVmkUvUD0i
         TV8yfKV3w2VG/UZ0Z2cbVtagyLjVJbjyUS1IY0Dq10igHlRytm3xFE/hE/8ZRGihiY3f
         0IWjSlGbiIoxYjkGfv/twj9h6nJSfHXB3t9lKJVXJj/Y9qcK+f7UpxbF2cr5ibp75/ff
         m8aw==
X-Gm-Message-State: AOJu0YxMsu6WeQl4dp7UoDOjvqitpxR0qrOogVHitRvnof7hugMO2ym2
	Zr6RgzVLE4xDyJAPzJda25c=
X-Google-Smtp-Source: AGHT+IHHOUbCbcKVI1mhgS5kFzRsuYA3AK2/EKpBbPJW2g5Jl5ILQ7i93ZmVw87Q9BM7AeTNn8Ki+Q==
X-Received: by 2002:a05:6808:3086:b0:3a7:62ff:24c1 with SMTP id bl6-20020a056808308600b003a762ff24c1mr2336363oib.46.1691160642369;
        Fri, 04 Aug 2023 07:50:42 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id bq7-20020a05680823c700b003a3bf96e055sm1061513oib.8.2023.08.04.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:50:42 -0700 (PDT)
Date: Fri, 4 Aug 2023 11:50:37 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v4] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <ZM0QPaWv4lp93rGF@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed warnings and checks as reported by checkpatch to adhere to the
Linux kernel coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---

Changes in v4:
- Fixed changelog again

Changes in v3:
- Fixed changelog

Changes in v2:
- Fixed CHECK: line length exceeds 100 columns, noted by
Greg KH and Dan Carpenter
- Fixed CHECK: Alignment should match open parenthesis
- Fixed CHECK: Lines should not end with a '('

 drivers/staging/vme_user/vme_bridge.h | 46 +++++++++++----------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 11df0a5e7f7b..9bdc41bb6602 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -128,28 +128,24 @@ struct vme_bridge {
 	struct mutex irq_mtx;
 
 	/* Slave Functions */
-	int (*slave_get)(struct vme_slave_resource *, int *,
-		unsigned long long *, unsigned long long *, dma_addr_t *,
-		u32 *, u32 *);
+	int (*slave_get)(struct vme_slave_resource *, int *, unsigned long long *,
+			 unsigned long long *, dma_addr_t *, u32 *, u32 *);
 	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long,
-		unsigned long long, dma_addr_t, u32, u32);
+			 unsigned long long, dma_addr_t, u32, u32);
 
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
+	int (*master_get)(struct vme_master_resource *, int *, unsigned long long *,
+			  unsigned long long *, u32 *, u32 *, u32 *);
+	int (*master_set)(struct vme_master_resource *, int, unsigned long long,
+			  unsigned long long,  u32, u32, u32);
+	ssize_t (*master_read)(struct vme_master_resource *, void *, size_t, loff_t);
+	ssize_t (*master_write)(struct vme_master_resource *, void *, size_t, loff_t);
 	unsigned int (*master_rmw)(struct vme_master_resource *, unsigned int,
-		unsigned int, unsigned int, loff_t);
+				   unsigned int, unsigned int, loff_t);
 
 	/* DMA Functions */
 	int (*dma_list_add)(struct vme_dma_list *, struct vme_dma_attr *,
-		struct vme_dma_attr *, size_t);
+			    struct vme_dma_attr *, size_t);
 	int (*dma_list_exec)(struct vme_dma_list *);
 	int (*dma_list_empty)(struct vme_dma_list *);
 
@@ -159,32 +155,26 @@ struct vme_bridge {
 
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
 int vme_register_bridge(struct vme_bridge *);
 void vme_unregister_bridge(struct vme_bridge *);
-struct vme_error_handler *vme_register_error_handler(
-	struct vme_bridge *bridge, u32 aspace,
-	unsigned long long address, size_t len);
+struct vme_error_handler *vme_register_error_handler(struct vme_bridge *bridge, u32 aspace,
+						     unsigned long long address, size_t len);
 void vme_unregister_error_handler(struct vme_error_handler *handler);
 
 #endif /* _VME_BRIDGE_H_ */
-- 
2.41.0

