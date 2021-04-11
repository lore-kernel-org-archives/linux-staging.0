Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75CB6D18
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:29 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MVe1U-1l6Nxd0qyC-00Rd2c; Sun, 11 Apr 2021 20:12:25 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 09/10] staging: vchiq_core: fix if alignments
Date: Sun, 11 Apr 2021 20:11:39 +0200
Message-Id: <1618164700-21150-10-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:0lD1/rqEJ3PQTbJf2c0KBOfdRszXAz15vuCEM4yCZjS/vKLHfku
 4PWmcwp4t/nXJeE2KUQvJHJxuNQnqU19D6OU0xxzWSNJ1cfz4sIwxmrKkbMolWr8GYOTYaa
 sRq+TykOe5nDnUApOXydBS0y4M8XqMgJt+Rgs7eXJtCIITb4xlqOw5A5gXe5AoRUnhPNSgV
 SHu4uhKA4OtSFDTjJRBHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B1RqkfNs8BE=:Dnde++KxGPB/hzyLv5pm/b
 deX5abN4iWBRb4IcT/7iQJTzrWcfr2H0oEecptp0wsD7YZhYZb16vHu/yW+4wpGBL7wJM/RaS
 koijzT2zOXGk0MrNggiJ0UCiSfzAwojjkLUOEkV0LmoLTod8OJU6Awe9NBYaCcKcUhw7gKP3D
 1ZM8CtsimHJWzbFh0TEmjV96HqfhS+A8GvNjORCBi7Nv+Jhq1Dsvf0gKvBaTL10KGTGG/pj+w
 3AV2yOkm7DZFx/78NZpLOWCfhN3WTmq0e4WLK82sUrEsN4CShsXLFNNPbdaYANI4hk62vJshq
 HG/b/O//vtbDMepaUyJq+9mG8uJHRw55e8SuLKHd87VZRJoEGynpfPFXVfYdB5a9VV+9MCeBn
 n+1sQ3OkP7rpP3zm6BeCsKJb+FjUUh67to5SwtlF9RH/Y/0st0YLE+TedXu3achX3CN2jdVwo
 Qk14v4mI/bDnM/5e6AeFlmTQUlId4DE6Bz/dACj/YxKWRne5fea3
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This fixes the alignment of some if statements.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 40 ++++++++++------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 5eab351..f5bd5e2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1681,8 +1681,7 @@ parse_rx_slots(struct vchiq_state *state)
 				"%d: prs OPENACK@%pK,%x (%d->%d) v:%d",
 				state->id, header, size, remoteport, localport,
 				service->peer_version);
-			if (service->srvstate ==
-				VCHIQ_SRVSTATE_OPENING) {
+			if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 				service->remoteport = remoteport;
 				vchiq_set_service_state(service,
 					VCHIQ_SRVSTATE_OPEN);
@@ -1716,9 +1715,8 @@ parse_rx_slots(struct vchiq_state *state)
 				"%d: prs DATA@%pK,%x (%d->%d)",
 				state->id, header, size, remoteport, localport);
 
-			if ((service->remoteport == remoteport)
-				&& (service->srvstate ==
-				VCHIQ_SRVSTATE_OPEN)) {
+			if ((service->remoteport == remoteport) &&
+			    (service->srvstate == VCHIQ_SRVSTATE_OPEN)) {
 				header->msgid = msgid | VCHIQ_MSGID_CLAIMED;
 				claim_slot(state->rx_info);
 				DEBUG_TRACE(PARSE_LINE);
@@ -1753,9 +1751,8 @@ parse_rx_slots(struct vchiq_state *state)
 			break;
 		case VCHIQ_MSG_BULK_RX_DONE:
 		case VCHIQ_MSG_BULK_TX_DONE:
-			if ((service->remoteport == remoteport)
-				&& (service->srvstate !=
-				VCHIQ_SRVSTATE_FREE)) {
+			if ((service->remoteport == remoteport) &&
+			    (service->srvstate != VCHIQ_SRVSTATE_FREE)) {
 				struct vchiq_bulk_queue *queue;
 				struct vchiq_bulk *bulk;
 
@@ -2445,10 +2442,9 @@ vchiq_add_service_internal(struct vchiq_state *state,
 			srv = rcu_dereference(state->services[i]);
 			if (!srv)
 				pservice = &state->services[i];
-			else if ((srv->public_fourcc == params->fourcc)
-				&& ((srv->instance != instance) ||
-				(srv->base.callback !=
-				params->callback))) {
+			else if ((srv->public_fourcc == params->fourcc) &&
+				 ((srv->instance != instance) ||
+				  (srv->base.callback != params->callback))) {
 				/*
 				 * There is another server using this
 				 * fourcc which doesn't match.
@@ -2942,8 +2938,8 @@ vchiq_close_service(unsigned int handle)
 		service->state->id, service->localport);
 
 	if ((service->srvstate == VCHIQ_SRVSTATE_FREE) ||
-		(service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
-		(service->srvstate == VCHIQ_SRVSTATE_HIDDEN)) {
+	    (service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
+	    (service->srvstate == VCHIQ_SRVSTATE_HIDDEN)) {
 		unlock_service(service);
 		return VCHIQ_ERROR;
 	}
@@ -2966,8 +2962,8 @@ vchiq_close_service(unsigned int handle)
 		}
 
 		if ((service->srvstate == VCHIQ_SRVSTATE_FREE) ||
-			(service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
-			(service->srvstate == VCHIQ_SRVSTATE_OPEN))
+		    (service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
+		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
 		vchiq_log_warning(vchiq_core_log_level,
@@ -2977,8 +2973,8 @@ vchiq_close_service(unsigned int handle)
 	}
 
 	if ((status == VCHIQ_SUCCESS) &&
-		(service->srvstate != VCHIQ_SRVSTATE_FREE) &&
-		(service->srvstate != VCHIQ_SRVSTATE_LISTENING))
+	    (service->srvstate != VCHIQ_SRVSTATE_FREE) &&
+	    (service->srvstate != VCHIQ_SRVSTATE_LISTENING))
 		status = VCHIQ_ERROR;
 
 	unlock_service(service);
@@ -3009,7 +3005,7 @@ vchiq_remove_service(unsigned int handle)
 	mark_service_closing(service);
 
 	if ((service->srvstate == VCHIQ_SRVSTATE_HIDDEN) ||
-		(current == service->state->slot_handler_thread)) {
+	    (current == service->state->slot_handler_thread)) {
 		/*
 		 * Make it look like a client, because it must be removed and
 		 * not left in the LISTENING state.
@@ -3030,7 +3026,7 @@ vchiq_remove_service(unsigned int handle)
 		}
 
 		if ((service->srvstate == VCHIQ_SRVSTATE_FREE) ||
-			(service->srvstate == VCHIQ_SRVSTATE_OPEN))
+		    (service->srvstate == VCHIQ_SRVSTATE_OPEN))
 			break;
 
 		vchiq_log_warning(vchiq_core_log_level,
@@ -3040,7 +3036,7 @@ vchiq_remove_service(unsigned int handle)
 	}
 
 	if ((status == VCHIQ_SUCCESS) &&
-		(service->srvstate != VCHIQ_SRVSTATE_FREE))
+	    (service->srvstate != VCHIQ_SRVSTATE_FREE))
 		status = VCHIQ_ERROR;
 
 	unlock_service(service);
@@ -3302,7 +3298,7 @@ vchiq_release_message(unsigned int handle,
 	slot_index = SLOT_INDEX_FROM_DATA(state, (void *)header);
 
 	if ((slot_index >= remote->slot_first) &&
-		(slot_index <= remote->slot_last)) {
+	    (slot_index <= remote->slot_last)) {
 		int msgid = header->msgid;
 
 		if (msgid & VCHIQ_MSGID_CLAIMED) {
-- 
2.7.4

