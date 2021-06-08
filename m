Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0C32FB1
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 14:03:26 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fzrvw1F7Wz6ttS;
	Tue,  8 Jun 2021 21:40:12 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 21:44:02 +0800
Received: from huawei.com (10.175.113.32) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 8 Jun 2021
 21:44:02 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Liu
 Shixin" <liushixin2@huawei.com>
Subject: [PATCH -next 2/2] staging: r8188eu: use eth_broadcast_addr() to assign broadcast address
Date: Tue, 8 Jun 2021 22:16:20 +0800
Message-ID: <20210608141620.525521-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected

Use eth_broadcast_addr() to assign broadcast address.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 8c1bc04dd830..119110a150b2 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -315,7 +315,6 @@ static void issue_beacon(struct adapter *padapter, int timeout_ms)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
-	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe) {
@@ -339,7 +338,7 @@ static void issue_beacon(struct adapter *padapter, int timeout_ms)
 	fctrl = &pwlanhdr->frame_control;
 	*(fctrl) = 0;
 
-	ether_addr_copy(pwlanhdr->addr1, bc_addr);
+	eth_broadcast_addr(pwlanhdr->addr1);
 	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
 	ether_addr_copy(pwlanhdr->addr3, cur_network->MacAddress);
 
@@ -605,7 +604,6 @@ static int issue_probereq(struct adapter *padapter,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	int bssrate_len = 0;
-	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_, ("+%s\n", __func__));
 
@@ -633,8 +631,8 @@ static int issue_probereq(struct adapter *padapter,
 		ether_addr_copy(pwlanhdr->addr3, da);
 	} else {
 		/*	broadcast probe request frame */
-		ether_addr_copy(pwlanhdr->addr1, bc_addr);
-		ether_addr_copy(pwlanhdr->addr3, bc_addr);
+		eth_broadcast_addr(pwlanhdr->addr1);
+		eth_broadcast_addr(pwlanhdr->addr3);
 	}
 
 	ether_addr_copy(pwlanhdr->addr2, mac);
-- 
2.18.0.huawei.25

