Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5769D2C98
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:25:56 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id a17so18164300uax.12
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wY2nDclaLgOKVb3wF2iM6yH+HK65pZ+hsDlb1ZpHiao=;
        b=eEG+LojCcslFHQf9iugJoCrICaZoeRodDnaYqj7KCp5S086utIChtfXmxUDp8z/Kcb
         bbw3nyaSIj19kACxCe+awkpcYlbC21Ds7xH93J0we6UBpAKPwtbmGfSKtkoSTsQEw2BE
         x02iaydXb09w4u4QL312fE0EtwXjXtPsnVYKtwrtppjKJDFrBrrOLXOF15yXF+xrr6rX
         uSnSsWDWrPyEIiaAB1mTlCXyfYFODJ4RA64j876q8Xqw0HBUeooFXSrBfAaL7ZgEYLmW
         LBl30izeWZyzKCgT2MgVyApZywaxSSH7/iHz9DJTcKJ12kff3tts8xn6hCD61g86BvGy
         qUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wY2nDclaLgOKVb3wF2iM6yH+HK65pZ+hsDlb1ZpHiao=;
        b=vAz9emaHxE1vmYu9KsYT8ikOHx/MNgIJL7N4M8E0bzrM2yRDVmUfCP6KK17oLwu06d
         Csf4c+p3JcJ5FsrfbB8PhDwY8TDzdFqskwNXvLdvyKQ7Jl+jEPm7eqE8fP5FgZWRImg8
         pYA4xzBITKlZJ5bjImEbcxr21hPhxrEceNiSNEi60gMjr2uWoSkbZFiAYdQhBE9wPAdd
         eGBNETLzy+0jxUzNGnetuVi6ZTOn+BiZ70Uk0ysunasmtpqCuoMv4ppBgN4bEATWIvp3
         NH51EcVGJtLxlC6UMYhir3d+Gx5IohwyD0G3PE8emwjs2DzFbvdBmKX03iTUcxs+VqTu
         0zZg==
X-Gm-Message-State: AOAM5327BYPeDEzu4QtwkEd/ulfKvxdgIouNGfvPWnXeUOctF6/R+cNG
	vUG/pHone1pNtDp0Mh+jsPRTTf2+pR2dvg==
X-Google-Smtp-Source: ABdhPJwo7pa5FDNVmAAzL9vvajkYDwrBsn4NR3XSiB3WmgCUDTO7UMQgoxuUDMUB3LJBawJ/AtJpbA==
X-Received: by 2002:a05:6102:304e:: with SMTP id w14mr11429886vsa.52.1635110755219;
        Sun, 24 Oct 2021 14:25:55 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 45sm8847869uaq.8.2021.10.24.14.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:25:54 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 5/8] staging: vchiq: drop trailing semicolon in macro definition
Date: Sun, 24 Oct 2021 18:25:21 -0300
Message-Id: <20211024212524.370078-6-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211024212524.370078-1-gascoar@gmail.com>
References: <20211024212524.370078-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by checkpatch.pl, macro definitions should not use a trailing
semicolon.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 4 ++--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h  | 2 +-
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6fbafdfe340f..d27c5191fbd2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -986,7 +986,7 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	struct vchiq_completion_data_kernel *completion;
 	int insert;
 
-	DEBUG_INITIALISE(g_state.local)
+	DEBUG_INITIALISE(g_state.local);
 
 	insert = instance->completion_insert;
 	while ((insert - instance->completion_remove) >= MAX_COMPLETIONS) {
@@ -1054,7 +1054,7 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 	struct vchiq_instance *instance;
 	bool skip_completion = false;
 
-	DEBUG_INITIALISE(g_state.local)
+	DEBUG_INITIALISE(g_state.local);
 
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index d64d6a0427eb..22d0e706b2dc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1585,7 +1585,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 	unsigned int localport, remoteport;
 	int msgid, size, type, ret = -EINVAL;
 
-	DEBUG_INITIALISE(state->local)
+	DEBUG_INITIALISE(state->local);
 
 	DEBUG_VALUE(PARSE_HEADER, (int)(long)header);
 	msgid = header->msgid;
@@ -1856,7 +1856,7 @@ parse_rx_slots(struct vchiq_state *state)
 	struct vchiq_shared_state *remote = state->remote;
 	int tx_pos;
 
-	DEBUG_INITIALISE(state->local)
+	DEBUG_INITIALISE(state->local);
 
 	tx_pos = remote->tx_pos;
 
@@ -1961,7 +1961,7 @@ slot_handler_func(void *v)
 	struct vchiq_state *state = v;
 	struct vchiq_shared_state *local = state->local;
 
-	DEBUG_INITIALISE(local)
+	DEBUG_INITIALISE(local);
 
 	while (1) {
 		DEBUG_COUNT(SLOT_HANDLER_COUNT);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index a107c72ce3a6..e54e9d80bd7f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -104,7 +104,7 @@ enum {
 
 #if VCHIQ_ENABLE_DEBUG
 
-#define DEBUG_INITIALISE(local) int *debug_ptr = (local)->debug;
+#define DEBUG_INITIALISE(local) int *debug_ptr = (local)->debug
 #define DEBUG_TRACE(d) \
 	do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
 #define DEBUG_VALUE(d, v) \
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 32aa1e62450d..2325844b0880 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -210,7 +210,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 	struct vchiq_header *header;
 	int ret;
 
-	DEBUG_INITIALISE(g_state.local)
+	DEBUG_INITIALISE(g_state.local);
 	DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 	service = find_service_for_instance(instance, args->handle);
 	if (!service)
@@ -439,7 +439,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 	int remove;
 	int ret;
 
-	DEBUG_INITIALISE(g_state.local)
+	DEBUG_INITIALISE(g_state.local);
 
 	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
 	if (!instance->connected)
-- 
2.33.1

