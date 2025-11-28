Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808B242D62
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318654; cv=none; b=ChroBnN9Zds0jEkBM3McUWoIabQRv17lIJu4Pm8yxT03vNXM9FxnvmNgpHSKAqy8De8FSJx7kFvynmUk25/L53uzOJ9RVLb4enMhaectgFlxchTlD25Hp4bUpNSHC9o5r4OReZZT9WoGdeMW3ofLsCykfZg16k7aMdzzDZEh3Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318654; c=relaxed/simple;
	bh=AbkoDDN0W/JiQS8hA+ptDyzWCQKScMwbcbKNepk8s2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAWQg9XXfyqRVB3Y10R6Iwv/yq2wBrkDzrPVoidUy+WNoUQ811c0kNOZLG+N3G0bkbBEBU+yPrV6p7FbithhCUFjJqPC4Nr33djN4+Yk8B0Stpeqxo9cMy/UfyRt872JqgnQljKCnmK0ju5DbhmiGOxD2fvK1NvPXKwSacc+cTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDQRvx0j; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDQRvx0j"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297d4a56f97so23369495ad.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 00:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318651; x=1764923451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pm0lJY5Txyb3872TKvaRS0DwsrM2S0ScpTVma2hDu9w=;
        b=YDQRvx0j1j5KhJSTAydwr30I3Ay00b1PULEwd6LxL0UcvRmCtolvTBgt/2xrwR+OrZ
         sGTMHrgT85kwU6DIuAuGylvTEI8z1vOv0luNCIwfi7FhOs4DP9KOmELs45VLMONbI/yb
         OGgONf8EBztFKGK7c6sYqG549ItiXXgiq2jmaSXBoxhtMV5gfyz3ccgxTI3CTrQ7vK73
         5GOdG1PDF177jszqrkFA5sj5yr3XazRcejiaFpnX4oZaWIFvpQdbwGlG05Kh2zv0Mw6H
         fwhe0nuEj1lr57dmg16CIEc3f4YiuPoPuoSR5NUexcpaIgFNO2IXmRsBwIErJCIo0rbJ
         w68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318651; x=1764923451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pm0lJY5Txyb3872TKvaRS0DwsrM2S0ScpTVma2hDu9w=;
        b=Lx9jSRYx5Z6qvOJIkZmCTBP2E6aR+nph8xpzkibf67etdNARjhRtqsT3FFT6fIq5Vz
         ve6b9F5Jc8HRilxS2+ZE7zXeNX794I4HNWl5Se2tTi4krtj8ioPykpSp+f2qeGjR/+qP
         VY93OX1op0O6tDblj/lBRpCxHvEcCBRIhbOi/jSG+TyfQAYUxbFp/1XK4TgY1WFwKwgw
         IYXaH8d2UB0iTzuk6nY7kMMTaPmO09zoX6zSGbRYNhvCkdBWbnmbUhEhcN86vAH3KEBi
         pbvrMRvO+8rmx0em04JY5G53fMDb8Fj8vrHeusIjKS1BrGICPz4zYjaalGWSiRlEMZO1
         iM0g==
X-Forwarded-Encrypted: i=1; AJvYcCUxjsjUiaZt61dnQN4zJkPjvz/OMvwgKA5q9GO2ElYC9KpELt+VFCcDMWwcOdWWi2gY/nHCQgqiWPPgMvF+@lists.linux.dev
X-Gm-Message-State: AOJu0YwKdNepiUZ4Es6B0Ts62BlyPo9/R8xPa5G9nBbBSn6Qos8XAEV0
	2g6hw2gnvj6uovKVA8cW+ezmZoB2CrFGonP0Y7EY3FKTpj+B9x29o3Sk
X-Gm-Gg: ASbGncuwTouhWgBgv//HaIgHD9kq/zcLjXVebluHnDF3nGU1xsEic13tlXIdTBQ+O//
	LC4TLF5Sxf7WWaBjw90wNitDTjMRi6HMtGgndiUCrKNY9Skn/09Qy45as1VREXkStuKNxItdaRo
	3OfBvE5I6nfs4W8xn8m4xX1Hf5bh4LiTli4ZSmYAqYIPN79YvBSMnLLlQEakvU6xNVtTfIz7/ou
	VNrpEuC0A7mLOQ6MgLNaCnO+GcV1XV7fk2PtCv9KU8gWgyP97IioYpBhjPj3GYiQICpUn+bgWIV
	aVNDZPbZLd+QBajv8EIZYUZsgs2CnSwGCPYyIZblcBGtA20Dr+BCeDDnihSY9XirdZSFmCzYDCo
	RWFuIY1tSGrFkV3CQ1u6wy2OialwdUjbjXsldBZB6VrFkmAD/OzZ41vq0Ad4XqXSYW7BHQuZo7H
	svQfvMsnYjVMWufS7ivuW9YYqyrSLJ3/oJaVhVR1pJG8nB7WIeWXntswcXbLlmUgJSwAihZv/50
	rfNASzrkVer2g9Q3sWpL6rv2rex+RI=
X-Google-Smtp-Source: AGHT+IEYfdUjm8OFsm6QMOxGiI2iufk2HiAKoSfcIVImlRyINFUlzAe+ksKmPx/FKAbSEtdnuoabfA==
X-Received: by 2002:a17:902:ebd2:b0:295:57f6:768 with SMTP id d9443c01a7336-29b6c575687mr276905675ad.33.1764318651335;
        Fri, 28 Nov 2025 00:30:51 -0800 (PST)
Received: from main.. (c-76-146-85-33.hsd1.wa.comcast.net. [76.146.85.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb277f9sm37587215ad.46.2025.11.28.00.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:30:50 -0800 (PST)
From: Artur Stupa <arthur.stupa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Artur Stupa <arthur.stupa@gmail.com>
Subject: [PATCH] staging: vme_user: name function parameters
Date: Fri, 28 Nov 2025 00:29:20 -0800
Message-ID: <20251128083018.51315-1-arthur.stupa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warning for all unnamed arguments:
WARNING: function definition argument should also have an identifier name

No functional changes.

Signed-off-by: Artur Stupa <arthur.stupa@gmail.com>
---
 drivers/staging/vme_user/vme.c        |   2 +-
 drivers/staging/vme_user/vme.h        | 109 +++++++++++++-------------
 drivers/staging/vme_user/vme_bridge.h |  10 +--
 drivers/staging/vme_user/vme_user.c   |   2 +-
 4 files changed, 62 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 2095de72596a..1d169f276bcf 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1288,7 +1288,7 @@ EXPORT_SYMBOL(vme_irq_handler);
  *         already in use. Hardware specific errors also possible.
  */
 int vme_irq_request(struct vme_dev *vdev, int level, int statid,
-		    void (*callback)(int, int, void *),
+		    void (*callback)(int level, int statid, void *priv_data),
 		    void *priv_data)
 {
 	struct vme_bridge *bridge;
diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 7753e736f9fd..797e9940fdd1 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -121,69 +121,70 @@ struct vme_dev {
  */
 struct vme_driver {
 	const char *name;
-	int (*match)(struct vme_dev *);
-	int (*probe)(struct vme_dev *);
-	void (*remove)(struct vme_dev *);
+	int (*match)(struct vme_dev *vdev);
+	int (*probe)(struct vme_dev *vdev);
+	void (*remove)(struct vme_dev *vdev);
 	struct device_driver driver;
 	struct list_head devices;
 };
 
-void *vme_alloc_consistent(struct vme_resource *, size_t, dma_addr_t *);
-void vme_free_consistent(struct vme_resource *, size_t,  void *, dma_addr_t);
+void *vme_alloc_consistent(struct vme_resource *resource, size_t size, dma_addr_t *dma);
+void vme_free_consistent(struct vme_resource *resource, size_t size, void *vaddr, dma_addr_t dma);
 
-size_t vme_get_size(struct vme_resource *);
+size_t vme_get_size(struct vme_resource *resource);
 int vme_check_window(struct vme_bridge *bridge, u32 aspace,
 		     unsigned long long vme_base, unsigned long long size);
 
-struct vme_resource *vme_slave_request(struct vme_dev *, u32, u32);
-int vme_slave_set(struct vme_resource *, int, unsigned long long,
-		  unsigned long long, dma_addr_t, u32, u32);
-int vme_slave_get(struct vme_resource *, int *, unsigned long long *,
-		  unsigned long long *, dma_addr_t *, u32 *, u32 *);
-void vme_slave_free(struct vme_resource *);
-
-struct vme_resource *vme_master_request(struct vme_dev *, u32, u32, u32);
-int vme_master_set(struct vme_resource *, int, unsigned long long,
-		   unsigned long long, u32, u32, u32);
-int vme_master_get(struct vme_resource *, int *, unsigned long long *,
-		   unsigned long long *, u32 *, u32 *, u32 *);
-ssize_t vme_master_read(struct vme_resource *, void *, size_t, loff_t);
-ssize_t vme_master_write(struct vme_resource *, void *, size_t, loff_t);
-unsigned int vme_master_rmw(struct vme_resource *, unsigned int, unsigned int,
-			    unsigned int, loff_t);
+struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address, u32 cycle);
+int vme_slave_set(struct vme_resource *resource, int enabled, unsigned long long vme_base,
+		  unsigned long long size, dma_addr_t buf_base, u32 aspace, u32 cycle);
+int vme_slave_get(struct vme_resource *resource, int *enabled, unsigned long long *vme_base,
+		  unsigned long long *size, dma_addr_t *buf_base, u32 *aspace, u32 *cycle);
+void vme_slave_free(struct vme_resource *resource);
+
+struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address, u32 cycle, u32 dwidth);
+int vme_master_set(struct vme_resource *resource, int enabled, unsigned long long vme_base,
+		   unsigned long long size, u32 aspace, u32 cycle, u32 dwidth);
+int vme_master_get(struct vme_resource *resource, int *enabled, unsigned long long *vme_base,
+		   unsigned long long *size, u32 *aspace, u32 *cycle, u32 *dwidth);
+ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count, loff_t offset);
+ssize_t vme_master_write(struct vme_resource *resource, void *buf, size_t count, loff_t offset);
+unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask, unsigned int compare,
+			    unsigned int swap, loff_t offset);
 int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma);
-void vme_master_free(struct vme_resource *);
-
-struct vme_resource *vme_dma_request(struct vme_dev *, u32);
-struct vme_dma_list *vme_new_dma_list(struct vme_resource *);
-struct vme_dma_attr *vme_dma_pattern_attribute(u32, u32);
-struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t);
-struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long, u32, u32, u32);
-void vme_dma_free_attribute(struct vme_dma_attr *);
-int vme_dma_list_add(struct vme_dma_list *, struct vme_dma_attr *,
-		     struct vme_dma_attr *, size_t);
-int vme_dma_list_exec(struct vme_dma_list *);
-int vme_dma_list_free(struct vme_dma_list *);
-int vme_dma_free(struct vme_resource *);
-
-int vme_irq_request(struct vme_dev *, int, int,
-		    void (*callback)(int, int, void *), void *);
-void vme_irq_free(struct vme_dev *, int, int);
-int vme_irq_generate(struct vme_dev *, int, int);
-
-struct vme_resource *vme_lm_request(struct vme_dev *);
-int vme_lm_count(struct vme_resource *);
-int vme_lm_set(struct vme_resource *, unsigned long long, u32, u32);
-int vme_lm_get(struct vme_resource *, unsigned long long *, u32 *, u32 *);
-int vme_lm_attach(struct vme_resource *, int, void (*callback)(void *), void *);
-int vme_lm_detach(struct vme_resource *, int);
-void vme_lm_free(struct vme_resource *);
-
-int vme_slot_num(struct vme_dev *);
-int vme_bus_num(struct vme_dev *);
-
-int vme_register_driver(struct vme_driver *, unsigned int);
-void vme_unregister_driver(struct vme_driver *);
+void vme_master_free(struct vme_resource *resource);
+
+struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route);
+struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource);
+struct vme_dma_attr *vme_dma_pattern_attribute(u32 pattern, u32 type);
+struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t address);
+struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
+					   u32 aspace, u32 cycle, u32 dwidth);
+void vme_dma_free_attribute(struct vme_dma_attr *attributes);
+int vme_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
+		     struct vme_dma_attr *dest, size_t count);
+int vme_dma_list_exec(struct vme_dma_list *list);
+int vme_dma_list_free(struct vme_dma_list *list);
+int vme_dma_free(struct vme_resource *resource);
+
+int vme_irq_request(struct vme_dev *vdev, int level, int statid,
+		    void (*callback)(int level, int statid, void *priv_data), void *priv_data);
+void vme_irq_free(struct vme_dev *vdev, int level, int statid);
+int vme_irq_generate(struct vme_dev *vdev, int level, int statid);
+
+struct vme_resource *vme_lm_request(struct vme_dev *vdev);
+int vme_lm_count(struct vme_resource *resource);
+int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base, u32 aspace, u32 cycle);
+int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base, u32 *aspace, u32 *cycle);
+int vme_lm_attach(struct vme_resource *resource, int monitor, void (*callback)(void *), void *data);
+int vme_lm_detach(struct vme_resource *resource, int monitor);
+void vme_lm_free(struct vme_resource *resource);
+
+int vme_slot_num(struct vme_dev *vdev);
+int vme_bus_num(struct vme_dev *vdev);
+
+int vme_register_driver(struct vme_driver *drv, unsigned int ndevs);
+void vme_unregister_driver(struct vme_driver *drv);
 
 #endif /* _VME_H_ */
 
diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index abf880d68b12..92b0baa793d7 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -88,7 +88,7 @@ struct vme_error_handler {
 };
 
 struct vme_callback {
-	void (*func)(int, int, void*);
+	void (*func)(int level, int statid, void *priv_data);
 	void *priv_data;
 };
 
@@ -178,11 +178,11 @@ struct vme_bridge {
 };
 
 void vme_bus_error_handler(struct vme_bridge *bridge, unsigned long long address, int am);
-void vme_irq_handler(struct vme_bridge *, int, int);
+void vme_irq_handler(struct vme_bridge *bridge, int level, int statid);
 
-struct vme_bridge *vme_init_bridge(struct vme_bridge *);
-int vme_register_bridge(struct vme_bridge *);
-void vme_unregister_bridge(struct vme_bridge *);
+struct vme_bridge *vme_init_bridge(struct vme_bridge *bridge);
+int vme_register_bridge(struct vme_bridge *bridge);
+void vme_unregister_bridge(struct vme_bridge *bridge);
 struct vme_error_handler *vme_register_error_handler(struct vme_bridge *bridge, u32 aspace,
 						     unsigned long long address, size_t len);
 void vme_unregister_error_handler(struct vme_error_handler *handler);
diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 5829a4141561..2012cccd0d09 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -690,7 +690,7 @@ static int vme_user_probe(struct vme_dev *vdev)
 	return err;
 }
 
-static void vme_user_remove(struct vme_dev *dev)
+static void vme_user_remove(struct vme_dev *vdev)
 {
 	int i;
 
-- 
2.43.0

