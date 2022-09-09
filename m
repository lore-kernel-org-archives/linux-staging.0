Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7067E3
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 08:29:18 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MP87X34bVz14QMC;
	Fri,  9 Sep 2022 16:20:24 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 9 Sep
 2022 16:24:15 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH v4 2/2] staging: rtl8723bs: Fix return type for implementation of ndo_start_xmit
Date: Fri, 9 Sep 2022 16:20:48 +0800
Message-ID: <20220909082048.14486-3-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220909082048.14486-1-guozihua@huawei.com>
References: <20220909082048.14486-1-guozihua@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

CFI (Control Flow Integrity) is a safety feature allowing the system to
detect and react should a potential control flow hijacking occurs. In
particular, the Forward-Edge CFI protects indirect function calls by
ensuring the prototype of function that is actually called matches the
definition of the function hook.

Since Linux now supports CFI, it will be a good idea to fix mismatched
return type for implementation of hooks. Otherwise this would get
cought out by CFI and cause a panic.

Use enums from netdev_tx_t as return value instead. Then change return
type to netdev_tx_t.

Fixes: cf68fffb66d6 ("add support for Clang CFI")
Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 3c1391aef093..8704dced593a 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -26,7 +26,7 @@ struct xmit_frame;
 struct xmit_buf;
 
 extern void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
-extern int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
+extern netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
 
 void rtw_os_xmit_schedule(struct adapter *padapter);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 2b268aab4f88..1eeabfffd6d2 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -217,10 +217,10 @@ void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	dev_kfree_skb_any(pkt);
 }
 
-int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 {
 	if (pkt)
 		_rtw_xmit_entry(pkt, pnetdev);
 
-	return 0;
+	return NETDEV_TX_OK;
 }
-- 
2.17.1

