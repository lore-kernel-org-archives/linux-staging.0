Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B53EFFC2
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181300; cv=none; b=JcRqMmoLtv+PmLtsU3CU+wu3PE3zi8Ate0ztnNJYekzyZCEp/aA4Jors2KVyqRhX460wBxj/iXDCHq6So200XlepdUhOoZ6tSmVqO8Km2312nua1gDKZcnSSkeQP4RUbU57LEVWFjjrD14s4omArbz7zo4+TuyUXfNmqaBAEC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181300; c=relaxed/simple;
	bh=p5xGNthCd//xHejS/bl2ZHGYac7+yHIKrDzvofWZsk8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DZpg1HKBbijBkgiqKUdynvxqc6a05VOxEfSeYip32byHzi1UyXixWv9+Y0FZTm4WuZAhHQSKQj5S2R3YWOLD1NI5lLh5XewuBYdO1pcAB/1d4dmRS5zNiobBCJX3/kEP0sD95b3kROkKNe1wKiYUZ4MKcsqZzvq5SgKMWx4yuiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=mGcWHldL; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="mGcWHldL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Sn
	FyfJ9l6Ec4g5lVNQKRwn2rbbS40o7in22cra0wlso=; b=mGcWHldLps03YCnQxn
	mG5ti0oxEVCNM6osj8SXq0f6zTQLZvqyN3jTJZETg8KX9smJq/1umEgaKG60g+ro
	q7o8sTXEdHBjCsPsdVv3UgrlXPIQ5UwSb0o5Y2fqxN6feIAhJZY/nDkgXtAvBo8W
	Yl1p0bQ/sADYK/wvM24s5eXuM=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3_wbbJgxqrqmTBw--.4189S2;
	Tue, 19 May 2026 17:01:16 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in rtl8723b_hal_init.c
Date: Tue, 19 May 2026 17:01:14 +0800
Message-Id: <20260519090114.828918-1-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_wbbJgxqrqmTBw--.4189S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3CFW7tF4DJFWkCryrGryxuFg_yoW8Wr13Ao
	WFyFWjvr1ft3s7ta18tr17XF15Zw4xu343Aa17Xayvg3y3JF4UZrZaq34UAw4UXr95K3yv
	yFW0qas0vwnayr4Dn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3_OzUUUUU
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBoBxepmoMJtztmAAA3t

Fix checkpatch coding style issues:
- Add spaces around binary operators (|, &, +, >>) per kernel style
- Replace C++ style comments (//) with kernel style comments (/* */)

No functional change.

Assisted-by: Claude:claude-4-opus
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 108 +++++++++---------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..a73996cbb28b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -21,23 +21,23 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, tmp | 0x04);
 
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
-		rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
+		rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
 
 		do {
 			tmp = rtw_read8(padapter, REG_MCUFWDL);
 			if (tmp & 0x01)
 				break;
-			rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
+			rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
 			msleep(1);
 		} while (count++ < 100);
 
 		/*  8051 reset */
-		tmp = rtw_read8(padapter, REG_MCUFWDL+2);
-		rtw_write8(padapter, REG_MCUFWDL+2, tmp&0xf7);
+		tmp = rtw_read8(padapter, REG_MCUFWDL + 2);
+		rtw_write8(padapter, REG_MCUFWDL + 2, tmp & 0xf7);
 	} else {
 		/*  MCU firmware download disable. */
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
-		rtw_write8(padapter, REG_MCUFWDL, tmp&0xfe);
+		rtw_write8(padapter, REG_MCUFWDL, tmp & 0xfe);
 	}
 }
 
@@ -104,8 +104,8 @@ static int _PageWrite(
 	u8 value8;
 	u8 u8Page = (u8) (page & 0x07);
 
-	value8 = (rtw_read8(padapter, REG_MCUFWDL+2) & 0xF8) | u8Page;
-	rtw_write8(padapter, REG_MCUFWDL+2, value8);
+	value8 = (rtw_read8(padapter, REG_MCUFWDL + 2) & 0xF8) | u8Page;
+	rtw_write8(padapter, REG_MCUFWDL + 2, value8);
 
 	return _BlockWrite(padapter, buffer, size);
 }
@@ -266,7 +266,7 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		!(IS_FW_81xxC(padapter) && ((pHalData->FirmwareVersion < 0x21) || (pHalData->FirmwareVersion == 0x21 && pHalData->FirmwareSubVersion < 0x01)))
 	) { /*  after 88C Fw v33.1 */
 		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
-		rtw_write8(padapter, REG_HMETFR+3, 0x20);
+		rtw_write8(padapter, REG_HMETFR + 3, 0x20);
 
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		while (val & BIT2) {
@@ -682,7 +682,7 @@ static void hal_ReadEFuse_WiFi(
 					efuseTbl[addr] = efuseData;
 
 					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
-					efuseTbl[addr+1] = efuseData;
+					efuseTbl[addr + 1] = efuseData;
 				}
 				addr += 2;
 			}
@@ -774,7 +774,7 @@ static void hal_ReadEFuse_BT(
 						efuseTbl[addr] = efuseData;
 
 						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
-						efuseTbl[addr+1] = efuseData;
+						efuseTbl[addr + 1] = efuseData;
 					}
 					addr += 2;
 				}
@@ -892,20 +892,20 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL+2);
-	pHalData->RegReg542 = rtw_read8(padapter, REG_TBTT_PROHIBIT+2);
-	pHalData->RegCR_1 = rtw_read8(padapter, REG_CR+1);
+	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL + 2);
+	pHalData->RegReg542 = rtw_read8(padapter, REG_TBTT_PROHIBIT + 2);
+	pHalData->RegCR_1 = rtw_read8(padapter, REG_CR + 1);
 }
 
 void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	rtw_write8(Adapter, 0x4c7, rtw_read8(Adapter, 0x4c7)|BIT(7)); /* enable single pkt ampdu */
+	rtw_write8(Adapter, 0x4c7, rtw_read8(Adapter, 0x4c7) | BIT(7)); /* enable single pkt ampdu */
 	rtw_write8(Adapter, REG_RX_PKT_LIMIT_8723B, 0x18);		/* for VHT packet length 11K */
 	rtw_write8(Adapter, REG_MAX_AGGR_NUM_8723B, 0x1F);
 	rtw_write8(Adapter, REG_PIFS_8723B, 0x00);
-	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL)&(~BIT(7)));
+	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL) & (~BIT(7)));
 	if (pHalData->AMPDUBurstMode)
 		rtw_write8(Adapter, REG_AMPDU_BURST_MODE_8723B,  0x5F);
 	rtw_write8(Adapter, REG_AMPDU_MAX_TIME_8723B, 0x70);
@@ -913,13 +913,13 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 	/*  ARFB table 9 for 11ac 5G 2SS */
 	rtw_write32(Adapter, REG_ARFR0_8723B, 0x00000010);
 	if (IS_NORMAL_CHIP(pHalData->VersionID))
-		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0xfffff000);
+		rtw_write32(Adapter, REG_ARFR0_8723B + 4, 0xfffff000);
 	else
-		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0x3e0ff000);
+		rtw_write32(Adapter, REG_ARFR0_8723B + 4, 0x3e0ff000);
 
 	/*  ARFB table 10 for 11ac 5G 1SS */
 	rtw_write32(Adapter, REG_ARFR1_8723B, 0x00000010);
-	rtw_write32(Adapter, REG_ARFR1_8723B+4, 0x003ff000);
+	rtw_write32(Adapter, REG_ARFR1_8723B + 4, 0x003ff000);
 }
 
 static void ResumeTxBeacon(struct adapter *padapter)
@@ -927,10 +927,10 @@ static void ResumeTxBeacon(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
 	pHalData->RegFwHwTxQCtrl |= BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, 0xff);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 1, 0xff);
 	pHalData->RegReg542 |= BIT(0);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+2, pHalData->RegReg542);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 2, pHalData->RegReg542);
 }
 
 static void StopTxBeacon(struct adapter *padapter)
@@ -938,16 +938,16 @@ static void StopTxBeacon(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
 	pHalData->RegFwHwTxQCtrl &= ~BIT(6);
-	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, 0x64);
+	rtw_write8(padapter, REG_FWHW_TXQ_CTRL + 2, pHalData->RegFwHwTxQCtrl);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 1, 0x64);
 	pHalData->RegReg542 &= ~BIT(0);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+2, pHalData->RegReg542);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT + 2, pHalData->RegReg542);
 }
 
 static void _BeaconFunctionEnable(struct adapter *padapter, u8 Enable, u8 Linked)
 {
 	rtw_write8(padapter, REG_BCN_CTRL, DIS_TSF_UDT | EN_BCN_FUNCTION | DIS_BCNQ_SUB);
-	rtw_write8(padapter, REG_RD_CTRL+1, 0x6F);
+	rtw_write8(padapter, REG_RD_CTRL + 1, 0x6F);
 }
 
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
@@ -998,7 +998,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE) == true) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
@@ -1014,9 +1014,9 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 {
 	if (enable)
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) | BIT1);
+		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) | BIT1);
 	else
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) & ~BIT1);
+		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) & ~BIT1);
 }
 
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
@@ -1221,7 +1221,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 
 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
 
-	if (0xFF == PROMContent[eeAddr+1])
+	if (0xFF == PROMContent[eeAddr + 1])
 		AutoLoadFail = true;
 
 	if (AutoLoadFail) {
@@ -1270,7 +1270,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	EEPROM_DEFAULT_24G_HT20_DIFF;
 				else {
-					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	(PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	(PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1278,7 +1278,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_24G_OFDM_DIFF;
 				else {
-					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1288,7 +1288,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW40_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->BW40_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->BW40_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->BW40_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW40_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1296,7 +1296,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->BW20_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->BW20_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1305,7 +1305,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1313,7 +1313,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->CCK_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->CCK_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->CCK_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->CCK_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->CCK_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1358,9 +1358,9 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 
 	/*  2010/10/19 MH Add Regulator recognize for CU. */
 	if (!AutoLoadFail) {
-		pHalData->EEPROMRegulatory = (PROMContent[EEPROM_RF_BOARD_OPTION_8723B]&0x7);	/* bit0~2 */
+		pHalData->EEPROMRegulatory = (PROMContent[EEPROM_RF_BOARD_OPTION_8723B] & 0x7);	/* bit0~2 */
 		if (PROMContent[EEPROM_RF_BOARD_OPTION_8723B] == 0xFF)
-			pHalData->EEPROMRegulatory = (EEPROM_DEFAULT_BOARD_OPTION&0x7);	/* bit0~2 */
+			pHalData->EEPROMRegulatory = (EEPROM_DEFAULT_BOARD_OPTION & 0x7);	/* bit0~2 */
 	} else
 		pHalData->EEPROMRegulatory = 0;
 }
@@ -2066,7 +2066,7 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
 		rtw_write32(padapter, REG_TSFTR, tsf);
-		rtw_write32(padapter, REG_TSFTR+4, tsf>>32);
+		rtw_write32(padapter, REG_TSFTR + 4, tsf >> 32);
 
 		/*  enable related TSF function */
 		val8 = rtw_read8(padapter, REG_BCN_CTRL);
@@ -2382,7 +2382,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 		/*  Set RRSR rate table. */
 		rtw_write16(padapter, REG_RRSR, BrateCfg);
-		rtw_write8(padapter, REG_RRSR+2, rtw_read8(padapter, REG_RRSR+2)&0xf0);
+		rtw_write8(padapter, REG_RRSR + 2, rtw_read8(padapter, REG_RRSR + 2) & 0xf0);
 	}
 		break;
 
@@ -2464,10 +2464,10 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		/* SIFS_Timer = 0x0a0a0808; */
 		/* RESP_SIFS for CCK */
 		rtw_write8(padapter, REG_RESP_SIFS_CCK, val[0]); /*  SIFS_T2T_CCK (0x08) */
-		rtw_write8(padapter, REG_RESP_SIFS_CCK+1, val[1]); /* SIFS_R2T_CCK(0x08) */
+		rtw_write8(padapter, REG_RESP_SIFS_CCK + 1, val[1]); /* SIFS_R2T_CCK(0x08) */
 		/* RESP_SIFS for OFDM */
 		rtw_write8(padapter, REG_RESP_SIFS_OFDM, val[2]); /* SIFS_T2T_OFDM (0x0a) */
-		rtw_write8(padapter, REG_RESP_SIFS_OFDM+1, val[3]); /* SIFS_R2T_OFDM(0x0a) */
+		rtw_write8(padapter, REG_RESP_SIFS_OFDM + 1, val[3]); /* SIFS_R2T_OFDM(0x0a) */
 		break;
 
 	case HW_VAR_ACK_PREAMBLE:
@@ -2479,7 +2479,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			/* regTmp = (pHalData->nCur40MhzPrimeSC)<<5; */
 			if (bShortPreamble)
 				regTmp |= 0x80;
-			rtw_write8(padapter, REG_RRSR+2, regTmp);
+			rtw_write8(padapter, REG_RRSR + 2, regTmp);
 		}
 		break;
 
@@ -2702,19 +2702,19 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		break;
 	case HW_VAR_BCN_VALID:
 		{
-			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL+2, write 1 to clear, Clear by sw */
-			val8 = rtw_read8(padapter, REG_TDECTRL+2);
+			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL + 2, write 1 to clear, Clear by sw */
+			val8 = rtw_read8(padapter, REG_TDECTRL + 2);
 			val8 |= BIT(0);
-			rtw_write8(padapter, REG_TDECTRL+2, val8);
+			rtw_write8(padapter, REG_TDECTRL + 2, val8);
 		}
 		break;
 
 	case HW_VAR_DL_BCN_SEL:
 		{
 			/*  SW_BCN_SEL - Port0 */
-			val8 = rtw_read8(padapter, REG_DWBCN1_CTRL_8723B+2);
+			val8 = rtw_read8(padapter, REG_DWBCN1_CTRL_8723B + 2);
 			val8 &= ~BIT(4);
-			rtw_write8(padapter, REG_DWBCN1_CTRL_8723B+2, val8);
+			rtw_write8(padapter, REG_DWBCN1_CTRL_8723B + 2, val8);
 		}
 		break;
 
@@ -2778,8 +2778,8 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 	case HW_VAR_BCN_VALID:
 		{
-			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL+2 */
-			val8 = rtw_read8(padapter, REG_TDECTRL+2);
+			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL + 2 */
+			val8 = rtw_read8(padapter, REG_TDECTRL + 2);
 			*val = (BIT(0) & val8) ? true : false;
 		}
 		break;
@@ -2886,15 +2886,15 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
-			rtw_read32(padapter, 0x2F0);	// info 1
+			rtw_read32(padapter, 0x2F0);	/* info 1 */
 
 			cmd = 0x40000400 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
-			rtw_read32(padapter, 0x2F0);	// info 1
-			rtw_read32(padapter, 0x2F4);	// info 2
-			rtw_read32(padapter, 0x2F8);	// rate mask 1
-			rtw_read32(padapter, 0x2FC);	// rate mask 2
+			rtw_read32(padapter, 0x2F0);	/* info 1 */
+			rtw_read32(padapter, 0x2F4);	/* info 2 */
+			rtw_read32(padapter, 0x2F8);	/* rate mask 1 */
+			rtw_read32(padapter, 0x2FC);	/* rate mask 2 */
 		}
 		break;
 
-- 
2.34.1

