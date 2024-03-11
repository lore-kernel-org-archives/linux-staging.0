Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BA158AAC
	for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 23:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710198985; cv=none; b=V0+8JfW24MPaYoakM9pjURnch004n/ePBP7ZNdz7erFNRGBDjERy8csVprwpycvPm/XYzmKmb41zkbQAwLTd/dXSJ1HFzIoZtkL+huemC/5vgkkZIe7PAmpurqLEkIgxs2kuAm/b9ADkZGcNRmt0sTwTHnSZplz5w8nk7BMmSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710198985; c=relaxed/simple;
	bh=3KAkkR8LzwGvvJOZhpT3GZas6J6uA+ZV9bNZIssJlPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpwwqPLGB1jQJ9+JW3qzDFemik+HvQg/jc07N2yvJYlAYMahxwkPO/knryOmPMKQA+HrDXVFe9ri8zovj9IeZlSs3TyDG3hTz7/pL42n0to8rIBWFarE7pIyIRVSgGLrL02sb02ZmL4r58pYqunFD9T6l1tY9Zvqcb4vG2ko0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LE0tOv7k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LE0tOv7k"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D923E842;
	Tue, 12 Mar 2024 00:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710198960;
	bh=3KAkkR8LzwGvvJOZhpT3GZas6J6uA+ZV9bNZIssJlPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LE0tOv7kJX6aJ0vbQ1LaG/wO75Gk0M5F7jE7P4Q+SrtjBptCqjtohwzYjP48ChYaW
	 1bsuIb77E8LkdBQFapJKNtHWbYo1Uij+74BsQltaa4gUzj49Ktmq7+rxlN38mQIIaM
	 IL4oOHJQqpnWJzuLHxroSKRJRWwg5T5DU9TE9UiQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 3/3] staging: vc04_services: Drop global members for tracking connections
Date: Tue, 12 Mar 2024 04:46:07 +0530
Message-ID: <20240311231607.124491-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311231607.124491-1-umang.jain@ideasonboard.com>
References: <20240311231607.124491-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop global members for tracking vchiq driver connections in
vchiq_connected.[ch] and use the struct vchiq_connected present
as a part of vchiq platform driver data.

All calls have been adjusted to use the struct vchiq_connected.

Since the non-essential global members have been eliminated,
drop the respective TODO item.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO  |  8 ----
 .../interface/vchiq_arm/vchiq_arm.c           |  2 +-
 .../interface/vchiq_arm/vchiq_connected.c     | 44 +++++++++----------
 .../interface/vchiq_arm/vchiq_connected.h     |  6 ++-
 4 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 05eb5140d096..15f12b8f213e 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -41,14 +41,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
 
-* Get rid of all non essential global structures and create a proper per
-device structure
-
-The first thing one generally sees in a probe function is a memory allocation
-for all the device specific data. This structure is then passed all over the
-driver. This is good practice since it makes the driver work regardless of the
-number of devices probed.
-
 * Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index b8b51267bcde..7daad927207a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -560,7 +560,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
 		vchiq_slot_zero, &slot_phys);
 
-	vchiq_call_connected_callbacks();
+	vchiq_call_connected_callbacks(&drvdata->drv_connected);
 
 	return 0;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 3cad13f09e37..4b79fccaa95e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -6,19 +6,13 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#define  MAX_CALLBACKS  10
-
-static   int                        g_connected;
-static   int                        g_num_deferred_callbacks;
-static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
-static   int                        g_once_init;
 static   DEFINE_MUTEX(g_connected_mutex);
 
 /* Function to initialize our lock */
-static void connected_init(void)
+static void connected_init(struct vchiq_connected *drv_connected)
 {
-	if (!g_once_init)
-		g_once_init = 1;
+	if (!drv_connected->once_init)
+		drv_connected->once_init = 1;
 }
 
 /*
@@ -27,25 +21,29 @@ static void connected_init(void)
  * be made immediately, otherwise it will be deferred until
  * vchiq_call_connected_callbacks is called.
  */
-void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
+void vchiq_add_connected_callback(struct vchiq_device *device,
+				  void (*callback)(void),
+				  struct vchiq_connected *drv_connected)
 {
-	connected_init();
+	unsigned int index;
+
+	connected_init(drv_connected);
 
 	if (mutex_lock_killable(&g_connected_mutex))
 		return;
 
-	if (g_connected) {
+	if (drv_connected->connected) {
 		/* We're already connected. Call the callback immediately. */
 		callback();
 	} else {
-		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
+		if (drv_connected->num_deferred_callbacks >= VCHIQ_DRV_MAX_CALLBACKS) {
 			dev_err(&device->dev,
 				"core: There already %d callback registered - please increase MAX_CALLBACKS\n",
-				g_num_deferred_callbacks);
+				drv_connected->num_deferred_callbacks);
 		} else {
-			g_deferred_callback[g_num_deferred_callbacks] =
-				callback;
-			g_num_deferred_callbacks++;
+			index = drv_connected->num_deferred_callbacks;
+			drv_connected->deferred_callback[index] = callback;
+			drv_connected->num_deferred_callbacks++;
 		}
 	}
 	mutex_unlock(&g_connected_mutex);
@@ -56,19 +54,19 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
  * This function is called by the vchiq stack once it has been connected to
  * the videocore and clients can start to use the stack.
  */
-void vchiq_call_connected_callbacks(void)
+void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connected)
 {
 	int i;
 
-	connected_init();
+	connected_init(drv_connected);
 
 	if (mutex_lock_killable(&g_connected_mutex))
 		return;
 
-	for (i = 0; i <  g_num_deferred_callbacks; i++)
-		g_deferred_callback[i]();
+	for (i = 0; i < drv_connected->num_deferred_callbacks; i++)
+		drv_connected->deferred_callback[i]();
 
-	g_num_deferred_callbacks = 0;
-	g_connected = 1;
+	drv_connected->num_deferred_callbacks = 0;
+	drv_connected->connected = 1;
 	mutex_unlock(&g_connected_mutex);
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
index cb5cba94dd54..f40d68fc44df 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
@@ -16,7 +16,9 @@ struct vchiq_connected {
 	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
 };
 
-void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
-void vchiq_call_connected_callbacks(void);
+void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void),
+				  struct vchiq_connected *drv_connected);
+void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connected);
+
 
 #endif /* VCHIQ_CONNECTED_H */
-- 
2.43.0

