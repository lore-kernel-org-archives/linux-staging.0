Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920243218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908694; cv=none; b=JWuAm0b/fZXaR9nS6Sr2Jcqr0rYlrz2Y1t9QI8P59KBma09iJ8fBwEJKjcDGHxbAKtNHOjCt1HwSPsdLt2qcdRCAKrmw/sLHUem7eEXFeC2Lx/kMFpF2Db6uZGbmVrBl4PvXAy6e8RH75jj2Hlsm31+WP14yeKXoKQZDujRhP3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908694; c=relaxed/simple;
	bh=3LGqXZ2csGBFJJdt7xzA5MPNF+wI0XDV3YxCOM8eQd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiJgHIg3mVj3FlmngF1ThX7ADOSUf7p7zvVjlF+C95LXgb7PwFR7Fj/fu/PDg6D981iCNXmcjV5sBhQ4gwYehU3rqkL8L7C0CqQmFWE/dbDgtgAP4sDWHgXjGPc83jlXTCWWaMp1D7fE/4rIix5t2LGkwK1gxsRnVvBmX+rQQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QeomFL5/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QeomFL5/"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D38C8E1;
	Fri, 12 Apr 2024 09:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908647;
	bh=3LGqXZ2csGBFJJdt7xzA5MPNF+wI0XDV3YxCOM8eQd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QeomFL5/JvZ9uoQV5wNTgigEXMzBjxj99AqttZileNKIyr5CEhOco3O67NzhDnDoQ
	 42sieEIDUls7mnXpenyEwXhTOlOaDQWWQMOnZCUbqwmykz9ZnrWucxnmtkgkiA85jZ
	 RJx4RJLVpQFmBqPNyyjNAXyqExH0eeHBT4aADnuQ=
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
Subject: [PATCH v5 04/11] staging: vc04_services: Move variables for tracking connections
Date: Fri, 12 Apr 2024 13:27:36 +0530
Message-ID: <20240412075743.60712-5-umang.jain@ideasonboard.com>
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

Connections to the vchiq driver are tracked using global variables.
Drop those and introduce them as members of struct vchiq_drv_mgmt.
Hence, struct vchiq_drv_mgmt will be used to track the connections.

Also, store a vchiq_drv_mgmt pointer to struct vchiq_device to
have easy access to struct vchiq_drv_mgmt across vchiq devices.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  3 +-
 .../interface/vchiq_arm/vchiq_arm.h           |  9 +++++
 .../interface/vchiq_arm/vchiq_bus.c           |  3 ++
 .../interface/vchiq_arm/vchiq_bus.h           |  3 ++
 .../interface/vchiq_arm/vchiq_connected.c     | 36 +++++++++----------
 .../interface/vchiq_arm/vchiq_connected.h     |  4 ++-
 6 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index af74d7268717..ac12ed0784a4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -545,7 +545,8 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
 		vchiq_slot_zero, &slot_phys);
 
-	vchiq_call_connected_callbacks();
+	mutex_init(&drv_mgmt->connected_mutex);
+	vchiq_call_connected_callbacks(drv_mgmt);
 
 	return 0;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 04683d98cd00..b4ed50e4072d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -20,6 +20,8 @@
 #define MAX_ELEMENTS 8
 #define MSG_QUEUE_SIZE 128
 
+#define VCHIQ_DRV_MAX_CALLBACKS 10
+
 struct rpi_firmware;
 
 enum USE_TYPE_E {
@@ -34,6 +36,13 @@ struct vchiq_platform_info {
 struct vchiq_drv_mgmt {
 	struct rpi_firmware *fw;
 	const struct vchiq_platform_info *info;
+
+	bool connected;
+	int num_deferred_callbacks;
+	/* Protects connected and num_deferred_callbacks */
+	struct mutex connected_mutex;
+
+	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
 };
 
 struct user_service {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 93609716df84..3f87b93c6537 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include "vchiq_arm.h"
 #include "vchiq_bus.h"
 
 static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
@@ -77,6 +78,8 @@ vchiq_device_register(struct device *parent, const char *name)
 	device->dev.dma_mask = &device->dev.coherent_dma_mask;
 	device->dev.release = vchiq_device_release;
 
+	device->drv_mgmt = dev_get_drvdata(parent);
+
 	of_dma_configure(&device->dev, parent->of_node, true);
 
 	ret = device_register(&device->dev);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
index 4db86e76edbd..9de179b39f85 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
@@ -9,8 +9,11 @@
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 
+struct vchiq_drv_mgmt;
+
 struct vchiq_device {
 	struct device dev;
+	struct vchiq_drv_mgmt *drv_mgmt;
 };
 
 struct vchiq_driver {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 4604a2f4d2de..049b3f2d1bd4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
 
+#include "vchiq_arm.h"
 #include "vchiq_connected.h"
 #include "vchiq_core.h"
 #include <linux/module.h>
@@ -8,11 +9,6 @@
 
 #define  MAX_CALLBACKS  10
 
-static   int                        g_connected;
-static   int                        g_num_deferred_callbacks;
-static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
-static   DEFINE_MUTEX(g_connected_mutex);
-
 /*
  * This function is used to defer initialization until the vchiq stack is
  * initialized. If the stack is already initialized, then the callback will
@@ -21,24 +17,26 @@ static   DEFINE_MUTEX(g_connected_mutex);
  */
 void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
 {
-	if (mutex_lock_killable(&g_connected_mutex))
+	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
+
+	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
 		return;
 
-	if (g_connected) {
+	if (drv_mgmt->connected) {
 		/* We're already connected. Call the callback immediately. */
 		callback();
 	} else {
-		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
+		if (drv_mgmt->num_deferred_callbacks >= MAX_CALLBACKS) {
 			dev_err(&device->dev,
 				"core: There already %d callback registered - please increase MAX_CALLBACKS\n",
-				g_num_deferred_callbacks);
+				drv_mgmt->num_deferred_callbacks);
 		} else {
-			g_deferred_callback[g_num_deferred_callbacks] =
+			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
 				callback;
-			g_num_deferred_callbacks++;
+			drv_mgmt->num_deferred_callbacks++;
 		}
 	}
-	mutex_unlock(&g_connected_mutex);
+	mutex_unlock(&drv_mgmt->connected_mutex);
 }
 EXPORT_SYMBOL(vchiq_add_connected_callback);
 
@@ -46,17 +44,17 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
  * This function is called by the vchiq stack once it has been connected to
  * the videocore and clients can start to use the stack.
  */
-void vchiq_call_connected_callbacks(void)
+void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
 {
 	int i;
 
-	if (mutex_lock_killable(&g_connected_mutex))
+	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
 		return;
 
-	for (i = 0; i <  g_num_deferred_callbacks; i++)
-		g_deferred_callback[i]();
+	for (i = 0; i <  drv_mgmt->num_deferred_callbacks; i++)
+		drv_mgmt->deferred_callback[i]();
 
-	g_num_deferred_callbacks = 0;
-	g_connected = 1;
-	mutex_unlock(&g_connected_mutex);
+	drv_mgmt->num_deferred_callbacks = 0;
+	drv_mgmt->connected = true;
+	mutex_unlock(&drv_mgmt->connected_mutex);
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
index e4ed56446f8a..f57a878652b1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
@@ -6,7 +6,9 @@
 #ifndef VCHIQ_CONNECTED_H
 #define VCHIQ_CONNECTED_H
 
+struct vchiq_drv_mgmt;
+
 void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
-void vchiq_call_connected_callbacks(void);
+void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *mgmt);
 
 #endif /* VCHIQ_CONNECTED_H */
-- 
2.44.0

