Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC1C72
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 12:56:22 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id o10-20020a17090aac0ab029016e92770073so8606612pjq.5
        for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8D0iPvS5LN4cQHCvsRANY4NqRMLIH6ZhqZliXmE6Nic=;
        b=j9swlja8fhJH2LV6AulKGsoAFeFWrhiQJcb7ptpSVB7J2hY1MWU+3O689NaBIUIejO
         1nR3FpCmUajwkV6tX6dnq9l4WKOg/76S/dotDwnfH3ew9/ceDCHdANJdnJ8+TbksALwk
         FdTUX3fp9koZABvZlKBoEKySzcJobWrGXilBTu+ikjGkAd0plgzDdU+/+bniB9bGQWA/
         TcJCIP7k001MsXzwUB1mQPSkhrUmlZSsZjtcpWjjfEzueIAsdbaSw2xyOedf4fUepDQ8
         jltme5ZqY96Sj0n+AMb7cJhMMTxZu3Jfa3y472v7kxMRvVDbDGJwGsJjQKKWMF3tnvOZ
         vuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8D0iPvS5LN4cQHCvsRANY4NqRMLIH6ZhqZliXmE6Nic=;
        b=PGxYLR/V+PbhALjWSdEVZTc/H+QRqOLeEjvv5FLd7sF1xg8uirfx6ywytvYvOcLIl0
         y37uwZE5slCE6aklX/FGBQBmH4xyg0qQfr9kDO3R8CiR58/ZegY+8ikNyKrz8KcjZjqI
         sXFh5/A+DaUFchGPY/TZa2BfXVSX+x+WQuOI3C6N8TnpwTEAjAfNyHnvH2UgaXHeLra1
         byx+FxSvEHwJHKsWKCZLkOBMKs1uhsXjI2NDFMpoQk6xqRKVNIw9uRT5JbDcGWHjvon8
         2g2A2ZCWVa6W0tSeohdM/qIIEcRKqVssbnJH/2kTY6MXQFOzoiW3re8qJMRewXNTZSQc
         2lig==
X-Gm-Message-State: AOAM533ivVJBqouIGD7Z1yeZWXAnX38uHUYWe/6Y96OuZTB4kEGFEQG6
	s6FM6dyUCsCWXnZsXIs2npc=
X-Google-Smtp-Source: ABdhPJwsu0EpaSa59gJ+a7O4tSxTxzyQdDE74aLf0wJMj8QKckeTpU5yxCxDY4bBQTLl88/y0C4bOQ==
X-Received: by 2002:a17:902:6b04:b029:10d:8c9e:5f56 with SMTP id o4-20020a1709026b04b029010d8c9e5f56mr13511814plk.8.1624193781798;
        Sun, 20 Jun 2021 05:56:21 -0700 (PDT)
Received: from ojas ([122.177.154.120])
        by smtp.gmail.com with ESMTPSA id 25sm13906585pgp.51.2021.06.20.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 05:56:21 -0700 (PDT)
Date: Sun, 20 Jun 2021 18:26:10 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: gregkh@linuxfoundation.org, stefan.wahren@i2se.com, arnd@arndb.de,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: vchiq: Move certain declarations to
 vchiq_arm.h
Message-ID: <7f4e8cfe00db59204b41d5a594143838bf502634.1624185152.git.ojaswin98@gmail.com>
References: <cover.1624185152.git.ojaswin98@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624185152.git.ojaswin98@gmail.com>

Move certain declarations from vchiq_arm.c to vchiq_arm.h to allow
code sharing. This will be useful when we eventually separate the vchiq
char driver code from platform code, into its own file.

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 66 ++---------------
 .../interface/vchiq_arm/vchiq_arm.h           | 70 +++++++++++++++++++
 2 files changed, 75 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f2d8116913f2..8b18f9642e6c 100644
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
 static struct platform_device *bcm2835_codec;
@@ -587,7 +531,7 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 *
 ***************************************************************************/
 
-static enum vchiq_status
+enum vchiq_status
 service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 		 unsigned int handle, void *bulk_userdata)
 {
@@ -2215,7 +2159,7 @@ vchiq_fops = {
  *
  *	Returns 0 on success else returns the error code.
  */
-static int vchiq_register_chrdev(struct device *parent)
+int vchiq_register_chrdev(struct device *parent)
 {
 	struct device *vchiq_dev;
 	int ret;
@@ -2274,7 +2218,7 @@ static int vchiq_register_chrdev(struct device *parent)
  *	vchiq_deregister_chrdev	- Deregister and cleanup the vchiq char
  *				  driver and device files
  */
-static void vchiq_deregister_chrdev(void)
+void vchiq_deregister_chrdev(void)
 {
 	device_destroy(vchiq_class, vchiq_devid);
 	cdev_del(&vchiq_cdev);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index f8b1c005af62..bc9af1a0c764 100644
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
@@ -56,9 +62,63 @@ struct vchiq_drvdata {
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
 
@@ -112,4 +172,14 @@ vchiq_instance_get_trace(struct vchiq_instance *instance);
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
 #endif /* VCHIQ_ARM_H */
-- 
2.25.1

