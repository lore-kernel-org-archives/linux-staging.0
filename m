Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDA05452B5
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155254; cv=none; b=blCpZbXD8QDhtJDgfENtYb/0X1yEeQ/R309iRWKcNuFU90H1IruJaHBSKeig2UnL366ANLL+1OudXP9/zwZo7uqXmOKrNrkf6l61V5JxD+I9OiG1VhbHLkbHIOsV4sLZ6mLCfdwyrPbEMrDwh3sDdgvJEXaRwt9scgEgEmvc8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155254; c=relaxed/simple;
	bh=8RGIbiUU5OyoaFkCSAVmwHBddHSMOHRJX4XKDJkD0vM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a+rEVVdjqKWBiJOfMad36PzENLW5/1mNbmjwbr+6qz37ZMT6akYG3btJROT5Yd2jjon/sUlT8YHsR9T1A1VbyvQ0F3UAKsU2Z6A6Nc8evPye/aey8HNCiXZFtY7cHm+Q7cazkFE7WAbWM/xNlJrScWls4/+vQxRQsZwDCK9RLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pc+uTNw6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pc+uTNw6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f9bso2711395ad.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 12:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789155226; x=1789760026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayKNQQQxP/7h3+W7liZmbLghs6NSmnilLcaJV5kufGE=;
        b=pc+uTNw6nKoBWRFYCxEcatb22c2fnb+fORSA92/4gUsrbCv9zw8oM41DkKLdkBkp3j
         mIG1a3jvuo4yW933H7hrFknNB9doFyuBFVHQW88nzD43hqQI/xMQph2I7yuYpI8CKeiF
         2nelat1cEcXmUTmQ+AkataNR70yiTfq5bSXk04scMPL+s2bFh5jajZodnGrxBsS6yiZ5
         Imca1B5rjICmdO9UC9J4zeX73pQsRRDBqdqm/N0tNd+8JhBfZp7zIYvhwrASBll94vcA
         xLTVlmb3BjSuv0lREOm+9mK+nWsKatwMs/ntIGDKBNqbAEpa2YRO6a7AGm6AWJ1xsDhT
         L5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155226; x=1789760026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayKNQQQxP/7h3+W7liZmbLghs6NSmnilLcaJV5kufGE=;
        b=eSMhCc9Lu31DRSuBr63Y8V93nJXMpIRF+q7DipsTpWirpRXHJKuYpSYzx89UDpDBkl
         EKnQKZ6f2pa2XR2oEybw3UmcGSC6CeeLTUy+fklXvwuDU5acLPH4ZAGxxQ+qD+ref/vw
         YrSKzbAuVWFNlyBL4cOAeXO4enIkipSUtY57zyYRq28ee8ylGjfPLugj6fq6NbclRn+d
         BxbvH5l7IS9p2dNfX9Eo3hsniY4OSiNl5LdQzKRU7X43TEaQKIhLkorKJqs7hIgnWcSn
         EwX2yjlO5Hm0s2fGkYUgPGsugeKrp0J5PQqnXr3FpVtRxBJkNJ64lhlMyb4EYT3SfD1p
         7kqw==
X-Gm-Message-State: AFuF++l6+KMb85S39Mb6SjmtH0WjnALcQqc8VVq+cH9DAnPsyNKBN2Nj
	DpF0Rzn3V096nlr8tKRa5/utRMnyBba/T0HtMxorpNu7NxCqkKjIHHzC3MYCyg==
X-Gm-Gg: AYBFou2ZYfjZw2keGyuMgXwHeA5qhJN1tc2sVFZ8ufrBh25bboZDlf1fHbPLsXZ/bqw
	UyIJIHX6i3JgAhzn047RSstM9g0gU+IklC3T8IwA4VRp/rmL46dETbIesbCaSY2lebg6Og+zo7N
	Xu9NDlY78G3nhqigqrEsTzD0lF3VC1IGzAI+iEJghHosS+gBGJpjp84EmK4wNo19ZXlDUW9xx/F
	AVq9NrIX2ZEI7xDOhODf3OyEE+o5gPoZVtVrlQ5XwuL5ta/s+wJ0s5IaqDjaZr56PjcV9teHdf2
	Sv/SgYcN5qNKOzLj2LuDoKEGW2uZgxykIfbldcs+Yb26KBmGQ8oYHJn45PqJV9so6wr05ORHJUa
	85eeg4fsFgWD7hBR20dV0mdkMDuoWICsME7Eo5XLzd9s6ko3OriDEowqcqRIFE85tx/2cvF+ZNY
	bMLKIK65eDOYF+DjEv59sa5C4gNWMJZDRN0SvrXyALZgr/KI5P+HOZO5L0vqvMhROnZhHERPZUY
	+6NFu17NA==
X-Received: by 2002:a17:902:ccc9:b0:2d7:3f6e:5cb9 with SMTP id d9443c01a7336-2dd2a1efc6amr112140105ad.8.1789155226377;
        Fri, 11 Sep 2026 12:33:46 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4cf015csm9426927eec.4.2026.09.11.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:33:45 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 1/2] staging: rtl8723bs: delete empty comment lines in hal/ header files
Date: Fri, 11 Sep 2026 12:33:34 -0700
Message-Id: <20260911193335.6908-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911193335.6908-1-guojy.bj@gmail.com>
References: <20260911193335.6908-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete all empty comment lines in hal/ header files. Add back a newline
if needed for spacing, while avoiding multiple blank lines.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/Hal8723BReg.h   | 17 +-------
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.h   |  2 -
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.h   |  2 -
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  2 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.h    |  6 +--
 drivers/staging/rtl8723bs/hal/odm.h           | 42 ++-----------------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  2 -
 7 files changed, 7 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index 0b327a70aa15..8142d9cf9ae5 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -19,27 +19,16 @@
 #ifndef __INC_HAL8723BREG_H
 #define __INC_HAL8723BREG_H
 
-/*  */
-/*  */
 /*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
-/*  */
-/*  */
 #define REG_C2HEVT_CMD_SEQ_88XX			0x01A1
 #define REG_C2HEVT_CMD_LEN_88XX			0x01AE
 
-/*  */
-/*  */
 /*	0x0200h ~ 0x027Fh	TXDMA Configuration */
-/*  */
-/*  */
 #define REG_DWBCN1_CTRL_8723B			0x0228
 
 /*  spec version 11 */
-/*  */
-/*  */
+
 /*	0x0400h ~ 0x047Fh	Protocol Configuration */
-/*  */
-/*  */
 #define REG_FWHW_TXQ_CTRL_8723B			0x0420
 #define REG_ARFR0_8723B				0x0444
 #define REG_ARFR1_8723B				0x044C
@@ -50,11 +39,7 @@
 #define REG_DATA_SC_8723B			0x0483
 #define REG_MAX_AGGR_NUM_8723B			0x04CA
 
-/*  */
-/*  */
 /*	0x0500h ~ 0x05FFh	EDCA Configuration */
-/*  */
-/*  */
 #define REG_PIFS_8723B				0x0512
 
 /*	0x0600h ~ 0x07FFh	WMAC Configuration */
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
index 7a12d92da0a9..b3e6c5f12e8b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
@@ -164,9 +164,7 @@ struct coex_sta_8723b_1ant {
 	bool bForceLpsOn;
 };
 
-/*  */
 /*  The following is interface which will notify coex module. */
-/*  */
 void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist);
 void EXhalbtc8723b1ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly);
 void EXhalbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist);
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
index ebc47f65e8d2..21bb90479e9c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
@@ -126,9 +126,7 @@ struct coex_sta_8723b_2ant {
 	u8 btInfoExt;
 };
 
-/*  */
 /*  The following is interface which will notify coex module. */
-/*  */
 void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist);
 void EXhalbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly);
 void EXhalbtc8723b2ant_InitCoexDm(struct btc_coexist *pBtCoexist);
diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 36b0f429dd4c..761763471a68 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -194,7 +194,7 @@ enum {
 	BTC_SET_ACT_CTRL_BT_INFO,
 	BTC_SET_ACT_CTRL_BT_COEX,
 	BTC_SET_ACT_CTRL_8723B_ANT,
-	/*  */
+
 	BTC_SET_MAX
 };
 
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
index 14b328378b8b..9795bbcf0b35 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
@@ -13,7 +13,7 @@
 #define IQK_DEFERRED_TIME_8723B		4
 #define	index_mapping_NUM_8723B		15
 #define AVG_THERMAL_NUM_8723B		4
-#define	RF_T_METER_8723B					0x42	/*  */
+#define	RF_T_METER_8723B					0x42
 
 void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *pConfig);
 
@@ -35,14 +35,10 @@ void PHY_IQCalibrate_8723B(
 
 void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath);
 
-/*  */
 /*  LC calibrate */
-/*  */
 void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm);
 
-/*  */
 /*  AP calibrate */
-/*  */
 void PHY_DigitalPredistortion_8723B(struct adapter *padapter);
 
 void _PHY_SaveADDARegisters_8723B(
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index b123df98fa22..3532f0d79363 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -197,9 +197,8 @@ struct odm_rate_adaptive {
 #define		DM_Type_ByFW			0
 #define		DM_Type_ByDriver		1
 
-/*  */
 /*  Declare for common info */
-/*  */
+
 #define MAX_PATH_NUM_8723B		1
 
 #define IQK_THRESHOLD			8
@@ -262,9 +261,7 @@ struct odm_mac_status_info {
 	u8 test;
 };
 
-/*  */
 /*  2011/10/20 MH Define Common info enum for all team. */
-/*  */
 enum odm_cmninfo_e {
 	/*  Fixed value: */
 
@@ -350,9 +347,7 @@ enum odm_cmninfo_e {
 
 /*  2011/10/20 MH Define ODM support ability.  ODM_CMNINFO_ABILITY */
 enum { /* _ODM_Support_Ability_Definition */
-	/*  */
 	/*  BB ODM section BIT 0-15 */
-	/*  */
 	ODM_BB_DIG			= BIT(0),
 	ODM_BB_RA_MASK			= BIT(1),
 	ODM_BB_DYNAMIC_TXPWR		= BIT(2),
@@ -410,9 +405,7 @@ enum { /* tag_ODM_Fab_Version_Definition */
 	ODM_UMC		=	1,
 };
 
-/*  */
 /*  For example 1T2R (A+AB = BIT0|BIT4|BIT5) */
-/*  */
 enum { /* tag_ODM_RF_Type_Definition */
 	ODM_1T1R	=	0,
 	ODM_1T2R	=	1,
@@ -424,9 +417,7 @@ enum { /* tag_ODM_RF_Type_Definition */
 	ODM_4T4R	=	7,
 };
 
-/*  */
 /*  ODM Dynamic common info value definition */
-/*  */
 
 /*  ODM_CMNINFO_WM_MODE */
 enum { /* tag_Wireless_Mode_Definition */
@@ -531,8 +522,6 @@ struct odm_rf_cal_t { /* ODM_RF_Calibration_Structure */
 	u8 DeltaSwingTableIdx_2GA_P_8188E[DELTA_SWINGIDX_SIZE];
 	u8 DeltaSwingTableIdx_2GA_N_8188E[DELTA_SWINGIDX_SIZE];
 
-	/*  */
-
 	/* for IQK */
 	u32 RegC04;
 	u32 Reg874;
@@ -567,10 +556,8 @@ struct odm_rf_cal_t { /* ODM_RF_Calibration_Structure */
 	u32 TxLOK[2];
 
 };
-/*  */
-/*  ODM Dynamic common info value definition */
-/*  */
 
+/*  ODM Dynamic common info value definition */
 struct fat_t { /* _FAST_ANTENNA_TRAINNING_ */
 	u8 Bssid[6];
 	u8 antsel_rx_keep_0;
@@ -633,9 +620,7 @@ enum phy_reg_pg_type { /* _BASEBAND_CONFIG_PHY_REG_PG_VALUE_TYPE */
 	PHY_REG_PG_EXACT_VALUE = 1
 };
 
-/*  */
 /*  Antenna detection information from single tone mechanism, added by Roger, 2012.11.27. */
-/*  */
 struct ant_detected_info {
 	bool bAntDetected;
 	u32 dBForAntA;
@@ -643,9 +628,7 @@ struct ant_detected_info {
 	u32 dBForAntO;
 };
 
-/*  */
 /*  2011/09/22 MH Copy from SD4 defined structure. We use to support PHY DM integration. */
-/*  */
 struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	struct adapter *Adapter;		/*  For CE/NIC team */
 	/*  WHen you use Adapter or priv pointer, you must make sure the pointer is ready. */
@@ -668,9 +651,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 
 /* 1  COMMON INFORMATION */
 
-	/*  */
 	/*  Init Value */
-	/*  */
 /* HOOK BEFORE REG INIT----------- */
 	/*  ODM Platform info AP/ADSL/CE/MP = 1/2/3/4 */
 	u8 SupportPlatform;
@@ -708,9 +689,8 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	u8 AntDivType;
 /* HOOK BEFORE REG INIT----------- */
 
-	/*  */
 	/*  Dynamic Value */
-	/*  */
+
 /*  POINTER REFERENCE----------- */
 
 	u8 u8_temp;
@@ -830,16 +810,13 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	u8 Adaptivity_IGI_upper;
 	u8 NHM_cnt_0;
 
-	/*  */
 	/* 2 Define STA info. */
 	/*  _ODM_STA_INFO */
 	/*  2012/01/12 MH For MP, we need to reduce one array pointer for default port.?? */
 	PSTA_INFO_T pODM_StaInfo[ODM_ASSOCIATE_ENTRY_NUM];
 
-	/*  */
 	/*  2012/02/14 MH Add to share 88E ra with other SW team. */
 	/*  We need to colelct all support abilit to a proper area. */
-	/*  */
 	bool RaSupport88E;
 
 	/*  Define ........... */
@@ -850,9 +827,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	/*  Latest packet phy info (ODM write) */
 	struct odm_mac_status_info *pMacInfo;
 
-	/*  */
 	/* ODM Structure */
-	/*  */
 	struct fat_t DM_FatTable;
 	struct dig_t DM_DigTable;
 	struct ps_t DM_PSTable;
@@ -869,9 +844,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	u32 WMMEDCA_BE;
 	struct pathdiv_t DM_PathDiv;
 	/*  Copy from SD4 structure */
-	/*  */
 	/*  ================================================== */
-	/*  */
 
 	/* common */
 
@@ -899,9 +872,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 
 	struct odm_rf_cal_t RFCalibrateInfo;
 
-	/*  */
 	/*  TX power tracking */
-	/*  */
 	u8 BbSwingIdxOfdm[MAX_RF_PATH];
 	u8 BbSwingIdxOfdmCurrent;
 	u8 BbSwingIdxOfdmBase[MAX_RF_PATH];
@@ -924,9 +895,8 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	bool Modify_TxAGC_Flag_PathA_CCK;
 
 	s8 KfreeOffset[MAX_RF_PATH];
-	/*  */
+
 	/*  ODM system resource. */
-	/*  */
 
 	/*  ODM relative time. */
 	struct timer_list PathDivSwitchTimer;
@@ -1018,16 +988,12 @@ enum { /* tag_RF_Type_Definition */
 /*  Maximal number of antenna detection mechanism needs to perform, added by Roger, 2011.12.28. */
 #define	MAX_ANTENNA_DETECTION_CNT	10
 
-/*  */
 /*  Extern Global Variables. */
-/*  */
 extern	u32 OFDMSwingTable_New[OFDM_TABLE_SIZE];
 extern	u8 CCKSwingTable_Ch1_Ch13_New[CCK_TABLE_SIZE][8];
 extern	u8 CCKSwingTable_Ch14_New[CCK_TABLE_SIZE][8];
 
-/*  */
 /*  check Sta pointer valid or not */
-/*  */
 #define IS_STA_VALID(pSta)		(pSta)
 /*  20100514 Joseph: Add definition for antenna switching test after link. */
 /*  This indicates two different the steps. */
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index 615145812ed2..ca3380328a72 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -8,9 +8,7 @@
 #ifndef __HALHWOUTSRC_H__
 #define __HALHWOUTSRC_H__
 
-/*  */
 /*  structure and define */
-/*  */
 
 struct phy_rx_agc_info_t {
 	#if (ODM_ENDIAN_TYPE == ODM_ENDIAN_LITTLE)
-- 
2.34.1

