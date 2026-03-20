Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9603C198A
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018025; cv=none; b=Eblz0xaDwWYtRyKnGMxO0YSw3rGuQsreMc1QwLG8RqvNHWAeTosucChxiTe9lkXcvPdqAiorTxSQgpCgBlpeLPMeP0Hypv2SskeJFIiMfquPBdIKaMPKI8Dp7BfXTm8Hi6YiRCM40fGMoiwzY3hXhG+jqsxpimOcf3nyRmCN5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018025; c=relaxed/simple;
	bh=p6VtM0Ah/v06WHU7ooNKNl8CGvv8Y8VW6c/BjUhf2vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiRT9nNqLvNG0Uimrl+9kASO3NeZHqrL1KD+zRY1VK6HKKoBHfNebGubWgeIk2K60ZQWd1rVcygwDvDYczQZFXbake6TMt59ZM2bsWiXiwkMzh/gS/n3D2GEVDuZfPDThGRMmu16CZnurGhAFd3QS356ILimxNaudznDxR8mX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9afKDaX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9afKDaX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c742d4df00cso804975a12.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774018023; x=1774622823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfCCTgj+MHxJq/H22z4q6RFCfx429Fgi37AUadpTTiM=;
        b=D9afKDaX05IlltOe08HYScQ8CtF4D1KRjrZIS8/xv1b6cMF8+Q6WeDZUeVB6nzGo0x
         deWaCijpKIQ3j723liAtpUoabGzmKAxC6OfOg8AGE5lNb3PPWujYgYX0bqobqJVvPAg1
         Q+DFED1EiaNdYlimhvLw8yD92ORACJn9420L7cvYGG813tZFkM64tjFtKY7nTf5l6Bqs
         pN21F8C2D88vXDFmdbwXeuSnTND+aq5+CmJi980mgRoU59HTFshAWTr3mwlJFZ3igrdC
         npZ3sfiVDFKn4wWLnGBoXfRTtKZ/O53Q9EWlAVcrTpWD44UEe8JJnnXbgqiXhd22Ifk3
         bL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018023; x=1774622823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HfCCTgj+MHxJq/H22z4q6RFCfx429Fgi37AUadpTTiM=;
        b=sOxbikDQCp0gLfP8GgBUri+IDvjEiU7I/KfInD0u8cgvGe4jP8TjCs6TB+3wSS23/p
         4ZJSnjX1CLsiyP0CAwa8ZWQZNs0PlZionUUgVj1/E00f/VCQHRAv6m3oIfa8lPDKkzgX
         IYez1Zso8QXTk7OI9HfYI82u2cqGKpWiOQiXU0RwL1+SOuxXphQscP/BzooXBjvDfR4V
         Fs2Qu6/choEdIIdOFmTn0wMKJgkLqdQsHGMV8+eCcSsyJ0YvJjS/cEsXOjAPbI9KICEZ
         ryXYqtoaBFoNoffr+5h6MllQVUfQ+KRlov+YjR5zPVkk7KUJvLLDD7mv2eNP8COGxF28
         xiYg==
X-Forwarded-Encrypted: i=1; AJvYcCV4LcAiiFgommhK5E3EzsHDku+B4vb9rKS7AP/0kcyWwXcreJ5hJSIJ6/UvZBYBosBUGeEbmIX5ohC7GvsB@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf6y+ekKbpLVgiNa6jQfvHUxddXgaUAKiwJMZj/aFRVUSabEpV
	IhwNt3WDfGzQxqFglil5+RRAZA6eWB65iIhaKtDlgNpgCVBwxfrnq4UJ
X-Gm-Gg: ATEYQzwX5k1rs7MxvkYUoNb2lOnkyhdLnkd0RhuPbyiA1BeDn/Ewv8WKodHzmzZGrpe
	DNh3K0fHFylP2R0ThN4dKDGcTGBjCb9tSpJY+PHTz8V3pJaVWCHSwdY5uApCzUWosgkMDVlge6+
	8npkr/huMvGOzw2WUMi+U9Szg73IuglDmPA/WWs1mEWUOwwuPdXB4QkmJu9HistYspsREsC4VBa
	/rN9UM1mxX+f+Qv6aywUWdZHAJGuhD+2QGd3Tt4gc1Hc9pX9YiqdjhIYQQDb3Ddc2vjY4WOPXSg
	7geoSGfXobkCwrR+mZEVOF3HATLlmyAqoiyaTayCWakYHRfXMMtqwYr6EQzbsii3wShs2016QAJ
	yTTyOJv+LQtGMlAh66+5cYWFx40Tmoyc1SgXVZeI4dVp1T2YlgGuRGIoMxgjcPHTSz9jsv8f2WS
	6diQ/WToZ2IoW6vkSoFnKakikzkI4El+MSHEw=
X-Received: by 2002:a17:902:ea04:b0:2b0:7502:6ebe with SMTP id d9443c01a7336-2b082850022mr29158295ad.25.1774018022757;
        Fri, 20 Mar 2026 07:47:02 -0700 (PDT)
Received: from aadarsh.lan ([2409:4090:801b:f416:9c49:5c9:9832:a59d])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b083516938sm26035965ad.6.2026.03.20.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:47:02 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	luka.gejak@linux.dev,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: cleaned up patch formatting
Date: Fri, 20 Mar 2026 20:16:52 +0530
Message-ID: <20260320144653.33626-1-aadarshmandal9354@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319141109.7212-1-aadarshmandal9354@gmail.com>
References: <20260319141109.7212-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix commit message formatting for the previous patch.

Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
---
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
