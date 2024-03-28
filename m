Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08F5A4C7
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649546; cv=none; b=jjKwQTtUCJhe5b/CP8x9Be8VtXNuoUYAk7ClbYqX15224TJ370Z+AVcbgN7jS8N1568aPu2LVbYpMh7d+N8O2Gq7feVgryPa9tlV4CL8hdmaAzD/ugoG5ijl2PiX8iVjeJRI1oiu4fZ1x+X2bS5QB9Dk/0P6qhVmgaYtSVHmg3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649546; c=relaxed/simple;
	bh=MNTZQ9dSO67eRsaY2EhllAEYH/49BDU2Stv0GkJO//g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlltGw2IfW7Gr2eEEm+l+kg1cGklCdkeIODDWwKhsi0plU9fWgq2X9dkwbAIiTRP8lzLWGz5z6tgFXYGzlMOVzB4AGweKO2lDFNY1s3iHbeyvvrSIBi6/YUJBCYcbcjeEryLxxipOgYvwGIBJhbf7t9BnarCxJ5ARu0A5l/6fV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GGWmPkoV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GGWmPkoV"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A73CD20;
	Thu, 28 Mar 2024 19:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711649510;
	bh=MNTZQ9dSO67eRsaY2EhllAEYH/49BDU2Stv0GkJO//g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGWmPkoVqSUVtBLVgNIS6zLlAxH60ILhfyC3J/+Y9LSF2aTyeGazEmgW1F37ky+el
	 P/VsYl8ccxiVqCuyItELEinT5x6A8cPU0HfUFhDNSWmYzLQmouekTCIGihIBZ8u0av
	 HNNqT4JAmIz2z/bUWIqV+k3IKqN7q6LxYuZDEGoA=
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
Subject: [PATCH v4 10/11] staging: vc04_services: Move global g_state vchiq_state pointer
Date: Thu, 28 Mar 2024 23:41:32 +0530
Message-ID: <20240328181134.1548799-11-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
References: <20240328181134.1548799-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch intended to drop the g_state pointer.
g_state is supposed to be a central place to track the state
via vchiq_state. This is now moved to be contained in the
struct vchiq_drv_mgmt. As a result vchiq_get_state() is also removed.

In order to have access to vchiq_drv_mgmt, vchiq_initialise()
and vchiq_mmal_init() are modified to receive a struct device pointer
as one of their function parameter

The vchiq_state pointer is now passed directly to
vchiq_dump_platform_instances() to get access to the state instead
getting it via vchiq_get_state().

For the char device, struct miscdevice is retrieved by struct file's
private data in vchiq_open and struct vchiq_drv_mgmt is retrieved
thereafter.

Removal of global variable members is now addressed hence, drop
the corresponding item from the TODO list.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../bcm2835-camera/bcm2835-camera.c           |  4 +-
 .../include/linux/raspberrypi/vchiq.h         |  4 +-
 drivers/staging/vc04_services/interface/TODO  |  8 ----
 .../interface/vchiq_arm/vchiq_arm.c           | 38 +++++--------------
 .../interface/vchiq_arm/vchiq_arm.h           |  7 +---
 .../interface/vchiq_arm/vchiq_core.c          |  2 +-
 .../interface/vchiq_arm/vchiq_core.h          |  2 +-
 .../interface/vchiq_arm/vchiq_debugfs.c       |  5 ++-
 .../interface/vchiq_arm/vchiq_dev.c           | 10 +++--
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  6 ++-
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  3 +-
 11 files changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index c3ba490e53cb..b3599ec6293a 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1555,7 +1555,7 @@ static int mmal_init(struct bcm2835_mmal_dev *dev)
 	u32 param_size;
 	struct vchiq_mmal_component  *camera;
 
-	ret = vchiq_mmal_init(&dev->instance);
+	ret = vchiq_mmal_init(dev->v4l2_dev.dev, &dev->instance);
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev, "%s: vchiq mmal init failed %d\n",
 			 __func__, ret);
@@ -1854,7 +1854,7 @@ static int bcm2835_mmal_probe(struct vchiq_device *device)
 		return ret;
 	}
 
-	ret = vchiq_mmal_init(&instance);
+	ret = vchiq_mmal_init(&device->dev, &instance);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 52e106f117da..6c40d8c1dde6 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -48,6 +48,7 @@ struct vchiq_element {
 };
 
 struct vchiq_instance;
+struct vchiq_state;
 
 struct vchiq_service_base {
 	int fourcc;
@@ -78,7 +79,8 @@ struct vchiq_service_params_kernel {
 	short version_min;   /* Update for incompatible changes */
 };
 
-extern int vchiq_initialise(struct vchiq_instance **pinstance);
+extern int vchiq_initialise(struct vchiq_state *state,
+			    struct vchiq_instance **pinstance);
 extern int vchiq_shutdown(struct vchiq_instance *instance);
 extern int vchiq_connect(struct vchiq_instance *instance);
 extern int vchiq_open_service(struct vchiq_instance *instance,
diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 57a2d6761f9b..e8acbc21ee10 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -34,14 +34,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
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
index 28c6357c13cd..b8fba6da636d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -59,8 +59,6 @@
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
-struct vchiq_state g_state;
-
 /*
  * The devices implemented in the VCHIQ firmware are not discoverable,
  * so we need to maintain a list of them in order to register them with
@@ -698,9 +696,8 @@ void vchiq_dump_platform_state(struct seq_file *f)
 }
 
 #define VCHIQ_INIT_RETRIES 10
-int vchiq_initialise(struct vchiq_instance **instance_out)
+int vchiq_initialise(struct vchiq_state *state, struct vchiq_instance **instance_out)
 {
-	struct vchiq_state *state;
 	struct vchiq_instance *instance = NULL;
 	int i, ret;
 
@@ -710,7 +707,6 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 	 * block forever.
 	 */
 	for (i = 0; i < VCHIQ_INIT_RETRIES; i++) {
-		state = vchiq_get_state();
 		if (state)
 			break;
 		usleep_range(500, 600);
@@ -1030,9 +1026,10 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	       void *bulk_userdata)
 {
 	struct vchiq_completion_data_kernel *completion;
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(instance->state->dev);
 	int insert;
 
-	DEBUG_INITIALISE(g_state.local);
+	DEBUG_INITIALISE(mgmt->state.local);
 
 	insert = instance->completion_insert;
 	while ((insert - instance->completion_remove) >= MAX_COMPLETIONS) {
@@ -1095,11 +1092,12 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	 * containing the original callback and the user state structure, which
 	 * contains a circular buffer for completion records.
 	 */
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(instance->state->dev);
 	struct user_service *user_service;
 	struct vchiq_service *service;
 	bool skip_completion = false;
 
-	DEBUG_INITIALISE(g_state.local);
+	DEBUG_INITIALISE(mgmt->state.local);
 
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 
@@ -1204,9 +1202,8 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 		bulk_userdata);
 }
 
-void vchiq_dump_platform_instances(struct seq_file *f)
+void vchiq_dump_platform_instances(struct vchiq_state *state, struct seq_file *f)
 {
-	struct vchiq_state *state = vchiq_get_state();
 	int i;
 
 	if (!state)
@@ -1281,23 +1278,6 @@ void vchiq_dump_platform_service_state(struct seq_file *f,
 	seq_puts(f, "\n");
 }
 
-struct vchiq_state *
-vchiq_get_state(void)
-{
-	if (!g_state.remote) {
-		pr_err("%s: g_state.remote == NULL\n", __func__);
-		return NULL;
-	}
-
-	if (g_state.remote->initialised != 1) {
-		pr_notice("%s: g_state.remote->initialised != 1 (%d)\n",
-			  __func__, g_state.remote->initialised);
-		return NULL;
-	}
-
-	return &g_state;
-}
-
 /*
  * Autosuspend related functionality
  */
@@ -1331,7 +1311,7 @@ vchiq_keepalive_thread_func(void *v)
 		.version_min = KEEPALIVE_VER_MIN
 	};
 
-	ret = vchiq_initialise(&instance);
+	ret = vchiq_initialise(state, &instance);
 	if (ret) {
 		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n", __func__, ret);
 		goto exit;
@@ -1779,7 +1759,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	mgmt->info = info;
 	platform_set_drvdata(pdev, mgmt);
 
-	err = vchiq_platform_init(pdev, &g_state);
+	err = vchiq_platform_init(pdev, &mgmt->state);
 	if (err)
 		goto failed_platform_init;
 
@@ -1811,8 +1791,8 @@ static int vchiq_probe(struct platform_device *pdev)
 
 static void vchiq_remove(struct platform_device *pdev)
 {
-	struct vchiq_state *state = vchiq_get_state();
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
+	struct vchiq_state *state = &mgmt->state;
 
 	vchiq_device_unregister(bcm2835_audio);
 	vchiq_device_unregister(bcm2835_camera);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index a8f7a7f7b189..182dacb7783b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -67,6 +67,8 @@ struct vchiq_drv_mgmt {
 	unsigned int fragments_size;
 
 	void __iomem *regs;
+
+	struct vchiq_state state;
 };
 
 struct user_service {
@@ -113,11 +115,6 @@ struct vchiq_instance {
 	struct vchiq_debugfs_node debugfs_node;
 };
 
-extern struct vchiq_state g_state;
-
-extern struct vchiq_state *
-vchiq_get_state(void);
-
 int
 vchiq_use_service(struct vchiq_instance *instance, unsigned int handle);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2e0be0194811..8601700965a8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3505,7 +3505,7 @@ void vchiq_dump_state(struct seq_file *f, struct vchiq_state *state)
 
 	vchiq_dump_shared_state(f, state, state->remote, "Remote");
 
-	vchiq_dump_platform_instances(f);
+	vchiq_dump_platform_instances(state, f);
 
 	for (i = 0; i < state->unused_service; i++) {
 		struct vchiq_service *service = find_service_by_port(state, i);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 33d95e431717..62e5f3322e45 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -526,7 +526,7 @@ void remote_event_signal(struct vchiq_state *state, struct remote_event *event);
 
 void vchiq_dump_platform_state(struct seq_file *f);
 
-void vchiq_dump_platform_instances(struct seq_file *f);
+void vchiq_dump_platform_instances(struct vchiq_state *state, struct seq_file *f);
 
 void vchiq_dump_platform_service_state(struct seq_file *f, struct vchiq_service *service);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index d833e4e2973a..54e7bf029d9a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -42,7 +42,10 @@ static int debugfs_trace_show(struct seq_file *f, void *offset)
 
 static int vchiq_dump_show(struct seq_file *f, void *offset)
 {
-	vchiq_dump_state(f, &g_state);
+	struct vchiq_instance *instance = f->private;
+
+	vchiq_dump_state(f, instance->state);
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(vchiq_dump);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 739ce529a71b..9fe35864936c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -208,7 +208,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 	struct vchiq_header *header;
 	int ret;
 
-	DEBUG_INITIALISE(g_state.local);
+	DEBUG_INITIALISE(instance->state->local);
 	DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 	service = find_service_for_instance(instance, args->handle);
 	if (!service)
@@ -435,7 +435,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 	int remove;
 	int ret;
 
-	DEBUG_INITIALISE(g_state.local);
+	DEBUG_INITIALISE(instance->state->local);
 
 	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
 	if (!instance->connected)
@@ -1163,7 +1163,9 @@ vchiq_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 static int vchiq_open(struct inode *inode, struct file *file)
 {
-	struct vchiq_state *state = vchiq_get_state();
+	struct miscdevice *vchiq_miscdev = file->private_data;
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(vchiq_miscdev->parent);
+	struct vchiq_state *state = &mgmt->state;
 	struct vchiq_instance *instance;
 
 	dev_dbg(state->dev, "arm: vchiq open\n");
@@ -1196,7 +1198,7 @@ static int vchiq_open(struct inode *inode, struct file *file)
 static int vchiq_release(struct inode *inode, struct file *file)
 {
 	struct vchiq_instance *instance = file->private_data;
-	struct vchiq_state *state = vchiq_get_state();
+	struct vchiq_state *state = instance->state;
 	struct vchiq_service *service;
 	int ret = 0;
 	int i;
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index e9cac8f3f744..3f0c1a0d1c17 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -26,6 +26,7 @@
 #include <media/videobuf2-vmalloc.h>
 
 #include "../include/linux/raspberrypi/vchiq.h"
+#include "../interface/vchiq_arm/vchiq_arm.h"
 #include "mmal-common.h"
 #include "mmal-vchiq.h"
 #include "mmal-msg.h"
@@ -1851,7 +1852,7 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 }
 EXPORT_SYMBOL_GPL(vchiq_mmal_finalise);
 
-int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
+int vchiq_mmal_init(struct device *dev, struct vchiq_mmal_instance **out_instance)
 {
 	int status;
 	int err = -ENODEV;
@@ -1864,6 +1865,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 		.callback		= mmal_service_callback,
 		.userdata		= NULL,
 	};
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(dev->parent);
 
 	/* compile time checks to ensure structure size as they are
 	 * directly (de)serialised from memory.
@@ -1879,7 +1881,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 	BUILD_BUG_ON(sizeof(struct mmal_port) != 64);
 
 	/* create a vchi instance */
-	status = vchiq_initialise(&vchiq_instance);
+	status = vchiq_initialise(&mgmt->state, &vchiq_instance);
 	if (status) {
 		pr_err("Failed to initialise VCHI instance (status=%d)\n",
 		       status);
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 09f030919d4e..8806d7b0a08e 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -25,6 +25,7 @@
 #define MMAL_FORMAT_EXTRADATA_MAX_SIZE 128
 
 struct vchiq_mmal_instance;
+struct device;
 
 enum vchiq_mmal_es_type {
 	MMAL_ES_TYPE_UNKNOWN,     /**< Unknown elementary stream type */
@@ -95,7 +96,7 @@ struct vchiq_mmal_component {
 	u32 client_component;	/* Used to ref back to client struct */
 };
 
-int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance);
+int vchiq_mmal_init(struct device *dev, struct vchiq_mmal_instance **out_instance);
 int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance);
 
 /* Initialise a mmal component and its ports
-- 
2.43.0

