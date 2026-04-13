Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625DC3B52EB
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075356; cv=none; b=hFMfoYI4T/wO4ZYgOxm2Q2/q9A/BAYIWaxjcuq/L0jAP8XKDZEnGKIYkU3aS79WVRTbYLH8Jf9TTP+XqeBfSZvWVL2kB5WhpScmvVYYHwaqxe6UdUmsB2NLiM9hhph9G/3ELQWGftt0XDdjfPaq/owWb850shwdaPNtzUdWZNKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075356; c=relaxed/simple;
	bh=65NOn+3vNlKLCSyIQSUoNOvGWMQmzKIL8F1Yk4lx8nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByWr73R0LYZ2jMPaXaGepGMNuEs6qixObR+d7XIMtusOVh7NEzEAYc+cCXb4oNPCFOqN+RKoqB01+0O05ejFkJsMF1ywdd+vJxDmem8rU9kMKLkOzZEA/wV3JW/bV5ZNMnIjFf6zgGyPKk5xWOMNnco2djGo/0Hwvbo8Wy5YCKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XWVXQs/N; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XWVXQs/N"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sN7i0E//4kLCw75+iZDCkT4FpOU5bSfmTRKqMkIa+A=;
	b=XWVXQs/N47Hd+lbvVqOAcA1czyRHQjxFIEn3BKKRKtB068WMVw2zbBe9T01uDRnznRERnF
	27LhUZS9p0bgF7RWYdwzE1WIEk0g1g3OMR/76X+nxurmdCTh8KXGVd1OVXBZMh31bJOVJO
	t30rhDYvdB5WUNOUbAwSl/oTqP3twOo=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 08/11] staging: rtl8723bs: hal: remove blank lines before closing brace
Date: Mon, 13 Apr 2026 12:14:29 +0200
Message-ID: <20260413101432.158925-9-luka.gejak@linux.dev>
In-Reply-To: <20260413101432.158925-1-luka.gejak@linux.dev>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Remove empty lines immediately preceding a closing brace in the hal
directory to adhere to the Linux kernel coding style. This resolves
"Blank lines aren't necessary before a close brace" warnings reported
by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c      |  8 --------
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c      |  2 --
 drivers/staging/rtl8723bs/hal/HalPhyRf.c             |  1 -
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c       | 12 ------------
 drivers/staging/rtl8723bs/hal/hal_com.c              |  5 -----
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c       |  2 --
 drivers/staging/rtl8723bs/hal/odm.c                  | 10 ----------
 drivers/staging/rtl8723bs/hal/odm_DIG.c              |  5 -----
 .../staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c |  1 -
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c         |  7 -------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c         |  6 ------
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c          |  3 ---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c    |  3 ---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c      |  4 ----
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c      |  3 ---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c       |  1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c         |  5 -----
 drivers/staging/rtl8723bs/hal/sdio_ops.c             |  1 -
 18 files changed, 79 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 87b07187efaf..0024c6cbe515 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -236,7 +236,6 @@ static void halbtc8723b1ant_LimitedRx(
 	/*  real update aggregation setting */
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_AGGREGATE_CTRL, NULL);
 
-
 }
 
 static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
@@ -368,7 +367,6 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 	}
 
 	if (!pCoexSta->bPreCCKLock) {
-
 		if (nCCKLockCounter >= 5)
 			pCoexSta->bCCKLock = true;
 		else
@@ -382,7 +380,6 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 
 	pCoexSta->bPreCCKLock =  pCoexSta->bCCKLock;
 
-
 }
 
 static bool halbtc8723b1ant_IsWifiStatusChanged(struct btc_coexist *pBtCoexist)
@@ -585,7 +582,6 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			) {
 				if (!bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
-
 			}
 		}
 	}
@@ -914,13 +910,11 @@ static void halbtc8723b1ant_SetAntPath(
 			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0);
 
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT) {
-
 				/* tell firmware "no antenna inverse" */
 				H2C_Parameter[0] = 0;
 				H2C_Parameter[1] = 0;  /* internal switch type */
 				pBtCoexist->fBtcFillH2c(pBtCoexist, 0x65, 2, H2C_Parameter);
 			} else {
-
 				/* tell firmware "antenna inverse" */
 				H2C_Parameter[0] = 1;
 				H2C_Parameter[1] = 0;  /* internal switch type */
@@ -1234,7 +1228,6 @@ static void halbtc8723b1ant_PsTdma(
 			break;
 		}
 	} else {
-
 		/*  disable PS tdma */
 		switch (type) {
 		case 8: /* PTA Control */
@@ -1912,7 +1905,6 @@ static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *pBtCoexist
 	pCoexDm->curAlgorithm = algorithm;
 
 	if (halbtc8723b1ant_IsCommonAction(pBtCoexist)) {
-
 	} else {
 		switch (pCoexDm->curAlgorithm) {
 		case BT_8723B_1ANT_COEX_ALGO_SCO:
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 9d82ccf6e138..132d91be5c82 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -1579,7 +1579,6 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 
 		if (!bScan && !bLink && !bRoam)
 			halbtc8723b2ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType);
-
 	}
 }
 
@@ -2483,7 +2482,6 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		pCoexSta->btInfoC2h[rspSource][i] = tmpBuf[i];
 		if (i == 1)
 			btInfo = tmpBuf[i];
-
 	}
 
 	if (pBtCoexist->bManualControl) {
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 254bfef543b1..4a4052ce3ee0 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -57,7 +57,6 @@ void ODM_ClearTxPowerTrackingState(struct dm_odm_t *pDM_Odm)
 
 void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 {
-
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 16006c74a4c3..56d6e3061d9b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -172,7 +172,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
 				TxRate = HwRateToMRate(pDM_Odm->TxRate);
 		} else /* force rate */
 			TxRate = (u8)rate;
-
 	}
 
 	if (TxRate != 0xFF) {
@@ -978,7 +977,6 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, 0xF0000000, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
-
 	}
 }
 
@@ -1064,7 +1062,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 {
-
 	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
 	u8 path;
 
@@ -1126,7 +1123,6 @@ static void _PHY_SaveMACRegisters8723B(
 		MACBackup[i] = rtw_read8(pDM_Odm->Adapter, MACReg[i]);
 	}
 	MACBackup[i] = rtw_read32(pDM_Odm->Adapter, MACReg[i]);
-
 }
 
 
@@ -1181,7 +1177,6 @@ static void _PHY_PathADDAOn8723B(
 	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++) {
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, pathOn);
 	}
-
 }
 
 static void _PHY_MACSettingCalibration8723B(
@@ -1198,7 +1193,6 @@ static void _PHY_MACSettingCalibration8723B(
 		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i] & (~BIT3)));
 	}
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i] & (~BIT5)));
-
 }
 
 static bool phy_SimularityCompare_8723B(
@@ -1217,7 +1211,6 @@ static bool phy_SimularityCompare_8723B(
 	SimularityBitMap = 0;
 
 	for (i = 0; i < bound; i++) {
-
 		if ((i == 1) || (i == 3) || (i == 5) || (i == 7)) {
 			if ((result[c1][i] & 0x00000200) != 0)
 				tmp1 = result[c1][i] | 0xFFFFFC00;
@@ -1258,7 +1251,6 @@ static bool phy_SimularityCompare_8723B(
 		}
 		return bResult;
 	} else {
-
 		if (!(SimularityBitMap & 0x03)) { /* path A TX OK */
 			for (i = 0; i < 2; i++)
 				result[3][i] = result[c1][i];
@@ -1344,7 +1336,6 @@ static void phy_IQCalibrate_8723B(
 	/* u32 bbvalue; */
 
 	if (t == 0) {
-
 		/*  Save ADDA parameters, turn Path A ADDA on */
 		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
 		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
@@ -1420,7 +1411,6 @@ static void phy_IQCalibrate_8723B(
 
 /* path B IQK */
 	if (is2T) {
-
 		/* path B TX IQK */
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_IQK_8723B(padapter);
@@ -1478,9 +1468,7 @@ static void phy_IQCalibrate_8723B(
 		/* load 0xe30 IQC default value */
 		PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x01008c00);
 		PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x01008c00);
-
 	}
-
 }
 
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 0444650798f2..33b3a1b942c1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -294,7 +294,6 @@ void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
 	u8 i, is_brate, brate;
 
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-
 		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;
 		brate = mBratesOS[i] & 0x7f;
 
@@ -392,9 +391,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0];/* MGT */
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
-
 	}
-
 }
 
 static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
@@ -434,7 +431,6 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 	}
-
 }
 
 bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
@@ -462,7 +458,6 @@ bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
 	}
 
 	return result;
-
 }
 
 void hal_init_macaddr(struct adapter *adapter)
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index dd91ce3a8e37..0d94760a011a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -445,7 +445,6 @@ void PHY_SetTxPowerIndexByRateSection(
 					       pHalData->CurrentChannelBW,
 					       Channel, htRates1T,
 					       ARRAY_SIZE(htRates1T));
-
 	}
 }
 
@@ -590,7 +589,6 @@ s8 PHY_GetTxPowerByRate(struct adapter *padapter, u8 RFPath, u8 Rate)
 		return value;
 
 	return pHalData->TxPwrByRateOffset[RFPath][rateIndex];
-
 }
 
 void PHY_SetTxPowerByRate(
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index f33cc282f3b2..c594ca250113 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -249,7 +249,6 @@ u32 ODM_Get_Rate_Bitmap(
 	}
 
 	return ra_mask & rate_bitmap;
-
 }
 
 static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
@@ -273,7 +272,6 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
 			}
-
 		}
 	}
 }
@@ -297,7 +295,6 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 */
 static void odm_RefreshRateAdaptiveMask(struct dm_odm_t *pDM_Odm)
 {
-
 	if (!(pDM_Odm->SupportAbility & ODM_BB_RA_MASK))
 		return;
 
@@ -369,7 +366,6 @@ static void odm_RSSIMonitorInit(struct dm_odm_t *pDM_Odm)
 	struct ra_t *pRA_Table = &pDM_Odm->DM_RA_Table;
 
 	pRA_Table->firstconnect = false;
-
 }
 
 static void FindMinimumRSSI(struct adapter *padapter)
@@ -543,7 +539,6 @@ void odm_TXPowerTrackingInit(struct dm_odm_t *pDM_Odm)
 		pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p] = 0;
 		pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
 	}
-
 }
 
 void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
@@ -573,7 +568,6 @@ void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
 /*  */
 void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 {
-
 	odm_CommonInfoSelfInit(pDM_Odm);
 	odm_DIGInit(pDM_Odm);
 	odm_NHMCounterStatisticsInit(pDM_Odm);
@@ -732,7 +726,6 @@ void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 V
 		/* do nothing */
 		break;
 	}
-
 }
 
 
@@ -856,7 +849,6 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 		/* do nothing */
 		break;
 	}
-
 }
 
 
@@ -882,7 +874,6 @@ void ODM_CmnInfoPtrArrayHook(
 		/* do nothing */
 		break;
 	}
-
 }
 
 
@@ -985,7 +976,6 @@ void ODM_CmnInfoUpdate(struct dm_odm_t *pDM_Odm, u32 CmnInfo, u64 Value)
 		break;
 	}
 
-
 }
 
 /* 3 ============================================================ */
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 8b754923b7d4..7e8a47606835 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -293,7 +293,6 @@ void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI)
 		if (!pDM_DigTable->bPSDInProgress) {
 			if (CurrentIGI > pDM_DigTable->rx_gain_range_max)
 				CurrentIGI = pDM_DigTable->rx_gain_range_max;
-
 		}
 
 		/* 1 Set IGI value */
@@ -303,7 +302,6 @@ void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI)
 
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
-
 }
 
 bool odm_DigAbort(void *pDM_VOID)
@@ -477,7 +475,6 @@ void odm_DIG(void *pDM_VOID)
 
 	/* 1 Adjust initial gain by false alarm */
 	if (pDM_Odm->bLinked && bPerformance) {
-
 		if (bFirstTpTarget || FirstConnect) {
 			pDM_DigTable->LargeFAHit = 0;
 
@@ -506,7 +503,6 @@ void odm_DIG(void *pDM_VOID)
 			}
 		}
 	} else {
-
 		if (FirstDisConnect || bFirstCoverage) {
 			CurrentIGI = dm_dig_min;
 		} else {
@@ -754,7 +750,6 @@ u8 odm_ForbiddenIGICheck(void *pDM_VOID, u8 DIG_Dynamic_MIN, u8 CurrentIGI)
 	}
 
 	return rx_gain_range_min;
-
 }
 
 /* 3 ============================================================ */
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index bb342d7004fd..9a1076dc0009 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -33,7 +33,6 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 	}
 
 	if (pDM_PSTable->initialize == 0) {
-
 		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
 		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT3) >> 3;
 		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index a0c163979916..c575c42d1757 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -18,7 +18,6 @@ static u8 odm_query_rx_pwr_percentage(s8 ant_power)
 		return	100;
 	else
 		return 100 + ant_power;
-
 }
 
 s32 odm_signal_scale_mapping(struct dm_odm_t *dm_odm, s32 curr_sig)
@@ -162,7 +161,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 					sq = 100;
 				else
 					sq = ((64 - sq_rpt) * 100) / 44;
-
 			}
 
 			phy_info->signal_quality = sq;
@@ -250,7 +248,6 @@ static void odm_Process_RSSIForDM(
 	struct dm_odm_t *pDM_Odm, struct odm_phy_info *pPhyInfo, struct odm_packet_info *pPktinfo
 )
 {
-
 	s32 UndecoratedSmoothedPWDB, UndecoratedSmoothedCCK, UndecoratedSmoothedOFDM, RSSI_Ave;
 	u8 isCCKrate = 0;
 	u8 RSSI_max, RSSI_min, i;
@@ -278,7 +275,6 @@ static void odm_Process_RSSIForDM(
 
 	/* Statistic for antenna/path diversity------------------ */
 	if (pDM_Odm->SupportAbility & ODM_BB_ANT_DIV) {
-
 	}
 
 	/* Smart Antenna Debug Message------------------ */
@@ -288,7 +284,6 @@ static void odm_Process_RSSIForDM(
 	UndecoratedSmoothedPWDB = pEntry->rssi_stat.UndecoratedSmoothedPWDB;
 
 	if (pPktinfo->to_self || pPktinfo->is_beacon) {
-
 		if (!isCCKrate) { /* ofdm rate */
 			if (pPhyInfo->rx_mimo_signal_strength[RF_PATH_B] == 0) {
 				RSSI_Ave = pPhyInfo->rx_mimo_signal_strength[RF_PATH_A];
@@ -385,7 +380,6 @@ static void odm_Process_RSSIForDM(
 			pEntry->rssi_stat.UndecoratedSmoothedOFDM = UndecoratedSmoothedOFDM;
 			pEntry->rssi_stat.UndecoratedSmoothedPWDB = UndecoratedSmoothedPWDB;
 		}
-
 	}
 }
 
@@ -396,7 +390,6 @@ static void odm_Process_RSSIForDM(
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
 			  u8 *phy_status, struct odm_packet_info *pkt_info)
 {
-
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
 
 	if (!dm_odm->RSSI_test)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 79f3f723fd5b..1b576bcd0c5f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -31,7 +31,6 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 	} while ((!read_down) && (retry_cnts--));
 
 	return read_down;
-
 }
 
 
@@ -188,7 +187,6 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 		return;
 
 	*pLength = pktlen;
-
 }
 
 static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
@@ -416,12 +414,10 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 				/* reset adaptive_early_32k cnt */
 				pmlmeext->bcn_delay_cnt[i] = 0;
 				pmlmeext->bcn_delay_ratio[i] = 0;
-
 			}
 
 			pmlmeext->bcn_cnt = 0;
 			pmlmeext->adaptive_tsf_done = true;
-
 		}
 
 /* offload to FW if fw version > v15.10
@@ -431,7 +427,6 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
 			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
 */
-
 	}
 
 	hal_btcoex_RecordPwrMode(padapter, u1H2CPwrModeParm, H2C_PWRMODE_LEN);
@@ -458,7 +453,6 @@ void rtl8723b_set_FwPsTuneParam_cmd(struct adapter *padapter)
 
 void rtl8723b_set_FwPwrModeInIPS_cmd(struct adapter *padapter, u8 cmd_param)
 {
-
 	FillH2CCmd8723B(padapter, H2C_8723B_FWLPS_IN_IPS_, 1, &cmd_param);
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index eaa4306716ff..423be22073d2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -17,7 +17,6 @@
 /*  */
 static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 {
-
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 	struct dm_priv *pdmpriv = &pHalData->dmpriv;
@@ -193,7 +192,6 @@ void rtl8723b_hal_dm_in_lps(struct adapter *padapter)
 
 		rtl8723b_set_rssi_cmd(padapter, (u8 *)&PWDB_rssi);
 	}
-
 }
 
 void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
@@ -251,7 +249,6 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 skip_lps_dm:
 
 	return;
-
 }
 
 void rtl8723b_init_dm_priv(struct adapter *Adapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 07e212552e52..2be52a2d22b3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -785,7 +785,6 @@ static void hal_ReadEFuse_BT(
 
 		if ((eFuse_Addr - 1) < total)
 			break;
-
 	}
 
 	/*  switch bank back to bank 0 for later BT and wifi use. */
@@ -1959,7 +1958,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			ResumeTxBeacon(padapter);
 			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT | EN_BCN_FUNCTION | DIS_BCNQ_SUB);
 		} else if (mode == _HW_STATE_AP_) {
-
 			ResumeTxBeacon(padapter);
 
 			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT | DIS_BCNQ_SUB);
@@ -2207,7 +2205,6 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 
 void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len)
 {
-
 #define	GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 6, 1)
 #define	GET_8723B_C2H_TX_RPT_RETRY_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 7, 1)
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 51e9f06b2c63..4ffd849ca941 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -46,7 +46,6 @@ u32 PHY_QueryBBReg_8723B(struct adapter *Adapter, u32 RegAddr, u32 BitMask)
 	BitShift = phy_CalculateBitShift(BitMask);
 
 	return (OriginalValue & BitMask) >> BitShift;
-
 }
 
 
@@ -80,7 +79,6 @@ void PHY_SetBBReg_8723B(
 	}
 
 	rtw_write32(Adapter, RegAddr, Data);
-
 }
 
 
@@ -141,7 +139,6 @@ static u32 phy_RFSerialRead_8723B(
 		retValue = PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack | MaskforPhySet, bLSSIReadBackData);
 	}
 	return retValue;
-
 }
 
 /**
@@ -329,7 +326,6 @@ static void phy_InitBBRFRegisterDefinition(struct adapter *Adapter)
 	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBack = rFPGA0_XB_LSSIReadBack;
 	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBackPi = TransceiverA_HSPI_Readback;
 	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBackPi = TransceiverB_HSPI_Readback;
-
 }
 
 static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index ffb35e1ace62..2d76ab34bb3e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -76,7 +76,6 @@ void PHY_RF6052SetBandwidth8723B(
 	default:
 		break;
 	}
-
 }
 
 static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
@@ -91,7 +90,6 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	/* 3----------------------------------------------------------------- */
 	/* for (eRFPath = RF_PATH_A; eRFPath <pHalData->NumTotalRFPath; eRFPath++) */
 	for (eRFPath = 0; eRFPath < pHalData->NumTotalRFPath; eRFPath++) {
-
 		pPhyReg = &pHalData->PHYRegDef[eRFPath];
 
 		/*----Store original RFENV control type----*/
@@ -162,7 +160,6 @@ int PHY_RF6052_Config8723B(struct adapter *Adapter)
 	/*  Config BB and RF */
 	/*  */
 	return phy_RF6052_Config_ParaFile(Adapter);
-
 }
 
 /* End of HalRf6052.c */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index fc075a4e146f..a3012679a3b5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -520,7 +520,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 	}
 
 	return err;
-
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 3b4d036d2caa..c476ebd0e600 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -232,7 +232,6 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 	_InitNormalChipRegPriority(
 		Adapter, value, value, value, value, value, value
 	);
-
 }
 
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
@@ -280,7 +279,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 	}
 
 	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
-
 }
 
 static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
@@ -326,7 +324,6 @@ static void _InitQueuePriority(struct adapter *Adapter)
 		break;
 	}
 
-
 }
 
 static void _InitPageBoundary(struct adapter *padapter)
@@ -530,7 +527,6 @@ static void _InitOperationMode(struct adapter *padapter)
 	}
 
 	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
-
 }
 
 static void _InitInterrupt(struct adapter *padapter)
@@ -619,7 +615,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		/* do polling cpwm */
 		start_time = jiffies;
 		do {
-
 			mdelay(1);
 
 			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 8cece69dbf79..6929a18202af 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -614,7 +614,6 @@ static u16 sdio_local_cmd52_read2byte(struct adapter *adapter, u32 addr)
 
 static u32 sdio_local_cmd53_read4byte(struct adapter *adapter, u32 addr)
 {
-
 	u8 mac_pwr_ctrl_on;
 	u32 val = 0;
 	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
-- 
2.53.0

