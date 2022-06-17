Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0984A7F
	for <linux-staging@lists.linux.dev>; Fri, 17 Jun 2022 07:55:32 +0000 (UTC)
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LPW7L1R8YzDrCs;
	Fri, 17 Jun 2022 15:36:14 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 17 Jun
 2022 15:36:41 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <ezequiel@vanguardiasur.com.ar>, <mchehab@kernel.org>,
	<gregkh@linuxfoundation.org>, <andrzej.p@collabora.com>,
	<hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] media: rkvdec: Fix memset size error
Date: Fri, 17 Jun 2022 07:31:01 +0000
Message-ID: <20220617073101.101234-1-zhangzekun11@huawei.com>
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

'dma_alloc_coherent()' alloc a 'RKVDEC_VP9_COUNT_SIZE' size area to
'unsigned char *count_tbl', however, the memset() bellow only set
'sizeof(*count_tbl)', which equals to 1, bytes to zero. This can
 cause unexpected error.

Fixes: f25709c4ff15 ("media: rkvdec: Add the VP9 backend")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/staging/media/rkvdec/rkvdec-vp9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/media/rkvdec/rkvdec-vp9.c
index 311a12656072..3ad303a3de48 100644
--- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
+++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
@@ -1026,7 +1026,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 
 	vp9_ctx->count_tbl.size = RKVDEC_VP9_COUNT_SIZE;
 	vp9_ctx->count_tbl.cpu = count_tbl;
-	memset(count_tbl, 0, sizeof(*count_tbl));
+	memset(count_tbl, 0, RKVDEC_VP9_COUNT_SIZE);
 	rkvdec_init_v4l2_vp9_count_tbl(ctx);
 
 	return 0;
-- 
2.17.1

