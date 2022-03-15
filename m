Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1F1B68
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:51:04 +0000 (UTC)
Received: from ipservice-092-217-079-029.092.217.pools.vodafone-ip.de ([92.217.79.29] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nUE8D-00084h-Lf; Tue, 15 Mar 2022 21:51:01 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 6/6] staging: r8188eu: remove local BIT macro
Date: Tue, 15 Mar 2022 21:50:41 +0100
Message-Id: <20220315205041.2714168-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315205041.2714168-1-martin@kaiser.cx>
References: <20220315205041.2714168-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The r8188eu driver defines a local BIT(x) macro. Remove this local macro
and use the one from include/linux/bits.h.

The global BIT macro returns an unsigned long value. Therefore, we have to
cast DYNAMIC_BB_DYNAMIC_TXPWR to u32 explicitly. This define is used with
the bitwise not operator.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - cast DYNAMIC_BB_DYNAMIC_TXPWR to u32, fix build error on 64-bit systems

 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 drivers/staging/r8188eu/include/wifi.h         | 7 +------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 0c555ea6719b..2b5089be5156 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -34,7 +34,7 @@
 /*  BB ODM section BIT 0-15 */
 #define	DYNAMIC_BB_DIG				BIT(0)
 #define	DYNAMIC_BB_RA_MASK			BIT(1)
-#define	DYNAMIC_BB_DYNAMIC_TXPWR	BIT(2)
+#define	DYNAMIC_BB_DYNAMIC_TXPWR	((u32)BIT(2))
 #define	DYNAMIC_BB_BB_FA_CNT			BIT(3)
 
 #define		DYNAMIC_BB_RSSI_MONITOR		BIT(4)
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index c331be19ff83..299553351246 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -4,14 +4,9 @@
 #ifndef _WIFI_H_
 #define _WIFI_H_
 
+#include <linux/bits.h>
 #include <linux/ieee80211.h>
 
-#ifdef BIT
-/* error	"BIT define occurred earlier elsewhere!\n" */
-#undef BIT
-#endif
-#define BIT(x)	(1 << (x))
-
 #define WLAN_ETHHDR_LEN		14
 #define WLAN_HDR_A3_LEN		24
 #define WLAN_HDR_A3_QOS_LEN	26
-- 
2.30.2

