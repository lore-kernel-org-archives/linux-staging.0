Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC09D7E
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 08:09:41 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJr844dN1zkWrC;
	Fri,  2 Sep 2022 16:05:56 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:09:38 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8723bs: Fix return type for implementation
Date: Fri, 2 Sep 2022 16:06:14 +0800
Message-ID: <20220902080614.57352-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

Since Linux now supports CFI, it will be a good idea to fix mismatched
return type for implementation of hooks. Otherwise this might get
cought out by CFI and cause a panic.

As returns from _rtw_xmit_entry() would always be 0, remove unneeded
variable ret and use enums from netdev_tx_t as return value instead.
Then change return type to netdev_tx_t.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index e781cd5dfd01..7ac8cf589f90 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -26,7 +26,7 @@ struct xmit_frame;
 struct xmit_buf;
 
 extern int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
-extern int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
+extern netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
 
 void rtw_os_xmit_schedule(struct adapter *padapter);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 530e7a6c67c5..d42fd0878dcd 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -220,12 +220,10 @@ int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	return 0;
 }
 
-int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 {
-	int ret = 0;
-
 	if (pkt)
-		ret = _rtw_xmit_entry(pkt, pnetdev);
+		_rtw_xmit_entry(pkt, pnetdev);
 
-	return ret;
+	return NETDEV_TX_OK;
 }
-- 
2.17.1

