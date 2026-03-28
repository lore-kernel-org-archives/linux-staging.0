Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CFE15C14F
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 03:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774668700; cv=none; b=qTjwH3RoypdAKtY9Y3xidCf33pK5fnaNCtgxiPmTQTObGly4T7Nf1FURvm6WtDhuN93JscfDBgyK3vWHhT41O9wlGZbzSpv37SiNVnEeamNOWL/U5occEGQhqqEV6WwaB2Bav0J1sIzO0IPedNyKCniRuETCAyUu+8pSpvw/I6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774668700; c=relaxed/simple;
	bh=l0TA+U7sPyK8HmvbWwu9mXbUamGOj+FHMgI5WNsvCG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BU4Ugl6vy8rRGi3LkeNAC8JJFbauSqqRq6UKXRb0t+ezCnZr40HInnYr4rQchxV6CNDrhZjI85P88ypowPUKutWtL5qew5CSlB3bUQw6pTzsIRDZbbz2Bwdyq+hrcw0YniQlzN/sBMEOKmGqqP6eY9A3ro3gYbOFQ5UxMvn/bYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gevkaXTp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gevkaXTp"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso1394508a91.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 20:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774668697; x=1775273497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Om5+Mb7abasp4NXOBoWeswnA1ObOpepVUBkgmbLhNQ=;
        b=gevkaXTptvIYf+ixltobH+/W5N2j4XRo1qgsu6Ffc4wUc/t6JTfItTyYrbYeUO2Jcs
         1sPeVCBnTTk7SNcq7IkJLuPXbDmy99Dode5+Va1+c5rnEGQexhmimkOyNUj8Nt1Q9fs/
         4EEhWv0bAWntHAixMjTTvsh5eeKgXbk0L2LNTb+dUfZDn3rK2N2pWAXQdXJKZmGwWjSE
         wUwLFuGJdjNA4xNl0jYoa3zfRmfWaqocNAHYxlnGAB4HP7a3FCTzYR/QgcTkX6+K2AwQ
         nV4V38bKS27lX+yXOcw0cCObulIP7s5zns3XpN3JM97bZTLY0X68QMwr91e95vb5LV/j
         D11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774668697; x=1775273497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Om5+Mb7abasp4NXOBoWeswnA1ObOpepVUBkgmbLhNQ=;
        b=Jo/P75uA970loYVOnv5dsE14gSoOY4DHl5suwXe9k1tNxoQlG97rKT7BlCLLjyXMSS
         KM7vfiko3nj1Cvz3UG1bBfUrLBAIA3QtNPvH4JEGNSdb8659mNV+vpXEomBe9TntBwzw
         3qlrwj9QwAkABfWyNXJUDqoLyKPpdctyASkufgLfL0C66DCtVbhz5igTb3jvREgbcfDE
         9S4G8bs5NBu2MNfeuIfouXpQrOhsicjWaYJybWn/lCT/PPNYpUBoLavhOmW+OAsImhVw
         Id1wrMinJz2g9gobx02/5L50Ytak1N1oEGjNiAXAyi2qdNQswl5ROk2yDfWRn3QBkP15
         lanA==
X-Forwarded-Encrypted: i=1; AJvYcCUoedbCjGOiwmwQqUkmvJH/Npt5nOJWOqv97JXeP1CAi9Bm4bx8CmMr7KUwjhD4IvRBypFRgtyhkKYm9NXl@lists.linux.dev
X-Gm-Message-State: AOJu0YxYaGFV6jMlTEO5Of8f3IjilpEzKc/0u0H191P+sw7r++X2ukdY
	Yu+2Vo3BmRwzj67FOAMfGh9fDB6dr5w7xXUudRX7d1cENWlzno/7ir09
X-Gm-Gg: ATEYQzyacwwJHam83Zav54K8HT3JXbVY6EZHHBPhWQyIH4qRNzNv0OSyrN9hMlEqBjY
	YzgrHgoQem2AWF/H3G/OFSNrFSmSyTpCSt4euOduiwL159xEd0WgwLOG/miIPCNEEP+TT4mSf/m
	okc/zlAz2dnEPgDCcOvhkRpwkG+0Uzr58H2ijZMmybnLxI1FoWMGPoyb5u7OZlQ/c6g9++8Nr3U
	C8XRV1N789uhSmlPbUTghnWPN2oDawK65deX7Ys8Iww0y8jRimJ3s1DvBNYZkz2oMnEeKkOpHa/
	cdMjyG8YHtKLcN9aUUhURShMhFNvRmeQLB5CQH20HRVaLcnEEeUGFhXMw0s0srQHI2Zoa5Cw2mI
	Gr1D0A6u89cuWcycjxvEQDhcBBQOyivxSMnjE5ANNg0cBS3AVi9h+m/1YlayJDa+hlON6sbLUUq
	k8q4NxHQbyViLIOgeSC1ZIEwW6F2Edt9hNKP8=
X-Received: by 2002:a17:90b:4c8d:b0:359:855f:ff96 with SMTP id 98e67ed59e1d1-35c300b29b3mr4485865a91.17.1774668697475;
        Fri, 27 Mar 2026 20:31:37 -0700 (PDT)
Received: from aadarsh.lan ([2409:4090:801b:f416:bb8:1eba:738e:33f5])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35c22db12f7sm6252751a91.13.2026.03.27.20.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 20:31:36 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	luka.gejak@linux.dev,
	straube.linux@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH v8] staging: rtl8723bs: remove commented-out code
Date: Sat, 28 Mar 2026 09:01:28 +0530
Message-ID: <20260328033128.27946-1-aadarshmandal9354@gmail.com>
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
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 31 +-------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..d0b0e7adb68f 100644
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
@@ -484,10 +474,7 @@ static void sdio_AggSettingRxUpdate(struct adapter *padapter)
 
 static void _initSdioAggregationSetting(struct adapter *padapter)
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-
-	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
+	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
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

