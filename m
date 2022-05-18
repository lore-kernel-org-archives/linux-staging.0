Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D171FCE
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXK3QnDOhyeZnccnr1jqh/xn6kz5HxQmGg1+NZxLPbs=;
	b=gYOJO2pNgzAUQfYFzMkTYDhqSmivqf2BPVikmYheekq777y8EcwVNoH01ozPIuGW79uVyN
	3csSX/WSJKkKufJ/KsDyVVEsHV7nlzMQyDbiKggtAMp39zAvCuTnby6pDaa6DYYEUGFd7i
	Ho5xwvvPIfoLqTyFKx18CJd/f0j54OQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-NlHuE6AlPfWKUDtw00L-DQ-1; Wed, 18 May 2022 15:11:57 -0400
X-MC-Unique: NlHuE6AlPfWKUDtw00L-DQ-1
Received: by mail-qt1-f200.google.com with SMTP id bz27-20020a05622a1e9b00b002f3c8790fe1so2359377qtb.14
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RXK3QnDOhyeZnccnr1jqh/xn6kz5HxQmGg1+NZxLPbs=;
        b=MhAkaaoO9OUi7kIqbo6lPE5Cctlk/xJvadM4eSO6/So6Z7id7DfaJhtpkYwKAKEah7
         yEqrpHM85jo0kCnyDfmmrK658SFryQPEnRl+DoGcAy3Ty4dTZVSAg62AsYb6qYXcfSNH
         +dUpeG3bNlg9hnANilEpWEoJRqKxn7MEAnCUyGc2NYyymnA2nK3nClxombKSrTzKD0V7
         9KsKOC09gg0lQ/O/89fo9LE/Zjt/s8Cu7ZkhQPucf0kfYOPq2b3eJ8DLVHbz47kTj6go
         QD1weN0Wdx1zdhL8sQhkoMqqSIDXKogTonEFDeebvofvpxXYJomwu9OEP1U1bx0pyJvL
         wYzQ==
X-Gm-Message-State: AOAM533/AzUet3RMLuHols//rP8ZdKDLwN5GJl3Jnuq+oFl4ehv2rOvV
	m7JXB5gqw9X4kVoWdeHIHQz+eXgjx1jfdnjx49WeS7Jy7QdTA7ElLeIgrp21YpgZTKg+VGKmx6K
	Ot9ANEVsyq3Fgo6pODKRVufijKg==
X-Received: by 2002:a05:620a:3193:b0:6a0:1566:eae3 with SMTP id bi19-20020a05620a319300b006a01566eae3mr647379qkb.637.1652901116515;
        Wed, 18 May 2022 12:11:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAOuKjTHiH7aPqiyNecm9+8Sm3ek1yrGBhOZoGFc1LNg33ajgpi8hc8BHCAT3bT/TL2O2FjA==
X-Received: by 2002:a05:620a:3193:b0:6a0:1566:eae3 with SMTP id bi19-20020a05620a319300b006a01566eae3mr647349qkb.637.1652901116188;
        Wed, 18 May 2022 12:11:56 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:11:55 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/9] staging: vchiq_arm: get rid of global device structure
Date: Wed, 18 May 2022 15:11:13 -0400
Message-Id: <20220518191126.60396-3-athierry@redhat.com>
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

Get rid of the global g_dev structure.

This is part of an effort to address TODO item "Get rid of all non
essential global structures and create a proper per device structure"

I chose to pass the vchiq_instance around instead of the device
reference because in order to get rid of the 'vchiq_states' global array
in the future, we will need another way to access the vchiq_state in the
'handle_to_service' function. Therefore, we will need to pass the
vchiq_instance to it (or the vchiq_state), and also pass it to functions
higher up in the caller chain, such as 'vchiq_bulk_transmit' and friends
which are used in the bcm2835-audio consumer.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
Changes since v1:
- added more info to commit message

 .../bcm2835-audio/bcm2835-vchiq.c             |  7 ++-
 .../include/linux/raspberrypi/vchiq.h         | 12 ++--
 .../interface/vchiq_arm/vchiq_arm.c           | 63 +++++++++----------
 .../interface/vchiq_arm/vchiq_core.c          | 14 ++---
 .../interface/vchiq_arm/vchiq_core.h          | 10 +--
 .../interface/vchiq_arm/vchiq_dev.c           |  2 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  2 +-
 7 files changed, 53 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index e429b33b4d39..701abe430877 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -322,6 +322,8 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 			unsigned int size, void *src)
 {
 	struct bcm2835_audio_instance *instance = alsa_stream->instance;
+	struct bcm2835_vchi_ctx *vchi_ctx = alsa_stream->chip->vchi_ctx;
+	struct vchiq_instance *vchiq_instance = vchi_ctx->instance;
 	struct vc_audio_msg m = {
 		.type = VC_AUDIO_MSG_TYPE_WRITE,
 		.write.count = size,
@@ -343,9 +345,8 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 	count = size;
 	if (!instance->max_packet) {
 		/* Send the message to the videocore */
-		status = vchiq_bulk_transmit(instance->service_handle, src,
-					     count, NULL,
-					     VCHIQ_BULK_MODE_BLOCKING);
+		status = vchiq_bulk_transmit(vchiq_instance, instance->service_handle, src, count,
+					     NULL, VCHIQ_BULK_MODE_BLOCKING);
 	} else {
 		while (count > 0) {
 			int bytes = min(instance->max_packet, count);
diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index c93f2f3e87bb..715f02e7f1e1 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -96,12 +96,12 @@ extern void           vchiq_release_message(unsigned int service,
 	struct vchiq_header *header);
 extern int vchiq_queue_kernel_message(unsigned int handle, void *data,
 				      unsigned int size);
-extern enum vchiq_status vchiq_bulk_transmit(unsigned int service,
-	const void *data, unsigned int size, void *userdata,
-	enum vchiq_bulk_mode mode);
-extern enum vchiq_status vchiq_bulk_receive(unsigned int service,
-	void *data, unsigned int size, void *userdata,
-	enum vchiq_bulk_mode mode);
+extern enum vchiq_status vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int service,
+					     const void *data, unsigned int size, void *userdata,
+					     enum vchiq_bulk_mode mode);
+extern enum vchiq_status vchiq_bulk_receive(struct vchiq_instance *instance, unsigned int service,
+					    void *data, unsigned int size, void *userdata,
+					    enum vchiq_bulk_mode mode);
 extern void *vchiq_get_service_userdata(unsigned int service);
 extern enum vchiq_status vchiq_get_peer_version(unsigned int handle,
 	short *peer_version);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e6e0737c85fc..3b447c635c3f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -148,12 +148,11 @@ static unsigned int g_fragments_size;
 static char *g_fragments_base;
 static char *g_free_fragments;
 static struct semaphore g_free_fragments_sema;
-static struct device *g_dev;
 
 static DEFINE_SEMAPHORE(g_free_fragments_mutex);
 
 static enum vchiq_status
-vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
+vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
 			     unsigned int size, enum vchiq_bulk_dir dir);
 
 static irqreturn_t
@@ -175,17 +174,17 @@ vchiq_doorbell_irq(int irq, void *dev_id)
 }
 
 static void
-cleanup_pagelistinfo(struct vchiq_pagelist_info *pagelistinfo)
+cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo)
 {
 	if (pagelistinfo->scatterlist_mapped) {
-		dma_unmap_sg(g_dev, pagelistinfo->scatterlist,
+		dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
 			     pagelistinfo->num_pages, pagelistinfo->dma_dir);
 	}
 
 	if (pagelistinfo->pages_need_release)
 		unpin_user_pages(pagelistinfo->pages, pagelistinfo->num_pages);
 
-	dma_free_coherent(g_dev, pagelistinfo->pagelist_buffer_size,
+	dma_free_coherent(instance->state->dev, pagelistinfo->pagelist_buffer_size,
 			  pagelistinfo->pagelist, pagelistinfo->dma_addr);
 }
 
@@ -212,7 +211,7 @@ is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
  */
 
 static struct vchiq_pagelist_info *
-create_pagelist(char *buf, char __user *ubuf,
+create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 		size_t count, unsigned short type)
 {
 	struct pagelist *pagelist;
@@ -250,7 +249,7 @@ create_pagelist(char *buf, char __user *ubuf,
 	/* Allocate enough storage to hold the page pointers and the page
 	 * list
 	 */
-	pagelist = dma_alloc_coherent(g_dev, pagelist_size, &dma_addr,
+	pagelist = dma_alloc_coherent(instance->state->dev, pagelist_size, &dma_addr,
 				      GFP_KERNEL);
 
 	vchiq_log_trace(vchiq_arm_log_level, "%s - %pK", __func__, pagelist);
@@ -292,7 +291,7 @@ create_pagelist(char *buf, char __user *ubuf,
 			size_t bytes = PAGE_SIZE - off;
 
 			if (!pg) {
-				cleanup_pagelistinfo(pagelistinfo);
+				cleanup_pagelistinfo(instance, pagelistinfo);
 				return NULL;
 			}
 
@@ -315,7 +314,7 @@ create_pagelist(char *buf, char __user *ubuf,
 			/* This is probably due to the process being killed */
 			if (actual_pages > 0)
 				unpin_user_pages(pages, actual_pages);
-			cleanup_pagelistinfo(pagelistinfo);
+			cleanup_pagelistinfo(instance, pagelistinfo);
 			return NULL;
 		}
 		 /* release user pages */
@@ -338,13 +337,13 @@ create_pagelist(char *buf, char __user *ubuf,
 		count -= len;
 	}
 
-	dma_buffers = dma_map_sg(g_dev,
+	dma_buffers = dma_map_sg(instance->state->dev,
 				 scatterlist,
 				 num_pages,
 				 pagelistinfo->dma_dir);
 
 	if (dma_buffers == 0) {
-		cleanup_pagelistinfo(pagelistinfo);
+		cleanup_pagelistinfo(instance, pagelistinfo);
 		return NULL;
 	}
 
@@ -378,7 +377,7 @@ create_pagelist(char *buf, char __user *ubuf,
 		char *fragments;
 
 		if (down_interruptible(&g_free_fragments_sema)) {
-			cleanup_pagelistinfo(pagelistinfo);
+			cleanup_pagelistinfo(instance, pagelistinfo);
 			return NULL;
 		}
 
@@ -397,7 +396,7 @@ create_pagelist(char *buf, char __user *ubuf,
 }
 
 static void
-free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
+free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo,
 	      int actual)
 {
 	struct pagelist *pagelist = pagelistinfo->pagelist;
@@ -411,7 +410,7 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
 	 * NOTE: dma_unmap_sg must be called before the
 	 * cpu can touch any of the data/pages.
 	 */
-	dma_unmap_sg(g_dev, pagelistinfo->scatterlist,
+	dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
 		     pagelistinfo->num_pages, pagelistinfo->dma_dir);
 	pagelistinfo->scatterlist_mapped = 0;
 
@@ -460,7 +459,7 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
 			set_page_dirty(pages[i]);
 	}
 
-	cleanup_pagelistinfo(pagelistinfo);
+	cleanup_pagelistinfo(instance, pagelistinfo);
 }
 
 int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
@@ -547,7 +546,6 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 		return err ? : -ENXIO;
 	}
 
-	g_dev = dev;
 	vchiq_log_info(vchiq_arm_log_level, "vchiq_init - done (slots %pK, phys %pad)",
 		       vchiq_slot_zero, &slot_phys);
 
@@ -615,12 +613,12 @@ remote_event_signal(struct remote_event *event)
 }
 
 int
-vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset,
+vchiq_prepare_bulk_data(struct vchiq_instance *instance, struct vchiq_bulk *bulk, void *offset,
 			void __user *uoffset, int size, int dir)
 {
 	struct vchiq_pagelist_info *pagelistinfo;
 
-	pagelistinfo = create_pagelist(offset, uoffset, size,
+	pagelistinfo = create_pagelist(instance, offset, uoffset, size,
 				       (dir == VCHIQ_BULK_RECEIVE)
 				       ? PAGELIST_READ
 				       : PAGELIST_WRITE);
@@ -640,10 +638,10 @@ vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset,
 }
 
 void
-vchiq_complete_bulk(struct vchiq_bulk *bulk)
+vchiq_complete_bulk(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 {
 	if (bulk && bulk->remote_data && bulk->actual)
-		free_pagelist((struct vchiq_pagelist_info *)bulk->remote_data,
+		free_pagelist(instance, (struct vchiq_pagelist_info *)bulk->remote_data,
 			      bulk->actual);
 }
 
@@ -834,8 +832,8 @@ vchiq_open_service(struct vchiq_instance *instance,
 EXPORT_SYMBOL(vchiq_open_service);
 
 enum vchiq_status
-vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
-		    void *userdata, enum vchiq_bulk_mode mode)
+vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int handle, const void *data,
+		    unsigned int size, void *userdata, enum vchiq_bulk_mode mode)
 {
 	enum vchiq_status status;
 
@@ -843,13 +841,13 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
 		switch (mode) {
 		case VCHIQ_BULK_MODE_NOCALLBACK:
 		case VCHIQ_BULK_MODE_CALLBACK:
-			status = vchiq_bulk_transfer(handle,
+			status = vchiq_bulk_transfer(instance, handle,
 						     (void *)data, NULL,
 						     size, userdata, mode,
 						     VCHIQ_BULK_TRANSMIT);
 			break;
 		case VCHIQ_BULK_MODE_BLOCKING:
-			status = vchiq_blocking_bulk_transfer(handle, (void *)data, size,
+			status = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
 							      VCHIQ_BULK_TRANSMIT);
 			break;
 		default:
@@ -871,8 +869,8 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
 }
 EXPORT_SYMBOL(vchiq_bulk_transmit);
 
-enum vchiq_status vchiq_bulk_receive(unsigned int handle, void *data,
-				     unsigned int size, void *userdata,
+enum vchiq_status vchiq_bulk_receive(struct vchiq_instance *instance, unsigned int handle,
+				     void *data, unsigned int size, void *userdata,
 				     enum vchiq_bulk_mode mode)
 {
 	enum vchiq_status status;
@@ -881,12 +879,12 @@ enum vchiq_status vchiq_bulk_receive(unsigned int handle, void *data,
 		switch (mode) {
 		case VCHIQ_BULK_MODE_NOCALLBACK:
 		case VCHIQ_BULK_MODE_CALLBACK:
-			status = vchiq_bulk_transfer(handle, data, NULL,
+			status = vchiq_bulk_transfer(instance, handle, data, NULL,
 						     size, userdata,
 						     mode, VCHIQ_BULK_RECEIVE);
 			break;
 		case VCHIQ_BULK_MODE_BLOCKING:
-			status = vchiq_blocking_bulk_transfer(handle, (void *)data, size,
+			status = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
 							      VCHIQ_BULK_RECEIVE);
 			break;
 		default:
@@ -909,10 +907,9 @@ enum vchiq_status vchiq_bulk_receive(unsigned int handle, void *data,
 EXPORT_SYMBOL(vchiq_bulk_receive);
 
 static enum vchiq_status
-vchiq_blocking_bulk_transfer(unsigned int handle, void *data, unsigned int size,
-			     enum vchiq_bulk_dir dir)
+vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
+			     unsigned int size, enum vchiq_bulk_dir dir)
 {
-	struct vchiq_instance *instance;
 	struct vchiq_service *service;
 	enum vchiq_status status;
 	struct bulk_waiter_node *waiter = NULL, *iter;
@@ -921,8 +918,6 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data, unsigned int size,
 	if (!service)
 		return VCHIQ_ERROR;
 
-	instance = service->instance;
-
 	vchiq_service_put(service);
 
 	mutex_lock(&instance->bulk_waiter_list_mutex);
@@ -959,7 +954,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data, unsigned int size,
 		}
 	}
 
-	status = vchiq_bulk_transfer(handle, data, NULL, size,
+	status = vchiq_bulk_transfer(instance, handle, data, NULL, size,
 				     &waiter->bulk_waiter,
 				     VCHIQ_BULK_MODE_BLOCKING, dir);
 	if ((status != VCHIQ_RETRY) || fatal_signal_pending(current) || !waiter->bulk_waiter.bulk) {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 0d5c39d7c6e2..04eec18835da 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1441,7 +1441,7 @@ abort_outstanding_bulks(struct vchiq_service *service,
 		}
 
 		if (queue->process != queue->local_insert) {
-			vchiq_complete_bulk(bulk);
+			vchiq_complete_bulk(service->instance, bulk);
 
 			vchiq_log_info(SRVTRACE_LEVEL(service),
 				       "%s %c%c%c%c d:%d ABORTED - tx len:%d, rx len:%d",
@@ -1769,7 +1769,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 
 			DEBUG_TRACE(PARSE_LINE);
 			WARN_ON(queue->process == queue->local_insert);
-			vchiq_complete_bulk(bulk);
+			vchiq_complete_bulk(service->instance, bulk);
 			queue->process++;
 			mutex_unlock(&service->bulk_mutex);
 			DEBUG_TRACE(PARSE_LINE);
@@ -2998,9 +2998,9 @@ vchiq_remove_service(unsigned int handle)
  * When called in blocking mode, the userdata field points to a bulk_waiter
  * structure.
  */
-enum vchiq_status vchiq_bulk_transfer(unsigned int handle, void *offset, void __user *uoffset,
-				      int size, void *userdata, enum vchiq_bulk_mode mode,
-				      enum vchiq_bulk_dir dir)
+enum vchiq_status vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
+				      void *offset, void __user *uoffset, int size, void *userdata,
+				      enum vchiq_bulk_mode mode, enum vchiq_bulk_dir dir)
 {
 	struct vchiq_service *service = find_service_by_handle(handle);
 	struct vchiq_bulk_queue *queue;
@@ -3077,7 +3077,7 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle, void *offset, void __
 	bulk->size = size;
 	bulk->actual = VCHIQ_BULK_ACTUAL_ABORTED;
 
-	if (vchiq_prepare_bulk_data(bulk, offset, uoffset, size, dir))
+	if (vchiq_prepare_bulk_data(instance, bulk, offset, uoffset, size, dir))
 		goto unlock_error_exit;
 
 	wmb();
@@ -3141,7 +3141,7 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle, void *offset, void __
 unlock_both_error_exit:
 	mutex_unlock(&state->slot_mutex);
 cancel_bulk_error_exit:
-	vchiq_complete_bulk(bulk);
+	vchiq_complete_bulk(service->instance, bulk);
 unlock_error_exit:
 	mutex_unlock(&service->bulk_mutex);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 352017ff5309..2ce54ce9f02a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -489,8 +489,8 @@ extern void
 remote_event_pollall(struct vchiq_state *state);
 
 extern enum vchiq_status
-vchiq_bulk_transfer(unsigned int handle, void *offset, void __user *uoffset,
-		    int size, void *userdata, enum vchiq_bulk_mode mode,
+vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *offset,
+		    void __user *uoffset, int size, void *userdata, enum vchiq_bulk_mode mode,
 		    enum vchiq_bulk_dir dir);
 
 extern int
@@ -556,10 +556,10 @@ vchiq_queue_message(unsigned int handle,
 		    void *context,
 		    size_t size);
 
-int vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset, void __user *uoffset,
-			    int size, int dir);
+int vchiq_prepare_bulk_data(struct vchiq_instance *instance, struct vchiq_bulk *bulk, void *offset,
+			    void __user *uoffset, int size, int dir);
 
-void vchiq_complete_bulk(struct vchiq_bulk *bulk);
+void vchiq_complete_bulk(struct vchiq_instance *instance, struct vchiq_bulk *bulk);
 
 void remote_event_signal(struct remote_event *event);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 66bbfec332ba..077e3fcbd651 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -330,7 +330,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		userdata = args->userdata;
 	}
 
-	status = vchiq_bulk_transfer(args->handle, NULL, args->data, args->size,
+	status = vchiq_bulk_transfer(instance, args->handle, NULL, args->data, args->size,
 				     userdata, args->mode, dir);
 
 	if (!waiter) {
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 845b20e4d05a..145021af93b2 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -293,7 +293,7 @@ static void buffer_to_host_work_cb(struct work_struct *work)
 		len = 8;
 	/* queue the bulk submission */
 	vchiq_use_service(instance->service_handle);
-	ret = vchiq_bulk_receive(instance->service_handle,
+	ret = vchiq_bulk_receive(instance->vchiq_instance, instance->service_handle,
 				 msg_context->u.bulk.buffer->buffer,
 				 /* Actual receive needs to be a multiple
 				  * of 4 bytes
-- 
2.35.3

