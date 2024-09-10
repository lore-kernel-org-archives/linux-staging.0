Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FEB38DD3
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945045; cv=none; b=W7fQdnv3RbL9VUn7kWOK8dyuCgHQw7LkyL4jU+NhdWAvsvCtAyJjmgEovTmZhlDc4BqQRU3cq7GcS4SJ/BM2GGYMbSvdc02vg4YkwdidWNr/ZjixSwpegqjQYMBTFQQmkWrFxJqVUzCVOUzj+KxqedFAk83OfqxiH6KTY7Wqkdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945045; c=relaxed/simple;
	bh=n+1Tz1mbLRjv6y69RYTxRwpyOjjn/apW8zh0RN7YGO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRG83EoIOUcvLnpu1w9TFf+AGJy1cId8P3SOJFreH42Hfya8NqzY/QMRnTqaUqN+GsqBJ+HbH/j2L4RrXtf+arRXHB75/pusOngDrJTEbxOLdYvY6RxF6nXweEk3YNjWTB8NPwhQcwcJNf+CTinYCJfIQ+ozJqAX0OdgsNVEXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dCJuaPIv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dCJuaPIv"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30858A1A;
	Tue, 10 Sep 2024 07:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725944964;
	bh=n+1Tz1mbLRjv6y69RYTxRwpyOjjn/apW8zh0RN7YGO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dCJuaPIveTPeXCa71Yopf+OJCF6xLYyPLWzbb8Iq6wdJ1ECt7mA+TTKWvow0D7vUj
	 nNIfXPlVwK7bH6Qs35hsQ9fAviTA+lvtlaRy3Xr23W6IwmVQlmNWOBSNO22VGPDZ35
	 mLJBTmO2rl5H0Frne2ktw4ai49EOeDxEhKgc0Sm8=
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
Subject: [PATCH v6 2/7] staging: vchiq_core: Simplify vchiq_bulk_transfer()
Date: Tue, 10 Sep 2024 10:40:02 +0530
Message-ID: <20240910051007.297227-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240910051007.297227-1-umang.jain@ideasonboard.com>
References: <20240910051007.297227-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out core logic for preparing bulk data transfer(mutex locking,
waits on vchiq_bulk_queue wait-queue, initialising the bulk transfer)
out of the vchiq_bulk_transfer(). This simplifies the existing
vchiq_bulk_transfer() and makes it more readable since all the core
logic is handled in vchiq_bulk_xfer_queue_msg_interruptible(). It
will also help us to refactor vchiq_bulk_transfer() easily for different
vchiq bulk transfer modes.

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 210 ++++++++++--------
 1 file changed, 114 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2239f59519be..9c774fbd3841 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2655,6 +2655,116 @@ close_service_complete(struct vchiq_service *service, int failstate)
 	return status;
 }
 
+/*
+ * Prepares a bulk transfer to be queued. The function is interruptible and is
+ * intended to be called from user threads. It may return -EAGAIN to indicate
+ * that a signal has been received and the call should be retried after being
+ * returned to user context.
+ */
+static int
+vchiq_bulk_xfer_queue_msg_interruptible(struct vchiq_service *service,
+					void *offset, void __user *uoffset,
+					int size, void *userdata,
+					enum vchiq_bulk_mode mode,
+					enum vchiq_bulk_dir dir)
+{
+	struct vchiq_bulk_queue *queue;
+	struct vchiq_bulk *bulk;
+	struct vchiq_state *state = service->state;
+	const char dir_char = (dir == VCHIQ_BULK_TRANSMIT) ? 't' : 'r';
+	const int dir_msgtype = (dir == VCHIQ_BULK_TRANSMIT) ?
+		VCHIQ_MSG_BULK_TX : VCHIQ_MSG_BULK_RX;
+	int status = -EINVAL;
+	int payload[2];
+
+	queue = (dir == VCHIQ_BULK_TRANSMIT) ?
+		&service->bulk_tx : &service->bulk_rx;
+
+	if (mutex_lock_killable(&service->bulk_mutex))
+		return -EAGAIN;
+
+	if (queue->local_insert == queue->remove + VCHIQ_NUM_SERVICE_BULKS) {
+		VCHIQ_SERVICE_STATS_INC(service, bulk_stalls);
+		do {
+			mutex_unlock(&service->bulk_mutex);
+			if (wait_for_completion_interruptible(&service->bulk_remove_event))
+				return -EAGAIN;
+			if (mutex_lock_killable(&service->bulk_mutex))
+				return -EAGAIN;
+		} while (queue->local_insert == queue->remove +
+				VCHIQ_NUM_SERVICE_BULKS);
+	}
+
+	bulk = &queue->bulks[BULK_INDEX(queue->local_insert)];
+
+	bulk->mode = mode;
+	bulk->dir = dir;
+	bulk->userdata = userdata;
+	bulk->size = size;
+	bulk->actual = VCHIQ_BULK_ACTUAL_ABORTED;
+
+	if (vchiq_prepare_bulk_data(service->instance, bulk, offset, uoffset, size, dir))
+		goto unlock_error_exit;
+
+	/*
+	 * Ensure that the bulk data record is visible to the peer
+	 * before proceeding.
+	 */
+	wmb();
+
+	dev_dbg(state->dev, "core: %d: bt (%d->%d) %cx %x@%pad %pK\n",
+		state->id, service->localport, service->remoteport,
+		dir_char, size, &bulk->data, userdata);
+
+	/*
+	 * The slot mutex must be held when the service is being closed, so
+	 * claim it here to ensure that isn't happening
+	 */
+	if (mutex_lock_killable(&state->slot_mutex)) {
+		status = -EAGAIN;
+		goto cancel_bulk_error_exit;
+	}
+
+	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
+		goto unlock_both_error_exit;
+
+	payload[0] = lower_32_bits(bulk->data);
+	payload[1] = bulk->size;
+	status = queue_message(state,
+			       NULL,
+			       VCHIQ_MAKE_MSG(dir_msgtype,
+					      service->localport,
+					      service->remoteport),
+			       memcpy_copy_callback,
+			       &payload,
+			       sizeof(payload),
+			       QMFLAGS_IS_BLOCKING |
+			       QMFLAGS_NO_MUTEX_LOCK |
+			       QMFLAGS_NO_MUTEX_UNLOCK);
+	if (status)
+		goto unlock_both_error_exit;
+
+	queue->local_insert++;
+
+	mutex_unlock(&state->slot_mutex);
+	mutex_unlock(&service->bulk_mutex);
+
+	dev_dbg(state->dev, "core: %d: bt:%d %cx li=%x ri=%x p=%x\n",
+		state->id, service->localport, dir_char, queue->local_insert,
+		queue->remote_insert, queue->process);
+
+	return status;
+
+unlock_both_error_exit:
+	mutex_unlock(&state->slot_mutex);
+cancel_bulk_error_exit:
+	vchiq_complete_bulk(service->instance, bulk);
+unlock_error_exit:
+	mutex_unlock(&service->bulk_mutex);
+
+	return status;
+}
+
 /* Called by the slot handler */
 int
 vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
@@ -2991,15 +3101,9 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 			enum vchiq_bulk_mode mode, enum vchiq_bulk_dir dir)
 {
 	struct vchiq_service *service = find_service_by_handle(instance, handle);
-	struct vchiq_bulk_queue *queue;
-	struct vchiq_bulk *bulk;
-	struct vchiq_state *state;
 	struct bulk_waiter *bulk_waiter = NULL;
-	const char dir_char = (dir == VCHIQ_BULK_TRANSMIT) ? 't' : 'r';
-	const int dir_msgtype = (dir == VCHIQ_BULK_TRANSMIT) ?
-		VCHIQ_MSG_BULK_TX : VCHIQ_MSG_BULK_RX;
+	struct vchiq_bulk *bulk;
 	int status = -EINVAL;
-	int payload[2];
 
 	if (!service)
 		goto error_exit;
@@ -3027,89 +3131,10 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 		goto error_exit;
 	}
 
-	state = service->state;
-
-	queue = (dir == VCHIQ_BULK_TRANSMIT) ?
-		&service->bulk_tx : &service->bulk_rx;
-
-	if (mutex_lock_killable(&service->bulk_mutex)) {
-		status = -EAGAIN;
-		goto error_exit;
-	}
-
-	if (queue->local_insert == queue->remove + VCHIQ_NUM_SERVICE_BULKS) {
-		VCHIQ_SERVICE_STATS_INC(service, bulk_stalls);
-		do {
-			mutex_unlock(&service->bulk_mutex);
-			if (wait_for_completion_interruptible(&service->bulk_remove_event)) {
-				status = -EAGAIN;
-				goto error_exit;
-			}
-			if (mutex_lock_killable(&service->bulk_mutex)) {
-				status = -EAGAIN;
-				goto error_exit;
-			}
-		} while (queue->local_insert == queue->remove +
-				VCHIQ_NUM_SERVICE_BULKS);
-	}
-
-	bulk = &queue->bulks[BULK_INDEX(queue->local_insert)];
-
-	bulk->mode = mode;
-	bulk->dir = dir;
-	bulk->userdata = userdata;
-	bulk->size = size;
-	bulk->actual = VCHIQ_BULK_ACTUAL_ABORTED;
-
-	if (vchiq_prepare_bulk_data(instance, bulk, offset, uoffset, size, dir))
-		goto unlock_error_exit;
-
-	/*
-	 * Ensure that the bulk data record is visible to the peer
-	 * before proceeding.
-	 */
-	wmb();
-
-	dev_dbg(state->dev, "core: %d: bt (%d->%d) %cx %x@%pad %pK\n",
-		state->id, service->localport, service->remoteport,
-		dir_char, size, &bulk->data, userdata);
-
-	/*
-	 * The slot mutex must be held when the service is being closed, so
-	 * claim it here to ensure that isn't happening
-	 */
-	if (mutex_lock_killable(&state->slot_mutex)) {
-		status = -EAGAIN;
-		goto cancel_bulk_error_exit;
-	}
-
-	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
-		goto unlock_both_error_exit;
-
-	payload[0] = lower_32_bits(bulk->data);
-	payload[1] = bulk->size;
-	status = queue_message(state,
-			       NULL,
-			       VCHIQ_MAKE_MSG(dir_msgtype,
-					      service->localport,
-					      service->remoteport),
-			       memcpy_copy_callback,
-			       &payload,
-			       sizeof(payload),
-			       QMFLAGS_IS_BLOCKING |
-			       QMFLAGS_NO_MUTEX_LOCK |
-			       QMFLAGS_NO_MUTEX_UNLOCK);
+	status = vchiq_bulk_xfer_queue_msg_interruptible(service, offset, uoffset,
+							 size, userdata, mode, dir);
 	if (status)
-		goto unlock_both_error_exit;
-
-	queue->local_insert++;
-
-	mutex_unlock(&state->slot_mutex);
-	mutex_unlock(&service->bulk_mutex);
-
-	dev_dbg(state->dev, "core: %d: bt:%d %cx li=%x ri=%x p=%x\n",
-		state->id, service->localport, dir_char, queue->local_insert,
-		queue->remote_insert, queue->process);
+		goto error_exit;
 
 	vchiq_service_put(service);
 
@@ -3123,13 +3148,6 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 
 	return 0;
 
-unlock_both_error_exit:
-	mutex_unlock(&state->slot_mutex);
-cancel_bulk_error_exit:
-	vchiq_complete_bulk(service->instance, bulk);
-unlock_error_exit:
-	mutex_unlock(&service->bulk_mutex);
-
 error_exit:
 	if (service)
 		vchiq_service_put(service);
-- 
2.45.0

