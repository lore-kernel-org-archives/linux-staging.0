Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1CD6AA9
	for <linux-staging@lists.linux.dev>; Fri, 11 Aug 2023 09:31:00 +0000 (UTC)
Received: from dggpemm500018.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RMdjn34MFzcdHv;
	Fri, 11 Aug 2023 17:27:25 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500018.china.huawei.com (7.185.36.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 17:30:56 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 17:30:56 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next] staging: axis-fifo: remove unnecessary dev_set_drvdata()
Date: Fri, 11 Aug 2023 17:27:56 +0800
Message-ID: <20230811092756.893592-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

The driver data will be cleared in device_unbind_cleanup() in driver
core code. So the dev_set_drvdata(..., NULL) called in remove and error
path in probe can be removed.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 727b956aa231..b9dc3c01a5f3 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -899,7 +899,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	return 0;
 
 err_initial:
-	dev_set_drvdata(dev, NULL);
 	return rc;
 }
 
@@ -909,7 +908,6 @@ static void axis_fifo_remove(struct platform_device *pdev)
 	struct axis_fifo *fifo = dev_get_drvdata(dev);
 
 	misc_deregister(&fifo->miscdev);
-	dev_set_drvdata(dev, NULL);
 }
 
 static const struct of_device_id axis_fifo_of_match[] = {
-- 
2.25.1

