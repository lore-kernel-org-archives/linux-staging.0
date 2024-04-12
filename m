Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442194D9F4
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908718; cv=none; b=DmidpjDEImxq309EKVN5xIL8BNY0B/dlW0nD8ThfJz8+pXVp+0Cgz+jcC13f3GvwXW9cC0MP9AMI7sVrccIIWljQ+fgVflJtAyl2V+iTKfqSc3H0efptHEM/GqLDT+Rg1xC8SRGYrpDWecygOF77/RBi/PeWAmA+K+Y4Pz8KxWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908718; c=relaxed/simple;
	bh=oSd8FgLAzrxy4HVJJK/hJILwVy6UndE6/5r4G08WSxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEo+3ypMQyHFWS7Y8/m3x+ZS2hSTq7ctmQ+9ioyEsv69p1pCr2b4tQC+hbHgoxscPh58OADhXwHte44wWfIbJnEn/4aAfdyegOnszgQtJJj8w6295bf7E6FAPeSQmQ5jnTuBlqLb20v7c14C9N3PGpFIH+aQIuAg32CliiW/s/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JuAyg9rF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JuAyg9rF"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FA048E1;
	Fri, 12 Apr 2024 09:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908671;
	bh=oSd8FgLAzrxy4HVJJK/hJILwVy6UndE6/5r4G08WSxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JuAyg9rFskGBq5F7Yu/Uffi6lz4U3mSAUUoGBkQQfSgHAEDnU8I1wmoifKgHhh+bh
	 rI13YHZx7C9up0zOYzVAM0qyeURoE8aXjE2niuR1xHMHDxAy/GHRENYH00jJfmyvR3
	 Y4ECij8RvqIu7E0Z920+vmezsSg5mmmPaaOViJAk=
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
Subject: [PATCH v5 10/11] staging: vc04_services: Move global g_state to vchiq_state
Date: Fri, 12 Apr 2024 13:27:42 +0530
Message-ID: <20240412075743.60712-11-umang.jain@ideasonboard.com>
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
 .../bcm2835-audio/bcm2835-vchiq.c             |  5 ++-
 .../bcm2835-camera/bcm2835-camera.c           |  4 +--
 .../include/linux/raspberrypi/vchiq.h         |  4 ++-
 drivers/staging/vc04_services/interface/TODO  |  8 -----
 .../interface/vchiq_arm/vchiq_arm.c           | 36 +++++--------------
 .../interface/vchiq_arm/vchiq_arm.h           |  7 ++--
 .../interface/vchiq_arm/vchiq_core.c          |  2 +-
 .../interface/vchiq_arm/vchiq_core.h          |  2 +-
 .../interface/vchiq_arm/vchiq_debugfs.c       |  5 ++-
 .../interface/vchiq_arm/vchiq_dev.c           | 10 +++---
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  6 ++--
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  3 +-
 12 files changed, 37 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index d74110ca17ab..133ed15f3dbc 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -7,6 +7,8 @@
 #include "bcm2835.h"
 #include "vc_vchi_audioserv_defs.h"
 
+#include "../interface/vchiq_arm/vchiq_arm.h"
+
 struct bcm2835_audio_instance {
 	struct device *dev;
 	unsigned int service_handle;
@@ -175,10 +177,11 @@ static void vc_vchi_audio_deinit(struct bcm2835_audio_instance *instance)
 
 int bcm2835_new_vchi_ctx(struct device *dev, struct bcm2835_vchi_ctx *vchi_ctx)
 {
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(dev->parent);
 	int ret;
 
 	/* Initialize and create a VCHI connection */
-	ret = vchiq_initialise(&vchi_ctx->instance);
+	ret = vchiq_initialise(&mgmt->state, &vchi_ctx->instance);
 	if (ret) {
 		dev_err(dev, "failed to initialise VCHI instance (ret=%d)\n",
 			ret);
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
index 4bdd383a060c..502ddc0f6e46 100644
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
@@ -1026,9 +1022,10 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	       void *bulk_userdata)
 {
 	struct vchiq_completion_data_kernel *completion;
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(instance->state->dev);
 	int insert;
 
-	DEBUG_INITIALISE(g_state.local);
+	DEBUG_INITIALISE(mgmt->state.local);
 
 	insert = instance->completion_insert;
 	while ((insert - instance->completion_remove) >= MAX_COMPLETIONS) {
@@ -1091,11 +1088,12 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
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
 
@@ -1200,9 +1198,8 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 		bulk_userdata);
 }
 
-void vchiq_dump_platform_instances(struct seq_file *f)
+void vchiq_dump_platform_instances(struct vchiq_state *state, struct seq_file *f)
 {
-	struct vchiq_state *state = vchiq_get_state();
 	int i;
 
 	if (!state)
@@ -1277,23 +1274,6 @@ void vchiq_dump_platform_service_state(struct seq_file *f,
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
@@ -1327,7 +1307,7 @@ vchiq_keepalive_thread_func(void *v)
 		.version_min = KEEPALIVE_VER_MIN
 	};
 
-	ret = vchiq_initialise(&instance);
+	ret = vchiq_initialise(state, &instance);
 	if (ret) {
 		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n", __func__, ret);
 		goto exit;
@@ -1775,7 +1755,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	mgmt->info = info;
 	platform_set_drvdata(pdev, mgmt);
 
-	err = vchiq_platform_init(pdev, &g_state);
+	err = vchiq_platform_init(pdev, &mgmt->state);
 	if (err)
 		goto failed_platform_init;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 127e2d6b1d51..fd1b9d3555ce 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -52,6 +52,8 @@ struct vchiq_drv_mgmt {
 	unsigned int fragments_size;
 
 	void __iomem *regs;
+
+	struct vchiq_state state;
 };
 
 struct user_service {
@@ -98,11 +100,6 @@ struct vchiq_instance {
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
index 52a11c743bd6..3397365e551e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3505,7 +3505,7 @@ void vchiq_dump_state(struct seq_file *f, struct vchiq_state *state)
 
 	vchiq_dump_shared_state(f, state, state->remote, "Remote");
 
-	vchiq_dump_platform_instances(f);
+	vchiq_dump_platform_instances(state, f);
 
 	for (i = 0; i < state->unused_service; i++) {
 		struct vchiq_service *service = find_service_by_port(state, i);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 96299e2a2984..8af209e34fb2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -527,7 +527,7 @@ void remote_event_signal(struct vchiq_state *state, struct remote_event *event);
 
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
index 680961a7c61b..fca920d41e4f 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -26,6 +26,7 @@
 #include <media/videobuf2-vmalloc.h>
 
 #include "../include/linux/raspberrypi/vchiq.h"
+#include "../interface/vchiq_arm/vchiq_arm.h"
 #include "mmal-common.h"
 #include "mmal-vchiq.h"
 #include "mmal-msg.h"
@@ -1852,7 +1853,7 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 }
 EXPORT_SYMBOL_GPL(vchiq_mmal_finalise);
 
-int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
+int vchiq_mmal_init(struct device *dev, struct vchiq_mmal_instance **out_instance)
 {
 	int status;
 	int err = -ENODEV;
@@ -1865,6 +1866,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 		.callback		= mmal_service_callback,
 		.userdata		= NULL,
 	};
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(dev->parent);
 
 	/* compile time checks to ensure structure size as they are
 	 * directly (de)serialised from memory.
@@ -1880,7 +1882,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
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
2.44.0

