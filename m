Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5516F909
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 06:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725862523; cv=none; b=P9n6rZ20WZhGD2LboA9DePn3Uyo0GtvG2PizQtZ6OMfzuUtbhZmmjet+4gfwmbdTZkDalFR9H1V9UFFCcTPIvT2VkvmphTlo3PIVWIg4Wfi/MVuquOagdr0eGOQshAnH2SzXKEzXBVTF6mwLGTeAksXNH49dFkVAZjgiOPtNvso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725862523; c=relaxed/simple;
	bh=74ftEbpFpwoitQwpHFao76mMyio+qquE8obhEouWYUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY0O7whUtTI9YuhjaLsxdSzFFTZ6ACHQa0+7IeR/saENAWRyZNJjh/DmlgpSGzIYvxNh6WSu02OFi0FQ/9YmcG+ZFSqd7yOiBy5h/M2LveBYWrPBVA0g6evgTzRFbj9T6D8O/vUqygCNkUtXz0nZZPgDbnn6RGuFGTtAX+l8T6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iTxZJXi9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iTxZJXi9"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BB6DD4A;
	Mon,  9 Sep 2024 08:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725862444;
	bh=74ftEbpFpwoitQwpHFao76mMyio+qquE8obhEouWYUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iTxZJXi95o7Lfk+3R7y+a0+fs9bU0PiFO2Sn3RBsWJ7SX9cu4Qx4IJs5UUubwRz3L
	 X8T8aIuaddmRMdI2C4NS/35vykQSglmbfGfyJ8RLPmgsRjiEwdZY4K7mw5aMfsJc4E
	 Z9EGU4iIsahFvscUwH0V6iO5536kqeeTtRqvdkiY=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v5 4/7] staging: vchiq_core: Factor out bulk transfer for (no/)callback mode
Date: Mon,  9 Sep 2024 11:44:54 +0530
Message-ID: <20240909061457.255452-5-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240909061457.255452-1-umang.jain@ideasonboard.com>
References: <20240909061457.255452-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out bulk transfer for VCHIQ_BULK_MODE_NOCALLBACK and
VCHIQ_BULK_MODE_CALLBACK mode into a separate dedicated function
bulk_xfer_callback_interruptible(). It is suffixed by "_interruptible"
to denote that it can be interrupted and -EAGAIN can be returned. It
would be up to the users of the function to retry the call in those cases.

bulk_xfer_callback_interruptible() also takes in 'mode' parameter to
differentiate between VCHIQ_BULK_MODE_NOCALLBACK and
VCHIQ_BULK_MODE_CALLBACK, which then is directly passed to
vchiq_bulk_xfer_queue_msg_interruptible() inside the function.

Adjust the calls to vchiq-dev.c ioctl interface and vchiq_arm.c
for the respective bulk transfers.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 15 ++++----
 .../interface/vchiq_arm/vchiq_core.c          | 34 +++++++++++++++++++
 .../interface/vchiq_arm/vchiq_core.h          |  6 ++++
 .../interface/vchiq_arm/vchiq_dev.c           |  6 ++++
 4 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 688c9b1be868..3dbeffc650d3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -857,10 +857,10 @@ vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int handle, const
 		switch (mode) {
 		case VCHIQ_BULK_MODE_NOCALLBACK:
 		case VCHIQ_BULK_MODE_CALLBACK:
-			ret = vchiq_bulk_transfer(instance, handle,
-						  (void *)data, NULL,
-						  size, userdata, mode,
-						  VCHIQ_BULK_TRANSMIT);
+			ret = vchiq_bulk_xfer_callback_interruptible(instance, handle,
+								     (void *)data, NULL,
+								     size, mode, userdata,
+								     VCHIQ_BULK_TRANSMIT);
 			break;
 		case VCHIQ_BULK_MODE_BLOCKING:
 			ret = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
@@ -895,9 +895,10 @@ int vchiq_bulk_receive(struct vchiq_instance *instance, unsigned int handle,
 		switch (mode) {
 		case VCHIQ_BULK_MODE_NOCALLBACK:
 		case VCHIQ_BULK_MODE_CALLBACK:
-			ret = vchiq_bulk_transfer(instance, handle, data, NULL,
-						  size, userdata,
-						  mode, VCHIQ_BULK_RECEIVE);
+			ret = vchiq_bulk_xfer_callback_interruptible(instance, handle,
+								     (void *)data, NULL,
+								     size, mode, userdata,
+								     VCHIQ_BULK_RECEIVE);
 			break;
 		case VCHIQ_BULK_MODE_BLOCKING:
 			ret = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index ee247b423074..01955ce81423 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3016,6 +3016,40 @@ vchiq_bulk_xfer_blocking_interruptible(struct vchiq_instance *instance, unsigned
 	return status;
 }
 
+int
+vchiq_bulk_xfer_callback_interruptible(struct vchiq_instance *instance, unsigned int handle,
+				       void *offset, void __user *uoffset, int size,
+				       enum vchiq_bulk_mode mode, void *userdata,
+				       enum vchiq_bulk_dir dir)
+{
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
+	int status = -EINVAL;
+
+	if (!service)
+		return -EINVAL;
+
+	if (mode != VCHIQ_BULK_MODE_CALLBACK &&
+	    mode != VCHIQ_BULK_MODE_NOCALLBACK)
+		goto error_exit;
+
+	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
+		goto error_exit;
+
+	if (!offset && !uoffset)
+		goto error_exit;
+
+	if (vchiq_check_service(service))
+		goto error_exit;
+
+	status = vchiq_bulk_xfer_queue_msg_interruptible(service, offset, uoffset,
+							 size, userdata, mode, dir);
+
+error_exit:
+	vchiq_service_put(service);
+
+	return status;
+}
+
 /*
  * This function may be called by kernel threads or user threads.
  * User threads may receive -EAGAIN to indicate that a signal has been
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 2dd89101c1c6..9c8c076eaaeb 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -479,6 +479,12 @@ vchiq_bulk_xfer_blocking_interruptible(struct vchiq_instance *instance, unsigned
 				       void *offset, void __user *uoffset, int size,
 				       void __user *userdata, enum vchiq_bulk_dir dir);
 
+extern int
+vchiq_bulk_xfer_callback_interruptible(struct vchiq_instance *instance, unsigned int handle,
+				       void *offset, void __user *uoffset, int size,
+				       enum vchiq_bulk_mode mode, void *userdata,
+				       enum vchiq_bulk_dir dir);
+
 extern int
 vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *offset,
 		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mode mode,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 830633f2326b..169a2ffda996 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -336,6 +336,12 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		goto bulk_transfer_handled;
 	} else {
 		userdata = args->userdata;
+
+		status = vchiq_bulk_xfer_callback_interruptible(instance, args->handle, NULL,
+								args->data, args->size,
+								args->mode, userdata, dir);
+
+		goto bulk_transfer_handled;
 	}
 
 	status = vchiq_bulk_transfer(instance, args->handle, NULL, args->data, args->size,
-- 
2.45.0

