Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA343DA5D
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194952; cv=none; b=ERt1JQqM1GYtaMBvjm9Kbf3tiWOvaRS1RC+G1Oxs1gEf9MlWh/NVCyKt8XGNZxcwi+zJquU73T7DNJVU6wj3HwJZG5jf1jRqIb4VLM7F9KvriCIywiYtZR3iQScXQRfJwt1b8Md4uCFH2ql8UWUfuY54QK3AW0+mnFTXGFmpnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194952; c=relaxed/simple;
	bh=zVZnzsPQcDKsldi4Ge/Fd5YdQsDWXr3AfwB7FlZg608=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CpkCF8FcPlR1o4JTLjhcPePf6uDVZ+FeXKUKDTQYDDLrp3ZwYDklHOiZMpmzkPKzze5sfCsxnSJjaJTyNmynAMQ/Z0/UHuylrGSzwWFPRXGOBRjRTfZ7aGPqG0ZYL5XQJeDfri7NbfR5Y8zxGB9Yo6G24ToeMYURHB7XyyqsmJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYYlGnkd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYYlGnkd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac10e337so66337105e9.3
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194949; x=1781799749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVBaSPxaQ+AVKf+qjEaeDOGtApiaPw0Z3OfNOLWUodk=;
        b=oYYlGnkdj2XV9vb38s361hKk/9ArffO9R6+1X2/FgBpT9MOTMNrKGb7MoBozbA/vnU
         YQNGIQQKoCXrJEQur6pkqTRpeO1pNtQQ3zxufeupIYYSq422z8HtoS2B33EmSjTSVIZg
         yQjGV82ohsXgCMy8/9iibMPyk0DMBRwwT2eJ4A4YmNkRizXxhnTXoiJQXtjSY+b7mWXR
         mnJYKfHouN0WAxpzCfgY/QE3GWJ6Em7P8hD+6jatZC/2BdldWuTqaYy/5757nz7GEGaT
         Bz9FivYudOVa0fQSi+y+cabUR/lyMWja+UWYg3hhMxN60tzIvzfUwp2BlUUpeUdTgmHE
         RssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194949; x=1781799749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVBaSPxaQ+AVKf+qjEaeDOGtApiaPw0Z3OfNOLWUodk=;
        b=JP9OWV9+GcpFr5R+d3EjgAg8kjCaAHaDjHnffRkarZPq9yEdo1+JkZe3p8YvKfE0gw
         DbsmaDWeoTSECVFH8JN8p4ZVghfWNsbQSVFGXVsVxY/ddc4EOTzrFbn1rMmggxSs+dpi
         yF3fimPWvrgzhT3KcYUK7uOW/sLzhv+0L1504vn8lrZPR5LPCwiLlJHijKzTJyYahM3x
         ytleuhlgORbCbIYX9rBOOTs6Fp8Evoc2ABiDdbN7oTSllhjQSVHm9rmv8GUsXsb/yf+t
         3TIXBpuVkQLmm4ClTjk/ZCin3uj8cy6+WTjOo+eQbUG9n/u8pKLXOp1DjTe3V/nbcxFg
         ifQA==
X-Gm-Message-State: AOJu0YxidOqz9c0z0k3lBDRGrFFe0RZcbnoL+D5W3Da++rECKxAY2a4C
	utaUGro0LxdtuD8nrrH9EqC6BvVGDK4GH0VAOCfqG4CFnhR69kZrpN3Z
X-Gm-Gg: Acq92OFvbevO27HucV37QtcIOQQiN0SDhKS2euVnz0gBC+nzRodPT5ekaqyA20OuNlJ
	F1QAak3FneSq9/VUoLUDwBDIBYIf0ZobOCt8GpM0HCq0aF69q0iOTfoXSPPEIpUhPNFP9V3kTed
	VNefO8Es1/GD7NuMNHyA5Ub2H544XoIOOH9WhWzYMGAX8FjIqd7gEqw2FzuHm7LyrBVu3fN9xsG
	FDEaDRjgVCJPMUMvvguwHxx1hog7Yg4UJ9oOrIT32E2NeUksZsxnRE1m8pIpnKVOx0zYpPKjQT0
	0mOSAeu/6pEZ/geGjdlwSDIsEnVaGbtMM0JzW5nWSFFKdsbVfSgSppfCtMmonV3EkrmNrQ+iPkc
	HytZRoAn4vbNCjSvn1ZZ7R5bSHSpJYloJPCuuszJ4MCXr8zav+Cm7cAMbTPBU6YomWxI8BA+4l2
	eC2Qs/l3Ism67/s2nVKavjYnCS2zKW3hyGXRzW
X-Received: by 2002:a05:600c:4f95:b0:490:e1e6:cb69 with SMTP id 5b1f17b1804b1-490e55b6e51mr47793865e9.7.1781194948971;
        Thu, 11 Jun 2026 09:22:28 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:ac27:e02b:2f26:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e46a75c8sm70344585e9.2.2026.06.11.09.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:22:28 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH 1/9] staging: rtl8723bs: hal: fix whitespace in sdio_halinit.c
Date: Thu, 11 Jun 2026 17:21:20 +0100
Message-ID: <20260611162128.57870-1-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 54 ++++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..694cd4eca970 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -46,7 +46,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	u16 value16;
 	u32 value32;
 	u8 ret;
-/* 	u8 bMacPwrCtrlOn; */
+/*	u8 bMacPwrCtrlOn; */
 
 
 	/*  all of these MUST be configured before power on */
@@ -70,8 +70,8 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
 	/*  Enable CMD53 R/W Operation */
-/* 	bMacPwrCtrlOn = true; */
-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
+/*	bMacPwrCtrlOn = true; */
+/*	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
 
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
@@ -359,7 +359,7 @@ static void _InitNetworkType(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_CR);
 
 	/*  TODO: use the other function to set network type */
-/* 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
+/*	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
 
 	rtw_write32(padapter, REG_CR, value32);
@@ -487,7 +487,7 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
 	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
+/*	sdio_AggSettingTxUpdate(padapter); */
 
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
@@ -641,7 +641,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	}
 
 	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
+/*	rtw_hal_disable_interrupt(padapter); */
 
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
@@ -661,7 +661,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitializeFirmwareVars(padapter);
 
-/* 	SIC_Init(padapter); */
+/*	SIC_Init(padapter); */
 
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
@@ -747,8 +747,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	/*  Record original value for template. This is arough data, we can only use the data */
 	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
+/*	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
+/*	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
 
 	rtl8723b_InitAntenna_Selection(padapter);
 
@@ -791,7 +791,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
-/* 	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
+/*	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
 
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
@@ -844,7 +844,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 /*  */
 /*  Description: */
-/* 	RTL8723e card disable power sequence v003 which suggested by Scott. */
+/*	RTL8723e card disable power sequence v003 which suggested by Scott. */
 /*  */
 /*  First created by tynli. 2011.01.28. */
 /*  */
@@ -856,7 +856,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	/*  Run LPS WL RFOFF flow */
 	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
-	/* 	==== Reset digital sequence   ====== */
+	/*	==== Reset digital sequence   ====== */
 
 	val = rtw_read8(padapter, REG_MCUFWDL);
 	if ((val & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
@@ -879,7 +879,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	val |= BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 
-	/* 	==== Reset digital sequence end ====== */
+	/*	==== Reset digital sequence end ====== */
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -981,13 +981,13 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
 }
 
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
@@ -1073,24 +1073,24 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 static void _ReadPROMContent(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u8 	eeValue;
+	u8	eeValue;
 
 	eeValue = rtw_read8(padapter, REG_9346CR);
 	/*  To check system boot selection. */
 	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
 
-/* 	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
+/*	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
 
 	_ReadEfuseInfo8723BS(padapter);
 }
 
 /*  */
-/* 	Description: */
-/* 		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
+/*	Description: */
+/*		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL (SDIO interface) */
+/*	Assumption: */
+/*		PASSIVE_LEVEL (SDIO interface) */
 /*  */
 /*  */
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
@@ -1203,14 +1203,14 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
 }
 
 /*  */
-/* 	Description: */
-/* 		Query setting of specified variable. */
+/*	Description: */
+/*		Query setting of specified variable. */
 /*  */
 u8 GetHalDefVar8723BSDIO(
 	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
 )
 {
-	u8 	bResult = _SUCCESS;
+	u8	bResult = _SUCCESS;
 
 	switch (eVariable) {
 	case HAL_DEF_IS_SUPPORT_ANT_DIV:
-- 
2.43.0

