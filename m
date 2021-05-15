Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3A2FB6
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:37 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3K9E-1lIO6X3OEs-010MBQ; Sat, 15 May 2021 21:11:19 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 05/20] staging: vchiq_arm: balance braces for if-else statements
Date: Sat, 15 May 2021 21:10:44 +0200
Message-Id: <1621105859-30215-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:1RRD6RXkZQbQdnIZIE5G4IlCrj1Xa/YxBlSikGh/uJSWYS2L4K+
 94mCQhdFTm3RXBEj+FvPNhvxOrjt0eKuawZztxB27C38AY7yNOCm9Di3RzZm4MEoAsFUMHl
 jXTotZgLbR6togp7TM7Fd/x8ir0pphqZdFcFt9BFKWqriCw80hfK0STwHLXpWorj677lKMy
 eePafOuoZ+KgJqMJoN3Og==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uuWlBrjEsP8=:pKF63BDNy2pgOsebuQR12A
 zoVOfHa7cJK755BnRW8zkl+esNktLr/xhNUxv5JsUi7nTIy+C95qsyAyan2E60hda0GT91Mhl
 fHGOmet8L7lVSkfb8cy/Uhjp9+LNv8tJpLNCSM082SUcOyp4oRWq8v2YOMuOVzL3aomsWegoe
 yV6jdMJt8ksFH7by8N26MHkQqE8k1ohMndV8/+Igw3WSWD/12yR2k7Ey5TQJHreVMQnV9KO5e
 KAL3r9FeYw7OohW0yeYVf8SxsERislIYqL5IEghn5Kcj3C2mmuT/9vcWUIoic917qRvh5Hg/2
 fPe1SZTEhxtOqH3yGUKqWjrksRlSLB++kUgJtpsWJGuSPVEdr07pmEm8QFMWq9VM5FSvA/PcD
 OEsIH+jZsNkENg0ifmpc+8OmUrPzGmuZzX+hYs0M/MDiTR1vFeWw8ZjVu/tpDwRAui4bSZqj7
 ZzE2glVXgtPcpT9UHGjMM+12X2ObF8emZGOrx5giiZMSxS9ny386/4nfDa+YCyoN210aFxcGj
 E4FizySN+wDIQUNL49FSRw=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This fixes the following checkpatch notices in vchiq_arm:
CHECK: braces {} should be used on all arms of this statement

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 12 ++++---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 41 +++++++++++++---------
 2 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1b13568..7951324 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -302,8 +302,9 @@ static enum vchiq_status vchiq_add_service(
 	if (service) {
 		*phandle = service->handle;
 		status = VCHIQ_SUCCESS;
-	} else
+	} else {
 		status = VCHIQ_ERROR;
+	}
 
 	vchiq_log_trace(vchiq_core_log_level,
 		"%s(%p): returning %d", __func__, instance, status);
@@ -942,8 +943,9 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 					header->data, header->size) == 0)) {
 			ret = header->size;
 			vchiq_release_message(service->handle, header);
-		} else
+		} else {
 			ret = -EFAULT;
+		}
 	} else {
 		vchiq_log_error(vchiq_arm_log_level,
 			"header %pK: bufsize %x < size %x",
@@ -1401,8 +1403,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 						service->base.fourcc),
 					service->client_id);
 			}
-		} else
+		} else {
 			ret = -EINVAL;
+		}
 	} break;
 
 	case VCHIQ_IOC_QUEUE_MESSAGE: {
@@ -1539,8 +1542,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			struct user_service *user_service =
 				(struct user_service *)service->base.userdata;
 			close_delivered(user_service);
-		} else
+		} else {
 			ret = -EINVAL;
+		}
 	} break;
 
 	default:
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index a22d8b7..2a83c2a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -689,13 +689,13 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 						count - 1;
 				spin_unlock(&quota_spinlock);
 
-				if (count == quota->message_quota)
+				if (count == quota->message_quota) {
 					/*
 					 * Signal the service that it
 					 * has dropped below its quota
 					 */
 					complete(&quota->quota_event);
-				else if (count == 0) {
+				} else if (count == 0) {
 					vchiq_log_error(vchiq_core_log_level,
 						"service %d message_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
 						port,
@@ -1691,10 +1691,11 @@ parse_rx_slots(struct vchiq_state *state)
 				vchiq_set_service_state(service,
 					VCHIQ_SRVSTATE_OPEN);
 				complete(&service->remove_event);
-			} else
+			} else {
 				vchiq_log_error(vchiq_core_log_level,
 					"OPENACK received in state %s",
 					srvstate_names[service->srvstate]);
+			}
 			break;
 		case VCHIQ_MSG_CLOSE:
 			WARN_ON(size != 0); /* There should be no data */
@@ -2449,11 +2450,11 @@ vchiq_add_service_internal(struct vchiq_state *state,
 			struct vchiq_service *srv;
 
 			srv = rcu_dereference(state->services[i]);
-			if (!srv)
+			if (!srv) {
 				pservice = &state->services[i];
-			else if ((srv->public_fourcc == params->fourcc) &&
-				 ((srv->instance != instance) ||
-				  (srv->base.callback != params->callback))) {
+			} else if ((srv->public_fourcc == params->fourcc) &&
+				   ((srv->instance != instance) ||
+				   (srv->base.callback != params->callback))) {
 				/*
 				 * There is another server using this
 				 * fourcc which doesn't match.
@@ -2654,10 +2655,12 @@ close_service_complete(struct vchiq_service *service, int failstate)
 				service->client_id = 0;
 				service->remoteport = VCHIQ_PORT_FREE;
 				newstate = VCHIQ_SRVSTATE_LISTENING;
-			} else
+			} else {
 				newstate = VCHIQ_SRVSTATE_CLOSEWAIT;
-		} else
+			}
+		} else {
 			newstate = VCHIQ_SRVSTATE_CLOSED;
+		}
 		vchiq_set_service_state(service, newstate);
 		break;
 	case VCHIQ_SRVSTATE_LISTENING:
@@ -2687,16 +2690,17 @@ close_service_complete(struct vchiq_service *service, int failstate)
 		service->client_id = 0;
 		service->remoteport = VCHIQ_PORT_FREE;
 
-		if (service->srvstate == VCHIQ_SRVSTATE_CLOSED)
+		if (service->srvstate == VCHIQ_SRVSTATE_CLOSED) {
 			vchiq_free_service_internal(service);
-		else if (service->srvstate != VCHIQ_SRVSTATE_CLOSEWAIT) {
+		} else if (service->srvstate != VCHIQ_SRVSTATE_CLOSEWAIT) {
 			if (is_server)
 				service->closing = 0;
 
 			complete(&service->remove_event);
 		}
-	} else
+	} else {
 		vchiq_set_service_state(service, failstate);
+	}
 
 	return status;
 }
@@ -2718,11 +2722,11 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	case VCHIQ_SRVSTATE_HIDDEN:
 	case VCHIQ_SRVSTATE_LISTENING:
 	case VCHIQ_SRVSTATE_CLOSEWAIT:
-		if (close_recvd)
+		if (close_recvd) {
 			vchiq_log_error(vchiq_core_log_level,
 				"%s(1) called in state %s",
 				__func__, srvstate_names[service->srvstate]);
-		else if (is_server) {
+		} else if (is_server) {
 			if (service->srvstate == VCHIQ_SRVSTATE_LISTENING) {
 				status = VCHIQ_ERROR;
 			} else {
@@ -2734,8 +2738,9 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 						VCHIQ_SRVSTATE_LISTENING);
 			}
 			complete(&service->remove_event);
-		} else
+		} else {
 			vchiq_free_service_internal(service);
+		}
 		break;
 	case VCHIQ_SRVSTATE_OPENING:
 		if (close_recvd) {
@@ -3325,8 +3330,9 @@ vchiq_release_message(unsigned int handle,
 
 			release_slot(state, slot_info, header, service);
 		}
-	} else if (slot_index == remote->slot_sync)
+	} else if (slot_index == remote->slot_sync) {
 		release_message_sync(state, header);
+	}
 
 	unlock_service(service);
 }
@@ -3620,8 +3626,9 @@ int vchiq_dump_service_state(void *dump_context, struct vchiq_service *service)
 				scnprintf(remoteport + len2,
 					sizeof(remoteport) - len2,
 					" (client %x)", service->client_id);
-		} else
+		} else {
 			strcpy(remoteport, "n/a");
+		}
 
 		len += scnprintf(buf + len, sizeof(buf) - len,
 			" '%c%c%c%c' remote %s (msg use %d/%d, slot use %d/%d)",
-- 
2.7.4

