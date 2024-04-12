Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7D3218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908685; cv=none; b=JxvAwZfdI8r0jjEd833OdFbcaFlwgFX/CCv5W7RsWowVTKyNbzuDMCdHvAzObOmN7kJa228/8lEnJcM1g44SI6ja6UwJbMVWstFTdOurkRiuka+RGUMnFtoHrTA9RMtM4sYd5SHdAX8ct5Nz9pzy2McizCwUJR5GR0IS2h3/XiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908685; c=relaxed/simple;
	bh=bNSeJJBe5tITGmqZELCAUVxylg3STowOJUxG9ujACEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oen26O65wklyF1fTJ8p7b/BiVbd7O69jhDh6njmU78EOEJNPaGPXZfBssDYQqBx2Ia+wOawW2okHTqurG+pRH1NU1GQiML9yANQWLf7axhS14en6VAyEJ17vYZQklgbDhglN2MkDNlNQs9ZR5Lh59PdBa0dDR77D9LlLTw4w450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tXODLxvY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tXODLxvY"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C553A8E1;
	Fri, 12 Apr 2024 09:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908639;
	bh=bNSeJJBe5tITGmqZELCAUVxylg3STowOJUxG9ujACEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tXODLxvYpK/fr28NdXl5pAZHGMyXz8LH0/wlD+SBpry432UyLRKD6NYV81Hsm7ZiI
	 0nvEwsLhKCr6HGrQ8aSf8Q6MbINMu4RfNUqw6VotYMNwHNAqKZl+bP4d0vR6KcPha5
	 8G/qBm3PLX93TXakGsPE2wGGWoPq+hGqHPfkCVu0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v5 02/11] staging: vc04_services: vchiq_arm: Split driver static and runtime data
Date: Fri, 12 Apr 2024 13:27:34 +0530
Message-ID: <20240412075743.60712-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412075743.60712-1-umang.jain@ideasonboard.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vchiq_drvdata combines two types of book-keeping data. There is
platform-specific static data (for e.g. cache lines size) and then
data needed for book-keeping at runtime.

Split the data into two structures: struct vchiq_platform_info and
struct vchiq_drv_mgmt. The vchiq_drv_mgmt is allocated at runtime
during probe and will be extended in subsequent patches to remove
all global variables allocated.

No functional changes intended in this patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 43 ++++++++++---------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index ad506016fc93..7cf38f8581fa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -71,16 +71,11 @@ struct vchiq_state g_state;
 static struct vchiq_device *bcm2835_audio;
 static struct vchiq_device *bcm2835_camera;
 
-struct vchiq_drvdata {
-	const unsigned int cache_line_size;
-	struct rpi_firmware *fw;
-};
-
-static struct vchiq_drvdata bcm2835_drvdata = {
+static const struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
 };
 
-static struct vchiq_drvdata bcm2836_drvdata = {
+static const struct vchiq_platform_info bcm2836_info = {
 	.cache_line_size = 64,
 };
 
@@ -466,8 +461,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
-	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
-	struct rpi_firmware *fw = drvdata->fw;
+	struct vchiq_drv_mgmt *drv_mgmt = platform_get_drvdata(pdev);
+	struct rpi_firmware *fw = drv_mgmt->fw;
 	struct vchiq_slot_zero *vchiq_slot_zero;
 	void *slot_mem;
 	dma_addr_t slot_phys;
@@ -484,7 +479,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (err < 0)
 		return err;
 
-	g_cache_line_size = drvdata->cache_line_size;
+	g_cache_line_size = drv_mgmt->info->cache_line_size;
 	g_fragments_size = 2 * g_cache_line_size;
 
 	/* Allocate space for the channels in coherent memory */
@@ -1703,8 +1698,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 }
 
 static const struct of_device_id vchiq_of_match[] = {
-	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
-	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
+	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_info },
+	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_info },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vchiq_of_match);
@@ -1712,13 +1707,12 @@ MODULE_DEVICE_TABLE(of, vchiq_of_match);
 static int vchiq_probe(struct platform_device *pdev)
 {
 	struct device_node *fw_node;
-	const struct of_device_id *of_id;
-	struct vchiq_drvdata *drvdata;
+	const struct vchiq_platform_info *info;
+	struct vchiq_drv_mgmt *mgmt;
 	int err;
 
-	of_id = of_match_node(vchiq_of_match, pdev->dev.of_node);
-	drvdata = (struct vchiq_drvdata *)of_id->data;
-	if (!drvdata)
+	info = of_device_get_match_data(&pdev->dev);
+	if (!info)
 		return -EINVAL;
 
 	fw_node = of_find_compatible_node(NULL, NULL,
@@ -1728,12 +1722,17 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	drvdata->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
+	mgmt = kzalloc(sizeof(*mgmt), GFP_KERNEL);
+	if (!mgmt)
+		return -ENOMEM;
+
+	mgmt->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
 	of_node_put(fw_node);
-	if (!drvdata->fw)
+	if (!mgmt->fw)
 		return -EPROBE_DEFER;
 
-	platform_set_drvdata(pdev, drvdata);
+	mgmt->info = info;
+	platform_set_drvdata(pdev, mgmt);
 
 	err = vchiq_platform_init(pdev, &g_state);
 	if (err)
@@ -1767,10 +1766,14 @@ static int vchiq_probe(struct platform_device *pdev)
 
 static void vchiq_remove(struct platform_device *pdev)
 {
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
+
 	vchiq_device_unregister(bcm2835_audio);
 	vchiq_device_unregister(bcm2835_camera);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
+
+	kfree(mgmt);
 }
 
 static struct platform_driver vchiq_driver = {
-- 
2.44.0

