Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC687A47;
	Fri, 11 Aug 2023 03:11:17 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RMSt92Km4z1L9Kn;
	Fri, 11 Aug 2023 10:49:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 10:50:17 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <TheSven73@gmail.com>, <gregkh@linuxfoundation.org>, <mripard@kernel.org>,
	<paul.kocialkowski@bootlin.com>, <mchehab@kernel.org>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<linux-staging@lists.linux.dev>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/2] media: staging: media: sunxi: cedrus: Remove redundant of_match_ptr()
Date: Fri, 11 Aug 2023 10:49:45 +0800
Message-ID: <20230811024945.2256437-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811024945.2256437-1-ruanjinjie@huawei.com>
References: <20230811024945.2256437-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 8e248d4a0aec..f52df6836045 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -708,7 +708,7 @@ static struct platform_driver cedrus_driver = {
 	.remove_new	= cedrus_remove,
 	.driver		= {
 		.name		= CEDRUS_NAME,
-		.of_match_table	= of_match_ptr(cedrus_dt_match),
+		.of_match_table	= cedrus_dt_match,
 		.pm		= &cedrus_dev_pm_ops,
 	},
 };
-- 
2.34.1

