Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C270
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 17:53:28 +0000 (UTC)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lv1dO-00012S-JK; Sun, 20 Jun 2021 19:53:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/13] staging: rtl8188eu: remove a couple of unused defines
Date: Sun, 20 Jun 2021 19:52:52 +0200
Message-Id: <20210620175301.14988-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210620175301.14988-1-martin@kaiser.cx>
References: <20210620175301.14988-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some defines which are not used by this driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/rtl8188e_hal.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 0bfab5990d27..2c16d3f33e1c 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -20,19 +20,6 @@
 #include "rtw_sreset.h"
 #include "odm_precomp.h"
 
-/*  Fw Array */
-#define Rtl8188E_FwImageArray		Rtl8188EFwImgArray
-#define Rtl8188E_FWImgArrayLength	Rtl8188EFWImgArrayLength
-
-#define RTL8188E_FW_UMC_IMG			"rtl8188E\\rtl8188efw.bin"
-#define RTL8188E_PHY_REG			"rtl8188E\\PHY_REG_1T.txt"
-#define RTL8188E_PHY_RADIO_A			"rtl8188E\\radio_a_1T.txt"
-#define RTL8188E_PHY_RADIO_B			"rtl8188E\\radio_b_1T.txt"
-#define RTL8188E_AGC_TAB			"rtl8188E\\AGC_TAB_1T.txt"
-#define RTL8188E_PHY_MACREG			"rtl8188E\\MAC_REG.txt"
-#define RTL8188E_PHY_REG_PG			"rtl8188E\\PHY_REG_PG.txt"
-#define RTL8188E_PHY_REG_MP			"rtl8188E\\PHY_REG_MP.txt"
-
 /* RTL8188E Power Configuration CMDs for USB/SDIO interfaces */
 #define Rtl8188E_NIC_PWR_ON_FLOW		rtl8188E_power_on_flow
 #define Rtl8188E_NIC_RF_OFF_FLOW		rtl8188E_radio_off_flow
-- 
2.20.1

