Received: from out199-3.us.a.mail.aliyun.com (out199-3.us.a.mail.aliyun.com [47.90.199.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49D7B
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 06:52:48 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VdONOX._1678257414;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VdONOX._1678257414)
          by smtp.aliyun-inc.com;
          Wed, 08 Mar 2023 14:36:55 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: parthiban.veerasooran@microchip.com
Cc: christian.gromm@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] staging: most: dim2: Use devm_platform_get_and_ioremap_resource()
Date: Wed,  8 Mar 2023 14:36:53 +0800
Message-Id: <20230308063653.92879-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to commit 890cc39a8799 ("drivers: provide
devm_platform_get_and_ioremap_resource()"), convert
platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/staging/most/dim2/dim2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 7a5f80e637a0..b8bd01ca1f11 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -775,8 +775,7 @@ static int dim2_probe(struct platform_device *pdev)
 		goto err_free_dev;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->io_base = devm_ioremap_resource(&pdev->dev, res);
+	dev->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dev->io_base)) {
 		ret = PTR_ERR(dev->io_base);
 		goto err_free_dev;
-- 
2.20.1.7.g153144c

