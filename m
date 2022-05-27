Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BE7C
	for <linux-staging@lists.linux.dev>; Fri, 27 May 2022 06:28:13 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L8Z7g2rQmz1JBcS;
	Fri, 27 May 2022 14:06:39 +0800 (CST)
Received: from dggpemm500018.china.huawei.com (7.185.36.111) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 14:08:12 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500018.china.huawei.com (7.185.36.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 14:08:11 +0800
From: keliu <liuke94@huawei.com>
To: <TheSven73@gmail.com>, <gregkh@linuxfoundation.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: keliu <liuke94@huawei.com>
Subject: [PATCH] staging: fieldbus: Directly use ida_alloc()/free()
Date: Fri, 27 May 2022 06:29:38 +0000
Message-ID: <20220527062938.2356319-1-liuke94@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500018.china.huawei.com (7.185.36.111)
X-CFilter-Loop: Reflected

Use ida_alloc()/ida_free() instead of deprecated
ida_simple_get()/ida_simple_remove() .

Signed-off-by: keliu <liuke94@huawei.com>
---
 drivers/staging/fieldbus/anybuss/arcx-anybus.c | 6 +++---
 drivers/staging/fieldbus/dev_core.c            | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fieldbus/anybuss/arcx-anybus.c b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
index 9af2e63050d1..381d710aa6ce 100644
--- a/drivers/staging/fieldbus/anybuss/arcx-anybus.c
+++ b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
@@ -282,7 +282,7 @@ static int controller_probe(struct platform_device *pdev)
 		}
 	}
 
-	id = ida_simple_get(&controller_index_ida, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&controller_index_ida, GFP_KERNEL);
 	if (id < 0) {
 		err = id;
 		goto out_reset;
@@ -315,7 +315,7 @@ static int controller_probe(struct platform_device *pdev)
 out_dev:
 	put_device(cd->class_dev);
 out_ida:
-	ida_simple_remove(&controller_index_ida, id);
+	ida_free(&controller_index_ida, id);
 out_reset:
 	gpiod_set_value_cansleep(cd->reset_gpiod, 1);
 	return err;
@@ -327,7 +327,7 @@ static int controller_remove(struct platform_device *pdev)
 	int id = cd->class_dev->id;
 
 	device_unregister(cd->class_dev);
-	ida_simple_remove(&controller_index_ida, id);
+	ida_free(&controller_index_ida, id);
 	gpiod_set_value_cansleep(cd->reset_gpiod, 1);
 	return 0;
 }
diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
index 5aab734606ea..b5e55890001e 100644
--- a/drivers/staging/fieldbus/dev_core.c
+++ b/drivers/staging/fieldbus/dev_core.c
@@ -251,7 +251,7 @@ static void __fieldbus_dev_unregister(struct fieldbus_dev *fb)
 		return;
 	device_destroy(&fieldbus_class, fb->cdev.dev);
 	cdev_del(&fb->cdev);
-	ida_simple_remove(&fieldbus_ida, fb->id);
+	ida_free(&fieldbus_ida, fb->id);
 }
 
 void fieldbus_dev_unregister(struct fieldbus_dev *fb)
@@ -294,7 +294,7 @@ static int __fieldbus_dev_register(struct fieldbus_dev *fb)
 err_dev_create:
 	cdev_del(&fb->cdev);
 err_cdev:
-	ida_simple_remove(&fieldbus_ida, fb->id);
+	ida_free(&fieldbus_ida, fb->id);
 	return err;
 }
 
-- 
2.25.1

