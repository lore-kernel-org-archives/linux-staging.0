Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72FE291F
	for <linux-staging@lists.linux.dev>; Fri, 17 Jun 2022 09:45:14 +0000 (UTC)
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LPYyF19rzzjXbg;
	Fri, 17 Jun 2022 17:43:33 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 17 Jun
 2022 17:45:06 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <ezequiel@vanguardiasur.com.ar>, <mchehab@kernel.org>,
	<gregkh@linuxfoundation.org>
CC: <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] media:rkvdec:Remove redundant memset
Date: Fri, 17 Jun 2022 09:39:25 +0000
Message-ID: <20220617093925.44985-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CFilter-Loop: Reflected

As dma_alloc_coherent() will return a zeroed buffer, we
don't need to memset the returned buffer.
priv_tbl = dma_alloc_coherent() and count_tbl = dma_alloc_coherent()
should be enough.

-see commit 750afb08ca71 ("cross-tree: phase out dma_zalloc_coherent()")

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/staging/media/rkvdec/rkvdec-vp9.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/media/rkvdec/rkvdec-vp9.c
index 311a12656072..c2f42e76be10 100644
--- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
+++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
@@ -1015,7 +1015,6 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 
 	vp9_ctx->priv_tbl.size = sizeof(*priv_tbl);
 	vp9_ctx->priv_tbl.cpu = priv_tbl;
-	memset(priv_tbl, 0, sizeof(*priv_tbl));
 
 	count_tbl = dma_alloc_coherent(rkvdec->dev, RKVDEC_VP9_COUNT_SIZE,
 				       &vp9_ctx->count_tbl.dma, GFP_KERNEL);
@@ -1026,7 +1025,6 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 
 	vp9_ctx->count_tbl.size = RKVDEC_VP9_COUNT_SIZE;
 	vp9_ctx->count_tbl.cpu = count_tbl;
-	memset(count_tbl, 0, sizeof(*count_tbl));
 	rkvdec_init_v4l2_vp9_count_tbl(ctx);
 
 	return 0;
-- 
2.17.1

