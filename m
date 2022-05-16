Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C94EA9
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 10:21:24 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 16 May
 2022 18:20:06 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 16 May
 2022 18:20:05 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Haowen Bai <baihaowen@meizu.com>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: rtl8192e: remove null check after call container_of()
Date: Mon, 16 May 2022 18:20:03 +0800
Message-ID: <1652696403-17852-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

container_of() will never return NULL, so remove useless code.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index aab131bdb052..b5f4d35954a9 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2056,8 +2056,6 @@ static inline void rtllib_sta_ps(struct work_struct *work)
 	unsigned long flags, flags2;
 
 	ieee = container_of(work, struct rtllib_device, ps_task);
-	if (!ieee)
-		return;
 
 	spin_lock_irqsave(&ieee->lock, flags);
 
-- 
2.7.4

