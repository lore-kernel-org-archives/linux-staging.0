Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3E7C
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:43:29 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPhj-0004Ne-Tu; Sat, 06 Aug 2022 21:43:23 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: txpktbuf_bndy does not depend on wifi_spec
Date: Sat,  6 Aug 2022 21:43:04 +0200
Message-Id: <20220806194304.777059-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the if clause that sets txpktbuf_bndy. Both branches set the same
value.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 12 ++----------
 drivers/staging/r8188eu/include/rtl8188e_hal.h |  6 ------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index efb529bb4c8a..8b36fb56076e 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -567,7 +567,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 {
 	u8 value8 = 0;
 	u16  value16;
-	u8 txpktbuf_bndy;
 	u32 status = _SUCCESS;
 	int res;
 	struct hal_data_8188e *haldata = &Adapter->haldata;
@@ -600,13 +599,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	/*  HW GPIO pin. Before PHY_RFConfig8192C. */
 	/*  2010/08/26 MH If Efuse does not support sective suspend then disable the function. */
 
-	if (!pregistrypriv->wifi_spec) {
-		txpktbuf_bndy = TX_PAGE_BOUNDARY_88E;
-	} else {
-		/*  for WMM */
-		txpktbuf_bndy = WMM_NORMAL_TX_PAGE_BOUNDARY_88E;
-	}
-
 	_InitQueueReservedPage(Adapter);
 	_InitQueuePriority(Adapter);
 	_InitPageBoundary(Adapter);
@@ -647,9 +639,9 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	if (status == _FAIL)
 		goto exit;
 
-	_InitTxBufferBoundary(Adapter, txpktbuf_bndy);
+	_InitTxBufferBoundary(Adapter, TX_PAGE_BOUNDARY_88E);
 
-	status =  InitLLTTable(Adapter, txpktbuf_bndy);
+	status =  InitLLTTable(Adapter, TX_PAGE_BOUNDARY_88E);
 	if (status == _FAIL)
 		goto exit;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 5cd62b216720..fdc187f4deaa 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -51,12 +51,6 @@
 
 #define TX_PAGE_BOUNDARY_88E (TX_TOTAL_PAGE_NUMBER_88E + 1)
 
-/* Note: For Normal Chip Setting ,modify later */
-#define WMM_NORMAL_TX_TOTAL_PAGE_NUMBER			\
-	TX_TOTAL_PAGE_NUMBER_88E  /* 0xA9 , 0xb0=>176=>22k */
-#define WMM_NORMAL_TX_PAGE_BOUNDARY_88E			\
-	(WMM_NORMAL_TX_TOTAL_PAGE_NUMBER + 1) /* 0xA9 */
-
 #include "HalVerDef.h"
 #include "hal_com.h"
 
-- 
2.30.2

