Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A32FE596
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771084337; cv=none; b=Y9Hsq7sztZ9ymtU3y164yI7IV6/ns+YB0Q7in++cItQOrygaoAPlk2KE5BdpTd7XjMvXMBxW6lHt1RkYnephKk2tpaJ3v9hxs28UvFMXCy7fbQzVM3M+NhGh4e4w7Zlovw5o7kV6n7APvNupuub4xZjs5jbuhAb0gV47JiLn8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771084337; c=relaxed/simple;
	bh=xQh1vNe2/eDT5i8ADtTBiQq4bN+w0yMtcf8770B5e78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O1T0mypbmVREmbPvlBma93x7pCJW1Suf5TNnu8fRXgmTB/K8NpCwb7cuyVrY08bGNMEhgtnFUIXJpe4wvdsp/Tw0paUt4dDVATqHvIE1QRGnIpsV+McC7PHpZi6EcjlST654HqU5U7xkjFwbZloHE8p5HBMrIB1Cb785/Xe48kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT9fhJoJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT9fhJoJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e266a3572so603552a12.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 07:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771084335; x=1771689135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f00J/5oXng6KrSXxxBq0P/TEPEyPF2XTkCoivFiPfe8=;
        b=KT9fhJoJ0jjXe173bkKljEIdWOLDVbmyOq4UnWfp65j0XW5M7XtDtqmI+f8pS5ImG7
         OcM/EEbT31o7PSnjVRi6kJY2dt14wZvIhJYAz0WzrTiUIM954YucA9UiZhxt7CddeK0Z
         S0tKVWIaYhFL1RxBtJ7HnTaEflvbr8pSou9VNNNQpm9Xf/L3QzIw9Jy2dF5WX6zMB6P6
         +G2CODPlmZsYH1Kp3CIsdGjwumOGl9KqMLBQmOyu8KcZbJ/A3NtjttKTXxn3XlrQpSbP
         cV/bAP/JaYz2DWXASFHIfLeuoZKPS/fI49x++aA3UspHwBhdyvIdlbofRUpdDz7O8FE4
         0m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771084335; x=1771689135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f00J/5oXng6KrSXxxBq0P/TEPEyPF2XTkCoivFiPfe8=;
        b=NtcTW9+h4kLy3APMfoUABbIL8AIu4PwcobO5+N9mthfh0YDSvFrW+K0flYRtKn8e1L
         z1Yfqhwwiu/EQttWsQ+5iBAaHl+2TZEJGlLGvmskn47TdiveotCwaOrRJgh5raBkEv/u
         QIVMWoSkhOwxc+rkdvAFLNs5ODy8eP4wTB8ATpY5NLbyXoK2g982sNQxlVxivrVnYs+k
         p4cP51BjTsQ2uZ4/Sbu2AKzUypHzN7kSdrmgkUayLn+KkKP/l+Y8Hikzs6c0zYRYR33l
         umhlwxKIV2QRGBFLHJtDYxCqNt3KjDD9vunas7Rv/sKnmGSSx1tM88tMcalntrvI/ZtZ
         ddGg==
X-Gm-Message-State: AOJu0YxbSDfUbhSMnLuJ9eipD0IqggLCgm71tr69k6DHvgG5kXrAJMWH
	uKUXs1Ise9qXQr/nSi6UsBbkNQRsw5rb1X7JZqiO3mcUs1OSjs1lyXNWaEponA==
X-Gm-Gg: AZuq6aK9ayo3WfQIr4IQnH5sHU+ZyJbpgbEhy2vHAPNYHBuIw5eteitUcKDpphhbftx
	Bw9MgI3StJq+K5RS1ZT+l0Xcmuis9xy8GGhePmcPMUC7bTAYo5cu0TmmVs1dnef9VhNKuZ8hXyt
	ZylxzXci418rCVC24MhyyNhftXSj+GGn2awd/GVuWkJlz9lDriqiTQJ2O35u6t/5Uo6e7ieMn/a
	EocCT8WqE+pqElhQFUlijq/hhuZ/YfWAFNPcwQqAxp9kRwWKbPdj1Zte3LL8DIGtXEKGEC+MGOA
	2QRWbOI4kfI9ousK1YFbM1Ez7UCnFVRNw/Fmob9ZHVfoSAglcecjl+9fGSH1YHjMD/ZhYFNZVfb
	BejVrq/GLW1ogqJjXed0yMtxZRH4/d4NAhkTFTnYcFusg+W64bx4KD2hZDVq5jKglatGXRYsSbY
	Wg59hL/llhcpKctqaYqUVQdAMOTWi1VhouN5luYmMXW7RxeI32Ig==
X-Received: by 2002:a17:903:acb:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2ab504d5b0amr47938315ad.1.1771084335520;
        Sat, 14 Feb 2026 07:52:15 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8817:dac0:96bb:43ff:fec0:e782])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aafc527sm21595005ad.89.2026.02.14.07.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 07:52:15 -0800 (PST)
From: Samyak <samyak.bambole07@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Samyak Bambole <samyak.bambole07@gmail.com>
Subject: [PATCH] staging: vme_user: use kmalloc_obj instead of kmalloc
Date: Sat, 14 Feb 2026 21:21:57 +0530
Message-ID: <20260214155157.663800-1-samyak.bambole07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samyak Bambole <samyak.bambole07@gmail.com>

Replace kmalloc(sizeof(*ptr), GFP_KERNEL) calls with kmalloc_obj(*ptr,
GFP_KERNEL)

This addresses scripts/checkpatch.pl warnings and follows the preffered
allocation pattern.

Changes:
- vme.c: 12 replacements
- vme_fake.c: 3 replacements
- vme_tsi148.c: 7 replacements

Signed-off-by: Samyak Bambole <samyak.bambole07@gmail.com>
---
 drivers/staging/vme_user/vme.c        | 24 ++++++++++++------------
 drivers/staging/vme_user/vme_fake.c   |  6 +++---
 drivers/staging/vme_user/vme_tsi148.c | 14 +++++++-------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 2095de725..8496c722a 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -287,7 +287,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 	if (!allocated_image)
 		goto err_image;
 
-	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
+	resource = kmalloc_obj(*resource, GFP_KERNEL);
 	if (!resource)
 		goto err_alloc;
 
@@ -484,7 +484,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		goto err_image;
 	}
 
-	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
+	resource = kmalloc_obj(*resource, GFP_KERNEL);
 	if (!resource)
 		goto err_alloc;
 
@@ -854,7 +854,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	if (!allocated_ctrlr)
 		goto err_ctrlr;
 
-	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
+	resource = kmalloc_obj(*resource, GFP_KERNEL);
 	if (!resource)
 		goto err_alloc;
 
@@ -894,7 +894,7 @@ struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
 		return NULL;
 	}
 
-	dma_list = kmalloc(sizeof(*dma_list), GFP_KERNEL);
+	dma_list = kmalloc_obj(*dma_list, GFP_KERNEL);
 	if (!dma_list)
 		return NULL;
 
@@ -924,11 +924,11 @@ struct vme_dma_attr *vme_dma_pattern_attribute(u32 pattern, u32 type)
 	struct vme_dma_attr *attributes;
 	struct vme_dma_pattern *pattern_attr;
 
-	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
+	attributes = kmalloc_obj(*attributes, GFP_KERNEL);
 	if (!attributes)
 		goto err_attr;
 
-	pattern_attr = kmalloc(sizeof(*pattern_attr), GFP_KERNEL);
+	pattern_attr = kmalloc_obj(*pattern_attr, GFP_KERNEL);
 	if (!pattern_attr)
 		goto err_pat;
 
@@ -964,11 +964,11 @@ struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t address)
 
 	/* XXX Run some sanity checks here */
 
-	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
+	attributes = kmalloc_obj(*attributes, GFP_KERNEL);
 	if (!attributes)
 		goto err_attr;
 
-	pci_attr = kmalloc(sizeof(*pci_attr), GFP_KERNEL);
+	pci_attr = kmalloc_obj(*pci_attr, GFP_KERNEL);
 	if (!pci_attr)
 		goto err_pci;
 
@@ -1005,11 +1005,11 @@ struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
 	struct vme_dma_attr *attributes;
 	struct vme_dma_vme *vme_attr;
 
-	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
+	attributes = kmalloc_obj(*attributes, GFP_KERNEL);
 	if (!attributes)
 		goto err_attr;
 
-	vme_attr = kmalloc(sizeof(*vme_attr), GFP_KERNEL);
+	vme_attr = kmalloc_obj(*vme_attr, GFP_KERNEL);
 	if (!vme_attr)
 		goto err_vme;
 
@@ -1233,7 +1233,7 @@ struct vme_error_handler *vme_register_error_handler(struct vme_bridge *bridge,
 {
 	struct vme_error_handler *handler;
 
-	handler = kmalloc(sizeof(*handler), GFP_ATOMIC);
+	handler = kmalloc_obj(*handler, GFP_ATOMIC);
 	if (!handler)
 		return NULL;
 
@@ -1458,7 +1458,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 	if (!allocated_lm)
 		goto err_lm;
 
-	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
+	resource = kmalloc_obj(*resource, GFP_KERNEL);
 	if (!resource)
 		goto err_alloc;
 
diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 731fbba17..0fc5fe7f8 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1102,7 +1102,7 @@ static int __init fake_init(void)
 	/* Add master windows to list */
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
 	for (i = 0; i < FAKE_MAX_MASTER; i++) {
-		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
+		master_image = kmalloc_obj(*master_image, GFP_KERNEL);
 		if (!master_image) {
 			retval = -ENOMEM;
 			goto err_master;
@@ -1128,7 +1128,7 @@ static int __init fake_init(void)
 	/* Add slave windows to list */
 	INIT_LIST_HEAD(&fake_bridge->slave_resources);
 	for (i = 0; i < FAKE_MAX_SLAVE; i++) {
-		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
+		slave_image = kmalloc_obj(*slave_image, GFP_KERNEL);
 		if (!slave_image) {
 			retval = -ENOMEM;
 			goto err_slave;
@@ -1150,7 +1150,7 @@ static int __init fake_init(void)
 
 	/* Add location monitor to list */
 	INIT_LIST_HEAD(&fake_bridge->lm_resources);
-	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
+	lm = kmalloc_obj(*lm, GFP_KERNEL);
 	if (!lm) {
 		retval = -ENOMEM;
 		goto err_lm;
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 733594dde..62b16be15 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -1611,7 +1611,7 @@ static int tsi148_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *s
 	tsi148_bridge = list->parent->parent;
 
 	/* Descriptor must be aligned on 64-bit boundaries */
-	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	entry = kmalloc_obj(*entry, GFP_KERNEL);
 	if (!entry) {
 		retval = -ENOMEM;
 		goto err_mem;
@@ -2333,8 +2333,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		master_num--;
 
 		tsi148_device->flush_image =
-			kmalloc(sizeof(*tsi148_device->flush_image),
-				GFP_KERNEL);
+			kmalloc_obj(*tsi148_device->flush_image,
+				    GFP_KERNEL);
 		if (!tsi148_device->flush_image) {
 			retval = -ENOMEM;
 			goto err_master;
@@ -2350,7 +2350,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add master windows to list */
 	for (i = 0; i < master_num; i++) {
-		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
+		master_image = kmalloc_obj(*master_image, GFP_KERNEL);
 		if (!master_image) {
 			retval = -ENOMEM;
 			goto err_master;
@@ -2376,7 +2376,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add slave windows to list */
 	for (i = 0; i < TSI148_MAX_SLAVE; i++) {
-		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
+		slave_image = kmalloc_obj(*slave_image, GFP_KERNEL);
 		if (!slave_image) {
 			retval = -ENOMEM;
 			goto err_slave;
@@ -2397,7 +2397,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add dma engines to list */
 	for (i = 0; i < TSI148_MAX_DMA; i++) {
-		dma_ctrlr = kmalloc(sizeof(*dma_ctrlr), GFP_KERNEL);
+		dma_ctrlr = kmalloc_obj(*dma_ctrlr, GFP_KERNEL);
 		if (!dma_ctrlr) {
 			retval = -ENOMEM;
 			goto err_dma;
@@ -2417,7 +2417,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	/* Add location monitor to list */
-	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
+	lm = kmalloc_obj(*lm, GFP_KERNEL);
 	if (!lm) {
 		retval = -ENOMEM;
 		goto err_lm;
-- 
2.53.0

