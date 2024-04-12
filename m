Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7E43218B
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908710; cv=none; b=gxNGkx+TwZM8DtPYetiW/pkZ89L6oR1YybK4AprQAlAkDj6JHsmS/AFC0M5meaJXN2nFYwHLoOHlyZkV/FcERgWpOKqHycGxW8mG+ET/kwPDR4qotQ7fp9VGay6ntAU0yEnh0/HR6c46QoNQTQGrI6tzTGj9ky/jj193lhwKPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908710; c=relaxed/simple;
	bh=2Fiao31xG3RaV1xt6/xKQ3FrXJfhlFB36Yzhy+WeHx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Phm0xY8QCV/r1Av9ahqlo2RTCWkNHRaMMnm/HtJAyxLKut9AvVs7as1EfyuAcRT4+lnJGTunp0rdKFA0V0UcGngZhKbMx9UokdZUt+5e7xZO2Wdn+166aWYSShMu7w6/svHI3pneUmE3a6mjdmfgBD6b+EO4TAiayDTJabOch+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qf4nuSPn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qf4nuSPn"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76DD68E1;
	Fri, 12 Apr 2024 09:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908663;
	bh=2Fiao31xG3RaV1xt6/xKQ3FrXJfhlFB36Yzhy+WeHx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qf4nuSPnbgQ2uDijD7t/6z8i+QYL4KEqnvt0rVUd+V/mYnW62cZin5GDxAXdgmOV2
	 FX1zzqBJwGmZ+4G5A5BO5qRCTFHFWrNIvN87m/z0RaMa4tOqxz8zJDzG+6IEgSVwlH
	 cWgNKuSR8u0+ORU2v/ohodlq4RHHent+jPrHVDVA=
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
Subject: [PATCH v5 08/11] staging: vc04_services: Move spinlocks to vchiq_state
Date: Fri, 12 Apr 2024 13:27:40 +0530
Message-ID: <20240412075743.60712-9-umang.jain@ideasonboard.com>
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

The msg_queue_spinlock, quota_spinlock and bulk_waiter_spinlock
are allocated globally. Instead move them to struct vchiq_state
and initialise them in vchiq_init_state().

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 17 ++++----
 .../interface/vchiq_arm/vchiq_arm.h           |  1 -
 .../interface/vchiq_arm/vchiq_core.c          | 39 ++++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  7 ++++
 .../interface/vchiq_arm/vchiq_dev.c           | 24 ++++++------
 5 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9fc98411a2b8..4bdd383a060c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -59,7 +59,6 @@
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
-DEFINE_SPINLOCK(msg_queue_spinlock);
 struct vchiq_state g_state;
 
 /*
@@ -985,9 +984,9 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 				 * This is not a retry of the previous one.
 				 * Cancel the signal when the transfer completes.
 				 */
-				spin_lock(&bulk_waiter_spinlock);
+				spin_lock(&service->state->bulk_waiter_spinlock);
 				bulk->userdata = NULL;
-				spin_unlock(&bulk_waiter_spinlock);
+				spin_unlock(&service->state->bulk_waiter_spinlock);
 			}
 		}
 	} else {
@@ -1004,9 +1003,9 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 
 		if (bulk) {
 			/* Cancel the signal when the transfer completes. */
-			spin_lock(&bulk_waiter_spinlock);
+			spin_lock(&service->state->bulk_waiter_spinlock);
 			bulk->userdata = NULL;
-			spin_unlock(&bulk_waiter_spinlock);
+			spin_unlock(&service->state->bulk_waiter_spinlock);
 		}
 		kfree(waiter);
 	} else {
@@ -1127,10 +1126,10 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 		reason, header, instance, bulk_userdata);
 
 	if (header && user_service->is_vchi) {
-		spin_lock(&msg_queue_spinlock);
+		spin_lock(&service->state->msg_queue_spinlock);
 		while (user_service->msg_insert ==
 			(user_service->msg_remove + MSG_QUEUE_SIZE)) {
-			spin_unlock(&msg_queue_spinlock);
+			spin_unlock(&service->state->msg_queue_spinlock);
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
 			dev_dbg(service->state->dev, "arm: msg queue full\n");
@@ -1167,7 +1166,7 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 				return -EINVAL;
 			}
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-			spin_lock(&msg_queue_spinlock);
+			spin_lock(&service->state->msg_queue_spinlock);
 		}
 
 		user_service->msg_queue[user_service->msg_insert &
@@ -1186,7 +1185,7 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 			skip_completion = true;
 		}
 
-		spin_unlock(&msg_queue_spinlock);
+		spin_unlock(&service->state->msg_queue_spinlock);
 		complete(&user_service->insert_event);
 
 		header = NULL;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 10c1bdc50faf..127e2d6b1d51 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -98,7 +98,6 @@ struct vchiq_instance {
 	struct vchiq_debugfs_node debugfs_node;
 };
 
-extern spinlock_t msg_queue_spinlock;
 extern struct vchiq_state g_state;
 
 extern struct vchiq_state *
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8c339aebbc99..52a11c743bd6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -149,9 +149,6 @@ static inline void check_sizes(void)
 	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_MAX_SERVICES);
 }
 
-DEFINE_SPINLOCK(bulk_waiter_spinlock);
-static DEFINE_SPINLOCK(quota_spinlock);
-
 static unsigned int handle_seq;
 
 static const char *const srvstate_names[] = {
@@ -724,11 +721,11 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 	struct vchiq_service_quota *quota = &state->service_quotas[port];
 	int count;
 
-	spin_lock(&quota_spinlock);
+	spin_lock(&state->quota_spinlock);
 	count = quota->message_use_count;
 	if (count > 0)
 		quota->message_use_count = count - 1;
-	spin_unlock(&quota_spinlock);
+	spin_unlock(&state->quota_spinlock);
 
 	if (count == quota->message_quota) {
 		/*
@@ -747,11 +744,11 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 		/* Set the found bit for this service */
 		BITSET_SET(service_found, port);
 
-		spin_lock(&quota_spinlock);
+		spin_lock(&state->quota_spinlock);
 		count = quota->slot_use_count;
 		if (count > 0)
 			quota->slot_use_count = count - 1;
-		spin_unlock(&quota_spinlock);
+		spin_unlock(&state->quota_spinlock);
 
 		if (count > 0) {
 			/*
@@ -837,11 +834,11 @@ process_free_queue(struct vchiq_state *state, u32 *service_found,
 		if (data_found) {
 			int count;
 
-			spin_lock(&quota_spinlock);
+			spin_lock(&state->quota_spinlock);
 			count = state->data_use_count;
 			if (count > 0)
 				state->data_use_count = count - 1;
-			spin_unlock(&quota_spinlock);
+			spin_unlock(&state->quota_spinlock);
 			if (count == state->data_quota)
 				complete(&state->data_quota_event);
 		}
@@ -940,7 +937,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 
 		quota = &state->service_quotas[service->localport];
 
-		spin_lock(&quota_spinlock);
+		spin_lock(&state->quota_spinlock);
 
 		/*
 		 * Ensure this service doesn't use more than its quota of
@@ -955,14 +952,14 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		while ((tx_end_index != state->previous_data_index) &&
 		       (state->data_use_count == state->data_quota)) {
 			VCHIQ_STATS_INC(state, data_stalls);
-			spin_unlock(&quota_spinlock);
+			spin_unlock(&state->quota_spinlock);
 			mutex_unlock(&state->slot_mutex);
 
 			if (wait_for_completion_interruptible(&state->data_quota_event))
 				return -EAGAIN;
 
 			mutex_lock(&state->slot_mutex);
-			spin_lock(&quota_spinlock);
+			spin_lock(&state->quota_spinlock);
 			tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(state->local_tx_pos + stride - 1);
 			if ((tx_end_index == state->previous_data_index) ||
 			    (state->data_use_count < state->data_quota)) {
@@ -975,7 +972,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		while ((quota->message_use_count == quota->message_quota) ||
 		       ((tx_end_index != quota->previous_tx_index) &&
 			(quota->slot_use_count == quota->slot_quota))) {
-			spin_unlock(&quota_spinlock);
+			spin_unlock(&state->quota_spinlock);
 			dev_dbg(state->dev,
 				"core: %d: qm:%d %s,%zx - quota stall (msg %d, slot %d)\n",
 				state->id, service->localport, msg_type_str(type), size,
@@ -993,11 +990,11 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 				mutex_unlock(&state->slot_mutex);
 				return -EHOSTDOWN;
 			}
-			spin_lock(&quota_spinlock);
+			spin_lock(&state->quota_spinlock);
 			tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(state->local_tx_pos + stride - 1);
 		}
 
-		spin_unlock(&quota_spinlock);
+		spin_unlock(&state->quota_spinlock);
 	}
 
 	header = reserve_space(state, stride, flags & QMFLAGS_IS_BLOCKING);
@@ -1040,7 +1037,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 				   header->data,
 				   min_t(size_t, 16, callback_result));
 
-		spin_lock(&quota_spinlock);
+		spin_lock(&state->quota_spinlock);
 		quota->message_use_count++;
 
 		tx_end_index =
@@ -1066,7 +1063,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			slot_use_count = 0;
 		}
 
-		spin_unlock(&quota_spinlock);
+		spin_unlock(&state->quota_spinlock);
 
 		if (slot_use_count)
 			dev_dbg(state->dev, "core: %d: qm:%d %s,%zx - slot_use->%d (hdr %p)\n",
@@ -1322,13 +1319,13 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 			if (bulk->mode == VCHIQ_BULK_MODE_BLOCKING) {
 				struct bulk_waiter *waiter;
 
-				spin_lock(&bulk_waiter_spinlock);
+				spin_lock(&service->state->bulk_waiter_spinlock);
 				waiter = bulk->userdata;
 				if (waiter) {
 					waiter->actual = bulk->actual;
 					complete(&waiter->event);
 				}
-				spin_unlock(&bulk_waiter_spinlock);
+				spin_unlock(&service->state->bulk_waiter_spinlock);
 			} else if (bulk->mode == VCHIQ_BULK_MODE_CALLBACK) {
 				enum vchiq_reason reason =
 						get_bulk_reason(bulk);
@@ -2169,6 +2166,10 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, s
 	mutex_init(&state->sync_mutex);
 	mutex_init(&state->bulk_transfer_mutex);
 
+	spin_lock_init(&state->msg_queue_spinlock);
+	spin_lock_init(&state->bulk_waiter_spinlock);
+	spin_lock_init(&state->quota_spinlock);
+
 	init_completion(&state->slot_available_event);
 	init_completion(&state->slot_remove_event);
 	init_completion(&state->data_quota_event);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 8ca74b12427b..96299e2a2984 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -11,6 +11,7 @@
 #include <linux/kthread.h>
 #include <linux/kref.h>
 #include <linux/rcupdate.h>
+#include <linux/spinlock_types.h>
 #include <linux/wait.h>
 
 #include "../../include/linux/raspberrypi/vchiq.h"
@@ -348,6 +349,12 @@ struct vchiq_state {
 
 	struct mutex bulk_transfer_mutex;
 
+	spinlock_t msg_queue_spinlock;
+
+	spinlock_t bulk_waiter_spinlock;
+
+	spinlock_t quota_spinlock;
+
 	/*
 	 * Indicates the byte position within the stream from where the next
 	 * message will be read. The least significant bits are an index into
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 4d9deeeb637a..739ce529a71b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -220,10 +220,10 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 		goto out;
 	}
 
-	spin_lock(&msg_queue_spinlock);
+	spin_lock(&service->state->msg_queue_spinlock);
 	if (user_service->msg_remove == user_service->msg_insert) {
 		if (!args->blocking) {
-			spin_unlock(&msg_queue_spinlock);
+			spin_unlock(&service->state->msg_queue_spinlock);
 			DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 			ret = -EWOULDBLOCK;
 			goto out;
@@ -231,14 +231,14 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 		user_service->dequeue_pending = 1;
 		ret = 0;
 		do {
-			spin_unlock(&msg_queue_spinlock);
+			spin_unlock(&service->state->msg_queue_spinlock);
 			DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 			if (wait_for_completion_interruptible(&user_service->insert_event)) {
 				dev_dbg(service->state->dev, "arm: DEQUEUE_MESSAGE interrupted\n");
 				ret = -EINTR;
 				break;
 			}
-			spin_lock(&msg_queue_spinlock);
+			spin_lock(&service->state->msg_queue_spinlock);
 		} while (user_service->msg_remove == user_service->msg_insert);
 
 		if (ret)
@@ -247,7 +247,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 
 	if (WARN_ON_ONCE((int)(user_service->msg_insert -
 			 user_service->msg_remove) < 0)) {
-		spin_unlock(&msg_queue_spinlock);
+		spin_unlock(&service->state->msg_queue_spinlock);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -255,7 +255,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 	header = user_service->msg_queue[user_service->msg_remove &
 		(MSG_QUEUE_SIZE - 1)];
 	user_service->msg_remove++;
-	spin_unlock(&msg_queue_spinlock);
+	spin_unlock(&service->state->msg_queue_spinlock);
 
 	complete(&user_service->remove_event);
 	if (!header) {
@@ -340,9 +340,9 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 	    !waiter->bulk_waiter.bulk) {
 		if (waiter->bulk_waiter.bulk) {
 			/* Cancel the signal when the transfer completes. */
-			spin_lock(&bulk_waiter_spinlock);
+			spin_lock(&service->state->bulk_waiter_spinlock);
 			waiter->bulk_waiter.bulk->userdata = NULL;
-			spin_unlock(&bulk_waiter_spinlock);
+			spin_unlock(&service->state->bulk_waiter_spinlock);
 		}
 		kfree(waiter);
 		ret = 0;
@@ -1246,7 +1246,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 			break;
 		}
 
-		spin_lock(&msg_queue_spinlock);
+		spin_lock(&service->state->msg_queue_spinlock);
 
 		while (user_service->msg_remove != user_service->msg_insert) {
 			struct vchiq_header *header;
@@ -1254,14 +1254,14 @@ static int vchiq_release(struct inode *inode, struct file *file)
 
 			header = user_service->msg_queue[m];
 			user_service->msg_remove++;
-			spin_unlock(&msg_queue_spinlock);
+			spin_unlock(&service->state->msg_queue_spinlock);
 
 			if (header)
 				vchiq_release_message(instance, service->handle, header);
-			spin_lock(&msg_queue_spinlock);
+			spin_lock(&service->state->msg_queue_spinlock);
 		}
 
-		spin_unlock(&msg_queue_spinlock);
+		spin_unlock(&service->state->msg_queue_spinlock);
 
 		vchiq_service_put(service);
 	}
-- 
2.44.0

