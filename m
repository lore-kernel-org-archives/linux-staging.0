Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9A2C80
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:33 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x15so32285954edv.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SSrPy9CqeCRB1FzpdJc+WuEu9raR/LwC5/wgRjy5qOc=;
        b=pFuMivnuVt47x1AlXeS117p3/gNeGltcRBe/QAmyd3UI6wTA2bpEnqiLE0+IxTlD2y
         MFR9LkKSf8PIn0foqa+p69oFcwnfxuV5nKg123U6abirnFVL2ksxv5H4uDR3RctpLFP5
         N+I8cM46Xm3X+P9gh+5uscaS6xiGlTcyl8ApTvfE2+B4MjcXRhoOd9J+o/i0W8ipkx1C
         N5AnZl//uoltOrRDtt/coPI3E3Gmg7XyOAIaTjy3MtvqMxjCPsGCNXHYteDGqHb0ZWYu
         +eaJRONBruSffwQQHhj0Eitq72Uem11czhgPIZgQP6hU0sUjKK88qlCKX1btZm36hnWg
         TuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SSrPy9CqeCRB1FzpdJc+WuEu9raR/LwC5/wgRjy5qOc=;
        b=60iybJRlWiPdVjP29SR30f746efz1I5zSurdGBBRa742hVaMY5M/7Qxqf3C4SiQWVT
         PYD4eTJJtNPMxr0a8O7RJgSLVOCcrFaFD4e8SA3mL3NkrqvTjoKafUu1gn3czBN+ELUS
         M7amYJ/ZcYJ5Nq3f7OS3qYJufZd0I95JML5CnrocOHKagpUwIjPfFFXKyiHo5y+kLgcT
         FwWjfFR/dS/yqzMLpejbSiCAiVydq8yzu8VIOvGtinULd95lkT5OTKVuL+Lq60NygxnI
         5th2ZR8eEZmmYPUGOZy2I0aAUQc7Lx4vi4HYvNhGLQeeLj/kZsMYuib7nyJwjoJuFfVc
         RuFA==
X-Gm-Message-State: AOAM533gSugDVSFHth4awh2SOmuPI05R6uVbGYev8Bf8+H2dArvNR6OI
	qIG8BBRNfxtuUHIqLWDN3B4=
X-Google-Smtp-Source: ABdhPJzwIAAfyheFlQguVUqmmxw9xCFtsIxV14s+EAke2zPhWAeJ647PjyUP7svswGvIU0+alCWCGQ==
X-Received: by 2002:a17:906:f43:: with SMTP id h3mr38124154ejj.414.1638712771914;
        Sun, 05 Dec 2021 05:59:31 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:31 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/12] staging: r8188eu: remove macro PHY_QueryBBReg
Date: Sun,  5 Dec 2021 14:59:13 +0100
Message-Id: <20211205135919.30460-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205135919.30460-1-straube.linux@gmail.com>
References: <20211205135919.30460-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro PHY_QueryBBReg just re-defines rtl8188e_PHY_QueryBBReg().
Call rtl8188e_PHY_QueryBBReg() directly and remove the macro.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c      |  4 ++--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c    | 12 ++++++------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c    |  2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c        |  2 +-
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h |  3 ---
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 04c2dc3a3f32..075e7a3307f7 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -13,7 +13,7 @@ void ODM_SetMACReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask, u32
 u32 ODM_GetMACReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
-	return PHY_QueryBBReg(Adapter, RegAddr, BitMask);
+	return rtl8188e_PHY_QueryBBReg(Adapter, RegAddr, BitMask);
 }
 
 void ODM_SetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask, u32 Data)
@@ -25,7 +25,7 @@ void ODM_SetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask, u32 D
 u32 ODM_GetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
-	return PHY_QueryBBReg(Adapter, RegAddr, BitMask);
+	return rtl8188e_PHY_QueryBBReg(Adapter, RegAddr, BitMask);
 }
 
 void ODM_SetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path	eRFPath, u32 RegAddr, u32 BitMask, u32 Data)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index bf706e411d49..02fbcf02e95c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -161,11 +161,11 @@ phy_RFSerialRead(
 	/*  For 92S LSSI Read RFLSSIRead */
 	/*  For RF A/B write 0x824/82c(does not work in the future) */
 	/*  We must use 0x824 for RF A and B to execute read trigger */
-	tmplong = PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2, bMaskDWord);
+	tmplong = rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2, bMaskDWord);
 	if (eRFPath == RF_PATH_A)
 		tmplong2 = tmplong;
 	else
-		tmplong2 = PHY_QueryBBReg(Adapter, pPhyReg->rfHSSIPara2, bMaskDWord);
+		tmplong2 = rtl8188e_PHY_QueryBBReg(Adapter, pPhyReg->rfHSSIPara2, bMaskDWord);
 
 	tmplong2 = (tmplong2 & (~bLSSIReadAddress)) | (NewOffset << 23) | bLSSIReadEdge;	/* T65 RF */
 
@@ -178,14 +178,14 @@ phy_RFSerialRead(
 	udelay(10);/* PlatformStallExecution(10); */
 
 	if (eRFPath == RF_PATH_A)
-		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1, BIT(8));
+		RfPiEnable = (u8)rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1, BIT(8));
 	else if (eRFPath == RF_PATH_B)
-		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1, BIT(8));
+		RfPiEnable = (u8)rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1, BIT(8));
 
 	if (RfPiEnable) {	/*  Read from BBreg8b8, 12 bits for 8190, 20bits for T65 RF */
-		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBackPi, bLSSIReadBackData);
+		retValue = rtl8188e_PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBackPi, bLSSIReadBackData);
 	} else {	/* Read from BBreg8a0, 12 bits for 8190, 20 bits for T65 RF */
-		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack, bLSSIReadBackData);
+		retValue = rtl8188e_PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack, bLSSIReadBackData);
 	}
 	return retValue;
 }
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 3d54fd0637ce..69d887da170d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -389,7 +389,7 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	pPhyReg = &pHalData->PHYRegDef[eRFPath];
 
 	/*----Store original RFENV control type----*/
-	u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
+	u4RegValue = rtl8188e_PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
 
 	/*----Set RF_ENV enable----*/
 	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f91fb5237a3b..b8e1b78c74a1 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -578,7 +578,7 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
 	rtw_write32(Adapter, REG_LEDCFG0, rtw_read32(Adapter, REG_LEDCFG0) | BIT(23));
 	rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_XAB_RFParameter, BIT(13), 0x01);
 
-	if (PHY_QueryBBReg(Adapter, rFPGA0_XA_RFInterfaceOE, 0x300) == Antenna_A)
+	if (rtl8188e_PHY_QueryBBReg(Adapter, rFPGA0_XA_RFInterfaceOE, 0x300) == Antenna_A)
 		haldata->CurAntenna = Antenna_A;
 	else
 		haldata->CurAntenna = Antenna_B;
diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index 30ede081ba47..f4cfd11b36c1 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -134,7 +134,4 @@ void storePwrIndexDiffRateOffset(struct adapter *adapter, u32 regaddr,
 				 u32 mask, u32 data);
 /*--------------------------Exported Function prototype---------------------*/
 
-#define PHY_QueryBBReg(adapt, regaddr, mask)			\
-	 rtl8188e_PHY_QueryBBReg((adapt), (regaddr), (mask))
-
 #endif	/*  __INC_HAL8192CPHYCFG_H */
-- 
2.34.1

