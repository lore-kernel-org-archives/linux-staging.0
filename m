Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1717262D
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 08:49:26 +0000 (UTC)
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NFPHy2gbhzFqLm;
	Sun, 20 Nov 2022 16:46:06 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 16:49:19 +0800
Received: from localhost.localdomain (10.175.112.70) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 16:49:18 +0800
From: Zhang Changzhong <zhangchangzhong@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Won Kang
	<wkang77@gmail.com>
CC: Zhang Changzhong <zhangchangzhong@huawei.com>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: gdm724x: fix potential memleak in register_lte_device()
Date: Sun, 20 Nov 2022 17:08:35 +0800
Message-ID: <1668935315-40471-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected

The register_lte_device() forgets to free the current netdev in case of
register_netdev() fails, add free_netdev() to fix it.

Compile tested only.

Fixes: 61e121047645 ("staging: gdm7240: adding LTE USB driver")
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/staging/gdm724x/gdm_lte.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index 671ee88..34ac9e0 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -905,8 +905,10 @@ int register_lte_device(struct phy_dev *phy_dev,
 		SET_NETDEV_DEVTYPE(net, &wwan_type);
 
 		ret = register_netdev(net);
-		if (ret)
+		if (ret) {
+			free_netdev(net);
 			goto err;
+		}
 
 		netif_carrier_on(net);
 
-- 
2.9.5

