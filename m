Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540956F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 10:05:22 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F9M0X5Jbhz9tVy;
	Wed, 31 Mar 2021 17:46:52 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Wed, 31 Mar 2021
 17:48:54 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
CC: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next] staging: greybus: camera: Switch to memdup_user_nul()
Date: Wed, 31 Mar 2021 17:52:01 +0800
Message-ID: <20210331095201.2173793-1-yangyingliang@huawei.com>
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
 drivers/staging/greybus/camera.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index b570e13394ac..0f005facffbc 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -1120,16 +1120,10 @@ static ssize_t gb_camera_debugfs_write(struct file *file,
 	if (len > 1024)
 		return -EINVAL;
 
-	kbuf = kmalloc(len + 1, GFP_KERNEL);
-	if (!kbuf)
+	kbuf = memdup_user_nul(buf, len);
+	if (IS_ERR(kbuf))
 		return -ENOMEM;
 
-	if (copy_from_user(kbuf, buf, len)) {
-		ret = -EFAULT;
-		goto done;
-	}
-
-	kbuf[len] = '\0';
 
 	ret = op->execute(gcam, kbuf, len);
 
-- 
2.25.1

