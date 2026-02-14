Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DA9275861
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771087544; cv=none; b=C2txG3Pw0IzfBhuY22Jwf8NuFxLalSlZ+Er3g4Q4CXeCyetAwQ7n2pfPHrXQhQ6MPnbp7YkerZmJwMq5i3MZBQWg+e31ULjHPZXOzlwfza6ItsrNFQcrg4kXd8joGooX7nS+coBKz2hfepHVQjhq9P8szUil2McqSmKEZEFgOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771087544; c=relaxed/simple;
	bh=iCwAnbVB1jc5d7BMbXxyJVq6PFESKeK8F17Vc17wTf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Voe8XfuHd8dTKqJ70bzG2FjwfLJBW5OyXyFda62atOC/X4Hqjt5zzydjrIu2mOfmhSPsarOG9QAarr75CggrV3Nr1gMzFTHX36TuGssNicDIMUkWYf1hNU+HTwGkndvzHONwEXzkJIYrB4kRlx/kiSHV78yOAI+Yi13CTUzhIfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBH+B9au; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBH+B9au"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so1393684a12.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771087542; x=1771692342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGRRYqKJ9J2009OKJWPZ7oHx9YtyrAUbf3PHAdVPOhI=;
        b=dBH+B9auU0WK1Ok55ORQousu5yJIpOAw91N8hhiJ8/EaTpIf8cIT9rpr9v51gicr27
         FlWePFN52WDiF8Cwy/Rje63yv5Pj2jmx1Lwsgm24tpAFluFiA0vuKt5azp3J8VD6TlPg
         wgBiWk0iR/MxXyk74XmAzFb6/rqOqLQfqZ6xzeSXIDuk+32E8OFXb/tADKLGsZQxvuQF
         sL1QbMap35eKaPXXnsoSd4HXRJAEO2dUuGi1ywAZif/OR1d5jbRULMzBMOp4l4Abxq1a
         lJX+YPr+wf3nWaQ5dyrHT/x2nXz3yW/CRlAHVwOJFrSdSIS9jNzI3E4/wd2xsXp9AkgP
         FE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771087542; x=1771692342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGRRYqKJ9J2009OKJWPZ7oHx9YtyrAUbf3PHAdVPOhI=;
        b=LkQRZvxgWPEfXNVEI9ug7u+YNNtRjg2lelt/96eOnXOS/vlcM4p3aDeeUl+sqHEcVo
         teLioWm5jIQT5FCWX5m2vMOhr0miF2vBwfayjfpls6ppgCRuL1CQ0CuSBjE8Z9R0lYzh
         Zyel+mKlcgTTWy7WCeaou1yqePGxKEtpQcN1uFm33ofKm0WtXkTus2ikY+nKvCkuo2Ii
         KpU6WEuRTPhnhV/lRvVz+ae8lH5dx8KOewPFIEri7Bd3fzmDfLfarr9vZ8aSxDohSF5p
         AVnP2py9rpD5pu4/ShcNY/H74fpnP1KVu8BOjzwHoDXMAwqYBbVWIclGTgaJzfajNdez
         CzbA==
X-Gm-Message-State: AOJu0Yxj0dgkuYjrVdw7vnt7vN4SLqBuj6ALCnPc3liRBnPqkKtVgin9
	T0nMe2GwmHmQtMzUTrFvRBxtSCI+tl8Vl9FPnpppIBuzM08yq3mC8Jz4soO3Ig==
X-Gm-Gg: AZuq6aJ8Ao/J6NTma/0pL5T1W0OrbqS2RavtOCtnU57+fv0mJfQkqBCk7dKQ4QIdNam
	HldSo6e/5BFDoU+W8JBb2OKMAxWKBnWOl9noEBUCYUrjfKccldNW7L+CUDZCGa/6BJu+2k+bg0b
	jV8jr0Kqx0O4whVPDwXdi2Cd2L6AcogEAB+RkpfI6Q7Yl1Tt+Jftm9JofqUZ488OfAeO0nqN1pa
	TQeQv/hAssE3oJ25MiOY0crn2QJTyvcUYZ2knq39zOSIGR9DRfiPk+DSZa/LYUxK3m7WCgJFlk1
	WRMf6zv90E47cOHdjUVX2ExDd3y235kwsZUuW1XhynKGpZ4GD5q1b8M5JeLqVjh9z34fM8ensB6
	TwEDclSD5Jse+WY800mm4Mz6C1Ml2kF7NnrjtNkCAeLJNZsHJKjFUhhXp0RUGbckTAce7UMz+ZO
	F8NwPzCrcIl6ncZ+7bHS40/Ldf3OoW9lhMQEv0V0gsv+ZIOXqOvw==
X-Received: by 2002:a05:6a21:9d4c:b0:394:76a7:1cf1 with SMTP id adf61e73a8af0-394838fd5d9mr3166425637.3.1771087541847;
        Sat, 14 Feb 2026 08:45:41 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8817:dac0:96bb:43ff:fec0:e782])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e531e6c44sm2757956a12.17.2026.02.14.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 08:45:40 -0800 (PST)
From: Samyak <samyak.bambole07@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Samyak Bambole <samyak.bambole07@gmail.com>
Subject: [PATCH v3] staging: vme_user: use kmalloc_obj instead of kmalloc
Date: Sat, 14 Feb 2026 22:15:19 +0530
Message-ID: <20260214164519.678428-1-samyak.bambole07@gmail.com>
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

This addresses scripts/checkpatch.pl warnings and follows the preferred
allocation pattern.

Signed-off-by: Samyak Bambole <samyak.bambole07@gmail.com>
---
v2 -> v3 : fix spelling: preferred (not preffered)
v1 -> v2 : remove changelog details as suggested by gregkh

v2: https://lore.kernel.org/linux-staging/20260214161321.669459-1-samyak.bambole07@gmail.com/
v1: https://lore.kernel.org/linux-staging/20260214155157.663800-1-samyak.bambole07@gmail.com/

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

