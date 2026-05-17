Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272A94502F
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779047223; cv=none; b=ZSEsA1KFBNW1gxDMRq/ZdR4LxTPCOo7kVJinOZBvwOI1aPTwbIpLPaxronuymml1z7VbOkuRw+9ru4oa7gp1OCHG8FU5YYpTRRADa9iEfsOqtlLCB9zx/W5UY+9nX5+BjuY6WlKcbKl8sZBU3YJe2ZVYBqzEZqOsUTNCmixv9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779047223; c=relaxed/simple;
	bh=xPCPuXYxQ0aJcAHbNqlfLr0Urb9yYEHaR/4qQBRHPeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hm93vw3RfGZC6Rl99iRZSV8cTDuzPYkbnW1ODztHj94lJU3NdlwArrKS2WJY5ZG+T12Lf+diyNPQMSchF/IGjT1z+/MPzjDcHLQcbAl8nBCOHcl12//B38m9uNErn2iRkMo2MOnz5s5pxvwtKHXgs337/zhPbibzcJAHqJ/aiJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=WDu3hNwc; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="WDu3hNwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779047217; x=1779652017; i=artur.ugnivenko@gmx.de;
	bh=3Tf/aABdhgPnPOp03FZ9pdiNqnt9RMPJHntK9hl6zis=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WDu3hNwciDgpIumv9MBAaT6Y4RdNK/ZEObQDkGSxah2F2IUzKeMo4My9Ptvk6S/A
	 aNr87UdmZ9XHOdOThBDxfSf2fPbR7v0vlZTn5K2OfvBke/UANaKDSER1MjpS0YXLE
	 AXNrmMYlCfitMOmlcDrSfuNrET3ZjwSs36laop5Y0nJPLqX0vBtz2J3pCMPKURJjV
	 kVRgFQowTRITRCYVDrkjmeBOSerEu3W9039AElYPmu1xBAaYtU0Uq6iA7rfDbHrRs
	 F7WiQ3E/BhZWVrLI9sLfCZ6pkp7sq5rDmndm2QHbXlImAHATs1YX9W3mGKxQUx9ZX
	 98KPsXTgj3ROvMc5kQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5QJJ-1wQ4tY20fd-009SfW; Sun, 17
 May 2026 21:46:57 +0200
Date: Sun, 17 May 2026 21:46:55 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: clean up style in hal/sdio_halinit.c
Message-ID: <agobLwfT2OEShgaL@b550aoruselitev2.locadomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:rNrt0Rb2OfgAhbZrJ7s7gvPFZYlR9wmjMZ2I3rLyum0TTMIY4qz
 E3Yai+2+KLq0aK0xTCaGRuqoOelO9FtAmboNoCXSasNOptDcf10/LKMk3iIeaoVstUcom55
 WEP+D5+9/8ArlMNkDne2hC2BREvwe243Ftt0mBFi4oP65waVHlz0YEW8QLCJRwRXTMGJbZc
 +fVHytto4leXCOPrC4zcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o3pHj0I8G3M=;nbCGCEjF7FeqvQVKATnYWQktB4J
 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
 zoDqP2JhCV6EVpQ==
Content-Transfer-Encoding: quoted-printable

Fix checkpatch style warnings in hal/sdio_halinit.c:
- excessive empty lines
- spaces before tabs
- inconsistent braces in if/else statements
- long lines (very long function calls)
- bool comparisons

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 276 +++++++++++--------
 1 file changed, 166 insertions(+), 110 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..2ea991bf8528 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -21,20 +21,26 @@ static u8 CardEnable(struct adapter *padapter)
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
-			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
+			rtw_hal_set_hwreg(padapter,
+					  HW_VAR_APFM_ON_MAC,
+					  &bMacPwrCtrlOn);
 		}
-	} else
+	} else {
 		ret =3D _SUCCESS;
+	}
=20
 	return ret;
 }
@@ -46,8 +52,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	u16 value16;
 	u32 value32;
 	u8 ret;
-/* 	u8 bMacPwrCtrlOn; */
-
+/*	u8 bMacPwrCtrlOn; */
=20
 	/*  all of these MUST be configured before power on */
=20
@@ -70,13 +75,13 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
=20
 	/*  Enable CMD53 R/W Operation */
-/* 	bMacPwrCtrlOn =3D true; */
-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
+/*	bMacPwrCtrlOn =3D true; */
+/*	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
=20
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
 	value16 =3D rtw_read16(padapter, REG_CR);
-	value16 |=3D (
+	value16 |=3D
 		HCI_TXDMA_EN |
 		HCI_RXDMA_EN |
 		TXDMA_EN |
@@ -84,8 +89,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 		PROTOCOL_EN |
 		SCHEDULE_EN |
 		ENSEC |
-		CALTMR_EN
-	);
+		CALTMR_EN;
 	rtw_write16(padapter, REG_CR, value16);
=20
 	hal_btcoex_PowerOnSetting(padapter);
@@ -111,7 +115,11 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
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
@@ -142,14 +150,20 @@ static void _InitQueueReservedPage(struct adapter *p=
adapter)
 	bool bWiFiConfig	=3D pregistrypriv->wifi_spec;
=20
 	if (pHalData->OutEpQueueSel & TX_SELE_HQ)
-		numHQ =3D bWiFiConfig ? WMM_NORMAL_PAGE_NUM_HPQ_8723B : NORMAL_PAGE_NUM=
_HPQ_8723B;
+		numHQ =3D bWiFiConfig
+			? WMM_NORMAL_PAGE_NUM_HPQ_8723B
+			: NORMAL_PAGE_NUM_HPQ_8723B;
=20
 	if (pHalData->OutEpQueueSel & TX_SELE_LQ)
-		numLQ =3D bWiFiConfig ? WMM_NORMAL_PAGE_NUM_LPQ_8723B : NORMAL_PAGE_NUM=
_LPQ_8723B;
+		numLQ =3D bWiFiConfig
+			? WMM_NORMAL_PAGE_NUM_LPQ_8723B
+			: NORMAL_PAGE_NUM_LPQ_8723B;
=20
 	/*  NOTE: This step shall be proceed before writing REG_RQPN. */
 	if (pHalData->OutEpQueueSel & TX_SELE_NQ)
-		numNQ =3D bWiFiConfig ? WMM_NORMAL_PAGE_NUM_NPQ_8723B : NORMAL_PAGE_NUM=
_NPQ_8723B;
+		numNQ =3D bWiFiConfig
+			? WMM_NORMAL_PAGE_NUM_NPQ_8723B
+			: NORMAL_PAGE_NUM_NPQ_8723B;
=20
 	numPubQ =3D TX_TOTAL_PAGE_NUMBER_8723B - numHQ - numLQ - numNQ;
=20
@@ -160,9 +174,11 @@ static void _InitQueueReservedPage(struct adapter *pa=
dapter)
 	value32 =3D _HPQ(numHQ) | _LPQ(numLQ) | _PUBQ(numPubQ) | LD_RQPN;
 	rtw_write32(padapter, REG_RQPN, value32);
=20
-	rtw_hal_set_sdio_tx_max_length(padapter, numHQ, numNQ, numLQ, numPubQ);
+	rtw_hal_set_sdio_tx_max_length(padapter, numHQ,
+				       numNQ, numLQ, numPubQ);
=20
-	_init_available_page_threshold(padapter, numHQ, numNQ, numLQ, numPubQ);
+	_init_available_page_threshold(padapter, numHQ,
+				       numNQ, numLQ, numPubQ);
 }
=20
 static void _InitTxBufferBoundary(struct adapter *padapter)
@@ -186,15 +202,13 @@ static void _InitTxBufferBoundary(struct adapter *pa=
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
@@ -229,10 +243,13 @@ static void _InitNormalChipOneOutEpPriority(struct a=
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
@@ -241,7 +258,6 @@ static void _InitNormalChipTwoOutEpPriority(struct ada=
pter *Adapter)
 	struct registry_priv *pregistrypriv =3D &Adapter->registrypriv;
 	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
=20
-
 	u16 valueHi =3D 0;
 	u16 valueLow =3D 0;
=20
@@ -280,7 +296,6 @@ static void _InitNormalChipTwoOutEpPriority(struct ada=
pter *Adapter)
 	}
=20
 	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
-
 }
=20
 static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
@@ -325,8 +340,6 @@ static void _InitQueuePriority(struct adapter *Adapter=
)
 	default:
 		break;
 	}
-
-
 }
=20
 static void _InitPageBoundary(struct adapter *padapter)
@@ -359,7 +372,7 @@ static void _InitNetworkType(struct adapter *padapter)
 	value32 =3D rtw_read32(padapter, REG_CR);
=20
 	/*  TODO: use the other function to set network type */
-/* 	value32 =3D (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
+/*	value32 =3D (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
 	value32 =3D (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
=20
 	rtw_write32(padapter, REG_CR, value32);
@@ -370,14 +383,19 @@ static void _InitWMACSetting(struct adapter *padapte=
r)
 	struct hal_com_data *pHalData;
 	u16 value16;
=20
-
 	pHalData =3D GET_HAL_DATA(padapter);
=20
 	pHalData->ReceiveConfig =3D 0;
 	pHalData->ReceiveConfig |=3D RCR_APM | RCR_AM | RCR_AB;
-	pHalData->ReceiveConfig |=3D RCR_CBSSID_DATA | RCR_CBSSID_BCN | RCR_AMF;
+	pHalData->ReceiveConfig |=3D
+		RCR_CBSSID_DATA |
+		RCR_CBSSID_BCN |
+		RCR_AMF;
 	pHalData->ReceiveConfig |=3D RCR_HTC_LOC_CTRL;
-	pHalData->ReceiveConfig |=3D RCR_APP_PHYST_RXFF | RCR_APP_ICV | RCR_APP_=
MIC;
+	pHalData->ReceiveConfig |=3D
+		RCR_APP_PHYST_RXFF |
+		RCR_APP_ICV |
+		RCR_APP_MIC;
 	rtw_write32(padapter, REG_RCR, pHalData->ReceiveConfig);
=20
 	/*  Accept all multicast address */
@@ -479,7 +497,8 @@ static void sdio_AggSettingRxUpdate(struct adapter *pa=
dapter)
 	valueRxAggCtrl |=3D RXDMA_AGG_MODE_EN;
 	valueRxAggCtrl |=3D ((aggBurstNum << 2) & 0x0C);
 	valueRxAggCtrl |=3D ((aggBurstSize << 4) & 0x30);
-	rtw_write8(padapter, REG_RXDMA_MODE_CTRL_8723B, valueRxAggCtrl);/* RxAgg=
LowThresh =3D 4*1K */
+	/* RxAggLowThresh =3D 4*1K */
+	rtw_write8(padapter, REG_RXDMA_MODE_CTRL_8723B, valueRxAggCtrl);
 }
=20
 static void _initSdioAggregationSetting(struct adapter *padapter)
@@ -487,7 +506,7 @@ static void _initSdioAggregationSetting(struct adapter=
 *padapter)
 	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
=20
 	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
+/*	sdio_AggSettingTxUpdate(padapter); */
=20
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
@@ -530,7 +549,6 @@ static void _InitOperationMode(struct adapter *padapte=
r)
 	}
=20
 	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
-
 }
=20
 static void _InitInterrupt(struct adapter *padapter)
@@ -573,7 +591,6 @@ static bool HalDetectPwrDownMode(struct adapter *Adapt=
er)
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
 	struct pwrctrl_priv *pwrctrlpriv =3D adapter_to_pwrctl(Adapter);
=20
-
 	EFUSE_ShadowRead(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalu=
e);
=20
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
@@ -596,10 +613,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pHalData =3D GET_HAL_DATA(padapter);
 	pwrctrlpriv =3D adapter_to_pwrctl(padapter);
=20
-	if (
-		adapter_to_pwrctl(padapter)->bips_processing =3D=3D true &&
-		adapter_to_pwrctl(padapter)->pre_ips_type =3D=3D 0
-	) {
+	if (adapter_to_pwrctl(padapter)->bips_processing &&
+	    !adapter_to_pwrctl(padapter)->pre_ips_type) {
 		unsigned long start_time;
 		u8 cpwm_orig, cpwm_now;
 		u8 val8, bMacPwrCtrlOn =3D true;
@@ -619,7 +634,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		/* do polling cpwm */
 		start_time =3D jiffies;
 		do {
-
 			mdelay(1);
=20
 			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
@@ -628,7 +642,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 			if (jiffies_to_msecs(jiffies - start_time) > 100)
 				break;
-
 		} while (1);
=20
 		rtl8723b_set_FwPwrModeInIPS_cmd(padapter, 0);
@@ -641,7 +654,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	}
=20
 	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
+/*	rtw_hal_disable_interrupt(padapter); */
=20
 	ret =3D _InitPowerOn_8723BS(padapter);
 	if (ret =3D=3D _FAIL)
@@ -650,18 +663,18 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	rtw_write8(padapter, REG_EARLY_MODE_CONTROL, 0);
=20
 	ret =3D rtl8723b_FirmwareDownload(padapter, false);
-	if (ret !=3D _SUCCESS) {
+	if (ret =3D=3D _SUCCESS) {
+		padapter->bFWReady =3D true;
+		pHalData->fw_ractrl =3D true;
+	} else {
 		padapter->bFWReady =3D false;
 		pHalData->fw_ractrl =3D false;
 		return ret;
-	} else {
-		padapter->bFWReady =3D true;
-		pHalData->fw_ractrl =3D true;
 	}
=20
 	rtl8723b_InitializeFirmwareVars(padapter);
=20
-/* 	SIC_Init(padapter); */
+/*	SIC_Init(padapter); */
=20
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate =3D rf_off;
@@ -700,10 +713,15 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/*  Joseph Note: Keep RfRegChnlVal for later use. */
 	/*  */
 	pHalData->RfRegChnlVal[0] =3D
-		PHY_QueryRFReg(padapter, (enum rf_path)0, RF_CHNLBW, bRFRegOffsetMask);
+		PHY_QueryRFReg(padapter,
+			       (enum rf_path)0,
+			       RF_CHNLBW,
+			       bRFRegOffsetMask);
 	pHalData->RfRegChnlVal[1] =3D
-		PHY_QueryRFReg(padapter, (enum rf_path)1, RF_CHNLBW, bRFRegOffsetMask);
-
+		PHY_QueryRFReg(padapter,
+			       (enum rf_path)1,
+			       RF_CHNLBW,
+			       bRFRegOffsetMask);
=20
 	/* if (!pHalData->bMACFuncEnable) { */
 	_InitQueueReservedPage(padapter);
@@ -742,13 +760,16 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
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
 	/*  Record original value for template. This is arough data, we can only=
 use the data */
 	/*  for power adjust. The value can not be adjustde according to differe=
nt power!!! */
-/* 	pHalData->OriginalCckTxPwrIdx =3D pHalData->CurrentCckTxPwrIdx; */
-/* 	pHalData->OriginalOfdm24GTxPwrIdx =3D pHalData->CurrentOfdm24GTxPwrId=
x; */
+/*	pHalData->OriginalCckTxPwrIdx =3D pHalData->CurrentCckTxPwrIdx; */
+/*	pHalData->OriginalOfdm24GTxPwrIdx =3D pHalData->CurrentOfdm24GTxPwrIdx=
; */
=20
 	rtl8723b_InitAntenna_Selection(padapter);
=20
@@ -762,7 +783,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/*  set 0x0 to 0xFF by tynli. Default enable HW SEQ NUM. */
 	rtw_write8(padapter, REG_HWSEQ_CTRL, 0xFF);
=20
-
 	/*  */
 	/*  Configure SDIO TxRx Control to enable Rx DMA timer masking. */
 	/*  2010.02.24. */
@@ -771,7 +791,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 	_RfPowerSave(padapter);
=20
-
 	rtl8723b_InitHalDm(padapter);
=20
 	/*  */
@@ -789,9 +808,12 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_NAV_UPPER, (u8 *)&NavUpper);
=20
 	/* ack for xmit mgmt frames. */
-	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_T=
XQ_CTRL) | BIT(12));
+	rtw_write32(padapter,
+		    REG_FWHW_TXQ_CTRL,
+	rtw_read32(padapter,
+		   REG_FWHW_TXQ_CTRL) | BIT(12));
=20
-/* 	pHalData->PreRpwmVal =3D SdioLocalCmd52Read1Byte(padapter, SDIO_REG_H=
RPWM1) & 0x80; */
+/*	pHalData->PreRpwmVal =3D SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HR=
PWM1) & 0x80; */
=20
 	{
 		pwrctrlpriv->rf_pwrstate =3D rf_on;
@@ -809,7 +831,10 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 			/* Inform WiFi FW that it is the beginning of IQK */
 			h2cCmdBuf =3D 1;
-			FillH2CCmd8723B(padapter, H2C_8723B_BT_WLAN_CALIBRATION, 1, &h2cCmdBuf=
);
+			FillH2CCmd8723B(padapter,
+					H2C_8723B_BT_WLAN_CALIBRATION,
+					1,
+					&h2cCmdBuf);
=20
 			start_time =3D jiffies;
 			do {
@@ -823,14 +848,21 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
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
=20
 			/* Inform WiFi FW that it is the finish of IQK */
 			h2cCmdBuf =3D 0;
-			FillH2CCmd8723B(padapter, H2C_8723B_BT_WLAN_CALIBRATION, 1, &h2cCmdBuf=
);
+			FillH2CCmd8723B(padapter,
+					H2C_8723B_BT_WLAN_CALIBRATION,
+					1,
+					&h2cCmdBuf);
=20
 			ODM_TXPowerTrackingCheck(&pHalData->odmpriv);
 		}
@@ -844,7 +876,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 /*  */
 /*  Description: */
-/* 	RTL8723e card disable power sequence v003 which suggested by Scott. *=
/
+/*	RTL8723e card disable power sequence v003 which suggested by Scott. */
 /*  */
 /*  First created by tynli. 2011.01.28. */
 /*  */
@@ -854,9 +886,13 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
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
-	/* 	=3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */
+	/*      =3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */
=20
 	val =3D rtw_read8(padapter, REG_MCUFWDL);
 	if ((val & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
@@ -879,11 +915,15 @@ static void CardDisableRTL8723BSdio(struct adapter *=
padapter)
 	val |=3D BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
=20
-	/* 	=3D=3D=3D=3D Reset digital sequence end =3D=3D=3D=3D=3D=3D */
+	/*	=3D=3D=3D=3D Reset digital sequence end =3D=3D=3D=3D=3D=3D */
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
@@ -895,7 +935,11 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				u8 val8 =3D 0;
=20
 				rtl8723b_set_FwPwrModeInIPS_cmd(padapter, 0x3);
-				/* poll 0x1cc to make sure H2C command already finished by FW; MAC_0x=
1cc =3D 0 means H2C done by FW. */
+				/*
+				 * poll 0x1cc to make sure H2C command already
+				 * finished by FW; MAC_0x1cc =3D 0 means H2C done
+				 * by FW.
+				 */
 				do {
 					val8 =3D rtw_read8(padapter, REG_HMETFR);
 					cnt++;
@@ -904,12 +948,17 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				/* H2C done, enter 32k */
 				if (val8 =3D=3D 0) {
 					/* set rpwm to enter 32k */
-					val8 =3D rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
+					val8 =3D rtw_read8(padapter,
+							 SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
 					val8 +=3D 0x80;
 					val8 |=3D BIT(0);
-					rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
-					adapter_to_pwrctl(padapter)->tog =3D (val8 + 0x80) & 0x80;
-					cnt =3D val8 =3D 0;
+					rtw_write8(padapter,
+						   SDIO_LOCAL_BASE | SDIO_REG_HRPWM1,
+						   val8);
+					adapter_to_pwrctl(padapter)->tog =3D
+						(val8 + 0x80) & 0x80;
+					cnt =3D 0;
+					val8 =3D 0;
 					do {
 						val8 =3D rtw_read8(padapter, REG_CR);
 						cnt++;
@@ -937,7 +986,6 @@ void rtl8723bs_init_default_value(struct adapter *pada=
pter)
 {
 	struct hal_com_data *pHalData;
=20
-
 	pHalData =3D GET_HAL_DATA(padapter);
=20
 	rtl8723b_init_default_value(padapter);
@@ -953,7 +1001,6 @@ void rtl8723bs_interface_configure(struct adapter *pa=
dapter)
 	struct registry_priv *pregistrypriv =3D &padapter->registrypriv;
 	bool bWiFiConfig =3D pregistrypriv->wifi_spec;
=20
-
 	pdvobjpriv->RtOutPipe[0] =3D WLAN_TX_HIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[1] =3D WLAN_TX_MIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[2] =3D WLAN_TX_LOQ_DEVICE_ID;
@@ -981,13 +1028,13 @@ void rtl8723bs_interface_configure(struct adapter *=
padapter)
 }
=20
 /*  */
-/* 	Description: */
-/* 		We should set Efuse cell selection to WiFi cell in default. */
+/*	Description: */
+/*		We should set Efuse cell selection to WiFi cell in default. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL */
+/*	Assumption: */
+/*		PASSIVE_LEVEL */
 /*  */
-/* 	Added by Roger, 2010.11.23. */
+/*	Added by Roger, 2010.11.23. */
 /*  */
 static void _EfuseCellSel(struct adapter *padapter)
 {
@@ -1005,10 +1052,9 @@ static void _ReadRFType(struct adapter *Adapter)
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
@@ -1016,13 +1062,15 @@ static void Hal_EfuseParseMACAddr_8723BS(
 		eth_random_addr(pEEPROM->mac_addr);
 	} else {
 		/* Read Permanent MAC address */
-		memcpy(pEEPROM->mac_addr, &hwinfo[EEPROM_MAC_ADDR_8723BS], ETH_ALEN);
+		memcpy(pEEPROM->mac_addr,
+		       &hwinfo[EEPROM_MAC_ADDR_8723BS],
+		       ETH_ALEN);
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
@@ -1030,8 +1078,9 @@ static void Hal_EfuseParseBoardType_8723BS(
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
@@ -1073,24 +1122,24 @@ static void _ReadEfuseInfo8723BS(struct adapter *p=
adapter)
 static void _ReadPROMContent(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM =3D GET_EEPROM_EFUSE_PRIV(padapter);
-	u8 	eeValue;
+	u8 eeValue;
=20
 	eeValue =3D rtw_read8(padapter, REG_9346CR);
 	/*  To check system boot selection. */
 	pEEPROM->EepromOrEfuse =3D (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag =3D (eeValue & EEPROM_EN) ? false : true;
=20
-/* 	pHalData->EEType =3D IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EE=
PROM_BOOT_EFUSE; */
+/*	pHalData->EEType =3D IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEP=
ROM_BOOT_EFUSE; */
=20
 	_ReadEfuseInfo8723BS(padapter);
 }
=20
 /*  */
-/* 	Description: */
-/* 		Read HW adapter information by E-Fuse or EEPROM according CR9346 rep=
orted. */
+/*	Description: */
+/*		Read HW adapter information by E-Fuse or EEPROM according CR9346 repo=
rted. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL (SDIO interface) */
+/*	Assumption: */
+/*		PASSIVE_LEVEL (SDIO interface) */
 /*  */
 /*  */
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
@@ -1101,7 +1150,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *pa=
dapter)
 	if (!padapter->hw_init_completed)
 		_InitPowerOn_8723BS(padapter);
=20
-
 	val8 =3D rtw_read8(padapter, 0x4e);
 	val8 |=3D BIT(6);
 	rtw_write8(padapter, 0x4e, val8);
@@ -1111,8 +1159,13 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *p=
adapter)
 	_ReadPROMContent(padapter);
=20
 	if (!padapter->hw_init_completed) {
-		rtw_write8(padapter, 0x67, 0x00); /*  for BT, Switch Ant control to BT =
*/
-		CardDisableRTL8723BSdio(padapter);/* for the power consumption issue,  =
wifi ko module is loaded during booting, but wifi GUI is off */
+		/*  for BT, Switch Ant control to BT */
+		rtw_write8(padapter, 0x67, 0x00);
+		/*
+		 * for the power consumption issue, wifi ko module is loaded
+		 * during booting, but wifi GUI is off
+		 */
+		CardDisableRTL8723BSdio(padapter);
 	}
=20
 	return _SUCCESS;
@@ -1191,7 +1244,10 @@ void GetHwReg8723BS(struct adapter *padapter, u8 va=
riable, u8 *val)
 	}
 }
=20
-void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf=
, int len)
+void SetHwRegWithBuf8723B(struct adapter *padapter,
+			  u8 variable,
+			  u8 *pbuf,
+			  int len)
 {
 	switch (variable) {
 	case HW_VAR_C2H_HANDLE:
@@ -1203,14 +1259,14 @@ void SetHwRegWithBuf8723B(struct adapter *padapter=
, u8 variable, u8 *pbuf, int l
 }
=20
 /*  */
-/* 	Description: */
-/* 		Query setting of specified variable. */
+/*	Description: */
+/*		Query setting of specified variable. */
 /*  */
-u8 GetHalDefVar8723BSDIO(
-	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
-)
+u8 GetHalDefVar8723BSDIO(struct adapter *Adapter,
+			 enum hal_def_variable eVariable,
+			 void *pValue)
 {
-	u8 	bResult =3D _SUCCESS;
+	u8 bResult =3D _SUCCESS;
=20
 	switch (eVariable) {
 	case HAL_DEF_IS_SUPPORT_ANT_DIV:
=2D-=20
2.54.0

