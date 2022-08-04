Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AFF7F4
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 07:30:33 +0000 (UTC)
Received: from BC-Mail-Ex12.internal.baidu.com (unknown [172.31.51.52])
	by Forcepoint Email with ESMTPS id A27095D7B2DF4A6C3D1C;
	Thu,  4 Aug 2022 15:14:59 +0800 (CST)
Received: from bjkjy-mail-ex28.internal.baidu.com (172.31.50.44) by
 BC-Mail-Ex12.internal.baidu.com (172.31.51.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Thu, 4 Aug 2022 15:15:02 +0800
Received: from ThinkStation-P340.baidu.com (172.31.63.8) by
 bjkjy-mail-ex28.internal.baidu.com (172.31.50.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.18; Thu, 4 Aug 2022 15:15:01 +0800
From: Chen Shi <shichen01@baidu.com>
To: <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>, Chen Shi
	<shichen01@baidu.com>
Subject: [PATCH] media: staging: media: imx: imx7-media-utils: Fix a coding style problem
Date: Thu, 4 Aug 2022 15:10:46 +0800
Message-ID: <20220804071046.31520-1-shichen01@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex28.internal.baidu.com (172.31.51.22) To
 bjkjy-mail-ex28.internal.baidu.com (172.31.50.44)

Add parentheses to enclose macros with complex values.

Signed-off-by: Chen Shi <shichen01@baidu.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 294c808b2ebe..c94013175181 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -7,7 +7,7 @@
 #include <linux/module.h>
 #include "imx-media.h"
 
-#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
+#define IMX_BUS_FMTS(fmt...) {(const u32[]) {fmt, 0}}
 
 /*
  * List of supported pixel formats for the subdevs.
-- 
2.17.1

