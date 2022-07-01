Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8C1855
	for <linux-staging@lists.linux.dev>; Fri,  1 Jul 2022 09:42:20 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LZ9Dd5pvYzkWN0;
	Fri,  1 Jul 2022 17:40:49 +0800 (CST)
Received: from dggpeml500019.china.huawei.com (7.185.36.137) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 17:42:11 +0800
Received: from huawei.com (10.175.112.208) by dggpeml500019.china.huawei.com
 (7.185.36.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Jul
 2022 17:42:11 +0800
From: Huang Zetao <huangzetao1@huawei.com>
To: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<paskripkin@gmail.com>, <gregkh@linuxfoundation.org>,
	<huangzetao1@huawei.com>
CC: <straube.linux@gmail.com>, <martin@kaiser.cx>, <abdun.nihaal@gmail.com>,
	<linux-staging@lists.linux.dev>, <inux-kernel@vger.kernel.org>
Subject: [PATCH -next v2] staging: r8188eu: Use eth_broadcast_addr() to assign broadcast address
Date: Fri, 1 Jul 2022 09:40:11 +0000
Message-ID: <20220701094011.81163-1-huangzetao1@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500019.china.huawei.com (7.185.36.137)
X-CFilter-Loop: Reflected

Using eth_broadcast_addr() to assign broadcast address instead of memset().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Huang Zetao <huangzetao1@huawei.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 047e9c7d38c3..b9c0b7ee05f1 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1823,7 +1823,7 @@ static int rtw_wx_set_enc_ext(struct net_device *dev,
 		return -ENOMEM;
 
 	param->cmd = IEEE_CMD_SET_ENCRYPTION;
-	memset(param->sta_addr, 0xff, ETH_ALEN);
+	eth_broadcast_addr(param->sta_addr);
 
 	switch (pext->alg) {
 	case IW_ENCODE_ALG_NONE:
-- 
2.17.1

