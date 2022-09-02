Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A17E
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 08:08:32 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJr5x0GmpzYd8m;
	Fri,  2 Sep 2022 16:04:05 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:08:30 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <Larry.Finger@lwfinger.net>,
	<florian.c.schilhabel@googlemail.com>
Subject: [PATCH] staging: rtl8712: Fix return type for implementation
Date: Fri, 2 Sep 2022 16:05:08 +0800
Message-ID: <20220902080508.56797-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

Since Linux now supports CFI, it will be a good idea to fix mismatched
return type for implementation of hooks. Otherwise this might get
cought out by CFI and cause a panic.

Use enums from netdev_tx_t as return value instead, then change return
type to netdev_tx_t.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/staging/rtl8712/xmit_linux.c | 6 +++---
 drivers/staging/rtl8712/xmit_osdep.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 4a93839bf947..e84b9fa231cd 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -140,7 +140,7 @@ void r8712_xmit_complete(struct _adapter *padapter, struct xmit_frame *pxframe)
 	pxframe->pkt = NULL;
 }
 
-int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
+netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
 {
 	struct xmit_frame *xmitframe = NULL;
 	struct _adapter *adapter = netdev_priv(netdev);
@@ -165,11 +165,11 @@ int r8712_xmit_entry(_pkt *pkt, struct  net_device *netdev)
 	}
 	xmitpriv->tx_pkts++;
 	xmitpriv->tx_bytes += xmitframe->attrib.last_txcmdsz;
-	return 0;
+	return NETDEV_TX_OK;
 _xmit_entry_drop:
 	if (xmitframe)
 		r8712_free_xmitframe(xmitpriv, xmitframe);
 	xmitpriv->tx_drop++;
 	dev_kfree_skb_any(pkt);
-	return 0;
+	return NETDEV_TX_OK;
 }
diff --git a/drivers/staging/rtl8712/xmit_osdep.h b/drivers/staging/rtl8712/xmit_osdep.h
index b76021b568f8..1ad42658c883 100644
--- a/drivers/staging/rtl8712/xmit_osdep.h
+++ b/drivers/staging/rtl8712/xmit_osdep.h
@@ -34,7 +34,7 @@ struct sta_xmit_priv;
 struct xmit_frame;
 struct xmit_buf;
 
-int r8712_xmit_entry(_pkt *pkt, struct  net_device *pnetdev);
+netdev_tx_t r8712_xmit_entry(_pkt *pkt, struct  net_device *pnetdev);
 void r8712_SetFilter(struct work_struct *work);
 int r8712_xmit_resource_alloc(struct _adapter *padapter,
 			      struct xmit_buf *pxmitbuf);
-- 
2.17.1

