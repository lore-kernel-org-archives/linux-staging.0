Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D870
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 03:14:56 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9pCq5LmpzjXWd;
	Thu,  1 Apr 2021 11:13:11 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Thu, 1 Apr 2021
 11:14:50 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
CC: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next v2] staging: greybus: camera: Switch to memdup_user_nul()
Date: Thu, 1 Apr 2021 11:17:52 +0800
Message-ID: <20210401031752.2861248-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected

Use memdup_user_nul() helper instead of open-coding to
simplify the code.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/greybus/camera.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index b570e13394ac..2ecdc1bc5092 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -1120,16 +1120,9 @@ static ssize_t gb_camera_debugfs_write(struct file *file,
 	if (len > 1024)
 		return -EINVAL;
 
-	kbuf = kmalloc(len + 1, GFP_KERNEL);
-	if (!kbuf)
-		return -ENOMEM;
-
-	if (copy_from_user(kbuf, buf, len)) {
-		ret = -EFAULT;
-		goto done;
-	}
-
-	kbuf[len] = '\0';
+	kbuf = memdup_user_nul(buf, len);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);;
 
 	ret = op->execute(gcam, kbuf, len);
 
-- 
2.25.1

