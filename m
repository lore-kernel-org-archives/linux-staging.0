Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30A25F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 08:13:16 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9JsK3L2BzPmMB;
	Wed, 31 Mar 2021 16:10:29 +0800 (CST)
Received: from mdc.localdomain (10.175.104.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 16:12:59 +0800
From: Xu Jia <xujia39@huawei.com>
To: <xujia39@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ross Schmidt <ross.schm.dev@gmail.com>, Amarjargal Gundjalam
	<amarjargal16@gmail.com>, Jason Yan <yanaijie@huawei.com>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] staging: rtl8723bs: core: Remove unused variable 'res'
Date: Wed, 31 Mar 2021 16:12:43 +0800
Message-ID: <1617178363-34193-1-git-send-email-xujia39@huawei.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected

The variable 'res' is not used in function, this commit
remove it to fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xu Jia <xujia39@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index f96dd0b40e04..00b83919a9a3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -533,7 +533,6 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 {
 	struct sta_info *psta;
-	u32 res = _SUCCESS;
 	NDIS_802_11_MAC_ADDRESS	bcast_addr = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	struct	sta_priv *pstapriv = &padapter->stapriv;
@@ -542,15 +541,12 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 	psta = rtw_alloc_stainfo(pstapriv, bcast_addr);
 
 	if (!psta) {
-		res = _FAIL;
 		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("rtw_alloc_stainfo fail"));
-		goto exit;
+		return _FAIL;
 	}
 
 	/*  default broadcast & multicast use macid 1 */
 	psta->mac_id = 1;
-
-exit:
 	return _SUCCESS;
 }
 

