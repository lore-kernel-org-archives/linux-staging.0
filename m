Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96395433D5
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017486; cv=none; b=ZWiVaNT4u1Uj48DrIgWY70/3+SXMzt0jomn2d5trvJ9YgznhVVnKzxPtVv7jtVnsfwMAkbCBiIi7q1xBTz+QZ4tvI/ZZrAhCjeTcIKjFXVY+AATBZOnu1Je6WJPzlxDCxgz/gGG+oILpZUFmdrUfXSy7As4i9ksDzMFY6rQSdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017486; c=relaxed/simple;
	bh=rgwk1DKE5dSj6tWDrHkODAICd5GyGDS3iCBM+crI8Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hX88lxWR3qLeSzFUhJQvcZbut9AGVPKqN1hm/0zDhN6k/80C01CN+WjKQRJl5xSpHLTYj5NNrS2dvBui2bDG7ulokCyFiFr4FQcS1GdhdQtkMWFbera5X3i073s2Yh1/Rnd3UmGfx4TKekD6LDARCTJi0GQUhQzRemOr5NTtUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WGlBT5zR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WGlBT5zR"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03D85CC8;
	Thu, 21 Mar 2024 11:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711017454;
	bh=rgwk1DKE5dSj6tWDrHkODAICd5GyGDS3iCBM+crI8Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGlBT5zRKJ8VIG4cIbJdgXxgC73cD+jSzQR48lMC23IaQk6931xqYXq63PDH4bO6w
	 bLPRZkBgUKa7YFOBXwsPe6JgzPS4sZEwkbya2Ng5z4ETyN5xoVcQY36TP3A5IR9uHC
	 NmhRfZBqW5oqsXifkEtQRyRQV/DcG6YSLivgUIC0=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 2/6] staging: vc04_services: vchiq_arm: Split driver static and runtime data
Date: Thu, 21 Mar 2024 16:07:36 +0530
Message-ID: <20240321103740.808561-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321103740.808561-1-umang.jain@ideasonboard.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
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
all global variables responsible for book-keeping.

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 38 +++++++++----------
 .../interface/vchiq_arm/vchiq_arm.h           | 12 ++++++
 2 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1579bd4e5263..73405a1f50ee 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -29,7 +29,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
-#include <soc/bcm2835/raspberrypi-firmware.h>
 
 #include "vchiq_core.h"
 #include "vchiq_ioctl.h"
@@ -71,16 +70,11 @@ struct vchiq_state g_state;
 static struct vchiq_device *bcm2835_audio;
 static struct vchiq_device *bcm2835_camera;
 
-struct vchiq_drvdata {
-	const unsigned int cache_line_size;
-	struct rpi_firmware *fw;
-};
-
-static struct vchiq_drvdata bcm2835_drvdata = {
+static struct vchiq_platform_info bcm2835_info = {
 	.cache_line_size = 32,
 };
 
-static struct vchiq_drvdata bcm2836_drvdata = {
+static struct vchiq_platform_info bcm2836_info = {
 	.cache_line_size = 64,
 };
 
@@ -466,8 +460,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
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
@@ -484,7 +478,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (err < 0)
 		return err;
 
-	g_cache_line_size = drvdata->cache_line_size;
+	g_cache_line_size = drv_mgmt->pinfo->cache_line_size;
 	g_fragments_size = 2 * g_cache_line_size;
 
 	/* Allocate space for the channels in coherent memory */
@@ -1706,8 +1700,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 }
 
 static const struct of_device_id vchiq_of_match[] = {
-	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
-	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
+	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_info },
+	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_info },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vchiq_of_match);
@@ -1716,12 +1710,13 @@ static int vchiq_probe(struct platform_device *pdev)
 {
 	struct device_node *fw_node;
 	const struct of_device_id *of_id;
-	struct vchiq_drvdata *drvdata;
+	const struct vchiq_platform_info *platform_info;
+	struct vchiq_drv_mgmt *mgmt;
 	int err;
 
 	of_id = of_match_node(vchiq_of_match, pdev->dev.of_node);
-	drvdata = (struct vchiq_drvdata *)of_id->data;
-	if (!drvdata)
+	platform_info = (struct vchiq_platform_info *)of_id->data;
+	if (!platform_info)
 		return -EINVAL;
 
 	fw_node = of_find_compatible_node(NULL, NULL,
@@ -1731,12 +1726,17 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	drvdata->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
+	mgmt = kzalloc(sizeof(struct vchiq_drv_mgmt), GFP_KERNEL);
+	if (!mgmt)
+		return -ENOMEM;
+
+	mgmt->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
 	of_node_put(fw_node);
-	if (!drvdata->fw)
+	if (!mgmt->fw)
 		return -EPROBE_DEFER;
 
-	platform_set_drvdata(pdev, drvdata);
+	mgmt->pinfo = platform_info;
+	platform_set_drvdata(pdev, mgmt);
 
 	err = vchiq_platform_init(pdev, &g_state);
 	if (err)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 7844ef765a00..fc4122c27e94 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -11,6 +11,9 @@
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/atomic.h>
+
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
 
@@ -25,6 +28,15 @@ enum USE_TYPE_E {
 	USE_TYPE_VCHIQ
 };
 
+struct vchiq_platform_info {
+	const unsigned int cache_line_size;
+};
+
+struct vchiq_drv_mgmt {
+	struct rpi_firmware *fw;
+	const struct vchiq_platform_info *pinfo;
+};
+
 struct user_service {
 	struct vchiq_service *service;
 	void __user *userdata;
-- 
2.43.0

