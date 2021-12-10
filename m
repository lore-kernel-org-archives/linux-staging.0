Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957832C80
	for <linux-staging@lists.linux.dev>; Fri, 10 Dec 2021 09:37:28 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R401e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0V-8qBbc_1639129023;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0V-8qBbc_1639129023)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 10 Dec 2021 17:37:25 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH v2] staging: r8188eu: Use strndup_user instead of kmalloc/copy_from_user
Date: Fri, 10 Dec 2021 17:37:01 +0800
Message-Id: <20211210093701.55559-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code assumes that the user is going to give us a NULL terminated
string which is not necessarily true.  The original code was buggy too.

Fix following coccicheck warning:

./drivers/staging/r8188eu/os_dep/ioctl_linux.c:4253:8-15: WARNING
opportunity for memdup_user.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 7bdedfef085b ("staging: r8188eu: Remove mp, a.k.a. manufacturing process, code")
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -For the follow advice:https://lore.kernel.org/lkml/20211210083010.GM1956@kadam/

 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 56adfe4087a8..5d26dffe5c0d 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4250,17 +4250,12 @@ static int rtw_test(
 	DBG_88E("+%s\n", __func__);
 	len = wrqu->data.length;
 
-	pbuf = kzalloc(len, GFP_KERNEL);
-	if (!pbuf) {
-		DBG_88E("%s: no memory!\n", __func__);
-		return -ENOMEM;
-	}
-
-	if (copy_from_user(pbuf, wrqu->data.pointer, len)) {
-		kfree(pbuf);
+	pbuf = strndup_user(wrqu->data.pointer, len);
+	if (IS_ERR(pbuf)) {
 		DBG_88E("%s: copy from user fail!\n", __func__);
-		return -EFAULT;
+		return PTR_ERR(pbuf);
 	}
+
 	DBG_88E("%s: string =\"%s\"\n", __func__, pbuf);
 
 	ptmp = (char *)pbuf;
-- 
2.20.1.7.g153144c

