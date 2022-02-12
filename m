Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4939A2588
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 16:17:55 +0000 (UTC)
Received: from dslb-188-097-215-215.188.097.pools.vodafone-ip.de ([188.97.215.215] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nIv5s-0007YM-7b; Sat, 12 Feb 2022 17:17:52 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: r8188eu: remove path parameter from phy_RFSerialRead
Date: Sat, 12 Feb 2022 17:17:36 +0100
Message-Id: <20220212161737.381841-10-martin@kaiser.cx>
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

All callers of phy_RFSerialRead set the eRFPath parameter to
RF_PATH_A. Remove the parameter and use RF_PATH_A directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 2dcd1df58aaa..e2e4443b7414 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -104,7 +104,6 @@ void rtl8188e_PHY_SetBBReg(struct adapter *Adapter, u32 RegAddr, u32 BitMask, u3
 *
 * Input:
 *			struct adapter *Adapter,
-*			enum rf_radio_path eRFPath,	Radio path of A/B/C/D
 *			u32			Offset,		The target address to be read
 *
 * Output:	None
@@ -119,13 +118,12 @@ void rtl8188e_PHY_SetBBReg(struct adapter *Adapter, u32 RegAddr, u32 BitMask, u3
 static	u32
 phy_RFSerialRead(
 		struct adapter *Adapter,
-		enum rf_radio_path eRFPath,
 		u32 Offset
 	)
 {
 	u32 retValue = 0;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
-	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef[eRFPath];
+	struct bb_reg_def *pPhyReg = &pHalData->PHYRegDef[RF_PATH_A];
 	u32 NewOffset;
 	u32 tmplong, tmplong2;
 	u8 	RfPiEnable = 0;
@@ -143,10 +141,7 @@ phy_RFSerialRead(
 	/*  For RF A/B write 0x824/82c(does not work in the future) */
 	/*  We must use 0x824 for RF A and B to execute read trigger */
 	tmplong = rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2, bMaskDWord);
-	if (eRFPath == RF_PATH_A)
-		tmplong2 = tmplong;
-	else
-		tmplong2 = rtl8188e_PHY_QueryBBReg(Adapter, pPhyReg->rfHSSIPara2, bMaskDWord);
+	tmplong2 = tmplong;
 
 	tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset << 23) | bLSSIReadEdge;	/* T65 RF */
 
@@ -158,10 +153,7 @@ phy_RFSerialRead(
 
 	udelay(10);/* PlatformStallExecution(10); */
 
-	if (eRFPath == RF_PATH_A)
-		RfPiEnable = (u8)rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1, BIT(8));
-	else if (eRFPath == RF_PATH_B)
-		RfPiEnable = (u8)rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1, BIT(8));
+	RfPiEnable = (u8)rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1, BIT(8));
 
 	if (RfPiEnable) {	/*  Read from BBreg8b8, 12 bits for 8190, 20bits for T65 RF */
 		retValue = rtl8188e_PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBackPi, bLSSIReadBackData);
@@ -265,7 +257,7 @@ u32 rtl8188e_PHY_QueryRFReg(struct adapter *Adapter, u32 RegAddr, u32 BitMask)
 {
 	u32 Original_Value, Readback_Value, BitShift;
 
-	Original_Value = phy_RFSerialRead(Adapter, RF_PATH_A, RegAddr);
+	Original_Value = phy_RFSerialRead(Adapter, RegAddr);
 
 	BitShift =  phy_CalculateBitShift(BitMask);
 	Readback_Value = (Original_Value & BitMask) >> BitShift;
@@ -301,7 +293,7 @@ rtl8188e_PHY_SetRFReg(
 
 	/*  RF data is 12 bits only */
 	if (BitMask != bRFRegOffsetMask) {
-		Original_Value = phy_RFSerialRead(Adapter, RF_PATH_A, RegAddr);
+		Original_Value = phy_RFSerialRead(Adapter, RegAddr);
 		BitShift =  phy_CalculateBitShift(BitMask);
 		Data = ((Original_Value & (~BitMask)) | (Data << BitShift));
 	}
-- 
2.30.2

