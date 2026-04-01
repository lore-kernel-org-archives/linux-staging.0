Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878443C5DBE
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037363; cv=none; b=m7uZmURsxcsW01a68t6s8zPhdjZ9CTOW5vtvnim5jjf/rFK2rPX3lmV8wvb0rTWkXGVv6sZhJgiZfekm9NMgA0lTTDGQJ0H6RLjl1rRvAagIcPuLFRKluwsbsHUoIPz6hS1L/dkvw2YDbhK20ozhk9z3r48xIrzld6t7zQDc91Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037363; c=relaxed/simple;
	bh=tiYTYzp9bW7B7jkM2WWdELXBTZhuAa0UTOdmZoqjm7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bmq8adMmo+tIl+4TflypB1xjGFYewkn+EGTSuD+7JrTrG1Zhw7RETTWrAVf1xtZ2+60YLy4GXmk3/BG5vqFssWwBK/V+JcQj5nKieLaPcAj5stOtouAsWA0x+1spcssXUrt1hdJIQ2c6bjdaY3wwW0b1a931SczHycLt00Jkr+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXtyz8J9; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXtyz8J9"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so6154846a91.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037359; x=1775642159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/70nvkTwJH8CKcaLaRMPuxVj7zvjvKJvMDTD6/tTM8=;
        b=AXtyz8J9xknnu6ZDFfjmgseddL6iQYffNxtdVsS8/gMQ+o2ZtrxdmH1lHcuoU6xWjq
         g/gye4HInDxxQt22x7JN3Rtvg6Y5U0ZjkjZXKhs24XmkuL1SSYbfIuU2KrFgI8An1wRv
         9k0KRGmc/yOzaiCmum4dVPGK2Xq+yTZQys4XXCXJ9OgcDfW//NobHw69hW9ZdJVgRW25
         E0kCsgD9ol5m68uOKVLozOR/S0VXwxfVygbsG2jWMWuyUClexDl8A0Z1ofDlxZorlFpz
         KnRpOi713d2IwmmDvgqey66w/Y2J0uRYbozYUTWePTGT/+4gg5vY3LR/tYeZG9grdWGQ
         pBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037359; x=1775642159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E/70nvkTwJH8CKcaLaRMPuxVj7zvjvKJvMDTD6/tTM8=;
        b=MzMlbBsCNwwYESRzL+1ZhQ+w+ZG2hI1fptTPVZQX7+wZCk7sk2fwPSneWWAztLbFIM
         /IgtYFTesaO3L0A9PZqEp0AJ+ZHuVI0CygOM1QZMwPK28HSPEmrFYNsga+YjZNgH0bGN
         l/DQsHgBgPf61HaX2Uv0RgD2QHNXB4ZGvjXmrmzbsp8z9RJJxpYLRLwaC/bUw8oKJlig
         2jEHDEEMspxCv359Goan71J1mawBiLO6ohcmQt7o1jWlgAvbCyYWYKysUYkjkY64fV/I
         ULBzBFcDeThkthkFUBKNkv96Ym6A0ZhCdSAexQDme0e2xP8M+FYPBLdLKHtihplHgmo9
         WfDg==
X-Forwarded-Encrypted: i=1; AJvYcCXDT7cVyInEpwSOxVZ0au67joyZ6zLXuHUYR78yMFwiVe20SBUrBGQTme7QZyM4Cz0yPSvMWfAQknBHE6Pn@lists.linux.dev
X-Gm-Message-State: AOJu0YyAaterNtMlipZmZF+pKdj4pCqisyJiuEzMQrPRfJ1sH9uo+oam
	JSB37yXi4DHZzaUWDJxEswm0oGxrUb10RdHfPGWEQWihxLLHe/ecK7eo
X-Gm-Gg: ATEYQzzThkOXFwR/aq0a1J5Az3tfy0erHgb7DtGAMIiV+NiwCGDVSEIBumMIeMso69x
	gnY+TwdIQsf1k2hfmUmirNsPXJsYGsleJ7QT0/nrmCY/gqZE3bJbRzh4kCJutBAbRP+1o4Clae5
	hebqh+fSE8ZLyz5WvprtPYxDuZjAGSeW9ihc+gl80hEjhX2584+Y+SJD9EANM7FV/clk4CZIOKb
	B6TG9UiwYUYoD6prkZWlA/LBCYCJ/LtTserO5HC9A+nyzyghUM9998Uv/cxd6zGyZg346DxwxxZ
	aPxIEyhhxL4Ynz6Q8O0bg+xe6PIcQpg6dWFjE5usiKlF/PiNbnZ4mEeDHF3AK1MRNLriQ2yCctA
	RC0O/JGdH8cXBDv7hgKJo2cWqIP+nYPelubHE7Icl0CPqgUGtL4ZnAi/X+NYSS6G5qcHWVpKnH7
	ajEk+wPVZ7vVMp46VPHmeo7uQ8Qf+DrYQeUQ==
X-Received: by 2002:a17:90b:4ccc:b0:35c:30a8:319 with SMTP id 98e67ed59e1d1-35dc6d2edfemr3116870a91.0.1775037359400;
        Wed, 01 Apr 2026 02:55:59 -0700 (PDT)
Received: from aadarsh.. ([2401:4900:88eb:1866:2f80:3df2:d843:38a7])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e5127sm5774380a91.1.2026.04.01.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:55:59 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	luka.gejak@linux.dev,
	straube.linux@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH v9] staging: rtl8723bs: remove commented-out code
Date: Wed,  1 Apr 2026 15:25:50 +0530
Message-ID: <20260401095550.33943-1-aadarshmandal9354@gmail.com>
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

