Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8F33806B0
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075337; cv=none; b=tCnNWLEPX7GLlCzORfTA3tp1fbIZdTyaZEngRG6BUuHRNvEm6zyorW+VyvkMYmwjPFeZ90kJ6AHWyNYCbjKBoGMMG3iLPnH0vO6oO/mvL0cb+fyIOKftG4sTpuMKmGVSCEbvnt9mzt0w+K7AxznneONQq8yUIjBvnrR2mmNny44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075337; c=relaxed/simple;
	bh=gWVpfhKsEy/We5bWiDSg5v+Ex0/rV2JOgxXVJBi5apQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkbDw1ZL5tgBci0vUnL/5uhoBDM83+rbpJG7QndIamkdpld0WuGpEixwSVq3oWL0gi01ytuJBhy9estHKzUwaKrr/UcRtJzewFRVy5D9b8wG0lVFkmNV7kik9i8JwA+tEPuXswEB3JYBZMb85kJcJv11hko5dz+SomGq6sAPN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WGJGurr1; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WGJGurr1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36fDgHFPcCGx6/5KWrzkcIgi6sZTk+kiZK+MQMJLnWo=;
	b=WGJGurr1+u4Akb2j71aDej3Z6GdiLJQxMVcIXhb5uBAjXtBjNu6fOfN2zPGCBEtU46TzF8
	Nz0povtdUlOuB8CPMcKXizoyWtD2+2DlFAhfMlRAlUNzv+KHC2V4wGfASuq07s3VHfvLIp
	HlssGPj5gOsIp9UNEftM5kqATTMLaz4=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 02/11] staging: rtl8723bs: hal: fix spacing around operators and casts
Date: Mon, 13 Apr 2026 12:14:23 +0200
Message-ID: <20260413101432.158925-3-luka.gejak@linux.dev>
In-Reply-To: <20260413101432.158925-1-luka.gejak@linux.dev>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Fix spaces around operators and casts in the hal directory to adhere
to the Linux kernel coding style. This resolves multiple spacing
warnings reported by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  24 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |   8 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 150 ++++++-------
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |   6 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |  20 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  28 +--
 drivers/staging/rtl8723bs/hal/hal_pwr_seq.c   |  32 +--
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |   2 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  18 +-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |   4 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  50 ++---
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  |   8 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  44 ++--
 .../rtl8723bs/hal/odm_RegConfig8723B.c        |   6 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  84 +++----
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   4 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 208 +++++++++---------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  50 ++---
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   6 +-
 19 files changed, 376 insertions(+), 376 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 0c7d0307b822..fd9b36ac9a38 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -218,7 +218,7 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ArrayLen; i += 2) {
 		u32 v1 = Array[i];
-		u32 v2 = Array[i+1];
+		u32 v2 = Array[i + 1];
 
 		/*  This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
@@ -227,7 +227,7 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 		} else {
 			/*  This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29|BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
 			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
 				bMatched = true;
@@ -247,22 +247,22 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 				 *  Condition isn't matched.
 				 *  Discard the following (offset, data) pairs.
 				 */
-				while (v1 < 0x40000000 && i < ArrayLen-2)
+				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
 				i -= 2; /*  prevent from for-loop += 2 */
 			} else {
 				/*  Configure matched pairs and skip to end of if-else. */
-				while (v1 < 0x40000000 && i < ArrayLen-2) {
+				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigRF_RadioA_8723B(pDM_Odm, v1, v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
 				/*  Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
-				while (cCond != COND_ENDIF && i < ArrayLen-2) {
+				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				}
 			}
 		}
@@ -536,11 +536,11 @@ void ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ARRAY_SIZE(Array_MP_8723B_TXPWR_LMT); i += 6) {
 		u8 *regulation = Array[i];
-		u8 *bandwidth = Array[i+1];
-		u8 *rate = Array[i+2];
-		u8 *rfPath = Array[i+3];
-		u8 *chnl = Array[i+4];
-		u8 *val = Array[i+5];
+		u8 *bandwidth = Array[i + 1];
+		u8 *rate = Array[i + 2];
+		u8 *rfPath = Array[i + 3];
+		u8 *chnl = Array[i + 4];
+		u8 *val = Array[i + 5];
 
 		odm_ConfigBB_TXPWR_LMT_8723B(
 			pDM_Odm,
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a063..254bfef543b1 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -220,13 +220,13 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 				pDM_Odm->RFCalibrateInfo.OFDM_index[p];
 
 			/* 4 7.1 Handle boundary conditions of index. */
-			if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] > c.SwingTableSize_OFDM-1)
-				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = c.SwingTableSize_OFDM-1;
+			if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] > c.SwingTableSize_OFDM - 1)
+				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = c.SwingTableSize_OFDM - 1;
 			else if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] < OFDM_min_index)
 				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = OFDM_min_index;
 		}
-		if (pDM_Odm->RFCalibrateInfo.CCK_index > c.SwingTableSize_CCK-1)
-			pDM_Odm->RFCalibrateInfo.CCK_index = c.SwingTableSize_CCK-1;
+		if (pDM_Odm->RFCalibrateInfo.CCK_index > c.SwingTableSize_CCK - 1)
+			pDM_Odm->RFCalibrateInfo.CCK_index = c.SwingTableSize_CCK - 1;
 		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
 			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
 	} else {
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 8f6849f2277e..5a08a5e3be63 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -51,20 +51,20 @@ static void setIqkMatrix_8723B(
 	s32 ele_A = 0, ele_D, ele_C = 0, value32;
 
 	if (OFDM_index >= OFDM_TABLE_SIZE)
-		OFDM_index = OFDM_TABLE_SIZE-1;
+		OFDM_index = OFDM_TABLE_SIZE - 1;
 
-	ele_D = (OFDMSwingTable_New[OFDM_index] & 0xFFC00000)>>22;
+	ele_D = (OFDMSwingTable_New[OFDM_index] & 0xFFC00000) >> 22;
 
 	/* new element A = element D x X */
 	if (IqkResult_X != 0) {
 		if ((IqkResult_X & 0x00000200) != 0)	/* consider minus */
 			IqkResult_X = IqkResult_X | 0xFFFFFC00;
-		ele_A = ((IqkResult_X * ele_D)>>8)&0x000003FF;
+		ele_A = ((IqkResult_X * ele_D) >> 8) & 0x000003FF;
 
 		/* new element C = element D x Y */
 		if ((IqkResult_Y & 0x00000200) != 0)
 			IqkResult_Y = IqkResult_Y | 0xFFFFFC00;
-		ele_C = ((IqkResult_Y * ele_D)>>8)&0x000003FF;
+		ele_C = ((IqkResult_Y * ele_D) >> 8) & 0x000003FF;
 
 		/* if (RFPath == RF_PATH_A) */
 		switch (RFPath) {
@@ -72,26 +72,26 @@ static void setIqkMatrix_8723B(
 			/* write new elements A, C, D to regC80 and regC94,
 			 * element B is always 0
 			 */
-			value32 = (ele_D<<22)|((ele_C&0x3F)<<16)|ele_A;
+			value32 = (ele_D << 22) | ((ele_C & 0x3F) << 16) | ele_A;
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, value32);
 
-			value32 = (ele_C&0x000003C0)>>6;
+			value32 = (ele_C & 0x000003C0) >> 6;
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, value32);
 
-			value32 = ((IqkResult_X * ele_D)>>7)&0x01;
+			value32 = ((IqkResult_X * ele_D) >> 7) & 0x01;
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, value32);
 			break;
 		case RF_PATH_B:
 			/* write new elements A, C, D to regC88 and regC9C,
 			 * element B is always 0
 			 */
-			value32 = (ele_D<<22)|((ele_C&0x3F)<<16)|ele_A;
+			value32 = (ele_D << 22) | ((ele_C & 0x3F) << 16) | ele_A;
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, value32);
 
-			value32 = (ele_C&0x000003C0)>>6;
+			value32 = (ele_C & 0x000003C0) >> 6;
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, value32);
 
-			value32 = ((IqkResult_X * ele_D)>>7)&0x01;
+			value32 = ((IqkResult_X * ele_D) >> 7) & 0x01;
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, value32);
 
 			break;
@@ -217,7 +217,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			Final_OFDM_Swing_Index = 0;
 
 		if (Final_CCK_Swing_Index >= CCK_TABLE_SIZE)
-			Final_CCK_Swing_Index = CCK_TABLE_SIZE-1;
+			Final_CCK_Swing_Index = CCK_TABLE_SIZE - 1;
 		else if (pDM_Odm->BbSwingIdxCck <= 0)
 			Final_CCK_Swing_Index = 0;
 
@@ -421,16 +421,16 @@ static u8 phy_PathA_IQK_8723B(
 
 
 	/* Allen 20131125 */
-	tmp = (regE9C & 0x03FF0000)>>16;
+	tmp = (regE9C & 0x03FF0000) >> 16;
 	if ((tmp & 0x200) > 0)
 		tmp = 0x400 - tmp;
 
 	if (
 		!(regEAC & BIT28) &&
-		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
-		(((regE9C & 0x03FF0000)>>16) != 0x42) &&
-		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
-		(((regE94 & 0x03FF0000)>>16) > 0xf0) &&
+		(((regE94 & 0x03FF0000) >> 16) != 0x142) &&
+		(((regE9C & 0x03FF0000) >> 16) != 0x42) &&
+		(((regE94 & 0x03FF0000) >> 16) < 0x110) &&
+		(((regE94 & 0x03FF0000) >> 16) > 0xf0) &&
 		(tmp < 0xf)
 	)
 		result |= 0x01;
@@ -520,23 +520,23 @@ static u8 phy_PathA_RxIQK8723B(
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
 	/* Allen 20131125 */
-	tmp = (regE9C & 0x03FF0000)>>16;
+	tmp = (regE9C & 0x03FF0000) >> 16;
 	if ((tmp & 0x200) > 0)
 		tmp = 0x400 - tmp;
 
 	if (
 		!(regEAC & BIT28) &&
-		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
-		(((regE9C & 0x03FF0000)>>16) != 0x42) &&
-		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
-		(((regE94 & 0x03FF0000)>>16) > 0xf0) &&
+		(((regE94 & 0x03FF0000) >> 16) != 0x142) &&
+		(((regE9C & 0x03FF0000) >> 16) != 0x42) &&
+		(((regE94 & 0x03FF0000) >> 16) < 0x110) &&
+		(((regE94 & 0x03FF0000) >> 16) > 0xf0) &&
 		(tmp < 0xf)
 	)
 		result |= 0x01;
 	else				/* if Tx not OK, ignore Rx */
 		return result;
 
-	u4tmp = 0x80007C00 | (regE94&0x3FF0000) | ((regE9C&0x3FF0000) >> 16);
+	u4tmp = 0x80007C00 | (regE94 & 0x3FF0000) | ((regE9C & 0x3FF0000) >> 16);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, u4tmp);
 
 	/* modify RXIQK mode table */
@@ -611,16 +611,16 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
 
 	/* Allen 20131125 */
-	tmp = (regEAC & 0x03FF0000)>>16;
+	tmp = (regEAC & 0x03FF0000) >> 16;
 	if ((tmp & 0x200) > 0)
 		tmp = 0x400 - tmp;
 
 	if (
 		!(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK */
-		(((regEA4 & 0x03FF0000)>>16) != 0x132) &&
-		(((regEAC & 0x03FF0000)>>16) != 0x36) &&
-		(((regEA4 & 0x03FF0000)>>16) < 0x110) &&
-		(((regEA4 & 0x03FF0000)>>16) > 0xf0) &&
+		(((regEA4 & 0x03FF0000) >> 16) != 0x132) &&
+		(((regEAC & 0x03FF0000) >> 16) != 0x36) &&
+		(((regEA4 & 0x03FF0000) >> 16) < 0x110) &&
+		(((regEA4 & 0x03FF0000) >> 16) > 0xf0) &&
 		(tmp < 0xf)
 	)
 		result |= 0x02;
@@ -704,16 +704,16 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
 	/* Allen 20131125 */
-	tmp = (regE9C & 0x03FF0000)>>16;
+	tmp = (regE9C & 0x03FF0000) >> 16;
 	if ((tmp & 0x200) > 0)
 		tmp = 0x400 - tmp;
 
 	if (
 		!(regEAC & BIT28) &&
-		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
-		(((regE9C & 0x03FF0000)>>16) != 0x42) &&
-		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
-		(((regE94 & 0x03FF0000)>>16) > 0xf0) &&
+		(((regE94 & 0x03FF0000) >> 16) != 0x142) &&
+		(((regE9C & 0x03FF0000) >> 16) != 0x42) &&
+		(((regE94 & 0x03FF0000) >> 16) < 0x110) &&
+		(((regE94 & 0x03FF0000) >> 16) > 0xf0) &&
 		(tmp < 0xf)
 	)
 		result |= 0x01;
@@ -799,23 +799,23 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
 	/* Allen 20131125 */
-	tmp = (regE9C & 0x03FF0000)>>16;
+	tmp = (regE9C & 0x03FF0000) >> 16;
 	if ((tmp & 0x200) > 0)
 		tmp = 0x400 - tmp;
 
 	if (
 		!(regEAC & BIT28) &&
-		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
-		(((regE9C & 0x03FF0000)>>16) != 0x42)  &&
-		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
-		(((regE94 & 0x03FF0000)>>16) > 0xf0) &&
+		(((regE94 & 0x03FF0000) >> 16) != 0x142) &&
+		(((regE9C & 0x03FF0000) >> 16) != 0x42)  &&
+		(((regE94 & 0x03FF0000) >> 16) < 0x110) &&
+		(((regE94 & 0x03FF0000) >> 16) > 0xf0) &&
 		(tmp < 0xf)
 	)
 			result |= 0x01;
 	else	/* if Tx not OK, ignore Rx */
 		return result;
 
-	u4tmp = 0x80007C00 | (regE94&0x3FF0000)  | ((regE9C&0x3FF0000) >> 16);
+	u4tmp = 0x80007C00 | (regE94 & 0x3FF0000)  | ((regE9C & 0x3FF0000) >> 16);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, u4tmp);
 
 	/* modify RXIQK mode table */
@@ -891,16 +891,16 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 
 	/* Allen 20131125 */
-	tmp = (regEAC & 0x03FF0000)>>16;
+	tmp = (regEAC & 0x03FF0000) >> 16;
 	if ((tmp & 0x200) > 0)
 		tmp = 0x400 - tmp;
 
 	if (
 		!(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK */
-		(((regEA4 & 0x03FF0000)>>16) != 0x132) &&
-		(((regEAC & 0x03FF0000)>>16) != 0x36) &&
-		(((regEA4 & 0x03FF0000)>>16) < 0x110) &&
-		(((regEA4 & 0x03FF0000)>>16) > 0xf0) &&
+		(((regEA4 & 0x03FF0000) >> 16) != 0x132) &&
+		(((regEAC & 0x03FF0000) >> 16) != 0x36) &&
+		(((regEA4 & 0x03FF0000) >> 16) < 0x110) &&
+		(((regEA4 & 0x03FF0000) >> 16) > 0xf0) &&
 		(tmp < 0xf)
 	)
 		result |= 0x02;
@@ -935,7 +935,7 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		TX0_A = (X * Oldval_0) >> 8;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x3FF, TX0_A);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(31), ((X*Oldval_0>>7) & 0x1));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(31), ((X * Oldval_0 >> 7) & 0x1));
 
 		Y = result[final_candidate][1];
 		if ((Y & 0x00000200) != 0)
@@ -943,15 +943,15 @@ static void _PHY_PathAFillIQKMatrix8723B(
 
 		/* 2 Tx IQC */
 		TX0_C = (Y * Oldval_0) >> 8;
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, 0xF0000000, ((TX0_C&0x3C0)>>6));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, 0xF0000000, ((TX0_C & 0x3C0) >> 6));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x003F0000, (TX0_C&0x3F));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x003F0000, (TX0_C & 0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(29), ((Y*Oldval_0>>7) & 0x1));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(29), ((Y * Oldval_0 >> 7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
@@ -1010,7 +1010,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x3FF, TX1_A);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(27), ((X*Oldval_1>>7) & 0x1));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(27), ((X * Oldval_1 >> 7) & 0x1));
 
 		Y = result[final_candidate][5];
 		if ((Y & 0x00000200) != 0)
@@ -1019,17 +1019,17 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		TX1_C = (Y * Oldval_1) >> 8;
 
 		/* 2 Tx IQC */
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C & 0x3C0) >> 6));
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x003F0000, (TX1_C&0x3F));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x003F0000, (TX1_C & 0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(25), ((Y*Oldval_1>>7) & 0x1));
+		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(25), ((Y * Oldval_1 >> 7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
@@ -1053,7 +1053,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		reg = (result[final_candidate][7] >> 6) & 0xF;
 /* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28) | (PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord) & 0x0fffffff);
 	}
 }
 
@@ -1195,9 +1195,9 @@ static void _PHY_MACSettingCalibration8723B(
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], 0x3F);
 
 	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++) {
-		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT3)));
+		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i] & (~BIT3)));
 	}
-	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT5)));
+	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i] & (~BIT5)));
 
 }
 
@@ -1237,21 +1237,21 @@ static bool phy_SimularityCompare_8723B(
 
 		if (diff > MAX_TOLERANCE) {
 			if ((i == 2 || i == 6) && !SimularityBitMap) {
-				if (result[c1][i]+result[c1][i+1] == 0)
-					final_candidate[(i/4)] = c2;
-				else if (result[c2][i]+result[c2][i+1] == 0)
-					final_candidate[(i/4)] = c1;
+				if (result[c1][i] + result[c1][i + 1] == 0)
+					final_candidate[(i / 4)] = c2;
+				else if (result[c2][i] + result[c2][i + 1] == 0)
+					final_candidate[(i / 4)] = c1;
 				else
-					SimularityBitMap = SimularityBitMap|(1<<i);
+					SimularityBitMap = SimularityBitMap | (1 << i);
 			} else
-				SimularityBitMap = SimularityBitMap|(1<<i);
+				SimularityBitMap = SimularityBitMap | (1 << i);
 		}
 	}
 
 	if (SimularityBitMap == 0) {
-		for (i = 0; i < (bound/4); i++) {
+		for (i = 0; i < (bound / 4); i++) {
 			if (final_candidate[i] != 0xFF) {
-				for (j = i*4; j < (i+1)*4-2; j++)
+				for (j = i * 4; j < (i + 1) * 4 - 2; j++)
 					result[3][j] = result[final_candidate[i]][j];
 				bResult = false;
 			}
@@ -1409,8 +1409,8 @@ static void phy_IQCalibrate_8723B(
 		if (PathAOK == 0x03) {
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord) & 0x3FF0000) >> 16;
+				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord) & 0x3FF0000) >> 16;
 			break;
 		}
 	}
@@ -1429,8 +1429,8 @@ static void phy_IQCalibrate_8723B(
 				PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
 
-				result[t][4] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][5] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				result[t][4] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord) & 0x3FF0000) >> 16;
+				result[t][5] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord) & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1441,8 +1441,8 @@ static void phy_IQCalibrate_8723B(
 			if (PathBOK == 0x03) {
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord) & 0x3FF0000) >> 16;
+				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord) & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1493,12 +1493,12 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 	/* Check continuous TX and Packet TX */
 	tmpReg = rtw_read8(pDM_Odm->Adapter, 0xd03);
 
-	if ((tmpReg&0x70) != 0)			/* Deal with contisuous TX case */
-		rtw_write8(pDM_Odm->Adapter, 0xd03, tmpReg&0x8F);	/* disable all continuous TX */
+	if ((tmpReg & 0x70) != 0)			/* Deal with contisuous TX case */
+		rtw_write8(pDM_Odm->Adapter, 0xd03, tmpReg & 0x8F);	/* disable all continuous TX */
 	else							/*  Deal with Packet TX case */
 		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0xFF);		/*  block all queues */
 
-	if ((tmpReg&0x70) != 0) {
+	if ((tmpReg & 0x70) != 0) {
 		/* 1. Read original RF mode */
 		/* Path-A */
 		RF_Amode = PHY_QueryRFReg(padapter, RF_PATH_A, RF_AC, bMask12Bits);
@@ -1509,11 +1509,11 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 
 		/* 2. Set RF mode = standby mode */
 		/* Path-A */
-		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_AC, bMask12Bits, (RF_Amode&0x8FFFF)|0x10000);
+		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_AC, bMask12Bits, (RF_Amode & 0x8FFFF) | 0x10000);
 
 		/* Path-B */
 		if (is2T)
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, (RF_Bmode&0x8FFFF)|0x10000);
+			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, (RF_Bmode & 0x8FFFF) | 0x10000);
 	}
 
 	/* 3. Read RF reg18 */
@@ -1521,7 +1521,7 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 
 	/* 4. Set LC calibration begin	bit15 */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFBE0); /*  LDO ON */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal|0x08000);
+	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal | 0x08000);
 
 	mdelay(100);
 
@@ -1533,7 +1533,7 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 	}
 
 	/* Restore original situation */
-	if ((tmpReg&0x70) != 0) { /* Deal with contisuous TX case */
+	if ((tmpReg & 0x70) != 0) { /* Deal with contisuous TX case */
 		/* Path-A */
 		rtw_write8(pDM_Odm->Adapter, 0xd03, tmpReg);
 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_AC, bMask12Bits, RF_Amode);
diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 86404b5e6c52..3069bbd52379 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -88,7 +88,7 @@ u8 HalPwrSeqCmdParsing(
 					value &= (~(GET_PWR_CFG_MASK(PwrCfgCmd)));
 					value |= (
 						GET_PWR_CFG_VALUE(PwrCfgCmd)
-						&GET_PWR_CFG_MASK(PwrCfgCmd)
+ & GET_PWR_CFG_MASK(PwrCfgCmd)
 					);
 
 					/*  Write the value back to system register */
@@ -106,7 +106,7 @@ u8 HalPwrSeqCmdParsing(
 					else
 						value = rtw_read8(padapter, offset);
 
-					value = value&GET_PWR_CFG_MASK(PwrCfgCmd);
+					value = value & GET_PWR_CFG_MASK(PwrCfgCmd);
 					if (
 						value == (GET_PWR_CFG_VALUE(PwrCfgCmd) &
 						GET_PWR_CFG_MASK(PwrCfgCmd))
@@ -126,7 +126,7 @@ u8 HalPwrSeqCmdParsing(
 				if (GET_PWR_CFG_VALUE(PwrCfgCmd) == PWRSEQ_DELAY_US)
 					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd));
 				else
-					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd)*1000);
+					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd) * 1000);
 				break;
 
 			case PWR_CMD_END:
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..0444650798f2 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -552,7 +552,7 @@ void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *pst
 	/* b/g mode ra_bitmap */
 	for (i = 0; i < sizeof(psta->bssrateset); i++) {
 		if (psta->bssrateset[i])
-			tx_ra_bitmap |= rtw_get_bit_value_from_ieee_value(psta->bssrateset[i]&0x7f);
+			tx_ra_bitmap |= rtw_get_bit_value_from_ieee_value(psta->bssrateset[i] & 0x7f);
 	}
 
 	/* n mode ra_bitmap */
@@ -560,13 +560,13 @@ void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *pst
 		limit = 8; /*   1R */
 
 		for (i = 0; i < limit; i++) {
-			if (psta->htpriv.ht_cap.mcs.rx_mask[i/8] & BIT(i%8))
-				tx_ra_bitmap |= BIT(i+12);
+			if (psta->htpriv.ht_cap.mcs.rx_mask[i / 8] & BIT(i % 8))
+				tx_ra_bitmap |= BIT(i + 12);
 		}
 	}
 
 	psta->ra_mask = tx_ra_bitmap;
-	psta->init_rate = get_highest_rate_idx(tx_ra_bitmap)&0x3f;
+	psta->init_rate = get_highest_rate_idx(tx_ra_bitmap) & 0x3f;
 }
 
 void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
@@ -583,7 +583,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		u16 reg_scr;
 
 		reg_scr = rtw_read16(adapter, REG_SECCFG);
-		rtw_write16(adapter, REG_SECCFG, reg_scr|SCR_CHK_KEYID|SCR_RxDecEnable|SCR_TxEncEnable);
+		rtw_write16(adapter, REG_SECCFG, reg_scr | SCR_CHK_KEYID | SCR_RxDecEnable | SCR_TxEncEnable);
 	}
 		break;
 	case HW_VAR_SEC_DK_CFG:
@@ -594,9 +594,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
 			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
-				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
+				reg_scr |= (SCR_RxUseDK | SCR_TxUseDK);
 		} else /* Disable default key related setting */
-			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
+			reg_scr &= ~(SCR_RXBCUSEDK | SCR_TXBCUSEDK | SCR_RxUseDK | SCR_TxUseDK);
 
 		rtw_write8(adapter, REG_SECCFG, reg_scr);
 	}
@@ -773,7 +773,7 @@ bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 {
 	/* switch counter to RX fifo */
-	rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xf0);
+	rtw_write8(adapter, REG_RXERR_RPT + 3, rtw_read8(adapter, REG_RXERR_RPT + 3) | 0xf0);
 }
 
 static u32 Array_kfreemap[] = {
@@ -805,13 +805,13 @@ void rtw_bb_rf_gain_offset(struct adapter *padapter)
 
 			for (i = 0; i < ARRAY_SIZE(Array_kfreemap); i += 2) {
 				v1 = Array[i];
-				v2 = Array[i+1];
+				v2 = Array[i + 1];
 				if (v1 == padapter->eeprompriv.EEPROMRFGainVal) {
 					target = v2;
 					break;
 				}
 			}
-			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT18|BIT17|BIT16|BIT15, target);
+			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT18 | BIT17 | BIT16 | BIT15, target);
 
 			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
 		}
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index bdd595a99b98..a67a49288f4a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -152,7 +152,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_12M);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_18M);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -165,7 +165,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_48M);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_54M);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -173,7 +173,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 
 	case rTxAGC_A_CCK1_Mcs32:
 		RateIndex[0] = PHY_GetRateIndexOfTxPowerByRate(MGN_1M);
-		PwrByRateVal[0] = (s8) ((((Value >> (8 + 4)) & 0xF)) * 10 +
+		PwrByRateVal[0] = (s8)((((Value >> (8 + 4)) & 0xF)) * 10 +
 										((Value >> 8) & 0xF));
 		*RateNum = 1;
 		break;
@@ -184,13 +184,13 @@ PHY_GetRateValuesOfTxPowerByRate(
 			RateIndex[1] = PHY_GetRateIndexOfTxPowerByRate(MGN_5_5M);
 			RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_11M);
 			for (i = 1; i < 4; ++i) {
-				PwrByRateVal[i - 1] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+				PwrByRateVal[i - 1] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 												((Value >> (i * 8)) & 0xF));
 			}
 			*RateNum = 3;
 		} else if (BitMask == 0x000000ff) {
 			RateIndex[0] = PHY_GetRateIndexOfTxPowerByRate(MGN_11M);
-			PwrByRateVal[0] = (s8) ((((Value >> 4) & 0xF)) * 10 + (Value & 0xF));
+			PwrByRateVal[0] = (s8)((((Value >> 4) & 0xF)) * 10 + (Value & 0xF));
 			*RateNum = 1;
 		}
 		break;
@@ -202,7 +202,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS2);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS3);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -215,7 +215,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS6);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS7);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -226,7 +226,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[1] = PHY_GetRateIndexOfTxPowerByRate(MGN_2M);
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_5_5M);
 		for (i = 1; i < 4; ++i) {
-			PwrByRateVal[i - 1] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i - 1] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 3;
@@ -241,7 +241,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_5_5M);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_11M);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -256,7 +256,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_12M);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_18M);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -271,7 +271,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_48M);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_54M);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -286,7 +286,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS2);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS3);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -301,7 +301,7 @@ PHY_GetRateValuesOfTxPowerByRate(
 		RateIndex[2] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS6);
 		RateIndex[3] = PHY_GetRateIndexOfTxPowerByRate(MGN_MCS7);
 		for (i = 0; i < 4; ++i) {
-			PwrByRateVal[i] = (s8) ((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
+			PwrByRateVal[i] = (s8)((((Value >> (i * 8 + 4)) & 0xF)) * 10 +
 											((Value >> (i * 8)) & 0xF));
 		}
 		*RateNum = 4;
@@ -459,7 +459,7 @@ u8 PHY_GetTxPowerIndexBase(
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 txPower = 0;
-	u8 chnlIdx = (Channel-1);
+	u8 chnlIdx = (Channel - 1);
 
 	if (HAL_IsLegalChannel(padapter, Channel) == false)
 		chnlIdx = 0;
diff --git a/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c b/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
index 2438931ca51b..87a8f1a65bbb 100644
--- a/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
+++ b/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
@@ -22,7 +22,7 @@ Major Change History:
 /* drivers should parse below arrays and do the corresponding actions */
 /* 3 Power on  Array */
 struct wlan_pwr_cfg rtl8723B_power_on_flow[
-	RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+
+	RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS +
 	RTL8723B_TRANS_END_STEPS
 ] = {
 	RTL8723B_TRANS_CARDEMU_TO_ACT
@@ -31,7 +31,7 @@ struct wlan_pwr_cfg rtl8723B_power_on_flow[
 
 /* 3Radio off GPIO Array */
 struct wlan_pwr_cfg rtl8723B_radio_off_flow[
-	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS+
+	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS +
 	RTL8723B_TRANS_END_STEPS
 ] = {
 	RTL8723B_TRANS_ACT_TO_CARDEMU
@@ -40,8 +40,8 @@ struct wlan_pwr_cfg rtl8723B_radio_off_flow[
 
 /* 3Card Disable Array */
 struct wlan_pwr_cfg rtl8723B_card_disable_flow[
-	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS+
-	RTL8723B_TRANS_CARDEMU_TO_PDN_STEPS+
+	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS +
+	RTL8723B_TRANS_CARDEMU_TO_PDN_STEPS +
 	RTL8723B_TRANS_END_STEPS
 ] = {
 	RTL8723B_TRANS_ACT_TO_CARDEMU
@@ -51,8 +51,8 @@ struct wlan_pwr_cfg rtl8723B_card_disable_flow[
 
 /* 3 Card Enable Array */
 struct wlan_pwr_cfg rtl8723B_card_enable_flow[
-	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS+
-	RTL8723B_TRANS_CARDEMU_TO_PDN_STEPS+
+	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS +
+	RTL8723B_TRANS_CARDEMU_TO_PDN_STEPS +
 	RTL8723B_TRANS_END_STEPS
 ] = {
 	RTL8723B_TRANS_CARDDIS_TO_CARDEMU
@@ -62,8 +62,8 @@ struct wlan_pwr_cfg rtl8723B_card_enable_flow[
 
 /* 3Suspend Array */
 struct wlan_pwr_cfg rtl8723B_suspend_flow[
-	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS+
-	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS+
+	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS +
+	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS +
 	RTL8723B_TRANS_END_STEPS
 ] = {
 	RTL8723B_TRANS_ACT_TO_CARDEMU
@@ -73,8 +73,8 @@ struct wlan_pwr_cfg rtl8723B_suspend_flow[
 
 /* 3 Resume Array */
 struct wlan_pwr_cfg rtl8723B_resume_flow[
-	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS+
-	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS+
+	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS +
+	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS +
 	RTL8723B_TRANS_END_STEPS
 ] = {
 	RTL8723B_TRANS_SUS_TO_CARDEMU
@@ -84,8 +84,8 @@ struct wlan_pwr_cfg rtl8723B_resume_flow[
 
 /* 3HWPDN Array */
 struct wlan_pwr_cfg rtl8723B_hwpdn_flow[
-	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS+
-	RTL8723B_TRANS_CARDEMU_TO_PDN_STEPS+
+	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS +
+	RTL8723B_TRANS_CARDEMU_TO_PDN_STEPS +
 	RTL8723B_TRANS_END_STEPS
 ] = {
 	RTL8723B_TRANS_ACT_TO_CARDEMU
@@ -95,7 +95,7 @@ struct wlan_pwr_cfg rtl8723B_hwpdn_flow[
 
 /* 3 Enter LPS */
 struct wlan_pwr_cfg rtl8723B_enter_lps_flow[
-	RTL8723B_TRANS_ACT_TO_LPS_STEPS+RTL8723B_TRANS_END_STEPS
+	RTL8723B_TRANS_ACT_TO_LPS_STEPS + RTL8723B_TRANS_END_STEPS
 ] = {
 	/* FW behavior */
 	RTL8723B_TRANS_ACT_TO_LPS
@@ -104,7 +104,7 @@ struct wlan_pwr_cfg rtl8723B_enter_lps_flow[
 
 /* 3 Leave LPS */
 struct wlan_pwr_cfg rtl8723B_leave_lps_flow[
-	RTL8723B_TRANS_LPS_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS
+	RTL8723B_TRANS_LPS_TO_ACT_STEPS + RTL8723B_TRANS_END_STEPS
 ] = {
 	/* FW behavior */
 	RTL8723B_TRANS_LPS_TO_ACT
@@ -113,7 +113,7 @@ struct wlan_pwr_cfg rtl8723B_leave_lps_flow[
 
 /* 3 Enter SW LPS */
 struct wlan_pwr_cfg rtl8723B_enter_swlps_flow[
-	RTL8723B_TRANS_ACT_TO_SWLPS_STEPS+RTL8723B_TRANS_END_STEPS
+	RTL8723B_TRANS_ACT_TO_SWLPS_STEPS + RTL8723B_TRANS_END_STEPS
 ] = {
 	/* SW behavior */
 	RTL8723B_TRANS_ACT_TO_SWLPS
@@ -122,7 +122,7 @@ struct wlan_pwr_cfg rtl8723B_enter_swlps_flow[
 
 /* 3 Leave SW LPS */
 struct wlan_pwr_cfg rtl8723B_leave_swlps_flow[
-	RTL8723B_TRANS_SWLPS_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS
+	RTL8723B_TRANS_SWLPS_TO_ACT_STEPS + RTL8723B_TRANS_END_STEPS
 ] = {
 	/* SW behavior */
 	RTL8723B_TRANS_SWLPS_TO_ACT
diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 665c85eccbdf..1d29245da231 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -24,7 +24,7 @@ u8 rtw_hal_sdio_query_tx_freepage(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-	if ((pHalData->SdioTxFIFOFreePage[PageIdx]+pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
+	if ((pHalData->SdioTxFIFOFreePage[PageIdx] + pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
 		return true;
 	else
 		return false;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 3dffa7620768..f33cc282f3b2 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -131,8 +131,8 @@ u8 CCKSwingTable_Ch14_New[CCK_TABLE_SIZE][8] = {
 
 static void odm_CommonInfoSelfInit(struct dm_odm_t *pDM_Odm)
 {
-	pDM_Odm->bCckHighPower = (bool) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT), ODM_BIT(CCK_RPT_FORMAT));
-	pDM_Odm->RFPathRxEnable = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH), ODM_BIT(BB_RX_PATH));
+	pDM_Odm->bCckHighPower = (bool)PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT), ODM_BIT(CCK_RPT_FORMAT));
+	pDM_Odm->RFPathRxEnable = (u8)PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH), ODM_BIT(BB_RX_PATH));
 
 	pDM_Odm->TxRate = 0xFF;
 }
@@ -145,9 +145,9 @@ static void odm_CommonInfoSelfUpdate(struct dm_odm_t *pDM_Odm)
 
 	if (*(pDM_Odm->pBandWidth) == ODM_BW40M) {
 		if (*(pDM_Odm->pSecChOffset) == 1)
-			pDM_Odm->ControlChannel = *(pDM_Odm->pChannel)-2;
+			pDM_Odm->ControlChannel = *(pDM_Odm->pChannel) - 2;
 		else if (*(pDM_Odm->pSecChOffset) == 2)
-			pDM_Odm->ControlChannel = *(pDM_Odm->pChannel)+2;
+			pDM_Odm->ControlChannel = *(pDM_Odm->pChannel) + 2;
 	} else
 		pDM_Odm->ControlChannel = *(pDM_Odm->pChannel);
 
@@ -219,7 +219,7 @@ u32 ODM_Get_Rate_Bitmap(
 			rate_bitmap = 0x00000ff0;
 		break;
 
-	case (ODM_WM_B|ODM_WM_G):
+	case (ODM_WM_B | ODM_WM_G):
 		if (rssi_level == DM_RATR_STA_HIGH)
 			rate_bitmap = 0x00000f00;
 		else if (rssi_level == DM_RATR_STA_MIDDLE)
@@ -228,9 +228,9 @@ u32 ODM_Get_Rate_Bitmap(
 			rate_bitmap = 0x00000ff5;
 		break;
 
-	case (ODM_WM_B|ODM_WM_G|ODM_WM_N24G):
-	case (ODM_WM_B|ODM_WM_N24G):
-	case (ODM_WM_G|ODM_WM_N24G):
+	case (ODM_WM_B | ODM_WM_G | ODM_WM_N24G):
+	case (ODM_WM_B | ODM_WM_N24G):
+	case (ODM_WM_G | ODM_WM_N24G):
 		if (rssi_level == DM_RATR_STA_HIGH)
 			rate_bitmap = 0x000f0000;
 		else if (rssi_level == DM_RATR_STA_MIDDLE)
@@ -425,7 +425,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 					tmpEntryMaxPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
 
 				if (psta->rssi_stat.UndecoratedSmoothedPWDB != (-1))
-					PWDB_rssi[sta_cnt++] = (psta->mac_id | (psta->rssi_stat.UndecoratedSmoothedPWDB<<16));
+					PWDB_rssi[sta_cnt++] = (psta->mac_id | (psta->rssi_stat.UndecoratedSmoothedPWDB << 16));
 			}
 		}
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 0eaedd8f6469..084e745d4ee0 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -122,8 +122,8 @@ void ODM_CfoTracking(void *pDM_VOID)
 		/* 4 1.3 Avoid abnormal large CFO */
 		CFO_ave_diff =
 			(pCfoTrack->CFO_ave_pre >= CFO_ave) ?
-			(pCfoTrack->CFO_ave_pre-CFO_ave) :
-			(CFO_ave-pCfoTrack->CFO_ave_pre);
+			(pCfoTrack->CFO_ave_pre - CFO_ave) :
+			(CFO_ave - pCfoTrack->CFO_ave_pre);
 
 		if (
 			CFO_ave_diff > 20 &&
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index a31c8368f9d9..8b754923b7d4 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -12,14 +12,14 @@ void odm_NHMCounterStatisticsInit(void *pDM_VOID)
 	struct dm_odm_t	*pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
 	/* PHY parameters initialize for n series */
-	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N+2, 0x2710);	/* 0x894[31:16]= 0x2710	Time duration for NHM unit: 4us, 0x2710 =40ms */
+	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N + 2, 0x2710);	/* 0x894[31:16]= 0x2710	Time duration for NHM unit: 4us, 0x2710 =40ms */
 	/* rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N+2, 0x4e20);	0x894[31:16]= 0x4e20	Time duration for NHM unit: 4us, 0x4e20 =80ms */
-	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N+2, 0xffff);	/* 0x890[31:16]= 0xffff	th_9, th_10 */
+	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N + 2, 0xffff);	/* 0x890[31:16]= 0xffff	th_9, th_10 */
 	/* rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff5c);	0x898 = 0xffffff5c		th_3, th_2, th_1, th_0 */
 	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff52);	/* 0x898 = 0xffffff52		th_3, th_2, th_1, th_0 */
 	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH7_TO_TH4_11N, 0xffffffff);	/* 0x89c = 0xffffffff		th_7, th_6, th_5, th_4 */
 	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_FPGA0_IQK_11N, bMaskByte0, 0xff);		/* 0xe28[7:0]= 0xff		th_8 */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT10|BIT9|BIT8, 0x7);	/* 0x890[9:8]=3			enable CCX */
+	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT10 | BIT9 | BIT8, 0x7);	/* 0x890[9:8]=3			enable CCX */
 	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_RSTC_11N, BIT7, 0x1);		/* 0xc0c[7]= 1			max power among all RX ants */
 }
 
@@ -72,16 +72,16 @@ void odm_NHMBB(void *pDM_VOID)
 	/* struct false_ALARM_STATISTICS *pFalseAlmCnt = &pDM_Odm->FalseAlmCnt; */
 
 	pDM_Odm->NHMCurTxOkcnt =
-		*(pDM_Odm->pNumTxBytesUnicast)-pDM_Odm->NHMLastTxOkcnt;
+		*(pDM_Odm->pNumTxBytesUnicast) - pDM_Odm->NHMLastTxOkcnt;
 	pDM_Odm->NHMCurRxOkcnt =
-		*(pDM_Odm->pNumRxBytesUnicast)-pDM_Odm->NHMLastRxOkcnt;
+		*(pDM_Odm->pNumRxBytesUnicast) - pDM_Odm->NHMLastRxOkcnt;
 	pDM_Odm->NHMLastTxOkcnt =
 		*(pDM_Odm->pNumTxBytesUnicast);
 	pDM_Odm->NHMLastRxOkcnt =
 		*(pDM_Odm->pNumRxBytesUnicast);
 
 
-	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
+	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt << 2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
 		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag == true) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
 			/* test_status = 1; */
@@ -129,7 +129,7 @@ void odm_SearchPwdBLowerBound(void *pDM_VOID, u8 IGI_target)
 	ODM_Write_DIG(pDM_Odm, IGI);
 
 
-	Diff = IGI_target-(s8)IGI;
+	Diff = IGI_target - (s8)IGI;
 	TH_L2H_dmc = pDM_Odm->TH_L2H_ini + Diff;
 	if (TH_L2H_dmc > 10)
 		TH_L2H_dmc = 10;
@@ -152,7 +152,7 @@ void odm_SearchPwdBLowerBound(void *pDM_VOID, u8 IGI_target)
 		}
 
 		if (pDM_Odm->txEdcca1 > 5) {
-			IGI = IGI-1;
+			IGI = IGI - 1;
 			TH_L2H_dmc = TH_L2H_dmc + 1;
 			if (TH_L2H_dmc > 10)
 				TH_L2H_dmc = 10;
@@ -229,7 +229,7 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 		IGI_target = pDM_Odm->IGI_Base + 2;
 	else
 		IGI_target = pDM_Odm->IGI_Base;
-	pDM_Odm->IGI_target = (u8) IGI_target;
+	pDM_Odm->IGI_target = (u8)IGI_target;
 
 	/* Search pwdB lower bound */
 	if (pDM_Odm->TxHangFlg == true) {
@@ -260,7 +260,7 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 		odm_NHMBB(pDM_Odm);
 
 	if (EDCCA_State) {
-		Diff = IGI_target-(s8)IGI;
+		Diff = IGI_target - (s8)IGI;
 		TH_L2H_dmc = pDM_Odm->TH_L2H_ini + Diff;
 		if (TH_L2H_dmc > 10)
 			TH_L2H_dmc = 10;
@@ -336,7 +336,7 @@ void odm_DIGInit(void *pDM_VOID)
 
 	pDM_DigTable->bStopDIG = false;
 	pDM_DigTable->bPSDInProgress = false;
-	pDM_DigTable->CurIGValue = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A), ODM_BIT(IGI));
+	pDM_DigTable->CurIGValue = (u8)PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A), ODM_BIT(IGI));
 	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DMfalseALARM_THRESH_LOW;
@@ -444,7 +444,7 @@ void odm_DIG(void *pDM_VOID)
 				if (pDM_DigTable->AntDiv_RSSI_max > DIG_MaxOfMin)
 					DIG_Dynamic_MIN = DIG_MaxOfMin;
 				else
-					DIG_Dynamic_MIN = (u8) pDM_DigTable->AntDiv_RSSI_max;
+					DIG_Dynamic_MIN = (u8)pDM_DigTable->AntDiv_RSSI_max;
 			}
 		}
 	}
@@ -574,16 +574,16 @@ void odm_DIGbyRSSI_LPS(void *pDM_VOID)
 	u8 RSSI_Lower = DM_DIG_MIN_NIC;   /* 0x1E or 0x1C */
 	u8 CurrentIGI = pDM_Odm->RSSI_Min;
 
-	CurrentIGI = CurrentIGI+RSSI_OFFSET_DIG;
+	CurrentIGI = CurrentIGI + RSSI_OFFSET_DIG;
 
 	/*  Using FW PS mode to make IGI */
 	/* Adjust by  FA in LPS MODE */
 	if (pFalseAlmCnt->Cnt_all > DM_DIG_FA_TH2_LPS)
-		CurrentIGI = CurrentIGI+4;
+		CurrentIGI = CurrentIGI + 4;
 	else if (pFalseAlmCnt->Cnt_all > DM_DIG_FA_TH1_LPS)
-		CurrentIGI = CurrentIGI+2;
+		CurrentIGI = CurrentIGI + 2;
 	else if (pFalseAlmCnt->Cnt_all < DM_DIG_FA_TH0_LPS)
-		CurrentIGI = CurrentIGI-2;
+		CurrentIGI = CurrentIGI - 2;
 
 
 	/* Lower bound checking */
@@ -623,25 +623,25 @@ void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
 	ret_value = PHY_QueryBBReg(
 		pDM_Odm->Adapter, ODM_REG_OFDM_FA_TYPE1_11N, bMaskDWord
 	);
-	FalseAlmCnt->Cnt_Fast_Fsync = (ret_value&0xffff);
-	FalseAlmCnt->Cnt_SB_Search_fail = ((ret_value&0xffff0000)>>16);
+	FalseAlmCnt->Cnt_Fast_Fsync = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_SB_Search_fail = ((ret_value & 0xffff0000) >> 16);
 
 	ret_value = PHY_QueryBBReg(
 		pDM_Odm->Adapter, ODM_REG_OFDM_FA_TYPE2_11N, bMaskDWord
 	);
-	FalseAlmCnt->Cnt_OFDM_CCA = (ret_value&0xffff);
-	FalseAlmCnt->Cnt_Parity_Fail = ((ret_value&0xffff0000)>>16);
+	FalseAlmCnt->Cnt_OFDM_CCA = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_Parity_Fail = ((ret_value & 0xffff0000) >> 16);
 
 	ret_value = PHY_QueryBBReg(
 		pDM_Odm->Adapter, ODM_REG_OFDM_FA_TYPE3_11N, bMaskDWord
 	);
-	FalseAlmCnt->Cnt_Rate_Illegal = (ret_value&0xffff);
-	FalseAlmCnt->Cnt_Crc8_fail = ((ret_value&0xffff0000)>>16);
+	FalseAlmCnt->Cnt_Rate_Illegal = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_Crc8_fail = ((ret_value & 0xffff0000) >> 16);
 
 	ret_value = PHY_QueryBBReg(
 		pDM_Odm->Adapter, ODM_REG_OFDM_FA_TYPE4_11N, bMaskDWord
 	);
-	FalseAlmCnt->Cnt_Mcs_fail = (ret_value&0xffff);
+	FalseAlmCnt->Cnt_Mcs_fail = (ret_value & 0xffff);
 
 	FalseAlmCnt->Cnt_Ofdm_fail =
 		FalseAlmCnt->Cnt_Parity_Fail +
@@ -664,13 +664,13 @@ void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
 		ret_value = PHY_QueryBBReg(
 			pDM_Odm->Adapter, ODM_REG_CCK_FA_MSB_11N, bMaskByte3
 		);
-		FalseAlmCnt->Cnt_Cck_fail += (ret_value&0xff)<<8;
+		FalseAlmCnt->Cnt_Cck_fail += (ret_value & 0xff) << 8;
 
 		ret_value = PHY_QueryBBReg(
 			pDM_Odm->Adapter, ODM_REG_CCK_CCA_CNT_11N, bMaskDWord
 		);
 		FalseAlmCnt->Cnt_CCK_CCA =
-			((ret_value&0xFF)<<8) | ((ret_value&0xFF00)>>8);
+			((ret_value & 0xFF) << 8) | ((ret_value & 0xFF00) >> 8);
 	}
 
 	FalseAlmCnt->Cnt_all = (
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index 57c5736527d2..bb342d7004fd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -34,10 +34,10 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 
 	if (pDM_PSTable->initialize == 0) {
 
-		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord)&0x1CC000)>>14;
-		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord)&BIT3)>>3;
-		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord)&0xFF000000)>>24;
-		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord)&0xF000)>>12;
+		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
+		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT3) >> 3;
+		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
+		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord) & 0xF000) >> 12;
 		/* Reg818 = PHY_QueryBBReg(padapter, 0x818, bMaskDWord); */
 		pDM_PSTable->initialize = 1;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 994b8c578e7a..a0c163979916 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -29,7 +29,7 @@ s32 odm_signal_scale_mapping(struct dm_odm_t *dm_odm, s32 curr_sig)
 		if (curr_sig >= 51 && curr_sig <= 100)
 			ret_sig = 100;
 		else if (curr_sig >= 41 && curr_sig <= 50)
-			ret_sig = 80 + ((curr_sig - 40)*2);
+			ret_sig = 80 + ((curr_sig - 40) * 2);
 		else if (curr_sig >= 31 && curr_sig <= 40)
 			ret_sig = 66 + (curr_sig - 30);
 		else if (curr_sig >= 21 && curr_sig <= 30)
@@ -134,7 +134,7 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 		 * 2011.11.28 LukeLee: 88E use different LNA & VGA gain table
 		 * The RSSI formula should be modified according to the gain table
 		 */
-		lna_idx = ((cck_agc_rpt & 0xE0)>>5);
+		lna_idx = ((cck_agc_rpt & 0xE0) >> 5);
 		vga_idx = (cck_agc_rpt & 0x1F);
 		rx_pwr_all = odm_cck_rssi(lna_idx, vga_idx);
 		pwdb_all = odm_query_rx_pwr_percentage(rx_pwr_all);
@@ -161,7 +161,7 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 				else if (sq_rpt < 20)
 					sq = 100;
 				else
-					sq = ((64-sq_rpt) * 100) / 44;
+					sq = ((64 - sq_rpt) * 100) / 44;
 
 			}
 
@@ -194,7 +194,7 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 			phy_info->rx_mimo_signal_strength[i] = (u8)rssi;
 
 			/* Get Rx snr value in DB */
-			phy_info->rx_snr[i] = dm_odm->PhyDbgInfo.RxSNRdB[i] = (s32)(phy_sta_rpt->path_rxsnr[i]/2);
+			phy_info->rx_snr[i] = dm_odm->PhyDbgInfo.RxSNRdB[i] = (s32)(phy_sta_rpt->path_rxsnr[i] / 2);
 		}
 
 		/*
@@ -309,11 +309,11 @@ static void odm_Process_RSSIForDM(
 					RSSI_min = pPhyInfo->rx_mimo_signal_strength[RF_PATH_A];
 				}
 
-				if ((RSSI_max-RSSI_min) < 3)
+				if ((RSSI_max - RSSI_min) < 3)
 					RSSI_Ave = RSSI_max;
-				else if ((RSSI_max-RSSI_min) < 6)
+				else if ((RSSI_max - RSSI_min) < 6)
 					RSSI_Ave = RSSI_max - 1;
-				else if ((RSSI_max-RSSI_min) < 10)
+				else if ((RSSI_max - RSSI_min) < 10)
 					RSSI_Ave = RSSI_max - 2;
 				else
 					RSSI_Ave = RSSI_max - 3;
@@ -325,21 +325,21 @@ static void odm_Process_RSSIForDM(
 			else {
 				if (pPhyInfo->rx_pwd_ba11 > (u32)UndecoratedSmoothedOFDM) {
 					UndecoratedSmoothedOFDM =
-							((UndecoratedSmoothedOFDM*(Rx_Smooth_Factor-1)) +
-							RSSI_Ave)/Rx_Smooth_Factor;
+							((UndecoratedSmoothedOFDM * (Rx_Smooth_Factor - 1)) +
+							RSSI_Ave) / Rx_Smooth_Factor;
 					UndecoratedSmoothedOFDM = UndecoratedSmoothedOFDM + 1;
 				} else {
 					UndecoratedSmoothedOFDM =
-							((UndecoratedSmoothedOFDM*(Rx_Smooth_Factor-1)) +
-							RSSI_Ave)/Rx_Smooth_Factor;
+							((UndecoratedSmoothedOFDM * (Rx_Smooth_Factor - 1)) +
+							RSSI_Ave) / Rx_Smooth_Factor;
 				}
 			}
 
-			pEntry->rssi_stat.PacketMap = (pEntry->rssi_stat.PacketMap<<1) | BIT0;
+			pEntry->rssi_stat.PacketMap = (pEntry->rssi_stat.PacketMap << 1) | BIT0;
 
 		} else {
 			RSSI_Ave = pPhyInfo->rx_pwd_ba11;
-			pDM_Odm->RSSI_A = (u8) pPhyInfo->rx_pwd_ba11;
+			pDM_Odm->RSSI_A = (u8)pPhyInfo->rx_pwd_ba11;
 			pDM_Odm->RSSI_B = 0;
 
 			/* 1 Process CCK RSSI */
@@ -348,16 +348,16 @@ static void odm_Process_RSSIForDM(
 			else {
 				if (pPhyInfo->rx_pwd_ba11 > (u32)UndecoratedSmoothedCCK) {
 					UndecoratedSmoothedCCK =
-							((UndecoratedSmoothedCCK*(Rx_Smooth_Factor-1)) +
-							pPhyInfo->rx_pwd_ba11)/Rx_Smooth_Factor;
+							((UndecoratedSmoothedCCK * (Rx_Smooth_Factor - 1)) +
+							pPhyInfo->rx_pwd_ba11) / Rx_Smooth_Factor;
 					UndecoratedSmoothedCCK = UndecoratedSmoothedCCK + 1;
 				} else {
 					UndecoratedSmoothedCCK =
-							((UndecoratedSmoothedCCK*(Rx_Smooth_Factor-1)) +
-							pPhyInfo->rx_pwd_ba11)/Rx_Smooth_Factor;
+							((UndecoratedSmoothedCCK * (Rx_Smooth_Factor - 1)) +
+							pPhyInfo->rx_pwd_ba11) / Rx_Smooth_Factor;
 				}
 			}
-			pEntry->rssi_stat.PacketMap = pEntry->rssi_stat.PacketMap<<1;
+			pEntry->rssi_stat.PacketMap = pEntry->rssi_stat.PacketMap << 1;
 		}
 
 		/* if (pEntry) */
@@ -369,14 +369,14 @@ static void odm_Process_RSSIForDM(
 				pEntry->rssi_stat.ValidBit++;
 
 			for (i = 0; i < pEntry->rssi_stat.ValidBit; i++)
-				OFDM_pkt += (u8)(pEntry->rssi_stat.PacketMap>>i)&BIT0;
+				OFDM_pkt += (u8)(pEntry->rssi_stat.PacketMap >> i) & BIT0;
 
 			if (pEntry->rssi_stat.ValidBit == 64) {
-				Weighting = ((OFDM_pkt<<4) > 64)?64:(OFDM_pkt<<4);
-				UndecoratedSmoothedPWDB = (Weighting*UndecoratedSmoothedOFDM+(64-Weighting)*UndecoratedSmoothedCCK)>>6;
+				Weighting = ((OFDM_pkt << 4) > 64) ? 64 : (OFDM_pkt << 4);
+				UndecoratedSmoothedPWDB = (Weighting * UndecoratedSmoothedOFDM + (64 - Weighting) * UndecoratedSmoothedCCK) >> 6;
 			} else {
 				if (pEntry->rssi_stat.ValidBit != 0)
-					UndecoratedSmoothedPWDB = (OFDM_pkt*UndecoratedSmoothedOFDM+(pEntry->rssi_stat.ValidBit-OFDM_pkt)*UndecoratedSmoothedCCK)/pEntry->rssi_stat.ValidBit;
+					UndecoratedSmoothedPWDB = (OFDM_pkt * UndecoratedSmoothedOFDM + (pEntry->rssi_stat.ValidBit - OFDM_pkt) * UndecoratedSmoothedCCK) / pEntry->rssi_stat.ValidBit;
 				else
 					UndecoratedSmoothedPWDB = 0;
 			}
diff --git a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
index b0ca46aec1a5..9d073f06cf62 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
+++ b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
@@ -33,7 +33,7 @@ void odm_ConfigRFReg_8723B(
 
 			udelay(1);
 
-			while ((getvalue>>8) != (Data>>8)) {
+			while ((getvalue >> 8) != (Data >> 8)) {
 				count++;
 				PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH, RegAddr, bRFRegOffsetMask, Data);
 				udelay(1);
@@ -87,14 +87,14 @@ void odm_ConfigRFReg_8723B(
 void odm_ConfigRF_RadioA_8723B(struct dm_odm_t *pDM_Odm, u32 Addr, u32 Data)
 {
 	u32  content = 0x1000; /*  RF_Content: radioa_txt */
-	u32 maskforPhySet = (u32)(content&0xE000);
+	u32 maskforPhySet = (u32)(content & 0xE000);
 
 	odm_ConfigRFReg_8723B(
 		pDM_Odm,
 		Addr,
 		Data,
 		RF_PATH_A,
-		Addr|maskforPhySet
+		Addr | maskforPhySet
 	);
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 12416e499ac3..79f3f723fd5b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -75,23 +75,23 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 			goto exit;
 
 		if (CmdLen <= 3)
-			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, CmdLen);
+			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, CmdLen);
 		else {
-			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
-			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
+			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, 3);
+			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer + 3, CmdLen - 3);
 /* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
 
 		if (CmdLen > 3) {
-			msgbox_ex_addr = REG_HMEBOX_EXT0_8723B + (h2c_box_num*RTL8723B_EX_MESSAGE_BOX_SIZE);
+			msgbox_ex_addr = REG_HMEBOX_EXT0_8723B + (h2c_box_num * RTL8723B_EX_MESSAGE_BOX_SIZE);
 			rtw_write32(padapter, msgbox_ex_addr, h2c_cmd_ex);
 		}
-		msgbox_addr = REG_HMEBOX_0 + (h2c_box_num*MESSAGE_BOX_SIZE);
+		msgbox_addr = REG_HMEBOX_0 + (h2c_box_num * MESSAGE_BOX_SIZE);
 		rtw_write32(padapter, msgbox_addr, h2c_cmd);
 
-		pHalData->LastHMEBoxNum = (h2c_box_num+1) % MAX_H2C_BOX_NUMS;
+		pHalData->LastHMEBoxNum = (h2c_box_num + 1) % MAX_H2C_BOX_NUMS;
 
 	} while (0);
 
@@ -144,9 +144,9 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	pframe += 2;
 	pktlen += 2;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		pktlen += cur_network->ie_length - sizeof(struct ndis_802_11_fix_ie);
-		memcpy(pframe, cur_network->ies+sizeof(struct ndis_802_11_fix_ie), pktlen);
+		memcpy(pframe, cur_network->ies + sizeof(struct ndis_802_11_fix_ie), pktlen);
 
 		goto _ConstructBeacon;
 	}
@@ -163,7 +163,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	/*  DS parameter set */
 	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pktlen);
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
 		/*  IBSS Parameter Set... */
 		/* ATIMWindow = cur->configuration.ATIMWindow; */
@@ -332,7 +332,7 @@ void rtl8723b_set_rssi_cmd(struct adapter *padapter, u8 *param)
 {
 	u8 u1H2CRssiSettingParm[H2C_RSSI_SETTING_LEN] = {0};
 	u8 mac_id = *param;
-	u8 rssi = *(param+2);
+	u8 rssi = *(param + 2);
 	u8 uldl_state = 0;
 
 	SET_8723B_H2CCMD_RSSI_SETTING_MACID(u1H2CRssiSettingParm, mac_id);
@@ -351,7 +351,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	u8 PowerState = 0, awake_intvl = 1, byte5 = 0, rlbm = 0;
 
 	if (pwrpriv->dtim > 0 && pwrpriv->dtim < 16)
-		awake_intvl = pwrpriv->dtim+1;/* DTIM = (awake_intvl - 1) */
+		awake_intvl = pwrpriv->dtim + 1;/* DTIM = (awake_intvl - 1) */
 	else
 		awake_intvl = 3;/* DTIM =2 */
 
@@ -402,7 +402,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 			pmlmeext->DrvBcnTimeOut = 0xff;
 
 			for (i = 0; i < 9; i++) {
-				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i]*100)/pmlmeext->bcn_cnt;
+				pmlmeext->bcn_delay_ratio[i] = (pmlmeext->bcn_delay_cnt[i] * 100) / pmlmeext->bcn_cnt;
 
 				ratio_20_delay += pmlmeext->bcn_delay_ratio[i];
 				ratio_80_delay += pmlmeext->bcn_delay_ratio[i];
@@ -501,7 +501,7 @@ static void rtl8723b_set_FwRsvdPagePkt(
 	pmlmeinfo = &pmlmeext->mlmext_info;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B + WOWLAN_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -523,18 +523,18 @@ static void rtl8723b_set_FwRsvdPagePkt(
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (2) ps-poll */
 	RsvdPageLoc.LocPsPoll = TotalPageNum;
 	ConstructPSPoll(padapter, &ReservedPagePacket[BufIndex], &PSPollLength);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], PSPollLength, true, false, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], PSPollLength, true, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + PSPollLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (3) null data */
 	RsvdPageLoc.LocNullData = TotalPageNum;
@@ -545,13 +545,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		false, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], NullDataLength, false, false, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], NullDataLength, false, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + NullDataLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (5) Qos null data */
 	RsvdPageLoc.LocQosNull = TotalPageNum;
@@ -562,13 +562,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], QosNullLength, false, false, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], QosNullLength, false, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + QosNullLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/* 3 (6) BT Qos null data */
 	RsvdPageLoc.LocBTQosNull = TotalPageNum;
@@ -579,13 +579,13 @@ static void rtl8723b_set_FwRsvdPagePkt(
 		get_my_bssid(&pmlmeinfo->network),
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	TotalPacketLen = BufIndex + BTQosNullLength;
 
@@ -626,12 +626,12 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 
 		/*  We should set AID, correct TSF, HW seq enable before set JoinBssReport to Fw in 88/92C. */
 		/*  Suggested by filen. Added by tynli. */
-		rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000|pmlmeinfo->aid));
+		rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000 | pmlmeinfo->aid));
 
 		/*  set REG_CR bit 8 */
-		v8 = rtw_read8(padapter, REG_CR+1);
+		v8 = rtw_read8(padapter, REG_CR + 1);
 		v8 |= BIT(0); /*  ENSWBCN */
-		rtw_write8(padapter, REG_CR+1, v8);
+		rtw_write8(padapter, REG_CR + 1, v8);
 
 		/*  Disable Hw protection for a time which revserd for Hw sending beacon. */
 		/*  Fix download reserved page packet fail that access collision with the protection time. */
@@ -646,7 +646,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 			bRecover = true;
 
 		/*  To tell Hw the packet is not a real beacon frame. */
-		rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
+		rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl & ~BIT(6));
 		pHalData->RegFwHwTxQCtrl &= ~BIT(6);
 
 		/*  Clear beacon valid check bit. */
@@ -665,7 +665,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
@@ -688,14 +688,14 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 		/*  the beacon cannot be sent by HW. */
 		/*  2010.06.23. Added by tynli. */
 		if (bRecover) {
-			rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl | BIT(6));
+			rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl | BIT(6));
 			pHalData->RegFwHwTxQCtrl |= BIT(6);
 		}
 
 		/*  Clear CR[8] or beacon packet will not be send to TxBuf anymore. */
-		v8 = rtw_read8(padapter, REG_CR+1);
+		v8 = rtw_read8(padapter, REG_CR + 1);
 		v8 &= ~BIT(0); /*  ~ENSWBCN */
-		rtw_write8(padapter, REG_CR+1, v8);
+		rtw_write8(padapter, REG_CR + 1, v8);
 	}
 }
 
@@ -724,7 +724,7 @@ void rtl8723b_Add_RateATid(
 	u8 raid = arg[1];
 	u8 shortGI = arg[2];
 	u8 bw;
-	u32 mask = bitmap&0x0FFFFFFF;
+	u32 mask = bitmap & 0x0FFFFFFF;
 
 	psta = pmlmeinfo->FW_sta_info[mac_id].psta;
 	if (!psta)
@@ -813,7 +813,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 	PageSize = PAGE_SIZE_TX_8723B;
 
 	RsvdPageNum = BCNQ_PAGE_NUM_8723B;
-	MaxRsvdPageBufSize = RsvdPageNum*PageSize;
+	MaxRsvdPageBufSize = RsvdPageNum * PageSize;
 
 	pcmdframe = rtw_alloc_cmdxmitframe(pxmitpriv);
 	if (!pcmdframe)
@@ -834,7 +834,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		CurtPktPageNum += 1;
 	TotalPageNum += CurtPktPageNum;
 
-	BufIndex += (CurtPktPageNum*PageSize);
+	BufIndex += (CurtPktPageNum * PageSize);
 
 	/*  Jump to lastest page */
 	if (BufIndex < (MaxRsvdPageBufSize - PageSize)) {
@@ -851,7 +851,7 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 		NULL,
 		true, 0, 0, false
 	);
-	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex-TxDescLen], BTQosNullLength, false, true, false);
+	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
 
@@ -893,12 +893,12 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	/*  We should set AID, correct TSF, HW seq enable before set JoinBssReport to Fw in 88/92C. */
 	/*  Suggested by filen. Added by tynli. */
-	rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000|pmlmeinfo->aid));
+	rtw_write16(padapter, REG_BCN_PSR_RPT, (0xC000 | pmlmeinfo->aid));
 
 	/*  set REG_CR bit 8 */
-	val8 = rtw_read8(padapter, REG_CR+1);
+	val8 = rtw_read8(padapter, REG_CR + 1);
 	val8 |= BIT(0); /*  ENSWBCN */
-	rtw_write8(padapter,  REG_CR+1, val8);
+	rtw_write8(padapter,  REG_CR + 1, val8);
 
 	/*  Disable Hw protection for a time which revserd for Hw sending beacon. */
 	/*  Fix download reserved page packet fail that access collision with the protection time. */
@@ -914,7 +914,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	/*  To tell Hw the packet is not a real beacon frame. */
 	pHalData->RegFwHwTxQCtrl &= ~BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
 
 	/*  Clear beacon valid check bit. */
 	rtw_hal_set_hwreg(padapter, HW_VAR_BCN_VALID, NULL);
@@ -931,7 +931,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	if (bcn_valid) {
@@ -953,11 +953,11 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 	/*  2010.06.23. Added by tynli. */
 	if (bRecover) {
 		pHalData->RegFwHwTxQCtrl |= BIT(6);
-		rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
+		rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
 	}
 
 	/*  Clear CR[8] or beacon packet will not be send to TxBuf anymore. */
-	val8 = rtw_read8(padapter, REG_CR+1);
+	val8 = rtw_read8(padapter, REG_CR + 1);
 	val8 &= ~BIT(0); /*  ~ENSWBCN */
-	rtw_write8(padapter, REG_CR+1, val8);
+	rtw_write8(padapter, REG_CR + 1, val8);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..eaa4306716ff 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -45,7 +45,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
-	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
+	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION | ODM_RF_TX_PWR_TRACK;
 
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 }
@@ -189,7 +189,7 @@ void rtl8723b_hal_dm_in_lps(struct adapter *padapter)
 	/* set rssi to fw */
 	psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
 	if (psta && (psta->rssi_stat.UndecoratedSmoothedPWDB > 0)) {
-		PWDB_rssi = (psta->mac_id | (psta->rssi_stat.UndecoratedSmoothedPWDB<<16));
+		PWDB_rssi = (psta->mac_id | (psta->rssi_stat.UndecoratedSmoothedPWDB << 16));
 
 		rtl8723b_set_rssi_cmd(padapter, (u8 *)&PWDB_rssi);
 	}
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..07e212552e52 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -21,23 +21,23 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, tmp | 0x04);
 
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
-		rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
+		rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
 
 		do {
 			tmp = rtw_read8(padapter, REG_MCUFWDL);
 			if (tmp & 0x01)
 				break;
-			rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
+			rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
 			msleep(1);
 		} while (count++ < 100);
 
 		/*  8051 reset */
-		tmp = rtw_read8(padapter, REG_MCUFWDL+2);
-		rtw_write8(padapter, REG_MCUFWDL+2, tmp&0xf7);
+		tmp = rtw_read8(padapter, REG_MCUFWDL + 2);
+		rtw_write8(padapter, REG_MCUFWDL + 2, tmp & 0xf7);
 	} else {
 		/*  MCU firmware download disable. */
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
-		rtw_write8(padapter, REG_MCUFWDL, tmp&0xfe);
+		rtw_write8(padapter, REG_MCUFWDL, tmp & 0xfe);
 	}
 }
 
@@ -70,8 +70,8 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	if (remainSize_p1) {
 		offset = blockCount_p1 * blockSize_p1;
 
-		blockCount_p2 = remainSize_p1/blockSize_p2;
-		remainSize_p2 = remainSize_p1%blockSize_p2;
+		blockCount_p2 = remainSize_p1 / blockSize_p2;
+		remainSize_p2 = remainSize_p1 % blockSize_p2;
 	}
 
 	/* 3 Phase #3 */
@@ -102,10 +102,10 @@ static int _PageWrite(
 )
 {
 	u8 value8;
-	u8 u8Page = (u8) (page & 0x07);
+	u8 u8Page = (u8)(page & 0x07);
 
-	value8 = (rtw_read8(padapter, REG_MCUFWDL+2) & 0xF8) | u8Page;
-	rtw_write8(padapter, REG_MCUFWDL+2, value8);
+	value8 = (rtw_read8(padapter, REG_MCUFWDL + 2) & 0xF8) | u8Page;
+	rtw_write8(padapter, REG_MCUFWDL + 2, value8);
 
 	return _BlockWrite(padapter, buffer, size);
 }
@@ -124,7 +124,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 
 	for (page = 0; page < pageNums; page++) {
 		offset = page * MAX_DLFW_PAGE_SIZE;
-		ret = _PageWrite(padapter, page, bufferPtr+offset, MAX_DLFW_PAGE_SIZE);
+		ret = _PageWrite(padapter, page, bufferPtr + offset, MAX_DLFW_PAGE_SIZE);
 
 		if (ret == _FAIL) {
 			netdev_dbg(padapter->pnetdev, "page write failed at %s %d\n",
@@ -136,7 +136,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 	if (remainSize) {
 		offset = pageNums * MAX_DLFW_PAGE_SIZE;
 		page = pageNums;
-		ret = _PageWrite(padapter, page, bufferPtr+offset, remainSize);
+		ret = _PageWrite(padapter, page, bufferPtr + offset, remainSize);
 
 		if (ret == _FAIL) {
 			netdev_dbg(padapter->pnetdev, "remaining page write failed at %s %d\n",
@@ -195,7 +195,7 @@ static s32 polling_fwdl_chksum(
 		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->bDriverStopped)
 			break;
 		yield();
-	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
+	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
 	if (!(value32 & FWDL_ChkSum_rpt)) {
 		goto exit;
@@ -266,7 +266,7 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		!(IS_FW_81xxC(padapter) && ((pHalData->FirmwareVersion < 0x21) || (pHalData->FirmwareVersion == 0x21 && pHalData->FirmwareSubVersion < 0x01)))
 	) { /*  after 88C Fw v33.1 */
 		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
-		rtw_write8(padapter, REG_HMETFR+3, 0x20);
+		rtw_write8(padapter, REG_HMETFR + 3, 0x20);
 
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		while (val & BIT2) {
@@ -394,7 +394,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 		(write_fw++ < 3 || jiffies_to_msecs(jiffies - fwdl_start_time) < 500)
 	) {
 		/* reset FWDL chksum */
-		rtw_write8(padapter, REG_MCUFWDL, rtw_read8(padapter, REG_MCUFWDL)|FWDL_ChkSum_rpt);
+		rtw_write8(padapter, REG_MCUFWDL, rtw_read8(padapter, REG_MCUFWDL) | FWDL_ChkSum_rpt);
 
 		rtStatus = _WriteFW(padapter, pFirmwareBuf, FirmwareLen);
 		if (rtStatus != _SUCCESS)
@@ -507,9 +507,9 @@ void Hal_GetEfuseDefinition(
 			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
-				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
+				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B - EFUSE_OOB_PROTECT_BYTES);
 			else
-				*pu2Tmp = (EFUSE_BT_REAL_BANK_CONTENT_LEN-EFUSE_PROTECT_BYTES_BANK);
+				*pu2Tmp = (EFUSE_BT_REAL_BANK_CONTENT_LEN - EFUSE_PROTECT_BYTES_BANK);
 		}
 		break;
 
@@ -518,9 +518,9 @@ void Hal_GetEfuseDefinition(
 			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
-				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
+				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B - EFUSE_OOB_PROTECT_BYTES);
 			else
-				*pu2Tmp = (EFUSE_BT_REAL_CONTENT_LEN-(EFUSE_PROTECT_BYTES_BANK*3));
+				*pu2Tmp = (EFUSE_BT_REAL_CONTENT_LEN - (EFUSE_PROTECT_BYTES_BANK * 3));
 		}
 		break;
 
@@ -577,17 +577,17 @@ void Hal_EfusePowerSwitch(
 	if (PwrState) {
 		/*  To avoid cannot access efuse registers after disable/enable several times during DTM test. */
 		/*  Suggested by SD1 IsaacHsu. 2013.07.08, added by tynli. */
-		tempval = rtw_read8(padapter, SDIO_LOCAL_BASE|SDIO_REG_HSUS_CTRL);
+		tempval = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HSUS_CTRL);
 		if (tempval & BIT(0)) { /*  SDIO local register is suspend */
 			u8 count = 0;
 
 
 			tempval &= ~BIT(0);
-			rtw_write8(padapter, SDIO_LOCAL_BASE|SDIO_REG_HSUS_CTRL, tempval);
+			rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HSUS_CTRL, tempval);
 
 			/*  check 0x86[1:0]= 10'2h, wait power state to leave suspend */
 			do {
-				tempval = rtw_read8(padapter, SDIO_LOCAL_BASE|SDIO_REG_HSUS_CTRL);
+				tempval = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HSUS_CTRL);
 				tempval &= 0x3;
 				if (tempval == 0x02)
 					break;
@@ -677,28 +677,28 @@ static void hal_ReadEFuse_WiFi(
 			addr = offset * PGPKT_DATA_SIZE;
 			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 				/*  Check word enable condition in the section */
-				if (!(wden & (0x01<<i))) {
+				if (!(wden & (0x01 << i))) {
 					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
 					efuseTbl[addr] = efuseData;
 
 					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
-					efuseTbl[addr+1] = efuseData;
+					efuseTbl[addr + 1] = efuseData;
 				}
 				addr += 2;
 			}
 		} else {
-			eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+			eFuse_Addr += Efuse_CalculateWordCnts(wden) * 2;
 		}
 	}
 
 	/*  Copy from Efuse map to output pointer memory!!! */
 	for (i = 0; i < _size_byte; i++)
-		pbuf[i] = efuseTbl[_offset+i];
+		pbuf[i] = efuseTbl[_offset + i];
 
 	/*  Calculate Efuse utilization */
 	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total);
 	used = eFuse_Addr - 1;
-	efuse_usage = (u8)((used*100)/total);
+	efuse_usage = (u8)((used * 100) / total);
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_USAGE, (u8 *)&efuse_usage);
@@ -769,17 +769,17 @@ static void hal_ReadEFuse_BT(
 
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
-					if (!(wden & (0x01<<i))) {
+					if (!(wden & (0x01 << i))) {
 						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
 						efuseTbl[addr] = efuseData;
 
 						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
-						efuseTbl[addr+1] = efuseData;
+						efuseTbl[addr + 1] = efuseData;
 					}
 					addr += 2;
 				}
 			} else {
-				eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+				eFuse_Addr += Efuse_CalculateWordCnts(wden) * 2;
 			}
 		}
 
@@ -793,14 +793,14 @@ static void hal_ReadEFuse_BT(
 
 	/*  Copy from Efuse map to output pointer memory!!! */
 	for (i = 0; i < _size_byte; i++)
-		pbuf[i] = efuseTbl[_offset+i];
+		pbuf[i] = efuseTbl[_offset + i];
 
 	/*  */
 	/*  Calculate Efuse utilization. */
 	/*  */
 	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total);
-	used = (EFUSE_BT_REAL_BANK_CONTENT_LEN*(bank-1)) + eFuse_Addr - 1;
-	efuse_usage = (u8)((used*100)/total);
+	used = (EFUSE_BT_REAL_BANK_CONTENT_LEN * (bank - 1)) + eFuse_Addr - 1;
+	efuse_usage = (u8)((used * 100) / total);
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_USAGE, (u8 *)&efuse_usage);
@@ -836,7 +836,7 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	ChipVersion.ICType = CHIP_8723B;
 	ChipVersion.ChipType = ((value32 & RTL_ID) ? TEST_CHIP : NORMAL_CHIP);
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
-	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK)>>CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
+	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK) >> CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 
 	/*  For regulator mode. by tynli. 2011.01.14 */
 	pHalData->RegulatorMode = ((value32 & SPS_SEL) ? RT_LDO_REGULATOR : RT_SWITCHING_REGULATOR);
@@ -892,20 +892,20 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL+2);
-	pHalData->RegReg542 = rtw_read8(padapter, REG_TBTT_PROHIBIT+2);
-	pHalData->RegCR_1 = rtw_read8(padapter, REG_CR+1);
+	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL + 2);
+	pHalData->RegReg542 = rtw_read8(padapter, REG_TBTT_PROHIBIT + 2);
+	pHalData->RegCR_1 = rtw_read8(padapter, REG_CR + 1);
 }
 
 void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	rtw_write8(Adapter, 0x4c7, rtw_read8(Adapter, 0x4c7)|BIT(7)); /* enable single pkt ampdu */
+	rtw_write8(Adapter, 0x4c7, rtw_read8(Adapter, 0x4c7) | BIT(7)); /* enable single pkt ampdu */
 	rtw_write8(Adapter, REG_RX_PKT_LIMIT_8723B, 0x18);		/* for VHT packet length 11K */
 	rtw_write8(Adapter, REG_MAX_AGGR_NUM_8723B, 0x1F);
 	rtw_write8(Adapter, REG_PIFS_8723B, 0x00);
-	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL)&(~BIT(7)));
+	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL) & (~BIT(7)));
 	if (pHalData->AMPDUBurstMode)
 		rtw_write8(Adapter, REG_AMPDU_BURST_MODE_8723B,  0x5F);
 	rtw_write8(Adapter, REG_AMPDU_MAX_TIME_8723B, 0x70);
@@ -913,13 +913,13 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 	/*  ARFB table 9 for 11ac 5G 2SS */
 	rtw_write32(Adapter, REG_ARFR0_8723B, 0x00000010);
 	if (IS_NORMAL_CHIP(pHalData->VersionID))
-		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0xfffff000);
+		rtw_write32(Adapter, REG_ARFR0_8723B + 4, 0xfffff000);
 	else
-		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0x3e0ff000);
+		rtw_write32(Adapter, REG_ARFR0_8723B + 4, 0x3e0ff000);
 
 	/*  ARFB table 10 for 11ac 5G 1SS */
 	rtw_write32(Adapter, REG_ARFR1_8723B, 0x00000010);
-	rtw_write32(Adapter, REG_ARFR1_8723B+4, 0x003ff000);
+	rtw_write32(Adapter, REG_ARFR1_8723B + 4, 0x003ff000);
 }
 
 static void ResumeTxBeacon(struct adapter *padapter)
@@ -927,10 +927,10 @@ static void ResumeTxBeacon(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
 	pHalData->RegFwHwTxQCtrl |= BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, 0xff);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 1, 0xff);
 	pHalData->RegReg542 |= BIT(0);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+2, pHalData->RegReg542);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 2, pHalData->RegReg542);
 }
 
 static void StopTxBeacon(struct adapter *padapter)
@@ -938,16 +938,16 @@ static void StopTxBeacon(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
 	pHalData->RegFwHwTxQCtrl &= ~BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, 0x64);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 1, 0x64);
 	pHalData->RegReg542 &= ~BIT(0);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+2, pHalData->RegReg542);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 2, pHalData->RegReg542);
 }
 
 static void _BeaconFunctionEnable(struct adapter *padapter, u8 Enable, u8 Linked)
 {
 	rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT | EN_BCN_FUNCTION | DIS_BCNQ_SUB);
-	rtw_write8(padapter, REG_RD_CTRL+1, 0x6F);
+	rtw_write8(padapter, REG_RD_CTRL + 1, 0x6F);
 }
 
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
@@ -998,7 +998,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE) == true) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
@@ -1014,9 +1014,9 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 {
 	if (enable)
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) | BIT1);
+		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) | BIT1);
 	else
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) & ~BIT1);
+		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) & ~BIT1);
 }
 
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
@@ -1107,11 +1107,11 @@ void rtl8723b_init_default_value(struct adapter *padapter)
 	memset(pHalData->EfuseHal.fakeEfuseModifiedMap, 0xFF, EFUSE_MAX_MAP_LEN);
 	pHalData->EfuseHal.BTEfuseUsedBytes = 0;
 	pHalData->EfuseHal.BTEfuseUsedPercentage = 0;
-	memset(pHalData->EfuseHal.BTEfuseContent, 0xFF, EFUSE_MAX_BT_BANK*EFUSE_MAX_HW_SIZE);
+	memset(pHalData->EfuseHal.BTEfuseContent, 0xFF, EFUSE_MAX_BT_BANK * EFUSE_MAX_HW_SIZE);
 	memset(pHalData->EfuseHal.BTEfuseInitMap, 0xFF, EFUSE_BT_MAX_MAP_LEN);
 	memset(pHalData->EfuseHal.BTEfuseModifiedMap, 0xFF, EFUSE_BT_MAX_MAP_LEN);
 	pHalData->EfuseHal.fakeBTEfuseUsedBytes = 0;
-	memset(pHalData->EfuseHal.fakeBTEfuseContent, 0xFF, EFUSE_MAX_BT_BANK*EFUSE_MAX_HW_SIZE);
+	memset(pHalData->EfuseHal.fakeBTEfuseContent, 0xFF, EFUSE_MAX_BT_BANK * EFUSE_MAX_HW_SIZE);
 	memset(pHalData->EfuseHal.fakeBTEfuseInitMap, 0xFF, EFUSE_BT_MAX_MAP_LEN);
 	memset(pHalData->EfuseHal.fakeBTEfuseModifiedMap, 0xFF, EFUSE_BT_MAX_MAP_LEN);
 #endif
@@ -1221,7 +1221,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 
 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
 
-	if (0xFF == PROMContent[eeAddr+1])
+	if (0xFF == PROMContent[eeAddr + 1])
 		AutoLoadFail = true;
 
 	if (AutoLoadFail) {
@@ -1258,7 +1258,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				pwrInfo24G->IndexCCK_Base[rfPath][group] = EEPROM_DEFAULT_24G_INDEX;
 		}
 
-		for (group = 0; group < MAX_CHNL_GROUP_24G-1; group++) {
+		for (group = 0; group < MAX_CHNL_GROUP_24G - 1; group++) {
 			pwrInfo24G->IndexBW40_Base[rfPath][group] =	PROMContent[eeAddr++];
 			if (pwrInfo24G->IndexBW40_Base[rfPath][group] == 0xFF)
 				pwrInfo24G->IndexBW40_Base[rfPath][group] =	EEPROM_DEFAULT_24G_INDEX;
@@ -1270,7 +1270,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	EEPROM_DEFAULT_24G_HT20_DIFF;
 				else {
-					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	(PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	(PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1278,7 +1278,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_24G_OFDM_DIFF;
 				else {
-					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1288,7 +1288,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW40_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->BW40_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->BW40_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->BW40_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW40_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1296,7 +1296,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->BW20_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->BW20_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1305,7 +1305,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1313,7 +1313,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->CCK_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->CCK_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->CCK_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->CCK_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->CCK_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1339,7 +1339,7 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 
 			hal_get_chnl_group_8723b(ch + 1, &group);
 
-			if (ch == 14-1) {
+			if (ch == 14 - 1) {
 				pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][5];
 				pHalData->Index24G_BW40_Base[rfPath][ch] = pwrInfo24G.IndexBW40_Base[rfPath][group];
 			} else {
@@ -1358,9 +1358,9 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 
 	/*  2010/10/19 MH Add Regulator recognize for CU. */
 	if (!AutoLoadFail) {
-		pHalData->EEPROMRegulatory = (PROMContent[EEPROM_RF_BOARD_OPTION_8723B]&0x7);	/* bit0~2 */
+		pHalData->EEPROMRegulatory = (PROMContent[EEPROM_RF_BOARD_OPTION_8723B] & 0x7);	/* bit0~2 */
 		if (PROMContent[EEPROM_RF_BOARD_OPTION_8723B] == 0xFF)
-			pHalData->EEPROMRegulatory = (EEPROM_DEFAULT_BOARD_OPTION&0x7);	/* bit0~2 */
+			pHalData->EEPROMRegulatory = (EEPROM_DEFAULT_BOARD_OPTION & 0x7);	/* bit0~2 */
 	} else
 		pHalData->EEPROMRegulatory = 0;
 }
@@ -1953,16 +1953,16 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			}
 
 			/*  disable atim wnd */
-			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT|EN_BCN_FUNCTION|DIS_ATIM);
+			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT | EN_BCN_FUNCTION | DIS_ATIM);
 			/* rtw_write8(padapter, REG_BCN_CTRL, 0x18); */
 		} else if (mode == _HW_STATE_ADHOC_) {
 			ResumeTxBeacon(padapter);
-			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT|EN_BCN_FUNCTION|DIS_BCNQ_SUB);
+			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT | EN_BCN_FUNCTION | DIS_BCNQ_SUB);
 		} else if (mode == _HW_STATE_AP_) {
 
 			ResumeTxBeacon(padapter);
 
-			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT|DIS_BCNQ_SUB);
+			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT | DIS_BCNQ_SUB);
 
 			/* Set RCR */
 			rtw_write32(padapter, REG_RCR, 0x7000208e);/* CBSSID_DATA must set to 0, reject ICV_ERR packet */
@@ -1985,7 +1985,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 
 			/* enable BCN0 Function for if1 */
 			/* don't enable update TSF0 for if1 (due to TSF update when beacon/probe rsp are received) */
-			rtw_write8(padapter, REG_BCN_CTRL, (DIS_TSF_UDT|EN_BCN_FUNCTION|EN_TXBCN_RPT|DIS_BCNQ_SUB));
+			rtw_write8(padapter, REG_BCN_CTRL, (DIS_TSF_UDT | EN_BCN_FUNCTION | EN_TXBCN_RPT | DIS_BCNQ_SUB));
 
 			/* SW_BCN_SEL - Port0 */
 			/* rtw_write8(Adapter, REG_DWBCN1_CTRL_8192E+2, rtw_read8(Adapter, REG_DWBCN1_CTRL_8192E+2) & ~BIT4); */
@@ -1995,7 +1995,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			rtw_write8(
 				padapter,
 				REG_CCK_CHECK_8723B,
-				(rtw_read8(padapter, REG_CCK_CHECK_8723B)&~BIT_BCN_PORT_SEL)
+				(rtw_read8(padapter, REG_CCK_CHECK_8723B) & ~BIT_BCN_PORT_SEL)
 			);
 
 			/*  dis BCN1 ATIM  WND if if2 is station */
@@ -2012,7 +2012,7 @@ static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
 	u32 reg_macid = REG_MACID;
 
 	for (idx = 0 ; idx < 6; idx++)
-		rtw_write8(GET_PRIMARY_ADAPTER(padapter), (reg_macid+idx), val[idx]);
+		rtw_write8(GET_PRIMARY_ADAPTER(padapter), (reg_macid + idx), val[idx]);
 }
 
 static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
@@ -2021,7 +2021,7 @@ static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
 	u32 reg_bssid = REG_BSSID;
 
 	for (idx = 0 ; idx < 6; idx++)
-		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
+		rtw_write8(padapter, (reg_bssid + idx), val[idx]);
 }
 
 static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
@@ -2051,11 +2051,11 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	tsf = pmlmeext->TSFValue-do_div(pmlmeext->TSFValue, (pmlmeinfo->bcn_interval*1024))-1024; /* us */
+	tsf = pmlmeext->TSFValue - do_div(pmlmeext->TSFValue, (pmlmeinfo->bcn_interval * 1024)) - 1024; /* us */
 
 	if (
-		((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) ||
-		((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+		((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) ||
+		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 	)
 		StopTxBeacon(padapter);
 
@@ -2066,7 +2066,7 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
 		rtw_write32(padapter, REG_TSFTR, tsf);
-		rtw_write32(padapter, REG_TSFTR+4, tsf>>32);
+		rtw_write32(padapter, REG_TSFTR + 4, tsf >> 32);
 
 		/*  enable related TSF function */
 		val8 = rtw_read8(padapter, REG_BCN_CTRL);
@@ -2075,8 +2075,8 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
 	}
 
 	if (
-		((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) ||
-		((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+		((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) ||
+		((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 	)
 		ResumeTxBeacon(padapter);
 }
@@ -2141,7 +2141,7 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 		pHalData->RegRRSR = rtw_read16(padapter, REG_RRSR);
 	} else {
 		/*  sitesurvey done */
-		if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)))
+		if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)))
 			/*  enable to rx data frame */
 			rtw_write16(padapter, REG_RXFLTMAP2, 0xFFFF);
 
@@ -2182,7 +2182,7 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 		if (padapter->in_cta_test)
 			val32 &= ~(RCR_CBSSID_DATA | RCR_CBSSID_BCN);/*  RCR_ADF */
 		else
-			val32 |= RCR_CBSSID_DATA|RCR_CBSSID_BCN;
+			val32 |= RCR_CBSSID_DATA | RCR_CBSSID_BCN;
 		rtw_write32(padapter, REG_RCR, val32);
 
 		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true)
@@ -2197,7 +2197,7 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 		val8 &= ~DIS_TSF_UDT;
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE))
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE))
 			RetryLimit = 0x7;
 	}
 
@@ -2320,8 +2320,8 @@ void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length)
 
 	C2hEvent.CmdID = pbuffer[0];
 	C2hEvent.CmdSeq = pbuffer[1];
-	C2hEvent.CmdLen = length-2;
-	tmpBuf = pbuffer+2;
+	C2hEvent.CmdLen = length - 2;
+	tmpBuf = pbuffer + 2;
 
 	process_c2h_event(padapter, &C2hEvent, tmpBuf);
 	/* c2h_handler_8723b(padapter,&C2hEvent); */
@@ -2362,8 +2362,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	{
 		struct mlme_ext_info *mlmext_info = &padapter->mlmeextpriv.mlmext_info;
 		u16 BrateCfg = 0;
-		u16 rrsr_2g_force_mask = (RRSR_11M|RRSR_5_5M|RRSR_1M);
-		u16 rrsr_2g_allow_mask = (RRSR_24M|RRSR_12M|RRSR_6M|RRSR_CCK_RATES);
+		u16 rrsr_2g_force_mask = (RRSR_11M | RRSR_5_5M | RRSR_1M);
+		u16 rrsr_2g_allow_mask = (RRSR_24M | RRSR_12M | RRSR_6M | RRSR_CCK_RATES);
 
 		HalSetBrateCfg(padapter, val, &BrateCfg);
 
@@ -2374,7 +2374,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		/* IOT consideration */
 		if (mlmext_info->assoc_AP_vendor == HT_IOT_PEER_CISCO) {
 			/* if peer is cisco and didn't use ofdm rate, we enable 6M ack */
-			if ((BrateCfg & (RRSR_24M|RRSR_12M|RRSR_6M)) == 0)
+			if ((BrateCfg & (RRSR_24M | RRSR_12M | RRSR_6M)) == 0)
 				BrateCfg |= RRSR_6M;
 		}
 
@@ -2382,7 +2382,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 		/*  Set RRSR rate table. */
 		rtw_write16(padapter, REG_RRSR, BrateCfg);
-		rtw_write8(padapter, REG_RRSR+2, rtw_read8(padapter, REG_RRSR+2)&0xf0);
+		rtw_write8(padapter, REG_RRSR + 2, rtw_read8(padapter, REG_RRSR + 2) & 0xf0);
 	}
 		break;
 
@@ -2404,9 +2404,9 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 			val32 = rtw_read32(padapter, REG_RCR);
 			if (*val)
-				val32 |= RCR_CBSSID_DATA|RCR_CBSSID_BCN;
+				val32 |= RCR_CBSSID_DATA | RCR_CBSSID_BCN;
 			else
-				val32 &= ~(RCR_CBSSID_DATA|RCR_CBSSID_BCN);
+				val32 &= ~(RCR_CBSSID_DATA | RCR_CBSSID_BCN);
 			rtw_write32(padapter, REG_RCR, val32);
 		}
 		break;
@@ -2418,7 +2418,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_MLME_SITESURVEY:
 		hw_var_set_mlme_sitesurvey(padapter, variable,  val);
 
-		hal_btcoex_ScanNotify(padapter, *val?true:false);
+		hal_btcoex_ScanNotify(padapter, *val ? true : false);
 		break;
 
 	case HW_VAR_MLME_JOIN:
@@ -2464,10 +2464,10 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		/* SIFS_Timer = 0x0a0a0808; */
 		/* RESP_SIFS for CCK */
 		rtw_write8(padapter, REG_RESP_SIFS_CCK, val[0]); /*  SIFS_T2T_CCK (0x08) */
-		rtw_write8(padapter, REG_RESP_SIFS_CCK+1, val[1]); /* SIFS_R2T_CCK(0x08) */
+		rtw_write8(padapter, REG_RESP_SIFS_CCK + 1, val[1]); /* SIFS_R2T_CCK(0x08) */
 		/* RESP_SIFS for OFDM */
 		rtw_write8(padapter, REG_RESP_SIFS_OFDM, val[2]); /* SIFS_T2T_OFDM (0x0a) */
-		rtw_write8(padapter, REG_RESP_SIFS_OFDM+1, val[3]); /* SIFS_R2T_OFDM(0x0a) */
+		rtw_write8(padapter, REG_RESP_SIFS_OFDM + 1, val[3]); /* SIFS_R2T_OFDM(0x0a) */
 		break;
 
 	case HW_VAR_ACK_PREAMBLE:
@@ -2479,7 +2479,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			/* regTmp = (pHalData->nCur40MhzPrimeSC)<<5; */
 			if (bShortPreamble)
 				regTmp |= 0x80;
-			rtw_write8(padapter, REG_RRSR+2, regTmp);
+			rtw_write8(padapter, REG_RRSR + 2, regTmp);
 		}
 		break;
 
@@ -2494,13 +2494,13 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			for (i = 0; i < CAM_CONTENT_COUNT; i++) {
 				/*  filled id in CAM config 2 byte */
 				if (i == 0) {
-					ulContent |= (ucIndex & 0x03) | ((u16)(ulEncAlgo)<<2);
+					ulContent |= (ucIndex & 0x03) | ((u16)(ulEncAlgo) << 2);
 					/* ulContent |= CAM_VALID; */
 				} else
 					ulContent = 0;
 
 				/*  polling bit, and No Write enable, and address */
-				ulCommand = CAM_CONTENT_COUNT*ucIndex+i;
+				ulCommand = CAM_CONTENT_COUNT * ucIndex + i;
 				ulCommand = ulCommand | CAM_POLLINIG | CAM_WRITE;
 				/*  write content 0 is equal to mark as invalid */
 				rtw_write32(padapter, WCAMI, ulContent);  /* mdelay(40); */
@@ -2510,7 +2510,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		break;
 
 	case HW_VAR_CAM_INVALID_ALL:
-		rtw_write32(padapter, RWCAM, BIT(31)|BIT(30));
+		rtw_write32(padapter, RWCAM, BIT(31) | BIT(30));
 		break;
 
 	case HW_VAR_CAM_WRITE:
@@ -2569,7 +2569,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			u32 AMPDULen =  (*((u8 *)val));
 
 			if (AMPDULen < HT_AGG_SIZE_32K)
-				AMPDULen = (0x2000 << (*((u8 *)val)))-1;
+				AMPDULen = (0x2000 << (*((u8 *)val))) - 1;
 			else
 				AMPDULen = 0x7fff;
 
@@ -2695,7 +2695,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			u16 mstatus_rpt = (*(u16 *)val);
 			u8 mstatus, macId;
 
-			mstatus = (u8) (mstatus_rpt & 0xFF);
+			mstatus = (u8)(mstatus_rpt & 0xFF);
 			macId = (u8)(mstatus_rpt >> 8);
 			rtl8723b_set_FwMediaStatusRpt_cmd(padapter, mstatus, macId);
 		}
@@ -2703,18 +2703,18 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_BCN_VALID:
 		{
 			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL+2, write 1 to clear, Clear by sw */
-			val8 = rtw_read8(padapter, REG_TDECTRL+2);
+			val8 = rtw_read8(padapter, REG_TDECTRL + 2);
 			val8 |= BIT(0);
-			rtw_write8(padapter, REG_TDECTRL+2, val8);
+			rtw_write8(padapter, REG_TDECTRL + 2, val8);
 		}
 		break;
 
 	case HW_VAR_DL_BCN_SEL:
 		{
 			/*  SW_BCN_SEL - Port0 */
-			val8 = rtw_read8(padapter, REG_DWBCN1_CTRL_8723B+2);
+			val8 = rtw_read8(padapter, REG_DWBCN1_CTRL_8723B + 2);
 			val8 &= ~BIT(4);
-			rtw_write8(padapter, REG_DWBCN1_CTRL_8723B+2, val8);
+			rtw_write8(padapter, REG_DWBCN1_CTRL_8723B + 2, val8);
 		}
 		break;
 
@@ -2779,7 +2779,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_BCN_VALID:
 		{
 			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL+2 */
-			val8 = rtw_read8(padapter, REG_TDECTRL+2);
+			val8 = rtw_read8(padapter, REG_TDECTRL + 2);
 			*val = (BIT(0) & val8) ? true : false;
 		}
 		break;
@@ -2855,7 +2855,7 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 		break;
 
 	case HAL_DEF_RX_PACKET_OFFSET:
-		*((u32 *)pval) = RXDESC_SIZE + DRVINFO_SZ*8;
+		*((u32 *)pval) = RXDESC_SIZE + DRVINFO_SZ * 8;
 		break;
 
 	case HW_VAR_MAX_RX_AMPDU_FACTOR:
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 7fac1c2ba8e0..51e9f06b2c63 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -19,7 +19,7 @@ static	u32 phy_CalculateBitShift(u32 BitMask)
 	u32 i;
 
 	for (i = 0; i <= 31; i++) {
-		if (((BitMask>>i) &  0x1) == 1)
+		if (((BitMask >> i) &  0x1) == 1)
 			break;
 	}
 	return i;
@@ -109,18 +109,18 @@ static u32 phy_RFSerialRead_8723B(
 	NewOffset = Offset;
 
 	if (eRFPath == RF_PATH_A) {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
-		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskDWord);
+		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset << 23) | bLSSIReadEdge;	/* T65 RF */
+		PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	} else {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord);
-		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter2 | MaskforPhySet, bMaskDWord);
+		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset << 23) | bLSSIReadEdge;	/* T65 RF */
+		PHY_SetBBReg(Adapter, rFPGA0_XB_HSSIParameter2 | MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	}
 
-	tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 | bLSSIReadEdge);
+	tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskDWord);
+	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
+	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskDWord, tmplong2 | bLSSIReadEdge);
 
 	udelay(10);
 
@@ -129,16 +129,16 @@ static u32 phy_RFSerialRead_8723B(
 	udelay(10);
 
 	if (eRFPath == RF_PATH_A)
-		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1|MaskforPhySet, BIT8);
+		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1 | MaskforPhySet, BIT8);
 	else if (eRFPath == RF_PATH_B)
-		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1|MaskforPhySet, BIT8);
+		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1 | MaskforPhySet, BIT8);
 
 	if (RfPiEnable) {
 		/*  Read from BBreg8b8, 12 bits for 8190, 20bits for T65 RF */
-		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBackPi|MaskforPhySet, bLSSIReadBackData);
+		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBackPi | MaskforPhySet, bLSSIReadBackData);
 	} else {
 		/* Read from BBreg8a0, 12 bits for 8190, 20 bits for T65 RF */
-		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack|MaskforPhySet, bLSSIReadBackData);
+		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack | MaskforPhySet, bLSSIReadBackData);
 	}
 	return retValue;
 
@@ -203,7 +203,7 @@ static void phy_RFSerialWrite_8723B(
 	/*  */
 	/*  Put write addr in [5:0]  and write data in [31:16] */
 	/*  */
-	DataAndAddr = ((NewOffset<<20) | (Data&0x000fffff)) & 0x0fffffff;	/*  T65 RF */
+	DataAndAddr = ((NewOffset << 20) | (Data & 0x000fffff)) & 0x0fffffff;	/*  T65 RF */
 	/*  */
 	/*  Write Operation */
 	/*  */
@@ -266,7 +266,7 @@ void PHY_SetRFReg_8723B(
 	if (BitMask != bRFRegOffsetMask) {
 		Original_Value = phy_RFSerialRead_8723B(Adapter, eRFPath, RegAddr);
 		BitShift =  phy_CalculateBitShift(BitMask);
-		Data = ((Original_Value & (~BitMask)) | (Data<<BitShift));
+		Data = ((Original_Value & (~BitMask)) | (Data << BitShift));
 	}
 
 	phy_RFSerialWrite_8723B(Adapter, eRFPath, RegAddr, Data);
@@ -385,19 +385,19 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	/*  Enable BB and RF */
 	RegVal = rtw_read16(Adapter, REG_SYS_FUNC_EN);
-	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal|BIT13|BIT0|BIT1));
+	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal | BIT13 | BIT0 | BIT1));
 
 	rtw_write32(Adapter, 0x948, 0x280);	/*  Others use Antenna S1 */
 
-	rtw_write8(Adapter, REG_RF_CTRL, RF_EN|RF_RSTB|RF_SDMRSTB);
+	rtw_write8(Adapter, REG_RF_CTRL, RF_EN | RF_RSTB | RF_SDMRSTB);
 
 	msleep(1);
 
 	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
 
-	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL|FEN_PCIEA|FEN_DIO_PCIE|FEN_BB_GLB_RSTn|FEN_BBRSTB);
+	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL | FEN_PCIEA | FEN_DIO_PCIE | FEN_BB_GLB_RSTn | FEN_BBRSTB);
 
-	rtw_write8(Adapter, REG_AFE_XTAL_CTRL+1, 0x80);
+	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
 
 	/*  */
 	/*  Config BB and AGC */
@@ -531,7 +531,7 @@ u8 PHY_GetTxPowerIndex(
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	s8 txPower = 0, powerDiffByRate = 0, limit = 0;
 
-	txPower = (s8) PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
+	txPower = (s8)PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
 	powerDiffByRate = PHY_GetTxPowerByRate(padapter, RF_PATH_A, Rate);
 
 	limit = phy_get_tx_pwr_lmt(
@@ -551,7 +551,7 @@ u8 PHY_GetTxPowerIndex(
 	if (txPower > MAX_POWER_INDEX)
 		txPower = MAX_POWER_INDEX;
 
-	return (u8) txPower;
+	return (u8)txPower;
 }
 
 void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 Channel)
@@ -631,7 +631,7 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 
 		PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x0);
 
-		PHY_SetBBReg(Adapter, rOFDM0_TxPseudoNoiseWgt, (BIT31|BIT30), 0x0);
+		PHY_SetBBReg(Adapter, rOFDM0_TxPseudoNoiseWgt, (BIT31 | BIT30), 0x0);
 		break;
 
 	/* 40 MHz channel*/
@@ -641,11 +641,11 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 		PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x1);
 
 		/*  Set Control channel to upper or lower. These settings are required only for 40MHz */
-		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40MhzPrimeSC>>1));
+		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40MhzPrimeSC >> 1));
 
 		PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
 
-		PHY_SetBBReg(Adapter, 0x818, (BIT26|BIT27), (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
+		PHY_SetBBReg(Adapter, 0x818, (BIT26 | BIT27), (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
 		break;
 	default:
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index cab4707091e2..0204a454c954 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -335,8 +335,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 					C2hEvent.CmdID = pbuf_c2h[0];
 					C2hEvent.CmdSeq = pbuf_c2h[1];
-					C2hEvent.CmdLen = (len_c2h-2);
-					pdata_c2h = pbuf_c2h+2;
+					C2hEvent.CmdLen = (len_c2h - 2);
+					pdata_c2h = pbuf_c2h + 2;
 
 					if (C2hEvent.CmdID == C2H_CCX_TX_RPT)
 						CCX_FwC2HTxRpt_8723b(padapter, pdata_c2h, C2hEvent.CmdLen);
@@ -403,7 +403,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 				precvbuf->pskb->dev = padapter->pnetdev;
 
 				tmpaddr = (SIZE_PTR)precvbuf->pskb->data;
-				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ-1);
+				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 				skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 			}
 		}
-- 
2.53.0

