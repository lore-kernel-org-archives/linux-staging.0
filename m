Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC315531E
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976030; cv=none; b=ZApZ978AdJPX5WADN3YdDgifUMSWwEQMxz85Hh2/11VVLBmxvMQL8jAEpMV8+ZIShHN+EiTmiiM8lYWgwoZ6p5rXNxfDTaL+ecPPiW4mUm1gBqEnD6LnxKreSKa7aGqImoGzAlVhGNr4mKKzUfPnPzKMjkWdVdGNYr76E6Tv8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976030; c=relaxed/simple;
	bh=0VNrysURQwB1o+d6JGMlX3z+roN5nLN+ihSOu6DcA3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uLPXCexmPlzSWcSJ91pD3U+VxxcRA/+Rf8Th+jOQYuTi2EXp3SOffFKIIRFkAwjdtJcUUmUBWvQ5tdVrzz1+kBPlaeJb0bw3JN5Joa/JTVbWFLJRNStEwAyRtHm3K8UauxhfV5ZtbIe6g/e59gn0r6rJyrH+g3+LoV/m4XVfuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=QkllLSfO; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QkllLSfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976015; x=1719580815; i=wahrenst@gmx.net;
	bh=o8GKLwh+nv/Ie+gqmpfYUPt//UHosAXpX+nkpmI0TLA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QkllLSfOMUOyKUpzX3xYrmqAqXlmMWbyT+XsvPvdMJAE1qStlBUUhmC3x6QvdIDS
	 BpvHQtK9WYR8vxEmZjxwwz/5uRe+yYNjrnOcMxDWycG7AuMkVK28Fkm0rXs6MBndI
	 yiC1+OR6PNix/t9YmzIYJVxLlRYrkbUUkVA4qHHj6bCtpaprkQ9//vh+SJUIwLz5A
	 0eyQbAWqRXMKWUz0wHPL3LlIpUcMkMGWsfZDvws8GQ3tmQcSydbKBmIsuYEeT2Xh1
	 xKmRea8EguxcTxAMKselbE+iSQzFIvCp2k397t7vldaeOJ9Ix+Gzbqx2Vcqekr1mG
	 RvEHfwBkNNJx4GV+WA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1sNO0T2cQs-003XHq; Fri, 21
 Jun 2024 15:20:15 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 01/10] staging: vchiq_arm: Unify return code variable
Date: Fri, 21 Jun 2024 15:19:49 +0200
Message-Id: <20240621131958.98208-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621131958.98208-1-wahrenst@gmx.net>
References: <20240621131958.98208-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V9V6Ap4Og4UnlRSyDyXvvxX6yvJdAoS8ckNHB0vEu4LZdKU5ya4
 zWysFaOfbTpwdJ2b42LTIgb1r1zwddG4C53a+p972A3O7zd6RRFhiIypREgo1hooMMwUOIe
 5hxFed1WD8wyJLufSXz/7sCetcQhW+sJkbk3SZzcHpN9H22SMT5SYKqA3NAhYC1A8pAO3hz
 cBtPWB74dTzkyVuqDaBxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8Aau/RPmQC4=;zxPbB8GEx75ysvMjDY25hd8XHPa
 2Uh3lyXvQ8x9FkXLo1v3ZulRg9dm34ZxqY0Awi3ZDKxpRKcWDSqQkrzxMN+LtcS0EeKJTLkW7
 5LxxqB0wa9vQ0WcN1p7M9jW6G16cYzYSmzFkooBP6A83l23IB580NtrKDewhfp/tJcGvIruUG
 nndSrjEmKUBP4HEeqklk4+bHJsNRirl9GwOI7QxkF1iC7XkWZxY2huvzsR/EaW2e5syWyO/sa
 R7tds+LvLrUgoxnJQOkMfaKwKYcUg+B83t7ZaFKELbCJI0yKGeb8o+zpqBebt3KRGlTSFSIy5
 nmvox+0hNKTGbNd2eYFNQAqEsOFlNC8h4sC8Ttdl4NwQvUp9KJKt5vvKT47emPreSjbLvzLga
 D6BOJknBjKfykPyZhUg7+f9UFn6dPjQMnayYdLOXF9G19JdHbIuEW8gOCGpw2Yk8bLQrFBxia
 y1DAvk94QUj5/kEQEC/wkw6VWoaPt83QQ/uVGU6xzowjrUVoogRzbO03fltLYEeDXyV9+Jsfk
 itzL7uha/BPnnmVFVMfiCE/JGm+TPpNezdlPTAcC0TULmpVMPJ77qbC2grqmkgu9DoEI34CkX
 YceEV/W12jOHF6r2GbRana+SQ11MR9Tz+LlJ/zPxNVzp9dNM6poZq/DkJwEGG1oOQgh5igTl0
 5jKM3xnSouhkoypLrveT/pv2Y9O1SekGH1AO38PvwqWmtOIG7voYNYHn5Xe0RTJDmYdbg60dU
 fHHChAP2IDDAdDECt2nG8f9iCNU/2g3qzcGQVx9RCSA7oc+PijpTZfB6Db7rqny4molbADMZd
 Pchj5SgJpEt5MVIGIxr8szgeMM0sv6v+M5sXpM27rIhyg=

The file vchiq_arm uses a wild mixture of variable names for
return codes. Unify them by using the common name "ret".

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 141 +++++++++---------
 1 file changed, 69 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 5f518e5a9273..2357402f8ab9 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -758,8 +758,8 @@ void free_bulk_waiter(struct vchiq_instance *instance)

 int vchiq_shutdown(struct vchiq_instance *instance)
 {
-	int status =3D 0;
 	struct vchiq_state *state =3D instance->state;
+	int ret =3D 0;

 	if (mutex_lock_killable(&state->mutex))
 		return -EAGAIN;
@@ -769,12 +769,12 @@ int vchiq_shutdown(struct vchiq_instance *instance)

 	mutex_unlock(&state->mutex);

-	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);

 	free_bulk_waiter(instance);
 	kfree(instance);

-	return status;
+	return ret;
 }
 EXPORT_SYMBOL(vchiq_shutdown);

@@ -785,26 +785,26 @@ static int vchiq_is_connected(struct vchiq_instance =
*instance)

 int vchiq_connect(struct vchiq_instance *instance)
 {
-	int status;
 	struct vchiq_state *state =3D instance->state;
+	int ret;

 	if (mutex_lock_killable(&state->mutex)) {
 		dev_dbg(state->dev,
 			"core: call to mutex_lock failed\n");
-		status =3D -EAGAIN;
+		ret =3D -EAGAIN;
 		goto failed;
 	}
-	status =3D vchiq_connect_internal(state, instance);
+	ret =3D vchiq_connect_internal(state, instance);

-	if (!status)
+	if (!ret)
 		instance->connected =3D 1;

 	mutex_unlock(&state->mutex);

 failed:
-	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);

-	return status;
+	return ret;
 }
 EXPORT_SYMBOL(vchiq_connect);

@@ -813,10 +813,9 @@ vchiq_add_service(struct vchiq_instance *instance,
 		  const struct vchiq_service_params_kernel *params,
 		  unsigned int *phandle)
 {
-	int status;
 	struct vchiq_state *state =3D instance->state;
 	struct vchiq_service *service =3D NULL;
-	int srvstate;
+	int srvstate, ret;

 	*phandle =3D VCHIQ_SERVICE_HANDLE_INVALID;

@@ -828,14 +827,14 @@ vchiq_add_service(struct vchiq_instance *instance,

 	if (service) {
 		*phandle =3D service->handle;
-		status =3D 0;
+		ret =3D 0;
 	} else {
-		status =3D -EINVAL;
+		ret =3D -EINVAL;
 	}

-	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);

-	return status;
+	return ret;
 }

 int
@@ -843,9 +842,9 @@ vchiq_open_service(struct vchiq_instance *instance,
 		   const struct vchiq_service_params_kernel *params,
 		   unsigned int *phandle)
 {
-	int status =3D -EINVAL;
 	struct vchiq_state   *state =3D instance->state;
 	struct vchiq_service *service =3D NULL;
+	int ret =3D -EINVAL;

 	*phandle =3D VCHIQ_SERVICE_HANDLE_INVALID;

@@ -856,17 +855,17 @@ vchiq_open_service(struct vchiq_instance *instance,

 	if (service) {
 		*phandle =3D service->handle;
-		status =3D vchiq_open_service_internal(service, current->pid);
-		if (status) {
+		ret =3D vchiq_open_service_internal(service, current->pid);
+		if (ret) {
 			vchiq_remove_service(instance, service->handle);
 			*phandle =3D VCHIQ_SERVICE_HANDLE_INVALID;
 		}
 	}

 failed:
-	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);

-	return status;
+	return ret;
 }
 EXPORT_SYMBOL(vchiq_open_service);

@@ -874,20 +873,20 @@ int
 vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int handle,=
 const void *data,
 		    unsigned int size, void *userdata, enum vchiq_bulk_mode mode)
 {
-	int status;
+	int ret;

 	while (1) {
 		switch (mode) {
 		case VCHIQ_BULK_MODE_NOCALLBACK:
 		case VCHIQ_BULK_MODE_CALLBACK:
-			status =3D vchiq_bulk_transfer(instance, handle,
-						     (void *)data, NULL,
-						     size, userdata, mode,
-						     VCHIQ_BULK_TRANSMIT);
+			ret =3D vchiq_bulk_transfer(instance, handle,
+						  (void *)data, NULL,
+						  size, userdata, mode,
+						  VCHIQ_BULK_TRANSMIT);
 			break;
 		case VCHIQ_BULK_MODE_BLOCKING:
-			status =3D vchiq_blocking_bulk_transfer(instance, handle, (void *)data=
, size,
-							      VCHIQ_BULK_TRANSMIT);
+			ret =3D vchiq_blocking_bulk_transfer(instance, handle, (void *)data, s=
ize,
+							   VCHIQ_BULK_TRANSMIT);
 			break;
 		default:
 			return -EINVAL;
@@ -898,13 +897,13 @@ vchiq_bulk_transmit(struct vchiq_instance *instance,=
 unsigned int handle, const
 		 * to implement a retry mechanism since this function is
 		 * supposed to block until queued
 		 */
-		if (status !=3D -EAGAIN)
+		if (ret !=3D -EAGAIN)
 			break;

 		msleep(1);
 	}

-	return status;
+	return ret;
 }
 EXPORT_SYMBOL(vchiq_bulk_transmit);

@@ -912,19 +911,19 @@ int vchiq_bulk_receive(struct vchiq_instance *instan=
ce, unsigned int handle,
 		       void *data, unsigned int size, void *userdata,
 		       enum vchiq_bulk_mode mode)
 {
-	int status;
+	int ret;

 	while (1) {
 		switch (mode) {
 		case VCHIQ_BULK_MODE_NOCALLBACK:
 		case VCHIQ_BULK_MODE_CALLBACK:
-			status =3D vchiq_bulk_transfer(instance, handle, data, NULL,
-						     size, userdata,
-						     mode, VCHIQ_BULK_RECEIVE);
+			ret =3D vchiq_bulk_transfer(instance, handle, data, NULL,
+						  size, userdata,
+						  mode, VCHIQ_BULK_RECEIVE);
 			break;
 		case VCHIQ_BULK_MODE_BLOCKING:
-			status =3D vchiq_blocking_bulk_transfer(instance, handle, (void *)data=
, size,
-							      VCHIQ_BULK_RECEIVE);
+			ret =3D vchiq_blocking_bulk_transfer(instance, handle, (void *)data, s=
ize,
+							   VCHIQ_BULK_RECEIVE);
 			break;
 		default:
 			return -EINVAL;
@@ -935,13 +934,13 @@ int vchiq_bulk_receive(struct vchiq_instance *instan=
ce, unsigned int handle,
 		 * to implement a retry mechanism since this function is
 		 * supposed to block until queued
 		 */
-		if (status !=3D -EAGAIN)
+		if (ret !=3D -EAGAIN)
 			break;

 		msleep(1);
 	}

-	return status;
+	return ret;
 }
 EXPORT_SYMBOL(vchiq_bulk_receive);

@@ -950,8 +949,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *in=
stance, unsigned int handl
 			     unsigned int size, enum vchiq_bulk_dir dir)
 {
 	struct vchiq_service *service;
-	int status;
 	struct bulk_waiter_node *waiter =3D NULL, *iter;
+	int ret;

 	service =3D find_service_by_handle(instance, handle);
 	if (!service)
@@ -991,10 +990,10 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *=
instance, unsigned int handl
 			return -ENOMEM;
 	}

-	status =3D vchiq_bulk_transfer(instance, handle, data, NULL, size,
-				     &waiter->bulk_waiter,
-				     VCHIQ_BULK_MODE_BLOCKING, dir);
-	if ((status !=3D -EAGAIN) || fatal_signal_pending(current) || !waiter->b=
ulk_waiter.bulk) {
+	ret =3D vchiq_bulk_transfer(instance, handle, data, NULL, size,
+				  &waiter->bulk_waiter,
+				  VCHIQ_BULK_MODE_BLOCKING, dir);
+	if ((ret !=3D -EAGAIN) || fatal_signal_pending(current) || !waiter->bulk=
_waiter.bulk) {
 		struct vchiq_bulk *bulk =3D waiter->bulk_waiter.bulk;

 		if (bulk) {
@@ -1013,7 +1012,7 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *=
instance, unsigned int handl
 			waiter, current->pid);
 	}

-	return status;
+	return ret;
 }

 static int
@@ -1137,17 +1136,17 @@ service_callback(struct vchiq_instance *instance, =
enum vchiq_reason reason,
 			 */
 			if ((user_service->message_available_pos -
 				instance->completion_remove) < 0) {
-				int status;
+				int ret;

 				dev_dbg(instance->state->dev,
 					"arm: Inserting extra MESSAGE_AVAILABLE\n");
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-				status =3D add_completion(instance, reason, NULL, user_service,
-							bulk_userdata);
-				if (status) {
+				ret =3D add_completion(instance, reason, NULL, user_service,
+						     bulk_userdata);
+				if (ret) {
 					DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 					vchiq_service_put(service);
-					return status;
+					return ret;
 				}
 			}

@@ -1294,8 +1293,6 @@ vchiq_keepalive_thread_func(void *v)
 {
 	struct vchiq_state *state =3D (struct vchiq_state *)v;
 	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
-
-	int status;
 	struct vchiq_instance *instance;
 	unsigned int ka_handle;
 	int ret;
@@ -1313,16 +1310,16 @@ vchiq_keepalive_thread_func(void *v)
 		goto exit;
 	}

-	status =3D vchiq_connect(instance);
-	if (status) {
-		dev_err(state->dev, "suspend: %s: vchiq_connect failed %d\n", __func__,=
 status);
+	ret =3D vchiq_connect(instance);
+	if (ret) {
+		dev_err(state->dev, "suspend: %s: vchiq_connect failed %d\n", __func__,=
 ret);
 		goto shutdown;
 	}

-	status =3D vchiq_add_service(instance, &params, &ka_handle);
-	if (status) {
+	ret =3D vchiq_add_service(instance, &params, &ka_handle);
+	if (ret) {
 		dev_err(state->dev, "suspend: %s: vchiq_open_service failed %d\n",
-			__func__, status);
+			__func__, ret);
 		goto shutdown;
 	}

@@ -1348,17 +1345,17 @@ vchiq_keepalive_thread_func(void *v)
 		 */
 		while (uc--) {
 			atomic_inc(&arm_state->ka_use_ack_count);
-			status =3D vchiq_use_service(instance, ka_handle);
-			if (status) {
+			ret =3D vchiq_use_service(instance, ka_handle);
+			if (ret) {
 				dev_err(state->dev, "suspend: %s: vchiq_use_service error %d\n",
-					__func__, status);
+					__func__, ret);
 			}
 		}
 		while (rc--) {
-			status =3D vchiq_release_service(instance, ka_handle);
-			if (status) {
+			ret =3D vchiq_release_service(instance, ka_handle);
+			if (ret) {
 				dev_err(state->dev, "suspend: %s: vchiq_release_service error %d\n",
-					__func__, status);
+					__func__, ret);
 			}
 		}
 	}
@@ -1408,13 +1405,13 @@ vchiq_use_internal(struct vchiq_state *state, stru=
ct vchiq_service *service,
 	write_unlock_bh(&arm_state->susp_res_lock);

 	if (!ret) {
-		int status =3D 0;
+		int ret =3D 0;
 		long ack_cnt =3D atomic_xchg(&arm_state->ka_use_ack_count, 0);

-		while (ack_cnt && !status) {
+		while (ack_cnt && !ret) {
 			/* Send the use notify to videocore */
-			status =3D vchiq_send_remote_use_active(state);
-			if (!status)
+			ret =3D vchiq_send_remote_use_active(state);
+			if (!ret)
 				ack_cnt--;
 			else
 				atomic_add(ack_cnt, &arm_state->ka_use_ack_count);
@@ -1730,7 +1727,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	struct device_node *fw_node;
 	const struct vchiq_platform_info *info;
 	struct vchiq_drv_mgmt *mgmt;
-	int err;
+	int ret;

 	info =3D of_device_get_match_data(&pdev->dev);
 	if (!info)
@@ -1755,8 +1752,8 @@ static int vchiq_probe(struct platform_device *pdev)
 	mgmt->info =3D info;
 	platform_set_drvdata(pdev, mgmt);

-	err =3D vchiq_platform_init(pdev, &mgmt->state);
-	if (err)
+	ret =3D vchiq_platform_init(pdev, &mgmt->state);
+	if (ret)
 		goto failed_platform_init;

 	vchiq_debugfs_init(&mgmt->state);
@@ -1768,8 +1765,8 @@ static int vchiq_probe(struct platform_device *pdev)
 	 * Simply exit on error since the function handles cleanup in
 	 * cases of failure.
 	 */
-	err =3D vchiq_register_chrdev(&pdev->dev);
-	if (err) {
+	ret =3D vchiq_register_chrdev(&pdev->dev);
+	if (ret) {
 		dev_err(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
 		goto error_exit;
 	}
@@ -1782,7 +1779,7 @@ static int vchiq_probe(struct platform_device *pdev)
 failed_platform_init:
 	dev_err(&pdev->dev, "arm: Could not initialize vchiq platform\n");
 error_exit:
-	return err;
+	return ret;
 }

 static void vchiq_remove(struct platform_device *pdev)
=2D-
2.34.1

