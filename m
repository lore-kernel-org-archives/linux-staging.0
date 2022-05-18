Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3479C1FCE
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LqXFhRp9PaaaW8G8vunhgy924O3tXGM7WWIkW4dE/IE=;
	b=PBo9k2jeHRnscsuJKDC5QX1fXgJstKYj3cw5PE5C6R3U+nF+hePVw+l/GjrBiuNghYk/qO
	0PYLWbWYyC8Jph6/YWzV/oBU2Oghv6zHDDCMw+qwk/KNdpYbAOqp3YOQDMSdadh1jzE3dF
	VZGQoooI0JwfLV1Io/NtKiyUE9puc+E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-pntVRA3dPNGL63LqK0AKfQ-1; Wed, 18 May 2022 15:12:06 -0400
X-MC-Unique: pntVRA3dPNGL63LqK0AKfQ-1
Received: by mail-qk1-f199.google.com with SMTP id bk23-20020a05620a1a1700b0067b32f93b90so2236456qkb.16
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LqXFhRp9PaaaW8G8vunhgy924O3tXGM7WWIkW4dE/IE=;
        b=Q2OyXFOOJKjIHG9+jY9dEGGMBTMHyPnD/Mberl7ffl8fYsgADXfSnvvcmLOigtL223
         8ekcI7N8f865cEPZVMa5ojP8+LNFIolSepY5ObMzgbE2KsEEOURrf8WBlKcAFdd3rLcJ
         PWxCJ3DKsSIvgWuzxycIP7WGBbi46c/xd5BaM96jnRHeWQYXWEMIob8j2GjlwPfY5Bt6
         K+P0KkcaqenWzdlkSIPrXDuloKuMyzCbOxskcY/Mb76h/I4GNu2nUTkqQIZFWvFXJQQs
         f1nPE2zyGAJGQL0ZhUlNaIXEaEerdVJIdUfQSBR3CA9eAzLQWcsUlwl9IPSbvud9XDvz
         9oig==
X-Gm-Message-State: AOAM531Ks3SiJrOTJJA3BJLXKa3OHc0kZ4BPkDlY8tGVJYDNc9EKn2eF
	jikyddl9jk/LRI7l6JGu4JMc0P1guLy+wiYXKC26IkXO8MZLNnGqNdE7V41+mmTbd7/M+6+Uh4/
	E8ASK5mq+Wlgb96iwDrQt7ESDwQ==
X-Received: by 2002:a05:622a:1812:b0:2f3:af3c:d1d3 with SMTP id t18-20020a05622a181200b002f3af3cd1d3mr1183884qtc.110.1652901125270;
        Wed, 18 May 2022 12:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6ARP9r6hKg/1AV87HRBvabUGOyT0GxpbiJwvl41M9N2ZJ1bKGzSPI7/Rgq8Sh3TAUYOz9SQ==
X-Received: by 2002:a05:622a:1812:b0:2f3:af3c:d1d3 with SMTP id t18-20020a05622a181200b002f3af3cd1d3mr1183850qtc.110.1652901124865;
        Wed, 18 May 2022 12:12:04 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:12:04 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/9] staging: vchiq_arm: pass vchiq instance to 'find_service_by_handle'
Date: Wed, 18 May 2022 15:11:15 -0400
Message-Id: <20220518191126.60396-5-athierry@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518191126.60396-1-athierry@redhat.com>
References: <20220518191126.60396-1-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In order to remove the 'vchiq_states' global array, we need to pass the
vchiq_instance reference to the 'handle_to_service' function, as well as
to all functions that call 'handle_to_service'. This will allow
accessing the vchiq state through the vchiq instance instead of through
the global array.

'handle_to_service' is called by 'find_service_by_handle'. Therefore,
pass the vchiq instance reference to 'find_service_by_handle' and to its
callers.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 .../bcm2835-audio/bcm2835-vchiq.c             | 27 +++++----
 .../include/linux/raspberrypi/vchiq.h         | 26 +++++----
 .../interface/vchiq_arm/vchiq_arm.c           | 16 +++---
 .../interface/vchiq_arm/vchiq_arm.h           |  4 +-
 .../interface/vchiq_arm/vchiq_core.c          | 47 ++++++++--------
 .../interface/vchiq_arm/vchiq_core.h          |  9 +--
 .../interface/vchiq_arm/vchiq_dev.c           | 36 ++++++------
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 56 +++++++++----------
 8 files changed, 118 insertions(+), 103 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index c32c8c93a615..aa2ab0df7af5 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -25,12 +25,14 @@ MODULE_PARM_DESC(force_bulk, "Force use of vchiq bulk for audio");
 static void bcm2835_audio_lock(struct bcm2835_audio_instance *instance)
 {
 	mutex_lock(&instance->vchi_mutex);
-	vchiq_use_service(instance->service_handle);
+	vchiq_use_service(instance->alsa_stream->chip->vchi_ctx->instance,
+			  instance->service_handle);
 }
 
 static void bcm2835_audio_unlock(struct bcm2835_audio_instance *instance)
 {
-	vchiq_release_service(instance->service_handle);
+	vchiq_release_service(instance->alsa_stream->chip->vchi_ctx->instance,
+			      instance->service_handle);
 	mutex_unlock(&instance->vchi_mutex);
 }
 
@@ -44,8 +46,8 @@ static int bcm2835_audio_send_msg_locked(struct bcm2835_audio_instance *instance
 		init_completion(&instance->msg_avail_comp);
 	}
 
-	status = vchiq_queue_kernel_message(instance->service_handle,
-					    m, sizeof(*m));
+	status = vchiq_queue_kernel_message(instance->alsa_stream->chip->vchi_ctx->instance,
+					    instance->service_handle, m, sizeof(*m));
 	if (status) {
 		dev_err(instance->dev,
 			"vchi message queue failed: %d, msg=%d\n",
@@ -115,7 +117,7 @@ static enum vchiq_status audio_vchi_callback(struct vchiq_instance *vchiq_instan
 		dev_err(instance->dev, "unexpected callback type=%d\n", m->type);
 	}
 
-	vchiq_release_message(handle, header);
+	vchiq_release_message(vchiq_instance, instance->service_handle, header);
 	return VCHIQ_SUCCESS;
 }
 
@@ -144,7 +146,8 @@ vc_vchi_audio_init(struct vchiq_instance *vchiq_instance,
 	}
 
 	/* Finished with the service for now */
-	vchiq_release_service(instance->service_handle);
+	vchiq_release_service(instance->alsa_stream->chip->vchi_ctx->instance,
+			      instance->service_handle);
 
 	return 0;
 }
@@ -154,10 +157,12 @@ static void vc_vchi_audio_deinit(struct bcm2835_audio_instance *instance)
 	int status;
 
 	mutex_lock(&instance->vchi_mutex);
-	vchiq_use_service(instance->service_handle);
+	vchiq_use_service(instance->alsa_stream->chip->vchi_ctx->instance,
+			  instance->service_handle);
 
 	/* Close all VCHI service connections */
-	status = vchiq_close_service(instance->service_handle);
+	status = vchiq_close_service(instance->alsa_stream->chip->vchi_ctx->instance,
+				     instance->service_handle);
 	if (status) {
 		dev_err(instance->dev,
 			"failed to close VCHI service connection (status=%d)\n",
@@ -227,7 +232,7 @@ int bcm2835_audio_open(struct bcm2835_alsa_stream *alsa_stream)
 		goto deinit;
 
 	bcm2835_audio_lock(instance);
-	vchiq_get_peer_version(instance->service_handle,
+	vchiq_get_peer_version(vchi_ctx->instance, instance->service_handle,
 			       &instance->peer_version);
 	bcm2835_audio_unlock(instance);
 	if (instance->peer_version < 2 || force_bulk)
@@ -352,8 +357,8 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 		while (count > 0) {
 			int bytes = min(instance->max_packet, count);
 
-			status = vchiq_queue_kernel_message(instance->service_handle,
-							    src, bytes);
+			status = vchiq_queue_kernel_message(vchiq_instance,
+							    instance->service_handle, src, bytes);
 			src += bytes;
 			count -= bytes;
 		}
diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 97537d3b1d28..0d3833e9773c 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -92,14 +92,17 @@ extern enum vchiq_status vchiq_connect(struct vchiq_instance *instance);
 extern enum vchiq_status vchiq_open_service(struct vchiq_instance *instance,
 	const struct vchiq_service_params_kernel *params,
 	unsigned int *pservice);
-extern enum vchiq_status vchiq_close_service(unsigned int service);
-extern enum vchiq_status vchiq_use_service(unsigned int service);
-extern enum vchiq_status vchiq_release_service(unsigned int service);
-extern void vchiq_msg_queue_push(unsigned int handle, struct vchiq_header *header);
-extern void           vchiq_release_message(unsigned int service,
-	struct vchiq_header *header);
-extern int vchiq_queue_kernel_message(unsigned int handle, void *data,
-				      unsigned int size);
+extern enum vchiq_status vchiq_close_service(struct vchiq_instance *instance,
+					     unsigned int service);
+extern enum vchiq_status vchiq_use_service(struct vchiq_instance *instance, unsigned int service);
+extern enum vchiq_status vchiq_release_service(struct vchiq_instance *instance,
+					       unsigned int service);
+extern void vchiq_msg_queue_push(struct vchiq_instance *instance, unsigned int handle,
+				 struct vchiq_header *header);
+extern void vchiq_release_message(struct vchiq_instance *instance, unsigned int service,
+				  struct vchiq_header *header);
+extern int vchiq_queue_kernel_message(struct vchiq_instance *instance, unsigned int handle,
+				      void *data, unsigned int size);
 extern enum vchiq_status vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int service,
 					     const void *data, unsigned int size, void *userdata,
 					     enum vchiq_bulk_mode mode);
@@ -107,8 +110,9 @@ extern enum vchiq_status vchiq_bulk_receive(struct vchiq_instance *instance, uns
 					    void *data, unsigned int size, void *userdata,
 					    enum vchiq_bulk_mode mode);
 extern void *vchiq_get_service_userdata(unsigned int service);
-extern enum vchiq_status vchiq_get_peer_version(unsigned int handle,
-	short *peer_version);
-extern struct vchiq_header *vchiq_msg_hold(unsigned int handle);
+extern enum vchiq_status vchiq_get_peer_version(struct vchiq_instance *instance,
+						unsigned int handle,
+						short *peer_version);
+extern struct vchiq_header *vchiq_msg_hold(struct vchiq_instance *instance, unsigned int handle);
 
 #endif /* VCHIQ_H */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index ffb24298e26b..a5f0a756b32c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -819,7 +819,7 @@ vchiq_open_service(struct vchiq_instance *instance,
 		*phandle = service->handle;
 		status = vchiq_open_service_internal(service, current->pid);
 		if (status != VCHIQ_SUCCESS) {
-			vchiq_remove_service(service->handle);
+			vchiq_remove_service(instance, service->handle);
 			*phandle = VCHIQ_SERVICE_HANDLE_INVALID;
 		}
 	}
@@ -914,7 +914,7 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 	enum vchiq_status status;
 	struct bulk_waiter_node *waiter = NULL, *iter;
 
-	service = find_service_by_handle(handle);
+	service = find_service_by_handle(instance, handle);
 	if (!service)
 		return VCHIQ_ERROR;
 
@@ -1381,14 +1381,14 @@ vchiq_keepalive_thread_func(void *v)
 		 */
 		while (uc--) {
 			atomic_inc(&arm_state->ka_use_ack_count);
-			status = vchiq_use_service(ka_handle);
+			status = vchiq_use_service(instance, ka_handle);
 			if (status != VCHIQ_SUCCESS) {
 				vchiq_log_error(vchiq_susp_log_level,
 						"%s vchiq_use_service error %d", __func__, status);
 			}
 		}
 		while (rc--) {
-			status = vchiq_release_service(ka_handle);
+			status = vchiq_release_service(instance, ka_handle);
 			if (status != VCHIQ_SUCCESS) {
 				vchiq_log_error(vchiq_susp_log_level,
 						"%s vchiq_release_service error %d", __func__,
@@ -1584,10 +1584,10 @@ vchiq_instance_set_trace(struct vchiq_instance *instance, int trace)
 }
 
 enum vchiq_status
-vchiq_use_service(unsigned int handle)
+vchiq_use_service(struct vchiq_instance *instance, unsigned int handle)
 {
 	enum vchiq_status ret = VCHIQ_ERROR;
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 
 	if (service) {
 		ret = vchiq_use_internal(service->state, service, USE_TYPE_SERVICE);
@@ -1598,10 +1598,10 @@ vchiq_use_service(unsigned int handle)
 EXPORT_SYMBOL(vchiq_use_service);
 
 enum vchiq_status
-vchiq_release_service(unsigned int handle)
+vchiq_release_service(struct vchiq_instance *instance, unsigned int handle)
 {
 	enum vchiq_status ret = VCHIQ_ERROR;
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 
 	if (service) {
 		ret = vchiq_release_internal(service->state, service);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index f671c3976ab7..2851ef6b9cd0 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -86,10 +86,10 @@ extern struct vchiq_state *
 vchiq_get_state(void);
 
 enum vchiq_status
-vchiq_use_service(unsigned int handle);
+vchiq_use_service(struct vchiq_instance *instance, unsigned int handle);
 
 extern enum vchiq_status
-vchiq_release_service(unsigned int handle);
+vchiq_release_service(struct vchiq_instance *instance, unsigned int handle);
 
 extern enum vchiq_status
 vchiq_check_service(struct vchiq_service *service);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 547af55d3859..7217e3070ffe 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -235,7 +235,7 @@ set_service_state(struct vchiq_service *service, int newstate)
 }
 
 struct vchiq_service *
-find_service_by_handle(unsigned int handle)
+find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 {
 	struct vchiq_service *service;
 
@@ -476,7 +476,7 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 	}
 
 	if (reason != VCHIQ_MESSAGE_AVAILABLE)
-		vchiq_release_message(service->handle, header);
+		vchiq_release_message(service->instance, service->handle, header);
 
 	return status;
 }
@@ -2290,9 +2290,10 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, s
 	return ret;
 }
 
-void vchiq_msg_queue_push(unsigned int handle, struct vchiq_header *header)
+void vchiq_msg_queue_push(struct vchiq_instance *instance, unsigned int handle,
+			  struct vchiq_header *header)
 {
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	int pos;
 
 	if (!service)
@@ -2312,9 +2313,9 @@ void vchiq_msg_queue_push(unsigned int handle, struct vchiq_header *header)
 }
 EXPORT_SYMBOL(vchiq_msg_queue_push);
 
-struct vchiq_header *vchiq_msg_hold(unsigned int handle)
+struct vchiq_header *vchiq_msg_hold(struct vchiq_instance *instance, unsigned int handle)
 {
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	struct vchiq_header *header;
 	int pos;
 
@@ -2869,16 +2870,16 @@ vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instan
 	/* Find all services registered to this client and remove them. */
 	i = 0;
 	while ((service = next_service_by_instance(state, instance, &i)) != NULL) {
-		(void)vchiq_remove_service(service->handle);
+		(void)vchiq_remove_service(instance, service->handle);
 		vchiq_service_put(service);
 	}
 }
 
 enum vchiq_status
-vchiq_close_service(unsigned int handle)
+vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 {
 	/* Unregister the service */
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	enum vchiq_status status = VCHIQ_SUCCESS;
 
 	if (!service)
@@ -2933,10 +2934,10 @@ vchiq_close_service(unsigned int handle)
 EXPORT_SYMBOL(vchiq_close_service);
 
 enum vchiq_status
-vchiq_remove_service(unsigned int handle)
+vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 {
 	/* Unregister the service */
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	enum vchiq_status status = VCHIQ_SUCCESS;
 
 	if (!service)
@@ -3003,7 +3004,7 @@ enum vchiq_status vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned
 				      void *offset, void __user *uoffset, int size, void *userdata,
 				      enum vchiq_bulk_mode mode, enum vchiq_bulk_dir dir)
 {
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	struct vchiq_bulk_queue *queue;
 	struct vchiq_bulk *bulk;
 	struct vchiq_state *state;
@@ -3153,13 +3154,13 @@ enum vchiq_status vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned
 }
 
 enum vchiq_status
-vchiq_queue_message(unsigned int handle,
+vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
 		    ssize_t (*copy_callback)(void *context, void *dest,
 					     size_t offset, size_t maxsize),
 		    void *context,
 		    size_t size)
 {
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	enum vchiq_status status = VCHIQ_ERROR;
 	int data_id;
 
@@ -3202,12 +3203,13 @@ vchiq_queue_message(unsigned int handle,
 	return status;
 }
 
-int vchiq_queue_kernel_message(unsigned int handle, void *data, unsigned int size)
+int vchiq_queue_kernel_message(struct vchiq_instance *instance, unsigned int handle, void *data,
+			       unsigned int size)
 {
 	enum vchiq_status status;
 
 	while (1) {
-		status = vchiq_queue_message(handle, memcpy_copy_callback,
+		status = vchiq_queue_message(instance, handle, memcpy_copy_callback,
 					     data, size);
 
 		/*
@@ -3226,10 +3228,10 @@ int vchiq_queue_kernel_message(unsigned int handle, void *data, unsigned int siz
 EXPORT_SYMBOL(vchiq_queue_kernel_message);
 
 void
-vchiq_release_message(unsigned int handle,
+vchiq_release_message(struct vchiq_instance *instance, unsigned int handle,
 		      struct vchiq_header *header)
 {
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	struct vchiq_shared_state *remote;
 	struct vchiq_state *state;
 	int slot_index;
@@ -3268,10 +3270,10 @@ release_message_sync(struct vchiq_state *state, struct vchiq_header *header)
 }
 
 enum vchiq_status
-vchiq_get_peer_version(unsigned int handle, short *peer_version)
+vchiq_get_peer_version(struct vchiq_instance *instance, unsigned int handle, short *peer_version)
 {
 	enum vchiq_status status = VCHIQ_ERROR;
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 
 	if (!service)
 		goto exit;
@@ -3303,9 +3305,10 @@ void vchiq_get_config(struct vchiq_config *config)
 }
 
 int
-vchiq_set_service_option(unsigned int handle, enum vchiq_service_option option, int value)
+vchiq_set_service_option(struct vchiq_instance *instance, unsigned int handle,
+			 enum vchiq_service_option option, int value)
 {
-	struct vchiq_service *service = find_service_by_handle(handle);
+	struct vchiq_service *service = find_service_by_handle(instance, handle);
 	struct vchiq_service_quota *quota;
 	int ret = -EINVAL;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 2ce54ce9f02a..5d9c2f787bad 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -522,7 +522,7 @@ handle_to_service(unsigned int handle)
 }
 
 extern struct vchiq_service *
-find_service_by_handle(unsigned int handle);
+find_service_by_handle(struct vchiq_instance *instance, unsigned int handle);
 
 extern struct vchiq_service *
 find_service_by_port(struct vchiq_state *state, unsigned int localport);
@@ -550,7 +550,7 @@ extern void
 vchiq_service_put(struct vchiq_service *service);
 
 extern enum vchiq_status
-vchiq_queue_message(unsigned int handle,
+vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
 		    ssize_t (*copy_callback)(void *context, void *dest,
 					     size_t offset, size_t maxsize),
 		    void *context,
@@ -597,12 +597,13 @@ void vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newsta
 
 void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes);
 
-enum vchiq_status vchiq_remove_service(unsigned int service);
+enum vchiq_status vchiq_remove_service(struct vchiq_instance *instance, unsigned int service);
 
 int vchiq_get_client_id(unsigned int service);
 
 void vchiq_get_config(struct vchiq_config *config);
 
-int vchiq_set_service_option(unsigned int service, enum vchiq_service_option option, int value);
+int vchiq_set_service_option(struct vchiq_instance *instance, unsigned int service,
+			     enum vchiq_service_option option, int value);
 
 #endif
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 077e3fcbd651..adb616d97652 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -108,8 +108,8 @@ static ssize_t vchiq_ioc_copy_element_data(void *context, void *dest,
 }
 
 static int
-vchiq_ioc_queue_message(unsigned int handle, struct vchiq_element *elements,
-			unsigned long count)
+vchiq_ioc_queue_message(struct vchiq_instance *instance, unsigned int handle,
+			struct vchiq_element *elements, unsigned long count)
 {
 	struct vchiq_io_copy_callback_context context;
 	enum vchiq_status status = VCHIQ_SUCCESS;
@@ -127,7 +127,7 @@ vchiq_ioc_queue_message(unsigned int handle, struct vchiq_element *elements,
 		total_size += elements[i].size;
 	}
 
-	status = vchiq_queue_message(handle, vchiq_ioc_copy_element_data,
+	status = vchiq_queue_message(instance, handle, vchiq_ioc_copy_element_data,
 				     &context, total_size);
 
 	if (status == VCHIQ_ERROR)
@@ -191,7 +191,7 @@ static int vchiq_ioc_create_service(struct vchiq_instance *instance,
 	if (args->is_open) {
 		status = vchiq_open_service_internal(service, instance->pid);
 		if (status != VCHIQ_SUCCESS) {
-			vchiq_remove_service(service->handle);
+			vchiq_remove_service(instance, service->handle);
 			return (status == VCHIQ_RETRY) ?
 				-EINTR : -EIO;
 		}
@@ -266,7 +266,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 		/* Copy to user space if msgbuf is not NULL */
 		if (!args->buf || (copy_to_user(args->buf, header->data, header->size) == 0)) {
 			ret = header->size;
-			vchiq_release_message(service->handle, header);
+			vchiq_release_message(instance, service->handle, header);
 		} else {
 			ret = -EFAULT;
 		}
@@ -529,7 +529,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 			}
 
 			/* Now it has been copied, the message can be released. */
-			vchiq_release_message(service->handle, header);
+			vchiq_release_message(instance, service->handle, header);
 
 			/* The completion must point to the msgbuf. */
 			user_completion.header = msgbuf;
@@ -596,7 +596,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		i = 0;
 		while ((service = next_service_by_instance(instance->state,
 							   instance, &i))) {
-			status = vchiq_remove_service(service->handle);
+			status = vchiq_remove_service(instance, service->handle);
 			vchiq_service_put(service);
 			if (status != VCHIQ_SUCCESS)
 				break;
@@ -649,7 +649,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			break;
 
 		if (put_user(args.handle, &argp->handle)) {
-			vchiq_remove_service(args.handle);
+			vchiq_remove_service(instance, args.handle);
 			ret = -EFAULT;
 		}
 	} break;
@@ -673,8 +673,8 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		 */
 		if (!user_service->close_pending) {
 			status = (cmd == VCHIQ_IOC_CLOSE_SERVICE) ?
-				 vchiq_close_service(service->handle) :
-				 vchiq_remove_service(service->handle);
+				 vchiq_close_service(instance, service->handle) :
+				 vchiq_remove_service(instance, service->handle);
 			if (status != VCHIQ_SUCCESS)
 				break;
 		}
@@ -731,7 +731,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 			if (copy_from_user(elements, args.elements,
 					   args.count * sizeof(struct vchiq_element)) == 0)
-				ret = vchiq_ioc_queue_message(args.handle, elements,
+				ret = vchiq_ioc_queue_message(instance, args.handle, elements,
 							      args.count);
 			else
 				ret = -EFAULT;
@@ -827,7 +827,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			break;
 		}
 
-		ret = vchiq_set_service_option(args.handle, args.option,
+		ret = vchiq_set_service_option(instance, args.handle, args.option,
 					       args.value);
 	} break;
 
@@ -908,6 +908,7 @@ vchiq_compat_ioctl_create_service(struct file *file, unsigned int cmd,
 {
 	struct vchiq_create_service args;
 	struct vchiq_create_service32 args32;
+	struct vchiq_instance *instance = file->private_data;
 	long ret;
 
 	if (copy_from_user(&args32, ptrargs32, sizeof(args32)))
@@ -926,12 +927,12 @@ vchiq_compat_ioctl_create_service(struct file *file, unsigned int cmd,
 		.handle  = args32.handle,
 	};
 
-	ret = vchiq_ioc_create_service(file->private_data, &args);
+	ret = vchiq_ioc_create_service(instance, &args);
 	if (ret < 0)
 		return ret;
 
 	if (put_user(args.handle, &ptrargs32->handle)) {
-		vchiq_remove_service(args.handle);
+		vchiq_remove_service(instance, args.handle);
 		return -EFAULT;
 	}
 
@@ -960,6 +961,7 @@ vchiq_compat_ioctl_queue_message(struct file *file,
 	struct vchiq_queue_message args;
 	struct vchiq_queue_message32 args32;
 	struct vchiq_service *service;
+	struct vchiq_instance *instance = file->private_data;
 	int ret;
 
 	if (copy_from_user(&args32, arg, sizeof(args32)))
@@ -974,7 +976,7 @@ vchiq_compat_ioctl_queue_message(struct file *file,
 	if (args32.count > MAX_ELEMENTS)
 		return -EINVAL;
 
-	service = find_service_for_instance(file->private_data, args.handle);
+	service = find_service_for_instance(instance, args.handle);
 	if (!service)
 		return -EINVAL;
 
@@ -994,7 +996,7 @@ vchiq_compat_ioctl_queue_message(struct file *file,
 				compat_ptr(element32[count].data);
 			elements[count].size = element32[count].size;
 		}
-		ret = vchiq_ioc_queue_message(args.handle, elements,
+		ret = vchiq_ioc_queue_message(instance, args.handle, elements,
 					      args.count);
 	} else {
 		ret = -EINVAL;
@@ -1261,7 +1263,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 			spin_unlock(&msg_queue_spinlock);
 
 			if (header)
-				vchiq_release_message(service->handle, header);
+				vchiq_release_message(instance, service->handle, header);
 			spin_lock(&msg_queue_spinlock);
 		}
 
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 55f290b64d6a..4c29cb7794a1 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -292,7 +292,7 @@ static void buffer_to_host_work_cb(struct work_struct *work)
 		/* Dummy receive to ensure the buffers remain in order */
 		len = 8;
 	/* queue the bulk submission */
-	vchiq_use_service(instance->service_handle);
+	vchiq_use_service(instance->vchiq_instance, instance->service_handle);
 	ret = vchiq_bulk_receive(instance->vchiq_instance, instance->service_handle,
 				 msg_context->u.bulk.buffer->buffer,
 				 /* Actual receive needs to be a multiple
@@ -302,7 +302,7 @@ static void buffer_to_host_work_cb(struct work_struct *work)
 				msg_context,
 				VCHIQ_BULK_MODE_CALLBACK);
 
-	vchiq_release_service(instance->service_handle);
+	vchiq_release_service(instance->vchiq_instance, instance->service_handle);
 
 	if (ret != 0)
 		pr_err("%s: ctx: %p, vchiq_bulk_receive failed %d\n",
@@ -436,15 +436,15 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 	/* no payload in message */
 	m.u.buffer_from_host.payload_in_message = 0;
 
-	vchiq_use_service(instance->service_handle);
+	vchiq_use_service(instance->vchiq_instance, instance->service_handle);
 
-	ret = vchiq_queue_kernel_message(instance->service_handle, &m,
+	ret = vchiq_queue_kernel_message(instance->vchiq_instance, instance->service_handle, &m,
 					 sizeof(struct mmal_msg_header) +
 					 sizeof(m.u.buffer_from_host));
 	if (ret)
 		atomic_dec(&port->buffers_with_vpu);
 
-	vchiq_release_service(instance->service_handle);
+	vchiq_release_service(instance->vchiq_instance, instance->service_handle);
 
 	return ret;
 }
@@ -573,25 +573,25 @@ static enum vchiq_status service_callback(struct vchiq_instance *vchiq_instance,
 		/* handling is different for buffer messages */
 		switch (msg->h.type) {
 		case MMAL_MSG_TYPE_BUFFER_FROM_HOST:
-			vchiq_release_message(handle, header);
+			vchiq_release_message(vchiq_instance, handle, header);
 			break;
 
 		case MMAL_MSG_TYPE_EVENT_TO_HOST:
 			event_to_host_cb(instance, msg, msg_len);
-			vchiq_release_message(handle, header);
+			vchiq_release_message(vchiq_instance, handle, header);
 
 			break;
 
 		case MMAL_MSG_TYPE_BUFFER_TO_HOST:
 			buffer_to_host_cb(instance, msg, msg_len);
-			vchiq_release_message(handle, header);
+			vchiq_release_message(vchiq_instance, handle, header);
 			break;
 
 		default:
 			/* messages dependent on header context to complete */
 			if (!msg->h.context) {
 				pr_err("received message context was null!\n");
-				vchiq_release_message(handle, header);
+				vchiq_release_message(vchiq_instance, handle, header);
 				break;
 			}
 
@@ -600,7 +600,7 @@ static enum vchiq_status service_callback(struct vchiq_instance *vchiq_instance,
 			if (!msg_context) {
 				pr_err("received invalid message context %u!\n",
 				       msg->h.context);
-				vchiq_release_message(handle, header);
+				vchiq_release_message(vchiq_instance, handle, header);
 				break;
 			}
 
@@ -679,13 +679,13 @@ static int send_synchronous_mmal_msg(struct vchiq_mmal_instance *instance,
 	DBG_DUMP_MSG(msg, (sizeof(struct mmal_msg_header) + payload_len),
 		     ">>> sync message");
 
-	vchiq_use_service(instance->service_handle);
+	vchiq_use_service(instance->vchiq_instance, instance->service_handle);
 
-	ret = vchiq_queue_kernel_message(instance->service_handle, msg,
+	ret = vchiq_queue_kernel_message(instance->vchiq_instance, instance->service_handle, msg,
 					 sizeof(struct mmal_msg_header) +
 					 payload_len);
 
-	vchiq_release_service(instance->service_handle);
+	vchiq_release_service(instance->vchiq_instance, instance->service_handle);
 
 	if (ret) {
 		pr_err("error %d queuing message\n", ret);
@@ -825,7 +825,7 @@ static int port_info_set(struct vchiq_mmal_instance *instance,
 		 port->component->handle, port->handle);
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -920,7 +920,7 @@ static int port_info_get(struct vchiq_mmal_instance *instance,
 	pr_debug("%s:result:%d component:0x%x port:%d\n",
 		 __func__, ret, port->component->handle, port->handle);
 
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -968,7 +968,7 @@ static int create_component(struct vchiq_mmal_instance *instance,
 		 component->inputs, component->outputs, component->clocks);
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1001,7 +1001,7 @@ static int destroy_component(struct vchiq_mmal_instance *instance,
 
 release_msg:
 
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1033,7 +1033,7 @@ static int enable_component(struct vchiq_mmal_instance *instance,
 	ret = -rmsg->u.component_enable_reply.status;
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1066,7 +1066,7 @@ static int disable_component(struct vchiq_mmal_instance *instance,
 
 release_msg:
 
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1098,7 +1098,7 @@ static int get_version(struct vchiq_mmal_instance *instance,
 	*minor_out = rmsg->u.version.minor;
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1140,7 +1140,7 @@ static int port_action_port(struct vchiq_mmal_instance *instance,
 		 port_action_type_names[action_type], action_type);
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1188,7 +1188,7 @@ static int port_action_handle(struct vchiq_mmal_instance *instance,
 		 action_type, connect_component_handle, connect_port_handle);
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1229,7 +1229,7 @@ static int port_parameter_set(struct vchiq_mmal_instance *instance,
 		 ret, port->component->handle, port->handle, parameter_id);
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1288,7 +1288,7 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 		 ret, port->component->handle, port->handle, parameter_id);
 
 release_msg:
-	vchiq_release_message(instance->service_handle, rmsg_handle);
+	vchiq_release_message(instance->vchiq_instance, instance->service_handle, rmsg_handle);
 
 	return ret;
 }
@@ -1833,9 +1833,9 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 	if (mutex_lock_interruptible(&instance->vchiq_mutex))
 		return -EINTR;
 
-	vchiq_use_service(instance->service_handle);
+	vchiq_use_service(instance->vchiq_instance, instance->service_handle);
 
-	status = vchiq_close_service(instance->service_handle);
+	status = vchiq_close_service(instance->vchiq_instance, instance->service_handle);
 	if (status != 0)
 		pr_err("mmal-vchiq: VCHIQ close failed\n");
 
@@ -1923,14 +1923,14 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 		goto err_close_services;
 	}
 
-	vchiq_release_service(instance->service_handle);
+	vchiq_release_service(instance->vchiq_instance, instance->service_handle);
 
 	*out_instance = instance;
 
 	return 0;
 
 err_close_services:
-	vchiq_close_service(instance->service_handle);
+	vchiq_close_service(instance->vchiq_instance, instance->service_handle);
 	destroy_workqueue(instance->bulk_wq);
 err_free:
 	kfree(instance);
-- 
2.35.3

