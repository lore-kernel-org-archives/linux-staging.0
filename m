Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4A2C8B
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 03:02:48 +0000 (UTC)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((LNX1044)) with ASMTP (SSL) id PCA00130;
        Fri, 22 Oct 2021 10:56:30 +0800
Received: from localhost.localdomain (10.200.104.119) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server id
 15.1.2308.14; Fri, 22 Oct 2021 10:55:57 +0800
From: Kai Song <songkai01@inspur.com>
To: <gregkh@linuxfoundation.org>
CC: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Kai Song <songkai01@inspur.com>
Subject: [PATCH] staging: r8188eu: Use memdup_user instead of kmalloc/copy_from_user
Date: Fri, 22 Oct 2021 10:55:55 +0800
Message-ID: <20211022025555.6612-1-songkai01@inspur.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.119]
tUid: 20211022105630129e2bae6274888de4809c42d710a487
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Use memdup_user helper instead of open-coding to simplify
the code.

Signed-off-by: Kai Song <songkai01@inspur.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 0201f6fbeb25..96a08cc5a1ed 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1984,14 +1984,10 @@ static int rtw_wx_read32(struct net_device *dev,
 	padapter = (struct adapter *)rtw_netdev_priv(dev);
 	p = &wrqu->data;
 	len = p->length;
-	ptmp = kmalloc(len, GFP_KERNEL);
-	if (!ptmp)
-		return -ENOMEM;
 
-	if (copy_from_user(ptmp, p->pointer, len)) {
-		kfree(ptmp);
-		return -EFAULT;
-	}
+	ptmp = memdup_user(p->pointer, len);
+	if (IS_ERR(ptmp))
+		return PTR_ERR(ptmp);
 
 	bytes = 0;
 	addr = 0;
-- 
2.27.0

