Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DE2CA0
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:38 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id x6so33286294edr.5
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=83pxdd+2SRBEoVUaxcgazhIK0oxpvNgHcZ02CWSKft4=;
        b=WQlBxnPLj9GFQ+6ZCq9I1ZsjRGuRxolwHL4q5YeZNS5+eUEnW5P1blZFU2PnDPzWuC
         ZdIuTWdoNQxbM2x4+BNpAiVMoZuxwhtwap8hPoVC+Aq17TnCABRNIMEINqG6zU2IaZTb
         hR6gVX4iv0JVZ2iJ94amDrgwpQSa2xC1JxrfZua8td3E4wYpmbDj53RtC59R8fpK5UsB
         Pws05TCKcSf2gVFE5XT2O/UlkNU1IZkduWFxfrcWzTzMw97bRWyn7x/4cgYk4x2KgAqx
         87cG2YRBZgzlXTZ2TnMahjU/zukMeZ6OvQe9NC8xsCZxKwdhphX3dI04vUQPhL8O4ej2
         NKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=83pxdd+2SRBEoVUaxcgazhIK0oxpvNgHcZ02CWSKft4=;
        b=CQr+e0InzzpP19LhwmURddBLSIJCi4qBPPY1PdkXYRmHkBAa12mYkPZwsSvFNcuvEM
         PyFetT/6lI8HHBXnI8iaNtscWlk+u6MccPGSRq//X5puRuBJLs+7nl7LHoDPiK7zxkjk
         ZYW5Bciuuh2POy/iWh83OZV7B8aygbY9cCpmTtZ3wuF+2AACeRhFvk2pcRt0J5V2ebth
         RC507OdIn8uI+FAqLr/Db4r0j2axOM6kmzczANwaJfmIqNX28Ztpyn//FGJL26EDF1AI
         HJ5GkkAsfDPqP6I4Ypm+vcQs8JszB0CMbnNFhPg3p/xWQIKU46D0nCfiJGivTHr2JaEm
         3WlQ==
X-Gm-Message-State: AOAM530RlevlDx6bCQTDueYDDy2/WHANX2Ky+xzxpx6s4WumwzFvZQ1D
	XMa5s76lZs2wDU0MwEECgnBUShIspV8=
X-Google-Smtp-Source: ABdhPJxSlISXD6Z1Xe6mYK3c9dX9hSmRec4G1PgDjLVxeowKdoMljOSfa4enCSWPSJoJ+lzMV+0Mfw==
X-Received: by 2002:aa7:d652:: with SMTP id v18mr45920175edr.68.1638724476990;
        Sun, 05 Dec 2021 09:14:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:36 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 05/10] staging: r8188eu: remove macro PHY_SetBBReg
Date: Sun,  5 Dec 2021 18:13:37 +0100
Message-Id: <20211205171342.20551-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205171342.20551-1-straube.linux@gmail.com>
References: <20211205171342.20551-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro PHY_SetBBReg just re-defines rtl8188e_PHY_SetBBReg().
Call rtl8188e_PHY_SetBBReg() directly and remove the macro.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c   |  4 ++--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 22 +++++++++----------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 20 ++++++++---------
 drivers/staging/r8188eu/hal/usb_halinit.c     |  6 ++---
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  2 --
 5 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index df981ca4fb29..04c2dc3a3f32 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -7,7 +7,7 @@
 void ODM_SetMACReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask, u32 Data)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
-	PHY_SetBBReg(Adapter, RegAddr, BitMask, Data);
+	rtl8188e_PHY_SetBBReg(Adapter, RegAddr, BitMask, Data);
 }
 
 u32 ODM_GetMACReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask)
@@ -19,7 +19,7 @@ u32 ODM_GetMACReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask)
 void ODM_SetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask, u32 Data)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
-	PHY_SetBBReg(Adapter, RegAddr, BitMask, Data);
+	rtl8188e_PHY_SetBBReg(Adapter, RegAddr, BitMask, Data);
 }
 
 u32 ODM_GetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 99096a5d3041..bf706e411d49 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -169,10 +169,10 @@ phy_RFSerialRead(
 
 	tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset << 23) | bLSSIReadEdge;	/* T65 RF */
 
-	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2, bMaskDWord, tmplong & (~bLSSIReadEdge));
+	rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2, bMaskDWord, tmplong & (~bLSSIReadEdge));
 	udelay(10);/*  PlatformStallExecution(10); */
 
-	PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, bMaskDWord, tmplong2);
+	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, bMaskDWord, tmplong2);
 	udelay(100);/* PlatformStallExecution(100); */
 
 	udelay(10);/* PlatformStallExecution(10); */
@@ -263,7 +263,7 @@ phy_RFSerialWrite(
 	/*  */
 	/*  Write Operation */
 	/*  */
-	PHY_SetBBReg(Adapter, pPhyReg->rf3wireOffset, bMaskDWord, DataAndAddr);
+	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rf3wireOffset, bMaskDWord, DataAndAddr);
 }
 
 /**
@@ -567,7 +567,7 @@ PHY_BBConfig8188E(
 
 	/*  write 0x24[16:11] = 0x24[22:17] = CrystalCap */
 	CrystalCap = pHalData->CrystalCap & 0x3F;
-	PHY_SetBBReg(Adapter, REG_AFE_XTAL_CTRL, 0x7ff800, (CrystalCap | (CrystalCap << 6)));
+	rtl8188e_PHY_SetBBReg(Adapter, REG_AFE_XTAL_CTRL, 0x7ff800, (CrystalCap | (CrystalCap << 6)));
 
 	return rtStatus;
 }
@@ -704,17 +704,17 @@ _PHY_SetBWMode92C(
 	switch (pHalData->CurrentChannelBW) {
 	/* 20 MHz channel*/
 	case HT_CHANNEL_WIDTH_20:
-		PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bRFMOD, 0x0);
-		PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x0);
+		rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bRFMOD, 0x0);
+		rtl8188e_PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x0);
 		break;
 	/* 40 MHz channel*/
 	case HT_CHANNEL_WIDTH_40:
-		PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bRFMOD, 0x1);
-		PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x1);
+		rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bRFMOD, 0x1);
+		rtl8188e_PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x1);
 		/*  Set Control channel to upper or lower. These settings are required only for 40MHz */
-		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40MhzPrimeSC >> 1));
-		PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
-		PHY_SetBBReg(Adapter, 0x818, (BIT(26) | BIT(27)),
+		rtl8188e_PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40MhzPrimeSC >> 1));
+		rtl8188e_PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
+		rtl8188e_PHY_SetBBReg(Adapter, 0x818, (BIT(26) | BIT(27)),
 			     (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
 		break;
 	default:
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 45ab988e9be7..3d54fd0637ce 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -148,15 +148,15 @@ rtl8188e_PHY_RF6052SetCckTxPower(
 
 	/*  rf-A cck tx power */
 	tmpval = TxAGC[RF_PATH_A] & 0xff;
-	PHY_SetBBReg(Adapter, rTxAGC_A_CCK1_Mcs32, bMaskByte1, tmpval);
+	rtl8188e_PHY_SetBBReg(Adapter, rTxAGC_A_CCK1_Mcs32, bMaskByte1, tmpval);
 	tmpval = TxAGC[RF_PATH_A] >> 8;
-	PHY_SetBBReg(Adapter, rTxAGC_B_CCK11_A_CCK2_11, 0xffffff00, tmpval);
+	rtl8188e_PHY_SetBBReg(Adapter, rTxAGC_B_CCK11_A_CCK2_11, 0xffffff00, tmpval);
 
 	/*  rf-B cck tx power */
 	tmpval = TxAGC[RF_PATH_B] >> 24;
-	PHY_SetBBReg(Adapter, rTxAGC_B_CCK11_A_CCK2_11, bMaskByte0, tmpval);
+	rtl8188e_PHY_SetBBReg(Adapter, rTxAGC_B_CCK11_A_CCK2_11, bMaskByte0, tmpval);
 	tmpval = TxAGC[RF_PATH_B] & 0x00ffffff;
-	PHY_SetBBReg(Adapter, rTxAGC_B_CCK1_55_Mcs32, 0xffffff00, tmpval);
+	rtl8188e_PHY_SetBBReg(Adapter, rTxAGC_B_CCK1_55_Mcs32, 0xffffff00, tmpval);
 }	/* PHY_RF6052SetCckTxPower */
 
 /*  */
@@ -298,7 +298,7 @@ static void writeOFDMPowerReg88E(struct adapter *Adapter, u8 index, u32 *pValue)
 		else
 			regoffset = regoffset_b[index];
 
-		PHY_SetBBReg(Adapter, regoffset, bMaskDWord, writeVal);
+		rtl8188e_PHY_SetBBReg(Adapter, regoffset, bMaskDWord, writeVal);
 
 		/*  201005115 Joseph: Set Tx Power diff for Tx power training mechanism. */
 		if (regoffset == rTxAGC_A_Mcs07_Mcs04 || regoffset == rTxAGC_B_Mcs07_Mcs04) {
@@ -392,18 +392,18 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
 
 	/*----Set RF_ENV enable----*/
-	PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
+	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
 	udelay(1);/* PlatformStallExecution(1); */
 
 	/*----Set RF_ENV output high----*/
-	PHY_SetBBReg(Adapter, pPhyReg->rfintfo, bRFSI_RFENV, 0x1);
+	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfintfo, bRFSI_RFENV, 0x1);
 	udelay(1);/* PlatformStallExecution(1); */
 
 	/* Set bit number of Address and Data for RF register */
-	PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
+	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
 	udelay(1);/* PlatformStallExecution(1); */
 
-	PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
+	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
 	udelay(1);/* PlatformStallExecution(1); */
 
 	/*----Initialize RF fom connfiguration file----*/
@@ -411,7 +411,7 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 		rtStatus = _FAIL;
 
 	/*----Restore RFENV control type----*/;
-	PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
+	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
 
 	if (rtStatus != _SUCCESS)
 		goto phy_RF6052_Config_ParaFile_Fail;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index b53392161f09..f91fb5237a3b 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -558,8 +558,8 @@ static void _BeaconFunctionEnable(struct adapter *Adapter,
 /*  Set CCK and OFDM Block "ON" */
 static void _BBTurnOnBlock(struct adapter *Adapter)
 {
-	PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bCCKEn, 0x1);
-	PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bOFDMEn, 0x1);
+	rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bCCKEn, 0x1);
+	rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bOFDMEn, 0x1);
 }
 
 enum {
@@ -576,7 +576,7 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
 	DBG_88E("==>  %s ....\n", __func__);
 
 	rtw_write32(Adapter, REG_LEDCFG0, rtw_read32(Adapter, REG_LEDCFG0) | BIT(23));
-	PHY_SetBBReg(Adapter, rFPGA0_XAB_RFParameter, BIT(13), 0x01);
+	rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_XAB_RFParameter, BIT(13), 0x01);
 
 	if (PHY_QueryBBReg(Adapter, rFPGA0_XA_RFInterfaceOE, 0x300) == Antenna_A)
 		haldata->CurAntenna = Antenna_A;
diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index a60eb2e39684..30ede081ba47 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -136,7 +136,5 @@ void storePwrIndexDiffRateOffset(struct adapter *adapter, u32 regaddr,
 
 #define PHY_QueryBBReg(adapt, regaddr, mask)			\
 	 rtl8188e_PHY_QueryBBReg((adapt), (regaddr), (mask))
-#define PHY_SetBBReg(adapt, regaddr, bitmask, data)		\
-	 rtl8188e_PHY_SetBBReg((adapt), (regaddr), (bitmask), (data))
 
 #endif	/*  __INC_HAL8192CPHYCFG_H */
-- 
2.34.1

