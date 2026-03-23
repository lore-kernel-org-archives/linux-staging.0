Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8053BD63C
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283363; cv=none; b=WZl/HwOZTO5MhuvKwBsRjv6c5zs3oPowWOutZI4RD1JXtte6JbYuljlSNibkdUlnAEwmZaCN42oj7Yz3k66drWOJZIPE/0tnXiW30KB+pJDjXK+5zuDs8S6KTRPsVLxwhZepFuQlmFuAcrW4Xmw6dV8DpZ+uNl/hwSBLaTRVFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283363; c=relaxed/simple;
	bh=34e+LQKJEw7JRxljLgIJ0WsY3yL1y0iL2JAVsmCdc6k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQcnKsveQSm3BHX/BmDARZPweWBVAeTNccJMraDf36jXkyTsj/T2e28pqC1PFHHPJm1eowfptrr0LtNdU9KTh+hn3uo2eufNTeluC1u28TuF3SacZqTcaaLW/1ps6LD9REAcq52p6aGwuhQNhNlNbwSlMP41WMo+nEpimQNuuPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltdmrmBi; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltdmrmBi"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82ae378fff8so2243962b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283361; x=1774888161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEzBe1NN78BfdAo1/VcgiKXD8axm/NYlT83UKa0Ybh8=;
        b=ltdmrmBiIzbN6e5QA3DJNdyEcIkxloy8uXL7Wy+YslrK7C3Ny3kbMwScpebdjC4lkz
         HeifWUVBAXLhq/YBCQlQWle/LDzDqZKofYLP6S3MLf+wAzJOBlYdwmXRfBhvHqqSWiZA
         giCaFZBvKsWotwV6C3BWZ5XE1tMADP67pf4lSImREb36e8vNZfwJ0vG1ioBBU2fw7zvy
         G8iF50FENHzDu1VfoFjmIXohtIE1Z5VWkUK4A06T3bMqmi7UMkzkbj6XXY8qU8mn4o8Y
         B6xhi2NoqBNuJodGtAswEqNoCIVUrFLI122EaCqcWGdZJb/VloVInDs5ZinIUq/FlvOO
         ibfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283361; x=1774888161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEzBe1NN78BfdAo1/VcgiKXD8axm/NYlT83UKa0Ybh8=;
        b=hpzcUtZI3aTqbV20x7VG+/Oi2L8RfBEfwSk7pOP3hQCp16NmQNPgrVBfohT6By7L3D
         mCanjDMffEWka8sev0KIWR5vCeCkCyhdKBspbG16fmpNL4869rzNQVsFwf4Dcv8igMTj
         j0pal5BHlOQ9y+JYSuA48D5dBpGovJ9wSTE93YWH5NF6erYcY9eW16aAm4sjgO/1b+CW
         0chCHPV7qdDB77NTGCoqgnmX4klmtz7myqZ286qKjjZ1PCyw/qW2EY/JeQZIERonGMGs
         OS7uU+pme9/rZgLiD4kYUEp+PQ9aa8uwAmIkKaNqCjA5HUVYw6f6oHjP3JncCMw4ljuT
         NeaA==
X-Gm-Message-State: AOJu0Yy2CRLiKG9EBB983DsZ4mdV/7hgI9B/iA4YEviwDo5/B1wmtf5Z
	AAxVVGt9TzE4MS3uJK03VhvdpRMXUCRtiGcOGgKLjIzhHkT85+XArhN7v0KkP1tM
X-Gm-Gg: ATEYQzxMI1bQW8yUvPNmLNroCw0g8Kvy9IX8VRchu8huFJ/Aa9E7OfcI/e6jxwnwdPI
	G10oqmNesLPYH8jU5rcCGVrldtuc2CE2J7k8ApQqXGexdLrgKN/FC0+UH7CqSrQaz/IBY10ZFlH
	yBpi1upmVJgw8kuFV7o5EH+4fW99O5/666BFEGULInskObM9efLu8SHvukGoJ6tBpJXV0yLNcos
	RLw/EPWAy9J5BBpnSVeXNQibSrb2Nhi5GbArWNr05ZHiWQPlLuGuFXHXNlsYxp2c3MEiUjX5B4m
	sIbXE0KxUeJoolgpJiqlP8oQ35e1Ti2NaXvOPaxcYC6gaepVaisPhxxIcOGNsj30t0mmkOlzK2J
	pzDno0VLFdBgp8syTWHPsAgIPtqtFWPIyainQwSzTRltfh9Ng7klgHVxBLY9s9fJC6DTqJMWawa
	Zhh1maXpEpOsnHWFHnVeqTp/o+XkcKVRVRJC6GIIpZ
X-Received: by 2002:a05:6a00:2d29:b0:82c:28de:fa26 with SMTP id d2e1a72fcca58-82c28defcd5mr8120561b3a.36.1774283360922;
        Mon, 23 Mar 2026 09:29:20 -0700 (PDT)
Received: from localhost.localdomain ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc66b3sm10560369b3a.21.2026.03.23.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:29:20 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	straube.linux@gmail.com,
	b9788213@gmail.com,
	ethantidmore06@gmail.com,
	dan.carpenter@linaro.org,
	andriy.shevchenko@linux.intel.com,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix constant on left side of test checkpatch warnings
Date: Mon, 23 Mar 2026 21:59:01 +0530
Message-Id: <20260323162901.121947-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In all types of comparison/test (using ==, !=, >=, <=, >, <
operators) ensure that the constant lies to the right side of the test,
thus fixing checkpatch warnings : comparisons should place the constant
on the right side of the test, throughout the rtl8723bs driver.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
v1 link: https://lore.kernel.org/linux-staging/20260323145214.ubhshy2gwp52j5zh@inspiron/T/#mc3b693b37c49fbdde89171b7f1bf61b7ba8eb964

 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  4 ++--
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  5 +----
 drivers/staging/rtl8723bs/hal/hal_com.c        |  8 +++-----
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c |  8 ++++----
 drivers/staging/rtl8723bs/hal/odm.c            |  4 ++--
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   |  3 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  |  4 ++--
 drivers/staging/rtl8723bs/include/wifi.h       |  2 +-
 10 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..58f6cf063498 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -2211,7 +2211,7 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	}
 
 	algorithm = halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
-	if (pCoexSta->bC2hBtInquiryPage && (BT_8723B_2ANT_COEX_ALGO_PANHS != algorithm)) {
+	if (pCoexSta->bC2hBtInquiryPage && (algorithm != BT_8723B_2ANT_COEX_ALGO_PANHS)) {
 		halbtc8723b2ant_ActionBtInquiry(pBtCoexist);
 		return;
 	} else {
@@ -2490,7 +2490,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		return;
 	}
 
-	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW != rspSource) {
+	if (rspSource != BT_INFO_SRC_8723B_2ANT_WIFI_FW) {
 		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [3:0] */
 
 		pCoexSta->btRssi = pCoexSta->btInfoC2h[rspSource][3] * 2 + 10;
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..61b35173aa4f 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -313,7 +313,7 @@ static void GetDeltaSwingTable_8723B(
 	u16 rate = *(pDM_Odm->pForcedDataRate);
 	u8 channel = pHalData->CurrentChannel;
 
-	if (1 <= channel && channel <= 14) {
+	if (channel >= 1 && channel <= 14) {
 		if (IS_CCK_RATE(rate)) {
 			*TemperatureUP_A   = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P;
 			*TemperatureDOWN_A = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N;
@@ -1425,9 +1425,6 @@ static void phy_IQCalibrate_8723B(
 		}
 	}
 
-	if (0x00 == PathAOK) {
-	}
-
 /* path B IQK */
 	if (is2T) {
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880ae6a..00fa5c386d63 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		AutoLoadFail = true;
 
 	if (!AutoLoadFail) {
@@ -122,10 +122,8 @@ u8 hal_com_config_channel_plan(
 		}
 	}
 
-	if (
-		(false == pHalData->bDisableSWChannelPlan) &&
-		rtw_is_channel_plan_valid(sw_channel_plan)
-	)
+	if (!pHalData->bDisableSWChannelPlan &&
+	    rtw_is_channel_plan_valid(sw_channel_plan))
 		chnlPlan = sw_channel_plan;
 
 	return chnlPlan;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index dc2da49e6738..28ec996cd411 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -462,18 +462,18 @@ u8 PHY_GetTxPowerIndexBase(
 
 	if (IS_CCK_RATE(Rate))
 		txPower = pHalData->Index24G_CCK_Base[RFPath][chnlIdx];
-	else if (MGN_6M <= Rate)
+	else if (Rate >= MGN_6M)
 		txPower = pHalData->Index24G_BW40_Base[RFPath][chnlIdx];
 
 	/*  OFDM-1T */
-	if ((MGN_6M <= Rate && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
+	if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
 		txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
 	if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+		if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
 			txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
 	} else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+		if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
 			txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
 	}
 
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 639b6da2302b..bbe05211f4ed 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -343,9 +343,9 @@ bool ODM_RAStateCheck(
 	}
 
 	/*  Decide RATRState by RSSI. */
-	if (RSSI > HighRSSIThreshForRA)
+	if (HighRSSIThreshForRA < RSSI)
 		RATRState = DM_RATR_STA_HIGH;
-	else if (RSSI > LowRSSIThreshForRA)
+	else if (LowRSSIThreshForRA < RSSI)
 		RATRState = DM_RATR_STA_MIDDLE;
 	else
 		RATRState = DM_RATR_STA_LOW;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..25bc11ac874c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -25,9 +25,8 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 	do {
 		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
+		if (!valid)
 			read_down = true;
-		}
 	} while ((!read_down) && (retry_cnts--));
 
 	return read_down;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..02c3f4229e74 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -405,11 +405,11 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 			break;
 	}
 	_FWDownloadEnable(padapter, false);
-	if (_SUCCESS != rtStatus)
+	if (rtStatus != _SUCCESS)
 		goto fwdl_stat;
 
 	rtStatus = _FWFreeToGo(padapter, 10, 200);
-	if (_SUCCESS != rtStatus)
+	if (rtStatus != _SUCCESS)
 		goto fwdl_stat;
 
 fwdl_stat:
@@ -1165,15 +1165,15 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 
 static void hal_get_chnl_group_8723b(u8 channel, u8 *group)
 {
-	if (1  <= channel && channel <= 2)
+	if (channel >= 1 && channel <= 2)
 		*group = 0;
-	else if (3  <= channel && channel <= 5)
+	else if (channel >= 3 && channel <= 5)
 		*group = 1;
-	else if (6  <= channel && channel <= 8)
+	else if (channel >= 6 && channel <= 8)
 		*group = 2;
-	else if (9  <= channel && channel <= 11)
+	else if (channel >= 9 && channel <= 11)
 		*group = 3;
-	else if (12 <= channel && channel <= 14)
+	else if (channel >= 12 && channel <= 14)
 		*group = 4;
 }
 
@@ -1221,7 +1221,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 
 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
 
-	if (0xFF == PROMContent[eeAddr+1])
+	if (PROMContent[eeAddr+1] == 0xFF)
 		AutoLoadFail = true;
 
 	if (AutoLoadFail) {
@@ -2035,7 +2035,7 @@ static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 		val8 &= ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
 
 		/*  Always enable port0 beacon function for PSTDMA */
-		if (REG_BCN_CTRL == bcn_ctrl_reg)
+		if (bcn_ctrl_reg == REG_BCN_CTRL)
 			val8 |= EN_BCN_FUNCTION;
 
 		rtw_write8(padapter, bcn_ctrl_reg, val8);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a1f2cbf2cf55..9f6503ac2234 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -413,7 +413,7 @@ int rtl8723bs_xmit_thread(void *context)
 		if (signal_pending(current)) {
 			flush_signals(current);
 		}
-	} while (_SUCCESS == ret);
+	} while (ret == _SUCCESS);
 
 	complete(&pxmitpriv->SdioXmitTerminate);
 
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 0f28c904a714..0f378830462f 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -395,8 +395,8 @@ enum {
 };
 
 #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
-#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
-#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
+#define IS_CCK_RATE(_rate)				(_rate == MGN_1M || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
+#define IS_OFDM_RATE(_rate)				(_rate >= MGN_6M && _rate <= MGN_54M  && _rate != MGN_11M)
 
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..31eaf40a3425 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -275,7 +275,7 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 
 static inline int IsFrameTypeCtrl(unsigned char *pframe)
 {
-	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
+	if (GetFrameType(pframe) == WIFI_CTRL_TYPE)
 		return true;
 	else
 		return false;

base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.34.1

