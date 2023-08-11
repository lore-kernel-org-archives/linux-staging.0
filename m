Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E0185A
	for <linux-staging@lists.linux.dev>; Fri, 11 Aug 2023 07:11:28 +0000 (UTC)
Received: from dggpemm500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RMZcn1XLrztS7P;
	Fri, 11 Aug 2023 15:07:53 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500012.china.huawei.com (7.185.36.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 15:11:24 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 15:11:23 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-staging@lists.linux.dev>, <greybus-dev@lists.linaro.org>
CC: <hvaibhav.linux@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
	<gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next] staging: greybus: arche-apb-ctrl: remove unnecessary platform_set_drvdata()
Date: Fri, 11 Aug 2023 15:08:26 +0800
Message-ID: <20230811070826.739049-1-yangyingliang@huawei.com>
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
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
the driver_data will be cleared in device_unbind_cleanup() after
calling ->remove() in driver call code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 8541995008da..5c77c1813214 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -423,7 +423,6 @@ static void arche_apb_ctrl_remove(struct platform_device *pdev)
 {
 	device_remove_file(&pdev->dev, &dev_attr_state);
 	poweroff_seq(pdev);
-	platform_set_drvdata(pdev, NULL);
 }
 
 static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
-- 
2.25.1

