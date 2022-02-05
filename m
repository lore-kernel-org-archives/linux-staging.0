Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE142CA5
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 11:38:01 +0000 (UTC)
Received: from dslb-188-104-059-100.188.104.pools.vodafone-ip.de ([188.104.59.100] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGJO4-0005c9-L0; Sat, 05 Feb 2022 12:37:52 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/8] staging: r8188eu: RfRegChnlVal[1] is set but not used
Date: Sat,  5 Feb 2022 12:37:39 +0100
Message-Id: <20220205113741.379070-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205113741.379070-1-martin@kaiser.cx>
References: <20220205113741.379070-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RfRegChnlVal[1] in hal_data_8188e is set but not used. This driver needs
only one RfRegChnlVal setting. Replace the array with a single u32.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c  | 4 ++--
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c  | 8 ++++----
 drivers/staging/r8188eu/hal/usb_halinit.c      | 3 +--
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 2 +-
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 6e26359bdda7..cd82452238e0 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -724,8 +724,8 @@ static void _PHY_SwChnl8192C(struct adapter *Adapter, u8 channel)
 	/* s2. RF dependent command - CmdID_RF_WriteReg, param1=RF_CHNLBW, param2=channel */
 	param1 = RF_CHNLBW;
 	param2 = channel;
-	pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffffc00) | param2);
-	rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, param1, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
+	pHalData->RfRegChnlVal = ((pHalData->RfRegChnlVal & 0xfffffc00) | param2);
+	rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, param1, bRFRegOffsetMask, pHalData->RfRegChnlVal);
 }
 
 void PHY_SwChnl8188E(struct adapter *Adapter, u8 channel)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index ea847ec39e13..2d5d04b384d1 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -50,12 +50,12 @@ void rtl8188e_PHY_RF6052SetBandwidth(struct adapter *Adapter,
 
 	switch (Bandwidth) {
 	case HT_CHANNEL_WIDTH_20:
-		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT(10) | BIT(11));
-		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
+		pHalData->RfRegChnlVal = ((pHalData->RfRegChnlVal & 0xfffff3ff) | BIT(10) | BIT(11));
+		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal);
 		break;
 	case HT_CHANNEL_WIDTH_40:
-		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT(10));
-		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
+		pHalData->RfRegChnlVal = ((pHalData->RfRegChnlVal & 0xfffff3ff) | BIT(10));
+		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal);
 		break;
 	default:
 		break;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f21b910bd88d..e8bc4a115a2b 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -668,8 +668,7 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	rtw_write16(Adapter, REG_PKT_BE_BK_LIFE_TIME, 0x0400);	/*  unit: 256us. 256ms */
 
 	/* Keep RfRegChnlVal for later use. */
-	haldata->RfRegChnlVal[0] = rtl8188e_PHY_QueryRFReg(Adapter, (enum rf_radio_path)0, RF_CHNLBW, bRFRegOffsetMask);
-	haldata->RfRegChnlVal[1] = rtl8188e_PHY_QueryRFReg(Adapter, (enum rf_radio_path)1, RF_CHNLBW, bRFRegOffsetMask);
+	haldata->RfRegChnlVal = rtl8188e_PHY_QueryRFReg(Adapter, (enum rf_radio_path)0, RF_CHNLBW, bRFRegOffsetMask);
 
 	_BBTurnOnBlock(Adapter);
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index c323476f5936..c6472d13e069 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -143,7 +143,7 @@ struct hal_data_8188e {
 
 	struct bb_reg_def PHYRegDef[2];	/* Radio A/B */
 
-	u32	RfRegChnlVal[2];
+	u32	RfRegChnlVal;
 
 	/* for host message to fw */
 	u8	LastHMEBoxNum;
-- 
2.30.2

