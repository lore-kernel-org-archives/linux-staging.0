Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BEA168
	for <linux-staging@lists.linux.dev>; Sun,  4 Jul 2021 15:58:08 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so12874982pjs.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Jul 2021 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=By1I86ZOhnAYxBe4OcTi1BPRS1LKy0lQmzeoiW7UDbQ=;
        b=cMPNXsgqYz53r3xjvLoBVNnfyCR1L6nWkQHOCebRjo2a4ijTm5aEbgfBFcRSewNTSr
         igbL2Gu1r/HKaYKD6RFnsdZKVkC9YfuV8LnPvqnVx3HuTKlemW7WT8aSTcTwRkKxp3jj
         ILE2vBK9i6YSE6p0AWJrdzZembra1mc0Di8lYfMSoApXtRn+MXoohNgwtxP6gYQ44PiB
         7H1qK1HyD6Dzp3OrWr/elxg8yNiMWCiVS++k8Y4EntnHwN0NrNkL5DhDZ4Y5REx5utYg
         wbsGGISQ1mqBz45dA04Lw7poKF+07eQzQ3lSaChdUxzLaOFucbVjpRUcnAb7Idc3QSeD
         3pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=By1I86ZOhnAYxBe4OcTi1BPRS1LKy0lQmzeoiW7UDbQ=;
        b=Ez7O9tirsNEKrOaxKMsPlSMuG88ZQMOXUxTYxInrx25UKRqoACFV31RnlpfledrRpj
         IcBdZFifGx1J6Pdj7m50VdF3r9lCGsyVNgGjQhCaS74ntIr1y0EbbXRXXE2ImvRxWNMu
         YqQk/FOxURH4qLZ00pe927+HjCDEapmABPMh+6C5dWvScP2RB6Q/Lv232MeKTVmVX8R3
         elZnq9PfjcAUVo6wi+2v/e08cbFGq6YNTXxLF2o6SkaqfZpJW3ZLM8lg6b7gbVwJHnOQ
         9Hth1YMDO5nWIAMsuHSJUBIrinscjGdFE1pQBsjB16I0kes6oiYF/spHSeJgkV2YqWhW
         W0ew==
X-Gm-Message-State: AOAM5333tnXLyAtJL3vkfSYFSr7BMj4kA+HJnYLET/FgZZT8rF03pyX9
	br/OcO5o+9pcjuO+vBKjG8YvKf3i2cc=
X-Google-Smtp-Source: ABdhPJx8ZXhW9Ec9WXeeWynvYQtC78Dt3iTCuTcbHTrkxXdJFdtbbe6mii6P4t6f8/Nuufd/7XSgcg==
X-Received: by 2002:a17:90a:898b:: with SMTP id v11mr6974859pjn.192.1625414287826;
        Sun, 04 Jul 2021 08:58:07 -0700 (PDT)
Received: from ojas ([182.69.223.21])
        by smtp.gmail.com with ESMTPSA id 10sm9944717pfh.174.2021.07.04.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:58:07 -0700 (PDT)
Date: Sun, 4 Jul 2021 21:27:57 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: gregkh@linuxfoundation.org, stefan.wahren@i2se.com, arnd@arndb.de,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] staging: vchiq: Move certain declarations to
 vchiq_arm.h
Message-ID: <3ed6ab5cbcc5647c9837a2a20428e954b6fb4de1.1625401927.git.ojaswin98@gmail.com>
References: <cover.1625401927.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1625401927.git.ojaswin98@gmail.com>

Move certain declarations from vchiq_arm.c to vchiq_arm.h to allow
code sharing. This will be useful when we eventually separate the vchiq
char driver code from platform code, into its own file.

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 68 ++---------------
 .../interface/vchiq_arm/vchiq_arm.h           | 73 +++++++++++++++++++
 2 files changed, 79 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3a0724fe25ea..3152466086f3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -38,12 +38,6 @@
 #undef MODULE_PARAM_PREFIX
 #define MODULE_PARAM_PREFIX DEVICE_NAME "."
 
-/* Some per-instance constants */
-#define MAX_COMPLETIONS 128
-#define MAX_SERVICES 64
-#define MAX_ELEMENTS 8
-#define MSG_QUEUE_SIZE 128
-
 #define KEEPALIVE_VER 1
 #define KEEPALIVE_VER_MIN KEEPALIVE_VER
 
@@ -51,62 +45,12 @@
 int vchiq_arm_log_level = VCHIQ_LOG_DEFAULT;
 int vchiq_susp_log_level = VCHIQ_LOG_ERROR;
 
-struct user_service {
-	struct vchiq_service *service;
-	void __user *userdata;
-	struct vchiq_instance *instance;
-	char is_vchi;
-	char dequeue_pending;
-	char close_pending;
-	int message_available_pos;
-	int msg_insert;
-	int msg_remove;
-	struct completion insert_event;
-	struct completion remove_event;
-	struct completion close_event;
-	struct vchiq_header *msg_queue[MSG_QUEUE_SIZE];
-};
-
-struct bulk_waiter_node {
-	struct bulk_waiter bulk_waiter;
-	int pid;
-	struct list_head list;
-};
-
-struct vchiq_instance {
-	struct vchiq_state *state;
-	struct vchiq_completion_data_kernel completions[MAX_COMPLETIONS];
-	int completion_insert;
-	int completion_remove;
-	struct completion insert_event;
-	struct completion remove_event;
-	struct mutex completion_mutex;
-
-	int connected;
-	int closing;
-	int pid;
-	int mark;
-	int use_close_delivered;
-	int trace;
-
-	struct list_head bulk_waiter_list;
-	struct mutex bulk_waiter_list_mutex;
-
-	struct vchiq_debugfs_node debugfs_node;
-};
-
-struct dump_context {
-	char __user *buf;
-	size_t actual;
-	size_t space;
-	loff_t offset;
-};
+DEFINE_SPINLOCK(msg_queue_spinlock);
+struct vchiq_state g_state;
 
 static struct cdev    vchiq_cdev;
 static dev_t          vchiq_devid;
-static struct vchiq_state g_state;
 static struct class  *vchiq_class;
-static DEFINE_SPINLOCK(msg_queue_spinlock);
 static struct platform_device *bcm2835_camera;
 static struct platform_device *bcm2835_audio;
 
@@ -199,7 +143,7 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 }
 EXPORT_SYMBOL(vchiq_initialise);
 
-static void free_bulk_waiter(struct vchiq_instance *instance)
+void free_bulk_waiter(struct vchiq_instance *instance)
 {
 	struct bulk_waiter_node *waiter, *next;
 
@@ -561,7 +505,7 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	return VCHIQ_SUCCESS;
 }
 
-static enum vchiq_status
+enum vchiq_status
 service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 		 unsigned int handle, void *bulk_userdata)
 {
@@ -2142,7 +2086,7 @@ vchiq_fops = {
  *
  *	Returns 0 on success else returns the error code.
  */
-static int vchiq_register_chrdev(struct device *parent)
+int vchiq_register_chrdev(struct device *parent)
 {
 	struct device *vchiq_dev;
 	int ret;
@@ -2201,7 +2145,7 @@ static int vchiq_register_chrdev(struct device *parent)
  *	vchiq_deregister_chrdev	- Deregister and cleanup the vchiq char
  *				  driver and device files
  */
-static void vchiq_deregister_chrdev(void)
+void vchiq_deregister_chrdev(void)
 {
 	device_destroy(vchiq_class, vchiq_devid);
 	cdev_del(&vchiq_cdev);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index c7d2cf1f2e68..2453971b6b78 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -14,6 +14,12 @@
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
 
+/* Some per-instance constants */
+#define MAX_COMPLETIONS 128
+#define MAX_SERVICES 64
+#define MAX_ELEMENTS 8
+#define MSG_QUEUE_SIZE 128
+
 enum USE_TYPE_E {
 	USE_TYPE_SERVICE,
 	USE_TYPE_VCHIQ
@@ -58,9 +64,63 @@ struct vchiq_drvdata {
 	struct rpi_firmware *fw;
 };
 
+struct user_service {
+	struct vchiq_service *service;
+	void __user *userdata;
+	struct vchiq_instance *instance;
+	char is_vchi;
+	char dequeue_pending;
+	char close_pending;
+	int message_available_pos;
+	int msg_insert;
+	int msg_remove;
+	struct completion insert_event;
+	struct completion remove_event;
+	struct completion close_event;
+	struct vchiq_header *msg_queue[MSG_QUEUE_SIZE];
+};
+
+struct bulk_waiter_node {
+	struct bulk_waiter bulk_waiter;
+	int pid;
+	struct list_head list;
+};
+
+struct vchiq_instance {
+	struct vchiq_state *state;
+	struct vchiq_completion_data_kernel completions[MAX_COMPLETIONS];
+	int completion_insert;
+	int completion_remove;
+	struct completion insert_event;
+	struct completion remove_event;
+	struct mutex completion_mutex;
+
+	int connected;
+	int closing;
+	int pid;
+	int mark;
+	int use_close_delivered;
+	int trace;
+
+	struct list_head bulk_waiter_list;
+	struct mutex bulk_waiter_list_mutex;
+
+	struct vchiq_debugfs_node debugfs_node;
+};
+
+struct dump_context {
+	char __user *buf;
+	size_t actual;
+	size_t space;
+	loff_t offset;
+};
+
 extern int vchiq_arm_log_level;
 extern int vchiq_susp_log_level;
 
+extern spinlock_t msg_queue_spinlock;
+extern struct vchiq_state g_state;
+
 int vchiq_platform_init(struct platform_device *pdev,
 			struct vchiq_state *state);
 
@@ -114,4 +174,17 @@ vchiq_instance_get_trace(struct vchiq_instance *instance);
 extern void
 vchiq_instance_set_trace(struct vchiq_instance *instance, int trace);
 
+extern void
+vchiq_deregister_chrdev(void);
+
+extern int
+vchiq_register_chrdev(struct device *parent);
+
+extern enum vchiq_status
+service_callback(enum vchiq_reason reason, struct vchiq_header *header,
+		 unsigned int handle, void *bulk_userdata);
+
+extern void
+free_bulk_waiter(struct vchiq_instance *instance);
+
 #endif /* VCHIQ_ARM_H */
-- 
2.25.1

