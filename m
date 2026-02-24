Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E952A39E183
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939703; cv=none; b=ef5uvMBffO+LURb5nFoAdP5eFB2ZzmQTVJ/vE38S5WbBtuo93b+thonvtNVArwL3dDqcMjxzHf8+XoVlvGCNxseWX+n6ZKRhXOFivglRNpY9gxecM5IPNl8bag+P3lIgUQGRHIH64bKDEZ6PvdK547/HaHEntmgAyBC/+YggIPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939703; c=relaxed/simple;
	bh=eUnYD6TpMDLWt7Y0t7PC5FlqL+eA/EWEvQVJzZ5KBzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc4ir1jCya0pWpRBV/mn2908jOMGBTmSd82zlS3eXlfYsYYLmZnOhLUPEm5YJ9uukKGcOsAfoUb3ysC5zl6NbhyZPpe22qsFuCUWZo75kRrYj3LZLjVT+qoi0DyI54xCCRdfqvs9aYzSiomwqIE2+x2LsnJR1LB9ovL0R1Xt4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tlrmEcLS; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tlrmEcLS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771939699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfEQ1pzBJSX1mmoUy4L6iCsFv8Vrr2aLPYxoMljCH60=;
	b=tlrmEcLS836yK77t/tSFJpC4ss1IlWIB0uTW/603jwyJz/ytDaMB/ZTJyVeQg1u9SOBUHP
	Ein81BcqP5h5YqScGF39HqV5yubhvVlGMUXV99+ZMsYMwO+71/g5VZitzhVa+DcbjR2utJ
	x4VuHlPnhB85dhqR9AV0X4aCvL+Da/U=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH 13/21] staging: rtl8723bs: hal: fix line lengths in rtl8723b_phycfg.c
Date: Tue, 24 Feb 2026 14:27:40 +0100
Message-ID: <20260224132748.12336-14-luka.gejak@linux.dev>
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
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 54 +++++++++++++------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 6d5e531505f9..4f171c065155 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -109,18 +109,26 @@ static u32 phy_RFSerialRead_8723B(
 	NewOffset = Offset;
 
 	if (eRFPath == RF_PATH_A) {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
+		u32 regA = rFPGA0_XA_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, regA, bMaskDWord);
 		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, regA, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	} else {
-		tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord);
+		u32 regB = rFPGA0_XB_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, regB, bMaskDWord);
 		tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSSIReadEdge;	/* T65 RF */
-		PHY_SetBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2&(~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, regB, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
 	}
 
-	tmplong2 = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord);
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWord, tmplong2 | bLSSIReadEdge);
+	{
+		u32 reg = rFPGA0_XA_HSSIParameter2 | MaskforPhySet;
+
+		tmplong2 = PHY_QueryBBReg(Adapter, reg, bMaskDWord);
+		PHY_SetBBReg(Adapter, reg, bMaskDWord, tmplong2 & (~bLSSIReadEdge));
+		PHY_SetBBReg(Adapter, reg, bMaskDWord, tmplong2 | bLSSIReadEdge);
+	}
 
 	udelay(10);
 
@@ -307,22 +315,29 @@ static void phy_InitBBRFRegisterDefinition(struct adapter *Adapter)
 	struct hal_com_data		*pHalData = GET_HAL_DATA(Adapter);
 
 	/*  RF Interface Sowrtware Control */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 LSBs if read 32-bit from 0x870 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW; /*  16 MSBs if read 32-bit from 0x870 (16-bit for 0x872) */
+	/* 16 LSBs if read 32-bit from 0x870 */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW;
+	/* 16 MSBs if read 32-bit from 0x870 (16-bit for 0x872) */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW;
 
 	/*  RF Interface Output (and Enable) */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x860 */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE; /*  16 LSBs if read 32-bit from 0x864 */
+	/* 16 LSBs if read 32-bit from 0x860 */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE;
+	/* 16 LSBs if read 32-bit from 0x864 */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE;
 
 	/*  RF Interface (Output and)  Enable */
-	pHalData->PHYRegDef[RF_PATH_A].rfintfe = rFPGA0_XA_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
-	pHalData->PHYRegDef[RF_PATH_B].rfintfe = rFPGA0_XB_RFInterfaceOE; /*  16 MSBs if read 32-bit from 0x864 (16-bit for 0x866) */
+	/* 16 MSBs if read 32-bit from 0x860 (16-bit for 0x862) */
+	pHalData->PHYRegDef[RF_PATH_A].rfintfe = rFPGA0_XA_RFInterfaceOE;
+	/* 16 MSBs if read 32-bit from 0x864 (16-bit for 0x866) */
+	pHalData->PHYRegDef[RF_PATH_B].rfintfe = rFPGA0_XB_RFInterfaceOE;
 
 	pHalData->PHYRegDef[RF_PATH_A].rf3wireOffset = rFPGA0_XA_LSSIParameter; /* LSSI Parameter */
 	pHalData->PHYRegDef[RF_PATH_B].rf3wireOffset = rFPGA0_XB_LSSIParameter;
 
-	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
-	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;  /* wire control parameter2 */
+	/* wire control parameter2 */
+	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;
+	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;
 
 	/*  Transceiver Readback LSSI/HSPI mode */
 	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
@@ -643,8 +658,12 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40MhzPrimeSC>>1));
 
 		PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
+		{
+			u32 val;
 
-		PHY_SetBBReg(Adapter, 0x818, (BIT26|BIT27), (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
+			val = (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1;
+			PHY_SetBBReg(Adapter, 0x818, (BIT26 | BIT27), val);
+		}
 		break;
 	default:
 		break;
@@ -769,5 +788,6 @@ void PHY_SetSwChnlBWMode8723B(
 	u8 Offset80
 )
 {
-	PHY_HandleSwChnlAndSetBW8723B(Adapter, true, true, channel, Bandwidth, Offset40, Offset80, channel);
+	PHY_HandleSwChnlAndSetBW8723B(Adapter, true, true, channel,
+				      Bandwidth, Offset40, Offset80, channel);
 }
-- 
2.53.0

