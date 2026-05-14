Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5781A33689B
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 18:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782042; cv=none; b=eEspVmUcCPmTNiWNIhQlVSUo+FI0xKKh8GvGVB+CekcYh7LGbWhYd2+57vU/GXRrPx5TweGpAVCcA4nFbaTrpS66TX+NcdFwDCpq+fe3djLaKQwWhet/PPKM1yA50tfcU7SH+RKtkRp7MY44r5/iXq10wubB+OBFPIP2dxAMzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782042; c=relaxed/simple;
	bh=DZc4DTCJiJXmEi+cKFrEEuidbCA84zj9RZhzk7e0bOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XB2/XswfzaGnnpmEYVSLhwKF6dkHaQDt5cTqsAOobLD/QuODrcmC2VW2EDw+ciFyajzjyAVPT7FJuRovP0LeFfHkdrWIPw57qTwdZeLHikbkrm56hr++9ZkMm16AckpZp4DSlcgnDn/WPNFWy20Ub15SVDROvBCYsJCRvFmRDew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYqIFJhw; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYqIFJhw"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f30a4601bbso9112291eec.1
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 11:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778782039; x=1779386839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQG3RZ/0uaWQ+T7LX3bLNFIl1kXIBGHgQPvmibzJezY=;
        b=HYqIFJhwGPHKqPO4t9J30efKutvMV8N9Y/S1CRxy5tQF1nFFWZH3CVbT3G007yQ2XN
         vE4QH7fjR4r0fmWBWCmIC/clFOF4tRAgqos8AJCLO6Hs/m0nd8Ga5m7nQRDnuZ6grS9G
         xl2cSpiVk8VdDLjvAZ2TMTsiCln+pU3+h3Sf7xvVFq9ENs9mFI0qzKNfN0bioDXDKnv+
         8SmFQzintd5FWcjYdji8t4z3ZdCUuB2EhXz2e7o0e+luqq1A46GtcMJCC0Z6L4vhkTaD
         w+r6LXhdbAD3tT/eW2C9iVn2EXMrrcoyt/IpzYdSQBPIggU8gcQSgqPRJH+lrm818Zd6
         kblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778782039; x=1779386839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQG3RZ/0uaWQ+T7LX3bLNFIl1kXIBGHgQPvmibzJezY=;
        b=ZVXUaEJoE5flJN3/SPVu0eCBHNxYWovhizi6gWt8IAGIVVXhUdIUF0Ebmfz7ZPB0GV
         Iv6JjwtHHog//YTYpAlJTOD63DW896fsKSfsm6+bBmEyVhmZLaO0nvUsKhiPfHoIN428
         LrayFFILLnttMPqWbhMuYqhxh9bFiv1B3dPFg/FJjViyha3W2anRXQyiYJvixdj0tHyz
         CpFGf8xKwDW3RKIO2SGh+iuow6FC6S/ho+S1Z1nj12WPrazFwdyKLfGS6J6vFQz5H4nV
         ov3k22ElUKzuNPidUFKPAozsoUHG+hdH7RHcahSbA127AmrgMy09nbhQp/DfRSUDHfM0
         ZXzg==
X-Gm-Message-State: AOJu0YxMQ8xTg8PVGrM0W0VSGxsCuS74Uz/Zv5yvTbUxyYyaHW7gLUXZ
	TEbzR9NBJPMnq6FLEVrdmucY+5459JJJ/JIZKKaLwDNjXNDAbmRYavj4KIMbpg==
X-Gm-Gg: Acq92OGwsfwhF0S36Ua/zXFCi92lGV8IcTwKSItUIx7Z7Da8hRPNA9k1PTnwlBbp3Fc
	SuIeHByTeVDuERWcv5nYqkKfeZfP8RBx+xPhPro73xb9EC4ZglOOS9AznoomJ7FR27pOgacvt07
	MKeH6uyGoAKpLIwDA+LGLd8ZYX9qDTG0mxVgkuivbS5FpkQYtK48EyeH1xgVSHVIMJDoSr7CG11
	zVr7Eo6wy03TA31WaTVUj173j8uzM2WR7T+FtIfIuzpGUlEeOYFW4GYz77Td/qd7QOmHRhhy0/c
	fonZ/h2wslzKWt2DDB2ry2XtmI0qZp8VtcXQsF4Bin9LpDXYRQ/4nVpRaAriosjqlz94EYMA+PX
	AQ0HRP1wh887zwVYnNbK4WE2yK8Kk1uCpIgJ6sP/nJ17gZb8OAXQt3V0JsSjZU8fNRQ9y5LZ6lw
	TgKZd0Vkuz+R/2P86iwl3v8SGusDH5VNbhwc5srg==
X-Received: by 2002:a05:693c:2c84:b0:2ed:e14:7f56 with SMTP id 5a478bee46e88-303986c63c4mr315961eec.32.1778782039132;
        Thu, 14 May 2026 11:07:19 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm4558652eec.3.2026.05.14.11.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:07:18 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix multiple blank lines in hal/Hal* files
Date: Thu, 14 May 2026 11:06:42 -0700
Message-Id: <20260514180642.4608-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines in hal/Hal* source and header
files.

This fixes the following checkpatch.pl check:
CHECK: Please don't use multiple blank lines

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 13 ---------
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  5 ----
 .../staging/rtl8723bs/hal/HalHWImg8723B_MAC.h |  1 -
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  1 -
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.h  |  1 -
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  1 -
 drivers/staging/rtl8723bs/hal/HalPhyRf.h      |  1 -
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 27 -------------------
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.h    |  2 --
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |  1 -
 10 files changed, 53 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index f855df776a07..17b0d8c2ace4 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -235,8 +235,6 @@ static void halbtc8723b1ant_LimitedRx(
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_U1_AGG_BUF_SIZE, &rxAggSize);
 	/*  real update aggregation setting */
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_AGGREGATE_CTRL, NULL);
-
-
 }
 
 static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
@@ -298,7 +296,6 @@ static void halbtc8723b1ant_MonitorBtCtr(struct btc_coexist *pBtCoexist)
 	}
 }
 
-
 static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 {
 	s32	wifiRssi = 0;
@@ -333,7 +330,6 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 		pCoexSta->nCRCErr_11nAgg = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0xfba);
 	}
 
-
 	/* reset counter */
 	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0xf16, 0x1, 0x1);
 	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0xf16, 0x1, 0x0);
@@ -381,8 +377,6 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 	}
 
 	pCoexSta->bPreCCKLock =  pCoexSta->bCCKLock;
-
-
 }
 
 static bool halbtc8723b1ant_IsWifiStatusChanged(struct btc_coexist *pBtCoexist)
@@ -880,7 +874,6 @@ static void halbtc8723b1ant_SetAntPath(
 			}
 		}
 
-
 		/*  ext switch setting */
 		switch (antPosType) {
 		case BTC_ANT_PATH_WIFI:
@@ -930,7 +923,6 @@ static void halbtc8723b1ant_SetAntPath(
 			}
 		}
 
-
 		/*  internal switch setting */
 		switch (antPosType) {
 		case BTC_ANT_PATH_WIFI:
@@ -991,7 +983,6 @@ static void halbtc8723b1ant_SetFwPstdma(
 	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x60, 5, H2C_Parameter);
 }
 
-
 static void halbtc8723b1ant_PsTdma(
 	struct btc_coexist *pBtCoexist, bool bForceExec, bool bTurnOn, u8 type
 )
@@ -1029,12 +1020,10 @@ static void halbtc8723b1ant_PsTdma(
 		psTdmaByte4Val = 0x10; /*  0x778 = d/1 toggle */
 	}
 
-
 	if (bTurnOn) {
 		if (pBtLinkInfo->bSlaveRole)
 			psTdmaByte4Val = psTdmaByte4Val | 0x1;  /* 0x778 = 0x1 at wifi slot (no blocking BT Low-Pri pkts) */
 
-
 		switch (type) {
 		default:
 			halbtc8723b1ant_SetFwPstdma(
@@ -1320,7 +1309,6 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 	return bCommon;
 }
 
-
 static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 	struct btc_coexist *pBtCoexist, u8 wifiStatus
 )
@@ -2041,7 +2029,6 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 		return;
 	}
 
-
 	if (!bWifiConnected) {
 		bool bScan = false, bLink = false, bRoam = false;
 
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index e4b056873d73..6da6940c9043 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -552,7 +552,6 @@ static void halbtc8723b2ant_SetSwFullTimeDacSwing(
 		halbtc8723b2ant_SetDacSwingReg(pBtCoexist, 0x18);
 }
 
-
 static void halbtc8723b2ant_DacSwing(
 	struct btc_coexist *pBtCoexist,
 	bool bForceExec,
@@ -600,7 +599,6 @@ static void halbtc8723b2ant_SetAgcTable(
 		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0xc78, 0xa4200001);
 	}
 
-
 	/* RF Gain */
 	pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0xef, 0xfffff, 0x02000);
 	if (bAgcTableEn) {
@@ -1637,7 +1635,6 @@ static void halbtc8723b2ant_ActionSco(struct btc_coexist *pBtCoexist)
 	}
 }
 
-
 static void halbtc8723b2ant_ActionHid(struct btc_coexist *pBtCoexist)
 {
 	u8 wifiRssiState, btRssiState;
@@ -1885,7 +1882,6 @@ static void halbtc8723b2ant_ActionPanEdr(struct btc_coexist *pBtCoexist)
 	}
 }
 
-
 /* PAN(HS) only */
 static void halbtc8723b2ant_ActionPanHs(struct btc_coexist *pBtCoexist)
 {
@@ -2229,7 +2225,6 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 			pCoexDm->bAutoTdmaAdjust = false;
 		}
 
-
 		switch (pCoexDm->curAlgorithm) {
 		case BT_8723B_2ANT_COEX_ALGO_SCO:
 			halbtc8723b2ant_ActionSco(pBtCoexist);
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h
index 82de8aa0008b..250861325919 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h
@@ -8,7 +8,6 @@
 #ifndef __INC_MP_MAC_HW_IMG_8723B_H
 #define __INC_MP_MAC_HW_IMG_8723B_H
 
-
 /******************************************************************************
  *                           MAC_REG.TXT
  ******************************************************************************/
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index bfdebc840730..30c8624bba25 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -310,7 +310,6 @@ void ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(struct dm_odm_t *pDM_Odm)
 {
 	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
 
-
 	memcpy(
 		pRFCalibrateInfo->DeltaSwingTableIdx_2GA_P,
 		gDeltaSwingTableIdx_MP_2GA_P_TxPowerTrack_SDIO_8723B,
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h
index 04441fdeaa26..7b4f399fcdff 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h
@@ -8,7 +8,6 @@
 #ifndef __INC_MP_RF_HW_IMG_8723B_H
 #define __INC_MP_RF_HW_IMG_8723B_H
 
-
 /******************************************************************************
  *                           RadioA.TXT
  ******************************************************************************/
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a063..9e4d42e3a122 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -70,7 +70,6 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 
 	struct txpwrtrack_cfg c;
 
-
 	/* 4 1. The following TWO tables decide the final index of OFDM/CCK swing table. */
 	u8 *deltaSwingTableIdx_TUP_A;
 	u8 *deltaSwingTableIdx_TDOWN_A;
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.h b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
index 1e79ab9cb773..bd9430db968f 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
@@ -32,7 +32,6 @@ struct txpwrtrack_cfg {
 
 void ConfigureTxpowerTrack(struct dm_odm_t *pDM_Odm, struct txpwrtrack_cfg *pConfig);
 
-
 void ODM_ClearTxPowerTrackingState(struct dm_odm_t *pDM_Odm);
 
 void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter);
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index de431bc75627..70b68f473d58 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -39,7 +39,6 @@ static u8 DeltaSwingTableIdx_2GA_P_8188E[] = {
 /* 3 Tx Power Tracking */
 /* 3 ============================================================ */
 
-
 static void setIqkMatrix_8723B(
 	struct dm_odm_t *pDM_Odm,
 	u8 OFDM_index,
@@ -118,7 +117,6 @@ static void setIqkMatrix_8723B(
 	}
 }
 
-
 static void setCCKFilterCoefficient(struct dm_odm_t *pDM_Odm, u8 CCKSwingIndex)
 {
 	u8 (*swingtable)[8];
@@ -322,7 +320,6 @@ static void GetDeltaSwingTable_8723B(
 	}
 }
 
-
 void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *pConfig)
 {
 	pConfig->SwingTableSize_CCK = CCK_TABLE_SIZE;
@@ -414,13 +411,11 @@ static u8 phy_PathA_IQK_8723B(
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-
 	/*  Check failed */
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
 	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
-
 	/* Allen 20131125 */
 	tmp = (regE9C & 0x03FF0000)>>16;
 	if ((tmp & 0x200) > 0)
@@ -553,7 +548,6 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x55, bRFRegOffsetMask, 0x4021f);
 
-
 	/* IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 
@@ -652,8 +646,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
 
-
-
 	/* 1 Tx IQK */
 	/* IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
@@ -746,12 +738,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fcd);
 
-
 	/* IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 
-
 	/* path-B IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
@@ -781,7 +771,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
-
 	/*  delay x ms */
 	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
@@ -889,8 +878,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
 /* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
 
-
-
 	/* Allen 20131125 */
 	tmp = (regEAC & 0x03FF0000)>>16;
 	if ((tmp & 0x200) > 0)
@@ -1114,7 +1101,6 @@ static void _PHY_SaveADDARegisters8723B(
 	}
 }
 
-
 static void _PHY_SaveMACRegisters8723B(
 	struct adapter *padapter, u32 *MACReg, u32 *MACBackup
 )
@@ -1130,7 +1116,6 @@ static void _PHY_SaveMACRegisters8723B(
 
 }
 
-
 static void _PHY_ReloadADDARegisters8723B(
 	struct adapter *padapter,
 	u32 *ADDAReg,
@@ -1159,7 +1144,6 @@ static void _PHY_ReloadMACRegisters8723B(
 	rtw_write32(padapter, MACReg[i], MACBackup[i]);
 }
 
-
 static void _PHY_PathADDAOn8723B(
 	struct adapter *padapter,
 	u32 *ADDAReg,
@@ -1283,8 +1267,6 @@ static bool phy_SimularityCompare_8723B(
 	}
 }
 
-
-
 static void phy_IQCalibrate_8723B(
 	struct adapter *padapter,
 	s32 result[][8],
@@ -1370,13 +1352,11 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_TRMuxPar, bMaskDWord, 0x000800e4);
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
 
-
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
 
-
 /* RX IQ calibration setting for 8723B D cut large current issue when leaving IPS */
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -1481,7 +1461,6 @@ static void phy_IQCalibrate_8723B(
 
 }
 
-
 static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 {
 	u8 tmpReg;
@@ -1590,7 +1569,6 @@ void PHY_IQCalibrate_8723B(
 	if (pDM_Odm->RFCalibrateInfo.bIQKInProgress)
 		return;
 
-
 	pDM_Odm->RFCalibrateInfo.bIQKInProgress = true;
 
 	if (bRestore) {
@@ -1648,7 +1626,6 @@ void PHY_IQCalibrate_8723B(
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
 /* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
 
-
 	for (i = 0; i < 8; i++) {
 		result[0][i] = 0;
 		result[1][i] = 0;
@@ -1663,7 +1640,6 @@ void PHY_IQCalibrate_8723B(
 	is23simular = false;
 	is13simular = false;
 
-
 	for (i = 0; i < 3; i++) {
 		phy_IQCalibrate_8723B(padapter, result, i, Is2ant, RF_Path);
 
@@ -1766,7 +1742,6 @@ void PHY_IQCalibrate_8723B(
 	pDM_Odm->RFCalibrateInfo.bIQKInProgress = false;
 }
 
-
 void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 {
 	bool		bSingleTone = false, bCarrierSuppression = false;
@@ -1786,9 +1761,7 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 
 	pDM_Odm->RFCalibrateInfo.bLCKInProgress = true;
 
-
 	phy_LCCalibrate_8723B(pDM_Odm, false);
 
-
 	pDM_Odm->RFCalibrateInfo.bLCKInProgress = false;
 }
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
index c83442917f9d..14b328378b8b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
@@ -15,7 +15,6 @@
 #define AVG_THERMAL_NUM_8723B		4
 #define	RF_T_METER_8723B					0x42	/*  */
 
-
 void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *pConfig);
 
 void ODM_TxPwrTrackSetPwr_8723B(
@@ -46,7 +45,6 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm);
 /*  */
 void PHY_DigitalPredistortion_8723B(struct adapter *padapter);
 
-
 void _PHY_SaveADDARegisters_8723B(
 	struct adapter *padapter,
 	u32 *ADDAReg,
diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 86404b5e6c52..a59505cc4a07 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -23,7 +23,6 @@ Major Change History:
 #include <drv_types.h>
 #include <HalPwrSeqCmd.h>
 
-
 /*  */
 /*  Description: */
 /*  This routine deal with the Power Configuration CMDs parsing for RTL8723/RTL8188E Series IC. */
-- 
2.34.1

