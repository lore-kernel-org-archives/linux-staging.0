Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DAB745E4
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945051; cv=none; b=OvhUk4ZgLCOpWodD99DlNmjyDzUNLmarygp0E4xL/irxIQJgnYf/7w4eHn/GVQJ2j2YChTjkezLZgf1WrhtJ/FGowhaecUz+mOD8Hwm9LUxanO+XOjd+1/81qWOq4PEQL3XUONHbE2NCT29+xyqsavgqHtHU+jp+9vHVicnu8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945051; c=relaxed/simple;
	bh=8yQQurAZZJHlw0JTiw6NfQoZliVRazUmPh5ByGi6HHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBgIqv8C3eFZlgya8xe5hzAXF+2cirZygAjUNWhnlho9Fpwki5hVUnUl8WdgWwPggZ8F0j5C6IcfRWL7+B00AsVIkVQlzDcY30hhMbNRXWy6uaA4hb/jhgLBsHgZw7y3vakWGfBYPEYmkjSX3soiGVM5fuaTLeNjReeqc+3Sn/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=la3/xunw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="la3/xunw"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AF35CDB;
	Tue, 10 Sep 2024 07:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725944971;
	bh=8yQQurAZZJHlw0JTiw6NfQoZliVRazUmPh5ByGi6HHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=la3/xunwzYKuEC0eETiBxqV8TVYBBwnjLBqBnw1KKSJaFJ/1hczNxxFbFf5qiXefL
	 TNDVkDGj/lxXZMILTZX4Z2s1YbxuCc8v7unObLRwoHKaJqq5mXX7oiX6e6910M/X3S
	 i3fYjcGqsdisZlX2B0wQgspOjKvrPh58Ct+KUcdE=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v6 5/7] staging: vchiq_core: Drop vchiq_bulk_transfer()
Date: Tue, 10 Sep 2024 10:40:05 +0530
Message-ID: <20240910051007.297227-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240910051007.297227-1-umang.jain@ideasonboard.com>
References: <20240910051007.297227-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop vchiq_bulk_transfer() as every VCHIQ_BULK_MODE_* mode
now have their own dedicated functions to execute bulk transfers.

Also, drop the temporary label we introduced earlier in vchiq-dev.c
to jump over the vchiq_bulk_transfer() call when each separate mode
helper was being developed.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 60 -------------------
 .../interface/vchiq_arm/vchiq_core.h          |  5 --
 .../interface/vchiq_arm/vchiq_dev.c           |  8 ---
 3 files changed, 73 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 84e9059202ec..29203c510952 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3169,66 +3169,6 @@ vchiq_bulk_xfer_callback_interruptible(struct vchiq_instance *instance, unsigned
 	return status;
 }
 
-/*
- * This function may be called by kernel threads or user threads.
- * User threads may receive -EAGAIN to indicate that a signal has been
- * received and the call should be retried after being returned to user
- * context.
- * When called in blocking mode, the userdata field points to a bulk_waiter
- * structure.
- */
-int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
-			void *offset, void __user *uoffset, int size, void *userdata,
-			enum vchiq_bulk_mode mode, enum vchiq_bulk_dir dir)
-{
-	struct vchiq_service *service = find_service_by_handle(instance, handle);
-	struct bulk_waiter *bulk_waiter = NULL;
-	struct vchiq_bulk *bulk;
-	int status = -EINVAL;
-
-	if (!service)
-		goto error_exit;
-
-	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
-		goto error_exit;
-
-	if (!offset && !uoffset)
-		goto error_exit;
-
-	if (vchiq_check_service(service))
-		goto error_exit;
-
-	switch (mode) {
-	case VCHIQ_BULK_MODE_NOCALLBACK:
-	case VCHIQ_BULK_MODE_CALLBACK:
-		break;
-	default:
-		goto error_exit;
-	}
-
-	status = vchiq_bulk_xfer_queue_msg_interruptible(service, offset, uoffset,
-							 size, userdata, mode, dir);
-	if (status)
-		goto error_exit;
-
-	vchiq_service_put(service);
-
-	if (bulk_waiter) {
-		bulk_waiter->bulk = bulk;
-		if (wait_for_completion_interruptible(&bulk_waiter->event))
-			status = -EAGAIN;
-		else if (bulk_waiter->actual == VCHIQ_BULK_ACTUAL_ABORTED)
-			status = -EINVAL;
-	}
-
-	return 0;
-
-error_exit:
-	if (service)
-		vchiq_service_put(service);
-	return status;
-}
-
 /*
  * This function is called by VCHIQ ioctl interface and is interruptible.
  * It may receive -EAGAIN to indicate that a signal has been received
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 9c8c076eaaeb..468463f31801 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -485,11 +485,6 @@ vchiq_bulk_xfer_callback_interruptible(struct vchiq_instance *instance, unsigned
 				       enum vchiq_bulk_mode mode, void *userdata,
 				       enum vchiq_bulk_dir dir);
 
-extern int
-vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *offset,
-		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mode mode,
-		    enum vchiq_bulk_dir dir);
-
 extern void
 vchiq_dump_state(struct seq_file *f, struct vchiq_state *state);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 169a2ffda996..d41a4624cc92 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -309,7 +309,6 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 								NULL, args->data, args->size,
 								userdata, dir);
 
-		goto bulk_transfer_handled;
 	} else if (args->mode == VCHIQ_BULK_MODE_WAITING) {
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_for_each_entry(iter, &instance->bulk_waiter_list,
@@ -332,8 +331,6 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		userdata = &waiter->bulk_waiter;
 
 		status = vchiq_bulk_xfer_waiting_interruptible(instance, args->handle, userdata);
-
-		goto bulk_transfer_handled;
 	} else {
 		userdata = args->userdata;
 
@@ -341,13 +338,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 								args->data, args->size,
 								args->mode, userdata, dir);
 
-		goto bulk_transfer_handled;
 	}
 
-	status = vchiq_bulk_transfer(instance, args->handle, NULL, args->data, args->size,
-				     userdata, args->mode, dir);
-
-bulk_transfer_handled:
 	if (!waiter) {
 		ret = 0;
 		goto out;
-- 
2.45.0

