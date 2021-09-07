Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D072
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 11:50:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B68661090;
	Tue,  7 Sep 2021 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631015449;
	bh=vQnkrTI6mz3nPzuTIQmNmI9aZxB+mRDoyGv+baQD7Tk=;
	h=From:To:Cc:Subject:Date:From;
	b=NPjaE/EV2zRpjIPJS08d3ad+RCeNuwmWt3qQYDAl0H1EsKHOzh1m6bMF1AoGzGM+1
	 1RQPvYk0T8rOK6ux+/RNzG6gthSCO6vUZ09/obZys8FRGzxgiQYnDpcWY/vPexPv/3
	 e9iwzg2w7O8TpoaWh+V9Hk5408kw6/QaAXE/3Ujc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] staging: vchiq: convert to use a miscdevice
Date: Tue,  7 Sep 2021 13:50:45 +0200
Message-Id: <20210907115045.2206083-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690; h=from:subject; bh=vQnkrTI6mz3nPzuTIQmNmI9aZxB+mRDoyGv+baQD7Tk=; b=owGbwMvMwCRo6H6F97bub03G02pJDInmQcLLjsafubLW68SBr/71rL6nbzHs31r547vKlQMlU6/P nuD4riOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmwqnIMFdw0yHPMo0XBbNjOlp817 t+dpOxN2GYn/R0YmUUC9PDmC9TJq2TvH+18vjCeQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Using a struct class, a cdev, and another device just for a single minor
device is total overkill.  Just use a dynamic misc device instead,
saving lots of logic and memory.

Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ojaswin Mujoo <ojaswin98@gmail.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../interface/vchiq_arm/vchiq_dev.c           | 71 +++----------------
 1 file changed, 11 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index bf1a88c9d1ee..788fa5a987a3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -9,18 +9,13 @@
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/compat.h>
+#include <linux/miscdevice.h>
 
 #include "vchiq_core.h"
 #include "vchiq_ioctl.h"
 #include "vchiq_arm.h"
 #include "vchiq_debugfs.h"
 
-#define DEVICE_NAME "vchiq"
-
-static struct cdev    vchiq_cdev;
-static dev_t          vchiq_devid;
-static struct class  *vchiq_class;
-
 static const char *const ioctl_names[] = {
 	"CONNECT",
 	"SHUTDOWN",
@@ -1364,6 +1359,13 @@ vchiq_fops = {
 	.read = vchiq_read
 };
 
+static struct miscdevice vchiq_miscdev = {
+	.fops = &vchiq_fops,
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "vchiq",
+
+};
+
 /**
  *	vchiq_register_chrdev - Register the char driver for vchiq
  *				and create the necessary class and
@@ -1374,57 +1376,9 @@ vchiq_fops = {
  */
 int vchiq_register_chrdev(struct device *parent)
 {
-	struct device *vchiq_dev;
-	int ret;
-
-	vchiq_class = class_create(THIS_MODULE, DEVICE_NAME);
-	if (IS_ERR(vchiq_class)) {
-		pr_err("Failed to create vchiq class\n");
-		ret = PTR_ERR(vchiq_class);
-		goto error_exit;
-	}
-
-	ret = alloc_chrdev_region(&vchiq_devid, 0, 1, DEVICE_NAME);
-	if (ret) {
-		pr_err("vchiq: Failed to allocate vchiq's chrdev region\n");
-		goto alloc_region_error;
-	}
-
-	cdev_init(&vchiq_cdev, &vchiq_fops);
-	vchiq_cdev.owner = THIS_MODULE;
-	ret = cdev_add(&vchiq_cdev, vchiq_devid, 1);
-	if (ret) {
-		vchiq_log_error(vchiq_arm_log_level,
-				"Unable to register vchiq char device");
-		goto cdev_add_error;
-	}
-
-	vchiq_dev = device_create(vchiq_class, parent, vchiq_devid, NULL,
-				  DEVICE_NAME);
-	if (IS_ERR(vchiq_dev)) {
-		vchiq_log_error(vchiq_arm_log_level,
-				"Failed to create vchiq char device node");
-		ret = PTR_ERR(vchiq_dev);
-		goto device_create_error;
-	}
-
-	vchiq_log_info(vchiq_arm_log_level,
-		       "vchiq char dev initialised successfully - device %d.%d",
-			MAJOR(vchiq_devid), MINOR(vchiq_devid));
+	vchiq_miscdev.parent = parent;
 
-	return 0;
-
-device_create_error:
-	cdev_del(&vchiq_cdev);
-
-cdev_add_error:
-	unregister_chrdev_region(vchiq_devid, 1);
-
-alloc_region_error:
-	class_destroy(vchiq_class);
-
-error_exit:
-	return ret;
+	return misc_register(&vchiq_miscdev);
 }
 
 /**
@@ -1433,8 +1387,5 @@ int vchiq_register_chrdev(struct device *parent)
  */
 void vchiq_deregister_chrdev(void)
 {
-	device_destroy(vchiq_class, vchiq_devid);
-	cdev_del(&vchiq_cdev);
-	unregister_chrdev_region(vchiq_devid, 1);
-	class_destroy(vchiq_class);
+	misc_deregister(&vchiq_miscdev);
 }
-- 
2.33.0

