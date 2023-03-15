Received: from out199-18.us.a.mail.aliyun.com (out199-18.us.a.mail.aliyun.com [47.90.199.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D847E
	for <linux-staging@lists.linux.dev>; Wed, 15 Mar 2023 00:30:29 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VdtnYOb_1678840210;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VdtnYOb_1678840210)
          by smtp.aliyun-inc.com;
          Wed, 15 Mar 2023 08:30:11 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mchehab@kernel.org
Cc: eugen.hristev@collabora.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@microchip.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next v2] media: atmel: atmel-isc: Use devm_platform_ioremap_resource()
Date: Wed, 15 Mar 2023 08:30:09 +0800
Message-Id: <20230315003009.123827-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to commit 7945f929f1a7 ("drivers: provide
devm_platform_ioremap_resource()"), convert platform_get_resource(),
devm_ioremap_resource() to a single call to use
devm_platform_ioremap_resource(), as this is exactly what this function
does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

change in v2:
According to Claudiu's suggestion, make the 'Use' to 'use'in  the commit description.

 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 4 +---
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index ba0614f981a2..eebb336efce7 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -389,7 +389,6 @@ static int atmel_isc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct isc_device *isc;
-	struct resource *res;
 	void __iomem *io_base;
 	struct isc_subdev_entity *subdev_entity;
 	int irq;
@@ -403,8 +402,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, isc);
 	isc->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io_base = devm_ioremap_resource(dev, res);
+	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 01ababdfcbd9..beed40fe3f91 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -378,7 +378,6 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct isc_device *isc;
-	struct resource *res;
 	void __iomem *io_base;
 	struct isc_subdev_entity *subdev_entity;
 	int irq;
@@ -392,8 +391,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, isc);
 	isc->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io_base = devm_ioremap_resource(dev, res);
+	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
-- 
2.20.1.7.g153144c

