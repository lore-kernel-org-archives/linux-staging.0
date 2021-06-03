Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1636D35
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:55 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N79hs-1lIfiQ0moW-017UHs; Thu, 03 Jun 2021 17:50:50 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 09/16] staging: vchiq_core: introduce message specific make macros
Date: Thu,  3 Jun 2021 17:49:58 +0200
Message-Id: <1622735405-9980-10-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:gBJgW+px586aHRy79Tw91tlH4Xd0LWknCZRrv34Y2BZUkV7FoRA
 sMVquEIW3dF83Iy8tWl8vGY8ATNaQN2BMGTDcYoFmIV6t7KyKuGfFh3nqqb/YfMBcdJuRLk
 9iY7gy20bW7cOoR2pJN3DW+dt4STNri+DoWa1eGYvEGrBIjODGOgCXdkPqCwtxDzSZaPHRD
 fsOJKffQFd9pgQTdhw7Zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LcJJsiqcDf8=:SKijyIGAf/NuWalHUjoEM1
 c/SuRTmw/ZviNcJylDrIK0O87dwuOVWtucmlbCKBNT2L983WsCO5aOPZOdU+LARI/01V11WYt
 XbTYVeFCgpwSUh1K1fGwAPsQGlCwy1/aNwzf7At8ksT54qR8yB2FaCZfsWVcJ5/TMh5q3mN8J
 /mflLAEzaRmYtB9+daAsHbdYlUw0KzFHy381NtYwmcWmoSjY9MqujebqhbhouG6LewXrO4kzs
 Ew47ktjg2O5aw5lklyaxwl6Xpp7MXkhwXH7NO3RBEjJYfOyz7xiA3ZzYijte/Wa0/rrgxj2/Z
 ZLC9l6m1etzZrWqxC7Ag+cpGhYdvZIu7PfOHEYFRmUQNptI6yQzD6B4LyVAKyxxWaSIErncBx
 4RSs6/6jtH87GXskrKfwftfzfqx1U9V1kzRN7+ii1rOW7wH4/Xi/rc2od0h+JsYkqk7zt+B6E
 OxTaTCUvH5ucXQSfOdIAPjXmD0e32NTh7bhy4bgeujoCaRwmOlr39mOt0epoyJeXTv54GCpN/
 SeOmfUeV3F3dEDU3jKEQOc=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

VCHIQ_MAKE_MSG isn't optimal because a lot of message types doesn't need
a parameter. So better define a macro for every message type which is used.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 64 ++++++++++------------
 1 file changed, 29 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index f6ada95..99624ca 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -46,6 +46,20 @@
 #define VCHIQ_MSG_DSTPORT(msgid) \
 	((unsigned short)(msgid) & 0xfff)
 
+#define MAKE_CONNECT			(VCHIQ_MSG_CONNECT << TYPE_SHIFT)
+#define MAKE_OPEN(srcport) \
+	((VCHIQ_MSG_OPEN << TYPE_SHIFT) | ((srcport) << 12))
+#define MAKE_OPENACK(srcport, dstport) \
+	((VCHIQ_MSG_OPENACK << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
+#define MAKE_CLOSE(srcport, dstport) \
+	((VCHIQ_MSG_CLOSE << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
+#define MAKE_DATA(srcport, dstport) \
+	((VCHIQ_MSG_DATA << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
+#define MAKE_PAUSE			(VCHIQ_MSG_PAUSE << TYPE_SHIFT)
+#define MAKE_RESUME			(VCHIQ_MSG_RESUME << TYPE_SHIFT)
+#define MAKE_REMOTE_USE			(VCHIQ_MSG_REMOTE_USE << TYPE_SHIFT)
+#define MAKE_REMOTE_USE_ACTIVE		(VCHIQ_MSG_REMOTE_USE_ACTIVE << TYPE_SHIFT)
+
 /* Ensure the fields are wide enough */
 static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX))
 	== 0);
@@ -1566,10 +1580,8 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 					if (queue_message_sync(
 						state,
 						NULL,
-						VCHIQ_MAKE_MSG(
-							VCHIQ_MSG_OPENACK,
-							service->localport,
-							remoteport),
+						MAKE_OPENACK(service->localport,
+							     remoteport),
 						memcpy_copy_callback,
 						&ack_payload,
 						sizeof(ack_payload),
@@ -1578,8 +1590,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 				} else {
 					if (queue_message(state,
 							NULL,
-							VCHIQ_MAKE_MSG(
-							VCHIQ_MSG_OPENACK,
+							MAKE_OPENACK(
 							service->localport,
 							remoteport),
 						memcpy_copy_callback,
@@ -1603,8 +1614,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 fail_open:
 	/* No available service, or an invalid request - send a CLOSE */
-	if (queue_message(state, NULL,
-		VCHIQ_MAKE_MSG(VCHIQ_MSG_CLOSE, 0, VCHIQ_MSG_SRCPORT(msgid)),
+	if (queue_message(state, NULL, MAKE_CLOSE(0, VCHIQ_MSG_SRCPORT(msgid)),
 		NULL, NULL, 0, 0) == VCHIQ_RETRY)
 		goto bail_not_ready;
 
@@ -1885,8 +1895,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		if (state->conn_state != VCHIQ_CONNSTATE_PAUSE_SENT) {
 			/* Send a PAUSE in response */
-			if (queue_message(state, NULL,
-				VCHIQ_MAKE_MSG(VCHIQ_MSG_PAUSE, 0, 0),
+			if (queue_message(state, NULL, MAKE_PAUSE,
 				NULL, NULL, 0, QMFLAGS_NO_MUTEX_UNLOCK)
 			    == VCHIQ_RETRY)
 				goto bail_not_ready;
@@ -2018,8 +2027,7 @@ slot_handler_func(void *v)
 				break;
 
 			case VCHIQ_CONNSTATE_PAUSING:
-				if (queue_message(state, NULL,
-					VCHIQ_MAKE_MSG(VCHIQ_MSG_PAUSE, 0, 0),
+				if (queue_message(state, NULL, MAKE_PAUSE,
 					NULL, NULL, 0,
 					QMFLAGS_NO_MUTEX_UNLOCK)
 				    != VCHIQ_RETRY) {
@@ -2032,8 +2040,7 @@ slot_handler_func(void *v)
 				break;
 
 			case VCHIQ_CONNSTATE_RESUMING:
-				if (queue_message(state, NULL,
-					VCHIQ_MAKE_MSG(VCHIQ_MSG_RESUME, 0, 0),
+				if (queue_message(state, NULL, MAKE_RESUME,
 					NULL, NULL, 0, QMFLAGS_NO_MUTEX_LOCK)
 					!= VCHIQ_RETRY) {
 					vchiq_set_conn_state(state,
@@ -2613,10 +2620,7 @@ vchiq_open_service_internal(struct vchiq_service *service, int client_id)
 	service->client_id = client_id;
 	vchiq_use_service_internal(service);
 	status = queue_message(service->state,
-			       NULL,
-			       VCHIQ_MAKE_MSG(VCHIQ_MSG_OPEN,
-					      service->localport,
-					      0),
+			       NULL, MAKE_OPEN(service->localport),
 			       memcpy_copy_callback,
 			       &payload,
 			       sizeof(payload),
@@ -2841,9 +2845,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 		} else {
 			/* Shutdown mid-open - let the other side know */
 			status = queue_message(state, service,
-				VCHIQ_MAKE_MSG
-				(VCHIQ_MSG_CLOSE,
-				service->localport,
+				MAKE_CLOSE(service->localport,
 				VCHIQ_MSG_DSTPORT(service->remoteport)),
 				NULL, NULL, 0, 0);
 		}
@@ -2862,9 +2864,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 
 		if (status == VCHIQ_SUCCESS)
 			status = queue_message(state, service,
-				VCHIQ_MAKE_MSG
-				(VCHIQ_MSG_CLOSE,
-				service->localport,
+				MAKE_CLOSE(service->localport,
 				VCHIQ_MSG_DSTPORT(service->remoteport)),
 				NULL, NULL, 0, QMFLAGS_NO_MUTEX_UNLOCK);
 
@@ -2992,8 +2992,7 @@ vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instanc
 	}
 
 	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED) {
-		if (queue_message(state, NULL,
-			VCHIQ_MAKE_MSG(VCHIQ_MSG_CONNECT, 0, 0), NULL, NULL,
+		if (queue_message(state, NULL, MAKE_CONNECT, NULL, NULL,
 			0, QMFLAGS_IS_BLOCKING) == VCHIQ_RETRY)
 			return VCHIQ_RETRY;
 
@@ -3342,15 +3341,13 @@ vchiq_queue_message(unsigned int handle,
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_OPEN:
 		status = queue_message(service->state, service,
-				VCHIQ_MAKE_MSG(VCHIQ_MSG_DATA,
-					service->localport,
+				MAKE_DATA(service->localport,
 					service->remoteport),
 				copy_callback, context, size, 1);
 		break;
 	case VCHIQ_SRVSTATE_OPENSYNC:
 		status = queue_message_sync(service->state, service,
-				VCHIQ_MAKE_MSG(VCHIQ_MSG_DATA,
-					service->localport,
+				MAKE_DATA(service->localport,
 					service->remoteport),
 				copy_callback, context, size, 1);
 		break;
@@ -3813,9 +3810,7 @@ enum vchiq_status vchiq_send_remote_use(struct vchiq_state *state)
 	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
 		return VCHIQ_RETRY;
 
-	return queue_message(state, NULL,
-			     VCHIQ_MAKE_MSG(VCHIQ_MSG_REMOTE_USE, 0, 0),
-			     NULL, NULL, 0, 0);
+	return queue_message(state, NULL, MAKE_REMOTE_USE, NULL, NULL, 0, 0);
 }
 
 enum vchiq_status vchiq_send_remote_use_active(struct vchiq_state *state)
@@ -3823,8 +3818,7 @@ enum vchiq_status vchiq_send_remote_use_active(struct vchiq_state *state)
 	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
 		return VCHIQ_RETRY;
 
-	return queue_message(state, NULL,
-			     VCHIQ_MAKE_MSG(VCHIQ_MSG_REMOTE_USE_ACTIVE, 0, 0),
+	return queue_message(state, NULL, MAKE_REMOTE_USE_ACTIVE,
 			     NULL, NULL, 0, 0);
 }
 
-- 
2.7.4

