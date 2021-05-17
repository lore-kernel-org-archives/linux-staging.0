Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDFF70
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 08:07:55 +0000 (UTC)
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FkBWw5xTjzmWtW;
	Mon, 17 May 2021 16:05:32 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 16:07:47 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 17
 May 2021 16:07:46 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <ezequiel@collabora.com>, <p.zabel@pengutronix.de>, <mchehab@kernel.org>,
	<gregkh@linuxfoundation.org>
CC: <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] media: hantro: Fix PM reference leak in device_run()
Date: Mon, 17 May 2021 16:15:16 +0800
Message-ID: <20210517081516.1562794-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index eea2009fa17b..7a6d3ef22096 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -160,7 +160,7 @@ static void device_run(void *priv)
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_get_sync(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(ctx->dev->dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(ctx->dev->dev);
 		goto err_cancel_job;
-- 
2.25.4

