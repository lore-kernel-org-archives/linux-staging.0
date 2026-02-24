Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B539E6F1
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939701; cv=none; b=nWgY3GE2jEleqLBxa/xkio9GGqRcvXQPoGITtgPc+xocuG/LF5dMLJbznE7JoVwHc8Ga7F7sA1YkPhLYxYNoA8fUoWXX3gt3k+8eGEGhbfTFxRwj0ODPFVnCsQHf3yMtun+Qc4vAgbx3ug/pJLs6asW3EltqvjUXoQ+UCALiknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939701; c=relaxed/simple;
	bh=tGcebRQKHxyXjcgqkNBG8a2C0WOwHOEqZdzsk7hWPSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XV1f9UTCJ61TxgAoPQ0z4/IUTp7GDa/1hXcuy0Tuju4X5nwSm1vfrpSGsGp533QyJ8FtHy8HpuTDM/qUk7M4ocQeMdET5Mtk99BpXOCApqDQ4NXHt4XFQrLNu6fWDYgvAKO78BmmQqNwlL84kN/TWa5WnHjkS74+GmHbKKunq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d4k86a/y; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d4k86a/y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EB6Gj1t8/uodhOFBWrekSaQLsQRBScgkHixH6mvKfZc=;
	b=d4k86a/yTmPP39isct62A+Xzu3/0w3li18V2FUC0tVAnutLbbqsJJ4sEE8jQE+BuNH1KMD
	xRo+zj/wkjOxTEzgq3f6JZRTVq2ABe+5/PKGf/rM6BuS7xbybw9S1zQDSX80kpNyjB8DLq
	LWjCLEA3ZhqVzLoeznbkPeKpYgaAs9w=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 09/21] staging: rtl8723bs: hal: fix line lengths in HalPhyRf_8723B.c
Date: Tue, 24 Feb 2026 14:27:36 +0100
Message-ID: <20260224132748.12336-10-luka.gejak@linux.dev>
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 176 ++++++++++++------
 1 file changed, 124 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..567a23627db9 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -101,13 +101,15 @@ static void setIqkMatrix_8723B(
 	} else {
 		switch (RFPath) {
 		case RF_PATH_A:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance,
+				     bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, 0x00);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, 0x00);
 			break;
 
 		case RF_PATH_B:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance,
+				     bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, 0x00);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, 0x00);
 			break;
@@ -957,20 +959,25 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		TX0_C = (Y * Oldval_0) >> 8;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, 0xF0000000, ((TX0_C&0x3C0)>>6));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x003F0000, (TX0_C&0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(29), ((Y*Oldval_0>>7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
 		if (bTxOnly) {
 			/*  <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =
+				0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter,
+							   rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
 /* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
@@ -984,12 +991,14 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		reg = result[final_candidate][3] & 0x3F;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, 0xFC00, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][3] >> 6) & 0xF;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, 0xF0000000, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 
 	}
 }
@@ -1035,22 +1044,27 @@ static void _PHY_PathBFillIQKMatrix8723B(
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x003F0000, (TX1_C&0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(25), ((Y*Oldval_1>>7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
 /* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] =
+				0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter,
+							    rOFDM0_RxIQExtAnta, bMaskDWord);
 			return;
 		}
 
@@ -1060,12 +1074,15 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		reg = result[final_candidate][7] & 0x3F;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, 0xFC00, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
 /* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28) |
+			(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord) &
+			 0x0fffffff);
 	}
 }
 
@@ -1078,7 +1095,6 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 {
 
 	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
-	u8 path;
 
 	if (
 		(pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
@@ -1086,18 +1102,31 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 		(pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] != 0x0) &&
 		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
 	) {
-		if (RFpath)
-			path = PATH_S0;
-		else
-			path = PATH_S1;
-
-		/* TX IQC */
-		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC94][VAL]);
-		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC80][VAL]);
-		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[path][IDX_0xC4C][VAL]);
-		/* RX IQC */
-		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xC14][VAL]);
-		PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[path][IDX_0xCA0][VAL]);
+		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
+			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S0];
+			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S0];
+			struct adapter *a = pDM_Odm->Adapter;
+
+			/* S0 TX IQC */
+			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
+			/* S0 RX IQC */
+			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
+		} else {
+			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S1];
+			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S1];
+			struct adapter *a = pDM_Odm->Adapter;
+
+			/* S1 TX IQC */
+			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
+			/* S1 RX IQC */
+			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
+		}
 	}
 }
 
@@ -1356,11 +1385,15 @@ static void phy_IQCalibrate_8723B(
 	/* u32 bbvalue; */
 
 	if (t == 0) {
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
 
 		/*  Save ADDA parameters, turn Path A ADDA on */
-		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
-		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
-		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG,
+					    cal->ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG,
+					   cal->IQK_MAC_backup);
+		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					    cal->IQK_BB_backup, IQK_BB_REG_NUM);
 	}
 
 	_PHY_PathADDAOn8723B(padapter, ADDA_REG, is2T);
@@ -1403,12 +1436,20 @@ static void phy_IQCalibrate_8723B(
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
 /* 		if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
+			u32 val;
+
 			/*  Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
-
-				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] =
+				PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8,
+					       bRFRegOffsetMask);
+
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rTx_Power_Before_IQK_A, bMaskDWord);
+			result[t][0] = (val & 0x3FF0000) >> 16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rTx_Power_After_IQK_A, bMaskDWord);
+			result[t][1] = (val & 0x3FF0000) >> 16;
 			break;
 		}
 	}
@@ -1417,10 +1458,15 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
+			u32 val;
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rRx_Power_Before_IQK_A_2, bMaskDWord);
+			result[t][2] = (val & 0x3FF0000) >> 16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rRx_Power_After_IQK_A_2, bMaskDWord);
+			result[t][3] = (val & 0x3FF0000) >> 16;
 			break;
 		}
 	}
@@ -1435,12 +1481,20 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_IQK_8723B(padapter);
 			if (PathBOK == 0x01) {
+				u32 val;
+
 				/*  Path B Tx IQK Success */
 				PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
-
-				result[t][4] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][5] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] =
+					PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B,
+						       0x8, bRFRegOffsetMask);
+
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rTx_Power_Before_IQK_A, bMaskDWord);
+				result[t][4] = (val & 0x3FF0000) >> 16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rTx_Power_After_IQK_A, bMaskDWord);
+				result[t][5] = (val & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1449,10 +1503,15 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
+				u32 val;
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rRx_Power_Before_IQK_A_2, bMaskDWord);
+				result[t][6] = (val & 0x3FF0000) >> 16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rRx_Power_After_IQK_A_2, bMaskDWord);
+				result[t][7] = (val & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1464,13 +1523,18 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0);
 
 	if (t != 0) {
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
+
 		/*  Reload ADDA power saving parameters */
-		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG,
+					      cal->ADDA_backup, IQK_ADDA_REG_NUM);
 
 		/*  Reload MAC parameters */
-		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
+		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG,
+					     cal->IQK_MAC_backup);
 
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					      cal->IQK_BB_backup, IQK_BB_REG_NUM);
 
 		/* Reload RF path */
 /* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
@@ -1609,8 +1673,10 @@ void PHY_IQCalibrate_8723B(
 		u32 offset, data;
 		u8 path, bResult = SUCCESS;
 		struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+		struct adapter *a = pDM_Odm->Adapter;
 
-		path = (PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskByte0) == 0x00) ? RF_PATH_A : RF_PATH_B;
+		path = (PHY_QueryBBReg(a, rS0S1_PathSwitch, bMaskByte0) == 0x00) ?
+			RF_PATH_A : RF_PATH_B;
 
 		/*  Restore TX IQK */
 		for (i = 0; i < 3; ++i) {
@@ -1620,7 +1686,7 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(a, offset, bMaskDWord, data);
 		}
 
 		/*  Restore RX IQK */
@@ -1631,14 +1697,16 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(a, offset, bMaskDWord, data);
 		}
 
 		if (pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] == 0) {
 			bResult = FAIL;
 		} else {
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A]);
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B]);
+			PHY_SetRFReg(a, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask,
+				     pRFCalibrateInfo->TxLOK[RF_PATH_A]);
+			PHY_SetRFReg(a, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask,
+				     pRFCalibrateInfo->TxLOK[RF_PATH_B]);
 		}
 
 		if (bResult == SUCCESS)
@@ -1646,7 +1714,9 @@ void PHY_IQCalibrate_8723B(
 	}
 
 	if (bReCovery) {
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					      pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover,
+					      9);
 		return;
 	}
 
@@ -1748,7 +1818,9 @@ void PHY_IQCalibrate_8723B(
 			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[0][i] = result[final_candidate][i];
 	}
 
-	_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+	_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C,
+				    pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover,
+				    9);
 
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
-- 
2.53.0

