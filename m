Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EC3B8921
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707680; cv=none; b=oQh/pAqC9FEOAyKftmYSv8fYcAWq5EJ6BYa+blpyLo6YRXi9X/tG/1MLkFplYebsPZBHSTCBtmHc3eD8smYzsVd/Pr5WYKl0D2dWvAgs+DhWIBNh8b0xF78Lt1rasfraNtbuSxubs9o61ZtqOhIN2An4omrwuP3e52Yme5F8DI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707680; c=relaxed/simple;
	bh=1PQ6fXYPn41Xf+hE3HENLYBbL+Nsq6K/HqITRe2F0kE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rx61NIwlRfxvnTAJ4yODBumipk4BMEnjs1Eyqh+oE651Lk72AnA/Cc0PRV3wiSWzLduybYEOEjAHr/fEa7/TO1WGZw5y8un/QupDFCHCpePKqFEOalfiHMr9YQSouc493cqVAKswkDWoMMvFcZpHhXMpbqiyFiysdJOKvpU935E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZGY6/DU; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZGY6/DU"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so17362674eec.0
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 14:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707677; x=1779312477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWhJD5dTA/IXqE84N/TprX0BAG46of9eN3Z+EQATq2c=;
        b=GZGY6/DUxkOXS9Fw8H5YnAmd3PcprJBetMsHgDnCfYlYRZBDmxGJ/N+L6CMp4+QD7t
         AHk7rY8/zAZPbd5zFTe9oymgHmw+K1GU8FiCiiPbt8Py0wfwnMhCpKA/ECIvUuRqVxIR
         SCDveytAyuWG0OHji9Z+7qvSzRTDDM76Gm29rv0X5jo1MyQtuNLKCOy65L/NRboiOplY
         N0rBhucQDhc9q72PBtq6nxWzejQ225SmVs7+Gk+7EQc1Z2G+oTsJIKL8iOFQR5aNuBXB
         0sXA6nlz9z2Zq5Wx/dd1Y9IT+ZIT4j0q70KLZ9P+U5G5VLbemPU4zTLqBBtvHQzGeuWi
         zSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707677; x=1779312477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWhJD5dTA/IXqE84N/TprX0BAG46of9eN3Z+EQATq2c=;
        b=ZIJYCa2+/c2fjYwK3FB8sZBmervOKWCQz5k9/3vluk5sdPBYpmy4LQDRVJxFHsR5nj
         Au2rU8UunO2bavMCiRH8Duia3SvytBvIOMFmuVd3bU9+W8rfVDSYmLqvYJROeAxaceiX
         YwmevGf6R/bqmv2xlpCXWZ/sAUn+VZCNzPNUePNPf8GlP2zAAbxHD99A+DCX4k6IjeNw
         Hef+HNFUcc4npZWQrhZ8U8yNWfgPCdHtZApbrPO35P2PZFeeMRvtAGrD07mrsKMNe9eS
         5qBtdAFTVv1hwzhVdk+bRMP7YNgFrOVMtnqGzxRCHtyMHxmfIPd9BkWOPcSLeGKVvxy7
         aqAQ==
X-Gm-Message-State: AOJu0YyahiM3z44PchTTjBG4U3AuEuFw1YMYnfxdVPF5OhtF3RfeMDMA
	EIEgEVl4j51SluwWK2U/erH3QwQlUJvmLjyzjLpGsYJlD1l3zolLala1qPY8pw==
X-Gm-Gg: Acq92OHHR3yp7b5YSpXtvInTsyRp9dhelBx62jIXg+WYjrJm0/CoPVVzO3h4WWvSw0R
	CIoha++AhcXzBc6AXUFvMzmQuXUtXpV0HTukVK7BWwlUEC1C2WgeZIev9LrA2lZ6zxI9sb7LcOI
	3JWJvdDPFrnVriwMEgvho0XjUu2wqdQEGOQh/zqH6SaX5CUL27KkHDDuuQtH5t1pYgLyw/k4Kem
	4/ikfmXnqnt8aCCibyF6Mdx7kFpRpqj6OIzdhU2dv0mDDprZ8D+IuBV4+d+VTDxunyJ59HP3kPE
	6dk+QqFU/9+15LJi8acBpHsgKO8pA0ui5oBFQXB2QGUHKL8L1VJ8bNUYHifanFI8wunuphyWk92
	hcw29wgPLfm5RIcoO8n72Mzmw+erg7efBVmJCF7Vm4nom3JLYGD7/qw0Cdjel+wO8xAXx7e0h7l
	NdYSOOHfSK3NH6hyg7ao1UU59IJK3AMQWK
X-Received: by 2002:a05:7300:5415:b0:2f9:5c29:ffb6 with SMTP id 5a478bee46e88-3011798069dmr3154703eec.13.1778707677229;
        Wed, 13 May 2026 14:27:57 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-302978b1a79sm507933eec.28.2026.05.13.14.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:27:56 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix multiple blank lines in hal/ files
Date: Wed, 13 May 2026 14:27:47 -0700
Message-Id: <20260513212747.50900-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines in hal/hal_* and hal/sdio_*
files.

This fixes the following checkpatch.pl check:
CHECK: Please don't use multiple blank lines

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 27 -------------------
 drivers/staging/rtl8723bs/hal/hal_com.c       |  3 ---
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  1 -
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  1 -
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |  1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 12 ---------
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 --
 7 files changed, 47 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index e508bf8dd7ff..195ccc4b710f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -30,7 +30,6 @@ static void halbtcoutsrc_LeaveLps(struct btc_coexist *pBtCoexist)
 {
 	struct adapter *padapter;
 
-
 	padapter = pBtCoexist->Adapter;
 
 	pBtCoexist->btInfo.bBtCtrlLps = true;
@@ -43,7 +42,6 @@ static void halbtcoutsrc_EnterLps(struct btc_coexist *pBtCoexist)
 {
 	struct adapter *padapter;
 
-
 	padapter = pBtCoexist->Adapter;
 
 	pBtCoexist->btInfo.bBtCtrlLps = true;
@@ -79,7 +77,6 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
 	unsigned long utime;
 	u32 timeout; /*  unit: ms */
 
-
 	padapter = pBtCoexist->Adapter;
 	ready = _FAIL;
 #ifdef LPS_RPWM_WAIT_MS
@@ -110,7 +107,6 @@ static void halbtcoutsrc_NormalLowPower(struct btc_coexist *pBtCoexist)
 {
 	struct adapter *padapter;
 
-
 	padapter = pBtCoexist->Adapter;
 	rtw_unregister_task_alive(padapter, BTCOEX_ALIVE);
 }
@@ -129,7 +125,6 @@ static void halbtcoutsrc_AggregationCheck(struct btc_coexist *pBtCoexist)
 	struct adapter *padapter;
 	bool bNeedToAct;
 
-
 	padapter = pBtCoexist->Adapter;
 	bNeedToAct = false;
 
@@ -161,7 +156,6 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv;
 
-
 	pmlmepriv = &padapter->mlmepriv;
 
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE)) {
@@ -180,7 +174,6 @@ static u32 _halbtcoutsrc_GetWifiLinkStatus(struct adapter *padapter)
 	u8 bp2p;
 	u32 portConnectedStatus;
 
-
 	pmlmepriv = &padapter->mlmepriv;
 	bp2p = false;
 	portConnectedStatus = 0;
@@ -214,7 +207,6 @@ static u32 halbtcoutsrc_GetWifiLinkStatus(struct btc_coexist *pBtCoexist)
 	u32 retVal;
 	u32 portConnectedStatus, numOfConnectedPort;
 
-
 	padapter = pBtCoexist->Adapter;
 	portConnectedStatus = 0;
 	numOfConnectedPort = 0;
@@ -270,7 +262,6 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 	u32 *pU4Tmp;
 	u8 ret;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	if (!halbtcoutsrc_IsBtCoexistAvailable(pBtCoexist))
 		return false;
@@ -429,7 +420,6 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 	u32 *pU4Tmp;
 	u8 ret;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 	pu8 = pInBuf;
@@ -566,7 +556,6 @@ static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -578,7 +567,6 @@ static u16 halbtcoutsrc_Read2Byte(void *pBtcContext, u32 RegAddr)
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -590,7 +578,6 @@ static u32 halbtcoutsrc_Read4Byte(void *pBtcContext, u32 RegAddr)
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -602,7 +589,6 @@ static void halbtcoutsrc_Write1Byte(void *pBtcContext, u32 RegAddr, u8 Data)
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -616,7 +602,6 @@ static void halbtcoutsrc_BitMaskWrite1Byte(void *pBtcContext, u32 regAddr, u8 bi
 	u8 originalValue, bitShift;
 	u8 i;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 	originalValue = 0;
@@ -642,7 +627,6 @@ static void halbtcoutsrc_Write2Byte(void *pBtcContext, u32 RegAddr, u16 Data)
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -654,7 +638,6 @@ static void halbtcoutsrc_Write4Byte(void *pBtcContext, u32 RegAddr, u32 Data)
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -677,20 +660,17 @@ static void halbtcoutsrc_SetBbReg(void *pBtcContext, u32 RegAddr, u32 BitMask, u
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
 	PHY_SetBBReg(padapter, RegAddr, BitMask, Data);
 }
 
-
 static u32 halbtcoutsrc_GetBbReg(void *pBtcContext, u32 RegAddr, u32 BitMask)
 {
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -702,7 +682,6 @@ static void halbtcoutsrc_SetRfReg(void *pBtcContext, u8 eRFPath, u32 RegAddr, u3
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -714,7 +693,6 @@ static u32 halbtcoutsrc_GetRfReg(void *pBtcContext, u8 eRFPath, u32 RegAddr, u32
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -762,7 +740,6 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 	struct btc_coexist *pBtCoexist;
 	struct adapter *padapter;
 
-
 	pBtCoexist = (struct btc_coexist *)pBtcContext;
 	padapter = pBtCoexist->Adapter;
 
@@ -912,7 +889,6 @@ void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
 	u8 lpsType;
 
-
 	if (!halbtcoutsrc_IsBtCoexistAvailable(pBtCoexist))
 		return;
 
@@ -1141,7 +1117,6 @@ void hal_btcoex_SetBTCoexist(struct adapter *padapter, u8 bBtExist)
 {
 	struct hal_com_data *pHalData;
 
-
 	pHalData = GET_HAL_DATA(padapter);
 	pHalData->bt_coexist.bBtExist = bBtExist;
 }
@@ -1158,7 +1133,6 @@ bool hal_btcoex_IsBtExist(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData;
 
-
 	pHalData = GET_HAL_DATA(padapter);
 	return pHalData->bt_coexist.bBtExist;
 }
@@ -1178,7 +1152,6 @@ void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum)
 {
 	struct hal_com_data *pHalData;
 
-
 	pHalData = GET_HAL_DATA(padapter);
 
 	pHalData->bt_coexist.btTotalAntNum = antNum;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 792cd071df22..634af4657eee 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -335,7 +335,6 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	} else { /* typical setting */
 
-
 		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
@@ -376,7 +375,6 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	} else { /* typical setting */
 
-
 		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
@@ -708,7 +706,6 @@ void SetHalODMVar(
 	}
 }
 
-
 bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 {
 	u16 i = 0;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index ea79e300f83b..b16456d5b6bb 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -734,7 +734,6 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	    idx_rate_sctn == -1 || idx_channel == -1)
 		return MAX_POWER_INDEX;
 
-
 	for (i = 0; i < MAX_REGULATION_NUM; i++)
 		limits[i] = hal_data->TxPwrLimit_2_4G[i]
 						     [idx_bandwidth]
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 03f23b75d532..19e16270381e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -223,7 +223,6 @@ void beacon_timing_control(struct adapter *padapter)
 	rtl8723b_SetBeaconRelatedRegisters(padapter);
 }
 
-
 s32 rtw_hal_xmit_thread_handler(struct adapter *padapter)
 {
 	return rtl8723bs_xmit_buf_handler(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 665c85eccbdf..1a865d4de8ac 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -81,7 +81,6 @@ u32 rtw_hal_get_sdio_tx_max_length(struct adapter *padapter, u8 queue_idx)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	u32 deviceId, max_len;
 
-
 	deviceId = ffaddr2deviceId(pdvobjpriv, queue_idx);
 	switch (deviceId) {
 	case WLAN_TX_HIQ_DEVICE_ID:
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 1e0498268aee..da861245d795 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -21,7 +21,6 @@ static u8 CardEnable(struct adapter *padapter)
 	u8 bMacPwrCtrlOn;
 	u8 ret = _FAIL;
 
-
 	rtw_hal_get_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 	if (!bMacPwrCtrlOn) {
 		/*  RSV_CTRL 0x1C[7:0] = 0x00 */
@@ -235,7 +234,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 	struct registry_priv *pregistrypriv = &Adapter->registrypriv;
 	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
 
-
 	u16 valueHi = 0;
 	u16 valueLow = 0;
 
@@ -319,8 +317,6 @@ static void _InitQueuePriority(struct adapter *Adapter)
 	default:
 		break;
 	}
-
-
 }
 
 static void _InitPageBoundary(struct adapter *padapter)
@@ -363,7 +359,6 @@ static void _InitWMACSetting(struct adapter *padapter)
 	struct hal_com_data *pHalData;
 	u16 value16;
 
-
 	pHalData = GET_HAL_DATA(padapter);
 
 	pHalData->ReceiveConfig = 0;
@@ -560,7 +555,6 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
 
-
 	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
 
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
@@ -735,7 +729,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/*  set 0x0 to 0xFF by tynli. Default enable HW SEQ NUM. */
 	rtw_write8(padapter, REG_HWSEQ_CTRL, 0xFF);
 
-
 	/*  */
 	/*  Configure SDIO TxRx Control to enable Rx DMA timer masking. */
 	/*  2010.02.24. */
@@ -744,7 +737,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	_RfPowerSave(padapter);
 
-
 	rtl8723b_InitHalDm(padapter);
 
 	/*  */
@@ -908,7 +900,6 @@ void rtl8723bs_init_default_value(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData;
 
-
 	pHalData = GET_HAL_DATA(padapter);
 
 	rtl8723b_init_default_value(padapter);
@@ -924,7 +915,6 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	bool bWiFiConfig = pregistrypriv->wifi_spec;
 
-
 	pdvobjpriv->RtOutPipe[0] = WLAN_TX_HIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[1] = WLAN_TX_MIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[2] = WLAN_TX_LOQ_DEVICE_ID;
@@ -976,7 +966,6 @@ static void _ReadRFType(struct adapter *Adapter)
 	pHalData->rf_chip = RF_6052;
 }
 
-
 static void Hal_EfuseParseMACAddr_8723BS(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
@@ -1070,7 +1059,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 	if (!padapter->hw_init_completed)
 		_InitPowerOn_8723BS(padapter);
 
-
 	val8 = rtw_read8(padapter, 0x4e);
 	val8 |= BIT(6);
 	rtw_write8(padapter, 0x4e, val8);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 5d74913be573..dd01ac629bb1 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -877,5 +877,3 @@ void HalQueryTxOQTBufferStatus8723BSdio(struct adapter *adapter)
 
 	haldata->SdioTxOQTFreeSpace = SdioLocalCmd52Read1Byte(adapter, SDIO_REG_OQT_FREE_PG);
 }
-
-
-- 
2.34.1

