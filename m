Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEAC6D1B
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:55 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M1q8m-1lmch129f6-002H8i; Thu, 03 Jun 2021 17:50:51 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 14/16] staging: vchiq_core: store message id in local variable
Date: Thu,  3 Jun 2021 17:50:03 +0200
Message-Id: <1622735405-9980-15-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:iJWA7Kpqbvw/NOk3fKnBG4rglBfTcucaKiSwu+WdIBeZNFLSFdl
 /C3ycNTGRwhzYOdntMkEhrw20tAhmZx6TDv365ECBlZV01twpelD/JJ1QTJ34cdpnrmEati
 OdWhXRNUENI0X/xYTOW4+DhQInJrGpkcQPRM0/9t20Et+sVFBbDsHgORuFBNK+Z7aYV+hrA
 csDN2TpebEj6xHzGS6Ivg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aNxsfyLXbFA=:kRfPUDRt75XLR2CorzK9vb
 Ht0bV6S7JPII29a/LtOGHyKWq6pUposfL4mCgNq8U2uA6mgDqVfqcHo1o/8Wmn0Sv34r1TU7B
 AjcLEITCGkSUu99FnkHp+u0h00bIiq28ixe6G4NXsEmxjFRc3kd3UcPWitYERTKwwTieg4pQt
 XY8RpwaPye3QJ9srpbHXJ7CRP+V3Fuf67B+P8Vks7hD/yEcMGvfGpXLqpkIn9WFCf3q6bNSJy
 GFocAjy5cSUWNQbGJH89Na8m/mkDP5hUpBkxOEthdqpYnl501moWcWbvoKurEjtef/vC73qpz
 8pg7upNb3jvvUnJUcUgDgBzsEdy5hMYTt1Ix5VNBdqhG0OEXsYNf+EJSUCSAO50DRYXyfUrTo
 sj3yyp48IUQQj8O6p56YFf/o7/0/3eNWHSbQh9ResqZLw6GHqoJ/lHM4jcJdXWqbwZhS9nBqJ
 QgetSCwK08525kn6XMcL5l3GHVAzGbv5wsHF91GrhXQR2ubeg4HhJ8KooTSvcgMN65b2Feqs6
 CJk9Yg/JY3sw6d/f/9p1PY=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Some queue_message() calls are still rather complex to read. So store
the message ids in a local variable in those cases.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 28 ++++++++++------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3d543c5..a2a2472 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1576,6 +1576,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 		struct vchiq_openack_payload ack_payload = {
 			service->version
 		};
+		int openack_id = MAKE_OPENACK(service->localport, remoteport);
 
 		if (state->version_common <
 		    VCHIQ_VERSION_SYNCHRONOUS_MODE)
@@ -1583,16 +1584,14 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 		/* Acknowledge the OPEN */
 		if (service->sync) {
-			if (queue_message_sync(state, NULL,
-				MAKE_OPENACK(service->localport, remoteport),
+			if (queue_message_sync(state, NULL, openack_id,
 				memcpy_copy_callback,
 				&ack_payload,
 				sizeof(ack_payload),
 				0) == VCHIQ_RETRY)
 				goto bail_not_ready;
 		} else {
-			if (queue_message(state, NULL,
-				MAKE_OPENACK(service->localport, remoteport),
+			if (queue_message(state, NULL, openack_id,
 				memcpy_copy_callback,
 				&ack_payload,
 				sizeof(ack_payload),
@@ -2804,6 +2803,8 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	struct vchiq_state *state = service->state;
 	enum vchiq_status status = VCHIQ_SUCCESS;
 	int is_server = (service->public_fourcc != VCHIQ_FOURCC_INVALID);
+	int close_id = MAKE_CLOSE(service->localport,
+				  VCHIQ_MSG_DSTPORT(service->remoteport));
 
 	vchiq_log_info(vchiq_core_log_level, "%d: csi:%d,%d (%s)",
 		service->state->id, service->localport, close_recvd,
@@ -2842,9 +2843,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 			complete(&service->remove_event);
 		} else {
 			/* Shutdown mid-open - let the other side know */
-			status = queue_message(state, service,
-				MAKE_CLOSE(service->localport,
-				VCHIQ_MSG_DSTPORT(service->remoteport)),
+			status = queue_message(state, service, close_id,
 				NULL, NULL, 0, 0);
 		}
 		break;
@@ -2861,9 +2860,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 		release_service_messages(service);
 
 		if (status == VCHIQ_SUCCESS)
-			status = queue_message(state, service,
-				MAKE_CLOSE(service->localport,
-				VCHIQ_MSG_DSTPORT(service->remoteport)),
+			status = queue_message(state, service, close_id,
 				NULL, NULL, 0, QMFLAGS_NO_MUTEX_UNLOCK);
 
 		if (status != VCHIQ_SUCCESS) {
@@ -3318,6 +3315,7 @@ vchiq_queue_message(unsigned int handle,
 {
 	struct vchiq_service *service = find_service_by_handle(handle);
 	enum vchiq_status status = VCHIQ_ERROR;
+	int data_id;
 
 	if (!service)
 		goto error_exit;
@@ -3336,17 +3334,15 @@ vchiq_queue_message(unsigned int handle,
 		goto error_exit;
 	}
 
+	data_id = MAKE_DATA(service->localport, service->remoteport);
+
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_OPEN:
-		status = queue_message(service->state, service,
-				MAKE_DATA(service->localport,
-					service->remoteport),
+		status = queue_message(service->state, service, data_id,
 				copy_callback, context, size, 1);
 		break;
 	case VCHIQ_SRVSTATE_OPENSYNC:
-		status = queue_message_sync(service->state, service,
-				MAKE_DATA(service->localport,
-					service->remoteport),
+		status = queue_message_sync(service->state, service, data_id,
 				copy_callback, context, size, 1);
 		break;
 	default:
-- 
2.7.4

