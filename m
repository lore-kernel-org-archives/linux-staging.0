Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E41FD4
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3kHmkFKa8N/b7P5EPu8Whry0f5IeaDhnc3ZXcXoC+G4=;
	b=AEAQMvuzUXTTWHs1wYstQrZmicdx+P+ZrHuHxOcDeaeoBqt1/cYTe48GDhMXugsgckHk3O
	Owc2som4kv0kKkgo0O2ufv3jucJZYrhr2nujRKgVYmBYp6NLfFxM1rV4+dnXYDaILlqUaV
	h/T3xkZ4g/AbrrhsT9s5OJnAY6Uti0Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-f61yYfRLMl-T1yEKlPsvLw-1; Wed, 18 May 2022 15:12:14 -0400
X-MC-Unique: f61yYfRLMl-T1yEKlPsvLw-1
Received: by mail-qk1-f197.google.com with SMTP id a5-20020ae9e805000000b006a034b31384so2257737qkg.8
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3kHmkFKa8N/b7P5EPu8Whry0f5IeaDhnc3ZXcXoC+G4=;
        b=Y4JCgBFpPCC1HnUUx7fH57sJtcqSy41G//iJ/ExxSJIS8T1cCFRxiwTa5uZvZ5iMe/
         Xzvba6jLllW4L5PMkgNu0ixVUFooi5Uys7QJkPcGS6M7VIhHvFbiY0iLRS46R0k5gRa/
         dJjVqAClczLYaScW5LeZvSGMBwI5i3wixGI1gRYDPyYNGsXkUDiGR1h/Ya05i8sbTvxC
         +I6YaSQuNNoJc9oLF86vTZI/2NKJ2Etc9vYFGePjqQDeiaSos6naYrAs+ACrR1kmZK8U
         FjWh5V+J5/vKMUUuvsl1YWOOpUpEWQ8Dplt3eb6yT/v3zC3SGImRXaJ5zd5q+unAcAn3
         KJvQ==
X-Gm-Message-State: AOAM533yTFy3KAvi+IveygsJs4L4VU/NinE09ufjmqGvANJu5JQYxGo6
	QlyYlhqs89mioahtwgLo1jETEQVbm4k8zX5OE9JFcK2qOx+zi8mEPSvNXJtrnYHvwmxZqMAIlHL
	ogkJ68dLDkI1QPVPekdQRxr1lJg==
X-Received: by 2002:a05:622a:4d4:b0:2f3:c529:5f89 with SMTP id q20-20020a05622a04d400b002f3c5295f89mr1212227qtx.158.1652901133746;
        Wed, 18 May 2022 12:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDTpVg+9NwiSLmevtf5g+Ysj1N5cOOcjxsuXhAJ6Go3ij17Z9lOG95DL7dwjCExXMq08rimA==
X-Received: by 2002:a05:622a:4d4:b0:2f3:c529:5f89 with SMTP id q20-20020a05622a04d400b002f3c5295f89mr1212210qtx.158.1652901133568;
        Wed, 18 May 2022 12:12:13 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:12:13 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 8/9] staging: vchiq_arm: use state from vchiq instance
Date: Wed, 18 May 2022 15:11:19 -0400
Message-Id: <20220518191126.60396-9-athierry@redhat.com>
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

In 'handle_to_service', access the vchiq state from the vchiq instance
instead of the global 'vchiq_states' array. This will allow getting rid
of the global 'vchiq_states' array.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c   |  7 +++++++
 .../vc04_services/interface/vchiq_arm/vchiq_core.h   | 12 +-----------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index be2ee84686b7..cd23d18f8b3c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -13,6 +13,7 @@
 #include <linux/rcupdate.h>
 #include <linux/sched/signal.h>
 
+#include "vchiq_arm.h"
 #include "vchiq_core.h"
 
 #define VCHIQ_SLOT_HANDLER_STACK 8192
@@ -234,6 +235,12 @@ set_service_state(struct vchiq_service *service, int newstate)
 	service->srvstate = newstate;
 }
 
+struct vchiq_service *handle_to_service(struct vchiq_instance *instance, unsigned int handle)
+{
+	int idx = handle & (VCHIQ_MAX_SERVICES - 1);
+
+	return rcu_dereference(instance->state->services[idx]);
+}
 struct vchiq_service *
 find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 07c3a82e6084..f87b4b9b3596 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -509,17 +509,7 @@ extern void
 request_poll(struct vchiq_state *state, struct vchiq_service *service,
 	     int poll_type);
 
-static inline struct vchiq_service *
-handle_to_service(struct vchiq_instance *instance, unsigned int handle)
-{
-	int idx = handle & (VCHIQ_MAX_SERVICES - 1);
-	struct vchiq_state *state = vchiq_states[(handle / VCHIQ_MAX_SERVICES) &
-		(VCHIQ_MAX_STATES - 1)];
-
-	if (!state)
-		return NULL;
-	return rcu_dereference(state->services[idx]);
-}
+struct vchiq_service *handle_to_service(struct vchiq_instance *instance, unsigned int handle);
 
 extern struct vchiq_service *
 find_service_by_handle(struct vchiq_instance *instance, unsigned int handle);
-- 
2.35.3

