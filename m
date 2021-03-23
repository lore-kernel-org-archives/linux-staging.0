Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051805F
	for <linux-staging@lists.linux.dev>; Tue, 23 Mar 2021 02:08:32 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UT0bCyD_1616464951;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UT0bCyD_1616464951)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Mar 2021 10:02:40 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] media: staging: media: Remove redundant NULL check
Date: Tue, 23 Mar 2021 10:02:30 +0800
Message-Id: <1616464950-61009-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Fix the following coccicheck warnings:

./drivers/staging/media/atomisp/pci/atomisp_cmd.c:4269:2-8: WARNING:
NULL check before some freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 592ea99..d818eaa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4626,8 +4626,7 @@ int atomisp_fixed_pattern(struct atomisp_sub_device *asd, int flag,
 err:
 	if (ret && res)
 		ia_css_frame_free(res);
-	if (tmp_buf)
-		vfree(tmp_buf);
+	vfree(tmp_buf);
 	if (ret == 0)
 		*result = res;
 	return ret;
-- 
1.8.3.1

