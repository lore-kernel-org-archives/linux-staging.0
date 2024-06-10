Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C629314277
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053375; cv=none; b=BWViV7+k1W0pydgYQdc4m5Cg0A+IZ9Exe8FvAiaLVr5+xvSFTFPt4MRFC+oAl174YxPwhcSN17gGe7Ohdmd8fFXd1O84COZmPS46tRvjwSL4Dtd3DxR2D9QbL/GPMrjXczGvMnv/MFo8VnEe0L8dfTSnKn6+TMsK/o8LHQUmMKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053375; c=relaxed/simple;
	bh=2P6dbolERbvcW16fq+0DC4YFeYDim/m7OldR7FbLZ04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s2laDekrfTLEFxhcX9QQ6/5LZb0s/bfiQlRPijJkCLne2wIkIjOcWUc2i3clJ/0gOIB8TgbNns85KN6VTs19Y+9cQMBcX7URQsWNyia39APO28CSS+5ttqkxWxK5tgPv/EwENt+1CJoz3xVC7Wwqyz282laY9AGxWj23+c0EY+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=lE7EfIUp; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lE7EfIUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053362; x=1718658162; i=wahrenst@gmx.net;
	bh=CX0elZU1BOrD+3JnM1h8kBLVGBem/ip5vLma+2ZQpus=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lE7EfIUpWjPKrcwoS2Cu6aFDj4ef/rdaKgQlOsRvfQgKTtkkn+jbaGrj4HQy8+Il
	 jiD5PW7Jr7Tb/dMm0a/UT7jyZCZDbbniJgdFO7qKdY137GxOCZu0DflB6BcTgpUpz
	 D46OBGf50a2bRCiyBJPlLjl1QpYsFkTpVP4l1vYHpotRSK00JP1GjH+VCVHTet1t8
	 9Dmar2X/XNQVR/OIO0tT1m+y7kr0RqKyoCBow27HdW+fQReSEJRJcjvoA9QVdjqJC
	 lgGgalOfeqKzZUdOgR2K1qzpEVKM1FDyVf7MNH2ayR+lDmalz2zvjgza673cLnX/a
	 rf86BD6ZtT7bNkgPnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1rpj5H3XWs-00OH5w; Mon, 10
 Jun 2024 23:02:41 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 01/10] staging: vchiq_arm: Unify return code variable
Date: Mon, 10 Jun 2024 23:02:11 +0200
Message-Id: <20240610210220.95524-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610210220.95524-1-wahrenst@gmx.net>
References: <20240610210220.95524-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:geLROGqz9EK4LFNdfD9gOq9Of66dYum1RMMTY+lNGEWfakarZ+v
 86K4LwQDc7hvrmDKoQ7owHr/YR3IGu6J3f7bi2MA8U1LaGJr8cKvDMcvtrehz9jYFMblCLf
 W7kJ4LScxVKse+cHgIwxCAI3D2kCwCkDYdUCdnBLDxuCvPQA+NVN0DlyMYyNjARIpB114U9
 4WPXkiG1iESbxRNnhJsxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ROW5y6iz2/Y=;6TqedBrg3U3cFVRV/4OXaSm3vox
 qxDgCLy6L2IPfrldR38ED0jOmKnZWfoOkAMFRF+yqgSJS2LSi6IAV0HXXPRUrFGZw05mvloP1
 oiQpFtbMzvEXieEDady4YdLUscz9O/GYyNAZ+H9UG52N+4z61VT8iySlmtBrPTSIlC8O44j0C
 nAvFCweapUso4YWkjU4+41uiOjXyIFJVOtvEeYHAqb7+qwY8/roiJpdyau2KjG42WDs+i+Hcb
 WItOYHGf+F81thCHbEczUblnrEn3vgOnIZpG+5KcYRvWjgQJd17Mx0h9pypPuG++4yosgZk8C
 I8lLoI9Cx45Q66a+4HPhMP56URIoiIQtNVOPfrwzhSVgVa+bSabdxEvW3EVDSQMReEaJ5wOup
 q2OrSq9IYN8PJprAyoo2hFMdZpRQB8IlisDP1b9x7omBGUjnp0+RWIYXEQCHV7l2e2w7V7lei
 AN0GRZOTZchwXkuSFot1JBiF9CDAuGWjDbuayQYAu0DbU3VFk1jeQsYGZfv7sryBr46f2Ps3E
 oIRxBw/crZ1/iDU0M9fPY26llu1+ghbt4VOjbNr7DXltwdbyFNkd6ElMhIrJRM1SuWij1x6d+
 fW2ZaFpQOKp/wA3kSC7rpcJIdnOR78ftAn2FK8u4Otz13JMq2E/6+BUAWhLsMrrkCWYmrHGs0
 qlonYxfm06t8pYe3R+jxHYOpRD4N9Mpolk2fNx3ws0c7sFdqpCYlt67R52oymFQ7MO0+jbiVE
 WLMaKjmdnpscNRo0pN7U83anAS0nT+NPszxQByIgHrgmHiVzsyfj72W10Lt+HY/t0244iSggL
 IRpQuAYa/vDdcfZw1kh2jj4fzQkGzearaszMUQO3ft3Nk=

The file vchiq_arm uses a wild mixture of variable names for
return codes. Unify them by using the common name "ret".

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 141 +++++++++---------
 1 file changed, 69 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 69daeba974f2..f3815101e1c4 100644
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

