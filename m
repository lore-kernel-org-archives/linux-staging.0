Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD66D0D
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 08:17:18 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGDZp14djz1BFjT;
	Thu,  8 Apr 2021 16:14:58 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 16:17:00 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <gregkh@linuxfoundation.org>, <marcocesati@gmail.com>,
	<ross.schm.dev@gmail.com>
CC: <linux-staging@lists.linux.dev>, Tian Tao <tiantao6@hisilicon.com>,
	"Zhiqi Song" <songzhiqi1@huawei.com>
Subject: [PATCH] staging: rtl8723bs: remove unused including <linux/version.h>
Date: Thu, 8 Apr 2021 16:17:25 +0800
Message-ID: <1617869845-43046-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected

Remove including <linux/version.h> that don't need it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h      | 1 -
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index cec8d5a..19da27f 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -14,7 +14,6 @@
 #ifndef __DRV_TYPES_H__
 #define __DRV_TYPES_H__
 
-#include <linux/version.h>
 #include <linux/sched/signal.h>
 #include <autoconf.h>
 #include <basic_types.h>
diff --git a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
index 7c86d05..993a7b3 100644
--- a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
+++ b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
@@ -7,8 +7,6 @@
 #ifndef __IOCTL_CFG80211_H__
 #define __IOCTL_CFG80211_H__
 
-#include <linux/version.h>
-
 struct rtw_wdev_invit_info {
 	u8 state; /* 0: req, 1:rep */
 	u8 peer_mac[ETH_ALEN];
-- 
2.7.4

