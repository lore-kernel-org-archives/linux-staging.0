Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273C3FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:16:28 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UomJvBZ_1631956239;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UomJvBZ_1631956239)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 18 Sep 2021 17:10:42 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] staging: r8188eu: Remove unneeded if-null-free check
Date: Sat, 18 Sep 2021 17:10:06 +0800
Message-Id: <1631956206-83175-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Eliminate the following coccicheck warning:

./drivers/staging/r8188eu/os_dep/usb_intf.c:545:3-8: WARNING: NULL check
before some freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index d04d2f65..7e42a0a 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -541,9 +541,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	if (status != _SUCCESS) {
 		if (pnetdev)
 			rtw_free_netdev(pnetdev);
-		else if (padapter)
-			vfree(padapter);
-		padapter = NULL;
+		vfree(padapter);
 	}
 exit:
 	return padapter;
-- 
1.8.3.1

