Received: from baidu.com (mx21.baidu.com [220.181.3.85])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC432F80
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:09:55 +0000 (UTC)
Received: from BC-Mail-Ex29.internal.baidu.com (unknown [172.31.51.23])
	by Forcepoint Email with ESMTPS id DA07F2016C24D9212EC2;
	Mon, 16 Aug 2021 15:54:12 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex29.internal.baidu.com (172.31.51.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 16 Aug 2021 15:54:12 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 16 Aug 2021 15:54:12 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <dan.carpenter@oracle.com>, <greg@kroah.com>, <yangyingliang@huawei.com>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Cai
 Huoqing" <caihuoqing@baidu.com>
Subject: [PATCH] staging: r8188eu: Remove the dependency on ipx.h
Date: Mon, 16 Aug 2021 15:54:06 +0800
Message-ID: <20210816075406.938-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex22.internal.baidu.com (172.31.51.16) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)

commit <47595e32869f> ("<MAINTAINERS: Mark some staging directories>")
indicated the ipx network layer as obsolete in Jan 2018,
updated in the MAINTAINERS file

now, after being exposed for 3 years to refactoring,
so to remove the dependency on ipx.h

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 24 ++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 63a4cabdd3a8..173679709e70 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -5,7 +5,6 @@
 
 #include "../include/linux/if_arp.h"
 #include "../include/net/ip.h"
-#include "../include/net/ipx.h"
 #include "../include/linux/atalk.h"
 #include "../include/linux/udp.h"
 #include "../include/linux/if_pppox.h"
@@ -37,6 +36,29 @@
 #define MAGIC_CODE_LEN	2
 #define WAIT_TIME_PPPOE	5	/*  waiting time for pppoe server in sec */
 
+#define IPX_NODE_LEN	6
+struct ipx_address {
+	__be32  net;
+	__u8    node[IPX_NODE_LEN];
+	__be16  sock;
+};
+
+struct ipxhdr {
+	__be16			ipx_checksum __packed;
+#define IPX_NO_CHECKSUM	cpu_to_be16(0xFFFF)
+	__be16			ipx_pktsize __packed;
+	__u8			ipx_tctrl;
+	__u8			ipx_type;
+#define IPX_TYPE_UNKNOWN	0x00
+#define IPX_TYPE_RIP		0x01	/* may also be 0 */
+#define IPX_TYPE_SAP		0x04	/* may also be 0 */
+#define IPX_TYPE_SPX		0x05	/* SPX protocol */
+#define IPX_TYPE_NCP		0x11	/* $lots for docs on this (SPIT) */
+#define IPX_TYPE_PPROP		0x14	/* complicated flood fill brdcast */
+	struct ipx_address	ipx_dest __packed;
+	struct ipx_address	ipx_source __packed;
+};
+
 /*-----------------------------------------------------------------
   How database records network address:
 	   0    1    2    3    4    5    6    7    8    9   10
-- 
2.25.1

