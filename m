Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891794B5AE
	for <linux-staging@lists.linux.dev>; Wed,  1 May 2024 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714543108; cv=none; b=j7dqfJKYGXFWNQDDR+3YLK8fAMsgKdYZIxtT4qI0MLE+QbTWpdnPnc+IVUFxBJ0b2cKI1a+g18CyHFT4A7kkkVT5wXoReYeB2Yt12U8tTRWE0Mmyw7BKW6QAqbT9SD5jNKhPLiOQXoj/YMHK64OuRZbODX66IJuNO2iqnjRom4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714543108; c=relaxed/simple;
	bh=4emfBwO96KYMsWU61oZODbzHhWhy6ZisdIAcmsCUOIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jK1ZTiw2Y6mDcRE5janKx+FSjPuHllQVEcaaVn5DLVDC3JW+slVNaC3QFHc+2uyMdYCW/ameodKFKbjp5vUoQ3wDlPeO4Q8lG8xb1ew+WRdUe4LESppaiuqUm4dASf6Z+ggUhMD2o21DzUdkEbxe0xVOegBCecpQp8Xh5O0j5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXQwEmUx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXQwEmUx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ffso2441615e9.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 22:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714543104; x=1715147904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g+7qEBif8mPR7xqwnagP1WMzR/BT9n5J7+cl3F+70o=;
        b=YXQwEmUxuARH7MBMQoCtlWm4ZjD8JgLcgyxco3z2ejQscrBJX8anUIzvBoLyqMwaIH
         YRxBkHBiMvRlsiqAmbS7JfD+lzqvq15E8Z1AMGWtRvzik4iF6P2CW0ainW50cs+vuzJS
         goAyzlhNJfxaHyPDIiEUo8FojnoKCSLJ/KxsCnanyLJ1M2BWai1+CcgV3LF5b1gyvBJ4
         W9klYZOnfr0oehn1Xdf8uiUwv72iYetmvU6qTx7DbG3f+nrdf4i4i4mB4ycaj1N4c/V6
         05AtlINhH9X2MWL6/nLJmK+1XIYnrq4g4x1Yh13R5Ocip2o+4tOfnTgbaAxF23ESBPju
         bZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714543104; x=1715147904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g+7qEBif8mPR7xqwnagP1WMzR/BT9n5J7+cl3F+70o=;
        b=nT5WQWqNu2g33kjrhylzcq7Z5jNB+Yi93U4tNujG55vj9YIbmOiDwDwuZjWeWufPlF
         +gUvoK6exsjnc8YXl7KCM7awzKhWbetWWRvKulMpzu7FpSDCX4icmWOSA4E+zY3WWNMX
         xgm9AonMHmQNt1RHqzjz+ZB/IPPaYMCcstS8cRYsS2Xl95TcQf/RFeKb1J/DUnbPR+x5
         bmxV2apQEm9Or3OsWGGg74HHL9pwSS+bt26fWGT4c7WI6BOkCqophTQJe3l7dOEn26f+
         8mT4mIDUMpGzFw1peO5aHwx8Zyw+uF3EWBkEwmPDL6BVwtGf1YQ+n0JFRuhRpFxtbbe8
         /m+A==
X-Gm-Message-State: AOJu0Yx8rU0ffYc7pWCXFkXPbsK0y7DB77OcKsncNINfkk3iFUzoPb8v
	Y1ee9Kcwz5t7RpPi0Iruv6lfeZJUEZddt0IquMMYLxjobGAV36ce
X-Google-Smtp-Source: AGHT+IGJCUIqro86kQurFCU6caq5ig2KEytK2bF/pzFVHgp+d2XWxjj6e0kfwlNkecFADTjHECxnWg==
X-Received: by 2002:a05:600c:4e8e:b0:41c:2334:fffd with SMTP id f14-20020a05600c4e8e00b0041c2334fffdmr1433112wmq.9.1714543104181;
        Tue, 30 Apr 2024 22:58:24 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:e314:db5d:b033:4fc2])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b0034c61e211a5sm12451390wrt.63.2024.04.30.22.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 22:58:23 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com,
	dan.carpenter@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: pi433: Use class_create instead of class_register.
Date: Wed,  1 May 2024 08:58:19 +0300
Message-Id: <20240501055820.603272-2-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240501055820.603272-1-ikobh7@gmail.com>
References: <20240501055820.603272-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of a higher level API.
Reduce global memory allocation from struct class to pointer size.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 31aeabb1f153..c8c1d296184b 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -59,9 +59,7 @@ static DEFINE_MUTEX(minor_lock); /* Protect idr accesses */
 static struct dentry *root_dir;	/* debugfs root directory for the driver */
 
 /* mainly for udev to create /dev/pi433 */
-static const struct class pi433_class = {
-	.name = "pi433",
-};
+static const struct class *pi433_class;
 
 /*
  * tx config is instance specific
@@ -1263,7 +1261,7 @@ static int pi433_probe(struct spi_device *spi)
 
 	/* create device */
 	pi433->devt = MKDEV(MAJOR(pi433_devt), pi433->minor);
-	pi433->dev = device_create(&pi433_class,
+	pi433->dev = device_create(pi433_class,
 				   &spi->dev,
 				   pi433->devt,
 				   pi433,
@@ -1319,7 +1317,7 @@ static int pi433_probe(struct spi_device *spi)
 cdev_failed:
 	kthread_stop(pi433->tx_task_struct);
 send_thread_failed:
-	device_destroy(&pi433_class, pi433->devt);
+	device_destroy(pi433_class, pi433->devt);
 device_create_failed:
 	pi433_free_minor(pi433);
 minor_failed:
@@ -1346,7 +1344,7 @@ static void pi433_remove(struct spi_device *spi)
 
 	kthread_stop(pi433->tx_task_struct);
 
-	device_destroy(&pi433_class, pi433->devt);
+	device_destroy(pi433_class, pi433->devt);
 
 	cdev_del(pi433->cdev);
 
@@ -1401,9 +1399,11 @@ static int __init pi433_init(void)
 	if (status < 0)
 		return status;
 
-	status = class_register(&pi433_class);
-	if (status)
+	pi433_class = class_create("pi433");
+	if (IS_ERR(pi433_class)) {
+		status = PTR_ERR(pi433_class);
 		goto unreg_chrdev;
+	}
 
 	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
 
@@ -1415,7 +1415,7 @@ static int __init pi433_init(void)
 
 unreg_class_and_remove_dbfs:
 	debugfs_remove(root_dir);
-	class_unregister(&pi433_class);
+	class_destroy(pi433_class);
 unreg_chrdev:
 	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
 	return status;
@@ -1427,7 +1427,7 @@ static void __exit pi433_exit(void)
 {
 	spi_unregister_driver(&pi433_spi_driver);
 	debugfs_remove(root_dir);
-	class_unregister(&pi433_class);
+	class_destroy(pi433_class);
 	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
 }
 module_exit(pi433_exit);

base-commit: 75ff53c44f5e151d21d949416633b56e56160124
prerequisite-patch-id: 91943193af2fea74182be67fb583235a3fbeb77b
prerequisite-patch-id: 2cad031ba6a0782a67ab1645ff034a8be65c2e76
prerequisite-patch-id: 1a852ed8f9d133aec7c651fd9007e59e39c55fb7
-- 
2.34.1

