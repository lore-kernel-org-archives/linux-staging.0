Received: from mail-m121142.qiye.163.com (mail-m121142.qiye.163.com [115.236.121.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207E70
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 11:49:16 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.229])
	by mail-m121142.qiye.163.com (Hmail) with ESMTPA id 4069B809CC;
	Tue, 18 May 2021 19:49:13 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH] staging: media: zoran: fix some formatting issues
Date: Tue, 18 May 2021 19:49:08 +0800
Message-Id: <1621338548-12077-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZGhoaHlZOQk1DQkkaQ0tCGhlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRA6MSo6SD8VSis6DjQRGjUw
	URYwCjVVSlVKTUlKSEhDTk5IQklKVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
	SU5LVUpMTVVJSUJZV1kIAVlBSUlOSTcG
X-HM-Tid: 0a797f4efcf1b037kuuu4069b809cc
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

fixing WARNING: Possible repeated word: 'in' as "in in a VIDIOCSFBUF ioctl",
limit the number of words per line.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/staging/media/zoran/zoran_card.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index dfc60e2..f259585
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -37,9 +37,10 @@ module_param_array(card, int, NULL, 0444);
 MODULE_PARM_DESC(card, "Card type");
 
 /*
- * The video mem address of the video card. The driver has a little database for some videocards
- * to determine it from there. If your video card is not in there you have either to give it to
- * the driver as a parameter or set in in a VIDIOCSFBUF ioctl
+ * The video mem address of the video card. The driver has a little database
+ * for some videocards to determine it from there. If your video card is not
+ * in there you have either to give it to the driver as a parameter or set
+ * in a VIDIOCSFBUF ioctl
  */
 
 static unsigned long vidmem;	/* default = 0 - Video memory base address */
-- 
2.7.4

