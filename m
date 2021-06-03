Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6B16D37
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:55 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MacjC-1lDpuC2rus-00c9vG; Thu, 03 Jun 2021 17:50:50 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 11/16] staging: vchiq_arm: tidy up service function naming
Date: Thu,  3 Jun 2021 17:50:00 +0200
Message-Id: <1622735405-9980-12-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:SdnUVdT8qY1ZyLU5xZggHEer4arEp2VBOhiPFDUp4MIQRlqy09n
 PjRPXRZXyBxqD7vhrKfc6+T9Y1oPfQ7vVMlQklOE6aCtB6exl0/B+qpARHstDn+wSuduYjM
 YmrieJwIdEB+eTzQn+5lrYvfVUG+EwR+Kqs+UT8S/enWTT7uaw5GFKDSw0kHwUcPqULVWh1
 uM7venhfzfrEOYNwxUDhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dp3X3QEJqIQ=:xDoXikm4vGH89zx2xZj6Ld
 5q1C5aJTY1GiTTI+y6bTFyvbmsN2Rso1os0ogPHw+urMp1sl0u3kk2AcmkCi03q/LA7eohuxw
 8ZfQja6tNegn8lHkttlluEBsTh8PaDUKg43Py6jUqXaWwKKiLGIN4Rn230PQGkQb9jmPzrF8k
 kcHG/ofXl/Zi18YlGSWViRiS7N/AVLpT96VVm2b5Y9FaMq+LphBngSb+u/jwDT2eJ3+BxyEbT
 Y4FzaQGrjNjEw9TcbvncCEmsiVOSNoPHMYveh+xquWTvXhs7oGneXG60UxUBaebGkFnHUkSB9
 Zti/71ttqU6atFEVpBNhOl6JNNsm7o0dRmF+TpoJW6IP0N0BCEhld9JbF6JTvGKQjDkPCDRvs
 RvKhuE2ZdLRs+E+1gQ+9kF4Bfp3vhKbbWcSJICMKAM2hTYc+kS8ov2nJ98zPF3/4TSwxF1cAs
 SorJ8EqZ9rmZ0SVj5Gr7IFhLsv+nktTu3f1lRxElxlHsjc4gCrKcax5RMt6OJv8Ni4Wa40T70
 uYFkGGNV+Eg1SI0f/O+q1U=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

During a recent review Dan Carpenter reported that the function naming of
(un)lock_service is misleading. They are like wrapper around kref_get /
kref_put and don't have anything to do with locking. So use a name which
represent more the actual behavior. Btw add the vchiq prefix to avoid
possible name conflicts.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 32 +++++++--------
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 46 +++++++++++-----------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |  4 +-
 3 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 32278b4..72e9576 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -431,7 +431,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data, unsigned int size,
 
 	instance = service->instance;
 
-	unlock_service(service);
+	vchiq_service_put(service);
 
 	mutex_lock(&instance->bulk_waiter_list_mutex);
 	list_for_each_entry(waiter, &instance->bulk_waiter_list, list) {
@@ -539,7 +539,7 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 		 * Take an extra reference, to be held until
 		 * this CLOSED notification is delivered.
 		 */
-		lock_service(user_service->service);
+		vchiq_service_get(user_service->service);
 		if (instance->use_close_delivered)
 			user_service->close_pending = 1;
 	}
@@ -686,7 +686,7 @@ static void close_delivered(struct user_service *user_service)
 
 	if (user_service->close_pending) {
 		/* Allow the underlying service to be culled */
-		unlock_service(user_service->service);
+		vchiq_service_put(user_service->service);
 
 		/* Wake the user-thread blocked in close_ or remove_service */
 		complete(&user_service->close_event);
@@ -915,7 +915,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 	}
 	DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 out:
-	unlock_service(service);
+	vchiq_service_put(service);
 	return ret;
 }
 
@@ -1001,7 +1001,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		ret = put_user(mode_waiting, mode);
 	}
 out:
-	unlock_service(service);
+	vchiq_service_put(service);
 	if (ret)
 		return ret;
 	else if (status == VCHIQ_ERROR)
@@ -1181,7 +1181,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 
 		if ((completion->reason == VCHIQ_SERVICE_CLOSED) &&
 		    !instance->use_close_delivered)
-			unlock_service(service);
+			vchiq_service_put(service);
 
 		/*
 		 * FIXME: address space mismatch, does bulk_userdata
@@ -1243,7 +1243,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		while ((service = next_service_by_instance(instance->state,
 			instance, &i))) {
 			status = vchiq_remove_service(service->handle);
-			unlock_service(service);
+			vchiq_service_put(service);
 			if (status != VCHIQ_SUCCESS)
 				break;
 		}
@@ -1508,7 +1508,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	}
 
 	if (service)
-		unlock_service(service);
+		vchiq_service_put(service);
 
 	if (ret == 0) {
 		if (status == VCHIQ_ERROR)
@@ -1641,7 +1641,7 @@ vchiq_compat_ioctl_queue_message(struct file *file,
 
 		if (copy_from_user(&element32, args.elements,
 				   sizeof(element32))) {
-			unlock_service(service);
+			vchiq_service_put(service);
 			return -EFAULT;
 		}
 
@@ -1655,7 +1655,7 @@ vchiq_compat_ioctl_queue_message(struct file *file,
 	} else {
 		ret = -EINVAL;
 	}
-	unlock_service(service);
+	vchiq_service_put(service);
 
 	return ret;
 }
@@ -1891,7 +1891,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 		complete(&user_service->remove_event);
 
 		vchiq_terminate_service_internal(service);
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 
 	/* ...and wait for them to die */
@@ -1902,7 +1902,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 		wait_for_completion(&service->remove_event);
 
 		if (WARN_ON(service->srvstate != VCHIQ_SRVSTATE_FREE)) {
-			unlock_service(service);
+			vchiq_service_put(service);
 			break;
 		}
 
@@ -1923,7 +1923,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 
 		spin_unlock(&msg_queue_spinlock);
 
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 
 	/* Release any closed services */
@@ -1941,7 +1941,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 			/* Wake any blocked user-thread */
 			if (instance->use_close_delivered)
 				complete(&user_service->close_event);
-			unlock_service(service);
+			vchiq_service_put(service);
 		}
 		instance->completion_remove++;
 	}
@@ -2444,7 +2444,7 @@ vchiq_use_service(unsigned int handle)
 	if (service) {
 		ret = vchiq_use_internal(service->state, service,
 				USE_TYPE_SERVICE);
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 	return ret;
 }
@@ -2458,7 +2458,7 @@ vchiq_release_service(unsigned int handle)
 
 	if (service) {
 		ret = vchiq_release_internal(service->state, service);
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 	return ret;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2e1b218..af2effa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -368,7 +368,7 @@ next_service_by_instance(struct vchiq_state *state,
 }
 
 void
-lock_service(struct vchiq_service *service)
+vchiq_service_get(struct vchiq_service *service)
 {
 	if (!service) {
 		WARN(1, "%s service is NULL\n", __func__);
@@ -391,7 +391,7 @@ static void service_release(struct kref *kref)
 }
 
 void
-unlock_service(struct vchiq_service *service)
+vchiq_service_put(struct vchiq_service *service)
 {
 	if (!service) {
 		WARN(1, "%s: service is NULL\n", __func__);
@@ -1454,7 +1454,7 @@ poll_services_of_group(struct vchiq_state *state, int group)
 			notify_bulks(service, &service->bulk_tx, RETRY_POLL);
 		if (service_flags & BIT(VCHIQ_POLL_RXNOTIFY))
 			notify_bulks(service, &service->bulk_rx, RETRY_POLL);
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 }
 
@@ -1560,7 +1560,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 					service->version, service->version_min,
 					version, version_min);
 				vchiq_loud_error_footer();
-				unlock_service(service);
+				vchiq_service_put(service);
 				service = NULL;
 				goto fail_open;
 			}
@@ -1607,7 +1607,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 			}
 
 			/* Success - the message has been dealt with */
-			unlock_service(service);
+			vchiq_service_put(service);
 			return 1;
 		}
 	}
@@ -1622,7 +1622,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 bail_not_ready:
 	if (service)
-		unlock_service(service);
+		vchiq_service_put(service);
 
 	return 0;
 }
@@ -1678,7 +1678,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			 * the connected service
 			 */
 			if (service)
-				unlock_service(service);
+				vchiq_service_put(service);
 			service = get_connected_service(state,
 				remoteport);
 			if (service)
@@ -1934,7 +1934,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 
 bail_not_ready:
 	if (service)
-		unlock_service(service);
+		vchiq_service_put(service);
 
 	return ret;
 }
@@ -2190,7 +2190,7 @@ sync_func(void *v)
 			break;
 		}
 
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 
 	return 0;
@@ -2972,7 +2972,7 @@ vchiq_free_service_internal(struct vchiq_service *service)
 	complete(&service->remove_event);
 
 	/* Release the initial lock */
-	unlock_service(service);
+	vchiq_service_put(service);
 }
 
 enum vchiq_status
@@ -2988,7 +2988,7 @@ vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instanc
 		if (service->srvstate == VCHIQ_SRVSTATE_HIDDEN)
 			vchiq_set_service_state(service,
 				VCHIQ_SRVSTATE_LISTENING);
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 
 	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED) {
@@ -3021,7 +3021,7 @@ vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instan
 	while ((service = next_service_by_instance(state, instance,
 		&i)) !=	NULL) {
 		(void)vchiq_remove_service(service->handle);
-		unlock_service(service);
+		vchiq_service_put(service);
 	}
 }
 
@@ -3042,7 +3042,7 @@ vchiq_close_service(unsigned int handle)
 	if ((service->srvstate == VCHIQ_SRVSTATE_FREE) ||
 	    (service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
 	    (service->srvstate == VCHIQ_SRVSTATE_HIDDEN)) {
-		unlock_service(service);
+		vchiq_service_put(service);
 		return VCHIQ_ERROR;
 	}
 
@@ -3078,7 +3078,7 @@ vchiq_close_service(unsigned int handle)
 	    (service->srvstate != VCHIQ_SRVSTATE_LISTENING))
 		status = VCHIQ_ERROR;
 
-	unlock_service(service);
+	vchiq_service_put(service);
 
 	return status;
 }
@@ -3099,7 +3099,7 @@ vchiq_remove_service(unsigned int handle)
 		service->state->id, service->localport);
 
 	if (service->srvstate == VCHIQ_SRVSTATE_FREE) {
-		unlock_service(service);
+		vchiq_service_put(service);
 		return VCHIQ_ERROR;
 	}
 
@@ -3139,7 +3139,7 @@ vchiq_remove_service(unsigned int handle)
 	    (service->srvstate != VCHIQ_SRVSTATE_FREE))
 		status = VCHIQ_ERROR;
 
-	unlock_service(service);
+	vchiq_service_put(service);
 
 	return status;
 }
@@ -3284,7 +3284,7 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle,
 		queue->local_insert, queue->remote_insert, queue->process);
 
 waiting:
-	unlock_service(service);
+	vchiq_service_put(service);
 
 	status = VCHIQ_SUCCESS;
 
@@ -3307,7 +3307,7 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle,
 
 error_exit:
 	if (service)
-		unlock_service(service);
+		vchiq_service_put(service);
 	return status;
 }
 
@@ -3358,7 +3358,7 @@ vchiq_queue_message(unsigned int handle,
 
 error_exit:
 	if (service)
-		unlock_service(service);
+		vchiq_service_put(service);
 
 	return status;
 }
@@ -3417,7 +3417,7 @@ vchiq_release_message(unsigned int handle,
 		release_message_sync(state, header);
 	}
 
-	unlock_service(service);
+	vchiq_service_put(service);
 }
 EXPORT_SYMBOL(vchiq_release_message);
 
@@ -3448,7 +3448,7 @@ vchiq_get_peer_version(unsigned int handle, short *peer_version)
 
 exit:
 	if (service)
-		unlock_service(service);
+		vchiq_service_put(service);
 	return status;
 }
 EXPORT_SYMBOL(vchiq_get_peer_version);
@@ -3532,7 +3532,7 @@ vchiq_set_service_option(unsigned int handle,
 	default:
 		break;
 	}
-	unlock_service(service);
+	vchiq_service_put(service);
 
 	return ret;
 }
@@ -3673,7 +3673,7 @@ int vchiq_dump_state(void *dump_context, struct vchiq_state *state)
 
 		if (service) {
 			err = vchiq_dump_service_state(dump_context, service);
-			unlock_service(service);
+			vchiq_service_put(service);
 			if (err)
 				return err;
 		}
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 8d8e104..957fea1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -554,10 +554,10 @@ next_service_by_instance(struct vchiq_state *state,
 			 int *pidx);
 
 extern void
-lock_service(struct vchiq_service *service);
+vchiq_service_get(struct vchiq_service *service);
 
 extern void
-unlock_service(struct vchiq_service *service);
+vchiq_service_put(struct vchiq_service *service);
 
 extern enum vchiq_status
 vchiq_queue_message(unsigned int handle,
-- 
2.7.4

