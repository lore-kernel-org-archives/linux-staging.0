Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A8EB30
	for <linux-staging@lists.linux.dev>; Tue,  6 Dec 2022 01:53:38 +0000 (UTC)
Received: from dggpemm500013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NR3Hj5n09zqSwd;
	Tue,  6 Dec 2022 09:49:21 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 09:53:30 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <chenzhongjin@huawei.com>, <martyn@welchs.me.uk>,
	<manohar.vanga@gmail.com>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>
Subject: [PATCH -next] vme: Use root_device_register() not underlined version
Date: Tue, 6 Dec 2022 09:50:33 +0800
Message-ID: <20221206015033.125827-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected

root_device_register and __root_device_register have exactly same
effect. Use the not underlined version to keep usage consistency.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 1ee432c223e2..0b6a91125846 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1072,7 +1072,7 @@ static int __init fake_init(void)
 	struct vme_lm_resource *lm;
 
 	/* We need a fake parent device */
-	vme_root = __root_device_register("vme", THIS_MODULE);
+	vme_root = root_device_register("vme");
 	if (IS_ERR(vme_root))
 		return PTR_ERR(vme_root);
 
-- 
2.17.1

