Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735193FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:23:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id mi6-20020a17090b4b4600b00199280a31cbso2749029pjb.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuF06DHpNjdKdQXTxnOrZj3TR4UMi4HvEbGD0dPOPXw=;
        b=YTXhZa0YjdeqLQ3/1n4fBMq28pqDmUFvsBWa3PVXWScYoSufRnuxWBpXkl79ltIFtp
         heaJaQ2PJFnsOoBO+DNvev/r+zAKJLuVrxFTZi6JE1QSRgoVl8qY1sOAupVn3ncoZbhw
         BQg2LLb4NFyfFKDVUKtLIG3gFWkXJO+5WlyX10kkKu/9PYRa8Bit9F+83x2qt53pR/Vs
         z9u/opwYrW8cZJa1UESz2Uz5WIX5pGPXl+U+rp7eQIR+aZ4S/D8LNablnrvJiZXuL26u
         DW6x6k4gzwfQID//hxZBKV4DbdioCfv/PxnCJGStW9RQM/PJedf7qq/sZWwjNt1lsGYb
         iDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuF06DHpNjdKdQXTxnOrZj3TR4UMi4HvEbGD0dPOPXw=;
        b=RxmlE3AGRHB+a+095awZyWKqPYiUo8iRZ6Mlhy0tbt4Uwd7xv/WCAzfGNsjQ+zhnxw
         lTw7hpMBU66zgSJpCI7w/V8VOPH7m8o+UQJ2Rzi+9QqLGhFzZXlK0zQmwRzEqv+p5jUV
         FWSCu2OTpu1950LrtPx8g2qvL/lE1LaMSka9vxv2jK6SA1UNOh5f6dM4dlNBuIaXHUua
         2CcAoFVRvGhl4602kWYp6OBXfn8L/x6wxvPKmi0uoJcLelTdsMP4V94D+ekeQ651O091
         +4HVlcFNWq3fMQ3/U7q89CnxMv86QwdavjFCco0eB5soiJaMhhyE+9qG6nlOuDFXBgfF
         /ebg==
X-Gm-Message-State: AOAM533ST839TN7oDpBYaDrq61MZAYOVVqtkmkzaPRo2kn9VW1AnDcgk
	wallMuPrxZwsnUh9N2PxB48=
X-Google-Smtp-Source: ABdhPJyoUzF6PPKvnxULbrlSREXyHCWNEic/IFu1sKh61dPZyjw8QPiVgOyfYTrF9J69XfnMboArDg==
X-Received: by 2002:a17:902:bf43:b0:13a:ae0:9dee with SMTP id u3-20020a170902bf4300b0013a0ae09deemr2417840pls.62.1631366613988;
        Sat, 11 Sep 2021 06:23:33 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.62])
        by smtp.googlemail.com with ESMTPSA id l14sm1951897pjq.13.2021.09.11.06.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:23:33 -0700 (PDT)
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com
Cc: dan.carpenter@oracle.com,
	phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vchiq: Replace function typedefs with equivalent declaration
Date: Sat, 11 Sep 2021 18:53:25 +0530
Message-Id: <a8e4e0457b5fcc88c7f297f9d669dfb7e7d91ed5.1631366317.git.ojaswin98@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function typedefs with the equivalent declarations to better
align with the linux kenel coding style

The following typedefs were changed:
*  VCHIQ_CONNECTED_CALLBACK_T
*  vchiq_userdata_term

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_connected.c     | 4 ++--
 .../vc04_services/interface/vchiq_arm/vchiq_connected.h     | 4 +---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 2 +-
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h  | 6 ++----
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 0ee96d1d0481..83502f5f3a33 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -10,7 +10,7 @@
 
 static   int                        g_connected;
 static   int                        g_num_deferred_callbacks;
-static   VCHIQ_CONNECTED_CALLBACK_T g_deferred_callback[MAX_CALLBACKS];
+static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
 static   int                        g_once_init;
 static   DEFINE_MUTEX(g_connected_mutex);
 
@@ -28,7 +28,7 @@ static void connected_init(void)
  * be made immediately, otherwise it will be deferred until
  * vchiq_call_connected_callbacks is called.
  */
-void vchiq_add_connected_callback(VCHIQ_CONNECTED_CALLBACK_T callback)
+void vchiq_add_connected_callback(void (*callback)(void))
 {
 	connected_init();
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
index 95c18670e839..4caf5e30099d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
@@ -4,9 +4,7 @@
 #ifndef VCHIQ_CONNECTED_H
 #define VCHIQ_CONNECTED_H
 
-typedef void (*VCHIQ_CONNECTED_CALLBACK_T)(void);
-
-void vchiq_add_connected_callback(VCHIQ_CONNECTED_CALLBACK_T callback);
+void vchiq_add_connected_callback(void (*callback)(void));
 void vchiq_call_connected_callbacks(void);
 
 #endif /* VCHIQ_CONNECTED_H */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9429b8a642fb..083abfd8e212 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2474,7 +2474,7 @@ struct vchiq_service *
 vchiq_add_service_internal(struct vchiq_state *state,
 			   const struct vchiq_service_params_kernel *params,
 			   int srvstate, struct vchiq_instance *instance,
-			   vchiq_userdata_term userdata_term)
+			   void (*userdata_term)(void *userdata))
 {
 	struct vchiq_service *service;
 	struct vchiq_service __rcu **pservice = NULL;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 957fea1f574f..3ef4cbe1053c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -152,8 +152,6 @@ enum vchiq_bulk_dir {
 	VCHIQ_BULK_RECEIVE
 };
 
-typedef void (*vchiq_userdata_term)(void *userdata);
-
 struct vchiq_bulk {
 	short mode;
 	short dir;
@@ -198,7 +196,7 @@ struct vchiq_service {
 	struct kref ref_count;
 	struct rcu_head rcu;
 	int srvstate;
-	vchiq_userdata_term userdata_term;
+	void (*userdata_term)(void *userdata);
 	unsigned int localport;
 	unsigned int remoteport;
 	int public_fourcc;
@@ -476,7 +474,7 @@ struct vchiq_service *
 vchiq_add_service_internal(struct vchiq_state *state,
 			   const struct vchiq_service_params_kernel *params,
 			   int srvstate, struct vchiq_instance *instance,
-			   vchiq_userdata_term userdata_term);
+			   void (*userdata_term)(void *userdata));
 
 extern enum vchiq_status
 vchiq_open_service_internal(struct vchiq_service *service, int client_id);
-- 
2.25.1

