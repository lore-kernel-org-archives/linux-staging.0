Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1812FB9
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:38 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mg6qO-1lH9eh02N4-00he4G; Sat, 15 May 2021 21:11:21 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 11/20] staging: vchiq_arm: drop non-beneficial comments
Date: Sat, 15 May 2021 21:10:50 +0200
Message-Id: <1621105859-30215-12-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:G7M9yV979y9+nzZk9/FBTLEXzjpnsrNxJBnj38pnAsZyImgOm3O
 Y+bn1BWnAw+7T/CQ59QbMBir6sz1uuCwcN3M0t+9Gz6bRkDc+CtEpj3JlteOQD8bW3SkmpE
 WQQmH7FsZenZAgabAWPWWKpB0u4ZWj9055eyjh2w95AOUo9o3Woyk50ST7a1rKBJj/PKEhR
 BK6oNAT68lkPkyHF+LI8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ubKuKw6Kwo8=:SHMvcDayFxq4qfiV0aByYU
 AZxDGSdmTyf2IM9wsZWtRzU1pJ/UyDIiKVVRQs/1VObuOf+pLT196HaPtet7GapB3Ha9UUTN2
 bs1BmNgQC0mbtpqSzz72Nm0PYkoNEPJvF7FPAvmLXKz5dKe9P8EkZ3eG/OHahCjULt92HRa6K
 EIZ5UbI29t3c4aGeyOXUb88DSmd6xtOQU287JLHXypJsl2QRUS7BXoxlKXqylvMf30VbIoudc
 NjDoIg+5TRcHqY7P0QDoajjFqfceLgxVe194Ed8qYMWJxdRctiSQNTJUAmT7doeaIhYBHhm8M
 MdVbwzd1UGP7G3TGaVLIdVoVUbrk433WOCKYBA2MV8OGVbFemzIAjdbZvVY4LI/cFoXhvU8M2
 WPIHv4IrCxmd3kS9iaVuXcBj8DFP/+6Zusl+Gyb/EGav/jTR31JLxp49ZPOrE6nBYxQwYG0hd
 ItD8LMdIJCRD8nFJKAT6xngJtz4M04udQeFH3vbr6K/nS3iP0cg2wcJT+JQLLI8ZZfbSiIHYj
 SmO4V3zfoLPmgRwkcCn1Kg=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Those comments doesn't provide any benefit, so drop them.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 55 ----------------------
 .../interface/vchiq_arm/vchiq_connected.h          |  8 ----
 .../interface/vchiq_arm/vchiq_debugfs.c            |  5 --
 3 files changed, 68 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 92825b7..f2f948c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -493,11 +493,6 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
 
 	return status;
 }
-/****************************************************************************
- *
- *   add_completion
- *
- ***************************************************************************/
 
 static enum vchiq_status
 add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
@@ -564,12 +559,6 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	return VCHIQ_SUCCESS;
 }
 
-/****************************************************************************
- *
- *   service_callback
- *
- ***************************************************************************/
-
 static enum vchiq_status
 service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 		 unsigned int handle, void *bulk_userdata)
@@ -681,22 +670,12 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 		bulk_userdata);
 }
 
-/****************************************************************************
- *
- *   user_service_free
- *
- ***************************************************************************/
 static void
 user_service_free(void *userdata)
 {
 	kfree(userdata);
 }
 
-/****************************************************************************
- *
- *   close_delivered
- *
- ***************************************************************************/
 static void close_delivered(struct user_service *user_service)
 {
 	vchiq_log_info(vchiq_arm_log_level,
@@ -759,11 +738,6 @@ static ssize_t vchiq_ioc_copy_element_data(void *context, void *dest,
 	return maxsize;
 }
 
-/**************************************************************************
- *
- *   vchiq_ioc_queue_message
- *
- **************************************************************************/
 static int
 vchiq_ioc_queue_message(unsigned int handle,
 			struct vchiq_element *elements,
@@ -1242,11 +1216,6 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 	return ret;
 }
 
-/****************************************************************************
- *
- *   vchiq_ioctl
- *
- ***************************************************************************/
 static long
 vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
@@ -2003,12 +1972,6 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	return ret;
 }
 
-/****************************************************************************
- *
- *   vchiq_dump
- *
- ***************************************************************************/
-
 int vchiq_dump(void *dump_context, const char *str, int len)
 {
 	struct dump_context *context = (struct dump_context *)dump_context;
@@ -2050,12 +2013,6 @@ int vchiq_dump(void *dump_context, const char *str, int len)
 	return 0;
 }
 
-/****************************************************************************
- *
- *   vchiq_dump_platform_instance_state
- *
- ***************************************************************************/
-
 int vchiq_dump_platform_instances(void *dump_context)
 {
 	struct vchiq_state *state = vchiq_get_state();
@@ -2118,12 +2075,6 @@ int vchiq_dump_platform_instances(void *dump_context)
 	return 0;
 }
 
-/****************************************************************************
- *
- *   vchiq_dump_platform_service_state
- *
- ***************************************************************************/
-
 int vchiq_dump_platform_service_state(void *dump_context,
 				      struct vchiq_service *service)
 {
@@ -2149,12 +2100,6 @@ int vchiq_dump_platform_service_state(void *dump_context,
 	return vchiq_dump(dump_context, buf, len + 1);
 }
 
-/****************************************************************************
- *
- *   vchiq_read
- *
- ***************************************************************************/
-
 static ssize_t
 vchiq_read(struct file *file, char __user *buf,
 	size_t count, loff_t *ppos)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
index ec5d2b7..95c1867 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
@@ -4,16 +4,8 @@
 #ifndef VCHIQ_CONNECTED_H
 #define VCHIQ_CONNECTED_H
 
-/* ---- Include Files ----------------------------------------------------- */
-
-/* ---- Constants and Types ---------------------------------------------- */
-
 typedef void (*VCHIQ_CONNECTED_CALLBACK_T)(void);
 
-/* ---- Variable Externs ------------------------------------------------- */
-
-/* ---- Function Prototypes ---------------------------------------------- */
-
 void vchiq_add_connected_callback(VCHIQ_CONNECTED_CALLBACK_T callback);
 void vchiq_call_connected_callbacks(void);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index a39757b..da550b6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -11,11 +11,6 @@
 
 #ifdef CONFIG_DEBUG_FS
 
-/****************************************************************************
- *
- *   log category entries
- *
- ***************************************************************************/
 #define DEBUGFS_WRITE_BUF_SIZE 256
 
 #define VCHIQ_LOG_ERROR_STR   "error"
-- 
2.7.4

