Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC517623C
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 06:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725862521; cv=none; b=SlcCyxaEy/k9CHgCgcwoa5pvBROgsyGiLoUAuYnWbb0cThyT5Z0hocvlaH84vJoVR6hcW+BetOcPs+/Cb/VVbr7JYnduC2ONwrrQqGxKYm4Od6QpLIJJVzcet/FsdNqT8vPHOHrGs2AIKmiZKe2W3na3hL0la5Dxryz9Z8UCIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725862521; c=relaxed/simple;
	bh=VoQxp/6S507oPPDKDycPTJqAaADckOkT1SYFjp6mhiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNjJ6+LWlODf2EyPSdxmE8j8s6J8by1GbbZgjyy9wgpRxQazJkxuAa8wbNR0+tPhdQ2KoUi6KxIHBrFiTuOq66Nh/rVBI97q4yDkZv7GirRXfweTDREBg1hAu+EKdI3CYtj8B60PfpNdFNzf7RnmRn02lwEMnNhz8Te+wBv0HEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZfWfzrWt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZfWfzrWt"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A6CF8D4;
	Mon,  9 Sep 2024 08:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725862442;
	bh=VoQxp/6S507oPPDKDycPTJqAaADckOkT1SYFjp6mhiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZfWfzrWtfWXBpJP8q2VVe9aEGW/Wz0nBOk53RKSnRi6NequBc1V7KZZUbqOsK28L6
	 cmBmjm3alJv9CH1DPf49TK0k7BvlIwI6SWc6LxHm9ENyu/Z9Huo5uX5ZzX1bhlWHGA
	 TFxg1yoaQn6PUvmxlNcbp0RtOvQJ5HuOL1DOtI5M=
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
Subject: [PATCH v5 3/7] staging: vchiq_core: Factor out bulk transfer for blocking mode
Date: Mon,  9 Sep 2024 11:44:53 +0530
Message-ID: <20240909061457.255452-4-umang.jain@ideasonboard.com>
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

Factor out bulk transfer for blocking mode into a separate dedicated
function bulk_xfer_blocking_interruptible(). It is suffixed by
"_interruptible" to denote that it can be interrupted and -EAGAIN
can be returned. It would be up to the users of the function to retry
the call in those cases.

Adjust the calls to vchiq-dev.c ioctl interface and vchiq_arm.c
for blocking bulk transfers.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  5 +-
 .../interface/vchiq_arm/vchiq_core.c          | 53 ++++++++++++++++---
 .../interface/vchiq_arm/vchiq_core.h          |  5 ++
 .../interface/vchiq_arm/vchiq_dev.c           |  6 +++
 4 files changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c4d97dbf6ba8..688c9b1be868 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -968,9 +968,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 			return -ENOMEM;
 	}
 
-	ret = vchiq_bulk_transfer(instance, handle, data, NULL, size,
-				  &waiter->bulk_waiter,
-				  VCHIQ_BULK_MODE_BLOCKING, dir);
+	ret = vchiq_bulk_xfer_blocking_interruptible(instance, handle, data, NULL, size,
+						     &waiter->bulk_waiter, dir);
 	if ((ret != -EAGAIN) || fatal_signal_pending(current) || !waiter->bulk_waiter.bulk) {
 		struct vchiq_bulk *bulk = waiter->bulk_waiter.bulk;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index f36044bab194..ee247b423074 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2985,6 +2985,37 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 	return status;
 }
 
+int
+vchiq_bulk_xfer_blocking_interruptible(struct vchiq_instance *instance, unsigned int handle,
+				       void *offset, void __user *uoffset, int size,
+				       void __user *userdata, enum vchiq_bulk_dir dir)
+{
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
+	enum vchiq_bulk_mode mode = VCHIQ_BULK_MODE_BLOCKING;
+	int status = -EINVAL;
+
+	if (!service)
+		return -EINVAL;
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
+
+	status = vchiq_bulk_xfer_queue_msg_interruptible(service, offset, uoffset, size,
+							 userdata, mode, dir);
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
@@ -3018,12 +3049,6 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	case VCHIQ_BULK_MODE_NOCALLBACK:
 	case VCHIQ_BULK_MODE_CALLBACK:
 		break;
-	case VCHIQ_BULK_MODE_BLOCKING:
-		bulk_waiter = userdata;
-		init_completion(&bulk_waiter->event);
-		bulk_waiter->actual = 0;
-		bulk_waiter->bulk = NULL;
-		break;
 	default:
 		goto error_exit;
 	}
@@ -3218,6 +3243,7 @@ vchiq_bulk_xfer_queue_msg_interruptible(struct vchiq_service *service,
 					enum vchiq_bulk_dir dir)
 {
 	struct vchiq_bulk_queue *queue;
+	struct bulk_waiter *bulk_waiter = NULL;
 	struct vchiq_bulk *bulk;
 	struct vchiq_state *state = service->state;
 	const char dir_char = (dir == VCHIQ_BULK_TRANSMIT) ? 't' : 'r';
@@ -3226,6 +3252,13 @@ vchiq_bulk_xfer_queue_msg_interruptible(struct vchiq_service *service,
 	int status = -EINVAL;
 	int payload[2];
 
+	if (mode == VCHIQ_BULK_MODE_BLOCKING) {
+		bulk_waiter = userdata;
+		init_completion(&bulk_waiter->event);
+		bulk_waiter->actual = 0;
+		bulk_waiter->bulk = NULL;
+	}
+
 	queue = (dir == VCHIQ_BULK_TRANSMIT) ?
 		&service->bulk_tx : &service->bulk_rx;
 
@@ -3302,6 +3335,14 @@ vchiq_bulk_xfer_queue_msg_interruptible(struct vchiq_service *service,
 		state->id, service->localport, dir_char, queue->local_insert,
 		queue->remote_insert, queue->process);
 
+        if (bulk_waiter) {
+                bulk_waiter->bulk = bulk;
+                if (wait_for_completion_interruptible(&bulk_waiter->event))
+                        status = -EAGAIN;
+                else if (bulk_waiter->actual == VCHIQ_BULK_ACTUAL_ABORTED)
+                        status = -EINVAL;
+        }
+
 	return status;
 
 unlock_both_error_exit:
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 985d9ea3a06a..2dd89101c1c6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -474,6 +474,11 @@ extern int
 vchiq_bulk_xfer_waiting_interruptible(struct vchiq_instance *instance,
 				      unsigned int handle, struct bulk_waiter *userdata);
 
+extern int
+vchiq_bulk_xfer_blocking_interruptible(struct vchiq_instance *instance, unsigned int handle,
+				       void *offset, void __user *uoffset, int size,
+				       void __user *userdata, enum vchiq_bulk_dir dir);
+
 extern int
 vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *offset,
 		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mode mode,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 550838d2863b..830633f2326b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -304,6 +304,12 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		}
 
 		userdata = &waiter->bulk_waiter;
+
+		status = vchiq_bulk_xfer_blocking_interruptible(instance, args->handle,
+								NULL, args->data, args->size,
+								userdata, dir);
+
+		goto bulk_transfer_handled;
 	} else if (args->mode == VCHIQ_BULK_MODE_WAITING) {
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_for_each_entry(iter, &instance->bulk_waiter_list,
-- 
2.45.0

