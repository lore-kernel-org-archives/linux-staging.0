Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8D52CB2
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:01 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MBDWo-1n09HF10gA-00ChFS; Sun, 23 Jan 2022 21:02:55 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 10/18] staging: vchiq_core: drop prefix of vchiq_set_service_state
Date: Sun, 23 Jan 2022 21:02:15 +0100
Message-Id: <1642968143-19281-11-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:YcBe1O9TD91+RnJU9/mI5FsDPf9yh/tiTmLuzmuKYmN+klND4iY
 UhN2Q+Bv/4kBgX0OP7Kzcgoa+Y+jDbstzDRyQWeQ71/eZ+t0mu/82lPYqEA4pKeo8l8Qqq5
 Cx5A07dBYOP98XS1F8SaG073vv6JyZkb7RrvE3g8hC1Xvb1nBnZnzVK7EHzV0SNbmn/axQn
 ifc2n1dRhQlwSxt7uo/kQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1d7MiQ8QpYs=:cpqJHxr7PH/9LW/4hBISEV
 Pfb+ycZ9vnzw4tMBcmN+a9yQ83p6Ch9uLZmRYYfagII9nousxvDmKA8zRwCMqBKzclPHZ4wie
 M0TkjTDdYMDOK8lrJEcUjHThe8PuGyTW1qmyGnvrDJuuFHD/kvT259wPDA3c1sgjrz4sW2Cp8
 jkn+54L7SCndwZh6e3m8yphFdn3L/d94hTj0yzam5vRVQ7TaVlzMTfKf/XL7qTi35G39lltar
 Uui5ym9Hydkiur7/t9wjCA/Pu9Wuoym17FzG/JrC+QC6qaM+ulshWOeQ8HjHmNaqDa/oR5Gzm
 2fqCLlnnvTVMs4p0wuxTmbmeABBCH+mQrJvOWSt+Wz6cf5aVQCPU0Az20fZoJv/AW22mKu0br
 OeTuwLOYeANrnxi+xopfvgmgz8rtvK0eDfn1N57T8c2K3DQb7ksOv/1cQWxAUHoDtz8cpcWRc
 lYnhPHAOQkkmk9VAEU76o+yMPfOGGijMxl4JUxiffbpRZ/YhrGHxDOwoNTQ/8hF9cu7W1redh
 zpLp9e/bbJGMEydKfn+CJs0i5vk0eTOzaMR57FGI9E8BfV2k6L/M1YN7crBQwN6IzN6TwVb0+
 Xppafz39j1cKCCUVSp04BYzKHinMBvg8aeS9HF1rbqZpY94sRruTMwj7hgYgNMwuHoC66gd+l
 AquGkjYKKs6DzCAvrPdgB0rfmv9KpzPsmgPor1c47rLVJi+aex/LnIrqQmsLVWvvEcrbliUhk
 JhYm4XyEwEVUZh/W
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The name of this static function is unnecessary longish. So drop the prefix.
This gives us the chance to avoid some multi-line statements or fix some
indentations later.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 31 +++++++++++-----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e500cef..d861857 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -225,7 +225,7 @@ static const char *msg_type_str(unsigned int msg_type)
 }
 
 static inline void
-vchiq_set_service_state(struct vchiq_service *service, int newstate)
+set_service_state(struct vchiq_service *service, int newstate)
 {
 	vchiq_log_info(vchiq_core_log_level, "%d: srv:%d %s->%s",
 		       service->state->id, service->localport,
@@ -1122,7 +1122,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 	wmb();
 
 	if (service && (type == VCHIQ_MSG_CLOSE))
-		vchiq_set_service_state(service, VCHIQ_SRVSTATE_CLOSESENT);
+		set_service_state(service, VCHIQ_SRVSTATE_CLOSESENT);
 
 	if (!(flags & QMFLAGS_NO_MUTEX_UNLOCK))
 		mutex_unlock(&state->slot_mutex);
@@ -1531,7 +1531,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 		}
 
 		/* The service is now open */
-		vchiq_set_service_state(service, service->sync ? VCHIQ_SRVSTATE_OPENSYNC
+		set_service_state(service, service->sync ? VCHIQ_SRVSTATE_OPENSYNC
 					: VCHIQ_SRVSTATE_OPEN);
 	}
 
@@ -1666,7 +1666,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			       service->peer_version);
 		if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 			service->remoteport = remoteport;
-			vchiq_set_service_state(service, VCHIQ_SRVSTATE_OPEN);
+			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
 			complete(&service->remove_event);
 		} else {
 			vchiq_log_error(vchiq_core_log_level, "OPENACK received in state %s",
@@ -2063,7 +2063,7 @@ sync_func(void *v)
 				       service->peer_version);
 			if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 				service->remoteport = remoteport;
-				vchiq_set_service_state(service, VCHIQ_SRVSTATE_OPENSYNC);
+				set_service_state(service, VCHIQ_SRVSTATE_OPENSYNC);
 				service->sync = 1;
 				complete(&service->remove_event);
 			}
@@ -2465,7 +2465,7 @@ vchiq_add_service_internal(struct vchiq_state *state,
 			- 1;
 
 	/* Bring this service online */
-	vchiq_set_service_state(service, srvstate);
+	set_service_state(service, srvstate);
 
 	vchiq_log_info(vchiq_core_msg_log_level, "%s Service %c%c%c%c SrcPort:%d",
 		       (srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
@@ -2621,7 +2621,7 @@ close_service_complete(struct vchiq_service *service, int failstate)
 		} else {
 			newstate = VCHIQ_SRVSTATE_CLOSED;
 		}
-		vchiq_set_service_state(service, newstate);
+		set_service_state(service, newstate);
 		break;
 	case VCHIQ_SRVSTATE_LISTENING:
 		break;
@@ -2657,7 +2657,7 @@ close_service_complete(struct vchiq_service *service, int failstate)
 			complete(&service->remove_event);
 		}
 	} else {
-		vchiq_set_service_state(service, failstate);
+		set_service_state(service, failstate);
 	}
 
 	return status;
@@ -2692,7 +2692,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 				service->remoteport = VCHIQ_PORT_FREE;
 				if (service->srvstate ==
 					VCHIQ_SRVSTATE_CLOSEWAIT)
-					vchiq_set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
+					set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
 			}
 			complete(&service->remove_event);
 		} else {
@@ -2702,7 +2702,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	case VCHIQ_SRVSTATE_OPENING:
 		if (close_recvd) {
 			/* The open was rejected - tell the user */
-			vchiq_set_service_state(service, VCHIQ_SRVSTATE_CLOSEWAIT);
+			set_service_state(service, VCHIQ_SRVSTATE_CLOSEWAIT);
 			complete(&service->remove_event);
 		} else {
 			/* Shutdown mid-open - let the other side know */
@@ -2733,8 +2733,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 
 		if (!close_recvd) {
 			/* Change the state while the mutex is still held */
-			vchiq_set_service_state(service,
-						VCHIQ_SRVSTATE_CLOSESENT);
+			set_service_state(service, VCHIQ_SRVSTATE_CLOSESENT);
 			mutex_unlock(&state->slot_mutex);
 			if (service->sync)
 				mutex_unlock(&state->sync_mutex);
@@ -2742,7 +2741,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 		}
 
 		/* Change the state while the mutex is still held */
-		vchiq_set_service_state(service, VCHIQ_SRVSTATE_CLOSERECVD);
+		set_service_state(service, VCHIQ_SRVSTATE_CLOSERECVD);
 		mutex_unlock(&state->slot_mutex);
 		if (service->sync)
 			mutex_unlock(&state->sync_mutex);
@@ -2767,7 +2766,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	case VCHIQ_SRVSTATE_CLOSERECVD:
 		if (!close_recvd && is_server)
 			/* Force into LISTENING mode */
-			vchiq_set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
+			set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
 		status = close_service_complete(service, VCHIQ_SRVSTATE_CLOSERECVD);
 		break;
 
@@ -2816,7 +2815,7 @@ vchiq_free_service_internal(struct vchiq_service *service)
 		return;
 	}
 
-	vchiq_set_service_state(service, VCHIQ_SRVSTATE_FREE);
+	set_service_state(service, VCHIQ_SRVSTATE_FREE);
 
 	complete(&service->remove_event);
 
@@ -2834,7 +2833,7 @@ vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instanc
 	i = 0;
 	while ((service = next_service_by_instance(state, instance, &i)) != NULL) {
 		if (service->srvstate == VCHIQ_SRVSTATE_HIDDEN)
-			vchiq_set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
+			set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
 		vchiq_service_put(service);
 	}
 
-- 
2.7.4

