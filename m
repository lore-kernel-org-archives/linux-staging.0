Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD263EFD34
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184790; cv=none; b=M/Ykr+ZbCzVXIymYknORpmfhTZemZ7zGOnKtztWfoGCyvdsNTekt4Z+XeL0bc3QWfNM9kqFFAQA34aBLoRd3xqYTjC7cSjw3tQTXmpZU9RQvF3/uJMvkFXZr0Hw597zOGy4iCmqScGiviBLBEt8IJTvrehT/HT3S2/tXL+MRlTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184790; c=relaxed/simple;
	bh=QJiF6iZhbyzHBuVyPrA+OpyF0CEWdRDy0P1nLmEDJQw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H+l4OjFDxJvQ3oKSiQUnZys0pRDGLmzPrDLFUeXZs//hi4dRR0kzM50EnawQIxaINXAfbE1xdar/2jb34GLYZtChl+2wfiiRZW4hH9u+mfFfMA7CFAcgxkCAaQvhWBYjRwUZRCVq2N29hYar7f/rozOvh7JTtRG1CEB5m1FtBJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Ohbj97K9; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Ohbj97K9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=l9
	k+W0AxgFJNbOdJyKfOJptrgJevH3lC3CCu1cPvFfY=; b=Ohbj97K9+DTi2ymam6
	Fwtz2cD1XlKuzyrmcT5Mn4vty6oaUVPFubDoPstDwMpJrSUgD7ZssFnpM1BEc/P1
	M2u0COPQmMhZswfEx7zLu+vQhIkH46caUL1OyS1Wj8waVRijki3uNUBezf8w5e1p
	bCjLLuciIrTJpK2lb81lYV4Qg=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3v_X9Mwxqg0AXBw--.63806S4;
	Tue, 19 May 2026 17:57:18 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] staging: rtl8723bs: add missing spaces around operators in rtl8723b_hal_init.c
Date: Tue, 19 May 2026 17:57:17 +0800
Message-Id: <20260519095717.878742-3-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519095717.878742-1-xinyuili@126.com>
References: <20260519090114.828918-1-xinyuili@126.com>
 <20260519095717.878742-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v_X9Mwxqg0AXBw--.63806S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3CFW7tF4DJFWkCryrXF13Jwb_yoW8Gw4kWo
	WSyFWjvr1fKas7ta18tr17XF15Zw4xu343Aa17XaykW3y3JF4UZrZaq34UAw4UXr95t3yv
	yFW0qasIvwnayr4Dn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsTKZUUUUU
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBrx6p8WoMM-6ThgAA3X

Add missing spaces around binary operators (|, &, +, >>) to comply
with kernel coding style. This includes spacing fixes for register
offset patterns, bitwise operations on function arguments, array
index arithmetic, and bit shift operations.

Signed-off-by: lixinyu <xinyuili@126.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 96 +++++++++----------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 2c98ecc98ce5..bcea4ab18540 100644
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
 
@@ -102,8 +102,8 @@ static int _PageWrite(
 	u8 value8;
 	u8 u8Page = (u8) (page & 0x07);
 
-	value8 = (rtw_read8(padapter, REG_MCUFWDL+2) & 0xF8) | u8Page;
-	rtw_write8(padapter, REG_MCUFWDL+2, value8);
+	value8 = (rtw_read8(padapter, REG_MCUFWDL + 2) & 0xF8) | u8Page;
+	rtw_write8(padapter, REG_MCUFWDL + 2, value8);
 
 	return _BlockWrite(padapter, buffer, size);
 }
@@ -264,7 +264,7 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		!(IS_FW_81xxC(padapter) && ((pHalData->FirmwareVersion < 0x21) || (pHalData->FirmwareVersion == 0x21 && pHalData->FirmwareSubVersion < 0x01)))
 	) { /*  after 88C Fw v33.1 */
 		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
-		rtw_write8(padapter, REG_HMETFR+3, 0x20);
+		rtw_write8(padapter, REG_HMETFR + 3, 0x20);
 
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		while (val & BIT(2)) {
@@ -682,7 +682,7 @@ static void hal_ReadEFuse_WiFi(
 
 					rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
 								&efuseData);
-					efuseTbl[addr+1] = efuseData;
+					efuseTbl[addr + 1] = efuseData;
 				}
 				addr += 2;
 			}
@@ -776,7 +776,7 @@ static void hal_ReadEFuse_BT(
 
 						rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
 									&efuseData);
-						efuseTbl[addr+1] = efuseData;
+						efuseTbl[addr + 1] = efuseData;
 					}
 					addr += 2;
 				}
@@ -881,20 +881,20 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
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
@@ -902,13 +902,13 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 	/*  ARFB table 9 for 11ac 5G 2SS */
 	rtw_write32(Adapter, REG_ARFR0_8723B, 0x00000010);
 	if (pHalData->chip_normal)
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
@@ -916,10 +916,10 @@ static void ResumeTxBeacon(struct adapter *padapter)
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
@@ -927,16 +927,16 @@ static void StopTxBeacon(struct adapter *padapter)
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
@@ -1004,9 +1004,9 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 {
 	if (enable)
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) | BIT(1));
+		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) | BIT(1));
 	else
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) & ~BIT(1));
+		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) & ~BIT(1));
 }
 
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
@@ -1211,7 +1211,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 
 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
 
-	if (PROMContent[eeAddr+1] == 0xFF)
+	if (PROMContent[eeAddr + 1] == 0xFF)
 		AutoLoadFail = true;
 
 	if (AutoLoadFail) {
@@ -1260,7 +1260,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	EEPROM_DEFAULT_24G_HT20_DIFF;
 				else {
-					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	(PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	(PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1268,7 +1268,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_24G_OFDM_DIFF;
 				else {
-					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1278,7 +1278,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW40_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->BW40_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->BW40_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->BW40_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW40_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1286,7 +1286,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->BW20_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->BW20_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1295,7 +1295,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
+					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0xf0) >> 4;
 					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1303,7 +1303,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 				if (PROMContent[eeAddr] == 0xFF)
 					pwrInfo24G->CCK_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
-					pwrInfo24G->CCK_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
+					pwrInfo24G->CCK_Diff[rfPath][TxCount] = (PROMContent[eeAddr] & 0x0f);
 					if (pwrInfo24G->CCK_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->CCK_Diff[rfPath][TxCount] |= 0xF0;
 				}
@@ -1348,9 +1348,9 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 
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
@@ -2057,7 +2057,7 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
 		rtw_write32(padapter, REG_TSFTR, tsf);
-		rtw_write32(padapter, REG_TSFTR+4, tsf>>32);
+		rtw_write32(padapter, REG_TSFTR + 4, tsf >> 32);
 
 		/*  enable related TSF function */
 		val8 = rtw_read8(padapter, REG_BCN_CTRL);
@@ -2373,7 +2373,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 		/*  Set RRSR rate table. */
 		rtw_write16(padapter, REG_RRSR, BrateCfg);
-		rtw_write8(padapter, REG_RRSR+2, rtw_read8(padapter, REG_RRSR+2)&0xf0);
+		rtw_write8(padapter, REG_RRSR + 2, rtw_read8(padapter, REG_RRSR + 2) & 0xf0);
 	}
 		break;
 
@@ -2455,10 +2455,10 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
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
@@ -2470,7 +2470,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			/* regTmp = (pHalData->nCur40MhzPrimeSC)<<5; */
 			if (bShortPreamble)
 				regTmp |= 0x80;
-			rtw_write8(padapter, REG_RRSR+2, regTmp);
+			rtw_write8(padapter, REG_RRSR + 2, regTmp);
 		}
 		break;
 
@@ -2693,19 +2693,19 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
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
 
@@ -2769,8 +2769,8 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 	case HW_VAR_BCN_VALID:
 		{
-			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL+2 */
-			val8 = rtw_read8(padapter, REG_TDECTRL+2);
+			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL + 2 */
+			val8 = rtw_read8(padapter, REG_TDECTRL + 2);
 			*val = (BIT(0) & val8) ? true : false;
 		}
 		break;
-- 
2.34.1

