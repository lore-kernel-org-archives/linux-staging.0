Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22AB2FB9
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:25 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N18I8-1lKZxj1egc-012Z6a; Sat, 15 May 2021 21:11:21 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 13/20] staging: vchiq_arm: re-arrange function header
Date: Sat, 15 May 2021 21:10:52 +0200
Message-Id: <1621105859-30215-14-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:HCqprYK2+pB+vEG0SG0Br9NyXrsF0XqLtjzxy7A4XfE0QarDAnL
 rpYvGL/G2R+gQOUYrrS6Vqrw1/nWgC+hmtqSXhAdc/PsdOCwGipLGS4bfe64qsA015cr/lz
 Ir3wIfYBcH0uz4pYG+yMkjkI0YfJ4uJOViq+9VXQL/9GuYsWMZUtharkvBmLxq/o3CBnsfj
 M+5xIFUrAa0VtRNJ7eleA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p0qzLhhACtA=:HsB7pI4NQh8VZPzLGEDlT0
 jcMb0aqAkWDL+3fZSwyLuunfbTlHRDUqpOeG+2vYQtCX44rI1JKJyrxVm/9CtS0X8JThkf88E
 +gYzlYG9V9ie1TdseLHs5CkcIOrSMV9anSq9jdeyo+NL8pPVGnv07AZSdXQYjJzopQQKggfZf
 iRK0zL5nRqDglBCJtX0YS4eeT/1knRao/+HW0TSeIdsznAl5hkf20G7m5qhH1mcsv/WBLyDvv
 6uZD/pK2ANxC9ArJ9+V2x7bOuHhovgpCz1P9Ytx/dlHQymKhahkHDfIUy7LF3yxIvPftuzG6J
 i6rCOMBp50bs3KLVMlIykQ70qp1DeY0keIJDmn1BOcHl2aXFvbum6DrngegIU3UIrbINqkqjQ
 KSplXu/mWpdgsj4k/R6KaL96RWa+k3Px1Be8QUAfySW2rDIQUshA5lm590Zlxr0t34wPPrY7i
 yJYn12oN3ftu+gAHI8LxsBJL/42DYlLQZRIf926ZREKSj0HLr2yIMjc2hDU+l8g+CfbFajy+o
 k76/41bQOJltLkqL/3rJWc=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This makes the function headers look more consistent.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 41 ++++++++++------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c08a950..65456c86 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -265,10 +265,10 @@ enum vchiq_status vchiq_connect(struct vchiq_instance *instance)
 }
 EXPORT_SYMBOL(vchiq_connect);
 
-static enum vchiq_status vchiq_add_service(
-	struct vchiq_instance             *instance,
-	const struct vchiq_service_params_kernel *params,
-	unsigned int       *phandle)
+static enum vchiq_status
+vchiq_add_service(struct vchiq_instance *instance,
+		  const struct vchiq_service_params_kernel *params,
+		  unsigned int *phandle)
 {
 	enum vchiq_status status;
 	struct vchiq_state *state = instance->state;
@@ -301,10 +301,10 @@ static enum vchiq_status vchiq_add_service(
 	return status;
 }
 
-enum vchiq_status vchiq_open_service(
-	struct vchiq_instance             *instance,
-	const struct vchiq_service_params_kernel *params,
-	unsigned int       *phandle)
+enum vchiq_status
+vchiq_open_service(struct vchiq_instance *instance,
+		   const struct vchiq_service_params_kernel *params,
+		   unsigned int *phandle)
 {
 	enum vchiq_status   status = VCHIQ_ERROR;
 	struct vchiq_state   *state = instance->state;
@@ -339,8 +339,8 @@ enum vchiq_status vchiq_open_service(
 EXPORT_SYMBOL(vchiq_open_service);
 
 enum vchiq_status
-vchiq_bulk_transmit(unsigned int handle, const void *data,
-	unsigned int size, void *userdata, enum vchiq_bulk_mode mode)
+vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
+		    void *userdata, enum vchiq_bulk_mode mode)
 {
 	enum vchiq_status status;
 
@@ -414,8 +414,8 @@ enum vchiq_status vchiq_bulk_receive(unsigned int handle, void *data,
 EXPORT_SYMBOL(vchiq_bulk_receive);
 
 static enum vchiq_status
-vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
-	unsigned int size, enum vchiq_bulk_dir dir)
+vchiq_blocking_bulk_transfer(unsigned int handle, void *data, unsigned int size,
+			     enum vchiq_bulk_dir dir)
 {
 	struct vchiq_instance *instance;
 	struct vchiq_service *service;
@@ -739,8 +739,7 @@ static ssize_t vchiq_ioc_copy_element_data(void *context, void *dest,
 }
 
 static int
-vchiq_ioc_queue_message(unsigned int handle,
-			struct vchiq_element *elements,
+vchiq_ioc_queue_message(unsigned int handle, struct vchiq_element *elements,
 			unsigned long count)
 {
 	struct vchiq_io_copy_callback_context context;
@@ -1560,10 +1559,8 @@ struct vchiq_create_service32 {
 	_IOWR(VCHIQ_IOC_MAGIC, 2, struct vchiq_create_service32)
 
 static long
-vchiq_compat_ioctl_create_service(
-	struct file *file,
-	unsigned int cmd,
-	struct vchiq_create_service32 __user *ptrargs32)
+vchiq_compat_ioctl_create_service(struct file *file, unsigned int cmd,
+				  struct vchiq_create_service32 __user *ptrargs32)
 {
 	struct vchiq_create_service args;
 	struct vchiq_create_service32 args32;
@@ -2104,8 +2101,7 @@ int vchiq_dump_platform_service_state(void *dump_context,
 }
 
 static ssize_t
-vchiq_read(struct file *file, char __user *buf,
-	size_t count, loff_t *ppos)
+vchiq_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
 	struct dump_context context;
 	int err;
@@ -2156,9 +2152,8 @@ vchiq_fops = {
 
 static enum vchiq_status
 vchiq_keepalive_vchiq_callback(enum vchiq_reason reason,
-	struct vchiq_header *header,
-	unsigned int service_user,
-	void *bulk_user)
+			       struct vchiq_header *header,
+			       unsigned int service_user, void *bulk_user)
 {
 	vchiq_log_error(vchiq_susp_log_level,
 		"%s callback reason %d", __func__, reason);
-- 
2.7.4

