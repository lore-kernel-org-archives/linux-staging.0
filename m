Received: from baidu.com (mx21.baidu.com [220.181.3.85])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1F172
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 10:58:09 +0000 (UTC)
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
	by Forcepoint Email with ESMTPS id A145D64496600D136CD7;
	Wed,  8 Sep 2021 18:58:08 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 8 Sep 2021 18:58:08 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 8 Sep 2021 18:58:07 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Ezequiel Garcia <ezequiel@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: media: rkvdec: Make use of the helper function devm_platform_ioremap_resource()
Date: Wed, 8 Sep 2021 18:57:59 +0800
Message-ID: <20210908105801.2086-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 7131156c1f2c..bf00fe6534a3 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -967,7 +967,6 @@ static const char * const rkvdec_clk_names[] = {
 static int rkvdec_probe(struct platform_device *pdev)
 {
 	struct rkvdec_dev *rkvdec;
-	struct resource *res;
 	unsigned int i;
 	int ret, irq;
 
@@ -999,8 +998,7 @@ static int rkvdec_probe(struct platform_device *pdev)
 	 */
 	clk_set_rate(rkvdec->clocks[0].clk, 500 * 1000 * 1000);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rkvdec->regs = devm_ioremap_resource(&pdev->dev, res);
+	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkvdec->regs))
 		return PTR_ERR(rkvdec->regs);
 
-- 
2.25.1

