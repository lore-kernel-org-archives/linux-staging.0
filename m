Received: from baidu.com (mx21.baidu.com [220.181.3.85])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1D82F80
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 05:49:55 +0000 (UTC)
Received: from BC-Mail-HQEX01.internal.baidu.com (unknown [172.31.51.57])
	by Forcepoint Email with ESMTPS id EACD441974EA0490C127;
	Wed, 18 Aug 2021 13:49:53 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-HQEX01.internal.baidu.com (172.31.51.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 18 Aug 2021 13:49:53 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 18 Aug 2021 13:49:53 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <dan.carpenter@oracle.com>, <greg@kroah.com>, <yangyingliang@huawei.com>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Cai
 Huoqing" <caihuoqing@baidu.com>
Subject: [PATCH v2] staging: r8188eu: Remove unused including <linux/version.h>
Date: Wed, 18 Aug 2021 13:49:46 +0800
Message-ID: <20210818054946.2751-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)

Remove including <linux/version.h> that don't need it

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c      | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 1 -
 drivers/staging/r8188eu/os_dep/rtw_android.c | 1 -
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index d5ef5783f4ad..82b74ebdaabd 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -3,7 +3,6 @@
 
 #define _RTW_MLME_C_
 
-#include <linux/version.h>
 #include "../include/osdep_service.h"
 #include "../include/drv_types.h"
 #include "../include/recv_osdep.h"
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index f4bf4732578a..aef978eef4d7 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -12,7 +12,6 @@
 
 #include "../include/usb_osintf.h"
 #include "../include/rtw_br_ext.h"
-#include <linux/version.h>
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
index bdd381606ba6..af0072e2cb5f 100644
--- a/drivers/staging/r8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
@@ -3,7 +3,6 @@
 
 #include <linux/module.h>
 #include <linux/netdevice.h>
-#include <linux/version.h>
 #include "../include/rtw_android.h"
 #include "../include/osdep_service.h"
 #include "../include/rtw_debug.h"
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 4f1ce346b3a5..69966c696130 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -3,7 +3,6 @@
 
 #define _XMIT_OSDEP_C_
 
-#include <linux/version.h>
 #include "../include/osdep_service.h"
 #include "../include/drv_types.h"
 #include "../include/if_ether.h"
-- 
2.22.0

