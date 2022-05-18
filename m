Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7271FCE
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QfFtPnSA8RSHzQX8N1YJfWufC1bmREpixAf/dL1eNUI=;
	b=MpiUgvcrLG7qUfhO29p76xzVVJNJzEmAq7/4BPUzF/Xp3bvYViZp0mIiTnAi2CC1HBZZoe
	1XPcFEcszSc7fQckk2t8WYurKxLoNsPVdlHBUMEzbfwgLurp8qph6fLHy13KmRN7jk1hZs
	5Ujqg5SIpbvikCVof6XgUdiR889BKP0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-qW_M2HOFNfGHkOvcOCLnIw-1; Wed, 18 May 2022 15:12:01 -0400
X-MC-Unique: qW_M2HOFNfGHkOvcOCLnIw-1
Received: by mail-qk1-f199.google.com with SMTP id v14-20020a05620a0f0e00b00699f4ea852cso2256039qkl.9
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QfFtPnSA8RSHzQX8N1YJfWufC1bmREpixAf/dL1eNUI=;
        b=uU17KOzJ1b9n7fozyuGJ/ZQpWcdFXR2/fdGU93IkZ5DiOEk1llgv1QENMsL8HlkQ3y
         Ln2k20OB9HUs5gIOTKsBCLuQlBy8DfmVTyPm9voS6mBlICJCH8KreKbYo/2Cg0RMTvDl
         /trvvwTP1byogajbOWrO7Vv6BP8g0p7/uP54RANvOpIADq59/hR8FlszehshYfem2owG
         7g8WeLupK0o354e3vlqh1u02wGCDt/CSZXHQwDF53aXMyGTqK1qNi0FBas6GbBrKwfST
         PzcCgN/GTwrXDVvQyCwNz6rMom5yO4vNLg0k+KsrgJRU2M7vgZWVhdTFhIjV49cd8vFo
         yRAg==
X-Gm-Message-State: AOAM531B65VwVwWncucozdmSBPJwG6ypXfj+Abpvh1PhhQapFXpuDigz
	6vLQ/WVmplI7sBF1OWHqIsZPN4LjCt9JEDzqs0Z0m4Iex3L/Oq/hTNDP6tdeuc/rJPLCY8/huxp
	2hkZZaXoCGBC8J6LP9c1KeoF0pA==
X-Received: by 2002:a05:622a:15c8:b0:2f3:d7ae:bae6 with SMTP id d8-20020a05622a15c800b002f3d7aebae6mr1189562qty.106.1652901121083;
        Wed, 18 May 2022 12:12:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXyKMtgTFHL5xH8+/fZjJ2Fl06xmfeWdnm+lzI/sOV5djl1NQa//Jh1s7JgWDcYA2MYMPczw==
X-Received: by 2002:a05:622a:15c8:b0:2f3:d7ae:bae6 with SMTP id d8-20020a05622a15c800b002f3d7aebae6mr1189539qty.106.1652901120849;
        Wed, 18 May 2022 12:12:00 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:12:00 -0700 (PDT)
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
Subject: [PATCH v2 3/9] staging: vchiq_arm: pass vchiq instance to service callbacks
Date: Wed, 18 May 2022 15:11:14 -0400
Message-Id: <20220518191126.60396-4-athierry@redhat.com>
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

'handle_to_service' is called by 'service_callback'. Therefore, pass the
vchiq instance reference to 'service_callback'. This also requires
adding the vchiq instance reference to the service callbacks prototype,
and update all other callbacks accordingly.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 .../staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c  | 3 ++-
 .../vc04_services/include/linux/raspberrypi/vchiq.h      | 8 ++++++--
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c        | 9 ++++-----
 .../vc04_services/interface/vchiq_arm/vchiq_arm.h        | 4 ++--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c       | 3 ++-
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c    | 3 ++-
 6 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index 701abe430877..c32c8c93a615 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -89,7 +89,8 @@ static int bcm2835_audio_send_simple(struct bcm2835_audio_instance *instance,
 	return bcm2835_audio_send_msg(instance, &m, wait);
 }
 
-static enum vchiq_status audio_vchi_callback(enum vchiq_reason reason,
+static enum vchiq_status audio_vchi_callback(struct vchiq_instance *vchiq_instance,
+					     enum vchiq_reason reason,
 					     struct vchiq_header *header,
 					     unsigned int handle, void *userdata)
 {
diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 715f02e7f1e1..97537d3b1d28 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -53,9 +53,12 @@ struct vchiq_element {
 	unsigned int size;
 };
 
+struct vchiq_instance;
+
 struct vchiq_service_base {
 	int fourcc;
-	enum vchiq_status (*callback)(enum vchiq_reason reason,
+	enum vchiq_status (*callback)(struct vchiq_instance *instance,
+				      enum vchiq_reason reason,
 				      struct vchiq_header *header,
 				      unsigned int handle,
 				      void *bulk_userdata);
@@ -71,7 +74,8 @@ struct vchiq_completion_data_kernel {
 
 struct vchiq_service_params_kernel {
 	int fourcc;
-	enum vchiq_status (*callback)(enum vchiq_reason reason,
+	enum vchiq_status (*callback)(struct vchiq_instance *instance,
+				      enum vchiq_reason reason,
 				      struct vchiq_header *header,
 				      unsigned int handle,
 				      void *bulk_userdata);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3b447c635c3f..ffb24298e26b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1041,8 +1041,8 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 }
 
 enum vchiq_status
-service_callback(enum vchiq_reason reason, struct vchiq_header *header,
-		 unsigned int handle, void *bulk_userdata)
+service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
+		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata)
 {
 	/*
 	 * How do we ensure the callback goes to the right client?
@@ -1052,7 +1052,6 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 	 */
 	struct user_service *user_service;
 	struct vchiq_service *service;
-	struct vchiq_instance *instance;
 	bool skip_completion = false;
 
 	DEBUG_INITIALISE(g_state.local);
@@ -1067,7 +1066,6 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 	}
 
 	user_service = (struct user_service *)service->base.userdata;
-	instance = user_service->instance;
 
 	if (!instance || instance->closing) {
 		rcu_read_unlock();
@@ -1313,7 +1311,8 @@ vchiq_get_state(void)
  */
 
 static enum vchiq_status
-vchiq_keepalive_vchiq_callback(enum vchiq_reason reason,
+vchiq_keepalive_vchiq_callback(struct vchiq_instance *instance,
+			       enum vchiq_reason reason,
 			       struct vchiq_header *header,
 			       unsigned int service_user, void *bulk_user)
 {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 2aa46b119a46..f671c3976ab7 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -138,8 +138,8 @@ static inline int vchiq_register_chrdev(struct device *parent) { return 0; }
 #endif /* IS_ENABLED(CONFIG_VCHIQ_CDEV) */
 
 extern enum vchiq_status
-service_callback(enum vchiq_reason reason, struct vchiq_header *header,
-		 unsigned int handle, void *bulk_userdata);
+service_callback(struct vchiq_instance *vchiq_instance, enum vchiq_reason reason,
+		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata);
 
 extern void
 free_bulk_waiter(struct vchiq_instance *instance);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 04eec18835da..547af55d3859 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -466,7 +466,8 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 	vchiq_log_trace(vchiq_core_log_level, "%d: callback:%d (%s, %pK, %pK)",
 			service->state->id, service->localport, reason_names[reason],
 			header, bulk_userdata);
-	status = service->base.callback(reason, header, service->handle, bulk_userdata);
+	status = service->base.callback(service->instance, reason, header, service->handle,
+					bulk_userdata);
 	if (status == VCHIQ_ERROR) {
 		vchiq_log_warning(vchiq_core_log_level,
 				  "%d: ignoring ERROR from callback to service %x",
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 145021af93b2..55f290b64d6a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -548,7 +548,8 @@ static void bulk_abort_cb(struct vchiq_mmal_instance *instance,
 }
 
 /* incoming event service callback */
-static enum vchiq_status service_callback(enum vchiq_reason reason,
+static enum vchiq_status service_callback(struct vchiq_instance *vchiq_instance,
+					  enum vchiq_reason reason,
 					  struct vchiq_header *header,
 					  unsigned int handle, void *bulk_ctx)
 {
-- 
2.35.3

