Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278192C98
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:25:59 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id q13so18278410uaq.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BejNJl14O6aHwjAG+IoiEw5ZBNgGlpDEHfmiIDvF9LI=;
        b=a19DZdYKn6qJjG6mB029RkAM3uANS7xF/XuyYFcsA1nbTX526qilPTwXg4CLoibLoI
         RJr5B9zgndK33T0bNydWSbiqyFSX6n6JB0rz5r07/puCaXtbJ+ubuyUwoT5YlXL/ioRj
         7NSG7h3kumh+tqVt9/VP7kSVQcf0ndY3UoSAkkZlhb8+9FwtXwmOAznhT2m4cci4qj6F
         uQle7LYwTIgsZw5crbY1FPkmJ2kjrrEIna5kJNl21aLkRmE+eRxXOSG6BlcEKv5s7Wtt
         JgG7NME2H0yOEuG0t9h7HazP5Uw6VnHZpr0Ewmx7EA5CpBpYfaAo2lC5uJBJ1B088GKC
         ezaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BejNJl14O6aHwjAG+IoiEw5ZBNgGlpDEHfmiIDvF9LI=;
        b=5o48ilJ0GRi3RjrGoBqlsLgxU2JN1EGWz7AOjUmlT1vRL7PFvtQw9Iu7A3kJHm2azC
         dGte7mI39zFCa3k32hWwkzAQakYBgS3CildU8ck48SpDOFB/vTUEq8VWZ36cyYNfcEmv
         VWmLFOT+/5UMS5NoJn3Vjk/oW+SSvL7AcYKt3Lul8ZjS2TGrE0gx62KrLqzSEUgOHail
         GqvU43tiREdkK00qbYSpGtvoDU4fZNETQRnqKLS6xuwBU1rB/qapOdkdyWqSqLB68Bhs
         iEEalzsOh1FMe0ZSXX2oie5ewAOLl/QLeskdwnjBS9XpBkyAXkWwm1R/gA1Nd51w5Mfv
         d+Hg==
X-Gm-Message-State: AOAM531t0aEOdvWjUvotHzbn6MrmreltaKETPLRjGOzUDni9X6N87qT9
	GgIBLz4Xv3/pCXMZWylk5LScKHKxDaDziw==
X-Google-Smtp-Source: ABdhPJznOSLyMtcTR/+jLCQ8ioOfyvwxdVB4py1onqrN9cLcCdIrqqmNJcFRrJ9WJThZBvcRUAclrw==
X-Received: by 2002:a05:6102:5088:: with SMTP id bl8mr11692070vsb.32.1635110757991;
        Sun, 24 Oct 2021 14:25:57 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 45sm8847869uaq.8.2021.10.24.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:25:57 -0700 (PDT)
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
Subject: [PATCH v2 6/8] staging: vchiq_core: drop extern prefix in function declarations
Date: Sun, 24 Oct 2021 18:25:22 -0300
Message-Id: <20211024212524.370078-7-gascoar@gmail.com>
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

Remove unnecessary extern prefix in function declarations.

While at it, remove a now outdated comment and realign the function
declarations in order to improve readability.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../interface/vchiq_arm/vchiq_core.h          | 76 ++++++-------------
 1 file changed, 25 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index e54e9d80bd7f..3e50910ecba3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -559,79 +559,53 @@ vchiq_queue_message(unsigned int handle,
 		    void *context,
 		    size_t size);
 
-/*
- * The following functions are called from vchiq_core, and external
- * implementations must be provided.
- */
+int vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset, void __user *uoffset,
+			    int size, int dir);
 
-extern int
-vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset,
-			void __user *uoffset, int size, int dir);
+void vchiq_complete_bulk(struct vchiq_bulk *bulk);
 
-extern void
-vchiq_complete_bulk(struct vchiq_bulk *bulk);
+void remote_event_signal(struct remote_event *event);
 
-extern void
-remote_event_signal(struct remote_event *event);
+int vchiq_dump(void *dump_context, const char *str, int len);
 
-extern int
-vchiq_dump(void *dump_context, const char *str, int len);
+int vchiq_dump_platform_state(void *dump_context);
 
-extern int
-vchiq_dump_platform_state(void *dump_context);
+int vchiq_dump_platform_instances(void *dump_context);
 
-extern int
-vchiq_dump_platform_instances(void *dump_context);
+int vchiq_dump_platform_service_state(void *dump_context, struct vchiq_service *service);
 
-extern int
-vchiq_dump_platform_service_state(void *dump_context, struct vchiq_service *service);
+int vchiq_use_service_internal(struct vchiq_service *service);
 
-extern int
-vchiq_use_service_internal(struct vchiq_service *service);
+int vchiq_release_service_internal(struct vchiq_service *service);
 
-extern int
-vchiq_release_service_internal(struct vchiq_service *service);
+void vchiq_on_remote_use(struct vchiq_state *state);
 
-extern void
-vchiq_on_remote_use(struct vchiq_state *state);
+void vchiq_on_remote_release(struct vchiq_state *state);
 
-extern void
-vchiq_on_remote_release(struct vchiq_state *state);
+int vchiq_platform_init_state(struct vchiq_state *state);
 
-extern int
-vchiq_platform_init_state(struct vchiq_state *state);
+enum vchiq_status vchiq_check_service(struct vchiq_service *service);
 
-extern enum vchiq_status
-vchiq_check_service(struct vchiq_service *service);
+void vchiq_on_remote_use_active(struct vchiq_state *state);
 
-extern void
-vchiq_on_remote_use_active(struct vchiq_state *state);
+enum vchiq_status vchiq_send_remote_use(struct vchiq_state *state);
 
-extern enum vchiq_status
-vchiq_send_remote_use(struct vchiq_state *state);
+enum vchiq_status vchiq_send_remote_use_active(struct vchiq_state *state);
 
-extern enum vchiq_status
-vchiq_send_remote_use_active(struct vchiq_state *state);
-
-extern void
-vchiq_platform_conn_state_changed(struct vchiq_state *state,
-				  enum vchiq_connstate oldstate,
+void vchiq_platform_conn_state_changed(struct vchiq_state *state,
+				       enum vchiq_connstate oldstate,
 				  enum vchiq_connstate newstate);
 
-extern void
-vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate);
+void vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate);
 
-extern void
-vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes);
+void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes);
 
-extern enum vchiq_status vchiq_remove_service(unsigned int service);
+enum vchiq_status vchiq_remove_service(unsigned int service);
 
-extern int vchiq_get_client_id(unsigned int service);
+int vchiq_get_client_id(unsigned int service);
 
-extern void vchiq_get_config(struct vchiq_config *config);
+void vchiq_get_config(struct vchiq_config *config);
 
-extern int
-vchiq_set_service_option(unsigned int service, enum vchiq_service_option option,
-			 int value);
+int vchiq_set_service_option(unsigned int service, enum vchiq_service_option option, int value);
 
 #endif
-- 
2.33.1

