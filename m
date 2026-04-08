Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D1D38B15A
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644336; cv=none; b=TY+PIsxGJVXwAJI4ceqRxB/yXNXq9wSkOCBsdiyjwp2XE4D2ydxQ80NoafIo7UtsUYm9mjDOwKWY2mN6M5cR/Ccx/yRshtT9mbPlg3/91tzF3gk5TXl2njgYarKkNIEM5SIRKPd8Oo/nLPweAzSkpRbRB1679zTZLFizqLUgaBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644336; c=relaxed/simple;
	bh=a+37Q96AQf19bRYbXYxBQBrSVvXfyJnYaGeOZD4E6hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHN3m9a+GN43snz7YBQPS0XGpD/eV0rnfHv2+I0JFI+irIETnFLhYHReNnZIQ4W/17fpMEBwyZpweO1nTCTVR6p9+cL+CgvpUWXO7GVQV4hRM5tRSdZulCoAZfkpy6KU/czjQuzKnZFNgOjy7vWIR6VUOejjpEVavqOow4dQ8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGAzTP0H; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGAzTP0H"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8296d553142so3050833b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775644333; x=1776249133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUmSeMeQCUmRExPRZysU8P/gIvmGNcoeaZ6w3DzGjQM=;
        b=QGAzTP0H2Y+7q+fLmScPA1/21/byrsJBsjAnIls2Cv+OiciZHzuODWOirN26HPSc6l
         z1rKDxkH1VnFZOHpLS2UHUa8x8OHNm8uAzuMl3Au2Jc7b9odmkKoMmlMfA4ObbUoasoT
         mtFEEh+o27LS8xpMLZ8WRMnup5dI6YnmxxI872KyVlpULMSLpfhJsg/Hyw8dpLVT4j0Q
         Bu9xCcRpHHdGeyPXoTsY0eXRoeCu1k4KFKT7/t8L89VsdO9sQUoN12hVuxIWgyQYKNDM
         x3T+gWSzUz0Uo1k9jxmj4GVoqr10rpMPNSwb2R4Cgrkk8bIp7Bpdvn66pRkn/rLP9Cvj
         Qxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644333; x=1776249133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BUmSeMeQCUmRExPRZysU8P/gIvmGNcoeaZ6w3DzGjQM=;
        b=Uk3jb8AFV7agbEhN+8YnPYZaq+eToGmYH5zsJvPPgoLc9p5XFV5elMQrnLEXQWIXsU
         /YjjawUt5dDtG6KydYdtfHT/7Qo9aPddDoY9gum0dixz4oKcNoqWwVPl8tXREb+/FgKs
         0Zacw17N0B/l+lgMSNfNIWq/8dmlOZq5fzfTi1sCFvf43lkBzMmE5rKiALh3BuBIMSpx
         3l40KOQZMxyHLcuGseTtfKl///7cbcVdF2sa8B0nUr2UHGkd0NjwOjzQaSxQlFprCArf
         61xOtg8dm3K9WZeQAI2/RiwI4EsIrxieNKvcRS3/YFo8UqmG9PsN/F+jnCSi3H5fs/ut
         biEw==
X-Gm-Message-State: AOJu0YyoP12UOFeN2CkRwACZipSLoJv/Daa7VV7F6YpGH2ItS8wUBNpo
	miAd43yVCgQeS78ZCrxnS1d9z+j5SbcDrpvOD6A/NI3GxqacJQlit5Su35GZzQ==
X-Gm-Gg: AeBDiesoUhVhOU4Mrt0arxCK18eL6nlhW/7ibaVNvTXM5oQsBoFzUAdl20eg4qTZmws
	tEoqgT5Cqn+hpL+U/T5Xc4JFm0L67VaDgl1eZekZ7JAKs9k63Nohu4qrDAS3GJD9eyiv0a8i5nj
	9YQDVyC86dCX6kniWFfvuQnvLVo/CcQmCg4xA2sEU3TdInLLG9d0SLXbn9VC6+tONnZnDXEyapc
	wO8MnJ9QdW0H4m8YzZRrlwqQZDpbg2F1v7p+UVt1T1ReHC0pOGq1S2M6UsHXNDImV6CEPpyZuib
	yutld1GP/RxFZdoT7js5QbMX2q1UCBgBk65jd2cwrOn3F/BigKn0xXmDMMfcQIxSRI0XSPsrtk8
	Xp4Asky0ImMrSWZOk9mCMqA9Q/HWnhJmJHv+QQWBwp50q9TG27jS5v79f0qh9ch9DYzzrd23dmL
	jiDEla4JkTgjJOfP0D/t4gYYZCu/jgSUk5tKTM9umhKL98pmjDIJbvEA==
X-Received: by 2002:a05:6a00:1d95:b0:81f:1a4b:bf50 with SMTP id d2e1a72fcca58-82d0db71e39mr20315977b3a.36.1775644332759;
        Wed, 08 Apr 2026 03:32:12 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-82cf9ca14b3sm23344993b3a.54.2026.04.08.03.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:32:12 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH 1/3] staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
Date: Wed,  8 Apr 2026 19:32:06 +0900
Message-ID: <20260408103208.7682-2-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408103208.7682-1-osjin83@gmail.com>
References: <20260408103208.7682-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: tas0dev <osjin83@gmail.com>

Fix various spacing issues reported by checkpatch.pl to improve code
readability and conform to the Linux kernel coding style.

Specifically, this patch:
- Adds missing spaces around binary operators (| , >> , << , + , &).
- Corrects the spacing in bitwise expressions within function calls.
- Ensures consistent use of whitespace in arithmetic operations.

These changes are purely cosmetic and do not alter the functional
behavior of the driver.

Signed-off-by: tas0dev <osjin83@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 7fac1c2ba8e0..cfa00775341b 100644
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
@@ -385,11 +385,11 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	/*  Enable BB and RF */
 	RegVal = rtw_read16(Adapter, REG_SYS_FUNC_EN);
-	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal|BIT13|BIT0|BIT1));
+	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal | BIT13 | BIT0 | BIT1));
 
 	rtw_write32(Adapter, 0x948, 0x280);	/*  Others use Antenna S1 */
 
-	rtw_write8(Adapter, REG_RF_CTRL, RF_EN|RF_RSTB|RF_SDMRSTB);
+	rtw_write8(Adapter, REG_RF_CTRL, RF_EN | RF_RSTB | RF_SDMRSTB);
 
 	msleep(1);
 
@@ -397,7 +397,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL|FEN_PCIEA|FEN_DIO_PCIE|FEN_BB_GLB_RSTn|FEN_BBRSTB);
 
-	rtw_write8(Adapter, REG_AFE_XTAL_CTRL+1, 0x80);
+	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
 
 	/*  */
 	/*  Config BB and AGC */
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
-- 
2.53.0

