Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62FF2CA4
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 09:43:58 +0000 (UTC)
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J3vGy2cGPzZdHh;
	Wed,  1 Dec 2021 17:41:14 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 17:43:55 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 17:43:55 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <paskripkin@gmail.com>,
	<dan.carpenter@oracle.com>
Subject: [PATCH -next 3/3] staging: rtl8192e: rtllib_module: remove unnecessary assignment
Date: Wed, 1 Dec 2021 17:50:36 +0800
Message-ID: <20211201095036.1763163-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201095036.1763163-1-yangyingliang@huawei.com>
References: <20211201095036.1763163-1-yangyingliang@huawei.com>
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
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected

Remove the null pointer assignment after freeing 'ieee->pHTInfo'.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/rtl8192e/rtllib_module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index a3c74fa25cfa..52d1c3f5f3aa 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -161,7 +161,6 @@ void free_rtllib(struct net_device *dev)
 				      netdev_priv_rsl(dev);
 
 	kfree(ieee->pHTInfo);
-	ieee->pHTInfo = NULL;
 	rtllib_softmac_free(ieee);
 
 	lib80211_crypt_info_free(&ieee->crypt_info);
-- 
2.25.1

