Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508034C6A
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 13:09:01 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MWPzB15VDz14QgR;
	Mon, 19 Sep 2022 21:04:54 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 21:08:58 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 21:08:57 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <gregkh@linuxfoundation.org>, <andy.shevchenko@gmail.com>,
	<ilpo.jarvinen@linux.intel.com>, <linux-staging@lists.linux.dev>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH -next v5] staging: fwserial: Switch to kfree_rcu() API
Date: Mon, 19 Sep 2022 21:43:19 +0800
Message-ID: <20220919134319.32282-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected

Instead of invoking a synchronize_rcu() to free a pointer after a grace
period, we can directly make use of a new API that does the same but in
a more efficient way.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
Changelog:
v3: the first version of the PATCH
v1: v3 resent as v1
v2: use kfree_rcu() instead of kvfree_rcu() for clarity
v4: resend v2 as v4 to avoid versioning confusion
v5: add the rcu_head of fwtty_peer as the input param for wider usage
---
 drivers/staging/fwserial/fwserial.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
index 81b06d88ed0d..15e85fa8af07 100644
--- a/drivers/staging/fwserial/fwserial.c
+++ b/drivers/staging/fwserial/fwserial.c
@@ -2117,8 +2117,7 @@ static void fwserial_remove_peer(struct fwtty_peer *peer)
 	if (port)
 		fwserial_release_port(port, true);
 
-	synchronize_rcu();
-	kfree(peer);
+	kfree_rcu(peer, rcu);
 }
 
 /**
-- 
2.17.1

