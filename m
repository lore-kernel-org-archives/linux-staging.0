Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232772
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 11:33:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A2FD6109F;
	Tue,  7 Sep 2021 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631014402;
	bh=LinC0cWavtsL7SVSTF2PUQ+C6ByDu7ePNeKUza5Qnd0=;
	h=From:To:Cc:Subject:Date:From;
	b=EBIJ9USC0KY68FyU/XsZeXffk53MSdgiyQDajTuooV5qVUYUH0qVjFPG3F4tPCXGn
	 E6fuqVn4ddiHfNpHS2RtYQYO+nIqP1WeN0FX7oXbKvU2zDZTB2KHV4hFnsg/DzbKLu
	 4j5CxLndQw/e1u+aR7wo0AqaIwBGNyJcDUg82FcM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jacob Feder <jacobsfeder@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Muhammad Usama Anjum <musamaanjum@gmail.com>
Subject: [PATCH] staging: axis-fifo: convert to use miscdevice
Date: Tue,  7 Sep 2021 13:33:14 +0200
Message-Id: <20210907113314.2195505-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6681; h=from:subject; bh=LinC0cWavtsL7SVSTF2PUQ+C6ByDu7ePNeKUza5Qnd0=; b=owGbwMvMwCRo6H6F97bub03G02pJDInmvj84Th9/nMm061c9W56nm+Oe8scu12bWyVyPrzZUm2I9 5bZDRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEyk/C7D/Pody1fapZ+yNgzp0A2QuS WStlgin2GeWetd3/pDK+a/vLzSZFH/Gs8T8X84AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Using a struct class, a cdev, and another device just for a single minor
device is total overkill.  Just use a dynamic misc device instead,
saving lots of logic and memory.

Cc: Jacob Feder <jacobsfeder@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Muhammad Usama Anjum <musamaanjum@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 87 ++++++++-------------------
 1 file changed, 25 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index b23eabb863d1..40ca2c251ad5 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -30,6 +30,7 @@
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/jiffies.h>
+#include <linux/miscdevice.h>
 
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -102,9 +103,6 @@
  *           globals
  * ----------------------------
  */
-
-static struct class *axis_fifo_driver_class; /* char device class */
-
 static int read_timeout = 1000; /* ms to wait before read() times out */
 static int write_timeout = 1000; /* ms to wait before write() times out */
 
@@ -140,9 +138,7 @@ struct axis_fifo {
 	unsigned int read_flags; /* read file flags */
 
 	struct device *dt_device; /* device created from the device tree */
-	struct device *device; /* device associated with char_device */
-	dev_t devt; /* our char device number */
-	struct cdev char_device; /* our char device */
+	struct miscdevice miscdev;
 };
 
 /* ----------------------------
@@ -319,6 +315,11 @@ static const struct attribute_group axis_fifo_attrs_group = {
 	.attrs = axis_fifo_attrs,
 };
 
+static const struct attribute_group *axis_fifo_attrs_groups[] = {
+	&axis_fifo_attrs_group,
+	NULL,
+};
+
 /* ----------------------------
  *        implementation
  * ----------------------------
@@ -684,8 +685,8 @@ static irqreturn_t axis_fifo_irq(int irq, void *dw)
 
 static int axis_fifo_open(struct inode *inod, struct file *f)
 {
-	struct axis_fifo *fifo = (struct axis_fifo *)container_of(inod->i_cdev,
-					struct axis_fifo, char_device);
+	struct axis_fifo *fifo = container_of(f->private_data,
+					      struct axis_fifo, miscdev);
 	f->private_data = fifo;
 
 	if (((f->f_flags & O_ACCMODE) == O_WRONLY) ||
@@ -812,9 +813,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	struct resource *r_mem; /* IO mem resources */
 	struct device *dev = &pdev->dev; /* OS device (from device tree) */
 	struct axis_fifo *fifo = NULL;
-
-	char device_name[32];
-
+	char *device_name;
 	int rc = 0; /* error return value */
 
 	/* ----------------------------
@@ -822,8 +821,12 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 * ----------------------------
 	 */
 
+	device_name = devm_kzalloc(dev, 32, GFP_KERNEL);
+	if (!device_name)
+		return -ENOMEM;
+
 	/* allocate device wrapper memory */
-	fifo = devm_kmalloc(dev, sizeof(*fifo), GFP_KERNEL);
+	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
 	if (!fifo)
 		return -ENOMEM;
 
@@ -859,9 +862,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
 	/* create unique device name */
-	snprintf(device_name, sizeof(device_name), "%s_%pa",
-		 DRIVER_NAME, &r_mem->start);
-
+	snprintf(device_name, 32, "%s_%pa", DRIVER_NAME, &r_mem->start);
 	dev_dbg(fifo->dt_device, "device name [%s]\n", device_name);
 
 	/* ----------------------------
@@ -904,51 +905,20 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 * ----------------------------
 	 */
 
-	/* allocate device number */
-	rc = alloc_chrdev_region(&fifo->devt, 0, 1, DRIVER_NAME);
+	/* create character device */
+	fifo->miscdev.fops = &fops;
+	fifo->miscdev.minor = MISC_DYNAMIC_MINOR;
+	fifo->miscdev.name = device_name;
+	fifo->miscdev.groups = axis_fifo_attrs_groups;
+	rc = misc_register(&fifo->miscdev);
 	if (rc < 0)
 		goto err_initial;
-	dev_dbg(fifo->dt_device, "allocated device number major %i minor %i\n",
-		MAJOR(fifo->devt), MINOR(fifo->devt));
-
-	/* create driver file */
-	fifo->device = device_create(axis_fifo_driver_class, NULL, fifo->devt,
-				     NULL, device_name);
-	if (IS_ERR(fifo->device)) {
-		dev_err(fifo->dt_device,
-			"couldn't create driver file\n");
-		rc = PTR_ERR(fifo->device);
-		goto err_chrdev_region;
-	}
-	dev_set_drvdata(fifo->device, fifo);
-
-	/* create character device */
-	cdev_init(&fifo->char_device, &fops);
-	rc = cdev_add(&fifo->char_device, fifo->devt, 1);
-	if (rc < 0) {
-		dev_err(fifo->dt_device, "couldn't create character device\n");
-		goto err_dev;
-	}
-
-	/* create sysfs entries */
-	rc = devm_device_add_group(fifo->device, &axis_fifo_attrs_group);
-	if (rc < 0) {
-		dev_err(fifo->dt_device, "couldn't register sysfs group\n");
-		goto err_cdev;
-	}
 
-	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%pa, irq=%i, major=%i, minor=%i\n",
-		 &r_mem->start, &fifo->base_addr, fifo->irq,
-		 MAJOR(fifo->devt), MINOR(fifo->devt));
+	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%pa, irq=%i\n",
+		 &r_mem->start, &fifo->base_addr, fifo->irq);
 
 	return 0;
 
-err_cdev:
-	cdev_del(&fifo->char_device);
-err_dev:
-	device_destroy(axis_fifo_driver_class, fifo->devt);
-err_chrdev_region:
-	unregister_chrdev_region(fifo->devt, 1);
 err_initial:
 	dev_set_drvdata(dev, NULL);
 	return rc;
@@ -959,10 +929,7 @@ static int axis_fifo_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = dev_get_drvdata(dev);
 
-	cdev_del(&fifo->char_device);
-	dev_set_drvdata(fifo->device, NULL);
-	device_destroy(axis_fifo_driver_class, fifo->devt);
-	unregister_chrdev_region(fifo->devt, 1);
+	misc_deregister(&fifo->miscdev);
 	dev_set_drvdata(dev, NULL);
 
 	return 0;
@@ -987,9 +954,6 @@ static int __init axis_fifo_init(void)
 {
 	pr_info("axis-fifo driver loaded with parameters read_timeout = %i, write_timeout = %i\n",
 		read_timeout, write_timeout);
-	axis_fifo_driver_class = class_create(THIS_MODULE, DRIVER_NAME);
-	if (IS_ERR(axis_fifo_driver_class))
-		return PTR_ERR(axis_fifo_driver_class);
 	return platform_driver_register(&axis_fifo_driver);
 }
 
@@ -998,7 +962,6 @@ module_init(axis_fifo_init);
 static void __exit axis_fifo_exit(void)
 {
 	platform_driver_unregister(&axis_fifo_driver);
-	class_destroy(axis_fifo_driver_class);
 }
 
 module_exit(axis_fifo_exit);
-- 
2.33.0

