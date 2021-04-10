Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35E370
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 03:51:27 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FHLZX3gLPzNvHD;
	Sat, 10 Apr 2021 11:48:36 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Sat, 10 Apr 2021
 11:51:17 +0800
From: Bixuan Cui <cuibixuan@huawei.com>
To: <cuibixuan@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Allen Pais <apais@linux.microsoft.com>, Romain Perier
	<romain.perier@gmail.com>, Giovanni Gherdovich <bobdc9664@seznam.cz>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] staging: ralink-gdma: Add missing MODULE_DEVICE_TABLE
Date: Sat, 10 Apr 2021 11:50:37 +0800
Message-ID: <20210410035037.11322-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/staging/ralink-gdma/ralink-gdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
index 3c26b665ee7c..33e28ccf4d85 100644
--- a/drivers/staging/ralink-gdma/ralink-gdma.c
+++ b/drivers/staging/ralink-gdma/ralink-gdma.c
@@ -788,6 +788,7 @@ static const struct of_device_id gdma_of_match_table[] = {
 	{ .compatible = "ralink,rt3883-gdma", .data = &rt3883_gdma_data },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, gdma_of_match_table);
 
 static int gdma_dma_probe(struct platform_device *pdev)
 {

