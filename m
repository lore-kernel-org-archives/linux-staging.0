Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD652CA7
	for <linux-staging@lists.linux.dev>; Sun, 12 Dec 2021 18:58:53 +0000 (UTC)
Received: from dslb-188-104-058-180.188.104.pools.vodafone-ip.de ([188.104.58.180] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mwU3Y-0001zY-E1; Sun, 12 Dec 2021 19:58:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/3] staging: r8188eu: move xmit status check from hal to rtw_cmd
Date: Sun, 12 Dec 2021 19:58:31 +0100
Message-Id: <20211212185833.22000-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211212185833.22000-1-martin@kaiser.cx>
References: <20211212185833.22000-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rtl8188e_sreset_xmit_status_check from the hal layer into
rtw_cmd.c.

As this driver supports only the 8188 chipset, there's no need
to go through the hal layer for simple operations that have only
one caller.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_cmd.c            | 12 ++++++++++++
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c     | 12 ------------
 drivers/staging/r8188eu/include/rtl8188e_sreset.h |  1 -
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ace3a6342e01..283ae08ae4cb 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -950,6 +950,18 @@ static void traffic_status_watchdog(struct adapter *padapter)
 	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 }
 
+static void rtl8188e_sreset_xmit_status_check(struct adapter *padapter)
+{
+	u32 txdma_status;
+
+	txdma_status = rtw_read32(padapter, REG_TXDMA_STATUS);
+	if (txdma_status != 0x00) {
+		DBG_88E("%s REG_TXDMA_STATUS:0x%08x\n", __func__, txdma_status);
+		rtw_write32(padapter, REG_TXDMA_STATUS, txdma_status);
+	}
+	/* total xmit irp = 4 */
+}
+
 static void dynamic_chk_wk_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct mlme_priv *pmlmepriv;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_sreset.c b/drivers/staging/r8188eu/hal/rtl8188e_sreset.c
index 7b3ac6e306ce..7fec776a8e87 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_sreset.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_sreset.c
@@ -6,18 +6,6 @@
 #include "../include/rtl8188e_sreset.h"
 #include "../include/rtl8188e_hal.h"
 
-void rtl8188e_sreset_xmit_status_check(struct adapter *padapter)
-{
-	u32 txdma_status;
-
-	txdma_status = rtw_read32(padapter, REG_TXDMA_STATUS);
-	if (txdma_status != 0x00) {
-		DBG_88E("%s REG_TXDMA_STATUS:0x%08x\n", __func__, txdma_status);
-		rtw_write32(padapter, REG_TXDMA_STATUS, txdma_status);
-	}
-	/* total xmit irp = 4 */
-}
-
 void rtl8188e_sreset_linked_status_check(struct adapter *padapter)
 {
 	u32 rx_dma_status = 0;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_sreset.h b/drivers/staging/r8188eu/include/rtl8188e_sreset.h
index bb8b0048fbf9..4e96a5a6e075 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_sreset.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_sreset.h
@@ -7,7 +7,6 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-void rtl8188e_sreset_xmit_status_check(struct adapter *padapter);
 void rtl8188e_sreset_linked_status_check(struct adapter *padapter);
 
 #endif
-- 
2.20.1

