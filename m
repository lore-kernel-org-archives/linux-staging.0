Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0882C86
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 14:35:22 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id i4so87982761lfv.4
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xJ3nhukfNncU2sAkhVxnfr4phCF76502pKvZUuaK5RM=;
        b=ymMQyP3OPtOJVk4A4j8qXiY3Xyj9KWNH+C+PS16wfiHTt9wKw9TVtEZxFHqK9Oqgl5
         OchWoRe+EhjZZ+gPDv6cH56zaiePqu2EKSDcPEFoMMpR1ORuYwiPOh7AAopbNVvkfy5h
         IC9MYgoXH11/TljmXpot/Xs3GUwYlaZ715Kke3+24nh1SPjJu0D9T0zgJnYkU93rXyv1
         K/mGJefM5vHtIJcfxLghka5wyRDfrKdsuMqwDicp55gwDUlO7L4X/b/ToqlV6vHPIZwb
         oWQ72Fm6gzGzDFsba2zi+wJfS9f+SDrGpnknWAS98jip21ycsCO/pzzinF1UCWetDUTb
         TxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xJ3nhukfNncU2sAkhVxnfr4phCF76502pKvZUuaK5RM=;
        b=ZXBdkrTZqCP1BKy3kP2ZWRl5UvrtMa9voztvshlzonuUD6KF1ijEW2n50LzWemYs+L
         Fclqt67aWqjnd33Oem1bgNxmbEcpYIRWq3Ax1/Nr5J9R5H8j/+HpHmcSD6vSDwPuQ94n
         oEpS/PJpW6iUW648/UTvBDSPFn3OgM+blfHQpXSyFStiCJQ0iMZc8loVoGDtiGNvQQMg
         XKpdjS0bRLSW4ONXWgP7VcWh4D0jM7nuonH54Epp8HMmccaJ0uI2M4SPZRGRskOcY3nY
         sdYyt2dguRdrLpPuIFgmp7vEPPR9Q393dv8lSkzUjqUovSJehZmqb+c3CbEnl8v6YxHD
         EjCg==
X-Gm-Message-State: AOAM533+2N/w5lcz+TFeU1W3pNqwAemnuEzSae/tS60Guo4IMaLhPquM
	JGOYjBasOeVtqsQ0DsJlErN6/w==
X-Google-Smtp-Source: ABdhPJwLA1gnXVwA1LP7KXOMXY16x+1Us4coFH34L1naBc2iJgQpCek95Z/ywlZjAgpLoImbSSs+nQ==
X-Received: by 2002:a2e:7f06:: with SMTP id a6mr22553903ljd.437.1633444520442;
        Tue, 05 Oct 2021 07:35:20 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id q5sm1969931lfo.225.2021.10.05.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:35:20 -0700 (PDT)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Gromm <christian.gromm@microchip.com>,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 1/2] staging: most: dim2: do not double-register the same device
Date: Tue,  5 Oct 2021 17:34:48 +0300
Message-Id: <20211005143448.8660-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YVwofSvwGTv3kHjh@kroah.com>
References: <YVwofSvwGTv3kHjh@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 723de0f9171e ("staging: most: remove device from interface
structure") moved registration of driver-provided struct device to
the most subsystem.

Dim2 used to register the same struct device to provide a custom device
attribute. This causes double-registration of the same struct device.

Fix that by moving the custom attribute to driver's dev_groups.
This moves attribute to the platform_device object, which is a better
location for platform-specific attributes anyway.

Fixes: 723de0f9171e ("staging: most: remove device from interface structure")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/staging/most/dim2/Makefile |  2 +-
 drivers/staging/most/dim2/dim2.c   | 31 ++++++++++++-------
 drivers/staging/most/dim2/sysfs.c  | 49 ------------------------------
 drivers/staging/most/dim2/sysfs.h  | 11 -------
 4 files changed, 21 insertions(+), 72 deletions(-)
 delete mode 100644 drivers/staging/most/dim2/sysfs.c

diff --git a/drivers/staging/most/dim2/Makefile b/drivers/staging/most/dim2/Makefile
index 861adacf6c72..5f9612af3fa3 100644
--- a/drivers/staging/most/dim2/Makefile
+++ b/drivers/staging/most/dim2/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_MOST_DIM2) += most_dim2.o
 
-most_dim2-objs := dim2.o hal.o sysfs.o
+most_dim2-objs := dim2.o hal.o
diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index e8b03fa90e80..bb6dd508e531 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -118,7 +118,8 @@ struct dim2_platform_data {
 	(((p)[1] == 0x18) && ((p)[2] == 0x05) && ((p)[3] == 0x0C) && \
 	 ((p)[13] == 0x3C) && ((p)[14] == 0x00) && ((p)[15] == 0x0A))
 
-bool dim2_sysfs_get_state_cb(void)
+static ssize_t state_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	bool state;
 	unsigned long flags;
@@ -127,9 +128,25 @@ bool dim2_sysfs_get_state_cb(void)
 	state = dim_get_lock_state();
 	spin_unlock_irqrestore(&dim_lock, flags);
 
-	return state;
+	return sprintf(buf, "%s\n", state ? "locked" : "");
 }
 
+static DEVICE_ATTR_RO(state);
+
+static struct attribute *dim2_dev_attrs[] = {
+	&dev_attr_state.attr,
+	NULL,
+};
+
+static struct attribute_group dim2_attr_group = {
+	.attrs = dim2_dev_attrs,
+};
+
+static const struct attribute_group *dim2_attr_groups[] = {
+	&dim2_attr_group,
+	NULL,
+};
+
 /**
  * dimcb_on_error - callback from HAL to report miscommunication between
  * HDM and HAL
@@ -874,16 +891,8 @@ static int dim2_probe(struct platform_device *pdev)
 		goto err_stop_thread;
 	}
 
-	ret = dim2_sysfs_probe(&dev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to create sysfs attribute\n");
-		goto err_unreg_iface;
-	}
-
 	return 0;
 
-err_unreg_iface:
-	most_deregister_interface(&dev->most_iface);
 err_stop_thread:
 	kthread_stop(dev->netinfo_task);
 err_shutdown_dim:
@@ -906,7 +915,6 @@ static int dim2_remove(struct platform_device *pdev)
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
 	unsigned long flags;
 
-	dim2_sysfs_destroy(&dev->dev);
 	most_deregister_interface(&dev->most_iface);
 	kthread_stop(dev->netinfo_task);
 
@@ -1100,6 +1108,7 @@ static struct platform_driver dim2_driver = {
 	.driver = {
 		.name = "hdm_dim2",
 		.of_match_table = dim2_of_match,
+		.dev_groups = dim2_attr_groups,
 	},
 };
 
diff --git a/drivers/staging/most/dim2/sysfs.c b/drivers/staging/most/dim2/sysfs.c
deleted file mode 100644
index c85b2cdcdca3..000000000000
--- a/drivers/staging/most/dim2/sysfs.c
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * sysfs.c - MediaLB sysfs information
- *
- * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
- */
-
-/* Author: Andrey Shvetsov <andrey.shvetsov@k2l.de> */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/kernel.h>
-#include "sysfs.h"
-#include <linux/device.h>
-
-static ssize_t state_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	bool state = dim2_sysfs_get_state_cb();
-
-	return sprintf(buf, "%s\n", state ? "locked" : "");
-}
-
-static DEVICE_ATTR_RO(state);
-
-static struct attribute *dev_attrs[] = {
-	&dev_attr_state.attr,
-	NULL,
-};
-
-static struct attribute_group dev_attr_group = {
-	.attrs = dev_attrs,
-};
-
-static const struct attribute_group *dev_attr_groups[] = {
-	&dev_attr_group,
-	NULL,
-};
-
-int dim2_sysfs_probe(struct device *dev)
-{
-	dev->groups = dev_attr_groups;
-	return device_register(dev);
-}
-
-void dim2_sysfs_destroy(struct device *dev)
-{
-	device_unregister(dev);
-}
diff --git a/drivers/staging/most/dim2/sysfs.h b/drivers/staging/most/dim2/sysfs.h
index 24277a17cff3..09115cf4ed00 100644
--- a/drivers/staging/most/dim2/sysfs.h
+++ b/drivers/staging/most/dim2/sysfs.h
@@ -16,15 +16,4 @@ struct medialb_bus {
 	struct kobject kobj_group;
 };
 
-struct device;
-
-int dim2_sysfs_probe(struct device *dev);
-void dim2_sysfs_destroy(struct device *dev);
-
-/*
- * callback,
- * must deliver MediaLB state as true if locked or false if unlocked
- */
-bool dim2_sysfs_get_state_cb(void);
-
 #endif	/* DIM2_SYSFS_H */
-- 
2.30.2

