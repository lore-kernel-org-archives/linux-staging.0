Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3A82F80
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 05:42:17 +0000 (UTC)
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.59])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fq2wC0pRDzmZ3d;
	Tue, 25 May 2021 13:39:55 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 13:42:15 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 13:42:14 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <linux-staging@lists.linux.dev>
CC: Shaokun Zhang <zhangshaokun@hisilicon.com>, Hans de Goede
	<hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8723bs: remove the repeated declaration
Date: Tue, 25 May 2021 13:41:54 +0800
Message-ID: <1621921314-57346-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

Function 'rtw_indicate_wx_disassoc_event' is declared twice, remove the
repeated declaration.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 83d43e5726dd..49b404e5cfaf 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -503,7 +503,6 @@ static inline u8 *myid(struct eeprom_priv *peepriv)
 
 void rtw_indicate_wx_disassoc_event(struct adapter *padapter);
 void rtw_indicate_wx_assoc_event(struct adapter *padapter);
-void rtw_indicate_wx_disassoc_event(struct adapter *padapter);
 void indicate_wx_scan_complete_event(struct adapter *padapter);
 int rtw_change_ifname(struct adapter *padapter, const char *ifname);
 
-- 
2.7.4

