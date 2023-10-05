Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB2219F2
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NZ902NtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5A9C4AF7D;
	Thu,  5 Oct 2023 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696513695;
	bh=YNPCSFK5hnyZDO7MvaXjiiobmN82ObhVxMuqrZ9wupw=;
	h=From:To:Cc:Subject:Date:From;
	b=NZ902NtZEofXAiUY+kOfYtSJY3FDmqXdy6GRZTV0s1p4NtutDCwrJoRtPdh/dVnfD
	 mZ2C48GnS1nJk0bb7eqHIuGHiNAjNkHkwY+TIInXM8RcDfW1w4gzFk4D8Rq7/57cr0
	 jKNOCneQBNCfwLVKSuSz1RvEPerQy8EQNE5IsxtQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: pi433: make pi433_class constant
Date: Thu,  5 Oct 2023 15:48:12 +0200
Message-ID: <2023100512-basically-pedometer-9ed9@gregkh>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2882; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=YNPCSFK5hnyZDO7MvaXjiiobmN82ObhVxMuqrZ9wupw=; b=owGbwMvMwCRo6H6F97bub03G02pJDKly++ZceFP1LGLWymkXVksu1+Azjyl7HRBve7HwWKv51 Ykz/fL6O2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiS8sZ5tn8f/S+LmNBzcHX 1RIbK6QeB7nq3mZYMMGrX9Rmoe+cnnt1WosX7urZM/PHJwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Now that the driver core allows for struct class to be in read-only
memory, making all 'class' structures to be declared at build time
placing them into read-only memory, instead of having to be dynamically
allocated at load time.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/pi433/pi433_if.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 58887619b83f..11982bf398be 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -56,7 +56,10 @@ static DEFINE_IDR(pi433_idr);
 static DEFINE_MUTEX(minor_lock); /* Protect idr accesses */
 static struct dentry *root_dir;	/* debugfs root directory for the driver */
 
-static struct class *pi433_class; /* mainly for udev to create /dev/pi433 */
+/* mainly for udev to create /dev/pi433 */
+static const struct class pi433_class = {
+	.name = "pi433",
+};
 
 /*
  * tx config is instance specific
@@ -1259,7 +1262,7 @@ static int pi433_probe(struct spi_device *spi)
 
 	/* create device */
 	device->devt = MKDEV(MAJOR(pi433_dev), device->minor);
-	device->dev = device_create(pi433_class,
+	device->dev = device_create(&pi433_class,
 				    &spi->dev,
 				    device->devt,
 				    device,
@@ -1315,7 +1318,7 @@ static int pi433_probe(struct spi_device *spi)
 cdev_failed:
 	kthread_stop(device->tx_task_struct);
 send_thread_failed:
-	device_destroy(pi433_class, device->devt);
+	device_destroy(&pi433_class, device->devt);
 device_create_failed:
 	pi433_free_minor(device);
 minor_failed:
@@ -1342,7 +1345,7 @@ static void pi433_remove(struct spi_device *spi)
 
 	kthread_stop(device->tx_task_struct);
 
-	device_destroy(pi433_class, device->devt);
+	device_destroy(&pi433_class, device->devt);
 
 	cdev_del(device->cdev);
 
@@ -1398,18 +1401,18 @@ static int __init pi433_init(void)
 	if (status < 0)
 		return status;
 
-	pi433_class = class_create("pi433");
-	if (IS_ERR(pi433_class)) {
+	status = class_register(&pi433_class);
+	if (status) {
 		unregister_chrdev(MAJOR(pi433_dev),
 				  pi433_spi_driver.driver.name);
-		return PTR_ERR(pi433_class);
+		return status;
 	}
 
 	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
 
 	status = spi_register_driver(&pi433_spi_driver);
 	if (status < 0) {
-		class_destroy(pi433_class);
+		class_unregister(&pi433_class);
 		unregister_chrdev(MAJOR(pi433_dev),
 				  pi433_spi_driver.driver.name);
 	}
@@ -1422,7 +1425,7 @@ module_init(pi433_init);
 static void __exit pi433_exit(void)
 {
 	spi_unregister_driver(&pi433_spi_driver);
-	class_destroy(pi433_class);
+	class_destroy(&pi433_class);
 	unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
 	debugfs_remove(root_dir);
 }
-- 
2.42.0

