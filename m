Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024857F73D
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 16:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885597; cv=none; b=mGrMnHxENMCSwn9nT+HUlkfdrLwEHHPUKcHiROr7uYOfgi34CQTblJPWm/4tfIqkeZbarCOpmy59Y53SGXjoSzIUWd6jJeIs9Mu1AZVY4v6+aT0WAch6n1RuUOwA2aPoRIwEumV7G5dkeivmysOPDzXzuV8w0xuI/yzmfXh7ggM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885597; c=relaxed/simple;
	bh=JGZFgjbgkP+MCaJzSulNU1je9JJ11c9ojIgM3Rv96II=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AtFzYknu8wlARXdnN5kkF3FYN4Mk7FNgbJh+igLz5h8DSFji7djpiO2zDyf5/xsObHT0AoyJqq990Xyw9AzX+NN963fDUtT+91fdqbu15IX1i3US9DNHIoLEmXFe92BA5DLz08zQZZHQryXq1RQoYweSuxviR3an054qRjon95c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8JGD9FM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8JGD9FM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8534d507f59so5103251b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 09:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885595; x=1789490395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rv7zVIn/5Kk1qXZr0/qV4NIKEsySj7qCzxlT+TFoos=;
        b=H8JGD9FMyuXH6sP1bszzAbqGjsoqbS5+xXnG+ABpJbJD/VYsGX5/Gc2FOUPul5R8sV
         wXd16DNPAsxYOuNMHhS9/gOztrcz/ROwn59p6dKFZsQoEIh4NU+x3P+ZTbIf2BWKjl7F
         EgMYUjgQwNg7kNmYs1lIuOQmn1jzet1M6Mc1LZLe0Shgp9bFbGCQ0SM98bYevAi82HHr
         2d43lRWXcMwIPQJzQuPn5IQOAnBAxF4bha0nG6t8ls653YTXqVX808bDuNfsj3j436C9
         vusFc+92c8Z5SAADQ02KjLg86LN2YBHFCef92S54FMykVVC+/vBq1N6FTIZk8Ual9CvV
         LceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885595; x=1789490395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rv7zVIn/5Kk1qXZr0/qV4NIKEsySj7qCzxlT+TFoos=;
        b=isal1amy62nj9f93VdTNUG5w/c32uloy/8YRzf7O1waIZIS8Pv4E2boUee/PK9+NJr
         RGqtWDYwZMo34nXmE3aveo7qDf/8g+CKIvdeIyobE0k5Io1owBA+kEFxK43v7w1sYmAO
         rhxUnHhO42qANxwbz8LXyMLc71zSpZAy7Rx74eukKWBw8ynozVekXjwR7CX1clKV0zQ+
         0xpsqxyaRrVQG+lG0wYDFGwIWkCAkZXKAX+gfctPidfsvkqF7PbaF3jdNDizkTMDob6/
         0dG+6OLDltYdMX8hZOhfXPn3r9GgfZrV5Q1KLED9wxlvTCiYK2GoQkLwRDfXk6j9rx74
         /IqQ==
X-Gm-Message-State: AFuF++nHbWcYiFBOpKFsm1gNnLbmtMurhT6+mbhAQp1oNgJhtpc5p9Wm
	YVWJ6jU1RqRBCj3027ZBe5qHxbIt+u0HDZxZe3lkdyzBC+OgNMkyWXKP9Mz6iQ==
X-Gm-Gg: AYBFou2AzKVREsBb4ZMmsYLUhNnDS7DwU6F35s7EEL6BmMcj9T+EC+oTyllSJpQbntp
	G/FrEPFsGgFpbPdOPBhXUL3/lEhgvUYsESz62F1z9oCu4YMMh/qdLnBW0kScuF2BivNgw7tDqdK
	HOKKeovQxy4GyQ9iKMAKheC59WQEEgSVfkyZsYl9pTtB+hQH45AZTsGp9f9MTG+cJMxhC9ZxUeL
	CQWZucmHGcmZiSqAizzs6UXreIgPgRO/v+AOf7NdfTLlvC0jo4uCuVfsZHO4dmuv2d3/0/nL/MI
	TP1h9x7oNmLGFnaxGF2aUp0TMPPqKq1b66tbQKJJ808KDiDbiGiodrLEo6H6eK+53gCHIX0K5zN
	NGVuXzpwGI/WsruI8LvTiBq7c4YKXI6A3P7mi27GxgHNTm6Cb4hZBV9bBSTNDiJRL5218Bmm873
	L+bfZmC91L7TUNCih4uEXKiuHwma38nKe/H/kLGqv9LH6Ji3syb1Rdk1rxSIaNq1gwiG5yhWA=
X-Received: by 2002:a05:6a20:7f8a:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3dab8b492cemr2020296637.2.1788885595034;
        Tue, 08 Sep 2026 09:39:55 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm5672357eec.29.2026.09.08.09.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:39:54 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 3/3] staging: rtl8723bs: remove commented out code in hal/ files
Date: Tue,  8 Sep 2026 09:39:19 -0700
Message-Id: <20260908163919.72100-4-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908163919.72100-1-guojy.bj@gmail.com>
References: <20260908163919.72100-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out code in a bunch of hal/ source files
Remove adjacent comment where applicable.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 39 ----------------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 10 -----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 44 ++-----------------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  2 -
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  8 ++--
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  6 ---
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  6 ---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  5 ---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  1 -
 10 files changed, 7 insertions(+), 116 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 61cdc27a64ac..afdde1f2ec0c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -783,8 +783,6 @@ void hal_btcoex_Initialize(void *padapter)
 
 	pBtCoexist = &GLBtCoexist;
 
-	/* pBtCoexist->statistics.cntBind++; */
-
 	pBtCoexist->chipInterface = BTC_INTF_SDIO;
 
 	EXhalbtcoutsrc_BindBtCoexWithAdapter(padapter);
@@ -874,15 +872,10 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	else
 		ipsType = BTC_IPS_ENTER;
 
-	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
-
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
-
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -925,15 +918,10 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 		GLBtcWiFiInScanState = false;
 	}
 
-	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
-
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
-
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
@@ -951,15 +939,10 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
 	else
 		assoType = BTC_ASSOCIATE_FINISH;
 
-	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
-
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
-
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
@@ -979,15 +962,10 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 	else
 		mStatus = BTC_MEDIA_DISCONNECT;
 
-	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
-
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
-
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktType)
@@ -1010,15 +988,10 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 		return;
 	}
 
-	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
-
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
-
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length)
@@ -1028,15 +1001,10 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8
 
 	pBtCoexist->statistics.cntBtInfoNotify++;
 
-	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
-
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
-
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
@@ -1075,15 +1043,10 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 	pBtCoexist->statistics.cntPeriodical++;
 
 	/*  Periodical should be called in cmd thread, */
-	/*  don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
-
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_Periodical(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_Periodical(pBtCoexist);
-
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
@@ -1093,10 +1056,8 @@ void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
 	} else if (type == BT_COEX_ANT_TYPE_ANTDIV) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	} else if (type == BT_COEX_ANT_TYPE_DETECTED) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d2b44ad60a4c..734fb9bb1867 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -635,7 +635,6 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 			DLBcnCount++;
 			do {
 				yield();
-				/* mdelay(10); */
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
@@ -895,7 +894,6 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 13efbfa5b58a..5f31e89bb1c4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -76,12 +76,6 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 		| ODM_RF_CALIBRATION
 		;
 
-	/*  */
-	/*  Pointer reference */
-	/*  */
-	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
-	/* ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
-
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_TX_UNI, &(dvobj->traffic_stat.tx_bytes));
@@ -155,8 +149,6 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 		ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_LINK, bLinked);
 		ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_STATION_STATE, bsta_state);
 
-		/* ODM_CmnInfoUpdate(&pHalData->odmpriv , ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM); */
-
 		bBtDisabled = hal_btcoex_IsBtDisabled(Adapter);
 
 		ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_BT_ENABLED,
@@ -216,7 +208,6 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
 		goto skip_lps_dm;
 
-	/* ODM_DMWatchdog(&pHalData->odmpriv); */
 	/* Do DIG by RSSI In LPS-32K */
 
       /* 1 Find MIN-RSSI */
@@ -233,7 +224,6 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 
 	pDM_Odm->RSSI_Min = pdmpriv->MinUndecoratedPWDBForDM;
 
-	/* if (pDM_DigTable->CurIGValue != pDM_Odm->RSSI_Min) */
 	if (
 		(pDM_DigTable->CurIGValue > pDM_Odm->RSSI_Min + 5) ||
 		(pDM_DigTable->CurIGValue < pDM_Odm->RSSI_Min - 5)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1389e5598d3e..af688b7139cd 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -430,9 +430,6 @@ void rtl8723b_InitializeFirmwareVars(struct adapter *padapter)
 
 	/*  Init H2C counter. by tynli. 2009.12.09. */
 	pHalData->LastHMEBoxNum = 0;
-/* pHalData->H2CQueueHead = 0; */
-/* pHalData->H2CQueueTail = 0; */
-/* pHalData->H2CStopInsertQueue = false; */
 }
 
 /*  */
@@ -1043,9 +1040,6 @@ void rtl8723b_init_default_value(struct adapter *padapter)
 
 	/*  init dm default value */
 	pdmpriv->TM_Trigger = 0;/* for IQK */
-/* 	pdmpriv->binitialized = false; */
-/* 	pdmpriv->prv_traffic_idx = 3; */
-/* 	pdmpriv->initialize = 0; */
 
 	pdmpriv->ThermalValue_HP_index = 0;
 	for (i = 0; i < HP_THERMAL_NUM; i++)
@@ -1152,7 +1146,6 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-/* 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter); */
 	u16 EEPROMId;
 
 	/*  Check 0x8129 again for making sure autoload status!! */
@@ -1332,8 +1325,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 		tempval = hwinfo[EEPROM_RF_BT_SETTING_8723B];
 		if (tempval != 0xFF) {
 			pHalData->EEPROMBluetoothAntNum = tempval & BIT(0);
-			/*  EFUSE_0xC3[6] == 0, S1(Main)-RF_PATH_A; */
-			/*  EFUSE_0xC3[6] == 1, S0(Aux)-RF_PATH_B */
 			if (tempval & BIT(6))
 				pHalData->ant_path = RF_PATH_B;
 			else
@@ -1409,7 +1400,6 @@ void Hal_EfuseParseVoltage_8723B(
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
-	/* memcpy(pEEPROM->adjuseVoltageVal, &hwinfo[EEPROM_Voltage_ADDR_8723B], 1); */
 	pEEPROM->adjuseVoltageVal = (hwinfo[EEPROM_Voltage_ADDR_8723B] & 0xf0) >> 4;
 }
 
@@ -1491,9 +1481,6 @@ u8 BWMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib)
 	} else
 		BWSettingOfDesc = 0;
 
-	/* if (pTcb->bBTTxPacket) */
-	/* 	BWSettingOfDesc = 0; */
-
 	return BWSettingOfDesc;
 }
 
@@ -1867,7 +1854,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 
 			/*  disable atim wnd */
 			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT|EN_BCN_FUNCTION|DIS_ATIM);
-			/* rtw_write8(padapter, REG_BCN_CTRL, 0x18); */
 		} else if (mode == _HW_STATE_ADHOC_) {
 			ResumeTxBeacon(padapter);
 			rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT|EN_BCN_FUNCTION|DIS_BCNQ_SUB);
@@ -1887,7 +1873,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			/* Beacon Control related register for first time */
 			rtw_write8(padapter, REG_BCNDMATIM, 0x02); /*  2ms */
 
-			/* rtw_write8(padapter, REG_BCN_MAX_ERR, 0xFF); */
 			rtw_write8(padapter, REG_ATIMWND, 0x0a); /*  10ms */
 			rtw_write16(padapter, REG_BCNTCFG, 0x00);
 			rtw_write16(padapter, REG_TBTT_PROHIBIT, 0xff04);
@@ -1901,7 +1886,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			rtw_write8(padapter, REG_BCN_CTRL, (DIS_TSF_UDT|EN_BCN_FUNCTION|EN_TXBCN_RPT|DIS_BCNQ_SUB));
 
 			/* SW_BCN_SEL - Port0 */
-			/* rtw_write8(Adapter, REG_DWBCN1_CTRL_8192E+2, rtw_read8(Adapter, REG_DWBCN1_CTRL_8192E+2) & ~BIT4); */
 			rtw_hal_set_hwreg(padapter, HW_VAR_DL_BCN_SEL, NULL);
 
 			/*  select BCN on port 0 */
@@ -1998,8 +1982,6 @@ static void hw_var_set_mlme_disconnect(struct adapter *padapter, u8 variable, u8
 {
 	u8 val8;
 
-	/*  Set RCR to not to receive data frame when NO LINK state */
-	/* rtw_write32(padapter, REG_RCR, rtw_read32(padapter, REG_RCR) & ~RCR_ADF); */
 	/*  reject all data frames */
 	rtw_write16(padapter, REG_RXFLTMAP2, 0);
 
@@ -2085,8 +2067,7 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 	pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
 	if (type == 0) { /*  prepare to join */
-		/* enable to rx data frame.Accept all data frame */
-		/* rtw_write32(padapter, REG_RCR, rtw_read32(padapter, REG_RCR)|RCR_ADF); */
+		/* enable to rx data frame */
 		rtw_write16(padapter, REG_RXFLTMAP2, 0xFFFF);
 
 		val32 = rtw_read32(padapter, REG_RCR);
@@ -2164,11 +2145,9 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 		break;
 
 	case C2H_CCX_TX_RPT:
-/* 			CCX_FwC2HTxRpt(padapter, QueueID, pC2hEvent->payload); */
 		break;
 
 	case C2H_EXT_RA_RPT:
-/* 			C2HExtRaRptHandler(padapter, pC2hEvent->payload, C2hEvent.CmdLen); */
 		break;
 
 	case C2H_HW_INFO_EXCH:
@@ -2182,10 +2161,6 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 		break;
 	}
 
-	/*  Clear event to notify FW we have read the command. */
-	/*  Note: */
-	/*	If this field isn't clear, the FW won't update the next command message. */
-/* 	rtw_write8(padapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE); */
 exit:
 	return ret;
 }
@@ -2204,11 +2179,9 @@ static void process_c2h_event(struct adapter *padapter, struct c2h_evt_hdr_t *pC
 		break;
 
 	case C2H_CCX_TX_RPT:
-/* 			CCX_FwC2HTxRpt(padapter, QueueID, tmpBuf); */
 		break;
 
 	case C2H_EXT_RA_RPT:
-/* 			C2HExtRaRptHandler(padapter, tmpBuf, C2hEvent.CmdLen); */
 		break;
 
 	case C2H_HW_INFO_EXCH:
@@ -2234,7 +2207,6 @@ void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length)
 	tmpBuf = pbuffer+2;
 
 	process_c2h_event(padapter, &C2hEvent, tmpBuf);
-	/* c2h_handler_8723b(padapter,&C2hEvent); */
 }
 
 void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
@@ -2344,8 +2316,6 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			hal_btcoex_ConnectNotify(padapter, false);
 			break;
 		case 2:
-			/*  sta add event callback */
-/* 				rtw_btcoex_MediaStatusNotify(padapter, RT_MEDIA_CONNECT); */
 			break;
 		}
 		break;
@@ -2371,7 +2341,6 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		break;
 
 	case HW_VAR_RESP_SIFS:
-		/* SIFS_Timer = 0x0a0a0808; */
 		/* RESP_SIFS for CCK */
 		rtw_write8(padapter, REG_RESP_SIFS_CCK, val[0]); /*  SIFS_T2T_CCK (0x08) */
 		rtw_write8(padapter, REG_RESP_SIFS_CCK+1, val[1]); /* SIFS_R2T_CCK(0x08) */
@@ -2386,7 +2355,6 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			u8 bShortPreamble = *val;
 
 			/*  Joseph marked out for Netgear 3500 TKIP channel 7 issue.(Temporarily) */
-			/* regTmp = (pHalData->nCur40MhzPrimeSC)<<5; */
 			if (bShortPreamble)
 				regTmp |= 0x80;
 			rtw_write8(padapter, REG_RRSR+2, regTmp);
@@ -2405,7 +2373,6 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 				/*  filled id in CAM config 2 byte */
 				if (i == 0) {
 					ulContent |= (ucIndex & 0x03) | ((u16)(ulEncAlgo)<<2);
-					/* ulContent |= CAM_VALID; */
 				} else
 					ulContent = 0;
 
@@ -2413,8 +2380,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 				ulCommand = CAM_CONTENT_COUNT*ucIndex+i;
 				ulCommand = ulCommand | CAM_POLLINIG | CAM_WRITE;
 				/*  write content 0 is equal to mark as invalid */
-				rtw_write32(padapter, WCAMI, ulContent);  /* mdelay(40); */
-				rtw_write32(padapter, RWCAM, ulCommand);  /* mdelay(40); */
+				rtw_write32(padapter, WCAMI, ulContent);
+				rtw_write32(padapter, RWCAM, ulCommand);
 			}
 		}
 		break;
@@ -2496,11 +2463,6 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			if (psmode != PS_MODE_ACTIVE)
 				ODM_RF_Saving(&pHalData->odmpriv, true);
 
-			/* if (psmode != PS_MODE_ACTIVE)	{ */
-			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
-			/*  else { */
-			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, false); */
-			/*  */
 			rtl8723b_set_FwPwrMode_cmd(padapter, psmode);
 		}
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 737e2a818c18..cdcad7ab2b40 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -67,7 +67,6 @@ void PHY_SetBBReg_8723B(
 	u32 Data
 )
 {
-	/* u16 BBWaitCounter	= 0; */
 	u32 OriginalValue, BitShift;
 
 	if (BitMask != bMaskDWord) { /* if not "double word" write */
@@ -685,7 +684,6 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	u8 CenterFrequencyIndex1
 )
 {
-	/* static bool		bInitialzed = false; */
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	u8 tmpChannel = pHalData->CurrentChannel;
 	enum channel_width tmpBW = pHalData->CurrentChannelBW;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index e4f047b14827..acbc67df4e48 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -95,18 +95,18 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 	/*----Set RF_ENV enable----*/
 	PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
-	udelay(1);/* PlatformStallExecution(1); */
+	udelay(1);
 
 	/*----Set RF_ENV output high----*/
 	PHY_SetBBReg(Adapter, pPhyReg->rfintfo, bRFSI_RFENV, 0x1);
-	udelay(1);/* PlatformStallExecution(1); */
+	udelay(1);
 
 	/* Set bit number of Address and Data for RF register */
 	PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
-	udelay(1);/* PlatformStallExecution(1); */
+	udelay(1);
 
 	PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
-	udelay(1);/* PlatformStallExecution(1); */
+	udelay(1);
 
 	/*----Initialize RF fom connfiguration file----*/
 	ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, CONFIG_RF_RADIO, RF_PATH_A);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
index ac1249676794..90a851b50c9f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
@@ -12,7 +12,6 @@ static void process_rssi(struct adapter *padapter, union recv_frame *prframe)
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 	struct signal_stat *signal_stat = &padapter->recvpriv.signal_strength_data;
 
-	/* if (pRfd->Status.bPacketToSelf || pRfd->Status.bPacketBeacon) */
 	{
 		if (signal_stat->update_req) {
 			signal_stat->total_num = 0;
@@ -56,12 +55,7 @@ void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe)
 	/*  Check RSSI */
 	/*  */
 	process_rssi(padapter, precvframe);
-	/*  */
-	/*  Check PWDB. */
-	/*  */
-	/* process_PWDB(padapter, precvframe); */
 
-	/* UpdateRxSignalStatistics8192C(Adapter, pRfd); */
 	/*  */
 	/*  Check EVM */
 	/*  */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 706d58741dce..304fda3a3b5c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -96,7 +96,6 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 		.is_beacon   = false,
 	};
 
-	/* unsigned long		irqL; */
 	struct sta_priv *pstapriv;
 	struct sta_info *psta;
 
@@ -125,13 +124,10 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 
 	pkt_info.data_rate = pattrib->data_rate;
 
-	/* rtl8723b_query_rx_phy_status(precvframe, pphy_status); */
-	/* spin_lock_bh(&p_hal_data->odm_stainfo_lock); */
 	odm_phy_status_query(&p_hal_data->odmpriv, p_phy_info,
 			   (u8 *)pphy_status, &(pkt_info));
 	if (psta)
 		psta->rssi = pattrib->phy_info.RecvSignalPower;
-	/* spin_unlock_bh(&p_hal_data->odm_stainfo_lock); */
 	precvframe->u.hdr.psta = NULL;
 	if (
 		pkt_info.bssid_match &&
@@ -307,7 +303,6 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 				precvframe->u.hdr.rx_end = skb_end_pointer(pkt_copy);
 
 				recvframe_put(precvframe, skb_len);
-				/* recvframe_pull(precvframe, drvinfo_sz + RXDESC_SIZE); */
 
 				if (p_hal_data->ReceiveConfig & RCR_APPFCS)
 					recvframe_pull_tail(precvframe, IEEE80211_FCS_LEN);
@@ -317,7 +312,6 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				/*  update drv info */
 				if (p_hal_data->ReceiveConfig & RCR_APP_BA_SSN) {
-					/* rtl8723s_update_bassn(padapter, pdrvinfo); */
 					ptr += 4;
 				}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..dec9d4d53de7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -24,7 +24,6 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 
 		if ((++n % 60) == 0) {
 			msleep(1);
-			/* yield(); */
 		}
 	}
 
@@ -103,8 +102,6 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	rtw_hal_sdio_update_tx_freepage(pri_padapter, PageIdx, pxmitbuf->pg_num);
 
 free_xmitbuf:
-	/* rtw_free_xmitframe(pxmitpriv, pframe); */
-	/* pxmitbuf->priv_data = NULL; */
 	rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
 
 	return _FAIL;
@@ -248,8 +245,6 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 							rtw_free_xmitframe(pxmitpriv, pframe);
 							pxmitbuf->priv_data = NULL;
 							enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
-							/* can not yield under lock */
-							/* yield(); */
 						} else
 							rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
 					}
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 001b4b32c02e..bd3a8ed15063 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -171,7 +171,6 @@ static void _InitTxBufferBoundary(struct adapter *padapter)
 {
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 
-	/* u16 txdmactrl; */
 	u8 txpktbuf_bndy;
 
 	if (!pregistrypriv->wifi_spec) {
-- 
2.34.1

