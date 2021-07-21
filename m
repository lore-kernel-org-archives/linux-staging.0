Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018A70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 16:21:41 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id cu14so1993216pjb.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=By1I86ZOhnAYxBe4OcTi1BPRS1LKy0lQmzeoiW7UDbQ=;
        b=T4kHSH3+jq39ObcjeNlWPzmVoGR+D+VTIIrXWHB7Sah12yGeVeXP1FM3oeZKiyfz03
         vc6A3O1CYPQnqAj9XjmwvWwq0n2MLf9vi/diZG6Br8xlX6kfbR0QBgQvR3m+EJqN471P
         NxQgqes9ki8vdL/zFPLopCHwyN94kR01Az6WxCgPa/lU33qKBvjUcE6qkJCXlS36Q/nE
         XAJKrIfSFi5cWiLoJu74/uP0rUzJ6j54GrL/CG1f/OP0GG0ukBxvfVVewfLS1Adgvhzd
         sB+x+ovuoAPQppMI5XOhYhqFnWgboopcQVIiroMrml+Oju8r5hfZ3BpGvtCQwp5L0aOa
         synQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=By1I86ZOhnAYxBe4OcTi1BPRS1LKy0lQmzeoiW7UDbQ=;
        b=dbhaa6lnLAYrPfWvoHpZb1inG6AuMdoo20458mWGvPzyEYm50fTOHd/2+vEhSetsiK
         21x0iiJu+zeGk2zDwazvm/2042KeQ4oHJSyRqlagcLZZMkd3NJsP3ZoY4rz8dRV1t1Ge
         WbHOxjz55JfTpoBdKe0NvHzOBAWififc8MymgA5uowYYIpk/9akpDtEsysulWPgVcpRC
         KI+OmbSC1JmI2ykpvNsFGzDYbQNV/F9co+ICZQQu8fFtoBXieqwr6vEq/VckfFLApxeG
         zWYwn1zwBv3HYjfZnJ0I707+HrTZKA16MJ5d+u5RQK6zBBJHC5tTm0MIqebF7UG/LfLI
         IIEg==
X-Gm-Message-State: AOAM532KExm5R/ctKyidUbArqFL2E4vecv+ZBJzchHi9KJFxzVdjMdlU
	kcgFahQMOti3vtfvmok0xuM=
X-Google-Smtp-Source: ABdhPJwipnZah8O9YpelmeBDYoqwrcdespn71Gdrhyo9/A6hlvHvBqzBBfLciEp4sxmp3b2nPaIo8w==
X-Received: by 2002:a17:90b:128a:: with SMTP id fw10mr36011752pjb.116.1626884501565;
        Wed, 21 Jul 2021 09:21:41 -0700 (PDT)
Received: from localhost.localdomain ([122.161.48.33])
        by smtp.googlemail.com with ESMTPSA id s21sm3013459pfw.69.2021.07.21.09.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:21:41 -0700 (PDT)
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: Ojaswin Mujoo <ojaswin98@gmail.com>,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com,
	dan.carpenter@oracle.com,
	phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] staging: vchiq: Move certain declarations to vchiq_arm.h
Date: Wed, 21 Jul 2021 21:50:50 +0530
Message-Id: <8abcbd9fb3227e2a78ccc4a1186c8c0801061a68.1626882325.git.ojaswin98@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626882325.git.ojaswin98@gmail.com>
References: <cover.1626882325.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

