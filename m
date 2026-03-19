Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D892F3033E0
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 14:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929909; cv=none; b=k7ne2yxAC09AyGmdKlgkMcn3ak1p911VwvxwIqOkvTjmjE3QkyxcmuTFyRgCshfyOVdFrTzoje0gp2SEfA7i3QB6Drtg9ZIez+IKwbwGXFNMe2m76swO4ioNgZwaeYkL7+xDzlzGexsALOO72TXc93tvR97JzKGhgg5mq1vs6Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929909; c=relaxed/simple;
	bh=EHz3OH4NQl+5kez4lALoytwa8lBXo9ZxXlJ92g4WOaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9I4fwSzHA7SR/DDQvDvhM7KKapbkVrtB3CEb7HFn6oAm/4dH5pvZPo+5cFwtyNGw8yBHgpW3eQnGEn7HBxVOjGattXqnc64HJavFUixq9PSyf93OhLbhNlwS3FovNyrUIXi2sg4fbZIdEl1bDBj5nRgshsM6Ij7NLUCzA4Jhek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czKqbk9M; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czKqbk9M"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so409601a12.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929908; x=1774534708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTUhuvZrbPLi65P2qC19uSSj7YWJnMpGLDgt32EXjPU=;
        b=czKqbk9MwRm7oCdUPbEruGFGXDLtuGn9FVV3M4CnPsxS0wpAKSOmy+/+QBg4MWQiMV
         9F5MSgQAryuQSJibfRPxYugPh7LHr46WovGtezZ1dETXwQiYNyWqWlTAYHqUUf9rU8dh
         DuRGZZ/+cU23mdGWVuVEFO6JL+KdSCklFycRC45JU/xT16kZcA8QkobURJ0yw5WXkVYq
         GrzCbjaOPf6PxbJp3luB7havh8djoHa72qkt2l0WO5NIyRSlCzikMrXqtu/FJTd+6EwH
         3qY3M18nW+m9aqSC/T7MRbs90hJHhBh4prw7+APCD5Ih3qFIqcIoDOeFsGm/Efx5IA3q
         k6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929908; x=1774534708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTUhuvZrbPLi65P2qC19uSSj7YWJnMpGLDgt32EXjPU=;
        b=Q62Ws+Ob9DrURZ54ir6qzIirSFKQv00bxR2eKmpFDTKyQaaDeBvNoCCEs34ep+PbDP
         hUIbgZO8XJQmMHIJynNugbp5qMlgJBj70Z4lDHdwVxcwUxiP1NwuHUDl+okcTRGHAGus
         LGvOUkKh0VQiZj8Nm1iIvoFrRmJSn4ZKpTU2rQqFImRdphoiPe+wye3gjoSKlmGYoc9H
         WPjI1+s7l/Uj2PQifE62c81u1MxuOlhlcQK5UGi+CJHsN8Fb80eSMR/l3wyftAi7shVW
         793zqfc+fuiCAIJvvYsBifUOY5kpMHht93iqpp89Qa813iB24NaZWDmvCx6dGaM4By0C
         wy2g==
X-Forwarded-Encrypted: i=1; AJvYcCXvFx7C6UhUsWzuet2XtuZC+yAjlHZ2GKC8ixK9XmaaQWmVkL6xRAN32LGBjV/xuL6pK+anQtErEDBX0B+b@lists.linux.dev
X-Gm-Message-State: AOJu0YyqlPNhWJ3OTpsz8zUObiCY99tbogzX2Lq7PSv9W+zr9oyDDNZl
	ue1xOZfz2FqHU/jPGCLpWQaOi8i27r0Eu5cWiZ+uqIBSUvGyHRywhVY9
X-Gm-Gg: ATEYQzwV+FDwoYxLgS2B8mxhr9nVnCB1HjlIT0jWxbNyXwwpC/2amufbpAwHNfkhYCe
	auzlqBwAng3bCMYIxxPkBFKvtPt64De4UXNHQU44lPHH4MqT7udLYNxVEKgVYov0s9/Hpjyk040
	L8lbueyW9ZeEr6itN7uib0kFUcmk1oTZAm/xcnfFhYP4zVMt5AhD6/VdGzjeKmFLPvBTQHhP/xE
	WhSSMDOmw07Yjx2NBEewY8GxS6SCEAeKY3JnmH5TprLmYG/1XQ5s/n0j8MNFgC5rWFREJXMw+ln
	Suf3krVHqL9KMwDQWFnWXe9oInpJE1t2Kb6XK7nYmCZQuR23kYuVGzzhz4c8zXcd7XhCrcW2Oeg
	g22+0fFLpg9MnzFJiQ3Tsx5KcEjNESaqcbrGJLDrFJIDPdrNzsOaN/JMaCXlYe0a/wZLv34elry
	MK/POJdfmQJT1dIdxb/7Efu0ZIPJBvCaSiig==
X-Received: by 2002:a05:6a20:748b:b0:39b:8dcb:f37e with SMTP id adf61e73a8af0-39b99f674f8mr6811452637.34.1773929907892;
        Thu, 19 Mar 2026 07:18:27 -0700 (PDT)
Received: from aadarsh.. ([2409:40d0:11f4:e9ce:f110:1acf:6031:3b39])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c741e0b32bdsm5350077a12.3.2026.03.19.07.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:18:27 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: aadarshmandal9354@gmail.com,
	luka.gejak@linux.dev,
	ethantidmore06@gmail.com,
	dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: removed dead code
Date: Thu, 19 Mar 2026 19:48:18 +0530
Message-ID: <20260319141818.7735-1-aadarshmandal9354@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
References: <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- removed the dead code.

Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
---
v4:
 - removed the space insertion.
 - deleted the commented codes.
v3:
 - added the extra space that count as insertion.
 - removed unwanted addition.
v2:
 - accidently deleted the braces for the standalone code blocks {}.
 - deleted the reindented comment code, extra space.
v1:
 - reindented comment code,extra space remained.

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
