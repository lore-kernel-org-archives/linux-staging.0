Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B311D36C
	for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 02:06:46 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MTvN23y3Yz14QTg;
	Sat, 17 Sep 2022 10:02:42 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 17 Sep 2022 10:06:43 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 17 Sep
 2022 10:06:42 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <gregkh@linuxfoundation.org>, <andy.shevchenko@gmail.com>,
	<ilpo.jarvinen@linux.intel.com>, <linux-staging@lists.linux.dev>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH v3 -next] staging: fwserial: Switch to kvfree_rcu() API
Date: Sat, 17 Sep 2022 10:41:08 +0800
Message-ID: <20220917024109.3611-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected

Instead of invoking a synchronize_rcu() to free a pointer after a grace
period, we can directly make use of new API that does the same but in
more efficient way.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/staging/fwserial/fwserial.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
index 81b06d88ed0d..ac2d625f0883 100644
--- a/drivers/staging/fwserial/fwserial.c
+++ b/drivers/staging/fwserial/fwserial.c
@@ -2117,8 +2117,7 @@ static void fwserial_remove_peer(struct fwtty_peer *peer)
 	if (port)
 		fwserial_release_port(port, true);
 
-	synchronize_rcu();
-	kfree(peer);
+	kvfree_rcu(peer);
 }
 
 /**
-- 
2.17.1

