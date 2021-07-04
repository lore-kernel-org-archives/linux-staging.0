Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D0168
	for <linux-staging@lists.linux.dev>; Sun,  4 Jul 2021 15:57:24 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id z13so1332328plg.8
        for <linux-staging@lists.linux.dev>; Sun, 04 Jul 2021 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cOMlhnPS9Nt4DVyaFyvYG80jB8+C7ONbrQ+seug7Wxg=;
        b=o5URaTKfYg6hEi2c9uABs18WKffvL8dz0OICdJ1yAxEuR/TXwk72QVGeTFlSJarms5
         UMPpX2elcTsDjiA3CrXRXvfBrZpECjVTs9aSmE4qxXzTEkCVroDeaQa2I04anNH/RZAW
         NBGxGgfSoPoye6T+k7gwgyM2TZHavuHGwpassJvtnZ/8g8mN8rPg7sSpsiOXZ9GiqdfM
         DIz2BHXn3bEj8veqpi6HBMQLRKock5vXHPauYO35FpsY83dvGNtiASHZiHEPXJbnvLex
         PaXHeTrCM2qHwoKlgWX0rZ0YF2oLH9fiBzRu3c+thdUa8o8WiyWbKIFfoZgGqq6jh4Ev
         CzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cOMlhnPS9Nt4DVyaFyvYG80jB8+C7ONbrQ+seug7Wxg=;
        b=sTGVeuNijOgUsbj3kb75xoFVepzww3y1ObNdoMKIRyYHm8H47xQStW1AB0qimSkNu5
         qEeQKVSNdf/du7Scm9WsEQ2+ZaRWvD5lneLPAXw3SFwctls7u90R6Eo7XM2AESEmvQ0c
         MhFN83BHlBzxY1FcOw6uxk+Ljvw3ucKxTMNddVV9ZthrHPsy0d9qAfPDvKLYvcjdriXR
         Rt7cXYhNrhtsVYaiyKWUiO5UohvFpBq6TMUwbPgrLXOE7exvCMv3xnrIs82LfS4i3D88
         X2NVv1hwSFr4SaFUhegTJTnS2KvvuR72gdw61n8EP1k8RgTQM6TKElmjkwST+ZtEwtyg
         21mw==
X-Gm-Message-State: AOAM531qA2UnpG7nnvyozh2dnCr+f3K3HVw7Uoph/Z+LY1hw62c4rCH1
	R/O0BpgeAzLobvxtq2A7xsw=
X-Google-Smtp-Source: ABdhPJyDwl9JCVuaMQdmMC6y4d2paPbOl05xHlD+ifHJbTYzblTJLdCGA08hvkzSRCMnkZ9RVYZbRQ==
X-Received: by 2002:a17:90a:948b:: with SMTP id s11mr10649341pjo.139.1625414244541;
        Sun, 04 Jul 2021 08:57:24 -0700 (PDT)
Received: from ojas ([182.69.223.21])
        by smtp.gmail.com with ESMTPSA id k10sm5690394pfp.63.2021.07.04.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:57:24 -0700 (PDT)
Date: Sun, 4 Jul 2021 21:27:13 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org
Cc: gregkh@linuxfoundation.org, stefan.wahren@i2se.com, arnd@arndb.de,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] staging: vchiq: Refactor vchiq cdev code
Message-ID: <84a14939b25b5babed921f7d2bad2975d8639fd3.1625401927.git.ojaswin98@gmail.com>
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

Move the vchiq cdev initialization code to its own function for better
code organization. Call the initialization function during probe, thus
shifting the whole cdev creation logic (which was earlier split in
vchiq_probe() and vchiq_driver_init()) to vchiq_probe().

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 142 ++++++++++++------
 1 file changed, 92 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index b5aac862a298..3a0724fe25ea 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2134,6 +2134,81 @@ vchiq_fops = {
 	.read = vchiq_read
 };
 
+/**
+ *	vchiq_register_chrdev - Register the char driver for vchiq
+ *				and create the necessary class and
+ *				device files in userspace.
+ *	@parent		The parent of the char device.
+ *
+ *	Returns 0 on success else returns the error code.
+ */
+static int vchiq_register_chrdev(struct device *parent)
+{
+	struct device *vchiq_dev;
+	int ret;
+
+	vchiq_class = class_create(THIS_MODULE, DEVICE_NAME);
+	if (IS_ERR(vchiq_class)) {
+		pr_err("Failed to create vchiq class\n");
+		ret = PTR_ERR(vchiq_class);
+		goto error_exit;
+	}
+
+	ret = alloc_chrdev_region(&vchiq_devid, 0, 1, DEVICE_NAME);
+	if (ret) {
+		pr_err("vchiq: Failed to allocate vchiq's chrdev region\n");
+		goto alloc_region_error;
+	}
+
+	cdev_init(&vchiq_cdev, &vchiq_fops);
+	vchiq_cdev.owner = THIS_MODULE;
+	ret = cdev_add(&vchiq_cdev, vchiq_devid, 1);
+	if (ret) {
+		vchiq_log_error(vchiq_arm_log_level,
+				"Unable to register vchiq char device");
+		goto cdev_add_error;
+	}
+
+	vchiq_dev = device_create(vchiq_class, parent, vchiq_devid, NULL,
+				  DEVICE_NAME);
+	if (IS_ERR(vchiq_dev)) {
+		vchiq_log_error(vchiq_arm_log_level,
+				"Failed to create vchiq char device node");
+		ret = PTR_ERR(vchiq_dev);
+		goto device_create_error;
+	}
+
+	vchiq_log_info(vchiq_arm_log_level,
+		       "vchiq char dev initialised successfully - device %d.%d",
+			MAJOR(vchiq_devid), MINOR(vchiq_devid));
+
+	return 0;
+
+device_create_error:
+	cdev_del(&vchiq_cdev);
+
+cdev_add_error:
+	unregister_chrdev_region(vchiq_devid, 1);
+
+alloc_region_error:
+	class_destroy(vchiq_class);
+
+error_exit:
+	return ret;
+}
+
+/**
+ *	vchiq_deregister_chrdev	- Deregister and cleanup the vchiq char
+ *				  driver and device files
+ */
+static void vchiq_deregister_chrdev(void)
+{
+	device_destroy(vchiq_class, vchiq_devid);
+	cdev_del(&vchiq_cdev);
+	unregister_chrdev_region(vchiq_devid, 1);
+	class_destroy(vchiq_class);
+}
+
 /*
  * Autosuspend related functionality
  */
@@ -2644,7 +2719,6 @@ static int vchiq_probe(struct platform_device *pdev)
 	struct device_node *fw_node;
 	const struct of_device_id *of_id;
 	struct vchiq_drvdata *drvdata;
-	struct device *vchiq_dev;
 	int err;
 
 	of_id = of_match_node(vchiq_of_match, pdev->dev.of_node);
@@ -2670,38 +2744,31 @@ static int vchiq_probe(struct platform_device *pdev)
 	if (err)
 		goto failed_platform_init;
 
-	cdev_init(&vchiq_cdev, &vchiq_fops);
-	vchiq_cdev.owner = THIS_MODULE;
-	err = cdev_add(&vchiq_cdev, vchiq_devid, 1);
-	if (err) {
-		vchiq_log_error(vchiq_arm_log_level,
-			"Unable to register device");
-		goto failed_platform_init;
-	}
-
-	vchiq_dev = device_create(vchiq_class, &pdev->dev, vchiq_devid, NULL,
-				  "vchiq");
-	if (IS_ERR(vchiq_dev)) {
-		err = PTR_ERR(vchiq_dev);
-		goto failed_device_create;
-	}
-
 	vchiq_debugfs_init();
 
 	vchiq_log_info(vchiq_arm_log_level,
-		"vchiq: initialised - version %d (min %d), device %d.%d",
-		VCHIQ_VERSION, VCHIQ_VERSION_MIN,
-		MAJOR(vchiq_devid), MINOR(vchiq_devid));
+		       "vchiq: platform initialised - version %d (min %d)",
+		       VCHIQ_VERSION, VCHIQ_VERSION_MIN);
+
+	/*
+	 * Simply exit on error since the function handles cleanup in
+	 * cases of failure.
+	 */
+	err = vchiq_register_chrdev(&pdev->dev);
+	if (err) {
+		vchiq_log_warning(vchiq_arm_log_level,
+				  "Failed to initialize vchiq cdev");
+		goto error_exit;
+	}
 
 	bcm2835_camera = vchiq_register_child(pdev, "bcm2835-camera");
 	bcm2835_audio = vchiq_register_child(pdev, "bcm2835_audio");
 
 	return 0;
 
-failed_device_create:
-	cdev_del(&vchiq_cdev);
 failed_platform_init:
-	vchiq_log_warning(vchiq_arm_log_level, "could not load vchiq");
+	vchiq_log_warning(vchiq_arm_log_level, "could not initialize vchiq platform");
+error_exit:
 	return err;
 }
 
@@ -2710,8 +2777,7 @@ static int vchiq_remove(struct platform_device *pdev)
 	platform_device_unregister(bcm2835_audio);
 	platform_device_unregister(bcm2835_camera);
 	vchiq_debugfs_deinit();
-	device_destroy(vchiq_class, vchiq_devid);
-	cdev_del(&vchiq_cdev);
+	vchiq_deregister_chrdev();
 
 	return 0;
 }
@@ -2729,31 +2795,9 @@ static int __init vchiq_driver_init(void)
 {
 	int ret;
 
-	vchiq_class = class_create(THIS_MODULE, DEVICE_NAME);
-	if (IS_ERR(vchiq_class)) {
-		pr_err("Failed to create vchiq class\n");
-		return PTR_ERR(vchiq_class);
-	}
-
-	ret = alloc_chrdev_region(&vchiq_devid, 0, 1, DEVICE_NAME);
-	if (ret) {
-		pr_err("Failed to allocate vchiq's chrdev region\n");
-		goto class_destroy;
-	}
-
 	ret = platform_driver_register(&vchiq_driver);
-	if (ret) {
+	if (ret)
 		pr_err("Failed to register vchiq driver\n");
-		goto region_unregister;
-	}
-
-	return 0;
-
-region_unregister:
-	unregister_chrdev_region(vchiq_devid, 1);
-
-class_destroy:
-	class_destroy(vchiq_class);
 
 	return ret;
 }
@@ -2762,8 +2806,6 @@ module_init(vchiq_driver_init);
 static void __exit vchiq_driver_exit(void)
 {
 	platform_driver_unregister(&vchiq_driver);
-	unregister_chrdev_region(vchiq_devid, 1);
-	class_destroy(vchiq_class);
 }
 module_exit(vchiq_driver_exit);
 
-- 
2.25.1

