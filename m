Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724677E
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 08:20:18 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJrNc74WSzlVn2;
	Fri,  2 Sep 2022 16:16:48 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:20:16 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <linux-staging@lists.linux.dev>
CC: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<paskripkin@gmail.com>
Subject: [RESEND PATCH] staging: r8188eu: Fix return type for implementation of ndo_start_xmit
Date: Fri, 2 Sep 2022 16:16:53 +0800
Message-ID: <20220902081653.60682-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

Since Linux now supports CFI, it will be a good idea to fix mismatched
return type for implementation of hooks. Otherwise this might get
cought out by CFI and cause a panic.

Use enums from netdev_tx_t as return value instead, then change return
type to netdev_tx_t.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 00658681fef9..947242486144 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -28,7 +28,7 @@ struct sta_xmit_priv;
 struct xmit_frame;
 struct xmit_buf;
 
-int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
 
 void rtw_os_xmit_schedule(struct adapter *padapter);
 
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 91a1e4e3219a..0b04010d6d82 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -198,7 +198,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 	return true;
 }
 
-int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
 {
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -233,5 +233,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
 
 exit:
 
-	return 0;
+	return NETDEV_TX_OK;
 }
-- 
2.17.1

