Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B63C26
	for <linux-staging@lists.linux.dev>; Thu, 22 Sep 2022 13:52:07 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYGnc1x8MzWgt3;
	Thu, 22 Sep 2022 21:48:04 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:52:01 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:52:01 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH] staging: pi433: use DEFINE_SHOW_ATTRIBUTE to simplify pi433_debugfs_regs
Date: Thu, 22 Sep 2022 22:25:48 +0800
Message-ID: <20220922142548.3248951-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/staging/pi433/pi433_if.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index df02335fdbab..d4e06a3929f3 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1149,19 +1149,7 @@ static int pi433_debugfs_regs_show(struct seq_file *m, void *p)
 
 	return ret;
 }
-
-static int pi433_debugfs_regs_open(struct inode *inode, struct file *filp)
-{
-	return single_open(filp, pi433_debugfs_regs_show, inode->i_private);
-}
-
-static const struct file_operations debugfs_fops = {
-	.llseek =	seq_lseek,
-	.open =		pi433_debugfs_regs_open,
-	.owner =	THIS_MODULE,
-	.read =		seq_read,
-	.release =	single_release
-};
+DEFINE_SHOW_ATTRIBUTE(pi433_debugfs_regs);
 
 /*-------------------------------------------------------------------------*/
 
@@ -1320,7 +1308,7 @@ static int pi433_probe(struct spi_device *spi)
 
 	entry = debugfs_create_dir(dev_name(device->dev),
 				   debugfs_lookup(KBUILD_MODNAME, NULL));
-	debugfs_create_file("regs", 0400, entry, device, &debugfs_fops);
+	debugfs_create_file("regs", 0400, entry, device, &pi433_debugfs_regs_fops);
 
 	return 0;
 
-- 
2.25.1

