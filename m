Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687948175B
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 06:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725862517; cv=none; b=Eo2NQuN3uAITlqbJyzSKPuROrivEQ415ATehgv2NapTwX02rIOacWlZIlfMXABDXm4cO91snmv/souYwID+bolU0GJVZAXMzng0Gd7ScGlrrbQNAQ/BGPVJo/FwjEe5iiIImdHMzSPb0XPAyqCHywO7kX3Vb+cmVHewLEueJesA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725862517; c=relaxed/simple;
	bh=RWCQunbR2TavydrDaogvlJNPrKmzwa5C+JudxvineD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aw4YLJFddv40JS8UyfbHd1MXTpAhgA6sL5pSRRLbREcJVsCfTaMTzXXtTA+inUl92jDtWyPaliSXXma5rGPovgHoxr04zempa8sLUietAzGA6nZwbE2MS4DvWEfQ+EMLdUUePRns1vOuPcos/aAWnyBo1GnRp3FdlcCUs9DUuJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PojtW30f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PojtW30f"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0601F6EC;
	Mon,  9 Sep 2024 08:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725862437;
	bh=RWCQunbR2TavydrDaogvlJNPrKmzwa5C+JudxvineD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PojtW30fDrX8TfvW4qO/PT9vwx9YFtmPumQEmm2+Rf0DaI0zEEuj31o3SLIvz+g29
	 Z1mYWt1ojEf0jWNGXrT/5TGFc8GQN+ASVUu9FMteSSKRTsbO7t9Ii/vpljQ/YtYpiA
	 eWGEADry+mFutJ674q/RyYs8iP9dGxXgGCyCVR1I=
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
Subject: [PATCH v5 1/7] staging: vchiq: Factor out bulk transfer for VCHIQ_BULK_MODE_WAITING
Date: Mon,  9 Sep 2024 11:44:51 +0530
Message-ID: <20240909061457.255452-2-umang.jain@ideasonboard.com>
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

The bulk transfer is VCHIQ_BULK_MODE_WAITING is used by VCHIQ ioctl
interface. It is factored out to a separate function from
vchiq_bulk_transfer() to bulk_xfer_waiting_interruptible().

This is a part of vchiq_bulk_transfer refactoring. Each bulk mode
will have their dedicated functions to execute bulk transfers.
Each mode will be handled separately in subsequent patches.

bulk_xfer_waiting_interruptible() is suffixed with "_interruptible"
to denote that it can be interrupted when a signal is received.
-EAGAIN maybe returned in those cases, similar to what
vchiq_bulk_transfer() does.

Adjust the vchiq_irq_queue_bulk_tx_rx() in the vchiq-dev.c to call
bulk_xfer_waiting_interruptible() for waiting mode. A temporary
goto label has been introduced to jump the call execution over
vchiq_bulk_transfer() for waiting mode only. When all dedicated bulk
transfer calls are introduced, this label shall be dropped.

No function changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 53 ++++++++++++++++---
 .../interface/vchiq_arm/vchiq_core.h          |  4 ++
 .../interface/vchiq_arm/vchiq_dev.c           |  5 ++
 3 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 50af04b217f4..2239f59519be 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3023,10 +3023,6 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 		bulk_waiter->actual = 0;
 		bulk_waiter->bulk = NULL;
 		break;
-	case VCHIQ_BULK_MODE_WAITING:
-		bulk_waiter = userdata;
-		bulk = bulk_waiter->bulk;
-		goto waiting;
 	default:
 		goto error_exit;
 	}
@@ -3115,11 +3111,8 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 		state->id, service->localport, dir_char, queue->local_insert,
 		queue->remote_insert, queue->process);
 
-waiting:
 	vchiq_service_put(service);
 
-	status = 0;
-
 	if (bulk_waiter) {
 		bulk_waiter->bulk = bulk;
 		if (wait_for_completion_interruptible(&bulk_waiter->event))
@@ -3128,7 +3121,7 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 			status = -EINVAL;
 	}
 
-	return status;
+	return 0;
 
 unlock_both_error_exit:
 	mutex_unlock(&state->slot_mutex);
@@ -3143,6 +3136,50 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	return status;
 }
 
+/*
+ * This function is called by VCHIQ ioctl interface and is interruptible.
+ * It may receive -EAGAIN to indicate that a signal has been received
+ * and the call should be retried after being returned to user context.
+ */
+int
+vchiq_bulk_xfer_waiting_interruptible(struct vchiq_instance *instance,
+				      unsigned int handle, struct bulk_waiter *userdata)
+{
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
+	struct bulk_waiter *bulk_waiter;
+	int status = -EINVAL;
+
+	if (!service)
+		return -EINVAL;
+
+	if (!userdata)
+		goto error_exit;
+
+	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
+		goto error_exit;
+
+	if (vchiq_check_service(service))
+		goto error_exit;
+
+	bulk_waiter = userdata;
+
+	vchiq_service_put(service);
+
+	status = 0;
+
+	if (wait_for_completion_interruptible(&bulk_waiter->event))
+		return -EAGAIN;
+	else if (bulk_waiter->actual == VCHIQ_BULK_ACTUAL_ABORTED)
+		return -EINVAL;
+
+	return status;
+
+error_exit:
+	vchiq_service_put(service);
+
+	return status;
+}
+
 int
 vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
 		    ssize_t (*copy_callback)(void *context, void *dest,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 77cc4d7ac077..985d9ea3a06a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -470,6 +470,10 @@ vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instan
 extern void
 remote_event_pollall(struct vchiq_state *state);
 
+extern int
+vchiq_bulk_xfer_waiting_interruptible(struct vchiq_instance *instance,
+				      unsigned int handle, struct bulk_waiter *userdata);
+
 extern int
 vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *offset,
 		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mode mode,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 9cd2a64dce5e..550838d2863b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -324,6 +324,10 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		dev_dbg(service->state->dev, "arm: found bulk_waiter %pK for pid %d\n",
 			waiter, current->pid);
 		userdata = &waiter->bulk_waiter;
+
+		status = vchiq_bulk_xfer_waiting_interruptible(instance, args->handle, userdata);
+
+		goto bulk_transfer_handled;
 	} else {
 		userdata = args->userdata;
 	}
@@ -331,6 +335,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 	status = vchiq_bulk_transfer(instance, args->handle, NULL, args->data, args->size,
 				     userdata, args->mode, dir);
 
+bulk_transfer_handled:
 	if (!waiter) {
 		ret = 0;
 		goto out;
-- 
2.45.0

