Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0A43B47EB
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075370; cv=none; b=KUlJrkDyR7ZjyfJ8FXa/bHfgN71+37J7fIj93dSgR2K0Jn09/ZSa5HAU4g5ictmdV15fuBCV89skq0arRuKuSNPXvnxGh9HGDAMXhtJLGFmJr86wOkPQlsAmpnF5a2O1mAzhpwqLfYJesCLf0IXYzw6RiTbvg/fyK7+PutG2ufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075370; c=relaxed/simple;
	bh=gmEqV2O+Ve1xvrxNOvvQHfWLmbeVSO6T8tQyrZXKcl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcDBf7/YbxDtjJyy9SOx3FScNpFXeCgWeVGlTNvmkaJE2DQXCe0rfujWZej6dy828VX2x7l4ygxptpFCdfACbYL6jp8+r1k6RbyINkXvVEqXAqIJGKC/5pavrsyeAyeTRdf5CzOusyy1d3oLl9EmQjrLpE4nTsAC+Tx3JZe/INk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jIoLh25D; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jIoLh25D"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81+DiUFEiGggG16Ab21a06Yec7wf/M+ssHtc+8CUwkA=;
	b=jIoLh25DEI7FaSwGBjAO6PSCK0q1zj1viQ6WyDZ+mIMaIK9nEzluXwYEx337szZEVN8MrF
	8mqyg5ZyxidZ7ZvNSQ4biyaaZHNdiXuyJi7M0CFhMOYnwjOPYXt0wAl9c9fxtyXXoHpKCH
	GTLUYG4Sis4uxANAtZWWi796WoAAl9U=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 11/11] staging: rtl8723bs: hal: remove unnecessary braces
Date: Mon, 13 Apr 2026 12:14:32 +0200
Message-ID: <20260413101432.158925-12-luka.gejak@linux.dev>
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

Remove unnecessary braces around single-statement blocks in the hal
directory to adhere to the Linux kernel coding style. This resolves
unnecessary braces warnings reported by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 137 +++++++-----------
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |   6 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  24 +--
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   9 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |   6 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   6 +-
 drivers/staging/rtl8723bs/hal/odm.c           |   4 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |   6 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |   3 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  49 +++----
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  12 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   1 -
 12 files changed, 101 insertions(+), 162 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 132d91be5c82..9d0bd2bc7401 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -35,49 +35,43 @@ static u8 halbtc8723b2ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (btRssi < rssiThresh) {
+			if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preBtRssiState;
-		}
 
 		if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (btRssi < rssiThresh) {
+			else if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (btRssi < rssiThresh1) {
+			if (btRssi < rssiThresh1)
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -104,49 +98,43 @@ static u8 halbtc8723b2ant_WifiRssiState(
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (wifiRssi < rssiThresh) {
+			if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preWifiRssiState[index];
-		}
 
 		if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (wifiRssi < rssiThresh) {
+			else if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (wifiRssi < rssiThresh1) {
+			if (wifiRssi < rssiThresh1)
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -294,9 +282,8 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 
-	if (!pBtLinkInfo->bBtLinkExist) {
+	if (!pBtLinkInfo->bBtLinkExist)
 		return algorithm;
-	}
 
 	if (pBtLinkInfo->bScoExist)
 		numOfDiffProfile++;
@@ -311,58 +298,54 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 		numOfDiffProfile++;
 
 	if (numOfDiffProfile == 1) {
-		if (pBtLinkInfo->bScoExist) {
+		if (pBtLinkInfo->bScoExist)
 			algorithm = BT_8723B_2ANT_COEX_ALGO_SCO;
-		} else {
-			if (pBtLinkInfo->bHidExist) {
+		else
+			if (pBtLinkInfo->bHidExist)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_HID;
-			} else if (pBtLinkInfo->bA2dpExist) {
+			else if (pBtLinkInfo->bA2dpExist)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_A2DP;
-			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+			else if (pBtLinkInfo->bPanExist) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 2) {
 		if (pBtLinkInfo->bScoExist) {
-			if (pBtLinkInfo->bHidExist) {
+			if (pBtLinkInfo->bHidExist)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-			} else if (pBtLinkInfo->bA2dpExist) {
+			else if (pBtLinkInfo->bA2dpExist)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
 			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_SCO;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			}
 		} else {
 			if (
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bA2dpExist
-			) {
+			)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_HID_A2DP;
-			} else if (
+			else if (
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bPanExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			} else if (
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_A2DP_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_A2DP;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 3) {
@@ -370,30 +353,28 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			if (
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bA2dpExist
-			) {
+			)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-			} else if (
+			else if (
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bPanExist
-			) {
+			)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-			} else if (
+			else if (
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
-			) {
+			)
 				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-			}
 		} else {
 			if (
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID_A2DP;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID_A2DP_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile >= 3) {
@@ -480,9 +461,8 @@ static void halbtc8723b2ant_SetSwRfRxLpfCorner(
 	} else {
 		/* Resume RF Rx LPF corner */
 		/*  After initialized, we can use pCoexDm->btRf0x1eBackup */
-		if (pBtCoexist->bInitilized) {
+		if (pBtCoexist->bInitilized)
 			pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1e, 0xfffff, pCoexDm->btRf0x1eBackup);
-		}
 	}
 }
 
@@ -2201,13 +2181,11 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 {
 	u8 algorithm = 0;
 
-	if (pBtCoexist->bManualControl) {
+	if (pBtCoexist->bManualControl)
 		return;
-	}
 
-	if (pCoexSta->bUnderIps) {
+	if (pCoexSta->bUnderIps)
 		return;
-	}
 
 	algorithm = halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
 	if (pCoexSta->bC2hBtInquiryPage && (BT_8723B_2ANT_COEX_ALGO_PANHS != algorithm)) {
@@ -2225,9 +2203,8 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	if (halbtc8723b2ant_IsCommonAction(pBtCoexist)) {
 		pCoexDm->bAutoTdmaAdjust = false;
 	} else {
-		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm) {
+		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm)
 			pCoexDm->bAutoTdmaAdjust = false;
-		}
 
 
 		switch (pCoexDm->curAlgorithm) {
@@ -2405,11 +2382,10 @@ void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 
 void EXhalbtc8723b2ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (type == BTC_LPS_ENABLE) {
+	if (type == BTC_LPS_ENABLE)
 		pCoexSta->bUnderLps = true;
-	} else if (type == BTC_LPS_DISABLE) {
+	else if (type == BTC_LPS_DISABLE)
 		pCoexSta->bUnderLps = false;
-	}
 }
 
 void EXhalbtc8723b2ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -2484,9 +2460,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 			btInfo = tmpBuf[i];
 	}
 
-	if (pBtCoexist->bManualControl) {
+	if (pBtCoexist->bManualControl)
 		return;
-	}
 
 	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW != rspSource) {
 		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [3:0] */
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 4a4052ce3ee0..69e7cfe533c1 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -117,9 +117,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	}
 
 	/* Calculate Average ThermalValue after average enough times */
-	if (ThermalValue_AVG_count) {
+	if (ThermalValue_AVG_count)
 		ThermalValue = (u8)(ThermalValue_AVG / ThermalValue_AVG_count);
-	}
 
 	/* 4 5. Calculate delta, delta_LCK */
 	/* delta" here is used to determine whether thermal value changes or not. */
@@ -234,8 +233,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	}
 
 	/* Print Swing base & current */
-	for (p = RF_PATH_A; p < c.RfPathCount; p++) {
-	}
+	for (p = RF_PATH_A; p < c.RfPathCount; p++)
 
 	if (
 		(pDM_Odm->RFCalibrateInfo.PowerIndexOffset[RF_PATH_A] != 0 ||
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 56d6e3061d9b..d90c011b164b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1105,9 +1105,8 @@ static void _PHY_SaveADDARegisters8723B(
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
 
-	for (i = 0 ; i < RegisterNum ; i++) {
+	for (i = 0 ; i < RegisterNum ; i++)
 		ADDABackup[i] = PHY_QueryBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord);
-	}
 }
 
 
@@ -1119,9 +1118,8 @@ static void _PHY_SaveMACRegisters8723B(
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		MACBackup[i] = rtw_read8(pDM_Odm->Adapter, MACReg[i]);
-	}
 	MACBackup[i] = rtw_read32(pDM_Odm->Adapter, MACReg[i]);
 }
 
@@ -1137,9 +1135,8 @@ static void _PHY_ReloadADDARegisters8723B(
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	for (i = 0 ; i < RegiesterNum; i++) {
+	for (i = 0 ; i < RegiesterNum; i++)
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, ADDABackup[i]);
-	}
 }
 
 static void _PHY_ReloadMACRegisters8723B(
@@ -1148,9 +1145,8 @@ static void _PHY_ReloadMACRegisters8723B(
 {
 	u32 i;
 
-	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		rtw_write8(padapter, MACReg[i], (u8)MACBackup[i]);
-	}
 	rtw_write32(padapter, MACReg[i], MACBackup[i]);
 }
 
@@ -1170,13 +1166,11 @@ static void _PHY_PathADDAOn8723B(
 	if (!is2T) {
 		pathOn = 0x01c00014;
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[0], bMaskDWord, 0x01c00014);
-	} else {
+	} else
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[0], bMaskDWord, pathOn);
-	}
 
-	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++) {
+	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++)
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, pathOn);
-	}
 }
 
 static void _PHY_MACSettingCalibration8723B(
@@ -1189,9 +1183,8 @@ static void _PHY_MACSettingCalibration8723B(
 
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], 0x3F);
 
-	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i] & (~BIT3)));
-	}
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i] & (~BIT5)));
 }
 
@@ -1516,9 +1509,8 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFFE0); /*  LDO OFF */
 
 	/*  Channel 10 LC calibration issue for 8723bs with 26M xtal */
-	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2) {
+	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2)
 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal);
-	}
 
 	/* Restore original situation */
 	if ((tmpReg & 0x70) != 0) { /* Deal with contisuous TX case */
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 2a2dd60be8bb..062156bdc2ba 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1027,15 +1027,14 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (pktType == PACKET_DHCP) {
+	if (pktType == PACKET_DHCP)
 		packetType = BTC_PACKET_DHCP;
-	} else if (pktType == PACKET_EAPOL) {
+	else if (pktType == PACKET_EAPOL)
 		packetType = BTC_PACKET_EAPOL;
-	} else if (pktType == PACKET_ARP) {
+	else if (pktType == PACKET_ARP)
 		packetType = BTC_PACKET_ARP;
-	} else {
+	else
 		return;
-	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
 /* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 0d94760a011a..7487bf75ebda 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -324,9 +324,8 @@ static void PHY_StoreTxPowerByRateNew(struct adapter *padapter,	u32 RfPath,
 	if (RfPath >= RF_PATH_MAX)
 		return;
 
-	for (i = 0; i < rateNum; ++i) {
+	for (i = 0; i < rateNum; ++i)
 		pHalData->TxPwrByRateOffset[RfPath][rateIndex[i]] = PwrByRateVal[i];
-	}
 }
 
 static void PHY_StoreTxPowerByRateOld(
@@ -362,9 +361,8 @@ void PHY_StoreTxPowerByRate(
 
 	if (pDM_Odm->PhyRegPgVersion > 0)
 		PHY_StoreTxPowerByRateNew(padapter, RfPath, RegAddr, BitMask, Data);
-	else if (pDM_Odm->PhyRegPgVersion == 0) {
+	else if (pDM_Odm->PhyRegPgVersion == 0)
 		PHY_StoreTxPowerByRateOld(padapter, RegAddr, BitMask, Data);
-	}
 }
 
 static void
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..45634b5e5082 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -208,9 +208,8 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 		add_ratid(padapter, psta, rssi_level);
-	else {
+	else
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
-	}
 }
 
 void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
@@ -254,9 +253,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
-	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
+	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
 		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
-	}
 }
 
 void beacon_timing_control(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index c594ca250113..9a6f8c2cfa29 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -269,9 +269,8 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
 				continue;
 
-			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
+			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level))
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
-			}
 		}
 	}
 }
@@ -975,7 +974,6 @@ void ODM_CmnInfoUpdate(struct dm_odm_t *pDM_Odm, u32 CmnInfo, u64 Value)
 		/* do nothing */
 		break;
 	}
-
 }
 
 /* 3 ============================================================ */
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index c575c42d1757..71e177f533ce 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -238,9 +238,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	if (is_cck_rate) {
 		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
 	} else {
-		if (rf_rx_num != 0) {
+		if (rf_rx_num != 0)
 			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
-		}
 	}
 }
 
@@ -274,8 +273,7 @@ static void odm_Process_RSSIForDM(
 	pDM_Odm->RxRate = pPktinfo->data_rate;
 
 	/* Statistic for antenna/path diversity------------------ */
-	if (pDM_Odm->SupportAbility & ODM_BB_ANT_DIV) {
-	}
+	if (pDM_Odm->SupportAbility & ODM_BB_ANT_DIV)
 
 	/* Smart Antenna Debug Message------------------ */
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 1b576bcd0c5f..d25ebab4571d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -25,9 +25,8 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 	do {
 		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
+		if (0 == valid)
 			read_down = true;
-		}
 	} while ((!read_down) && (retry_cnts--));
 
 	return read_down;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 2be52a2d22b3..4dba941ebe3c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -197,9 +197,8 @@ static s32 polling_fwdl_chksum(
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & FWDL_ChkSum_rpt)) {
+	if (!(value32 & FWDL_ChkSum_rpt))
 		goto exit;
-	}
 
 	if (g_fwdl_chksum_fail) {
 		g_fwdl_chksum_fail--;
@@ -238,9 +237,8 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & WINTINI_RDY)) {
+	if (!(value32 & WINTINI_RDY))
 		goto exit;
-	}
 
 	if (g_fwdl_wintint_rdy_fail) {
 		g_fwdl_wintint_rdy_fail--;
@@ -1047,9 +1045,8 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	rate_bitmap = hal_btcoex_GetRaMask(padapter);
 	mask &= ~rate_bitmap;
 
-	if (pHalData->fw_ractrl) {
+	if (pHalData->fw_ractrl)
 		rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, psta->raid, psta->bw_mode, short_gi_rate, mask);
-	}
 
 	/* set correct initial date rate for each mac_id */
 	pdmpriv->INIDATA_RATE[mac_id] = psta->init_rate;
@@ -1202,9 +1199,9 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 
 	/*  Check 0x8129 again for making sure autoload status!! */
 	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
-	if (EEPROMId != RTL_EEPROM_ID) {
+	if (EEPROMId != RTL_EEPROM_ID)
 		pEEPROM->bautoload_fail_flag = true;
-	} else
+	else
 		pEEPROM->bautoload_fail_flag = false;
 }
 
@@ -1586,20 +1583,18 @@ u8 SCMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_40) {
-		if (pattrib->bwmode == CHANNEL_WIDTH_40) {
+		if (pattrib->bwmode == CHANNEL_WIDTH_40)
 			SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
-		} else if (pattrib->bwmode == CHANNEL_WIDTH_20) {
-			if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER) {
+		else if (pattrib->bwmode == CHANNEL_WIDTH_20) {
+			if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 				SCSettingOfDesc = HT_DATA_SC_20_UPPER_OF_40MHZ;
-			} else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) {
+			else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
 				SCSettingOfDesc = HT_DATA_SC_20_LOWER_OF_40MHZ;
-			} else {
+			else
 				SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
-			}
 		}
-	} else {
+	} else
 		SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
-	}
 
 	return SCSettingOfDesc;
 }
@@ -1620,9 +1615,8 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 	/*  Thomas, Lucas@SD4, 20130515 */
 	count = 16;
 
-	for (index = 0; index < count; index++) {
+	for (index = 0; index < count; index++)
 		checksum |= le16_to_cpu(*(__le16 *)(usPtr + index));
-	}
 
 	ptxdesc->txdw7 |= cpu_to_le32(checksum & 0x0000ffff);
 }
@@ -1796,11 +1790,10 @@ static void rtl8723b_fill_default_txdesc(
 		ptxdesc->mbssid = pattrib->mbssid & 0xF;
 
 		ptxdesc->rty_lmt_en = 1; /*  retry limit enable */
-		if (pattrib->retry_ctrl) {
+		if (pattrib->retry_ctrl)
 			ptxdesc->data_rt_lmt = 6;
-		} else {
+		else
 			ptxdesc->data_rt_lmt = 12;
-		}
 
 		ptxdesc->datarate = MRateToHwRate(pmlmeext->tx_rate);
 
@@ -1891,9 +1884,8 @@ void rtl8723b_fill_fake_txdesc(
 		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
 	}
 
-	if (IsBTQosNull) {
+	if (IsBTQosNull)
 		SET_TX_DESC_BT_INT_8723B(pDesc, 1);
-	}
 
 	SET_TX_DESC_USE_RATE_8723B(pDesc, 1); /*  use data rate which is set by Sw */
 	SET_TX_DESC_OWN_8723B((u8 *)pDesc, 1);
@@ -2208,9 +2200,8 @@ void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len)
 #define	GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 6, 1)
 #define	GET_8723B_C2H_TX_RPT_RETRY_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 7, 1)
 
-	if (GET_8723B_C2H_TX_RPT_RETRY_OVER(pdata) | GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(pdata)) {
+	if (GET_8723B_C2H_TX_RPT_RETRY_OVER(pdata) | GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(pdata))
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
-	}
 /*
 	else if (seq_no != padapter->xmitpriv.seq_no) {
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
@@ -2580,9 +2571,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 			/*  Forece leave RF low power mode for 1T1R to prevent conficting setting in Fw power */
 			/*  saving sequence. 2010.06.07. Added by tynli. Suggested by SD3 yschang. */
-			if (psmode != PS_MODE_ACTIVE) {
+			if (psmode != PS_MODE_ACTIVE)
 				ODM_RF_Saving(&pHalData->odmpriv, true);
-			}
 
 			/* if (psmode != PS_MODE_ACTIVE)	{ */
 			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
@@ -2896,11 +2886,10 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 		break;
 
 	case HAL_DEF_TX_PAGE_BOUNDARY:
-		if (!padapter->registrypriv.wifi_spec) {
+		if (!padapter->registrypriv.wifi_spec)
 			*(u8 *)pval = TX_PAGE_BOUNDARY_8723B;
-		} else {
+		else
 			*(u8 *)pval = WMM_NORMAL_TX_PAGE_BOUNDARY_8723B;
-		}
 		break;
 
 	case HAL_DEF_MACID_SLEEP:
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a3012679a3b5..58d5ffabda01 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -140,9 +140,8 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (ret != _SUCCESS)
 		return _SUCCESS;
-	}
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
@@ -375,9 +374,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 0) {
+	if (ret == 0)
 		return _SUCCESS;
-	}
 
 	/*  dequeue frame and write to hardware */
 
@@ -395,9 +393,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 1) {
+	if (ret == 1)
 		goto next;
-	}
 
 	return _SUCCESS;
 }
@@ -412,9 +409,8 @@ int rtl8723bs_xmit_thread(void *context)
 
 	do {
 		ret = rtl8723bs_xmit_handler(padapter);
-		if (signal_pending(current)) {
+		if (signal_pending(current))
 			flush_signals(current);
-		}
 	} while (_SUCCESS == ret);
 
 	complete(&pxmitpriv->SdioXmitTerminate);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index c476ebd0e600..ee6dba5a8bcd 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -323,7 +323,6 @@ static void _InitQueuePriority(struct adapter *Adapter)
 	default:
 		break;
 	}
-
 }
 
 static void _InitPageBoundary(struct adapter *padapter)
-- 
2.53.0

