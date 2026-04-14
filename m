Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321E36E465
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148545; cv=none; b=VyHacpVFzEG8lkyAmHBuTaTrkw2Qq8sWl24PRv3zO/9UiNWC1Um7LGHy3EsHPZXQGusM23tAFi1y3ai/jZLv/heBpkyVsCGzecEzEH+3Um5COlDjRh50j1EW+8z54Jqo7JPNB05pmGAbdkcgMiF724MbaPYUmvKocUEIlNGXt84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148545; c=relaxed/simple;
	bh=/boUR8ebHBD63x6CwjJTnj67E5KQQnj1e51JOVLIb/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrrNu+JYetU1FujWbYS1v3yaf8d3UZMW8vUn3FasI8zLu4wD4lRIpkQCK9DPVnfo+1iwFHWEB+RelKJMUDQn3/XEU5OgLt2QcaUWSaAqCwASg2OFZF0LNNbR1FZ0NwAO1gZiNDY0nNtrAdgmSkHyLBvrX0gEzlGP858NrIeEV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9v+nlh+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9v+nlh+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2adbfab4501so22194095ad.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776148543; x=1776753343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsxOoaVcC4V0T322Xtd1x/qfgbEvHOkE8it23Ok9xxo=;
        b=Z9v+nlh+k5lv8H/2BRAF6FQYpGFC2+a/6P1tIO2Lrif2vWqelN0FZHgLquFpxsiZCm
         fzz7e/KQq5opiIoyjLX6bMwLUiMxms7kIBjzHqE4pM3PH3aV6B+n3MB9F1dUuCbJiqQx
         Gh5xEuOUNIxO7qEkyqQqNBvax9YNstSQWk4vCpiJZY1hl1Ih2rhyMJ38ztsG6VdPGI/Q
         0kCzlXj26G1vVGUJJ5fjtTndlmUf347v0JQvGkyqkhYqRA+z55Wp6/1UTB3EBDV0Jxb8
         CK+mukHTUQMTuANaeQbcz6cZ9M7hNT6weSNhOfdeVVkU/6tjyYFaHrdmVb6Mtq89bJCR
         cI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148543; x=1776753343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsxOoaVcC4V0T322Xtd1x/qfgbEvHOkE8it23Ok9xxo=;
        b=FAo7lCgoldx9tsbBzR3NvjX3VglsoIp8ldgX8+dbsnJml4FAvt7kvzMiXDhW69gOYU
         vGYO0ZQixXLrD1YDdjDrVpbi4BMKBUvbUOa2ZkZR5TneVAaaenxyDeFLxW+8CskWfgTE
         a5gLLy86tnUOyxLaBGXdZJ4jMDgJKvbxlTlS/Nj3H+sufctk69wYrD9WoX8Do3187o2l
         yD9gNtDp1tmhUqjyQ+tejIj6UaFcECQbvQT5aRnzsU390PJH7Nt1sMSk0PQRIaemOJ66
         bXDYRbS2Xv+qA88Kpm2OPAkAD49ZzocbJmN9xAeKx+9UyCTYdzzS3Y3HWMtbNJQClHAU
         BmGA==
X-Forwarded-Encrypted: i=1; AFNElJ8VlBe2QfZxrFEmLhS+SEPOIDx/sxSunVfaal2XmKc1DZSJSGp3EIy67EYFfc4oARS0qbuV768H9byKn+oz@lists.linux.dev
X-Gm-Message-State: AOJu0YwnUKgiVdcbouPishXjlf2EZ76/TAWUO1OsbomOGK8xaAJMmr2A
	5Bs+3xFUWNobYa5pxTsjY10u9KEJf6oM5na55k7sKv0YyhVkAUIK8V5YHffC4A==
X-Gm-Gg: AeBDiety8KLeOcHX/rkTDFpFIzQBF/Z4kNlMC0eRqbvLC/lgs0fLymlu3SAxCgv5j3g
	5Qh5NsWgv+YhnweqVlXLC4RR+pnAu7TYa7OPawZ22To1T4WetsEeA8F7vgH+cUDauKSXxkJckt7
	6xFZKbThPW4IowwRDuCo3vkCC2Eymqx6hbmiwyqq2MEBpoJ8ZDPVcRwqVbtHlN8XDe1Gzq8HBJc
	PQjHLhkyfvupVd9RdWe5W2IfnD3E1RJUbAH4p+WJG2W6orf4XhAGZGwaMr8HA3w4Ds0egx2f+cV
	lIFSR25STTkh5cozN+LM3Dlu2b60+czNOJ8PGGpgcEUrsrCGErkN/8hKHJEzMT/RjGNOJIIgwB0
	uOfVGrDdnW+WDr712zetgFrabK2KNRuC0hZi4c0N6UoSdP5FfDHe1UA10e/aEum2AuDJ+rLG44P
	F0g5BJsrKJJoOmbXXwiLo4fQDHJAu72yKgrTjoj0DjXCuFow==
X-Received: by 2002:a17:903:2286:b0:2b2:dca5:101b with SMTP id d9443c01a7336-2b2dca51487mr141736265ad.12.1776148542717;
        Mon, 13 Apr 2026 23:35:42 -0700 (PDT)
Received: from aadarsh.. ([2401:4900:1cd7:701e:1072:a9fe:b7cb:a224])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b3a73747b8sm68573935ad.47.2026.04.13.23.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:35:42 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	luka.gejak@linux.dev,
	straube.linux@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH v10] staging: rtl8723bs: remove commented-out code
Date: Tue, 14 Apr 2026 12:05:34 +0530
Message-ID: <20260414063534.16697-1-aadarshmandal9354@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove code that is not used anywhere in driver.

Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
---
v10:
 - Change in commit style.
v9:
 - Change in commit style.
v8:
 - Restore the formatting of non-commented code.
v7:
 - Change in commit style.
v6:
 - Change in commit style.
v5:
 - Change in commit style.
v4:
 - Remove extra space insertion.
 - Delete remaining commented-out code.
v3:
 - Add the extra space that count as insertion.
 - Remove unwanted addition.
v2:
 - Restore braces for standalone code blocks {}.
 - Delete reindented commented-out code and extra space.
v1:
 - Reindented commented-out code;extra space remained.
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 29 --------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..1281aaf0515f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -46,8 +46,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	u16 value16;
 	u32 value32;
 	u8 ret;
-/* 	u8 bMacPwrCtrlOn; */
-
 
 	/*  all of these MUST be configured before power on */
 
@@ -69,10 +67,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	value16 |= EnPDN; /*  Enable HW power down and RF on */
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
-	/*  Enable CMD53 R/W Operation */
-/* 	bMacPwrCtrlOn = true; */
-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
-
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
 	value16 = rtw_read16(padapter, REG_CR);
@@ -359,7 +353,6 @@ static void _InitNetworkType(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_CR);
 
 	/*  TODO: use the other function to set network type */
-/* 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
 
 	rtw_write32(padapter, REG_CR, value32);
@@ -410,9 +403,6 @@ static void _InitAdaptiveCtrl(struct adapter *padapter)
 	value32 |= RATE_RRSR_CCK_ONLY_1M;
 	rtw_write32(padapter, REG_RRSR, value32);
 
-	/*  CF-END Threshold */
-	/* m_spIoBase->rtw_write8(REG_CFEND_TH, 0x1); */
-
 	/*  SIFS (used in NAV) */
 	value16 = _SPEC_SIFS_CCK(0x10) | _SPEC_SIFS_OFDM(0x10);
 	rtw_write16(padapter, REG_SPEC_SIFS, value16);
@@ -486,9 +476,6 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
-
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
 
@@ -640,9 +627,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		return _SUCCESS;
 	}
 
-	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
-
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
 		return _FAIL;
@@ -661,8 +645,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitializeFirmwareVars(padapter);
 
-/* 	SIC_Init(padapter); */
-
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
 
@@ -704,8 +686,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pHalData->RfRegChnlVal[1] =
 		PHY_QueryRFReg(padapter, (enum rf_path)1, RF_CHNLBW, bRFRegOffsetMask);
 
-
-	/* if (!pHalData->bMACFuncEnable) { */
 	_InitQueueReservedPage(padapter);
 	_InitTxBufferBoundary(padapter);
 
@@ -745,11 +725,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv.channel,
 		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);
 
-	/*  Record original value for template. This is arough data, we can only use the data */
-	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
-
 	rtl8723b_InitAntenna_Selection(padapter);
 
 	/*  */
@@ -791,8 +766,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
-/* 	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
-
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
 
@@ -1080,8 +1053,6 @@ static void _ReadPROMContent(struct adapter *padapter)
 	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
 
-/* 	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
-
 	_ReadEfuseInfo8723BS(padapter);
 }
 
-- 
2.43.0

