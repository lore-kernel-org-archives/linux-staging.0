Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5063FD0
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 13:39:36 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id s20so10442401oiw.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 06:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M7r44wAX+qmiizcGaAxSCKCWdtDrp690Qges1PulPjg=;
        b=TKBXlG7eLSw+7nDVL3FBRktgm8gdSxaQPR2DEYRqRDfpZ+hhq1H32k0YwNhNP7x/p0
         OBb1s3ktyejHRc95xCvLVM3ni79y7gNhp38Ok6t7epweSkQRoDUARBb9Ksat2a3TbKDW
         +XLJtIx2x1Y6vpNCKL+d2ovuZ1b8cfgaKCmVQcfV0uFvf5O0NciFWLn4P8X8llx05M3D
         73+NLPMGYeHd76rXhWlcNuRDF/QrSg/+JjAVPd+xTevy3Rwrxyp1tRB+OgcVKrk3YD0D
         SHVFfLGLyEY6R3y/S1e1PrPSwrIjWwAjb3E1WRnm6vAeAWqHqsDUadUe5+S3+UZUTUaw
         r9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7r44wAX+qmiizcGaAxSCKCWdtDrp690Qges1PulPjg=;
        b=RNg9hnyfvTYIK8T/PQds2IXPopwjj3/rvch0/tbb1krxuqjvkZuqfTnfEQumHCF4zZ
         DDyFmvSWhk9e1yIUOzVuCD8BM/w4OXvxpwRmzQiPS5fMMwUmloA6N0fi0ExHfG6qVSnc
         6RBvkTCdOjYYigwzSp/eZw54foOMXJAa2b6ZQSnhriAWSNIP7VtvnT9zRI2TT+2gXORl
         IHC+lplfBSSqaOqutZiSzhzs/bJF1gcqnxWRJGB65GXGfJHafyl5uMgSHz09MiCJ1u8r
         wJswQfwpl7d+lwKvQ78++2dTQ1PPSkwU+SQvLrJ4qnuy3kAcx60mHvVMHYg/pC1Ci9xD
         QD2A==
X-Gm-Message-State: AOAM532ebl5tMUqQLxBft1y+GsS7/i3fMeZ+hIGczj8YVouDZIDtOts0
	AFmw4L7D9ezxCQbabADjrT29deR7l9o=
X-Google-Smtp-Source: ABdhPJwTBJ22NGsb4ghX4HGVfKpZD0QPQHlj7I++TA2m8z2nR+gbon2UWIPfzNmX8BxyiEzJnF/n7A==
X-Received: by 2002:a05:6808:2114:: with SMTP id r20mr4813048oiw.110.1631453975486;
        Sun, 12 Sep 2021 06:39:35 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id a15sm1131853otq.13.2021.09.12.06.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 06:39:35 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 2/2] staging: vchiq_dev: cleanup code alignment issues
Date: Sun, 12 Sep 2021 10:37:52 -0300
Message-Id: <20210912133751.269885-2-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912133751.269885-1-gascoar@gmail.com>
References: <20210912133751.269885-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix code alignment issues.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../interface/vchiq_arm/vchiq_dev.c           | 104 +++++++-----------
 1 file changed, 42 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index c990d5d7bfb5..32aa1e62450d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -48,8 +48,8 @@ user_service_free(void *userdata)
 static void close_delivered(struct user_service *user_service)
 {
 	vchiq_log_info(vchiq_arm_log_level,
-		"%s(handle=%x)",
-		__func__, user_service->service->handle);
+		       "%s(handle=%x)",
+		       __func__, user_service->service->handle);
 
 	if (user_service->close_pending) {
 		/* Allow the underlying service to be culled */
@@ -90,8 +90,8 @@ static ssize_t vchiq_ioc_copy_element_data(void *context, void *dest,
 				       maxsize - total_bytes_copied);
 
 		if (copy_from_user(dest + total_bytes_copied,
-				  cc->element->data + cc->element_offset,
-				  bytes_this_round))
+				   cc->element->data + cc->element_offset,
+				   bytes_this_round))
 			return -EFAULT;
 
 		cc->element_offset += bytes_this_round;
@@ -235,10 +235,9 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 		do {
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
-			if (wait_for_completion_interruptible(
-				&user_service->insert_event)) {
+			if (wait_for_completion_interruptible(&user_service->insert_event)) {
 				vchiq_log_info(vchiq_arm_log_level,
-					"DEQUEUE_MESSAGE interrupted");
+					       "DEQUEUE_MESSAGE interrupted");
 				ret = -EINTR;
 				break;
 			}
@@ -266,8 +265,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 		ret = -ENOTCONN;
 	} else if (header->size <= args->bufsize) {
 		/* Copy to user space if msgbuf is not NULL */
-		if (!args->buf || (copy_to_user(args->buf,
-					header->data, header->size) == 0)) {
+		if (!args->buf || (copy_to_user(args->buf, header->data, header->size) == 0)) {
 			ret = header->size;
 			vchiq_release_message(service->handle, header);
 		} else {
@@ -275,8 +273,8 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 		}
 	} else {
 		vchiq_log_error(vchiq_arm_log_level,
-			"header %pK: bufsize %x < size %x",
-			header, args->bufsize, header->size);
+				"header %pK: bufsize %x < size %x",
+				header, args->bufsize, header->size);
 		WARN(1, "invalid size\n");
 		ret = -EMSGSIZE;
 	}
@@ -323,14 +321,12 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
 		if (!found) {
 			vchiq_log_error(vchiq_arm_log_level,
-				"no bulk_waiter found for pid %d",
-				current->pid);
+					"no bulk_waiter found for pid %d", current->pid);
 			ret = -ESRCH;
 			goto out;
 		}
 		vchiq_log_info(vchiq_arm_log_level,
-			"found bulk_waiter %pK for pid %d", waiter,
-			current->pid);
+			       "found bulk_waiter %pK for pid %d", waiter, current->pid);
 		userdata = &waiter->bulk_waiter;
 	} else {
 		userdata = args->userdata;
@@ -345,7 +341,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 	}
 
 	if ((status != VCHIQ_RETRY) || fatal_signal_pending(current) ||
-		!waiter->bulk_waiter.bulk) {
+	    !waiter->bulk_waiter.bulk) {
 		if (waiter->bulk_waiter.bulk) {
 			/* Cancel the signal when the transfer completes. */
 			spin_lock(&bulk_waiter_spinlock);
@@ -362,8 +358,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		list_add(&waiter->list, &instance->bulk_waiter_list);
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
 		vchiq_log_info(vchiq_arm_log_level,
-			"saved bulk_waiter %pK for pid %d",
-			waiter, current->pid);
+			       "saved bulk_waiter %pK for pid %d", waiter, current->pid);
 
 		ret = put_user(mode_waiting, mode);
 	}
@@ -453,19 +448,17 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 	mutex_lock(&instance->completion_mutex);
 
 	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
-	while ((instance->completion_remove == instance->completion_insert)
-		&& !instance->closing) {
+	while ((instance->completion_remove == instance->completion_insert) && !instance->closing) {
 		int rc;
 
 		DEBUG_TRACE(AWAIT_COMPLETION_LINE);
 		mutex_unlock(&instance->completion_mutex);
-		rc = wait_for_completion_interruptible(
-					&instance->insert_event);
+		rc = wait_for_completion_interruptible(&instance->insert_event);
 		mutex_lock(&instance->completion_mutex);
 		if (rc) {
 			DEBUG_TRACE(AWAIT_COMPLETION_LINE);
 			vchiq_log_info(vchiq_arm_log_level,
-				"AWAIT_COMPLETION interrupted");
+				       "AWAIT_COMPLETION interrupted");
 			ret = -EINTR;
 			goto out;
 		}
@@ -485,8 +478,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 		if (remove == instance->completion_insert)
 			break;
 
-		completion = &instance->completions[
-			remove & (MAX_COMPLETIONS - 1)];
+		completion = &instance->completions[remove & (MAX_COMPLETIONS - 1)];
 
 		/*
 		 * A read memory barrier is needed to stop
@@ -512,9 +504,9 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 			/* This must be a VCHIQ-style service */
 			if (args->msgbufsize < msglen) {
 				vchiq_log_error(vchiq_arm_log_level,
-					"header %pK: msgbufsize %x < msglen %x",
-					header, args->msgbufsize, msglen);
-				WARN(1, "invalid message size\n");
+						"header %pK: msgbufsize %x < msglen %x",
+						header, args->msgbufsize, msglen);
+						WARN(1, "invalid message size\n");
 				if (ret == 0)
 					ret = -EMSGSIZE;
 				break;
@@ -525,7 +517,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 			/* Get the pointer from user space */
 			msgbufcount--;
 			if (vchiq_get_user_ptr(&msgbuf, args->msgbufs,
-						msgbufcount)) {
+					       msgbufcount)) {
 				if (ret == 0)
 					ret = -EFAULT;
 				break;
@@ -593,11 +585,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	int i, rc;
 
 	vchiq_log_trace(vchiq_arm_log_level,
-		"%s - instance %pK, cmd %s, arg %lx",
-		__func__, instance,
-		((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) &&
-		(_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
-		ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
+			"%s - instance %pK, cmd %s, arg %lx", __func__, instance,
+			((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
+			ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
 
 	switch (cmd) {
 	case VCHIQ_IOC_SHUTDOWN:
@@ -607,7 +597,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		/* Remove all services */
 		i = 0;
 		while ((service = next_service_by_instance(instance->state,
-			instance, &i))) {
+							   instance, &i))) {
 			status = vchiq_remove_service(service->handle);
 			vchiq_service_put(service);
 			if (status != VCHIQ_SUCCESS)
@@ -631,8 +621,8 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		rc = mutex_lock_killable(&instance->state->mutex);
 		if (rc) {
 			vchiq_log_error(vchiq_arm_log_level,
-				"vchiq: connect: could not lock mutex for state %d: %d",
-				instance->state->id, rc);
+					"vchiq: connect: could not lock mutex for state %d: %d",
+					instance->state->id, rc);
 			ret = -EINTR;
 			break;
 		}
@@ -643,7 +633,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			instance->connected = 1;
 		else
 			vchiq_log_error(vchiq_arm_log_level,
-				"vchiq: could not connect: %d", status);
+					"vchiq: could not connect: %d", status);
 		break;
 
 	case VCHIQ_IOC_CREATE_SERVICE: {
@@ -697,8 +687,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		 * CLOSE_DELIVERED ioctl, signalling close_event.
 		 */
 		if (user_service->close_pending &&
-			wait_for_completion_interruptible(
-				&user_service->close_event))
+		    wait_for_completion_interruptible(&user_service->close_event))
 			status = VCHIQ_RETRY;
 		break;
 	}
@@ -714,14 +703,12 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				vchiq_release_service_internal(service);
 			if (ret) {
 				vchiq_log_error(vchiq_susp_log_level,
-					"%s: cmd %s returned error %ld for service %c%c%c%c:%03d",
-					__func__,
-					(cmd == VCHIQ_IOC_USE_SERVICE) ?
+						"%s: cmd %s returned error %ld for service %c%c%c%c:%03d",
+						__func__, (cmd == VCHIQ_IOC_USE_SERVICE) ?
 						"VCHIQ_IOC_USE_SERVICE" :
 						"VCHIQ_IOC_RELEASE_SERVICE",
 					ret,
-					VCHIQ_FOURCC_AS_4CHARS(
-						service->base.fourcc),
+					VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
 					service->client_id);
 			}
 		} else {
@@ -745,7 +732,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			struct vchiq_element elements[MAX_ELEMENTS];
 
 			if (copy_from_user(elements, args.elements,
-				args.count * sizeof(struct vchiq_element)) == 0)
+					   args.count * sizeof(struct vchiq_element)) == 0)
 				ret = vchiq_ioc_queue_message(args.handle, elements,
 							      args.count);
 			else
@@ -883,23 +870,16 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			ret = -EINTR;
 	}
 
-	if ((status == VCHIQ_SUCCESS) && (ret < 0) && (ret != -EINTR) &&
-		(ret != -EWOULDBLOCK))
+	if ((status == VCHIQ_SUCCESS) && (ret < 0) && (ret != -EINTR) && (ret != -EWOULDBLOCK))
 		vchiq_log_info(vchiq_arm_log_level,
-			"  ioctl instance %pK, cmd %s -> status %d, %ld",
-			instance,
-			(_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
-				ioctl_names[_IOC_NR(cmd)] :
-				"<invalid>",
-			status, ret);
+			       "  ioctl instance %pK, cmd %s -> status %d, %ld",
+			       instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
+			       ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	else
 		vchiq_log_trace(vchiq_arm_log_level,
-			"  ioctl instance %pK, cmd %s -> status %d, %ld",
-			instance,
-			(_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
-				ioctl_names[_IOC_NR(cmd)] :
-				"<invalid>",
-			status, ret);
+				"  ioctl instance %pK, cmd %s -> status %d, %ld",
+				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
+				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 
 	return ret;
 }
@@ -1297,8 +1277,8 @@ static int vchiq_release(struct inode *inode, struct file *file)
 		struct vchiq_completion_data_kernel *completion;
 		struct vchiq_service *service;
 
-		completion = &instance->completions[
-			instance->completion_remove & (MAX_COMPLETIONS - 1)];
+		completion = &instance->completions[instance->completion_remove
+						    & (MAX_COMPLETIONS - 1)];
 		service = completion->service_userdata;
 		if (completion->reason == VCHIQ_SERVICE_CLOSED) {
 			struct user_service *user_service =
-- 
2.33.0

