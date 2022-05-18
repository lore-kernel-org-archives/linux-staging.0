Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DBF1FD4
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHgYvCWJ1ZclCBJ4AaTahh2YKvVrozHphEEISDC4gW4=;
	b=fSxTTp1eMklkNjWbGdI4eAcbWfRuxGvayphHQcBBaHhxez/73JwkWbN+MwcJ/bbGGnfRpM
	7z1YC1jqWf+gaH6sY8Ud89cnpvWcqZ22oeX9wibegX9BcmtQ1Hj43BLr6inziHRK2W0Eqp
	at79gD5g9KSAzjvowLkqgBkDfPSPQrg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-OYfi8RznNQqBziswttgzdg-1; Wed, 18 May 2022 15:12:10 -0400
X-MC-Unique: OYfi8RznNQqBziswttgzdg-1
Received: by mail-qk1-f198.google.com with SMTP id c8-20020a05620a268800b0069c0f1b3206so2228200qkp.18
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHgYvCWJ1ZclCBJ4AaTahh2YKvVrozHphEEISDC4gW4=;
        b=z0hORvg62IS9GjiRh6oTeh5dm2R4XBVCPgdBBUh1C180A7O5EGQsvoVbo3NsAW33Tf
         ORQ+gdnMhj+nIgD/aOd2m4NYNxQErZKDLv5Par/BRWmqqKBrKTEupckbmSMdh1BDtgUX
         Y1Vpr+6rn0j2wl7ull8aZodlriDSX2kr9aBpJQAvcQnlHHtNxhOX8ozRfrqeG1itCXwY
         S3Raqo6et04LGUH7ut6ISJo8vb7NEgBeCcyQS8V6IOU4p3v51zA3tPBbjs/DVOT3zYa/
         2kEsyb0u0u4CxZtkWEQ7i4njP3OXuhYwlpr42euhQIeMpQfO65nmmnLVlxidLWxzQIbI
         eFdQ==
X-Gm-Message-State: AOAM532fEjOSaQm24lvL2/+sfOTNNUrhxXdXR/WMDUj7mru/jI5qynq4
	Na5PpAmIXBoy4DtE95kMmDYmWqcOVwQAO8o3yIjBUOV1Q39ScVeV3O7/hZQmK5yC5SoDYXAD0R+
	HQQLexupv1Le7S+PjMpJAisooiA==
X-Received: by 2002:ac8:5e0c:0:b0:2f3:adfd:bd30 with SMTP id h12-20020ac85e0c000000b002f3adfdbd30mr1127864qtx.277.1652901130038;
        Wed, 18 May 2022 12:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/EUV6JDOP0YocXPPDX5Y0ERBRZOeYORhcYNAJJR73zaqv4XXbB1uLv1okyVxUQqLD1seerg==
X-Received: by 2002:ac8:5e0c:0:b0:2f3:adfd:bd30 with SMTP id h12-20020ac85e0c000000b002f3adfdbd30mr1127847qtx.277.1652901129783;
        Wed, 18 May 2022 12:12:09 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:12:09 -0700 (PDT)
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
Subject: [PATCH v2 6/9] staging: vchiq_arm: pass vchiq instance to 'vchiq_get_service_userdata'
Date: Wed, 18 May 2022 15:11:17 -0400
Message-Id: <20220518191126.60396-7-athierry@redhat.com>
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

'handle_to_service' is called by 'vchiq_get_service_userdata'.
Therefore, pass the vchiq instance reference to it.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c    | 3 ++-
 .../staging/vc04_services/include/linux/raspberrypi/vchiq.h    | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c          | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index aa2ab0df7af5..f4c2c9506d86 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -96,7 +96,8 @@ static enum vchiq_status audio_vchi_callback(struct vchiq_instance *vchiq_instan
 					     struct vchiq_header *header,
 					     unsigned int handle, void *userdata)
 {
-	struct bcm2835_audio_instance *instance = vchiq_get_service_userdata(handle);
+	struct bcm2835_audio_instance *instance = vchiq_get_service_userdata(vchiq_instance,
+									     handle);
 	struct vc_audio_msg *m;
 
 	if (reason != VCHIQ_MESSAGE_AVAILABLE)
diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 0d3833e9773c..db1441c0cc66 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -109,7 +109,7 @@ extern enum vchiq_status vchiq_bulk_transmit(struct vchiq_instance *instance, un
 extern enum vchiq_status vchiq_bulk_receive(struct vchiq_instance *instance, unsigned int service,
 					    void *data, unsigned int size, void *userdata,
 					    enum vchiq_bulk_mode mode);
-extern void *vchiq_get_service_userdata(unsigned int service);
+extern void *vchiq_get_service_userdata(struct vchiq_instance *instance, unsigned int service);
 extern enum vchiq_status vchiq_get_peer_version(struct vchiq_instance *instance,
 						unsigned int handle,
 						short *peer_version);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index d6853e23564c..d4fed18b1baa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -411,7 +411,7 @@ vchiq_get_client_id(struct vchiq_instance *instance, unsigned int handle)
 }
 
 void *
-vchiq_get_service_userdata(unsigned int handle)
+vchiq_get_service_userdata(struct vchiq_instance *instance, unsigned int handle)
 {
 	void *userdata;
 	struct vchiq_service *service;
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 4c29cb7794a1..cb921c94996a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -553,7 +553,7 @@ static enum vchiq_status service_callback(struct vchiq_instance *vchiq_instance,
 					  struct vchiq_header *header,
 					  unsigned int handle, void *bulk_ctx)
 {
-	struct vchiq_mmal_instance *instance = vchiq_get_service_userdata(handle);
+	struct vchiq_mmal_instance *instance = vchiq_get_service_userdata(vchiq_instance, handle);
 	u32 msg_len;
 	struct mmal_msg *msg;
 	struct mmal_msg_context *msg_context;
-- 
2.35.3

