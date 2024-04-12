Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375093218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908697; cv=none; b=baFtzbxc8pbqOeNTfqOAfN6lSNx/aC/RZR6qxEyl7gafs3Dak2fWXCydvtjunEagRLY+0yYfbhsMELzvDfyWN/vcO+ehTBCMPNajCz0lPuL+QDSkNCX68M/NmPs0J0TRGpVf59YGJBJpfOj0bLA1SfHxiB6FSrsHHVBmqMFPWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908697; c=relaxed/simple;
	bh=77J1BtJ2o+Y0LyJxxlPA6wSorM4nBftTLgyAIRCsITo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0dR7pbox+nRzd0bZESZhmecOU/UdpNJgsOMo9hwuZM1k4NzlBR4oUueFKG0UMZiVGYlt2eIaut4UiDkWXrrZyjAtBXxbxucTbJtBOpxYOxNjVXRHBS/0GkNNSpFoBjYFMwdNdutTYSgYXc9j9lafUgUabrpeT8e5X5x02pnyBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JEChPcbb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JEChPcbb"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E726A68;
	Fri, 12 Apr 2024 09:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908651;
	bh=77J1BtJ2o+Y0LyJxxlPA6wSorM4nBftTLgyAIRCsITo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JEChPcbbmmTMwcYiXCazNomAM8RTJdcFZDknFCBX8jgbgvLCMhszAGNPrhImRCIKJ
	 B4hq/OOKEnoV1c3UEr1c8h1vMm9bf/McNe+9YwdZgah+ZTYZ4zqzMLBHbIls2qyW1Z
	 fIruR+we/+zl70EmUYXGeu8r+VZ0nSMIR/O3k0fI=
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
Subject: [PATCH v5 05/11] staging: vc04_services: Drop vchiq_connected.[ch] files
Date: Fri, 12 Apr 2024 13:27:37 +0530
Message-ID: <20240412075743.60712-6-umang.jain@ideasonboard.com>
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

The vchiq_connected.[ch] just implements two function:

- vchiq_add_connected_callback()
- vchiq_call_connected_callbacks()

for the deferred vchiq callbacks. Those can easily live in
vchiq_arm.[ch], hence move them. This allows making the
vchiq_call_connected_callbacks() function static.

The move doesn't copy over MAX_CALLBACKS because it is the same as
VCHIQ_DRV_MAX_CALLBACKS. Hence, it now being used in
vchiq_add_connected_callback().

No functional changes intended in this patch.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/Makefile        |  1 -
 .../interface/vchiq_arm/vchiq_arm.c           | 51 +++++++++++++++-
 .../interface/vchiq_arm/vchiq_arm.h           |  5 ++
 .../interface/vchiq_arm/vchiq_connected.c     | 60 -------------------
 .../interface/vchiq_arm/vchiq_connected.h     | 14 -----
 5 files changed, 55 insertions(+), 76 deletions(-)
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
 delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h

diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index e8b897a7b9a6..dad3789522b8 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -6,7 +6,6 @@ vchiq-objs := \
    interface/vchiq_arm/vchiq_arm.o \
    interface/vchiq_arm/vchiq_bus.o \
    interface/vchiq_arm/vchiq_debugfs.o \
-   interface/vchiq_arm/vchiq_connected.o \
 
 ifdef CONFIG_VCHIQ_CDEV
 vchiq-objs += interface/vchiq_arm/vchiq_dev.o
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index ac12ed0784a4..396c686b1978 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -36,7 +36,6 @@
 #include "vchiq_arm.h"
 #include "vchiq_bus.h"
 #include "vchiq_debugfs.h"
-#include "vchiq_connected.h"
 #include "vchiq_pagelist.h"
 
 #define DEVICE_NAME "vchiq"
@@ -189,6 +188,56 @@ is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
 	return tmp == (addr & PAGE_MASK);
 }
 
+/*
+ * This function is called by the vchiq stack once it has been connected to
+ * the videocore and clients can start to use the stack.
+ */
+static void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
+{
+	int i;
+
+	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
+		return;
+
+	for (i = 0; i < drv_mgmt->num_deferred_callbacks; i++)
+		drv_mgmt->deferred_callback[i]();
+
+	drv_mgmt->num_deferred_callbacks = 0;
+	drv_mgmt->connected = true;
+	mutex_unlock(&drv_mgmt->connected_mutex);
+}
+
+/*
+ * This function is used to defer initialization until the vchiq stack is
+ * initialized. If the stack is already initialized, then the callback will
+ * be made immediately, otherwise it will be deferred until
+ * vchiq_call_connected_callbacks is called.
+ */
+void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
+{
+	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
+
+	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
+		return;
+
+	if (drv_mgmt->connected) {
+		/* We're already connected. Call the callback immediately. */
+		callback();
+	} else {
+		if (drv_mgmt->num_deferred_callbacks >= VCHIQ_DRV_MAX_CALLBACKS) {
+			dev_err(&device->dev,
+				"core: deferred callbacks(%d) exceeded the maximum limit(%d)\n",
+				drv_mgmt->num_deferred_callbacks, VCHIQ_DRV_MAX_CALLBACKS);
+		} else {
+			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
+				callback;
+			drv_mgmt->num_deferred_callbacks++;
+		}
+	}
+	mutex_unlock(&drv_mgmt->connected_mutex);
+}
+EXPORT_SYMBOL(vchiq_add_connected_callback);
+
 /* There is a potential problem with partial cache lines (pages?)
  * at the ends of the block when reading. If the CPU accessed anything in
  * the same line (page?) then it may have pulled old data into the cache,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index b4ed50e4072d..48f6abee591f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -23,6 +23,7 @@
 #define VCHIQ_DRV_MAX_CALLBACKS 10
 
 struct rpi_firmware;
+struct vchiq_device;
 
 enum USE_TYPE_E {
 	USE_TYPE_SERVICE,
@@ -132,6 +133,10 @@ vchiq_instance_get_trace(struct vchiq_instance *instance);
 extern void
 vchiq_instance_set_trace(struct vchiq_instance *instance, int trace);
 
+extern void
+vchiq_add_connected_callback(struct vchiq_device *device,
+			     void (*callback)(void));
+
 #if IS_ENABLED(CONFIG_VCHIQ_CDEV)
 
 extern void
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
deleted file mode 100644
index 049b3f2d1bd4..000000000000
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ /dev/null
@@ -1,60 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
-/* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
-
-#include "vchiq_arm.h"
-#include "vchiq_connected.h"
-#include "vchiq_core.h"
-#include <linux/module.h>
-#include <linux/mutex.h>
-
-#define  MAX_CALLBACKS  10
-
-/*
- * This function is used to defer initialization until the vchiq stack is
- * initialized. If the stack is already initialized, then the callback will
- * be made immediately, otherwise it will be deferred until
- * vchiq_call_connected_callbacks is called.
- */
-void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
-{
-	struct vchiq_drv_mgmt *drv_mgmt = device->drv_mgmt;
-
-	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
-		return;
-
-	if (drv_mgmt->connected) {
-		/* We're already connected. Call the callback immediately. */
-		callback();
-	} else {
-		if (drv_mgmt->num_deferred_callbacks >= MAX_CALLBACKS) {
-			dev_err(&device->dev,
-				"core: There already %d callback registered - please increase MAX_CALLBACKS\n",
-				drv_mgmt->num_deferred_callbacks);
-		} else {
-			drv_mgmt->deferred_callback[drv_mgmt->num_deferred_callbacks] =
-				callback;
-			drv_mgmt->num_deferred_callbacks++;
-		}
-	}
-	mutex_unlock(&drv_mgmt->connected_mutex);
-}
-EXPORT_SYMBOL(vchiq_add_connected_callback);
-
-/*
- * This function is called by the vchiq stack once it has been connected to
- * the videocore and clients can start to use the stack.
- */
-void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *drv_mgmt)
-{
-	int i;
-
-	if (mutex_lock_killable(&drv_mgmt->connected_mutex))
-		return;
-
-	for (i = 0; i <  drv_mgmt->num_deferred_callbacks; i++)
-		drv_mgmt->deferred_callback[i]();
-
-	drv_mgmt->num_deferred_callbacks = 0;
-	drv_mgmt->connected = true;
-	mutex_unlock(&drv_mgmt->connected_mutex);
-}
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
deleted file mode 100644
index f57a878652b1..000000000000
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
-
-#include "vchiq_bus.h"
-
-#ifndef VCHIQ_CONNECTED_H
-#define VCHIQ_CONNECTED_H
-
-struct vchiq_drv_mgmt;
-
-void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
-void vchiq_call_connected_callbacks(struct vchiq_drv_mgmt *mgmt);
-
-#endif /* VCHIQ_CONNECTED_H */
-- 
2.44.0

