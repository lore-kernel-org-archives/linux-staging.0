Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3512E5B1B
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 21:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775943623; cv=none; b=CX7ydFHLDcCKYnw1VvoVudIfjktNBBGWObjezueqD/DWkXcet3N9o+jw7Uv3aTugkW+BYpZ315HWbibbI6+YjCjb1btcnTBfGRGj9e4TOSSFJivqnU7WLO6lob4vStVJxV15lr8dxzW69J20XoBy5Sj+4u1aYSGZPIt+R6bR0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775943623; c=relaxed/simple;
	bh=YoSQp4LrKr+qUNJRbodMA81pLII/gVT2JIpM0q+FcRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnmU2qxOa7wz44pS/l8Nk/bxS/WchBzVCQTZH/p5hIfFzn4QDVdSXS0uLnP/gkmcCHwYCxlMrMkrRndcj7xWOKNtwd6EL1QbGTUPBKn83MSFxRDbCUDHLxf5I4ipnczWRUTDBqW0M97QYATYYsX6uJiGpFpUJrpycuxxtkPd9w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kD6GX+zG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kD6GX+zG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso33998365e9.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775943620; x=1776548420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvLqCyWZGzMZoHFxMXJ8nqRBqB0xnX5/Kv5cgG3ucTA=;
        b=kD6GX+zG6NZ5BrtSewTQvTPfNkol7vAr0rUQDVs/8LhG5NZtHrqoHEBEaHErM3Pf9S
         LEU9AYu/RZaV9ZCgRsi/4dC4GLt6zR6SSH6Nq/LT9E4dWqfm6RefnX0N2nABAVxkrWEN
         Tt67q+ToxFxZ8yUC08D7wdKshIEUT0p8nDnrXgzN58DnXkjpZxJB5WG5nlXPLdDLEZMs
         a66oiBg8Ja+JeL0KjZv13RPGllC4axUuq1d6HeZ4Uh8+BuBAZ9cOiMJLTDQqBWFP50kD
         64cyBcSBGtXdiL1DYQQCCP62Hu9R/uDQo4w6KxN9pzDRj1mwMVMDNkG75MdOQ0eCPij3
         9dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775943620; x=1776548420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvLqCyWZGzMZoHFxMXJ8nqRBqB0xnX5/Kv5cgG3ucTA=;
        b=mJds37cyKPfEtjBrO5zM+cdLZLhAD+O6gEvi8xmHLlJI23JuRrKZLlLRX21ypLFkMj
         cJZ9qFU8DSWTKDUsXJJ4j66yN9jLM46k+WiFbOEhGrS5H7V8F+OBTs4Hq4UiRUfGlTn9
         vVLfVnfU4zkB3YxJGI28Zb67gdGgLHicqJilPSZRrJp1HfSf5wklUNUsNbMZ4EHCUAku
         b2ufzpQk+CLTLL5ejKvUbNGG4wkxCEziGawG51Hk3r7MqOdeKDRkErHslvPhwMNsu8M+
         ElWp4AF+lnB4SM+mfoDkH1aA3fmdx/bMAfBqaaSk+30jtI4uK8J6d+xXmpEj0ygk0/Yt
         tGBw==
X-Gm-Message-State: AOJu0YwZFFuae/z2Bl/ka0PGd6iNK/snffK4R89woJniUtZ2BcOdxQv6
	wyQzPo1CLI7OYHqNs3qQHeVI46Rj2XcWN34/geQR49bKwYyutx2m37Gp
X-Gm-Gg: AeBDieuv5Si0dyhwmzroDD58SQdMZijFeEerJaYtHTfc8CnPs/1mTrzpwZL3kCIAr1P
	3jruSUX0qdX9tDMupFlJOrrpi3oY/9WiZ0yNxks5H4oqGMijdevJ4rO2hIdCuZ2qGZpZHAUwP1z
	zWObpkHM8qOUBzzBlxaLJIs9LM+Y+4Z4IJNs3oiyoTZxF8/WBhJCZyBlEpIjm9naahW4+NEiOxN
	D16hzl0a3oi/nyS51DxLMb7qcJNGS05InNX3UKn2irFpdj1EvEp8IbKSWJb3AqfoBtjzjzRIXFz
	MyTeo07U+YKUNQcjQsAada9KN2NvVjeWTIYozImrTAxXmlUBgKEN0Q7AetzCenII4YMErPEwD5Q
	cyYLF73lfknR87Ufa4NNQ5aIo6QVB1uNER2M7gaNzJbP78njgF7nb/AzgJX9C23cDmQSo4Hc/Ry
	aH7dJbnPDmDGwpmDeKM6PZwmIsiYr6lXzfLdTxy41Az/yt+N27eIjagS1atWAghkmTE69iiEUE6
	y2+y6pVqHnx
X-Received: by 2002:a05:600c:a010:b0:488:aa3d:faca with SMTP id 5b1f17b1804b1-488d68af250mr111040385e9.18.1775943619639;
        Sat, 11 Apr 2026 14:40:19 -0700 (PDT)
Received: from fedora ([2a00:23c5:4a5d:3701:b24c:c1d6:5c61:a2ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684406bsm51649165e9.24.2026.04.11.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:40:19 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: Michael Straube <straube.linux@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: fix coding style issues in sdio_halinit.c
Date: Sat, 11 Apr 2026 22:40:00 +0100
Message-ID: <20260411214001.8849-1-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs and add missing empty lines after
variable declarations

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 58 +++++++++++---------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0fa1b22fdf9a..81b6025fa8d9 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -31,6 +31,7 @@ static u8 CardEnable(struct adapter *padapter)
 		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
 		if (ret == _SUCCESS) {
 			u8 bMacPwrCtrlOn = true;
+
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 		}
 	} else
@@ -46,7 +47,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	u16 value16;
 	u32 value32;
 	u8 ret;
-/* 	u8 bMacPwrCtrlOn; */
+/*	u8 bMacPwrCtrlOn; */
 
 
 	/*  all of these MUST be configured before power on */
@@ -70,8 +71,8 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
 	/*  Enable CMD53 R/W Operation */
-/* 	bMacPwrCtrlOn = true; */
-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
+/*	bMacPwrCtrlOn = true; */
+/*	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
 
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
@@ -214,6 +215,7 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	u16 value = 0;
+
 	switch (pHalData->OutEpQueueSel) {
 	case TX_SELE_HQ:
 		value = QUEUE_HIGH;
@@ -341,6 +343,7 @@ static void _InitTransferPageSize(struct adapter *padapter)
 	/*  Tx page size is always 128. */
 
 	u8 value8;
+
 	value8 = _PSRX(PBP_128) | _PSTX(PBP_128);
 	rtw_write8(padapter, REG_PBP, value8);
 }
@@ -357,7 +360,7 @@ static void _InitNetworkType(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_CR);
 
 	/*  TODO: use the other function to set network type */
-/* 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
+/*	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
 
 	rtw_write32(padapter, REG_CR, value32);
@@ -485,7 +488,7 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
 	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
+/*	sdio_AggSettingTxUpdate(padapter); */
 
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
@@ -639,7 +642,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	}
 
 	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
+/*	rtw_hal_disable_interrupt(padapter); */
 
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
@@ -659,7 +662,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitializeFirmwareVars(padapter);
 
-/* 	SIC_Init(padapter); */
+/*	SIC_Init(padapter); */
 
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
@@ -745,8 +748,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	/*  Record original value for template. This is arough data, we can only use the data */
 	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
+/*	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
+/*	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
 
 	rtl8723b_InitAntenna_Selection(padapter);
 
@@ -789,7 +792,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
-/* 	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
+/*	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
 
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
@@ -842,7 +845,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 /*  */
 /*  Description: */
-/* 	RTL8723e card disable power sequence v003 which suggested by Scott. */
+/*	RTL8723e card disable power sequence v003 which suggested by Scott. */
 /*  */
 /*  First created by tynli. 2011.01.28. */
 /*  */
@@ -854,7 +857,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	/*  Run LPS WL RFOFF flow */
 	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
-	/* 	==== Reset digital sequence   ====== */
+	/*	==== Reset digital sequence   ====== */
 
 	val = rtw_read8(padapter, REG_MCUFWDL);
 	if ((val & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
@@ -877,7 +880,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	val |= BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 
-	/* 	==== Reset digital sequence end ====== */
+	/*	==== Reset digital sequence end ====== */
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -979,13 +982,13 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
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
@@ -1071,24 +1074,24 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
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
+/*		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL (SDIO interface) */
+/*	Assumption: */
+/*		PASSIVE_LEVEL (SDIO interface) */
 /*  */
 /*  */
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
@@ -1147,6 +1150,7 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_SET_REQ_FW_PS:
 		{
 			u8 req_fw_ps = 0;
+
 			req_fw_ps = rtw_read8(padapter, 0x8f);
 			req_fw_ps |= 0x10;
 			rtw_write8(padapter, 0x8f, req_fw_ps);
@@ -1200,14 +1204,14 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
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
+	u8 bResult = _SUCCESS;
 
 	switch (eVariable) {
 	case HAL_DEF_IS_SUPPORT_ANT_DIV:
-- 
2.53.0

