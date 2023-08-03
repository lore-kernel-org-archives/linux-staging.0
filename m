Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE027E
	for <linux-staging@lists.linux.dev>; Thu,  3 Aug 2023 09:27:40 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGk4M1VcLzrS4P;
	Thu,  3 Aug 2023 17:26:27 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:27:31 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <TheSven73@gmail.com>, <gregkh@linuxfoundation.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <wangzhu9@huawei.com>
Subject: [PATCH -next] staging: fieldbus: arcx-anybus: Do not check 0 for platform_get_irq()
Date: Thu, 3 Aug 2023 17:27:01 +0800
Message-ID: <20230803092701.52697-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected

Since platform_get_irq() never returned zero, so it need not to check
whether it returned zero, and we use the return error code of
platform_get_irq() to replace the current return error code, for that
platform_get_irq() may return -EINVAL or -ENXIO.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/staging/fieldbus/anybuss/arcx-anybus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fieldbus/anybuss/arcx-anybus.c b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
index f135b9f52c8d..be28165b4f05 100644
--- a/drivers/staging/fieldbus/anybuss/arcx-anybus.c
+++ b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
@@ -156,8 +156,8 @@ create_anybus_host(struct platform_device *pdev, int idx)
 	if (IS_ERR(ops.regmap))
 		return ERR_CAST(ops.regmap);
 	ops.irq = platform_get_irq(pdev, idx);
-	if (ops.irq <= 0)
-		return ERR_PTR(-EINVAL);
+	if (ops.irq < 0)
+		return ERR_PTR(ops.irq);
 	return devm_anybuss_host_common_probe(&pdev->dev, &ops);
 }
 
-- 
2.17.1

