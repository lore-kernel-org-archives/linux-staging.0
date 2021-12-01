Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833268
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 06:40:07 +0000 (UTC)
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J3pqR36svz8vmv;
	Wed,  1 Dec 2021 14:20:35 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 14:22:33 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 14:22:33 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <paskripkin@gmail.com>
Subject: [PATCH -next v2] staging: rtl8192e: rtllib_module: fix missing free_netdev() on error in alloc_rtllib()
Date: Wed, 1 Dec 2021 14:29:08 +0800
Message-ID: <20211201062908.1656422-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected

Add the missing free_netdev() before return from alloc_rtllib()
in the error handling case.

Return error code from rtllib_softmac_init(), so it can be checked
in alloc_rtllib().

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2:
  return error code from rtllib_softmac_init() and add check return value
  of rtllib_softmac_init().
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_module.c  | 5 +++--
 drivers/staging/rtl8192e/rtllib_softmac.c | 7 +++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c6f8b772335c..c985e4ebc545 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1980,7 +1980,7 @@ void SendDisassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn);
 void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee);
 
 void rtllib_start_ibss(struct rtllib_device *ieee);
-void rtllib_softmac_init(struct rtllib_device *ieee);
+int rtllib_softmac_init(struct rtllib_device *ieee);
 void rtllib_softmac_free(struct rtllib_device *ieee);
 void rtllib_disassociate(struct rtllib_device *ieee);
 void rtllib_stop_scan(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index 64d9feee1f39..105c58e749d6 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -121,11 +121,12 @@ struct net_device *alloc_rtllib(int sizeof_priv)
 	ieee->hwsec_active = 0;
 
 	memset(ieee->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
-	rtllib_softmac_init(ieee);
+	if (rtllib_softmac_init(ieee))
+		goto failed;
 
 	ieee->pHTInfo = kzalloc(sizeof(struct rt_hi_throughput), GFP_KERNEL);
 	if (!ieee->pHTInfo)
-		return NULL;
+		goto failed;
 
 	HTUpdateDefaultSetting(ieee);
 	HTInitializeHTInfo(ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index aabbea48223d..c4af056ddd82 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2952,7 +2952,7 @@ void rtllib_start_protocol(struct rtllib_device *ieee)
 	}
 }
 
-void rtllib_softmac_init(struct rtllib_device *ieee)
+int rtllib_softmac_init(struct rtllib_device *ieee)
 {
 	int i;
 
@@ -2962,8 +2962,10 @@ void rtllib_softmac_init(struct rtllib_device *ieee)
 	for (i = 0; i < 5; i++)
 		ieee->seq_ctrl[i] = 0;
 	ieee->dot11d_info = kzalloc(sizeof(struct rt_dot11d_info), GFP_ATOMIC);
-	if (!ieee->dot11d_info)
+	if (!ieee->dot11d_info) {
 		netdev_err(ieee->dev, "Can't alloc memory for DOT11D\n");
+		return -ENOMEM;
+	}
 	ieee->LinkDetectInfo.SlotIndex = 0;
 	ieee->LinkDetectInfo.SlotNum = 2;
 	ieee->LinkDetectInfo.NumRecvBcnInPeriod = 0;
@@ -3029,6 +3031,7 @@ void rtllib_softmac_init(struct rtllib_device *ieee)
 
 	tasklet_setup(&ieee->ps_task, rtllib_sta_ps);
 
+	return 0;
 }
 
 void rtllib_softmac_free(struct rtllib_device *ieee)
-- 
2.25.1

