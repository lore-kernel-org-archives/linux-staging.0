Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D95675
	for <linux-staging@lists.linux.dev>; Fri, 11 Aug 2023 09:20:40 +0000 (UTC)
Received: from dggpemm100003.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RMdVb4g76zqSgF;
	Fri, 11 Aug 2023 17:17:43 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100003.china.huawei.com (7.185.36.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 17:20:35 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 17:20:35 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next] staging: ks7010: remove unnecessary sdio_set_drvdata() function
Date: Fri, 11 Aug 2023 17:17:36 +0800
Message-ID: <20230811091736.887120-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

The driver data will be cleared in device_unbind_cleanup() in driver
core code. So the sdio_set_drvdata(..., NULL) called in remove and
error path in probe can be removed.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 9fb118e77a1f..74a0ad787f4a 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -1044,7 +1044,6 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	sdio_disable_func(func);
  err_free_card:
 	sdio_release_host(func);
-	sdio_set_drvdata(func, NULL);
 	kfree(card);
 
 	return -ENODEV;
@@ -1118,7 +1117,6 @@ static void ks7010_sdio_remove(struct sdio_func *func)
 	sdio_disable_func(func);
 	sdio_release_host(func);
 err_free_card:
-	sdio_set_drvdata(func, NULL);
 	kfree(card);
 }
 
-- 
2.25.1

