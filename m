Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F232D0F9
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 01:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775785349; cv=none; b=f/+IC5HhvENajnfCgik85lwVkC9Dwo6l9vAUx8q0Fo1J9tn9knqTK9ESBzaDYv9aZ70/j0CP6kJxfNArwxL/wBz2h7UU0PYLFxnWs1NaTH6zNnLc1hyRhKzc+o5eoBb26JBCcT+3pj6517gNeNPqxwg9iI/TCP1kGigrENVNJ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775785349; c=relaxed/simple;
	bh=HT7lQHQ5AJXz1uaBmUZzPS+BLamstIm/SqvIzrmV6ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5aOSADfwp4MGXMSZTktk340jR4NOGF391SIf54gNzwe5IOdz873/1RkXGYTkhLu7NuU7rmGPbd1m2dAxH2VqewDYhlVan+sSPUrplzABNoxG8XYmjMlG+VmKrLvWPQojioq7L6JJrkx6Xfr5Y45FRr+r20pHJUtrcMSfQ2nwEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LujeEy8Q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LujeEy8Q"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b23fcf90b2so14731815ad.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 18:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775785347; x=1776390147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8yKufuZmFyyhr/wDhxT96eTbRmSN02tyOE6Nk86BP0=;
        b=LujeEy8Q5++JFurRobUiHPGXUbrPNWAPSvbvfn5wdEEYtKbG0SycFYN4PWYpoP43zy
         WTXJtwzKcn6SDmHlW+dmYlqBSDS0FmzgW4DVKVYiR6tLUpfPN5iS/Z8WdWKAW/G6S2Bc
         j1WOu+ka0SbEB4rZQ61CxJSjpJnyaB09txxDOFuv5bukflurSrX01pfL75g+CJdJy/Sd
         n9c60HDGwTtOawRaHtmx14XdSnjmIvboF5UvxxCqsvwEMRtZQeNknDqlPzbBgdeMGAnb
         X4DftPJzCJvy/ZLJW4qlhmykfdEcILyEksxN9zd0XdW/AumtUfNhamFTXq+CjcTiYVge
         dL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775785347; x=1776390147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8yKufuZmFyyhr/wDhxT96eTbRmSN02tyOE6Nk86BP0=;
        b=s1tFzTkSXD9VgqfmmZ5BhvgL8btR9ZEhWBjHmRCpXBzJoilbpUsNRCpjO90H+TYIwZ
         4bMj2f/blqEML6PXFWH6WQcPELjT+CxThlTLkItLbXNTuVAiqG+GLL10+b/8YNG9cewc
         hhI7/H8GwQdCsMGdH9EjoGT3dzx6pWKQ0q8Wq8kCIIZ8oz+aY2WHWazQk9wd3iNyvbmZ
         RYxnRN4KSDc/OJbVcepPbFVpEfUZ4+vg9Vut57s88pIMnh8fxs3+xqnjHHDfAXgvlway
         9p6+3x+QOS09Y2hLLP0PepqIh9ZHc1kcUXR88fk5s+fPq/O7bVR107gCaxUMXQYSiNKY
         UKAQ==
X-Gm-Message-State: AOJu0YxMH7vph0ZCc8rLgktcKRs88m3kVr7jvHdG2DVxCeblHI/hp2If
	I/NOprsE9FsES+XZZmo2gO2F/Z0iYPfFQH6GZv0X79pRYs9wXMdXtB+q
X-Gm-Gg: AeBDiet+vOOEOOu5PZClTBvrx+5qK0ClB/CJadFAygUJNsXBZAnhzqMkmKrOuv5HdsU
	xMaprjsR7UVIYl8EXUA8cu61vdkJ4lx2JkHuWvdzyZppAn7s8WbDBQNjlcs+f8PY1LG22J/2luh
	LLMTigixow9KhDzyOiriuBDg+5BIKvpdOiKJjnHF8t/wUdtRGOA2gtrA1+sXa7kZimgGzOkMrh+
	VMonwQgUFMTmyvVx4EncmYKjM43dDgvoU5jPORvv55WwevlyayH51h04uNuMfVHOxIiX5XVKbMk
	FC083q7UMjyc2t4eSBXtHJReXo+DQsSUxQ8zbrzqpEwGZ5uSbQG0wuFbapICwkT7SOk5BTcvCvW
	LIhjcIAHYwUpsJ+mO6+N5Q13C2RczbK81LUkYXo1M28AdQnn5VDagXYrNCeUpwcP0oLmykBYFrI
	8cv9uypDRJd7XKRZOPJFQ04shhkGuuuBDsWMgpRxuWzVbiWvpzT+ucDg==
X-Received: by 2002:a17:902:7087:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b2d5939849mr9355405ad.1.1775785347265;
        Thu, 09 Apr 2026 18:42:27 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2b2d4ddb742sm9084405ad.27.2026.04.09.18.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 18:42:26 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v3 1/4] staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
Date: Fri, 10 Apr 2026 10:42:11 +0900
Message-ID: <20260410014214.10684-2-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410014214.10684-1-osjin83@gmail.com>
References: <20260410014214.10684-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Fix various spacing issues reported by checkpatch.pl to improve code
readability and conform to the Linux kernel coding style.

These changes are purely cosmetic and do not alter the functional
behavior of the driver.

Signed-off-by: Jinemon Tama <osjin83@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 7fac1c2ba8e0..a7266a758c45 100644
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

