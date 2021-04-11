Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2A6D0E
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:28 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MekrN-1m5oKg2yRR-00ajrT; Sun, 11 Apr 2021 20:12:23 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 02/10] staging: vchiq_core: Shorten var name for service quota
Date: Sun, 11 Apr 2021 20:11:32 +0200
Message-Id: <1618164700-21150-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Vj46D3z45LP9gNDpSLlzhW2e3CZZIHK7Ch7SH2ghDIXbEFaN21t
 SRTPCivpH5Vp/QBu1xuB4WBnJ2P8mqisQoffnMw2qXUGzfJ04JCrnXDpVRo/UoGs3fDAWu1
 Qayzs4pW7ipfrM0fu6cOnJy53uoJ0MT3P2fSMHkroL7p9dsTM8Fx8rf5RyIDMCRkohjFoft
 gXMvBan/Ks08o0A0rVf3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z8eufRiGW1Y=:BDRcLqHqZCy/Ee08jZIsz+
 doSKNPAdN3k0FtQ+f7T8vL7lQZRzgRHKUC2MIhlbNsP8qC7W3P4HjRjG5T1t7+JTOU1qUqBgP
 Qda1C9OL/WGpcsIXAJTJRcJ3HoBurH6AH8rubQUh+N4boWDeZ2FoIEJmsx32eYnQJAs6B9nVi
 6D5UPaOeXSOKmj3vBwC9rJAAcsAj0fM7iOttPJWPPnzMC06wOm5/0FEci1mqQuRfjOLgga8Ac
 v8zmfa6hpXPfYhXFS8hHsstD3FJ7VSfPqhF3M1rFuiLl6wQczHgIq1O0iszUmVvLFgkT+fkve
 2zvQv0AbkMSTUp8Km83N35zqu/YWvzPlYpZfGyuApAYyCrZh74UuOSF47fY9Nn/iXicNAuPOq
 HxqFr0DhOZXr+s+oTdQ+NKVfyw/256qfsrXsQzbA6vMu+eOGcXq77HSIx20XUGyJY3lGQD+SU
 817czKYH8OztYRn7z87w2HKz+l2OSwIN2rIBzZdHmfOeinRvRTV0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Readibility and following clean-ups will benefit from the shorter name.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 105 ++++++++++-----------
 1 file changed, 52 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 271d498..5428140 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -338,7 +338,7 @@ static void
 mark_service_closing_internal(struct vchiq_service *service, int sh_thread)
 {
 	struct vchiq_state *state = service->state;
-	struct vchiq_service_quota *service_quota;
+	struct vchiq_service_quota *quota;
 
 	service->closing = 1;
 
@@ -357,8 +357,8 @@ mark_service_closing_internal(struct vchiq_service *service, int sh_thread)
 	}
 
 	/* Unblock any sending thread. */
-	service_quota = &state->service_quotas[service->localport];
-	complete(&service_quota->quota_event);
+	quota = &state->service_quotas[service->localport];
+	complete(&quota->quota_event);
 }
 
 static void
@@ -674,28 +674,28 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 
 			if (VCHIQ_MSG_TYPE(msgid) == VCHIQ_MSG_DATA) {
 				int port = VCHIQ_MSG_SRCPORT(msgid);
-				struct vchiq_service_quota *service_quota =
+				struct vchiq_service_quota *quota =
 					&state->service_quotas[port];
 				int count;
 
 				spin_lock(&quota_spinlock);
-				count = service_quota->message_use_count;
+				count = quota->message_use_count;
 				if (count > 0)
-					service_quota->message_use_count =
+					quota->message_use_count =
 						count - 1;
 				spin_unlock(&quota_spinlock);
 
-				if (count == service_quota->message_quota)
+				if (count == quota->message_quota)
 					/*
 					 * Signal the service that it
 					 * has dropped below its quota
 					 */
-					complete(&service_quota->quota_event);
+					complete(&quota->quota_event);
 				else if (count == 0) {
 					vchiq_log_error(vchiq_core_log_level,
 						"service %d message_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
 						port,
-						service_quota->message_use_count,
+						quota->message_use_count,
 						header, msgid, header->msgid,
 						header->size);
 					WARN(1, "invalid message use count\n");
@@ -705,9 +705,9 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 					BITSET_SET(service_found, port);
 
 					spin_lock(&quota_spinlock);
-					count = service_quota->slot_use_count;
+					count = quota->slot_use_count;
 					if (count > 0)
-						service_quota->slot_use_count =
+						quota->slot_use_count =
 							count - 1;
 					spin_unlock(&quota_spinlock);
 
@@ -716,7 +716,7 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 						 * Signal the service in case
 						 * it has dropped below its quota
 						 */
-						complete(&service_quota->quota_event);
+						complete(&quota->quota_event);
 						vchiq_log_trace(
 							vchiq_core_log_level,
 							"%d: pfq:%d %x@%pK - slot_use->%d",
@@ -822,7 +822,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 	      void *context, size_t size, int flags)
 {
 	struct vchiq_shared_state *local;
-	struct vchiq_service_quota *service_quota = NULL;
+	struct vchiq_service_quota *quota = NULL;
 	struct vchiq_header *header;
 	int type = VCHIQ_MSG_TYPE(msgid);
 
@@ -856,7 +856,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			return VCHIQ_ERROR;
 		}
 
-		service_quota = &state->service_quotas[service->localport];
+		quota = &state->service_quotas[service->localport];
 
 		spin_lock(&quota_spinlock);
 
@@ -893,22 +893,21 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			}
 		}
 
-		while ((service_quota->message_use_count ==
-				service_quota->message_quota) ||
-			((tx_end_index != service_quota->previous_tx_index) &&
-			(service_quota->slot_use_count ==
-				service_quota->slot_quota))) {
+		while ((quota->message_use_count == quota->message_quota) ||
+			((tx_end_index != quota->previous_tx_index) &&
+			(quota->slot_use_count ==
+				quota->slot_quota))) {
 			spin_unlock(&quota_spinlock);
 			vchiq_log_trace(vchiq_core_log_level,
 				"%d: qm:%d %s,%zx - quota stall (msg %d, slot %d)",
 				state->id, service->localport,
 				msg_type_str(type), size,
-				service_quota->message_use_count,
-				service_quota->slot_use_count);
+				quota->message_use_count,
+				quota->slot_use_count);
 			VCHIQ_SERVICE_STATS_INC(service, quota_stalls);
 			mutex_unlock(&state->slot_mutex);
 			if (wait_for_completion_interruptible(
-						&service_quota->quota_event))
+						&quota->quota_event))
 				return VCHIQ_RETRY;
 			if (service->closing)
 				return VCHIQ_ERROR;
@@ -974,7 +973,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 					       (size_t)callback_result));
 
 		spin_lock(&quota_spinlock);
-		service_quota->message_use_count++;
+		quota->message_use_count++;
 
 		tx_end_index =
 			SLOT_QUEUE_INDEX_FROM_POS(state->local_tx_pos - 1);
@@ -992,9 +991,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		 * If this isn't the same slot last used by this service,
 		 * the service's slot_use_count must be increased.
 		 */
-		if (tx_end_index != service_quota->previous_tx_index) {
-			service_quota->previous_tx_index = tx_end_index;
-			slot_use_count = ++service_quota->slot_use_count;
+		if (tx_end_index != quota->previous_tx_index) {
+			quota->previous_tx_index = tx_end_index;
+			slot_use_count = ++quota->slot_use_count;
 		} else {
 			slot_use_count = 0;
 		}
@@ -2209,9 +2208,9 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 	state->slot_queue_available = 0;
 
 	for (i = 0; i < VCHIQ_MAX_SERVICES; i++) {
-		struct vchiq_service_quota *service_quota =
+		struct vchiq_service_quota *quota =
 			&state->service_quotas[i];
-		init_completion(&service_quota->quota_event);
+		init_completion(&quota->quota_event);
 	}
 
 	for (i = local->slot_first; i <= local->slot_last; i++) {
@@ -2366,7 +2365,7 @@ vchiq_add_service_internal(struct vchiq_state *state,
 {
 	struct vchiq_service *service;
 	struct vchiq_service __rcu **pservice = NULL;
-	struct vchiq_service_quota *service_quota;
+	struct vchiq_service_quota *quota;
 	int ret;
 	int i;
 
@@ -2481,11 +2480,11 @@ vchiq_add_service_internal(struct vchiq_state *state,
 		return NULL;
 	}
 
-	service_quota = &state->service_quotas[service->localport];
-	service_quota->slot_quota = state->default_slot_quota;
-	service_quota->message_quota = state->default_message_quota;
-	if (service_quota->slot_use_count == 0)
-		service_quota->previous_tx_index =
+	quota = &state->service_quotas[service->localport];
+	quota->slot_quota = state->default_slot_quota;
+	quota->message_quota = state->default_message_quota;
+	if (quota->slot_use_count == 0)
+		quota->previous_tx_index =
 			SLOT_QUEUE_INDEX_FROM_POS(state->local_tx_pos)
 			- 1;
 
@@ -3367,45 +3366,45 @@ vchiq_set_service_option(unsigned int handle,
 			break;
 
 		case VCHIQ_SERVICE_OPTION_SLOT_QUOTA: {
-			struct vchiq_service_quota *service_quota =
+			struct vchiq_service_quota *quota =
 				&service->state->service_quotas[
 					service->localport];
 			if (value == 0)
 				value = service->state->default_slot_quota;
-			if ((value >= service_quota->slot_use_count) &&
+			if ((value >= quota->slot_use_count) &&
 				 (value < (unsigned short)~0)) {
-				service_quota->slot_quota = value;
-				if ((value >= service_quota->slot_use_count) &&
-					(service_quota->message_quota >=
-					 service_quota->message_use_count)) {
+				quota->slot_quota = value;
+				if ((value >= quota->slot_use_count) &&
+					(quota->message_quota >=
+					 quota->message_use_count)) {
 					/*
 					 * Signal the service that it may have
 					 * dropped below its quota
 					 */
-					complete(&service_quota->quota_event);
+					complete(&quota->quota_event);
 				}
 				status = VCHIQ_SUCCESS;
 			}
 		} break;
 
 		case VCHIQ_SERVICE_OPTION_MESSAGE_QUOTA: {
-			struct vchiq_service_quota *service_quota =
+			struct vchiq_service_quota *quota =
 				&service->state->service_quotas[
 					service->localport];
 			if (value == 0)
 				value = service->state->default_message_quota;
-			if ((value >= service_quota->message_use_count) &&
+			if ((value >= quota->message_use_count) &&
 				 (value < (unsigned short)~0)) {
-				service_quota->message_quota = value;
+				quota->message_quota = value;
 				if ((value >=
-					service_quota->message_use_count) &&
-					(service_quota->slot_quota >=
-					service_quota->slot_use_count))
+					quota->message_use_count) &&
+					(quota->slot_quota >=
+					quota->slot_use_count))
 					/*
 					 * Signal the service that it may have
 					 * dropped below its quota
 					 */
-					complete(&service_quota->quota_event);
+					complete(&quota->quota_event);
 				status = VCHIQ_SUCCESS;
 			}
 		} break;
@@ -3592,7 +3591,7 @@ int vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 
 	if (service->srvstate != VCHIQ_SRVSTATE_FREE) {
 		char remoteport[30];
-		struct vchiq_service_quota *service_quota =
+		struct vchiq_service_quota *quota =
 			&service->state->service_quotas[service->localport];
 		int fourcc = service->base.fourcc;
 		int tx_pending, rx_pending;
@@ -3612,10 +3611,10 @@ int vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 			" '%c%c%c%c' remote %s (msg use %d/%d, slot use %d/%d)",
 			VCHIQ_FOURCC_AS_4CHARS(fourcc),
 			remoteport,
-			service_quota->message_use_count,
-			service_quota->message_quota,
-			service_quota->slot_use_count,
-			service_quota->slot_quota);
+			quota->message_use_count,
+			quota->message_quota,
+			quota->slot_use_count,
+			quota->slot_quota);
 
 		err = vchiq_dump(dump_context, buf, len + 1);
 		if (err)
-- 
2.7.4

