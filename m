Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A346D1FCE
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYl5My+boABlwBkdtI4YSYtJJMplcDoxFVjF4RinUQo=;
	b=Qx2Qzyvr2ILqIvEQuZuBndqyXg5pmfl/8I6OIpOkqpyKK5LVS57L8MQfUyktF22KIvJe8L
	HbjHRo8jY527KPu0JkBPMAYz4ApArvwvHg9M/ZEFWu6oEyiSwEdM2smOeIvot3KxE9gYpf
	j91fVrEYIoR59q7HaV8xbkik3eaMXG0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-D12P9bw_OYGwR_SEA8mwMw-1; Wed, 18 May 2022 15:11:52 -0400
X-MC-Unique: D12P9bw_OYGwR_SEA8mwMw-1
Received: by mail-qv1-f69.google.com with SMTP id 11-20020a0562140d0b00b0045aac32023fso2310530qvh.19
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZYl5My+boABlwBkdtI4YSYtJJMplcDoxFVjF4RinUQo=;
        b=yiCA5ieXWFt57LLwqd2JJQEiE2Z76CDRHHqrX0tyqjA9R4hqeKRumUGnEgQYdZoe7s
         4cstfkJA0sLr+au4iQmHNbN7S5sXVSyNrde9J1NBa9aw+cCS8KumEV/iKma3okZ0wti2
         6GBLNO0CN2Np3PLBX3LDtwwsK5JZgK5OBm87W+TgHC+GTU/hq3SVrpj2nidf+H+d0vBL
         9+ziLOJ2yg3Snqg7s4Bf4jkfBs9ZbcJoc9432b4ACt99NeWPAhOXo+OGpu/OZbzTaZRM
         h6c8LyAm6f4PyGs/0l12DgU1f75T9iTQ9qCdqOM00F81+arMzvoXzY2FxdvW6dPq3cyU
         1T6w==
X-Gm-Message-State: AOAM533WR2Yb42K0gxebCiCBoJWSv7M5iDAhwBRKSuTf8HRzTkmeTLzs
	5HWCNPqPO7yzDpvtnGl7FzeQUQ3OEgGxblef+qteOLOY6e7COrSr1SZD5NYUW9BaqtOdCDHH7c2
	Cwo19q6lgdcavrXrQC80wfiH1qQ==
X-Received: by 2002:a05:620a:20c1:b0:6a0:4217:b2cc with SMTP id f1-20020a05620a20c100b006a04217b2ccmr727823qka.280.1652901111966;
        Wed, 18 May 2022 12:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlcy622B6oNjP/prwulbM4e6dmSbgOzdw8xUrP7TW1MBXOvQTd9IJCEvG4gI3cVvBklIrMNA==
X-Received: by 2002:a05:620a:20c1:b0:6a0:4217:b2cc with SMTP id f1-20020a05620a20c100b006a04217b2ccmr727803qka.280.1652901111774;
        Wed, 18 May 2022 12:11:51 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:11:51 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/9] staging: vchiq_arm: add reference to vchiq device in vchiq_state
Date: Wed, 18 May 2022 15:11:12 -0400
Message-Id: <20220518191126.60396-2-athierry@redhat.com>
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

Add a reference to the vchiq device in the vchiq_state structure. This
allows the device structure to be passed around, which will be useful in
order to get rid of the global g_dev structure. This change will also
make it possible to use standard kernel logging macros instead of the
custom ones.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
Changes since v1:
- added more info to commit message

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c    | 4 +++-
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h    | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0596ac61e286..e6e0737c85fc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -519,7 +519,7 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
 	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
 
-	err = vchiq_init_state(state, vchiq_slot_zero);
+	err = vchiq_init_state(state, vchiq_slot_zero, dev);
 	if (err)
 		return err;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8f99272dbd6f..0d5c39d7c6e2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2142,7 +2142,7 @@ vchiq_init_slots(void *mem_base, int mem_size)
 }
 
 int
-vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
+vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, struct device *dev)
 {
 	struct vchiq_shared_state *local;
 	struct vchiq_shared_state *remote;
@@ -2169,6 +2169,8 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 
 	memset(state, 0, sizeof(struct vchiq_state));
 
+	state->dev = dev;
+
 	/*
 	 * initialize shared state pointers
 	 */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 82b7bd7b54b2..352017ff5309 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -315,6 +315,7 @@ struct vchiq_slot_zero {
 };
 
 struct vchiq_state {
+	struct device *dev;
 	int id;
 	int initialised;
 	enum vchiq_connstate conn_state;
@@ -458,7 +459,7 @@ extern struct vchiq_slot_zero *
 vchiq_init_slots(void *mem_base, int mem_size);
 
 extern int
-vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero);
+vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, struct device *dev);
 
 extern enum vchiq_status
 vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instance);
-- 
2.35.3

