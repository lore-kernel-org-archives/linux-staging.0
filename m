Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B896288C81
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 03:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775706583; cv=none; b=LM6pZ4/tWdhBpn3M5m6Ppnsg2d0eTpfPaABY2FpDPgVkzhZe+VAaNjn2QdGCo42rmHTfpuhedLF5E7bjlnjmIb5v7ZJ+ns6ZOYUTjovKa3+/AM5yj/ElW3dpBB4s6c6mPM2bY0QCKBpFnPve/7mvx8SoQeRPfYFttttqAfWBbXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775706583; c=relaxed/simple;
	bh=vbUl/2HZ/Rnu3rJbuF3xKPGMcUv1OugdsuvO2CS65Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRmne0O7yLdibJj4ZVFAmQR3JWMAx+82GQPJy6XT9bDSmYDhTNSL8VBrQWE0g28vzQx3TrXEwYqlc8SQBZmssPuanJU/L5iDeiRfefRbXs9OkvYqKJV3oJI6pCKbYiUmx68lStWQuLN6y4PQ4t5xw4P2BgEmZwklqiVsCueItr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zi90wf07; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zi90wf07"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso469979a91.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 20:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775706581; x=1776311381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qw9rbxuI/XNbrUZm31L2cl1BRHOIGhDbvsQhSwpkpY=;
        b=Zi90wf07KHARd+IAuYwlYXDHfU2w4utxKyRgYl1KdZUkQniQWAsFW7pC0owKyRfOzJ
         V/JcAbLlm1TKJmtcLkQHh24V7Qn7OM3oFfHevQe7hZb6goIXkYn6xjJnPVYiNoa7f5Tt
         1EAJd+8nqL1tSyq7P0fAuxlUs+QllXpUieqrqNSpyG8Us622mu7/W19d5oHBvHCKtMgI
         F5ezDp6kDf2W/p7f7CGPFF9Jxm91hiNVTWqI/pS/hoOnNYguwgeUbhBOvm1tL2ChXLM5
         rXgiPGGix+qXXm+hgTIEok6hGDPeUzEAsoaUbR2hp4ylrIpVe3oXjsDMWKlQNuovG5wE
         P6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775706581; x=1776311381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+qw9rbxuI/XNbrUZm31L2cl1BRHOIGhDbvsQhSwpkpY=;
        b=pvYbFXeBfHd6eP5cLtXTyDzh+wSMYd7tFNUM4e8AyP9OXx10gLN/iPefNps/SBpc+d
         DmFoabtHVjVNFXX2lZe0Pot16o6dAWvn60cjec6FUU0NSFII1Ays+ptsGK2SOFzrJLfC
         gFTPYoN433snnVSjnKPss2eKpSXhAtMh8zyVWBaw3KJtik8xRygiQpuC2mg2w/Jg0WMY
         yWp3mirXnJOJ1BR/Qet4UWQ4EXv4IsTfkzTO3sjUe0mbbwZSW5VoLpHv6Qzfss7RHwtM
         m5FvsyNJ8123IfIpdi2dBYQ0nXktTOUhe5l9aNzIVtFFLWhZQnOLdh6Hct1ru9NQYK21
         aj+Q==
X-Gm-Message-State: AOJu0YxaAXVRi/yC+6f09sSWV8Gz8jLeC1wZQ2jhfZyV3lUimVs97hvM
	n6rUUSzHJdAGp+CoGz9zbIDgSdL1Op7o5bRMG//v2HcD53rorchY0ATn
X-Gm-Gg: AeBDievHD6rUe5t4k47tUzQ1KLQT4kf6o9fZsfOR9LEoZRvCLx63eSrLKclsys/eQ2U
	DvpPIxIAhVgAE3w/RdiL4V6trByvhDJDHJd8E1FuwE7iF7VhmO1Jqlvi+b5HK1vf5FcXu8EcK8R
	5aRCkkODCmboKcaN37HqXLFGgFIhhnLv2S7f1jx2TmroaOx5TxJFuLb5OeKQ8cvok7tdLB0iqP0
	lhHcTRb3G4BkPwRGeZFKhPUqWsABWZK6wEJsnjIdKiP+pxpi1Ckk4/0jjfRMbLL0DpA9+yokE4a
	FXwiK1hiDCcbIYxsuqRhT2B4EtKMgBe43bIYlwZTowciPyZOWSkHoIdPPxIt7Hjn5r0Y9L1YcNv
	4E1ODau3deGcnEXOtCEBq7fOFOSiTvauL5EWEXhgK+sVOQlo4wYo5CiwVVZoercHgjJpahm9dHa
	Fu807qu4wpBG9EPGDfoKmvv6LtS7FjoQVg+ozIMBysieg8pqjsUso=
X-Received: by 2002:a17:90b:3c81:b0:35d:a276:a880 with SMTP id 98e67ed59e1d1-35de6813892mr22551243a91.10.1775706580744;
        Wed, 08 Apr 2026 20:49:40 -0700 (PDT)
Received: from host.gitam.edu ([103.103.208.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e3503b278sm1600766a91.16.2026.04.08.20.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 20:49:40 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	b9788213@gmail.com,
	bera@yuzu.li,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: fix comment style in HalPhyRf_8723B.c
Date: Thu,  9 Apr 2026 09:18:59 +0530
Message-ID: <20260409034859.42356-2-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
References: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

removed extra spaces for comments and formated them to be more readable

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 120 +++++++++---------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 63c848ebd661..d4e8ec172658 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -8,8 +8,8 @@
 #include <drv_types.h>
 #include "odm_precomp.h"
 
-/*  MACRO definition for pRFCalibrateInfo->TxIQC_8723B[0] */
-#define		PATH_S0							1 /*  RF_PATH_B */
+/* MACRO definition for pRFCalibrateInfo->TxIQC_8723B[0] */
+#define		PATH_S0							1 /* RF_PATH_B */
 #define		IDX_0xC94						0
 #define		IDX_0xC80						1
 #define		IDX_0xC14						0
@@ -17,8 +17,8 @@
 #define		KEY							0
 #define		VAL							1
 
-/*  MACRO definition for pRFCalibrateInfo->TxIQC_8723B[1] */
-#define		PATH_S1							0 /*  RF_PATH_A */
+/* MACRO definition for pRFCalibrateInfo->TxIQC_8723B[1] */
+#define		PATH_S1							0 /* RF_PATH_A */
 #define		IDX_0xC4C						2
 
 /*---------------------------Define Local Constant---------------------------*/
@@ -210,7 +210,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 		Final_OFDM_Swing_Index = pDM_Odm->DefaultOfdmIndex + pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
 		Final_CCK_Swing_Index = pDM_Odm->DefaultCckIndex + pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
 
-		/*  Adjust BB swing by OFDM IQ matrix */
+		/* Adjust BB swing by OFDM IQ matrix */
 		if (Final_OFDM_Swing_Index >= PwrTrackingLimit_OFDM)
 			Final_OFDM_Swing_Index = PwrTrackingLimit_OFDM;
 		else if (Final_OFDM_Swing_Index <= 0)
@@ -269,7 +269,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			setCCKFilterCoefficient(pDM_Odm, PwrTrackingLimit_CCK);
 			pDM_Odm->Modify_TxAGC_Flag_PathA_CCK = true;
 			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, CCK);
-		} else if (Final_CCK_Swing_Index <= 0) { /*  Lowest CCK Index = 0 */
+		} else if (Final_CCK_Swing_Index <= 0) { /* Lowest CCK Index = 0 */
 			pDM_Odm->Remnant_CCKSwingIdx = Final_CCK_Swing_Index;
 			setCCKFilterCoefficient(pDM_Odm, 0);
 			pDM_Odm->Modify_TxAGC_Flag_PathA_CCK = true;
@@ -284,7 +284,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			}
 		}
 	} else
-		return; /*  This method is not supported. */
+		return; /* This method is not supported. */
 }
 
 static void GetDeltaSwingTable_8723B(
@@ -350,17 +350,18 @@ static u8 phy_PathA_IQK_8723B(
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	/*  Save RF Path */
+	/* Save RF Path */
 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
 
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	enable path A PA in TXIQK mode */
+	/* enable path A PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
+	/* disable path B PA in TXIQK mode */
 
 	/* 1 Tx IQK */
 	/* IQK setting */
@@ -384,10 +385,10 @@ static u8 phy_PathA_IQK_8723B(
 
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
-		/*  wifi switch to S1 */
+		/* wifi switch to S1 */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
 	else
-		/*  wifi switch to S0 */
+		/* wifi switch to S0 */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
@@ -408,7 +409,7 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 
-	/*  Check failed */
+	/* Check failed */
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
@@ -444,7 +445,7 @@ static u8 phy_PathA_RxIQK8723B(
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	/*  Save RF Path */
+	/* Save RF Path */
 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
 
 	/* leave IQK mode */
@@ -481,10 +482,10 @@ static u8 phy_PathA_RxIQK8723B(
 
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
-		/*  wifi switch to S1 */
+		/* wifi switch to S1 */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
 	else
-		/*  wifi switch to S0 */
+		/* wifi switch to S0 */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
@@ -504,7 +505,7 @@ static u8 phy_PathA_RxIQK8723B(
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/*  Check failed */
+	/* Check failed */
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
@@ -564,10 +565,10 @@ static u8 phy_PathA_RxIQK8723B(
 
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
-		/*  wifi switch to S1 */
+		/* wifi switch to S1 */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
 	else
-		/*  wifi switch to S0 */
+		/* wifi switch to S0 */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
@@ -584,14 +585,14 @@ static u8 phy_PathA_RxIQK8723B(
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
-    /* leave IQK mode */
+	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/*  Check failed */
+	/* Check failed */
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/* PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
@@ -622,10 +623,10 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	/*  Save RF Path */
+	/* Save RF Path */
 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
 
-    /* leave IQK mode */
+	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
@@ -671,10 +672,10 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
-    /* leave IQK mode */
+	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/*  Check failed */
+	/* Check failed */
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
@@ -705,9 +706,9 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	/*  Save RF Path */
+	/* Save RF Path */
 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
-    /* leave IQK mode */
+	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/* switch to path B */
@@ -741,7 +742,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	/* LO calibration setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a911);
 
-    /* enter IQK mode */
+	/* enter IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
@@ -762,10 +763,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
-    /* leave IQK mode */
+	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/*  Check failed */
+	/* Check failed */
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
@@ -819,7 +820,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	/* LO calibration setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a8d1);
 
-    /* enter IQK mode */
+	/* enter IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
@@ -839,10 +840,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	/* GNT_BT = 1 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
-    /* leave IQK mode */
+	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/*  Check failed */
+	/* Check failed */
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
@@ -913,7 +914,7 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
 		if (bTxOnly) {
-			/*  <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
+			/* <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
@@ -1009,10 +1010,10 @@ static void _PHY_PathBFillIQKMatrix8723B(
 	}
 }
 
-/*  */
-/*  2011/07/26 MH Add an API for testing IQK fail case. */
-/*  */
-/*  MP Already declare in odm.c */
+/* */
+/* 2011/07/26 MH Add an API for testing IQK fail case. */
+/* */
+/* MP Already declare in odm.c */
 
 void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 {
@@ -1290,14 +1291,14 @@ static void phy_IQCalibrate_8723B(
 	};
 	const u32 retryCount = 2;
 
-	/*  Note: IQ calibration must be performed after loading */
-	/* 		PHY_REG.txt , and radio_a, radio_b.txt */
+	/* Note: IQ calibration must be performed after loading */
+	/* PHY_REG.txt , and radio_a, radio_b.txt */
 
 	/* u32 bbvalue; */
 
 	if (t == 0) {
 
-		/*  Save ADDA parameters, turn Path A ADDA on */
+		/* Save ADDA parameters, turn Path A ADDA on */
 		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
 		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
 		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
@@ -1325,11 +1326,11 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x60fbd);
 
-/* path A TX IQK */
+	/* path A TX IQK */
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x01) {
-			/*  Path A Tx IQK Success */
+			/* Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
 
@@ -1361,7 +1362,7 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_IQK_8723B(padapter);
 			if (PathBOK == 0x01) {
-				/*  Path B Tx IQK Success */
+				/* Path B Tx IQK Success */
 				PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
 
@@ -1388,17 +1389,16 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0);
 
 	if (t != 0) {
-		/*  Reload ADDA power saving parameters */
+		/* Reload ADDA power saving parameters */
 		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
 
-		/*  Reload MAC parameters */
+		/* Reload MAC parameters */
 		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
 
 		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 
-
 		/* Allen initial gain 0xc50 */
-		/*  Restore RX initial gain */
+		/* Restore RX initial gain */
 		PHY_SetBBReg(pDM_Odm->Adapter, 0xc50, bMaskByte0, 0x50);
 		PHY_SetBBReg(pDM_Odm->Adapter, 0xc50, bMaskByte0, tmp0xc50);
 		if (is2T) {
@@ -1426,8 +1426,8 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 
 	if ((tmpReg&0x70) != 0)			/* Deal with contisuous TX case */
 		rtw_write8(pDM_Odm->Adapter, 0xd03, tmpReg&0x8F);	/* disable all continuous TX */
-	else							/*  Deal with Packet TX case */
-		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0xFF);		/*  block all queues */
+	else							 /* Deal with Packet TX case */
+		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0xFF); /* block all queues */
 
 	if ((tmpReg&0x70) != 0) {
 		/* 1. Read original RF mode */
@@ -1451,14 +1451,14 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 	LC_Cal = PHY_QueryRFReg(padapter, RF_PATH_A, RF_CHNLBW, bMask12Bits);
 
 	/* 4. Set LC calibration begin	bit15 */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFBE0); /*  LDO ON */
+	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFBE0); /* LDO ON */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal|0x08000);
 
 	mdelay(100);
 
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFFE0); /*  LDO OFF */
+	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFFE0); /* LDO OFF */
 
-	/*  Channel 10 LC calibration issue for 8723bs with 26M xtal */
+	/* Channel 10 LC calibration issue for 8723bs with 26M xtal */
 	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2) {
 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal);
 	}
@@ -1472,7 +1472,7 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 		/* Path-B */
 		if (is2T)
 			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, RF_Bmode);
-	} else /*  Deal with Packet TX case */
+	} else /* Deal with Packet TX case */
 		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0x00);
 }
 
@@ -1516,7 +1516,7 @@ void PHY_IQCalibrate_8723B(
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
 
-	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
+	/* 20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
 	if (bSingleTone || bCarrierSuppression)
 		return;
 
@@ -1533,7 +1533,7 @@ void PHY_IQCalibrate_8723B(
 
 		path = (PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskByte0) == 0x00) ? RF_PATH_A : RF_PATH_B;
 
-		/*  Restore TX IQK */
+		/* Restore TX IQK */
 		for (i = 0; i < 3; ++i) {
 			offset = pRFCalibrateInfo->TxIQC_8723B[path][i][0];
 			data = pRFCalibrateInfo->TxIQC_8723B[path][i][1];
@@ -1544,7 +1544,7 @@ void PHY_IQCalibrate_8723B(
 			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
 		}
 
-		/*  Restore RX IQK */
+		/* Restore RX IQK */
 		for (i = 0; i < 2; ++i) {
 			offset = pRFCalibrateInfo->RxIQC_8723B[path][i][0];
 			data = pRFCalibrateInfo->RxIQC_8723B[path][i][1];
@@ -1654,8 +1654,8 @@ void PHY_IQCalibrate_8723B(
 			_PHY_PathBFillIQKMatrix8723B(padapter, bPathBOK, result, final_candidate, (RegEC4 == 0));
 	}
 
-/* To Fix BSOD when final_candidate is 0xff */
-/* by sherry 20120321 */
+	/* To Fix BSOD when final_candidate is 0xff */
+	/* by sherry 20120321 */
 	if (final_candidate < 4) {
 		for (i = 0; i < IQK_MATRIX_REG_NUM; i++)
 			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[0][i] = result[final_candidate][i];
@@ -1692,7 +1692,7 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
 
-	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
+	/* 20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
 	if (bSingleTone || bCarrierSuppression)
 		return;
 
-- 
2.53.0

