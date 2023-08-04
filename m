Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501CCA67
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 14:30:57 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6bc8d1878a0so1842404a34.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159456; x=1691764256;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMe8d3F6FgsgCf4Bb6DRaJcRuzNRE/O7YwXPUR0KzAo=;
        b=YDNcv3+yaBOYkfxaSRUnLkv3S+RgbJiU33nJ+hBhv5C/ZE0T2XR/bhMF5SCLyZqz0r
         I2dyCDekJzl+ySjqgBF8167X1bEm5OgYyGaOt96XWqQlHvs4MUBYZ6UUlTaX3v/HcfZC
         xAxAd46ZV/PFcYjChf/euh0kV4xCrccHrhkTs5pmh+lP8kd7ST5+HV7gSIcO7n5kdcOk
         kuGPR5KPm+sFUj+RZgR1zmvPujglTwy1OQvagxEQwcqXT5+jBYrR6TskcEFmVCxDC+V0
         I/KWeqCTbdxOM7MT0X3zNywOxY794t0kVTskXz9XC/hwIw94pF8RoCm3ylqyKlqnMAgX
         dIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159456; x=1691764256;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMe8d3F6FgsgCf4Bb6DRaJcRuzNRE/O7YwXPUR0KzAo=;
        b=b8RQYmzTqPaTTzTeKUjtnv4htnZ83c80ZoSo6McfuVSH4dBac2TWw2zQ9dbph5tVaB
         pGm9eBOnCMoE7vuc8ktuevTCAcpT75lOGXZLcN6xLliWmRZGDO+XdftzB/oouqP+c7Ix
         Mcrm3hlveAdXkTMjGNzmHah75HXR9fLu5f1FtR5FMjzhN2Qqn4lGWwreiKOU8VvtTUD1
         sXIDAVIusr99X9i6zV8gaxiA6iL6j1ydIuAPMvBlR0MCnIqlE7LnN+WBHhQhgHDfoh8Q
         0HDGA5XEm6l8hgh/J0BVJtH8nYJqNPWWCnQIIiiTl8cnM1cF1ad7WJQctfpSMSbrkljA
         4IvA==
X-Gm-Message-State: AOJu0YxK/RC2JthvzoFCGiLfgADMNiuvvQWOTY04CsU45XqG6bFC1N4H
	t4pGKi4KsRop5k4aIpR6CwY=
X-Google-Smtp-Source: AGHT+IFaAxfUYqGVXNTTOdNKZFSQzxTLwfpy41cblopH5umQrQmVXSyb0AVbu5XdQQLGZ3EOyfWX8g==
X-Received: by 2002:a05:6830:154:b0:6b8:7e53:e7c3 with SMTP id j20-20020a056830015400b006b87e53e7c3mr1799177otp.31.1691159456070;
        Fri, 04 Aug 2023 07:30:56 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id c18-20020a9d6852000000b006b8a2cd44adsm1146015oto.72.2023.08.04.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:30:55 -0700 (PDT)
Date: Fri, 4 Aug 2023 11:30:50 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org
Subject: [PATCH v3] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <ZM0Lmt5Dp/k6iO21@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed the following as reported by checkpatch to adhere to the
Linux kernel coding-style guidelines.

Changes in v3:
- Fixed changelog

Changes in v2:
- Fixed CHECK: line length exceeds 100 columns, noted by Greg KH and Dan Carpenter
- Fixed CHECK: Alignment should match open parenthesis
- Fixed CHECK: Lines should not end with a '('

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
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

