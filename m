Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD992C9F
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 18:05:08 +0000 (UTC)
Received: from dslb-178-004-201-201.178.004.pools.vodafone-ip.de ([178.4.201.201] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mehrl-00049p-4I; Sun, 24 Oct 2021 20:05:05 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: remove the sreset_priv structure
Date: Sun, 24 Oct 2021 20:04:48 +0200
Message-Id: <20211024180448.20624-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211024180448.20624-1-martin@kaiser.cx>
References: <20211024180448.20624-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

last_tx_time from struct sreset_priv is no longer used now that
last_tx_complete_time is gone.

This patch removes last_tx_time. This was the last remaining component of
struct sreset_priv, we can now remove the structure itself.

After removing include/rtw_sreset.h, it turned out that some definitions
in .c files were pulled in via rtw_sreset.h. Add the required include
files directly to make compilation succeed without rtw_sreset.h.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/Makefile              |  1 -
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 ++
 drivers/staging/r8188eu/core/rtw_sreset.c     | 19 -------------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  1 -
 .../staging/r8188eu/include/rtl8188e_sreset.h |  1 -
 drivers/staging/r8188eu/include/rtw_sreset.h  | 19 -------------------
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 ----
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  8 ++------
 8 files changed, 4 insertions(+), 51 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/core/rtw_sreset.c
 delete mode 100644 drivers/staging/r8188eu/include/rtw_sreset.h

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index a0a8e150da3f..62933b0f29b5 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -51,7 +51,6 @@ r8188eu-y = \
 		core/rtw_recv.o \
 		core/rtw_rf.o \
 		core/rtw_security.o \
-		core/rtw_sreset.o \
 		core/rtw_sta_mgt.o \
 		core/rtw_wlan_util.o \
 		core/rtw_xmit.o
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 7b372374e638..55c3d4a6faeb 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -11,6 +11,8 @@
 #include "../include/mlme_osdep.h"
 #include "../include/recv_osdep.h"
 #include "../include/rtl8188e_sreset.h"
+#include "../include/rtl8188e_xmit.h"
+#include "../include/rtl8188e_dm.h"
 
 static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
diff --git a/drivers/staging/r8188eu/core/rtw_sreset.c b/drivers/staging/r8188eu/core/rtw_sreset.c
deleted file mode 100644
index 1df46673bddd..000000000000
--- a/drivers/staging/r8188eu/core/rtw_sreset.c
+++ /dev/null
@@ -1,19 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2012 Realtek Corporation. */
-
-#include "../include/rtw_sreset.h"
-
-void sreset_init_value(struct adapter *padapter)
-{
-	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
-	struct sreset_priv *psrtpriv = &pHalData->srestpriv;
-
-	psrtpriv->last_tx_time = 0;
-}
-void sreset_reset_value(struct adapter *padapter)
-{
-	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
-	struct sreset_priv *psrtpriv = &pHalData->srestpriv;
-
-	psrtpriv->last_tx_time = 0;
-}
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index ced7e12d9013..d7db1dfc39d0 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -256,7 +256,6 @@ struct hal_data_8188e {
 
 	struct dm_priv	dmpriv;
 	struct odm_dm_struct odmpriv;
-	struct sreset_priv srestpriv;
 
 	u8	CurAntenna;
 	u8	AntDivCfg;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_sreset.h b/drivers/staging/r8188eu/include/rtl8188e_sreset.h
index 5d7fec78a27b..bb8b0048fbf9 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_sreset.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_sreset.h
@@ -6,7 +6,6 @@
 
 #include "osdep_service.h"
 #include "drv_types.h"
-#include "rtw_sreset.h"
 
 void rtl8188e_sreset_xmit_status_check(struct adapter *padapter);
 void rtl8188e_sreset_linked_status_check(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/include/rtw_sreset.h b/drivers/staging/r8188eu/include/rtw_sreset.h
deleted file mode 100644
index ff84cdc02c2c..000000000000
--- a/drivers/staging/r8188eu/include/rtw_sreset.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2012 Realtek Corporation. */
-
-#ifndef _RTW_SRESET_C_
-#define _RTW_SRESET_C_
-
-#include "osdep_service.h"
-#include "drv_types.h"
-
-struct sreset_priv {
-	unsigned long last_tx_time;
-};
-
-#include "rtl8188e_hal.h"
-
-void sreset_init_value(struct adapter *padapter);
-void sreset_reset_value(struct adapter *padapter);
-
-#endif
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 96e9897085fe..10059240bf54 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -13,7 +13,6 @@
 #include "../include/rtw_br_ext.h"
 #include "../include/rtl8188e_led.h"
 #include "../include/rtl8188e_dm.h"
-#include "../include/rtw_sreset.h"
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
@@ -467,7 +466,6 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
 
-	sreset_reset_value(padapter);
 	pwrctrlpriv->pwr_state_check_cnts = 0;
 
 	/* mlmeextpriv */
@@ -537,8 +535,6 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	rtl8188e_init_dm_priv(padapter);
 	rtl8188eu_InitSwLeds(padapter);
 
-	sreset_init_value(padapter);
-
 	spin_lock_init(&padapter->br_ext_lock);
 
 exit:
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 57a435138bf0..ef2ea68ae873 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -5,7 +5,7 @@
 
 #include "../include/drv_types.h"
 #include "../include/usb_ops_linux.h"
-#include "../include/rtw_sreset.h"
+#include "../include/rtl8188e_recv.h"
 
 unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
 {
@@ -176,11 +176,7 @@ u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 			  pxmitbuf);/* context is pxmitbuf */
 
 	status = usb_submit_urb(purb, GFP_ATOMIC);
-	if (!status) {
-		struct hal_data_8188e	*haldata = GET_HAL_DATA(padapter);
-
-		haldata->srestpriv.last_tx_time = jiffies;
-	} else {
+	if (status) {
 		rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_WRITE_PORT_ERR);
 		DBG_88E("usb_write_port, status =%d\n", status);
 
-- 
2.20.1

