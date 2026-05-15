Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824993F8ED3
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867509; cv=none; b=XBuRGLnBPCzc3GPq3AEv2WSrYqZoproFya3JMa+ug8+GJKG+5DyqL8Kj12LVlF1d7VzXw+Sdri4k0chPsScENgAOugTyE4iLFvXmKjMIte3hjQHwefMiRHROx4udSzoHb+xAUhUQKU6OVYmHZMrOya4ZEo+ai3f9HliZLFGJ7ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867509; c=relaxed/simple;
	bh=FtgssZ+f6HN27vprPx3RK2voMlYP2+V6LuMP80GTec4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bxaDGS8mSrBde4pO309KPSq3I3QaBQlOfuhEXXeBIu5h0mrBlXStbFEuE/0YiQSPmGXeV7rygiiygX6jHplYhddFf8HmA7GScoSohJipB/rFIy6nnotIBgYAf4Xcf+7yZaPZjYh1sdCPGrci6PPzNU3ALKJPm/DABlBUX8AO75I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHnaA270; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHnaA270"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b4520f6b32so159945eec.0
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778867507; x=1779472307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATFlTaV5xxrGrd8AaUma55rreWGm/7yn3mgeUrfsIHk=;
        b=tHnaA270C1xLzXhO/1T7/440YeF2RDIbd4ZdZE0z8UmEtMjhHBxOC1NikMEI++feSz
         QGffMAnJp15VVQ0oJd3jmmEnZqNIO3/7IqrX9IyajBPCB5AbPTDEuLHBX3C5BECAGuaS
         XRV0ReKm/FrnjRkRR9XQqPDN39MnxF/iqEy/LymkbcbGTsAI8n/4usZY5q+45qz+ihBQ
         KCQ67NAKCHWyVhuIY0/VvsEUdyFZDv5g4MeD5PII18lDHQPJBaULT5gMOJU8xNYX5mEo
         zxKHfyzlDvb3EMurYHT4Xh3ijRZr2j5gEkC6pl09NzVuh/e3JVza1wZNbnBLNeI9dJEX
         z1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778867507; x=1779472307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATFlTaV5xxrGrd8AaUma55rreWGm/7yn3mgeUrfsIHk=;
        b=ARG7w4iiTMQzgwuA7VOqtizn6aD988zwpv0A4Jr3cqQ/bxI9nJ2uCzuVrU28wSpEGz
         uTlM2YwON3RLtrmH8PCd4qS6IdjOkpK3bUgFUUsAKh/xFH1QkDK0CWTnkACnQ5gp0tgn
         ZBwNih07ppTR5FxsPMv3d/lobyCXfF7jPJzTMPhQ0perzOfkLdEehUt48W/kzFSl3fhn
         JEwGFzc8+m2/vI/kqjs1WUD7S98MEnH11edxteOfSAVfzhfBJOai54HWVxsNNUkv7Kln
         Ogdddn55/HprKsYhi67/vRxgHb0sFbFwFKdrwwWTJHmUjnBRcTXSDL9VxJqVMRUaiH8T
         YBMg==
X-Gm-Message-State: AOJu0YyqxS44KGC/b7ojmuOrMKCKxCe+8LpdnKEQW3l/QYLu0mQNqCa7
	Ra/d4Z55fIfh/GdECOKU2PlF/6eGemELl8kfSUKjwi30GzWfdj7qt46PZOssrg==
X-Gm-Gg: Acq92OF5YcWD9P9Q0G2NYvMQyU1/GxEhjUMOi2aiyBpCRHFqzi6FMpTRL625xX1F5Oz
	4SZ6golNJA3OKBJ6Jpx6O42N/vHcRRO2nU37RaNlu3ZoOvfqvayni2FigXQensIuFMfOhBlVStF
	LPArVLHvZ87LKvZRv2q6hWrd7a1mu9cUSXiLh6xXCB4GU0ScCF7Fr/pi0KT6z9ZFI9YDEZ+gDXx
	sjla4YQEbyiXvXSjVEWdj/FZVuIlf7YzxnbZ+fk4VsNUdrVItEb0YFAv3UIvWTkVyN1l7oB3jgz
	M5dhTig02vMBxN/ZQu10HGYSeLiII1dnq0cdQP8s0Jc3ggLTf6lVsSNV/Sge/FLd8eAe6aaBoNZ
	BWUNaq2cjYnMLlo6T+Ru1V3P4Uui2AZBppJZHMNZWeh8kt/MqHYPpIbwn1hwMlFMF87/3xa7shm
	7RK3PX9PHgZ9R/OEPnhrNPovDK1EK7+wDK
X-Received: by 2002:a05:7300:570e:b0:2e6:ffa8:ef85 with SMTP id 5a478bee46e88-30397b9d820mr2748410eec.0.1778867506421;
        Fri, 15 May 2026 10:51:46 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-302978ad18asm7618410eec.26.2026.05.15.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:51:45 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix multiple blank lines in more hal/ files
Date: Fri, 15 May 2026 10:51:40 -0700
Message-Id: <20260515175140.7439-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines in more hal/ files.

This fixes the following checkpatch.pl check:
CHECK: Please don't use multiple blank lines

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---

This patch together with two similar independent patches I sent out
before fixes this issue for all files under hal/.
---
 drivers/staging/rtl8723bs/hal/odm.c           | 10 ----------
 drivers/staging/rtl8723bs/hal/odm.h           |  2 --
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 10 ----------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  3 ---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  1 -
 .../rtl8723bs/hal/odm_RegConfig8723B.c        |  1 -
 .../staging/rtl8723bs/hal/odm_RegDefine11N.h  |  2 --
 drivers/staging/rtl8723bs/hal/odm_interface.h |  3 ---
 drivers/staging/rtl8723bs/hal/odm_types.h     |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  4 ----
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  5 -----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 19 -------------------
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  3 ---
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  1 -
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  1 -
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  4 ----
 16 files changed, 70 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index df394323d901..180aac640a14 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -434,8 +434,6 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 		}
 	}
 
-
-
 	if (tmpEntryMaxPWDB != 0)	/*  If associated entry is found */
 		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = tmpEntryMaxPWDB;
 	else
@@ -509,7 +507,6 @@ void odm_TXPowerTrackingInit(struct dm_odm_t *pDM_Odm)
 	struct adapter *Adapter = pDM_Odm->Adapter;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-
 	struct dm_priv *pdmpriv = &pHalData->dmpriv;
 
 	pdmpriv->bTXPowerTracking = true;
@@ -623,7 +620,6 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	if (*pDM_Odm->pbPowerSaving)
 		return;
 
-
 	odm_RefreshRateAdaptiveMask(pDM_Odm);
 	odm_EdcaTurboCheck(pDM_Odm);
 	ODM_CfoTracking(pDM_Odm);
@@ -637,7 +633,6 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	pDM_Odm->PhyDbgInfo.NumQryBeaconPkt = 0;
 }
 
-
 /*  */
 /*  Init /.. Fixed HW value. Only init time. */
 /*  */
@@ -732,7 +727,6 @@ void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 V
 
 }
 
-
 void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void *pValue)
 {
 	/*  */
@@ -856,7 +850,6 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 
 }
 
-
 void ODM_CmnInfoPtrArrayHook(
 	struct dm_odm_t *pDM_Odm,
 	enum odm_cmninfo_e CmnInfo,
@@ -882,7 +875,6 @@ void ODM_CmnInfoPtrArrayHook(
 
 }
 
-
 /*  */
 /*  Update Band/CHannel/.. The values are dynamic but non-per-packet. */
 /*  */
@@ -956,8 +948,6 @@ void ODM_CmnInfoUpdate(struct dm_odm_t *pDM_Odm, u32 CmnInfo, u64 Value)
 		/* do nothing */
 		break;
 	}
-
-
 }
 
 /* 3 ============================================================ */
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index ef23a2088733..ee263790b32b 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 
-
 #ifndef	__HALDMOUTSRC_H__
 #define __HALDMOUTSRC_H__
 
@@ -174,7 +173,6 @@ struct swat_t { /* _SW_Antenna_Switch_ */
 
 /* Remove Edca by YuChen */
 
-
 struct odm_rate_adaptive {
 	u8 Type;				/*  DM_Type_ByFW/DM_Type_ByDriver */
 	u8 LdpcThres;			/*  if RSSI > LdpcThres => switch from LPDC to BCC */
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index ef3c2db8553e..4e28b7742bfe 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -80,7 +80,6 @@ void odm_NHMBB(void *pDM_VOID)
 	pDM_Odm->NHMLastRxOkcnt =
 		*(pDM_Odm->pNumRxBytesUnicast);
 
-
 	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
 		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
@@ -128,7 +127,6 @@ void odm_SearchPwdBLowerBound(void *pDM_VOID, u8 IGI_target)
 	IGI = 0x50; /*  find H2L, L2H lower bound */
 	ODM_Write_DIG(pDM_Odm, IGI);
 
-
 	Diff = IGI_target-(s8)IGI;
 	TH_L2H_dmc = pDM_Odm->TH_L2H_ini + Diff;
 	if (TH_L2H_dmc > 10)
@@ -212,7 +210,6 @@ void odm_AdaptivityInit(void *pDM_VOID)
 	PHY_SetBBReg(pDM_Odm->Adapter, REG_RD_CTRL, BIT(11), 1); /*  stop counting if EDCCA is asserted */
 }
 
-
 void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
@@ -363,7 +360,6 @@ void odm_DIGInit(void *pDM_VOID)
 	pDM_DigTable->rx_gain_range_min = DM_DIG_MIN_NIC;
 }
 
-
 void odm_DIG(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
@@ -388,7 +384,6 @@ void odm_DIG(void *pDM_VOID)
 	if (pDM_Odm->adaptivity_flag)
 		Adap_IGI_Upper = pDM_Odm->Adaptivity_IGI_upper;
 
-
 	/* 1 Update status */
 	DIG_Dynamic_MIN = pDM_DigTable->DIG_Dynamic_MIN_0;
 	FirstConnect = (pDM_Odm->bLinked) && !pDM_DigTable->bMediaConnect_0;
@@ -469,7 +464,6 @@ void odm_DIG(void *pDM_VOID)
 	if (pDM_DigTable->rx_gain_range_min > pDM_DigTable->rx_gain_range_max)
 		pDM_DigTable->rx_gain_range_min = pDM_DigTable->rx_gain_range_max;
 
-
 	/* 1 False alarm threshold decision */
 	odm_FAThresholdCheck(pDM_Odm, bDFSBand, bPerformance, RxTp, TxTp, dm_FA_thres);
 
@@ -536,7 +530,6 @@ void odm_DIG(void *pDM_VOID)
 		}
 	}
 
-
 	/* 1 Update status */
 	if (pDM_Odm->bBtHsOperation) {
 		if (pDM_Odm->bLinked) {
@@ -581,7 +574,6 @@ void odm_DIGbyRSSI_LPS(void *pDM_VOID)
 	else if (pFalseAlmCnt->Cnt_all < DM_DIG_FA_TH0_LPS)
 		CurrentIGI = CurrentIGI-2;
 
-
 	/* Lower bound checking */
 
 	/* RSSI Lower bound check */
@@ -683,7 +675,6 @@ void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
 		FalseAlmCnt->Cnt_OFDM_CCA + FalseAlmCnt->Cnt_CCK_CCA;
 }
 
-
 void odm_FAThresholdCheck(
 	void *pDM_VOID,
 	bool bDFSBand,
@@ -763,7 +754,6 @@ void odm_CCKPacketDetectionThresh(void *pDM_VOID)
 	struct false_ALARM_STATISTICS *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 	u8 CurCCK_CCAThres;
 
-
 	if (
 		!(pDM_Odm->SupportAbility & ODM_BB_CCK_PD) ||
 		!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT)
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 4784d33eab0e..e995cb5c2518 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -116,7 +116,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
 	phy_info->rx_mimo_signal_quality[RF_PATH_B] = -1;
 
-
 	if (is_cck_rate) {
 		u8 cck_agc_rpt;
 
@@ -258,7 +257,6 @@ static void odm_Process_RSSIForDM(
 	u32 Weighting = 0;
 	PSTA_INFO_T pEntry;
 
-
 	if (pPktinfo->station_id == 0xFF)
 		return;
 
@@ -389,7 +387,6 @@ static void odm_Process_RSSIForDM(
 	}
 }
 
-
 /*  */
 /*  Endianness before calling this API */
 /*  */
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index 0c3697c38e64..615145812ed2 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 
-
 #ifndef __HALHWOUTSRC_H__
 #define __HALHWOUTSRC_H__
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
index b0ca46aec1a5..6514a711e6bd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
+++ b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
@@ -83,7 +83,6 @@ void odm_ConfigRFReg_8723B(
 	}
 }
 
-
 void odm_ConfigRF_RadioA_8723B(struct dm_odm_t *pDM_Odm, u32 Addr, u32 Data)
 {
 	u32  content = 0x1000; /*  RF_Content: radioa_txt */
diff --git a/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h b/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h
index 6d7062a1cbbe..9ba8e06e5ad5 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h
+++ b/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h
@@ -8,7 +8,6 @@
 #ifndef	__ODM_REGDEFINE11N_H__
 #define __ODM_REGDEFINE11N_H__
 
-
 /* 2 RF REG LIST */
 #define	ODM_REG_RF_MODE_11N				0x00
 #define	ODM_REG_RF_0B_11N				0x0B
@@ -152,7 +151,6 @@
 #define	ODM_REG_ANT_TRAIN_PARA1_11N		0x7b0
 #define	ODM_REG_ANT_TRAIN_PARA2_11N		0x7b4
 
-
 /* DIG Related */
 #define	ODM_BIT_IGI_11N					0x0000007F
 #define	ODM_BIT_CCK_RPT_FORMAT_11N		BIT(9)
diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
index c3b13f5f37db..f79c3d57edff 100644
--- a/drivers/staging/rtl8723bs/hal/odm_interface.h
+++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
@@ -5,12 +5,9 @@
  *
  ******************************************************************************/
 
-
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-
-
 /*  =========== Macro Define */
 
 #define _reg_all(_name)			ODM_##_name
diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index bc0c4d027492..25f0edd716cc 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -20,7 +20,6 @@ enum hal_status {
 	HAL_STATUS_FAILURE,
 };
 
-
 	#if defined(__LITTLE_ENDIAN)
 		#define	ODM_ENDIAN_TYPE			ODM_ENDIAN_LITTLE
 	#else
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 2485c415f14b..c35c7f1c38ef 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -30,7 +30,6 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 	return !ret;
 }
 
-
 /*****************************************
  * H2C Msg format :
  *| 31 - 8		|7-5	| 4 - 0	|
@@ -167,15 +166,12 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pktlen);
 	}
 
-
 	/* todo: ERP IE */
 
-
 	/*  EXTERNDED SUPPORTED RATE */
 	if (rate_len > 8)
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pktlen);
 
-
 	/* todo:HT for adhoc */
 
 _ConstructBeacon:
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 612351010359..2276dc1cb44a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -99,7 +99,6 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SCAN, &(pmlmepriv->bScanInProcess));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_POWER_SAVING, &(pwrctrlpriv->bpower_saving));
 
-
 	for (i = 0; i < NUM_STA; i++)
 		ODM_CmnInfoPtrArrayHook(pDM_Odm, ODM_CMNINFO_STA_STATUS, i, NULL);
 }
@@ -183,7 +182,6 @@ void rtl8723b_hal_dm_in_lps(struct adapter *padapter)
 	/* update IGI */
 	ODM_Write_DIG(pDM_Odm, pDM_Odm->RSSI_Min);
 
-
 	/* set rssi to fw */
 	psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
 	if (psta && (psta->rssi_stat.UndecoratedSmoothedPWDB > 0)) {
@@ -208,7 +206,6 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 	if (!Adapter->hw_init_completed)
 		goto skip_lps_dm;
 
-
 	if (rtw_linked_check(Adapter))
 		bLinked = true;
 
@@ -220,7 +217,6 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
 		goto skip_lps_dm;
 
-
 	/* ODM_DMWatchdog(&pHalData->odmpriv); */
 	/* Do DIG by RSSI In LPS-32K */
 
@@ -245,7 +241,6 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 	)
 		rtw_dm_in_lps_wk_cmd(Adapter);
 
-
 skip_lps_dm:
 
 	return;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 2a748367fbba..bcaf63b2893c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -152,7 +152,6 @@ void _8051Reset8723(struct adapter *padapter)
 	u8 cpu_rst;
 	u8 io_rst;
 
-
 	/*  Reset 8051(WLMCU) IO wrapper */
 	/*  0x1c[8] = 0 */
 	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
@@ -571,7 +570,6 @@ void Hal_EfusePowerSwitch(
 	u8 tempval;
 	u16 tmpV16;
 
-
 	if (PwrState) {
 		/*  To avoid cannot access efuse registers after disable/enable several times during DTM test. */
 		/*  Suggested by SD1 IsaacHsu. 2013.07.08, added by tynli. */
@@ -579,7 +577,6 @@ void Hal_EfusePowerSwitch(
 		if (tempval & BIT(0)) { /*  SDIO local register is suspend */
 			u8 count = 0;
 
-
 			tempval &= ~BIT(0);
 			rtw_write8(padapter, SDIO_LOCAL_BASE|SDIO_REG_HSUS_CTRL, tempval);
 
@@ -721,7 +718,6 @@ static void hal_ReadEFuse_BT(
 	u16 i, total, used;
 	u8 efuse_usage;
 
-
 	/*  */
 	/*  Do NOT excess total size of EFuse table. Added by Roger, 2008.11.10. */
 	/*  */
@@ -756,7 +752,6 @@ static void hal_ReadEFuse_BT(
 				if (ALL_WORDS_DISABLED(efuseExtHdr))
 					continue;
 
-
 				offset |= ((efuseExtHdr & 0xF0) >> 1);
 				wden = (efuseExtHdr & 0x0F);
 			} else {
@@ -859,7 +854,6 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 	u16 val16;
 	u8 val8 = DIS_TSF_UDT;
 
-
 	val16 = val8 | (val8 << 8); /*  port0 and port1 */
 
 	/*  Enable prot0 beacon function for PSTDMA */
@@ -959,7 +953,6 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	/* REG_DUAL_TSF_RST */
 	/* REG_BCN_CTRL (0x550) */
 
-
 	bcn_ctrl_reg = REG_BCN_CTRL;
 
 	/*  */
@@ -1062,7 +1055,6 @@ void rtl8723b_init_default_value(struct adapter *padapter)
 	struct dm_priv *pdmpriv;
 	u8 i;
 
-
 	pHalData = GET_HAL_DATA(padapter);
 	pdmpriv = &pHalData->dmpriv;
 
@@ -1190,7 +1182,6 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 /* 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter); */
 	u16 EEPROMId;
 
-
 	/*  Check 0x8129 again for making sure autoload status!! */
 	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
 	if (EEPROMId != RTL_EEPROM_ID) {
@@ -1313,7 +1304,6 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 	}
 }
 
-
 void Hal_EfuseParseTxPowerInfo_8723B(
 	struct adapter *padapter, u8 *PROMContent, bool AutoLoadFail
 )
@@ -1426,8 +1416,6 @@ void Hal_EfuseParseEEPROMVer_8723B(
 		pHalData->EEPROMVersion = 1;
 }
 
-
-
 void Hal_EfuseParsePackageType_8723B(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
@@ -1461,7 +1449,6 @@ void Hal_EfuseParsePackageType_8723B(
 	}
 }
 
-
 void Hal_EfuseParseVoltage_8723B(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
@@ -1513,7 +1500,6 @@ void Hal_EfuseParseXtal_8723B(
 		pHalData->CrystalCap = EEPROM_Default_CrystalCap_8723B;
 }
 
-
 void Hal_EfuseParseThermalMeter_8723B(
 	struct adapter *padapter, u8 *PROMContent, u8 AutoLoadFail
 )
@@ -1534,7 +1520,6 @@ void Hal_EfuseParseThermalMeter_8723B(
 	}
 }
 
-
 void Hal_ReadRFGainOffset(
 	struct adapter *Adapter, u8 *PROMContent, bool AutoloadFail
 )
@@ -1603,7 +1588,6 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 	u32 index;
 	u16 checksum = 0;
 
-
 	/*  Clear first */
 	ptxdesc->txdw7 &= cpu_to_le32(0xffff0000);
 
@@ -2098,7 +2082,6 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 	struct hal_com_data *pHalData;
 	struct mlme_priv *pmlmepriv;
 
-
 	pHalData = GET_HAL_DATA(padapter);
 	pmlmepriv = &padapter->mlmepriv;
 
@@ -2161,7 +2144,6 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct eeprom_priv *pEEPROM;
 
-
 	pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
 	if (type == 0) { /*  prepare to join */
@@ -2225,7 +2207,6 @@ s32 c2h_id_filter_ccx_8723b(u8 *buf)
 	return ret;
 }
 
-
 s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 {
 	struct c2h_evt_hdr_88xx *pC2hEvent = (struct c2h_evt_hdr_88xx *)buf;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index 5564f3f20ba5..da4cb28276b2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -31,11 +31,9 @@
 /*---------------------------Define Local Constant---------------------------*/
 /*---------------------------Define Local Constant---------------------------*/
 
-
 /*------------------------Define global variable-----------------------------*/
 /*------------------------Define global variable-----------------------------*/
 
-
 /*------------------------Define local variable------------------------------*/
 /*  2008/11/20 MH For Debug only, RF */
 /*------------------------Define local variable------------------------------*/
@@ -149,7 +147,6 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	return _SUCCESS;
 }
 
-
 int PHY_RF6052_Config8723B(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
index db3d7d72bffa..ac1249676794 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
@@ -49,7 +49,6 @@ static void process_link_qual(struct adapter *padapter, union recv_frame *prfram
 	signal_stat->avg_val = signal_stat->total_val / signal_stat->total_num;
 } /*  Process_UiLinkQuality8192S */
 
-
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe)
 {
 	union recv_frame *precvframe = prframe;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 888029e21dcb..97dce28fd0a3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -110,7 +110,6 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	pkt_info.to_self = pkt_info.bssid_match &&
 		ether_addr_equal(rx_ra, my_hwaddr);
 
-
 	pkt_info.is_beacon = pkt_info.bssid_match &&
 		(GetFrameSubType(wlanhdr) == WIFI_BEACON);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a7f23335cdd9..66bb84694cf6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -398,7 +398,6 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	if (ret == 1)
 		goto next;
 
-
 	return _SUCCESS;
 }
 
@@ -474,7 +473,6 @@ s32 rtl8723bs_hal_xmit(
 	struct xmit_priv *pxmitpriv;
 	s32 err;
 
-
 	pxmitframe->attrib.qsel = pxmitframe->attrib.priority;
 	pxmitpriv = &padapter->xmitpriv;
 
@@ -534,7 +532,6 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
 	struct hal_com_data *phal;
 
-
 	phal = GET_HAL_DATA(padapter);
 
 	spin_lock_init(&phal->SdioTxFIFOFreePageLock);
@@ -552,7 +549,6 @@ void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 	struct list_head *plist, *phead;
 	struct list_head tmplist;
 
-
 	phead = get_list_head(pqueue);
 	INIT_LIST_HEAD(&tmplist);
 
-- 
2.34.1

