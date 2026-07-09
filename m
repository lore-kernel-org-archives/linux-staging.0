Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3E4DC542
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621632; cv=none; b=t/wTzfBgwnr4LpAgR9BVXZGtfDAPXljZjEGiHCHknExhf5SXotnJqm5kd6GjSRa23c57jGEM5RX3RcPXGGkMChLvv/+HzPu0FQpphrjMWyCOx69FlXqMGrvT2JWNCMGOnZ6w1nAOxYdnASdFgKuFFk5MZBaMkMmsWG3TaEKVGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621632; c=relaxed/simple;
	bh=t2+CFcsXrnCuKqA1+R9OhVf4a1Rj7OpbzBlBLKSCx9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwenUbuAkUS7oQCZJA2xIeN4ZnDXOHAHAnCgz5XW+mj/ZZ2nRRfvpsobNdJf52iZpSuJMuGhvgCCPuC777erQQnaXI/HoNZw/rwrMWHD0Cex7CzNIcgL/cCHKFLZI3zDKnRTbv4/d/9+qAVFSpgsdWkYxetF/nhlPRw7l80Zo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDcg3m9o; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDcg3m9o"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c128cc012b4so22082566b.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621629; x=1784226429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMqK9jucM+nxf/ppXRA8MScgFvbk0sDecGvgagU86i8=;
        b=SDcg3m9oV2O6XyNB+hPiebwvdlSevV3I7ao3PInKoV8POziOQ+mWm9r3kWE5eEwQQ4
         uzAJorgYxapaVXsmZdc4y3ee517pm3M4DxgLY9pvSS5U9qesQSEUiLCnofgXQIkqjITp
         ZIch6e4p80iejaCbP74Otwy2dRlAkWMW99LaknrvJcSOt/sumwdQXe3X3r7smC8A56Ur
         j6Yph9Wdh4EhKLZgF/EIk006Q3IElpEcGiwZ4upz7T3YFjtx6ksZ9FR/Lhzy3MBX4mHr
         EZ6kcGjAgso0ojlgajv5B0bzft0uqxoW3KjNAWibo9dLOlZ1hPknNG2sB7ysF9699VWY
         y12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621629; x=1784226429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMqK9jucM+nxf/ppXRA8MScgFvbk0sDecGvgagU86i8=;
        b=KYy5wUFxUu4gX2ovqvquOplvmHQXey5xo+hCpl8CnMUOEL+nqvLHKN6wK7RfsJQXF5
         IFyuDznIwxk+iPBwMBMEZdKZEIh8Db41sYgWRUKsg5SL4Xfvu4g2GO1qCEYP1bf8xBWo
         I+Whr4T3fTHfR4Zksp9IQubnZyT3KHeczNJuMbui04hqZEeSTKsekeBcC285FqQ/pB6X
         VSOJLC7DSGMiBB5UG7/1Jdr8d+ABP7erAFjk7WAH4piblWHHY0u/eMLpSLVrWsPKJ6qC
         JAzRyPsLIGXPI0JQZvs2l+OnGZe2v6LZRqp9tJmGiDUWzJbo61qtbvtSt6UFysyvfwH0
         4jXw==
X-Gm-Message-State: AOJu0Yw63F8c8gCH89k3Jq1EuCZQA+04eltaANGlHgCoG/OH1JzY6YEn
	8gCv0wglkdmYhBYDb5R+vhN4xNhHURZWEhgs8HMi//3iD4EFloM7haogRXzycw==
X-Gm-Gg: AfdE7cnDBIpTVpKajgSpyLgC1rClXoTPA5wLYzAbwmucP2FdSAb721tnIjde/Vko7FV
	dgqzara2IAjHeTaz5thEHJf+GUFrx2/kUVVET1kzseZkw4pBQGE0YMJ8XzlUuEbCBSTyEr/hN2d
	xSfKb87vtDUJ78Jm4rLKq8hnlx038ZfrYkWoq6Flziu0CkFsOT5m69nImJsx0/2novtgSVbhwIr
	r3AEGEWaFrTyrdbLXvTaXjrlpBBCurEnxvkk5jotgUpHj5p3Byy+kvMP5YCELYpjatBxxiAei+U
	PaiJ6bM9cW3lHMnUROP9DMMi7OQ2FENSVzdxmeDCq1M6sy/4CTKvRhqygpC8SQ927HjFLaYaIRi
	Jl0teRmWn5CBbGiPSe8N5mhNzhlrGssBjbZQ8i7ET4rx2ZCDEcWq7ivvGIMQRD+4QOzrM/DTt6I
	As81PD8/o7Pw==
X-Received: by 2002:a17:907:f207:b0:c15:f40f:1593 with SMTP id a640c23a62f3a-c15feec9581mr13660166b.16.1783621628634;
        Thu, 09 Jul 2026 11:27:08 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:08 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/9] staging: rtl8723bs: remove dead fields from struct hal_com_data
Date: Thu,  9 Jul 2026 21:15:08 +0300
Message-ID: <20260709182627.16327-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709182627.16327-1-nikolayof23@gmail.com>
References: <20260709182627.16327-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fields exist but are never used, and nothing is ever written to
them, so remove them.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 69 --------------------
 1 file changed, 69 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index a03e32e4884c..2c630c6b5f97 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -188,25 +188,14 @@ struct hal_com_data {
 	u8 rf_chip;
 	u8 PackageType;
 
-	u8 InterfaceSel;
-	u8 framesync;
-	u32 framesyncC34;
-	u8 framesyncMonitor;
-	u8 DefaultInitialGain[4];
 	/*  EEPROM setting. */
-	u16 EEPROMVID;
-	u16 EEPROMSVID;
-
 	u8 EEPROMCustomerID;
-	u8 EEPROMSubCustomerID;
 	u8 EEPROMVersion;
 	u8 EEPROMRegulatory;
 	u8 EEPROMThermalMeter;
 	u8 EEPROMBluetoothCoexist;
 	u8 EEPROMBluetoothType;
 	u8 EEPROMBluetoothAntNum;
-	u8 EEPROMBluetoothAntIsolation;
-	u8 EEPROMBluetoothRadioShared;
 	u8 bTXPowerDataReadFromEEPORM;
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
 
@@ -226,24 +215,12 @@ struct hal_com_data {
 
 	u8 Regulation2_4G;
 
-	u8 TxPwrInPercentage;
-
-	u8 TxPwrCalibrateRate;
 	/*  TX power by rate table */
 	/*  RF: at most 2 = AB = 0/1 */
 	/*  CCK = 0 OFDM = 1 HT-MCS 0-7 = 2 */
-	u8 TxPwrByRateTable;
-	u8 TxPwrByRateBand;
 	s8 TxPwrByRateOffset[MAX_RF_PATH_NUM][TX_PWR_BY_RATE_NUM_RATE];
 	/*  */
 
-	/* 2 Power Limit Table */
-	u8 TxPwrLevelCck[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];
-	u8 TxPwrLevelHT40_1S[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];	/*  For HT 40MHZ pwr */
-	u8 TxPwrLevelHT40_2S[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];	/*  For HT 40MHZ pwr */
-	s8	TxPwrHt20Diff[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];/*  HT 20<->40 Pwr diff */
-	u8 TxPwrLegacyHtDiff[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];/*  For HT<->legacy pwr diff */
-
 	/*  Power Limit Table for 2.4G */
 	s8	TxPwrLimit_2_4G[MAX_REGULATION_NUM]
 						[MAX_2_4G_BANDWIDTH_NUM]
@@ -254,52 +231,26 @@ struct hal_com_data {
 	/*  Store the original power by rate value of the base of each rate section of rf path A & B */
 	u8 TxPwrByRateBase2_4G[MAX_RF_PATH_NUM][MAX_RATE_SECTION_NUM];
 
-	/*  For power group */
-	u8 PwrGroupHT20[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];
-	u8 PwrGroupHT40[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];
-
-
-
-
-	u8 PGMaxGroup;
-	u8 LegacyHTTxPowerDiff;/*  Legacy to HT rate power diff */
-	/*  The current Tx Power Level */
-	u8 CurrentCckTxPwrIdx;
-	u8 CurrentOfdm24GTxPwrIdx;
-	u8 CurrentBW2024GTxPwrIdx;
-	u8 CurrentBW4024GTxPwrIdx;
-
 	/*  Read/write are allow for following hardware information variables */
 	u8 pwrGroupCnt;
 	u32 MCSTxPowerLevelOriginalOffset[MAX_PG_GROUP][16];
-	u32 CCKTxPowerLevelOriginalOffset;
 
 	u8 CrystalCap;
-	u32 AntennaTxPath;					/*  Antenna path Tx */
-	u32 AntennaRxPath;					/*  Antenna path Rx */
 
-	u8 PAType_2G;
-	u8 LNAType_2G;
-	u8 ExternalPA_2G;
-	u8 ExternalLNA_2G;
 	u8 TypeGLNA;
 	u8 TypeGPA;
 	u8 TypeALNA;
 	u8 TypeAPA;
 	u8 RFEType;
 	u8 BoardType;
-	u8 ExternalPA;
 	u8 bIQKInitialized;
 	bool		bLCKInProgress;
 
 	bool		bSwChnl;
 	bool		bSetChnlBW;
-	bool		bChnlBWInitialized;
 	bool		bNeedIQK;
 
-	u8 bLedOpenDrain; /*  Support Open-drain arrangement for controlling the LED. Added by Roger, 2009.10.16. */
 	u8 TxPowerTrackControl; /* for mp mode, turn off txpwrtracking as default */
-	u8 b1x1RecvCombine;	/*  for 1T1R receive combining */
 
 	u32 AcParam_BE; /* Original parameter for BE, use for EDCA turbo. */
 
@@ -307,9 +258,6 @@ struct hal_com_data {
 
 	u32 RfRegChnlVal[2];
 
-	/* RDG enable */
-	bool	 bRDGEnable;
-
 	/* for host message to fw */
 	u8 LastHMEBoxNum;
 
@@ -320,46 +268,30 @@ struct hal_com_data {
 	u8 RegFwHwTxQCtrl;
 	u8 RegReg542;
 	u8 RegCR_1;
-	u8 Reg837;
-	u8 RegRFPathS1;
 	u16 RegRRSR;
 
 	u8 CurAntenna;
 	u8 AntDivCfg;
 	u8 AntDetection;
-	u8 TRxAntDivType;
 	u8 ant_path; /* for 8723B s0/s1 selection */
 
 	u8 u1ForcedIgiLb;			/*  forced IGI lower bound */
 
 	u8 bDumpRxPkt;/* for debug */
 	u8 bDumpTxPkt;/* for debug */
-	u8 FwRsvdPageStartOffset; /* 2010.06.23. Added by tynli. Reserve page start offset except beacon in TxQ. */
 
 	/*  2010/08/09 MH Add CU power down mode. */
 	bool		pwrdown;
 
-	/*  Add for dual MAC  0--Mac0 1--Mac1 */
-	u32 interfaceIndex;
-
 	u8 OutEpQueueSel;
 	u8 OutEpNumber;
 
 	/*  2010/12/10 MH Add for USB aggregation mode dynamic scheme. */
 	bool		UsbRxHighSpeedMode;
 
-	/*  2010/11/22 MH Add for slim combo debug mode selective. */
-	/*  This is used for fix the drawback of CU TSMC-A/UMC-A cut. HW auto suspend ability. Close BT clock. */
-	bool		SlimComboDbg;
-
-	/* u8 AMPDUDensity; */
-
 	/*  Auto FSM to Turn On, include clock, isolation, power control for MAC only */
 	u8 bMacPwrCtrlOn;
 
-	u8 RegIQKFWOffload;
-	struct submit_ctx	iqk_sctx;
-
 	enum rt_ampdu_burst	AMPDUBurstMode; /* 92C maybe not use, but for compile successfully */
 
 	u32 		sdio_himr;
@@ -390,6 +322,5 @@ struct hal_com_data {
 };
 
 #define GET_HAL_DATA(__padapter)	((struct hal_com_data *)((__padapter)->HalData))
-#define RT_GetInterfaceSelection(_Adapter)	(GET_HAL_DATA(_Adapter)->InterfaceSel)
 
 #endif /* __HAL_DATA_H__ */

base-commit: b46e70613266e52adc412f92de7504cd14804f6d
-- 
2.54.0

