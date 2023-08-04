Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF077846C
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 08:41:37 +0000 (UTC)
Received: from dggpemm100003.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHJy84Bc5ztRp0;
	Fri,  4 Aug 2023 16:38:08 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100003.china.huawei.com (7.185.36.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 16:41:32 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 16:41:31 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <hdegoede@redhat.com>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next 2/2] staging: rtl8723bs: use is_broadcast_ether_addr() instead of memcmp()
Date: Fri, 4 Aug 2023 16:38:41 +0800
Message-ID: <20230804083841.1321554-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804083841.1321554-1-yangyingliang@huawei.com>
References: <20230804083841.1321554-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

Use is_broadcast_ether_addr() instead of memcmp to check
if the ethernet address is broadcast address.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        | 3 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 6 ++----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 6 ++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index d30d6e6bcd07..e4063713fecc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1238,7 +1238,6 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 	struct __queue	*pacl_node_q = &pacl_list->acl_node_q;
-	u8 baddr[ETH_ALEN] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };	/* Baddr is used for clearing acl_list */
 
 	spin_lock_bh(&(pacl_node_q->lock));
 
@@ -1248,7 +1247,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 
 		if (
 			!memcmp(paclnode->addr, addr, ETH_ALEN) ||
-			!memcmp(baddr, addr, ETH_ALEN)
+			is_broadcast_ether_addr(addr)
 		) {
 			if (paclnode->valid) {
 				paclnode->valid = false;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 1148c9829890..985683767a40 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -421,13 +421,12 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 
 static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, union recv_frame *precv_frame)
 {
-	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 
 	if (ptable->func) {
 		/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
 		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-		    memcmp(GetAddr1Ptr(pframe), bc_addr, ETH_ALEN))
+		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
 			return;
 
 		ptable->func(padapter, precv_frame);
@@ -439,7 +438,6 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	int index;
 	struct mlme_handler *ptable;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
 	struct dvobj_priv *psdpriv = padapter->dvobj;
@@ -450,7 +448,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
 	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-		memcmp(GetAddr1Ptr(pframe), bc_addr, ETH_ALEN)) {
+	    !is_broadcast_ether_addr(GetAddr1Ptr(pframe))) {
 		return;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index ba39c8b1a9ae..7fac9ca3e9a0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1779,10 +1779,9 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta)
 {
 	int i;
-	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
-	if (!memcmp(psta->hwaddr, bc_addr, ETH_ALEN))
+	if (is_broadcast_ether_addr(psta->hwaddr))
 		return;
 
 	if (!memcmp(psta->hwaddr, myid(&padapter->eeprompriv), ETH_ALEN)) {
@@ -1807,10 +1806,9 @@ void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta)
 
 void rtw_release_macid(struct adapter *padapter, struct sta_info *psta)
 {
-	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
-	if (!memcmp(psta->hwaddr, bc_addr, ETH_ALEN))
+	if (is_broadcast_ether_addr(psta->hwaddr))
 		return;
 
 	if (!memcmp(psta->hwaddr, myid(&padapter->eeprompriv), ETH_ALEN))
-- 
2.25.1

