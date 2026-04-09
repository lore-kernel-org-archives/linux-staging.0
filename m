Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259DB4A23
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711101; cv=none; b=Snel498qh1dwpyUN1mUwqljGwS7PlBgAKBiynFMuly/4jP3KQXFTZMTGYfWmemVrd+weCW2ZkKHX/vvixcLsZIV5dhqkKUK0A5Ccs6ju5+FOkJpelBHpSHmapGQLrWvCL5wbla83b/2f2OvGz0qXHCW8H/xJyfp2OwQ5YBbjLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711101; c=relaxed/simple;
	bh=d1yUUwZxSMTH4Mhr1vdB7tMvupSoxWq48gto3tesvWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuK+mPjZnwtRh75LZhhle6ZU5LzvW+dJrC2zaHkqs2kADbySgFXYiGXLrSKHXCT2dcsF1Pya/dfpqsAEgZSbH+1KTYERm4dn7uZYQiu1N2LTlLJTqK8j2QEd3hMG4GgrZsVXb0HsOKvkSqCWayYEso1/oe5xH5OVa8WSIb7m/tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gbm4wLGb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gbm4wLGb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aaed195901so2713225ad.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 22:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711098; x=1776315898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnlvJQe4yhPb84lvxXeuW/a2CDGHMe2shk7LZ1M+Eo4=;
        b=Gbm4wLGbpSnU0nB1X/KQpHQ3V751c6f483l+TVqVEee5k+3ne5GCQioA/DLHkVWqqY
         JBF+0UP19ddRZ4gu71bjtD9866Yi2YmJa992fNP8ZME0tjT8sA86KlZD609nLXuR0/8w
         /Jxa0d5fexHsnw4Dzu+Wi8zEixzaqkhW0Kl/qQGMgxdd3idtgaX5tSXvzskN8n8nh2CU
         TXwJUz6AtnYpvkfNXjLPt5HF5xRYSZ2M3aFqd/fl+dDmQ+zCngMVUL0uvNAp+wgOAT7L
         t0bBZy3uDrz0LySId01RXSjxNrHmbZ8h5n9FhT8lNYAFWXjASt4/Ih9bAuffNi5iP+NE
         zJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711098; x=1776315898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TnlvJQe4yhPb84lvxXeuW/a2CDGHMe2shk7LZ1M+Eo4=;
        b=X9ZlIWdRIBXVzoXS7DEw2xqT7lBdAEIX0Z68nBx1hdlvejQ4T0zmp1ZJvdDz/G3CPN
         XQV9aXAotZ1UMOGOzk+/za+G2G5pQ0Qa52+uLEXBeczubrJDyY7f9wKBZ4dzhLz5AfYG
         osYXZnfTQKr+Qw/yp0p8xftDWkRR9Tl35fxNZSnncuYG273Ivqgrk+ChHLruaq5a0ZP8
         pVACVsxHzNbTNpccpuJxdXJ7ebrSCfhaksxO7mCnBBA4/xjwMfQ87HLJoJHl5CXo9/7J
         +oHV8zNW4c9VhYSgX0/n86dDT6Enyi716R2QK0eLSjmKujdgYPz97/3wJgTqloaWhQHe
         uG6Q==
X-Gm-Message-State: AOJu0YyZTADzPZ34Wfxlin7LvLRFFr5uK4gUUzJXu4qwzXoYP3JXTncO
	IRP1KHm79WAthfw38OSlMtGD+Sfs0E8vsxhwktP304dCm+18h2QTOk9+
X-Gm-Gg: AeBDietcOMbp4tH1u9sNxI8XFQmmm/F4nhWjTh6WoMb/fA2p+JnrQJyhYf9TSvy02Uq
	3vh7zKVkmSH16nQ7HWt6Gwc4B+JPRNyMyLRCu/0vuqHdOyKbTKJTdqzraHFWlVpT40Tqdspz6pP
	vwoVNdc0UjusInZKTQx7vSWIkmgDZ1/sbUV5mYzOf9XTTHplakxeetKPgYTMbum59vu6KjLGYWa
	rV3stIgRFTSeweJ0HXH+13sUEWykeN/CwZLnj/arrxInYS9OajFP+Vk4zUfDInQFQ+fd0khjAir
	l1mOCZ1tylnnWzxrPrvs3GBWX7RLLrguW6V0nYBzrFlIUoCtF2UMkG/pk+U6zpen2BjVfZxY9ep
	Uz1N7BIUC0nteG2n6xHqrW+Hs1bZFHAcyG68mj/Z1Ni9GTLqkUUDwPfPXoa86ceaRa9yHDXRA9u
	iqTIvCuqHiolsDXDpQTLqPsszq9iD0pIm5QONgxvXfMzQNGDCYp+Ppxg==
X-Received: by 2002:a17:903:22c6:b0:2ae:3b9b:db34 with SMTP id d9443c01a7336-2b28188da6amr250662535ad.42.1775711098419;
        Wed, 08 Apr 2026 22:04:58 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2b2a488caa2sm135280875ad.14.2026.04.08.22.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 22:04:58 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v2 1/4] staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
Date: Thu,  9 Apr 2026 14:04:49 +0900
Message-ID: <20260409050452.97774-2-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409050452.97774-1-osjin83@gmail.com>
References: <20260409050452.97774-1-osjin83@gmail.com>
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

