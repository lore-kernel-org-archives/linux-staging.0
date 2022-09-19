Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B07E9
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 02:23:41 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MW7hk2M3mzHntk;
	Mon, 19 Sep 2022 10:21:26 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 10:23:33 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 10:23:32 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <gregkh@linuxfoundation.org>, <andy.shevchenko@gmail.com>,
	<ilpo.jarvinen@linux.intel.com>, <linux-staging@lists.linux.dev>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH -next v2] staging: fwserial: Switch to kfree_rcu() API
Date: Mon, 19 Sep 2022 10:57:55 +0800
Message-ID: <20220919025755.32372-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected

Instead of invoking a synchronize_rcu() to free a pointer after a grace
period, we can directly make use of a new API that does the same but in
a more efficient way.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
Changes in v2:
- Use kfree_rcu() instead of kvfree_rcu() for clarity
---
 drivers/staging/fwserial/fwserial.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
index 81b06d88ed0d..8d2b4ed1f39e 100644
--- a/drivers/staging/fwserial/fwserial.c
+++ b/drivers/staging/fwserial/fwserial.c
@@ -2117,8 +2117,7 @@ static void fwserial_remove_peer(struct fwtty_peer *peer)
 	if (port)
 		fwserial_release_port(port, true);
 
-	synchronize_rcu();
-	kfree(peer);
+	kfree_rcu(peer);
 }
 
 /**
-- 
2.17.1

