Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA1F258D
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 16:17:56 +0000 (UTC)
Received: from dslb-188-097-215-215.188.097.pools.vodafone-ip.de ([188.97.215.215] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nIv5t-0007YM-7U; Sat, 12 Feb 2022 17:17:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/10] staging: r8188eu: we only need one struct bb_reg_def for path a
Date: Sat, 12 Feb 2022 17:17:37 +0100
Message-Id: <20220212161737.381841-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220212161737.381841-1-martin@kaiser.cx>
References: <20220212161737.381841-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The r8188eu driver does no longer access rf path b registers via
PHYRegDef.

Change the PHYRegDef array in struct hal_data_8188e to a single
variable that holds the register addresses for rf path a. Remove
the initialisation of path b register addresses.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 58 +++++++------------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  2 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |  2 +-
 3 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index e2e4443b7414..b0e5b9f6a005 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -123,7 +123,7 @@ phy_RFSerialRead(
 {
 	u32 retValue = 0;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
-	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef[RF_PATH_A];
+	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef;
 	u32 NewOffset;
 	u32 tmplong, tmplong2;
 	u8 	RfPiEnable = 0;
@@ -215,7 +215,7 @@ phy_RFSerialWrite(
 {
 	u32 DataAndAddr = 0;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
-	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef[RF_PATH_A];
+	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef;
 	u32 NewOffset;
 
 	/*  2009/06/17 MH We can not execute IO for power save or other accident mode. */
@@ -358,76 +358,58 @@ phy_InitBBRFRegisterDefinition(
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
 
 	/*  RF Interface Sowrtware Control */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 LSBs if read 32-bit from 0x870 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 MSBs if read 32-bit from 0x870 (16-bit for 0x872) */
+	pHalData->PHYRegDef.rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 LSBs if read 32-bit from 0x870 */
 
 	/*  RF Interface Readback Value */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfi = rFPGA0_XAB_RFInterfaceRB; /*  16 LSBs if read 32-bit from 0x8E0 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfi = rFPGA0_XAB_RFInterfaceRB;/*  16 MSBs if read 32-bit from 0x8E0 (16-bit for 0x8E2) */
+	pHalData->PHYRegDef.rfintfi = rFPGA0_XAB_RFInterfaceRB; /*  16 LSBs if read 32-bit from 0x8E0 */
 
 	/*  RF Interface Output (and Enable) */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x860 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x864 */
+	pHalData->PHYRegDef.rfintfo = rFPGA0_XA_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x860 */
 
 	/*  RF Interface (Output and)  Enable */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfe = rFPGA0_XA_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfe = rFPGA0_XB_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x864 (16-bit for 0x866) */
+	pHalData->PHYRegDef.rfintfe = rFPGA0_XA_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
 
 	/* Addr of LSSI. Wirte RF register by driver */
-	pHalData->PHYRegDef[RF_PATH_A].rf3wireOffset = rFPGA0_XA_LSSIParameter; /* LSSI Parameter */
-	pHalData->PHYRegDef[RF_PATH_B].rf3wireOffset = rFPGA0_XB_LSSIParameter;
+	pHalData->PHYRegDef.rf3wireOffset = rFPGA0_XA_LSSIParameter; /* LSSI Parameter */
 
 	/*  RF parameter */
-	pHalData->PHYRegDef[RF_PATH_A].rfLSSI_Select = rFPGA0_XAB_RFParameter;  /* BB Band Select */
-	pHalData->PHYRegDef[RF_PATH_B].rfLSSI_Select = rFPGA0_XAB_RFParameter;
+	pHalData->PHYRegDef.rfLSSI_Select = rFPGA0_XAB_RFParameter;  /* BB Band Select */
 
 	/*  Tx AGC Gain Stage (same for all path. Should we remove this?) */
-	pHalData->PHYRegDef[RF_PATH_A].rfTxGainStage = rFPGA0_TxGainStage; /* Tx gain stage */
-	pHalData->PHYRegDef[RF_PATH_B].rfTxGainStage = rFPGA0_TxGainStage; /* Tx gain stage */
+	pHalData->PHYRegDef.rfTxGainStage = rFPGA0_TxGainStage; /* Tx gain stage */
 
 	/*  Tranceiver A~D HSSI Parameter-1 */
-	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara1 = rFPGA0_XA_HSSIParameter1;  /* wire control parameter1 */
-	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara1 = rFPGA0_XB_HSSIParameter1;  /* wire control parameter1 */
+	pHalData->PHYRegDef.rfHSSIPara1 = rFPGA0_XA_HSSIParameter1;  /* wire control parameter1 */
 
 	/*  Tranceiver A~D HSSI Parameter-2 */
-	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
-	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;  /* wire control parameter2 */
+	pHalData->PHYRegDef.rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
 
 	/*  RF switch Control */
-	pHalData->PHYRegDef[RF_PATH_A].rfSwitchControl = rFPGA0_XAB_SwitchControl; /* TR/Ant switch control */
-	pHalData->PHYRegDef[RF_PATH_B].rfSwitchControl = rFPGA0_XAB_SwitchControl;
+	pHalData->PHYRegDef.rfSwitchControl = rFPGA0_XAB_SwitchControl; /* TR/Ant switch control */
 
 	/*  AGC control 1 */
-	pHalData->PHYRegDef[RF_PATH_A].rfAGCControl1 = rOFDM0_XAAGCCore1;
-	pHalData->PHYRegDef[RF_PATH_B].rfAGCControl1 = rOFDM0_XBAGCCore1;
+	pHalData->PHYRegDef.rfAGCControl1 = rOFDM0_XAAGCCore1;
 
 	/*  AGC control 2 */
-	pHalData->PHYRegDef[RF_PATH_A].rfAGCControl2 = rOFDM0_XAAGCCore2;
-	pHalData->PHYRegDef[RF_PATH_B].rfAGCControl2 = rOFDM0_XBAGCCore2;
+	pHalData->PHYRegDef.rfAGCControl2 = rOFDM0_XAAGCCore2;
 
 	/*  RX AFE control 1 */
-	pHalData->PHYRegDef[RF_PATH_A].rfRxIQImbalance = rOFDM0_XARxIQImbalance;
-	pHalData->PHYRegDef[RF_PATH_B].rfRxIQImbalance = rOFDM0_XBRxIQImbalance;
+	pHalData->PHYRegDef.rfRxIQImbalance = rOFDM0_XARxIQImbalance;
 
 	/*  RX AFE control 1 */
-	pHalData->PHYRegDef[RF_PATH_A].rfRxAFE = rOFDM0_XARxAFE;
-	pHalData->PHYRegDef[RF_PATH_B].rfRxAFE = rOFDM0_XBRxAFE;
+	pHalData->PHYRegDef.rfRxAFE = rOFDM0_XARxAFE;
 
 	/*  Tx AFE control 1 */
-	pHalData->PHYRegDef[RF_PATH_A].rfTxIQImbalance = rOFDM0_XATxIQImbalance;
-	pHalData->PHYRegDef[RF_PATH_B].rfTxIQImbalance = rOFDM0_XBTxIQImbalance;
+	pHalData->PHYRegDef.rfTxIQImbalance = rOFDM0_XATxIQImbalance;
 
 	/*  Tx AFE control 2 */
-	pHalData->PHYRegDef[RF_PATH_A].rfTxAFE = rOFDM0_XATxAFE;
-	pHalData->PHYRegDef[RF_PATH_B].rfTxAFE = rOFDM0_XBTxAFE;
+	pHalData->PHYRegDef.rfTxAFE = rOFDM0_XATxAFE;
 
 	/*  Tranceiver LSSI Readback SI mode */
-	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
-	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBack = rFPGA0_XB_LSSIReadBack;
+	pHalData->PHYRegDef.rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
 
 	/*  Tranceiver LSSI Readback PI mode */
-	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBackPi = TransceiverA_HSPI_Readback;
-	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBackPi = TransceiverB_HSPI_Readback;
+	pHalData->PHYRegDef.rfLSSIReadBackPi = TransceiverA_HSPI_Readback;
 }
 
 void storePwrIndexDiffRateOffset(struct adapter *Adapter, u32 RegAddr, u32 BitMask, u32 Data)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 4a7a877e4017..d043b7bc4142 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -375,7 +375,7 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 	/* Initialize RF */
 
-	pPhyReg = &pHalData->PHYRegDef[0];
+	pPhyReg = &pHalData->PHYRegDef;
 
 	/*----Store original RFENV control type----*/
 	u4RegValue = rtl8188e_PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 5b27bae97e91..44321a53a345 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -141,7 +141,7 @@ struct hal_data_8188e {
 
 	u32	AcParam_BE; /* Original parameter for BE, use for EDCA turbo. */
 
-	struct bb_reg_def PHYRegDef[2];	/* Radio A/B */
+	struct bb_reg_def PHYRegDef;
 
 	u32	RfRegChnlVal;
 
-- 
2.30.2

