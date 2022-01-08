Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FDC2CA9
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:24 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAr-0005EJ-3S; Sat, 08 Jan 2022 13:50:21 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/12] staging: r8188eu: remove HAL_*_ENABLE defines
Date: Sat,  8 Jan 2022 13:49:58 +0100
Message-Id: <20220108124959.313215-12-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220108124959.313215-1-martin@kaiser.cx>
References: <20220108124959.313215-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HAL_(MAC|BB|RF)_ENABLE are always set. Remove the defines and the
checks where they are used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 21cb505036b7..cc8f8c7d0734 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -13,10 +13,6 @@
 #include "../include/usb_osintf.h"
 #include "../include/Hal8188EPwrSeq.h"
 
-#define		HAL_MAC_ENABLE	1
-#define		HAL_BB_ENABLE		1
-#define		HAL_RF_ENABLE		1
-
 static void _ConfigNormalChipOutEP_8188E(struct adapter *adapt, u8 NumOutPipe)
 {
 	struct hal_data_8188e *haldata = &adapt->haldata;
@@ -640,32 +636,26 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	Adapter->pwrctrlpriv.bFwCurrentInPSMode = false;
 	haldata->LastHMEBoxNum = 0;
 
-#if (HAL_MAC_ENABLE == 1)
 	status = PHY_MACConfig8188E(Adapter);
 	if (status == _FAIL) {
 		DBG_88E(" ### Failed to init MAC ......\n ");
 		goto exit;
 	}
-#endif
 
 	/*  */
 	/* d. Initialize BB related configurations. */
 	/*  */
-#if (HAL_BB_ENABLE == 1)
 	status = PHY_BBConfig8188E(Adapter);
 	if (status == _FAIL) {
 		DBG_88E(" ### Failed to init BB ......\n ");
 		goto exit;
 	}
-#endif
 
-#if (HAL_RF_ENABLE == 1)
 	status = PHY_RFConfig8188E(Adapter);
 	if (status == _FAIL) {
 		DBG_88E(" ### Failed to init RF ......\n ");
 		goto exit;
 	}
-#endif
 
 	status = rtl8188e_iol_efuse_patch(Adapter);
 	if (status == _FAIL) {
-- 
2.30.2

