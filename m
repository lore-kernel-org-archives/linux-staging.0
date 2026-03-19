Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CEC3090CB
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929598; cv=none; b=LccDeZLqGu3IfFKGKqdUAJtvim30pCfWuDUvRyP0Xg3akdgI905Fvj4gImF561f8brz9Xd1EHgn6H+ECr54q9fxIq1qpa6rQZeKh6YHHHVMEJUreWm+V6jUpJtmmqf66pm69U/sga347uVoyEPv0qNog7hsseeKJF3m7FAr/J90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929598; c=relaxed/simple;
	bh=EHz3OH4NQl+5kez4lALoytwa8lBXo9ZxXlJ92g4WOaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDrJc0DUqHkgg6tvciCpVpnS5aFY77IdgLqmp21DqZiKKj9tLCtc4NOmQv80hguhrg88SSiigKBU/GjrdCvSsRokNXGW+UFKuesCGx0RTPl2Dk47sTI2QVBCFy370uvce8Zn+j6HlD1dA8KK74ANBaroqnEHAKjXbJ5dApvJrN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIoK8ySY; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIoK8ySY"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so683249a91.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929596; x=1774534396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTUhuvZrbPLi65P2qC19uSSj7YWJnMpGLDgt32EXjPU=;
        b=ZIoK8ySYpeY7zOxpvOkfQPOT2MG2RGSUP0ugJ2AR+G5rgo+g39ZT4i/1owA+llDirx
         Yxg6bFyRTK9e11tJFwGqPmyPs24mWhJFp3ezK59T3c22X8UsUnfcdAtsEmN1tngXDWv8
         r7HQhVyQl9cEnPMEYv8TUbs+E3ZKToAdGGsDREPj1PdSx1yWUbvxLLWrsnsDJ1J5IBUq
         i50O1tB87sBVJ7wVgDIhpriVV8W7zUtErN952MSfjFMmXVmnF0FEEPg1pqBfxJ0FgVpf
         dDBsKBjKk6OrhBYet2LcTNzN8EJtvU7pBOP3HCOVMCUPgu2OLEPxUi1hQJgxQ5dXltjo
         oY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929596; x=1774534396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTUhuvZrbPLi65P2qC19uSSj7YWJnMpGLDgt32EXjPU=;
        b=DrNe9s3qopGJm8HjcKwBPBuqbyNH/ba7vPbZ1ZpwBKzZEPsqnoCLoZ8HWtz640r7Nz
         s3U8J30axu1wdhBH8uk/cVnlIQuNWPcLHhnMefF2oEHy79PIQm53qP6DLeQSuVdrndnD
         PrWRj6Hm5M6kV3x6HvU7w9tpMR3ksO6PMO7AyHBy8mjOFLt5H9dXs8qmc5AskrBgVHiJ
         m+A0Xq4xPdxhc/Kw7bCQBGUonAsLkyPA1AlchgKOgKZUaqUukS5eiuRns5+CpLMOVJOx
         jg9Fi7wSUjbj1/XHL4/mfC1gIAdcaAuI7I4FbQoad1XuAeb4SMcJTVZNZCU2yXRbMi7o
         UnPg==
X-Forwarded-Encrypted: i=1; AJvYcCUMaHtZ58QrULLo0Ap3ljmn5EzbmKbmYqJmPlqKLGLhPJhePRaZrM2pzvk8t5zb+9XWNa3ArbXi8KbVv2B5@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrf9qoEJvJS6fWm++nPmKGH7xill8pkKZQTjxFiwLceL/oZDn8
	xgymyEwEM+MLMUWucANTeu3uOQSW4erWuGX/wcHKCmCcbHarkbLiAYOM
X-Gm-Gg: ATEYQzxLXkm0WBOf/LnWNgS4o93S7Lv3hWKZ5meAJ2WuDk6OKgp5c7GUO/t2rctBej+
	exdf0S6pZ1ecauNLNJJc5ggtjI1ztq6Qj93hR0jos63G8kfW1P2jha7AcXyAhj/E1+5ZwWVL72h
	IenSoIEl1UCiAqkRQU7aildJx2pw3nk1tf49MIq5CLh5nHZ7HAMOujDP201+0nEfAP4pf6UhP0J
	0Wlaa87BFnh0XXqyE7t9zZwHXc31mJ9HpimPZdt5DMgsgzmlqn/O61PtUzMzhXdBDjfoaOWtRud
	vZVAoCDJNKSeU7NQ55uzroknyumvDBT9PHjPXsYIulkLG5aQHTVN1qG0jEdxAWCjaXbHGTxrYzw
	89e4foE1iYbJlnj0oewrOxphdpJJMoS7EtxuR/oTdlyYWN8J9hqV57pkdZiXzgVEG/FXQ4TnW6G
	YDeFrY/JLphKmmcy6iRrOE+kaGmwASMZnfaQ==
X-Received: by 2002:a17:90b:528b:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35bb9ef2e60mr6081395a91.17.1773929595832;
        Thu, 19 Mar 2026 07:13:15 -0700 (PDT)
Received: from aadarsh.. ([2409:40d0:11f4:e9ce:f110:1acf:6031:3b39])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c741e543d25sm5298264a12.20.2026.03.19.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:13:15 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: dan.carpenter@linaro.org
Cc: aadarshmandal9354@gmail.com,
	luka.gejak@linux.dev,
	ethantidmore06@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: removed dead code
Date: Thu, 19 Mar 2026 19:42:58 +0530
Message-ID: <20260319141258.7332-1-aadarshmandal9354@gmail.com>
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
