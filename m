Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06E348862
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548512; cv=none; b=H3iEI4WyxLqX59Hp7TvgSBEazTMmkbu+kZ59LRbbw6PSoVBoe3DWGArYu+3ffdV2zECo2f7Y8USSBXzSWI3I0Q9Hax5fzpJDfc91Ldpd4Hn+/+A+cB7GrxkEnc2+HITek7xSp0aea5/GeCdN7rQ+0NPxGXG0m+RIlYYu1tIFXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548512; c=relaxed/simple;
	bh=qKt7+HHdFKYtqAMDH+cJQmPXrhPmuihiasuqZZJ9oUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXSRV0Trlt6J5YwaZF8mEA2p4SjmbVYc6VxaCJgkU/tDK9xbF+9ygNljYxNyRpUzicoJfOa36xJLd5cgpC0wlLUqrUeBJFFg/DMZYeftTIN72x+Gqx1Psw+0LF76P34Eqc0reZTcCxQqlRw+3UdrdeNKjvo4OYM33OshZABtXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oldbn1pp; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oldbn1pp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlsdzNuqwiirzgpOhcS7XFpa8SUmU9c6nas65uv0jOs=;
	b=oldbn1pphpfzwF6yNdFaIWCeO7wyGYqN/AYbiUBwj7exQ+DCWFcdNo7elg7ZJBH9emx9HA
	9ZuSmMe1IoGcu8w2rjY1J/f3wGOOtzVNPPyJq1outn2gO5AyMBAKiV9pf0y5YSOlvbhuQ6
	BotfcE6qY2awuPikCgTCaFlv5bBfbnU=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 14/22] staging: rtl8723bs: hal: fix line lengths in rtl8723b_phycfg.c
Date: Sun,  8 Feb 2026 12:01:03 +0100
Message-ID: <20260208110111.46642-15-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
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
2.52.0

