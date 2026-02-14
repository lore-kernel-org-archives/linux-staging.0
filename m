Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E500A257431
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771085618; cv=none; b=tk5klGx+HNSPb0xWefMnmnP+4xgk5BLas7dFs5BtsKYMVKn1XpNHlrCZWcTyzct2hdAXFfJQ/qzVfKpD7P67NJ7eIrqFG5mNzOHANWKTd7CNWAInrLiX7Cglpg/FH6Z4GNhYIaEQ+E/H9J+1wqkZkBb0oSoG/A23xeOxybm46Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771085618; c=relaxed/simple;
	bh=IFu4hIivSyahsSbSZBdhZUhwDPnXLg6O+NoXKL8G6Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Skd4//Yoxzw9t+G6z4kHX9VUzRuE648BQv8S49LZrcfebgT9wsiihMXtYBrTmkts5I+fvytPbDqav5LG1CuEQSIfCUPc378R8mfaOwCnlSOTHAYf/g6cRcFMbWRLMmFSIEGytkMaHOic2ZOVRs51wSjH29aHs35cARX6y1LjJks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZ+K7J3V; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZ+K7J3V"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso956742b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771085616; x=1771690416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYO8jkHBY5oPF3Cf7Ns9dZbN3jyOBpTLSi7fJGuLgA0=;
        b=FZ+K7J3VbLe+cdAli3c9Sh4kywDNdyZr7Q5tc/t5LBurgplIDUATJzgqsWG4FUzEAs
         ozektDZbJZ4Dmo/wwn2sEb6/a+unGfSmaM2KBTz4EZ6fqnMDt8/FEK8Ny52smZmOeY6W
         frvXQ5WjRuWIyT5c8BtjILaMFydKJy73xYpZajs1hoP0w1qtHoXwNF5oYyCXmmZNUneu
         BgNZmmfuD3XAtrxBGztx3yKzOQEesJTjPlHq+IbESWTACzZZyRhbNPMM1pZR5RxaFhsl
         4L9uFDaM+6ulNO6jLzxX3YMH1uVwKHRjAdaVfZR9jK/U5XyZdm4UaZm8Qoa9G4ndoQ90
         A9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771085616; x=1771690416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYO8jkHBY5oPF3Cf7Ns9dZbN3jyOBpTLSi7fJGuLgA0=;
        b=tT26aVxO8f/qqOC0q6ibe9mw46uj/cyopdRnGj7S/s9noG1e8w33EZt00YLnBmgScX
         st2VvecZ6+oqMwKIiwj0LsaYCZoPSh7Vdbt1nJlv2d9LWF/ckvx8xITfak+m8y73fUOb
         19Y0SF2kaxkeTvcCGumo5IvYcS/IIvZcP/CXw4DRtklPw+xzVfVO3wOjQNgT2WeSknna
         CY60SHwA4+odJcgQvbF2qVXt3qHGjlo8y6l4B31/q7JrIy1qU4Hpb+WTEyM8oZf1hVum
         rb6dZaywTUoy5COF1Mfk0k1jBQE2lf1aqmWhykiofXf/n6U+2ZI+I9WS5iY4sJjqcKsK
         UmmA==
X-Gm-Message-State: AOJu0YzxxSf6qlmOzr+T37dQ8bt38nvtcu9sOPr1VYt5r20Mi0R1UwXZ
	oKCZVRf46rT9UGBSBEtLb9ZbsWSjLPa1wTCzVXeA3mm/2RfSRDzB3sAEgSfHqw==
X-Gm-Gg: AZuq6aI1yt8aTzZ/NxfbOnlnJtOhrs/sNsMpckuEMPI428C3Ui58+PW0rxALm3sKNAv
	BoATa96HUciP+PNMly2Ue44VxCKgpUVAwpMnmSeRJ3Ndve7VQp7kQBP79hVBoiMYHvWEJVZ1dzP
	wk3Mk2qH7lVbshaDt7tjx2VxrWtiAWvLu8yDoO8zMBqkarAowCwQZNX8r1tJpGmFShES2qbd/7h
	SSizq1FuPONsjab2uG2SZx8OQCZ/t2+7BLYvRxt5eIKOKDJMXsF+dV8qP2M/g/MDAzy0AxTLL5S
	XE5UTDBmxPMSSRwZEv71Js1HOnHlHj2IlJf5MLP6zpfaMktN8mdMeAk3gVAvQbVs1N/sM5wJ7QF
	pCTiZKDsGT1X9GQAo37dA1nyHkP/cC/DYrjDjKR5h685dIad+mwRKSQmrQfHYqKsKVdeXICRzGU
	OHMMZcxlbi3wUzfJ7+RtsDysDGTW96LieZ28BOWugHElKy0O1ZQO/R/BCeTwkg
X-Received: by 2002:a05:6a00:1c84:b0:81d:f938:800b with SMTP id d2e1a72fcca58-824d9640796mr2226402b3a.61.1771085615995;
        Sat, 14 Feb 2026 08:13:35 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8817:dac0:96bb:43ff:fec0:e782])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9084asm7489482b3a.43.2026.02.14.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 08:13:35 -0800 (PST)
From: Samyak <samyak.bambole07@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Samyak Bambole <samyak.bambole07@gmail.com>
Subject: [PATCH v2] staging: vme_user: use kmalloc_obj instead of kmalloc
Date: Sat, 14 Feb 2026 21:43:21 +0530
Message-ID: <20260214161321.669459-1-samyak.bambole07@gmail.com>
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

