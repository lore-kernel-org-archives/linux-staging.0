Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AAA3D;
	Fri, 11 Aug 2023 02:50:19 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RMSt737FhzrRy0;
	Fri, 11 Aug 2023 10:49:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 10:50:16 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <TheSven73@gmail.com>, <gregkh@linuxfoundation.org>, <mripard@kernel.org>,
	<paul.kocialkowski@bootlin.com>, <mchehab@kernel.org>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<linux-staging@lists.linux.dev>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/2] staging: fieldbus: arcx-anybus: Remove redundant of_match_ptr()
Date: Fri, 11 Aug 2023 10:49:44 +0800
Message-ID: <20230811024945.2256437-2-ruanjinjie@huawei.com>
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
 drivers/staging/fieldbus/anybuss/arcx-anybus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fieldbus/anybuss/arcx-anybus.c b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
index be28165b4f05..6f69758a8b27 100644
--- a/drivers/staging/fieldbus/anybuss/arcx-anybus.c
+++ b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
@@ -343,7 +343,7 @@ static struct platform_driver controller_driver = {
 	.remove_new = controller_remove,
 	.driver		= {
 		.name   = "arcx-anybus-controller",
-		.of_match_table	= of_match_ptr(controller_of_match),
+		.of_match_table	= controller_of_match,
 	},
 };
 
-- 
2.34.1

