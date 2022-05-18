Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740E1FCE
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sg20xHDfgN1BOulN0eUcyhyNQewPpaOynO81ybyXei4=;
	b=cCU4g46VbC/Rjck83uUySJ0hfNq4DGb4YL8I1IPUJiMmi3Cxi+ORmbpJrS/Y2lclGPjKPr
	UMCswjT0LAX/SIKzeYC6QG9hKIric98RhQyHnX+p9uBTkwoQ7iir33UzAR9prOXmV1C4R7
	+Ux1oEs1ptnefubYkICthbwk/nga+ok=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-ccOq3aiSNDWn4VxkPwxETw-1; Wed, 18 May 2022 15:12:12 -0400
X-MC-Unique: ccOq3aiSNDWn4VxkPwxETw-1
Received: by mail-qv1-f71.google.com with SMTP id x11-20020a056214052b00b00461f2984c36so1171898qvw.20
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sg20xHDfgN1BOulN0eUcyhyNQewPpaOynO81ybyXei4=;
        b=cZCzneQGHS30rtQYyu53pzSkd25RO8DWQwKb/IEKEb94zD6xN6SaARvRs7N4dtu/A+
         +5fz1V1lZFxYYPFFNix5ZFelCeNFfenOphyyt6tlFsxHSdD2XbnaxFSltEUEnuTJA4+V
         wOsrv78Pa5WVNwOpQGlhVlDstWrqvMFsjzbHtVulGl3k/rGcPgnBxbxIqoFEX7dfG/Tc
         95wVAf0n8WtCllwt/u9bergVyZa75fP2pxCImlIlf4GE4okiMEBKtO4YhgxMvIp3BllL
         XrJt9FkuehmALfy4oeVX3JKsSt2ouBXGmSdMpYQRejRmf7bAK1WUH4BczxFfXP1Qh89R
         p6CA==
X-Gm-Message-State: AOAM532C4rHT/iPzdA4IHAhddKac3+63KNeL0vylHYtmAN7IEa8fdynP
	WZyDBSn1Vmp4PKj1Nng/9iBDnc2qqM36U0HNuqGBBW9rs9IaGeROEoEyCwhg5071c8xyHcTQjd6
	uMTgsv9aeq7eMnE8P7aECLUf1pg==
X-Received: by 2002:ac8:5714:0:b0:2f3:b4b0:6fd6 with SMTP id 20-20020ac85714000000b002f3b4b06fd6mr1112665qtw.651.1652901132058;
        Wed, 18 May 2022 12:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh0+WH0NPDmgbKF6DlJhlfeSM9pTOADC8yCFrSczYQJ12yEUnIZSa+7/ysBsupBMjymlmmzA==
X-Received: by 2002:ac8:5714:0:b0:2f3:b4b0:6fd6 with SMTP id 20-20020ac85714000000b002f3b4b06fd6mr1112649qtw.651.1652901131856;
        Wed, 18 May 2022 12:12:11 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:12:11 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 7/9] staging: vchiq_arm: pass vchiq instance to 'handle_to_service'
Date: Wed, 18 May 2022 15:11:18 -0400
Message-Id: <20220518191126.60396-8-athierry@redhat.com>
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
vchiq_instance reference to the 'handle_to_service' function. This will
allow accessing the vchiq state through the vchiq instance instead of
through the global array.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++-----
 .../vc04_services/interface/vchiq_arm/vchiq_core.h     |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index a5f0a756b32c..3bcb893d14a1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1059,7 +1059,7 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 
 	rcu_read_lock();
-	service = handle_to_service(handle);
+	service = handle_to_service(instance, handle);
 	if (WARN_ON(!service)) {
 		rcu_read_unlock();
 		return VCHIQ_SUCCESS;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index d4fed18b1baa..be2ee84686b7 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -240,7 +240,7 @@ find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 	struct vchiq_service *service;
 
 	rcu_read_lock();
-	service = handle_to_service(handle);
+	service = handle_to_service(instance, handle);
 	if (service && service->srvstate != VCHIQ_SRVSTATE_FREE &&
 	    service->handle == handle &&
 	    kref_get_unless_zero(&service->ref_count)) {
@@ -281,7 +281,7 @@ find_service_for_instance(struct vchiq_instance *instance, unsigned int handle)
 	struct vchiq_service *service;
 
 	rcu_read_lock();
-	service = handle_to_service(handle);
+	service = handle_to_service(instance, handle);
 	if (service && service->srvstate != VCHIQ_SRVSTATE_FREE &&
 	    service->handle == handle &&
 	    service->instance == instance &&
@@ -302,7 +302,7 @@ find_closed_service_for_instance(struct vchiq_instance *instance, unsigned int h
 	struct vchiq_service *service;
 
 	rcu_read_lock();
-	service = handle_to_service(handle);
+	service = handle_to_service(instance, handle);
 	if (service &&
 	    (service->srvstate == VCHIQ_SRVSTATE_FREE ||
 	     service->srvstate == VCHIQ_SRVSTATE_CLOSED) &&
@@ -404,7 +404,7 @@ vchiq_get_client_id(struct vchiq_instance *instance, unsigned int handle)
 	int id;
 
 	rcu_read_lock();
-	service = handle_to_service(handle);
+	service = handle_to_service(instance, handle);
 	id = service ? service->client_id : 0;
 	rcu_read_unlock();
 	return id;
@@ -417,7 +417,7 @@ vchiq_get_service_userdata(struct vchiq_instance *instance, unsigned int handle)
 	struct vchiq_service *service;
 
 	rcu_read_lock();
-	service = handle_to_service(handle);
+	service = handle_to_service(instance, handle);
 	userdata = service ? service->base.userdata : NULL;
 	rcu_read_unlock();
 	return userdata;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 45c3d7d1a86a..07c3a82e6084 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -510,7 +510,7 @@ request_poll(struct vchiq_state *state, struct vchiq_service *service,
 	     int poll_type);
 
 static inline struct vchiq_service *
-handle_to_service(unsigned int handle)
+handle_to_service(struct vchiq_instance *instance, unsigned int handle)
 {
 	int idx = handle & (VCHIQ_MAX_SERVICES - 1);
 	struct vchiq_state *state = vchiq_states[(handle / VCHIQ_MAX_SERVICES) &
-- 
2.35.3

