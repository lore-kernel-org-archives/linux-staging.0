Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D030F535
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779051770; cv=none; b=X7qDDb4ZuqPpsFFm5sAuRcfnrKcrsjgIBRqUx0KOaylVrSZfNX8s+9aAmenrApBFodqKU6cJfivMSWX8jAk0uT5Mrd/bPR+7TyFc15yW0NtgXVF4PzPoDNGtGtZZoo46KUJjL7nI4ulqsCl1PI3QeImX+Ma6qhiPZp5Vda/2thU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779051770; c=relaxed/simple;
	bh=3oy5W4iV3NWZ7BbrewUcve9R2eIroL0lLVdv07VjUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYuw3wE6PD13qVBea9Fd7J4bk6WRbrOUz6os5ZzIaDjnymyU7Y07ScAnEyiK5akoL4fvqwkWsAE5ZJAagVIX74CJ7u70Fo4wLyQSwQtI31t2dAT4anxNowILIyDydBl1lqbEnmMXnf7OwL6aw542pMGMdwhV4gWBMSXr3XjWC98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=Y0B5Ttpd; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="Y0B5Ttpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779051758; x=1779656558; i=artur.ugnivenko@gmx.de;
	bh=f6KT+t7IuYSpV17+tkUBNi/T3/ucomMtcUKUUwoarqY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y0B5TtpdvwJWLbu1YDGTlU+vQJDf2vmjHkfTHS9+Re092qEAyynDwTYDUWoh0wG7
	 gxnwNGwLEyM1fQsoAiZfnedQdRudZOMcqtw3yyrXiprWK/z7iwIYkbQAQNpgo74xK
	 xHsNLgKLyE0MHWdfPn18QiGJD1eTSsBq7q//SZcINPTHpixDVVaeL+41EzHG/R7py
	 YmiFLXpHAQod9fh9Jp0jpoc2iUQ8pJyeHLVMwnAMuq5FdY7weqML8b0iCkm1iZYV+
	 RzA+QW7Hf+mM7Qya1i5fSOp2Dt1rTOSszINjjsBHkxD0jhJrv0sCyrYrO2jwkWOwc
	 ZRUXscO1dVWL7piCWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlXA-1x7Mlv47mA-00aFoX; Sun, 17
 May 2026 23:02:38 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: ahmet@sezginduran.net
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: clean up style in hal/sdio_halinit.c
Date: Sun, 17 May 2026 23:02:37 +0200
Message-ID: <20260517210237.27136-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <27a0c849-7aba-4ee6-89b6-362e1eb9c43d@sezginduran.net>
References: <27a0c849-7aba-4ee6-89b6-362e1eb9c43d@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xhOdu9CSsNUrjh7rlfJjUIQd3qjQlEuNL1nudW2IUTN76kMcIaq
 X5CVRvO7ALMULy/138BDh3GtjGdjSi3VOOn4Lcvv3Sm163yLY/YoQ90SoGmjpCSdzUaMxeh
 rlzcRhSZVTSXJGxV/gAcrhWk0XeVcCi/tLhiqKdH3hWkdTfE7+g+HG3u+0w4xXmVFSqYUGd
 c17AITByqEPCTcHJheU8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nf3RKlydCEg=;v4oB6RAUv0cxXvHC4+p1oln/nIu
 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
 jg3xLKcbaaC9zSHZd/SFRyhIiBk=

Fix checkpatch style warnings in hal/sdio_halinit.c:
- excessive empty lines
- inconsistent braces in if/else statements
- long lines (very long function calls)

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
Changes in v2: make the patch apply to gregkh/staging-testing

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 133 +++++++++++--------
 1 file changed, 78 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 1e0498268aee..27c5d23662e4 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -21,20 +21,24 @@ static u8 CardEnable(struct adapter *padapter)
 	u8 bMacPwrCtrlOn;
 	u8 ret =3D _FAIL;
=20
-
 	rtw_hal_get_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 	if (!bMacPwrCtrlOn) {
 		/*  RSV_CTRL 0x1C[7:0] =3D 0x00 */
 		/*  unlock ISO/CLK/Power control register */
 		rtw_write8(padapter, REG_RSV_CTRL, 0x0);
=20
-		ret =3D HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK,=
 PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
+		ret =3D HalPwrSeqCmdParsing(padapter,
+					  PWR_CUT_ALL_MSK,
+					  PWR_FAB_ALL_MSK,
+					  PWR_INTF_SDIO_MSK,
+					  rtl8723B_card_enable_flow);
 		if (ret =3D=3D _SUCCESS) {
 			bMacPwrCtrlOn =3D true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 		}
-	} else
+	} else {
 		ret =3D _SUCCESS;
+	}
=20
 	return ret;
 }
@@ -70,7 +74,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
 	value16 =3D rtw_read16(padapter, REG_CR);
-	value16 |=3D (
+	value16 |=3D
 		HCI_TXDMA_EN |
 		HCI_RXDMA_EN |
 		TXDMA_EN |
@@ -78,8 +82,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 		PROTOCOL_EN |
 		SCHEDULE_EN |
 		ENSEC |
-		CALTMR_EN
-	);
+		CALTMR_EN;
 	rtw_write16(padapter, REG_CR, value16);
=20
 	hal_btcoex_PowerOnSetting(padapter);
@@ -105,7 +108,11 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 }
=20
 /* Tx Page FIFO threshold */
-static void _init_available_page_threshold(struct adapter *padapter, u8 n=
umHQ, u8 numNQ, u8 numLQ, u8 numPubQ)
+static void _init_available_page_threshold(struct adapter *padapter,
+					   u8 numHQ,
+					   u8 numNQ,
+					   u8 numLQ,
+					   u8 numPubQ)
 {
 	u16 HQ_threshold, NQ_threshold, LQ_threshold;
=20
@@ -180,15 +187,13 @@ static void _InitTxBufferBoundary(struct adapter *pa=
dapter)
 	rtw_write8(padapter, REG_TDECTRL + 1, txpktbuf_bndy);
 }
=20
-static void _InitNormalChipRegPriority(
-	struct adapter *Adapter,
-	u16 beQ,
-	u16 bkQ,
-	u16 viQ,
-	u16 voQ,
-	u16 mgtQ,
-	u16 hiQ
-)
+static void _InitNormalChipRegPriority(struct adapter *Adapter,
+				       u16 beQ,
+				       u16 bkQ,
+				       u16 viQ,
+				       u16 voQ,
+				       u16 mgtQ,
+				       u16 hiQ)
 {
 	u16 value16 =3D (rtw_read16(Adapter, REG_TRXDMA_CTRL) & 0x7);
=20
@@ -223,10 +228,13 @@ static void _InitNormalChipOneOutEpPriority(struct a=
dapter *Adapter)
 		break;
 	}
=20
-	_InitNormalChipRegPriority(
-		Adapter, value, value, value, value, value, value
-	);
-
+	_InitNormalChipRegPriority(Adapter,
+				   value,
+				   value,
+				   value,
+				   value,
+				   value,
+				   value);
 }
=20
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
@@ -235,7 +243,6 @@ static void _InitNormalChipTwoOutEpPriority(struct ada=
pter *Adapter)
 	struct registry_priv *pregistrypriv =3D &Adapter->registrypriv;
 	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
=20
-
 	u16 valueHi =3D 0;
 	u16 valueLow =3D 0;
=20
@@ -274,7 +281,6 @@ static void _InitNormalChipTwoOutEpPriority(struct ada=
pter *Adapter)
 	}
=20
 	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
-
 }
=20
 static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
@@ -319,8 +325,6 @@ static void _InitQueuePriority(struct adapter *Adapter=
)
 	default:
 		break;
 	}
-
-
 }
=20
 static void _InitPageBoundary(struct adapter *padapter)
@@ -363,7 +367,6 @@ static void _InitWMACSetting(struct adapter *padapter)
 	struct hal_com_data *pHalData;
 	u16 value16;
=20
-
 	pHalData =3D GET_HAL_DATA(padapter);
=20
 	pHalData->ReceiveConfig =3D 0;
@@ -517,7 +520,6 @@ static void _InitOperationMode(struct adapter *padapte=
r)
 	}
=20
 	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
-
 }
=20
 static void _InitInterrupt(struct adapter *padapter)
@@ -560,7 +562,6 @@ static bool HalDetectPwrDownMode(struct adapter *Adapt=
er)
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
 	struct pwrctrl_priv *pwrctrlpriv =3D adapter_to_pwrctl(Adapter);
=20
-
 	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tm=
pvalue);
=20
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
@@ -604,7 +605,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		/* do polling cpwm */
 		start_time =3D jiffies;
 		do {
-
 			mdelay(1);
=20
 			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
@@ -720,8 +720,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 	invalidate_cam_all(padapter);
=20
-	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv.channel,
-		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSE=
T_DONT_CARE);
+	rtw_hal_set_chnl_bw(padapter,
+			    padapter->registrypriv.channel,
+			    CHANNEL_WIDTH_20,
+			    HAL_PRIME_CHNL_OFFSET_DONT_CARE,
+			    HAL_PRIME_CHNL_OFFSET_DONT_CARE);
=20
 	rtl8723b_InitAntenna_Selection(padapter);
=20
@@ -735,7 +738,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/*  set 0x0 to 0xFF by tynli. Default enable HW SEQ NUM. */
 	rtw_write8(padapter, REG_HWSEQ_CTRL, 0xFF);
=20
-
 	/*  */
 	/*  Configure SDIO TxRx Control to enable Rx DMA timer masking. */
 	/*  2010.02.24. */
@@ -744,7 +746,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 	_RfPowerSave(padapter);
=20
-
 	rtl8723b_InitHalDm(padapter);
=20
 	/*  */
@@ -794,7 +795,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 			restore_iqk_rst =3D pwrpriv->bips_processing;
 			b2Ant =3D pHalData->EEPROMBluetoothAntNum =3D=3D Ant_x2;
-			PHY_IQCalibrate_8723B(padapter, false, restore_iqk_rst, b2Ant, pHalDat=
a->ant_path);
+			PHY_IQCalibrate_8723B(padapter,
+					      false,
+					      restore_iqk_rst,
+					      b2Ant,
+					      pHalData->ant_path);
 			pHalData->odmpriv.RFCalibrateInfo.bIQKInitialized =3D true;
=20
 			hal_btcoex_IQKNotify(padapter, false);
@@ -825,7 +830,11 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
adapter)
 	u8 bMacPwrCtrlOn;
=20
 	/*  Run LPS WL RFOFF flow */
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF=
_SDIO_MSK, rtl8723B_enter_lps_flow);
+	HalPwrSeqCmdParsing(padapter,
+			    PWR_CUT_ALL_MSK,
+			    PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK,
+			    rtl8723B_enter_lps_flow);
=20
 	/*	=3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */
=20
@@ -854,7 +863,11 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
adapter)
=20
 	bMacPwrCtrlOn =3D false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF=
_SDIO_MSK, rtl8723B_card_disable_flow);
+	HalPwrSeqCmdParsing(padapter,
+			    PWR_CUT_ALL_MSK,
+			    PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK,
+			    rtl8723B_card_disable_flow);
 }
=20
 u32 rtl8723bs_hal_deinit(struct adapter *padapter)
@@ -866,7 +879,10 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				u8 val8 =3D 0;
=20
 				rtl8723b_set_FwPwrModeInIPS_cmd(padapter, 0x3);
-				/* poll 0x1cc to make sure H2C command already finished by FW; MAC_0x=
1cc =3D 0 means H2C done by FW. */
+				/*
+				 * poll 0x1cc to make sure H2C command already finished by FW;
+				 * MAC_0x1cc =3D 0 means H2C done by FW.
+				 */
 				do {
 					val8 =3D rtw_read8(padapter, REG_HMETFR);
 					cnt++;
@@ -875,12 +891,16 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				/* H2C done, enter 32k */
 				if (val8 =3D=3D 0) {
 					/* set rpwm to enter 32k */
-					val8 =3D rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
+					val8 =3D rtw_read8(padapter,
+							 SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
 					val8 +=3D 0x80;
 					val8 |=3D BIT(0);
-					rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
+					rtw_write8(padapter,
+						   SDIO_LOCAL_BASE | SDIO_REG_HRPWM1,
+						   val8);
 					adapter_to_pwrctl(padapter)->tog =3D (val8 + 0x80) & 0x80;
-					cnt =3D val8 =3D 0;
+					cnt =3D 0;
+					val8 =3D 0;
 					do {
 						val8 =3D rtw_read8(padapter, REG_CR);
 						cnt++;
@@ -908,7 +928,6 @@ void rtl8723bs_init_default_value(struct adapter *pada=
pter)
 {
 	struct hal_com_data *pHalData;
=20
-
 	pHalData =3D GET_HAL_DATA(padapter);
=20
 	rtl8723b_init_default_value(padapter);
@@ -924,7 +943,6 @@ void rtl8723bs_interface_configure(struct adapter *pad=
apter)
 	struct registry_priv *pregistrypriv =3D &padapter->registrypriv;
 	bool bWiFiConfig =3D pregistrypriv->wifi_spec;
=20
-
 	pdvobjpriv->RtOutPipe[0] =3D WLAN_TX_HIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[1] =3D WLAN_TX_MIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[2] =3D WLAN_TX_LOQ_DEVICE_ID;
@@ -976,10 +994,9 @@ static void _ReadRFType(struct adapter *Adapter)
 	pHalData->rf_chip =3D RF_6052;
 }
=20
-
-static void Hal_EfuseParseMACAddr_8723BS(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
+static void Hal_EfuseParseMACAddr_8723BS(struct adapter *padapter,
+					 u8 *hwinfo,
+					 bool AutoLoadFail)
 {
 	struct eeprom_priv *pEEPROM =3D GET_EEPROM_EFUSE_PRIV(padapter);
=20
@@ -991,9 +1008,9 @@ static void Hal_EfuseParseMACAddr_8723BS(
 	}
 }
=20
-static void Hal_EfuseParseBoardType_8723BS(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
+static void Hal_EfuseParseBoardType_8723BS(struct adapter *padapter,
+					   u8 *hwinfo,
+					   bool AutoLoadFail)
 {
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
=20
@@ -1001,8 +1018,9 @@ static void Hal_EfuseParseBoardType_8723BS(
 		pHalData->BoardType =3D (hwinfo[EEPROM_RF_BOARD_OPTION_8723B] & 0xE0) >=
> 5;
 		if (pHalData->BoardType =3D=3D 0xFF)
 			pHalData->BoardType =3D (EEPROM_DEFAULT_BOARD_OPTION & 0xE0) >> 5;
-	} else
+	} else {
 		pHalData->BoardType =3D 0;
+	}
 }
=20
 static void _ReadEfuseInfo8723BS(struct adapter *padapter)
@@ -1070,7 +1088,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *pa=
dapter)
 	if (!padapter->hw_init_completed)
 		_InitPowerOn_8723BS(padapter);
=20
-
 	val8 =3D rtw_read8(padapter, 0x4e);
 	val8 |=3D BIT(6);
 	rtw_write8(padapter, 0x4e, val8);
@@ -1080,8 +1097,14 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *p=
adapter)
 	_ReadPROMContent(padapter);
=20
 	if (!padapter->hw_init_completed) {
-		rtw_write8(padapter, 0x67, 0x00); /*  for BT, Switch Ant control to BT =
*/
-		CardDisableRTL8723BSdio(padapter);/* for the power consumption issue,  =
wifi ko module is loaded during booting, but wifi GUI is off */
+		/* for BT, Switch Ant control to BT */
+		rtw_write8(padapter, 0x67, 0x00);
+
+		/*
+		 * for the power consumption issue, wifi ko module is loaded
+		 * during booting, but wifi GUI is off
+		 */
+		CardDisableRTL8723BSdio(padapter);
 	}
=20
 	return _SUCCESS;
@@ -1175,9 +1198,9 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, =
u8 variable, u8 *pbuf, int l
 /*	Description: */
 /*		Query setting of specified variable. */
 /*  */
-u8 GetHalDefVar8723BSDIO(
-	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
-)
+u8 GetHalDefVar8723BSDIO(struct adapter *Adapter,
+			 enum hal_def_variable eVariable,
+			 void *pValue)
 {
 	u8 bResult =3D _SUCCESS;
=20
=2D-=20
2.54.0

