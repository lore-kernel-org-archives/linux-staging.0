Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66312FBC
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:26 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MauJJ-1lBx7x0rFL-00cPGn; Sat, 15 May 2021 21:11:22 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 17/20] staging: vchiq_arm: Avoid unnecessary line breaks
Date: Sat, 15 May 2021 21:10:56 +0200
Message-Id: <1621105859-30215-18-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:AFDIc99bZApuWL5MehoxI+V0Ef6SvsOcBeeCaeTpWscw5TTYGD3
 IONT5dCwk5nOUYoMZ9Bl7t27L4mpsSm4gWJqJqa/EVmtE8MYxnXG0iJ3BfIaq2wXcYi8XlA
 tUk5Wl8gUt3+fIsR8FHPdyIvZT43ZW12+n/2lvTFQAuUjEFUNal21mOO17p96cFTXh3COjN
 I6VEVRLBxi0VURyJbHN4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XmhQFWu2OoU=:nTw0AzFnr0Uh2IwJTa/Tuq
 bo2+l0gs0ysZlWKI/6xLpFTsNZX1pcLVSWpjfby7FIVr/mExijHjQaYOwoxc9XBj2dLlggFim
 eEfpxNQ/uQRj6f61T5N9M9RPQyk/c6xJgxeXKcRXqUa+yDRV742A/IlM6i6GfhoO2eganl+2X
 SCU+t+VCr6ayVug62XqYsdWvnx/FG94tX+xmFU0cRPN+qHntPv7ObwTQI4ZQaACUyZtVqRD+O
 T+QTaGVxyz1aWJ0Ref3/ZE+QPJop9W3sF2o6unE/7LVNPVLhqTJ9crc6J75P2kJq97upkSNbN
 9v9shGwVorOM/VRy1w+mMVWOla0DNUCM+4l9EXI7f/lF0sYUP1iyD9QeNk0y7zEe2GRwjFUm3
 iZb4GQGz8cN54RX3fLoglhPQdmQH7Qx6dsBe7Z/AkhZGanbQghVtcTwqALLwQS0yQFS7kof1C
 JKPz6bFzX7f1xp+IC31elS1WE9XJAQf28l9oZW34TsqMgTXK1IfYn2rT9LYs+/DWY1BnLd8kK
 T3cJOGRuGdcniiq8WcLnIk=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There are a few statements which are unnecessary broken into multiple lines.
Let's join them into a single line to improve readability.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c      | 12 ++++--------
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 18 ++++++------------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e7b5f14..344f35a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -139,8 +139,7 @@ static const char *const ioctl_names[] = {
 	"CLOSE_DELIVERED"
 };
 
-vchiq_static_assert(ARRAY_SIZE(ioctl_names) ==
-		    (VCHIQ_IOC_MAX + 1));
+vchiq_static_assert(ARRAY_SIZE(ioctl_names) == (VCHIQ_IOC_MAX + 1));
 
 static enum vchiq_status
 vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
@@ -871,8 +870,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 				break;
 			}
 			spin_lock(&msg_queue_spinlock);
-		} while (user_service->msg_remove ==
-			user_service->msg_insert);
+		} while (user_service->msg_remove == user_service->msg_insert);
 
 		if (ret)
 			goto out;
@@ -1083,8 +1081,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 	mutex_lock(&instance->completion_mutex);
 
 	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
-	while ((instance->completion_remove ==
-		instance->completion_insert)
+	while ((instance->completion_remove == instance->completion_insert)
 		&& !instance->closing) {
 		int rc;
 
@@ -1924,8 +1921,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	}
 
 	/* Release any closed services */
-	while (instance->completion_remove !=
-		instance->completion_insert) {
+	while (instance->completion_remove != instance->completion_insert) {
 		struct vchiq_completion_data_kernel *completion;
 		struct vchiq_service *service;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 0ec1c11..e3b93ed 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -685,8 +685,7 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 				spin_lock(&quota_spinlock);
 				count = quota->message_use_count;
 				if (count > 0)
-					quota->message_use_count =
-						count - 1;
+					quota->message_use_count = count - 1;
 				spin_unlock(&quota_spinlock);
 
 				if (count == quota->message_quota) {
@@ -757,8 +756,7 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 			spin_lock(&quota_spinlock);
 			count = state->data_use_count;
 			if (count > 0)
-				state->data_use_count =
-					count - 1;
+				state->data_use_count = count - 1;
 			spin_unlock(&quota_spinlock);
 			if (count == state->data_quota)
 				complete(&state->data_quota_event);
@@ -899,8 +897,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 
 		while ((quota->message_use_count == quota->message_quota) ||
 			((tx_end_index != quota->previous_tx_index) &&
-			(quota->slot_use_count ==
-				quota->slot_quota))) {
+			(quota->slot_use_count == quota->slot_quota))) {
 			spin_unlock(&quota_spinlock);
 			vchiq_log_trace(vchiq_core_log_level,
 				"%d: qm:%d %s,%zx - quota stall (msg %d, slot %d)",
@@ -1293,8 +1290,7 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 					complete(&waiter->event);
 				}
 				spin_unlock(&bulk_waiter_spinlock);
-			} else if (bulk->mode ==
-				VCHIQ_BULK_MODE_CALLBACK) {
+			} else if (bulk->mode == VCHIQ_BULK_MODE_CALLBACK) {
 				enum vchiq_reason reason =
 						get_bulk_reason(bulk);
 				status = make_service_callback(service,
@@ -2076,8 +2072,7 @@ sync_func(void *v)
 				state->id, header, size, remoteport, localport);
 
 			if ((service->remoteport == remoteport) &&
-				(service->srvstate ==
-				VCHIQ_SRVSTATE_OPENSYNC)) {
+			    (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)) {
 				if (make_service_callback(service,
 					VCHIQ_MESSAGE_AVAILABLE, header,
 					NULL) == VCHIQ_RETRY)
@@ -2211,8 +2206,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 	state->slot_queue_available = 0;
 
 	for (i = 0; i < VCHIQ_MAX_SERVICES; i++) {
-		struct vchiq_service_quota *quota =
-			&state->service_quotas[i];
+		struct vchiq_service_quota *quota = &state->service_quotas[i];
 		init_completion(&quota->quota_event);
 	}
 
-- 
2.7.4

