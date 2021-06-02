Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BB770
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 01:32:12 +0000 (UTC)
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FvrzT3cVXzYsPN;
	Wed,  2 Jun 2021 09:29:25 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 dggeme760-chm.china.huawei.com (10.3.19.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:32:08 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>, Zheng
 Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] media: atomisp: Remove unneeded if-null-free check
Date: Wed, 2 Jun 2021 09:45:47 +0800
Message-ID: <20210602014547.4135423-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme760-chm.china.huawei.com (10.3.19.106)
X-CFilter-Loop: Reflected

Eliminate the following coccicheck warning:

drivers/staging/media/atomisp/pci/sh_css_firmware.c:367:4-10: WARNING:
NULL check before some freeing functions is not needed.
drivers/staging/media/atomisp/pci/sh_css_firmware.c:369:4-10: WARNING:
NULL check before some freeing functions is not needed.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index f4ce8ace9d50..5301cc014c7e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			if (fw_minibuffer[i].name)
-				kfree((void *)fw_minibuffer[i].name);
-			if (fw_minibuffer[i].buffer)
-				kvfree(fw_minibuffer[i].buffer);
+			kfree((void *)fw_minibuffer[i].name);
+			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
 		fw_minibuffer = NULL;
-- 
2.25.1

