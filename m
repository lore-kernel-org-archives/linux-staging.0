Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3794A3A381C
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 04:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325249; cv=none; b=mXEN0CM6mOKVtQs57YxYr3xCB8UbHzhVMCPR1viKMIkS4WiliP4qvOCMcRI5vVSC3Vm88mv0bEBHk+02nB34j+bBdHV40fkppYXQmHHFj6/1+Jx7LU0HimjAa25Ml2DGtgtgf/1o1VJw/01/iuCG9IgQrp3HrS67UWV34PXiNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325249; c=relaxed/simple;
	bh=log6x1Cso3z8mljz7H6OVlB0/lBZc8CRpHipqfyzq5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqHF0LIMCKt2d7xRe7qvgK4QahKrsDbdEeZM02FQ+hHsm7XiHEnoeDyUncLHPvTYS/bps2wutA+CNaMVnTVPbhpjpozhpEn0ezX5id6Cwt7Ki2d0Pd1o9ZhT5/B34VVql5O/RhB6lRr9FS2cbPzmepJvOk49Nqd5gxBy14yKXUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EISbWXVk; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EISbWXVk"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so4629947a91.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 21:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774325247; x=1774930047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f3X90Dmfzg30Il1bhE0PbQYqZfL8+0ddOr/f8ySy/c=;
        b=EISbWXVkySZ/DgsCrv5iyWAuxtEnjLPaWm9eSEg/rp681L+Ip0M43RSRDtVDBRwdPe
         eIwwXBq0307CWobj+arY1ed+iK4acS0pDeelCxPGO6QmqPTxWLIPw5DVpgz/jbPx0h0E
         W1E5SaaYkfB+ngKq76cXTGlO4/uLTtJOKaO51WTzN3d5OK9xrjHR+a79iscTlvfHeOfg
         4ZH6MHMz9QyeUvUeH/aSj6pR+qIK3L3it5EGO0UxZFSmt+czco99676EIRr3CFzNzsxV
         LNwu4yBUwddWWHBaPb6KcgLK68Sq4qy+37IUPFoO/bHTmaN6ngZYNFRyVdSmTa8FL5p3
         KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325247; x=1774930047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/f3X90Dmfzg30Il1bhE0PbQYqZfL8+0ddOr/f8ySy/c=;
        b=nkurL1bciY6YuiL0Vb2JyuepnSgmbQZ7Wh4JKvgjh0640AAwp9uimSsj62gRSFT0U6
         NqTXre9ZTSIW1eG44BvB8wF9O8MC6r8j7q01dauvYx0vuTBaxbQxJvxwupXP/FrBmlOc
         isTWBEzIhExJjoPc6iY7jvUk39tHHMICtsMoMDTWJiM2uqd9PSvz6zQjZ9AE4l+YZCSk
         HI2/5ajK18oncwOjBWypJDJVeh2w3Kc8DTmxw2rKPEJWxlFPrOzlWkyFn7aolJozxdKs
         xxssUK4rebZbYp72EBtaCKARBe+IzFo10fv51pZa7egSlWvboGLJ0OS+cPB4pbQl2K4q
         TMzw==
X-Forwarded-Encrypted: i=1; AJvYcCUK957FTHKXTD07G2GELBxrDoRCMNaTyxbtLvT3Bur2au0Mt0wTE9YBxLcZNn0TdbIP2SzfpZOKp0t9xVj8@lists.linux.dev
X-Gm-Message-State: AOJu0YxWCtPKYHbliGRYN0p24xCcg0YZoAT4nlZLb7Hh6zGEtzNC+EoW
	DVij5YOLPDtaVfE3VUF9dN/lCihq4fLabOKZblhzC5Ju3rC7GddSajOZ
X-Gm-Gg: ATEYQzzl297kysL9Dux88X//6vXcRkQJNJdT+sHbjs6HaresUGoiHbKAzCQWOSeF5HD
	uTqgpMPUPs1bu+yY3/HQ0pqqdcmB2hl/Lfj2/wFZQysrRGg/Doan5rHPskMYGbtDxEH07bf9xAd
	U8ga0vJe88ZDmTpTWOTCLcJR9pa/ftk1yNaCmIIugx8+q8lZ2CqLFIQsTm11xZjyxhp0RXg0NZ/
	z5xivNtz0kFvTcM0q3NFogSXhaoFupHpKmSxveIZasjWU+XxayaBB4TLPmTBQhoQH8omfzn5xta
	CELa1LBOg2xHeYOD5PPWIQaSnCINJrwJw0PR7Npr0314S7Hia2dqGNmYjJdLfCV8POkfxmrr5f6
	VxN6iNkWnR+0pRRSeqsoJpoRgstqjHIWm7NXUFW+as3XQ4hMKD9UDUYnKv7HXdmmD0HcJvrx3qG
	BUiq9pWdJ5CXAoiojT0BhqLNnYdXu0LJe9FA==
X-Received: by 2002:a17:90b:554e:b0:35b:9ab6:1d65 with SMTP id 98e67ed59e1d1-35bd2d52dc5mr12051122a91.25.1774325247493;
        Mon, 23 Mar 2026 21:07:27 -0700 (PDT)
Received: from aadarsh.. ([2401:4900:1cd7:c8ff:2d2f:5231:1645:4549])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35c031ecf44sm677434a91.11.2026.03.23.21.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 21:07:26 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	luka.gejak@linux.dev,
	straube.linux@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH v7] staging: rtl8723bs: remove commented-out code
Date: Tue, 24 Mar 2026 09:37:18 +0530
Message-ID: <20260324040718.7777-1-aadarshmandal9354@gmail.com>
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
v6:
 - No change.
v5:
 - No change.
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

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 063a0737933e..96a0c8e304da 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -481,9 +481,6 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 {
	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);

-	/*  Tx aggregation setting */
-/*	sdio_AggSettingTxUpdate(padapter); */
-
	/*  Rx aggregation setting */
	HalRxAggr8723BSdio(padapter);

@@ -635,9 +632,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
		return _SUCCESS;
	}

-	/*  Disable Interrupt first. */
-/*	rtw_hal_disable_interrupt(padapter); */
-
	ret = _InitPowerOn_8723BS(padapter);
	if (ret == _FAIL)
		return _FAIL;
@@ -656,8 +650,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)

	rtl8723b_InitializeFirmwareVars(padapter);

-/*	SIC_Init(padapter); */
-
	if (pwrctrlpriv->reg_rfoff)
		pwrctrlpriv->rf_pwrstate = rf_off;

@@ -740,11 +732,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv.channel,
		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);

-	/*  Record original value for template. This is arough data, we can only use the data */
-	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/*	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/*	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
-
	rtl8723b_InitAntenna_Selection(padapter);

	/*  */
@@ -786,8 +773,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
	/* ack for xmit mgmt frames. */
	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));

-/*	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
-
	{
		pwrctrlpriv->rf_pwrstate = rf_on;

@@ -1075,8 +1060,6 @@ static void _ReadPROMContent(struct adapter *padapter)
	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;

-/*	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
-
	_ReadEfuseInfo8723BS(padapter);
 }

--
2.43.0
