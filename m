Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24656BFB5
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410793; cv=none; b=YBlG5noE7LMX4ueupk8XdSMshqsDeJjg26h+SDZ4udihNRpELY0qazlXlle7UZbVOTHpowp7bnRfmPVCaQxyqcyL7cyIjIviAC/zki7aQkP3miIW1TkNSqMku92Z0d8Jg8AygWaAQcQCdrJCv75Mjo0bIz+JyOyBjwB1Rq+brbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410793; c=relaxed/simple;
	bh=qkM/y3bpNKinm7GFVPxJ16j+BO+e7jNBKN1j3EgoA08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qa6AhemChz7KAep6AYedppDnaKIpmIohhqIAqA6kSVmDZyUza1KPm6Zwl+1s426l9Q7LFKYUcWTts1H+T3ROlMovsAcAsJc+eme/7IgReAh09csxB7VKRXc2jW1wTjh0qSAHNg8EAXhNCNIdFTtuudgPilSArksfGEbjEQCUi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h5lpAFaM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h5lpAFaM"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CE32720;
	Thu, 14 Mar 2024 11:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710410767;
	bh=qkM/y3bpNKinm7GFVPxJ16j+BO+e7jNBKN1j3EgoA08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h5lpAFaMyUuQ90FUGvdslI/a/UpwVyiG1b7dH0dOPZQ8O0AbObbD+mhFZZSarOACw
	 6F9RYN9IsB7WXghqj6VBkituVoucOqkP4IqIHz+4FR25RPArbJQX0coSJZkvCq0LpE
	 x4BPFOccrv289Zs8uN/PkcPdeSXbyi0f2g9KXp74=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 3/6] staging: vc04_services: Drop global members for tracking connections
Date: Thu, 14 Mar 2024 15:36:04 +0530
Message-ID: <20240314100607.336009-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314100607.336009-1-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new struct vchiq_connected, responsible to track
the connections to the vchiq platform driver. The struct is added
as part of vchiq platform driver data (struct vchiq_drvdata).

Drop global members for tracking vchiq driver connections in
vchiq_connected.[ch] and use the struct vchiq_connected present
in struct vchiq_drvdata.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  2 +-
 .../interface/vchiq_arm/vchiq_arm.h           |  3 ++
 .../interface/vchiq_arm/vchiq_connected.c     | 33 +++++++++----------
 .../interface/vchiq_arm/vchiq_connected.h     | 15 +++++++--
 4 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 52569517ba4e..8c7520dee5f4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -550,7 +550,7 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %pK, phys %pad)\n",
 		vchiq_slot_zero, &slot_phys);
 
-	vchiq_call_connected_callbacks();
+	vchiq_call_connected_callbacks(&drvdata->drv_connected);
 
 	return 0;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 7fef05e7389c..f2fd572df2b3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -16,6 +16,7 @@
 
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
+#include "vchiq_connected.h"
 
 /* Some per-instance constants */
 #define MAX_COMPLETIONS 128
@@ -31,6 +32,8 @@ enum USE_TYPE_E {
 struct vchiq_drvdata {
 	const unsigned int cache_line_size;
 	struct rpi_firmware *fw;
+
+	struct vchiq_connected drv_connected;
 };
 
 struct user_service {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 4604a2f4d2de..bc21910fe823 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -6,11 +6,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#define  MAX_CALLBACKS  10
-
-static   int                        g_connected;
-static   int                        g_num_deferred_callbacks;
-static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
 static   DEFINE_MUTEX(g_connected_mutex);
 
 /*
@@ -19,23 +14,27 @@ static   DEFINE_MUTEX(g_connected_mutex);
  * be made immediately, otherwise it will be deferred until
  * vchiq_call_connected_callbacks is called.
  */
-void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
+void vchiq_add_connected_callback(struct vchiq_device *device,
+				  void (*callback)(void),
+				  struct vchiq_connected *drv_connected)
 {
+	unsigned int index;
+
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
@@ -46,17 +45,17 @@ EXPORT_SYMBOL(vchiq_add_connected_callback);
  * This function is called by the vchiq stack once it has been connected to
  * the videocore and clients can start to use the stack.
  */
-void vchiq_call_connected_callbacks(void)
+void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connected)
 {
 	int i;
 
 	if (mutex_lock_killable(&g_connected_mutex))
 		return;
 
-	for (i = 0; i <  g_num_deferred_callbacks; i++)
-		g_deferred_callback[i]();
+	for (i = 0; i < drv_connected->num_deferred_callbacks; i++)
+		drv_connected->deferred_callback[i]();
 
-	g_num_deferred_callbacks = 0;
-	g_connected = 1;
+	drv_connected->num_deferred_callbacks = 0;
+	drv_connected->connected = true;
 	mutex_unlock(&g_connected_mutex);
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
index e4ed56446f8a..66e56b5af46e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
@@ -6,7 +6,18 @@
 #ifndef VCHIQ_CONNECTED_H
 #define VCHIQ_CONNECTED_H
 
-void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
-void vchiq_call_connected_callbacks(void);
+#define  VCHIQ_DRV_MAX_CALLBACKS  10
+
+struct vchiq_connected {
+	bool connected;
+	int num_deferred_callbacks;
+
+	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
+};
+
+void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void),
+				  struct vchiq_connected *drv_connected);
+void vchiq_call_connected_callbacks(struct vchiq_connected *drv_connected);
+
 
 #endif /* VCHIQ_CONNECTED_H */
-- 
2.43.0

