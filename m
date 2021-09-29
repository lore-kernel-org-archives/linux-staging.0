Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF052FAF
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 20:58:54 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id i4so16261257lfv.4
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1kSr62qOapSsqIz58lAGcepOFgXxkNBg/JiKfe7UOPU=;
        b=V86Pgp3GGKFbYLM/Sq2nkMostT1/QU8A8XMRjrHE3JF6jDsOlrVS+fYv9okzjwFLto
         FwH0FMhybiPbu5KXOXTdFIGPeByO7N8HXXUJuBYVJ9+J7EQJ9IvemH0Tw1P05V5fW7tV
         /3iHJVVntObllrZPlV/KHlqj39ejNMxGg+48irZ4huoA7r4baDD43PwqLvSM4y6BLajR
         3TB8HzcBjYYBmBaKja9GygBXOkiYId56xBBxbqs2NaPS/gjgxLiwlyV7fMJYQZ8JAG9z
         h7sVNzjgdZWgpmnsuVYLp4M+omY/e+hsXPJ4NCp8cT/T6smIy0UPIwBUR1I/C7siya4h
         FEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1kSr62qOapSsqIz58lAGcepOFgXxkNBg/JiKfe7UOPU=;
        b=8QATAI5+FLLmv++13DKzOSB+EgB1CA1oXMIxC7eUJ/lHDtP3wAhmj4YTEtPmBlpaST
         B69CWZT+Xf0wcFwktfNF9frnDEbwuiTdrzVPez8iszv7oWHlOKUWMzcLcLKWYxSXKLg/
         JShCXYBP7LI3jdozpgUOo9yNj3PKSV5pVhTnTwKt4X8exj2lrlpphKSxg9rnbOYycf/p
         ZiyQW/G3lWTMyeXMMDK4So9Or/SdEEBVzCL8mLqoV0LzfoWmTbskCvKT6ClCyz0B+RuC
         tbMlYsAwmV847ZvWYBOteemOHWKHW1gs9Itv5jmpM+piNGx77C14Q12+lyw0PVG+12oh
         zRZg==
X-Gm-Message-State: AOAM5339XcaZkMdulb4wn/9OpDQ4En5UChalZaFwuJTYxhlJsTZOOPIZ
	oDdlMWS0BX6bfm1qFfsEdRfYYQ==
X-Google-Smtp-Source: ABdhPJwgvMytmIYjjzZ1kGNRMgmKvvLtLtMTkWPMoPIdsHxkPRXzXDTpNZBZUe7KfgXo3ypAYEjJbw==
X-Received: by 2002:a19:690e:: with SMTP id e14mr1701322lfc.553.1632949132325;
        Wed, 29 Sep 2021 13:58:52 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id v1sm111973lfp.215.2021.09.29.13.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 13:58:51 -0700 (PDT)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] staging: most: dim2: fix device registration
Date: Wed, 29 Sep 2021 23:56:20 +0300
Message-Id: <20210929205619.2800-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 723de0f9171e ("staging: most: remove device from interface
structure") moved registration of driver-provided struct device to
the most subsystem, but did not properly update dim2 driver to
work with that change.

After most subsystem passes driver's dev to register_device(), it
becomes refcounted, and can be only deallocated in the release method.
Provide that by:
- not using devres to allocate the device,
- moving shutdown actions from _remove() to the device release method,
- not calling shutdown actions in _probe() after the device becomes
  refcounted.

Also, driver used to register it's dev itself, to provide a custom
attribute. With the modified most subsystem, this causes duplicate
registration of the same device object. Fix that by adding that custom
attribute to the platform device - that is a better location for
a platform-specific attribute anyway.

Fixes: 723de0f9171e ("staging: most: remove device from interface structure")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/staging/most/dim2/dim2.c  | 60 ++++++++++++++++++-------------
 drivers/staging/most/dim2/sysfs.c |  5 ++-
 2 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index e8b03fa90e80..7ef142b9faef 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -717,6 +717,23 @@ static int get_dim2_clk_speed(const char *clock_speed, u8 *val)
 	return -EINVAL;
 }
 
+static void dim2_release(struct device *d)
+{
+	struct dim2_hdm *dev = container_of(d, struct dim2_hdm, dev);
+	unsigned long flags;
+
+	kthread_stop(dev->netinfo_task);
+
+	spin_lock_irqsave(&dim_lock, flags);
+	dim_shutdown();
+	spin_unlock_irqrestore(&dim_lock, flags);
+
+	if (dev->disable_platform)
+		dev->disable_platform(to_platform_device(d->parent));
+
+	kfree(dev);
+}
+
 /*
  * dim2_probe - dim2 probe handler
  * @pdev: platform device structure
@@ -738,7 +755,7 @@ static int dim2_probe(struct platform_device *pdev)
 
 	enum { MLB_INT_IDX, AHB0_INT_IDX };
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
@@ -750,19 +767,21 @@ static int dim2_probe(struct platform_device *pdev)
 				      "microchip,clock-speed", &clock_speed);
 	if (ret) {
 		dev_err(&pdev->dev, "missing dt property clock-speed\n");
-		return ret;
+		goto err_free_dev;
 	}
 
 	ret = get_dim2_clk_speed(clock_speed, &dev->clk_speed);
 	if (ret) {
 		dev_err(&pdev->dev, "bad dt property clock-speed\n");
-		return ret;
+		goto err_free_dev;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->io_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(dev->io_base))
-		return PTR_ERR(dev->io_base);
+	if (IS_ERR(dev->io_base)) {
+		ret = PTR_ERR(dev->io_base);
+		goto err_free_dev;
+	}
 
 	of_id = of_match_node(dim2_of_match, pdev->dev.of_node);
 	pdata = of_id->data;
@@ -770,7 +789,7 @@ static int dim2_probe(struct platform_device *pdev)
 		if (pdata->enable) {
 			ret = pdata->enable(pdev);
 			if (ret)
-				return ret;
+				goto err_free_dev;
 		}
 		dev->disable_platform = pdata->disable;
 		if (pdata->fcnt)
@@ -865,32 +884,34 @@ static int dim2_probe(struct platform_device *pdev)
 	dev->most_iface.request_netinfo = request_netinfo;
 	dev->most_iface.driver_dev = &pdev->dev;
 	dev->most_iface.dev = &dev->dev;
-	dev->dev.init_name = "dim2_state";
+	dev->dev.init_name = dev->name;
 	dev->dev.parent = &pdev->dev;
+	dev->dev.release = dim2_release;
 
 	ret = most_register_interface(&dev->most_iface);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register MOST interface\n");
-		goto err_stop_thread;
+		/* cleanup handled by dim2_release() */
+		return ret;
 	}
 
-	ret = dim2_sysfs_probe(&dev->dev);
+	ret = dim2_sysfs_probe(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to create sysfs attribute\n");
-		goto err_unreg_iface;
+		most_deregister_interface(&dev->most_iface);
+		/* cleanup handled by dim2_release() */
+		return ret;
 	}
 
 	return 0;
 
-err_unreg_iface:
-	most_deregister_interface(&dev->most_iface);
-err_stop_thread:
-	kthread_stop(dev->netinfo_task);
 err_shutdown_dim:
 	dim_shutdown();
 err_disable_platform:
 	if (dev->disable_platform)
 		dev->disable_platform(pdev);
+err_free_dev:
+	kfree(dev);
 
 	return ret;
 }
@@ -904,18 +925,9 @@ static int dim2_probe(struct platform_device *pdev)
 static int dim2_remove(struct platform_device *pdev)
 {
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
-	unsigned long flags;
 
-	dim2_sysfs_destroy(&dev->dev);
+	dim2_sysfs_destroy(&pdev->dev);
 	most_deregister_interface(&dev->most_iface);
-	kthread_stop(dev->netinfo_task);
-
-	spin_lock_irqsave(&dim_lock, flags);
-	dim_shutdown();
-	spin_unlock_irqrestore(&dim_lock, flags);
-
-	if (dev->disable_platform)
-		dev->disable_platform(pdev);
 
 	return 0;
 }
diff --git a/drivers/staging/most/dim2/sysfs.c b/drivers/staging/most/dim2/sysfs.c
index c85b2cdcdca3..22836c8ed554 100644
--- a/drivers/staging/most/dim2/sysfs.c
+++ b/drivers/staging/most/dim2/sysfs.c
@@ -39,11 +39,10 @@ static const struct attribute_group *dev_attr_groups[] = {
 
 int dim2_sysfs_probe(struct device *dev)
 {
-	dev->groups = dev_attr_groups;
-	return device_register(dev);
+	return sysfs_create_groups(&dev->kobj, dev_attr_groups);
 }
 
 void dim2_sysfs_destroy(struct device *dev)
 {
-	device_unregister(dev);
+	sysfs_remove_groups(&dev->kobj, dev_attr_groups);
 }
-- 
2.30.2

