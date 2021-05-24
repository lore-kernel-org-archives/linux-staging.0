Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF382FAD
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 13:25:06 +0000 (UTC)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FpdD04hyXzwSXc;
	Mon, 24 May 2021 21:22:08 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 21:24:58 +0800
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 21:24:58 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, Rui Miguel Silva <rmfrfs@gmail.com>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Steve Longerbeam
	<slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
	Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] media: imx: imx7_mipi_csis: Fix error return code in mipi_csis_async_register()
Date: Mon, 24 May 2021 13:35:51 +0000
Message-ID: <20210524133552.2365248-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected

Fix to return negative error code -EINVAL from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 88fc81388df9 ("media: imx: imx7_mipi_csis: Reject invalid data-lanes settings")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index d573f3475d28..9cd3c86fee58 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1175,6 +1175,7 @@ static int mipi_csis_async_register(struct csi_state *state)
 		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
 			dev_err(state->dev,
 				"data lanes reordering is not supported");
+			ret = -EINVAL;
 			goto err_parse;
 		}
 	}

