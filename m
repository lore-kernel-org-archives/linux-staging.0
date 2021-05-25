Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7532F80
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 06:19:00 +0000 (UTC)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fq3kZ3VzgzmbCS;
	Tue, 25 May 2021 14:16:38 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 14:18:58 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 14:18:58 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <linux-staging@lists.linux.dev>
CC: Shaokun Zhang <zhangshaokun@hisilicon.com>, Hans de Goede
	<hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8723bs: remove the repeated declaration
Date: Tue, 25 May 2021 14:18:51 +0800
Message-ID: <1621923531-21262-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

Function 'Hal_SetBandwidth' is declared twice, remove the
repeated declaration.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/staging/rtl8723bs/include/rtw_mp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index 2788ad80b114..ea3abee325ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -348,7 +348,6 @@ void Hal_SetCarrierSuppressionTx(struct adapter *padapter, u8 bStart);
 void Hal_SetSingleToneTx(struct adapter *padapter, u8 bStart);
 void Hal_SetSingleCarrierTx(struct adapter *padapter, u8 bStart);
 void Hal_SetContinuousTx(struct adapter *padapter, u8 bStart);
-void Hal_SetBandwidth(struct adapter *padapter);
 
 void Hal_SetDataRate(struct adapter *padapter);
 void Hal_SetChannel(struct adapter *padapter);
-- 
2.7.4

