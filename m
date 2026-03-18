Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEA3175A91
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799817; cv=none; b=JeN99KFuERdPmtOnVrClvC/icPU7shxT2I2jpMaZS64ldIBXx9fGMjo/7hq90FvORqVHc+vKa1ZgtXesOpjKFr3x2MNS1Ajc/uMdwHSQ24opRqr6pBeEO8UKICH3TrBcmeA8x/+co18plVbWwknwbJMR9/LG8/JQSyAY66hUI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799817; c=relaxed/simple;
	bh=4O53qfF/IbTPc+o2SNdhd96beWrfWs30IF47/bDTI3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hsEbm8g4wgo3e/2+zsQu62oUc4gsdoapONkadI93A0uj2WfGiPmPULmK7BH5Fp8fL24Zs2HOdRpPOJBFyRyhpesN8FDw56xjAz2gs30Ptm2U9gQGmjAGOPwHSvtIbk/Jlb0wkMMA24BU3XCvo9Jec6X2Za+5ycL8uROAMhdHAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwiyUtZM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwiyUtZM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so4000864b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 19:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773799816; x=1774404616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wZF45FPlZkKXx7FWrcZ0HH07OhL9LF0KsZg6tSsoZIE=;
        b=MwiyUtZM777DGeO3P7zBsejfb+ckytbjgN/mSdBqJav2TsVq3JvSaCafp00DuTPQ7o
         brwovj+Zj0cT/4LrvbcRWVoz/TTVr00qnuoQSAKuhY0Zv2WZz+Z+RUw1dZwQ3ycr46C5
         Sz4enSKV+PVr4DgkjmeQgrDW9uFD2zuvbZncIozyxLFNMMf73xrzkdkWKQr+crpIAaUq
         yTQ1vkjPqzHIiTnsj5revlcFGEvrospUSUAcg2DJZjj2j3S/qep6HzA2OZXzmapgcH8d
         RFPao3kokD2xlWm3VniLdsVxszppFhs71o2PFCDtmxoL/FRQu25qs2tOOegva3co3zut
         4sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773799816; x=1774404616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZF45FPlZkKXx7FWrcZ0HH07OhL9LF0KsZg6tSsoZIE=;
        b=ESpZMfhubAmF1bl4JbO6SdvxsHeluKH6ueKoTih8Dv+6m5RPg5d4xSllDFxqNbi229
         AB1zvkPVbxnYy6DKMc5SsvxSjQo+e4r/DjEutENifejAXYjZuQK3u7ta1bvwlQ3/oOuQ
         YuF6BKDcX1c0E+aoaGTzcp7tArGkUxJXFQ6r0rUAlzADLRMd2k3QixESIL165zEPrI7j
         gydZpMDrAWQ9ezP8UqDAPLnC0uYd5KU+jebLNhsvj8F/NoL9Vlmctl4tC/n2C6fh07TG
         NMX6xeVKmsNDdOEmy/q+FpNV5QpBreADI3nu5wfDRVPrJgE22tv/zMY0qhTR/4gaZH2R
         WRvQ==
X-Gm-Message-State: AOJu0Yw9OIcJF2LWtOr+EUm6MAFETQTNOrIHwoPZ09hq2PR+BFnrRtML
	ogB52/Ghhnqm4e7kERIRIAItyzeRpMLTak+AZXHgt9SZ5j2QfuhfglEg
X-Gm-Gg: ATEYQzxviniB0O9SOHhbRjAns7gSZI9DSx+DjSjVjOJLZQ39mkrc96vwxQWx5ySQ7Ox
	Zu6x7UAhIf70IvfDtkZAtKE6AJM/NIosHHyY9BMMpX4nFWTziqlsCX6YvDs0Vl15K0e5pJCE5sS
	Vve+4DRzW4ZnwoAjBFfsh88f9zIdXsxvwKF4F44xqenowOkzfdxQU/CchrI1lypu/0u/2aUYgaF
	uRY8VE4WjcZJS7JkP+xIUnwXti9eEtH6xbe8GSMQ2tCfV1Fi2phlE+c68F6BM2K7Fx4pbwTKNg9
	f3qtjg04ypboCe/ubmYX3mHiQdWeXRGiAVPghqcq/1zQ0PZH86XqMpMHa02oyoJWYnB0rIJcyZN
	34Bqv4HFb/FbzFrjNMZ12WVVPi8dkmOC19iYtubEQYj3IymigTmGocM9F2AIDyCJ1s3p2AH02go
	lHwADauYNdHloDVi8OD6Gxqiwsl2QZL3gczq89
X-Received: by 2002:a05:6a00:8583:b0:82a:6cb6:2e79 with SMTP id d2e1a72fcca58-82a6cb63162mr895256b3a.60.1773799815853;
        Tue, 17 Mar 2026 19:10:15 -0700 (PDT)
Received: from aadarsh.lan ([2409:4090:801b:f416:baba:6c3a:26ad:b5b5])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82a6bef2ab1sm840537b3a.55.2026.03.17.19.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 19:10:15 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	lukagejak5@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fixed the trailing whitespaces/commented code
Date: Wed, 18 Mar 2026 07:40:05 +0530
Message-ID: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed the warnings,reported by checkpatch in
drivers/staging/rtl8723bs/hal/sdio_halinit.c

It mainly included the leading whitespace errors and commented line
of codes, deleted those lines rebuild the module and it didn't produced
any errors. one warning remains, fixing it breaks the logic.

Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 54 ++++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index e32f051ed415..70a5213ae52a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -46,7 +46,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	u16 value16;
 	u32 value32;
 	u8 ret;
-/* 	u8 bMacPwrCtrlOn; */
+
 
 
 	/*  all of these MUST be configured before power on */
@@ -70,8 +70,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
 	/*  Enable CMD53 R/W Operation */
-/* 	bMacPwrCtrlOn = true; */
-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
 
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
@@ -214,6 +212,7 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	u16 value = 0;
+
 	switch (pHalData->OutEpQueueSel) {
 	case TX_SELE_HQ:
 		value = QUEUE_HIGH;
@@ -341,6 +340,7 @@ static void _InitTransferPageSize(struct adapter *padapter)
 	/*  Tx page size is always 128. */
 
 	u8 value8;
+
 	value8 = _PSRX(PBP_128) | _PSTX(PBP_128);
 	rtw_write8(padapter, REG_PBP, value8);
 }
@@ -357,7 +357,6 @@ static void _InitNetworkType(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_CR);
 
 	/*  TODO: use the other function to set network type */
-/* 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
 
 	rtw_write32(padapter, REG_CR, value32);
@@ -485,7 +484,7 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
 	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
+/*	sdio_AggSettingTxUpdate(padapter); */
 
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
@@ -639,7 +638,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	}
 
 	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
+/*	rtw_hal_disable_interrupt(padapter); */
 
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
@@ -659,7 +658,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitializeFirmwareVars(padapter);
 
-/* 	SIC_Init(padapter); */
+/*	SIC_Init(padapter); */
 
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
@@ -745,8 +744,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	/*  Record original value for template. This is arough data, we can only use the data */
 	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
+/*	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
+/*	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
 
 	rtl8723b_InitAntenna_Selection(padapter);
 
@@ -789,7 +788,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
-/* 	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
+/*	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
 
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
@@ -842,7 +841,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 /*  */
 /*  Description: */
-/* 	RTL8723e card disable power sequence v003 which suggested by Scott. */
+/*  RTL8723e card disable power sequence v003 which suggested by Scott. */
 /*  */
 /*  First created by tynli. 2011.01.28. */
 /*  */
@@ -854,7 +853,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	/*  Run LPS WL RFOFF flow */
 	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
-	/* 	==== Reset digital sequence   ====== */
+	/*	==== Reset digital sequence   ====== */
 
 	val = rtw_read8(padapter, REG_MCUFWDL);
 	if ((val & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
@@ -877,7 +876,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	val |= BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 
-	/* 	==== Reset digital sequence end ====== */
+	/*	==== Reset digital sequence end ====== */
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -979,13 +978,13 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
 }
 
 /*  */
-/* 	Description: */
-/* 		We should set Efuse cell selection to WiFi cell in default. */
+/*	Description: */
+/*	We should set Efuse cell selection to WiFi cell in default. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL */
+/*	Assumption: */
+/*	PASSIVE_LEVEL */
 /*  */
-/* 	Added by Roger, 2010.11.23. */
+/*	Added by Roger, 2010.11.23. */
 /*  */
 static void _EfuseCellSel(struct adapter *padapter)
 {
@@ -1071,24 +1070,24 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 static void _ReadPROMContent(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u8 	eeValue;
+	u8 eeValue;
 
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
+/*	Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL (SDIO interface) */
+/*	Assumption: */
+/*	PASSIVE_LEVEL (SDIO interface) */
 /*  */
 /*  */
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
@@ -1147,6 +1146,7 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_SET_REQ_FW_PS:
 		{
 			u8 req_fw_ps = 0;
+
 			req_fw_ps = rtw_read8(padapter, 0x8f);
 			req_fw_ps |= 0x10;
 			rtw_write8(padapter, 0x8f, req_fw_ps);
@@ -1200,14 +1200,14 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
 }
 
 /*  */
-/* 	Description: */
-/* 		Query setting of specified variable. */
+/*	Description: */
+/*	Query setting of specified variable. */
 /*  */
 u8 GetHalDefVar8723BSDIO(
 	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
 )
 {
-	u8 	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (eVariable) {
 	case HAL_DEF_IS_SUPPORT_ANT_DIV:
-- 
2.43.0

