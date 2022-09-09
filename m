Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59917E4
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 08:24:17 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MP88z15fSznVBV;
	Fri,  9 Sep 2022 16:21:39 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 9 Sep
 2022 16:24:15 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH v4 1/2] staging: rtl8723bs: Delete un-necessary return for _rtw_xmit_entry()
Date: Fri, 9 Sep 2022 16:20:47 +0800
Message-ID: <20220909082048.14486-2-guozihua@huawei.com>
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

As _rtw_xmit_entry() would always return 0, we are save to delete the
return value for it.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  3 ++-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c     | 15 +++++----------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index e781cd5dfd01..3c1391aef093 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -25,7 +25,7 @@ struct sta_xmit_priv;
 struct xmit_frame;
 struct xmit_buf;
 
-extern int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
+extern void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
 extern int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
 
 void rtw_os_xmit_schedule(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index cb6d287f580d..c97135185c71 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2084,7 +2084,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		memcpy(pdata + sizeof(dst_mac_addr), src_mac_addr, sizeof(src_mac_addr));
 
 		/* Use the real net device to transmit the packet */
-		return _rtw_xmit_entry(skb, padapter->pnetdev);
+		_rtw_xmit_entry(skb, padapter->pnetdev);
+		return NETDEV_TX_OK;
 
 	} else if ((frame_control & (IEEE80211_FCTL_FTYPE|IEEE80211_FCTL_STYPE)) ==
 		   (IEEE80211_FTYPE_MGMT|IEEE80211_STYPE_ACTION)) {
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 530e7a6c67c5..2b268aab4f88 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -181,7 +181,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 	return true;
 }
 
-int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
+void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 {
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -202,7 +202,7 @@ int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 		if (pxmitpriv->free_xmitframe_cnt > (NR_XMITFRAME / 4)) {
 			res = rtw_mlcst2unicst(padapter, pkt);
 			if (res)
-				goto exit;
+				return;
 		}
 	}
 
@@ -210,22 +210,17 @@ int _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	if (res < 0)
 		goto drop_packet;
 
-	goto exit;
+	return;
 
 drop_packet:
 	pxmitpriv->tx_drop++;
 	dev_kfree_skb_any(pkt);
-
-exit:
-	return 0;
 }
 
 int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 {
-	int ret = 0;
-
 	if (pkt)
-		ret = _rtw_xmit_entry(pkt, pnetdev);
+		_rtw_xmit_entry(pkt, pnetdev);
 
-	return ret;
+	return 0;
 }
-- 
2.17.1

