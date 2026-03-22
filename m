Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21A40DFB0
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774180147; cv=none; b=WjpSHnIcwNk3m1+cSoBv2bEHvioTuEzi0+DGbiHujAreXRTUqneCUws2mFHLPPzP21hI2jfs4+sfCX3YxS1p14njCbqHzttIdjzbI6qWK+OGUCMk/8sSfRLRhLy6f3CNc2fkRf3sHaY360EMsj6LisQdoIcF/qU+hUitvbuTp9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774180147; c=relaxed/simple;
	bh=kzZZMLXdcHfiMEUk5JNV4MEm3KT6sgzDz91FNBgbp/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKT+Iqavkrmmn8vRoOl3xNyF/6uRIR7q+rFaOBSPDsnivVe8n1nXoz27kC5x7ZfQzk+1JJ5KTm6650Z68Czc85bBhg5OS26qJP/M77rMrgeP1zdzDfjXWhJTFDLferxpci8D9CQ/tVPBzoSA2JQo7uOhGMxh8elnAhi4bFrvpHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aljJbo5r; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aljJbo5r"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8299f1ca894so2032892b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 04:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774180145; x=1774784945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgnOtzRDZTG07BfUHlD3Fp+876x2D+/kzsK/fPZW2gM=;
        b=aljJbo5rmESPJ5/O5vcUEGNihk4NyvO0A48HJnB9ZfVR+gVoSS5JWE/W1UKylXLaS3
         YNAWpjG+d40zeCi8iQO4xmz7zQvrYGpFe3EfR7iP3fn3P0VRES1szi9gOpYa2klxqgrk
         /ZM1frZcP72qVzu77z6kCZIZFHNHmWfZm5ZNenQtQBdk2BWoJqsusUEZFq53jvQhRTWc
         7O++9KXoZTfoM4lZjxkAiY8y01W4ce89a1G/RdOhF1Vae4g+oE5naZsc5QzWuPf4bNH8
         bnmSnSocjtpqMvegLTpzQz9JxeVAdrewOuvKpsF6x78RFTEUG3A7qIWZjICq+f6gVfIv
         cVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774180145; x=1774784945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vgnOtzRDZTG07BfUHlD3Fp+876x2D+/kzsK/fPZW2gM=;
        b=jVPW3hbSi5s17yAoOJUiBq3OxY7HtciH48PP/H+hY+B+T1ClXZe4xRXwaYwa8oKce1
         v0xfn0MJDm/7WzPzcGEqVVE07Ce14HvVarrJ0QFwWq9S6F5byjKqARFEcIDdePAKMWKu
         MJVtZy4o1sGpkVDi/wMjeCvV9nSqUCbiMyztFARH+uQUAHU3E1+e6KV7fUzG5fi63D+F
         hV/51p9BKFZDC26a8fplc1wVMrgT9Dyuyj6Fs/8SiPLdJ5wZcy8r5gIqXl8SYuFq4bST
         uAUZkLOeqDhldfFXwa8Ht5Y7LqkZmThP12pmv09EU5o10oGnm4KfmmSUVKqW4+rHMkus
         MwzA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Yy+JFW+W17/tf8aKpljRSyDibMViQCRhdWXpRnrWbptXO/kn82ZaOO0UXn9Fbra17SvTD1v0BqH810s4@lists.linux.dev
X-Gm-Message-State: AOJu0YwvJ45lR+4Yz2Yp4a2Yw00jPkPJx2PzYJahA0xq39saCq+TnPXB
	PQClp2Kr7O7OCe/hCY6JyHzeD4dWInDPM3K9oRsS5mzyTD/ZI9gEVGxl
X-Gm-Gg: ATEYQzw8znhnlvFM8HgQ5HXxHKF6HGPryf+TSyl7+qOvY1sNDQ8YoamutTp2gNFbtAY
	Uilxh35d9+2tXjS04bmQA/9uPzgl4uXGNNsQgrdnHHYWzkL7cH7xnKCT7+LMTS8BWE+W1L2drCW
	JBuJB0SpJn9dU//oRiI0ZzOMO8obq7bA093HdZLFEw8F2HMlILyWZ5TRBA1y9arptFHo0TZBwkG
	Kq7vfN5FQ8vgrBgJjvQgN0FSLFDVW5ZurvSSvzBvMuJMPzRwmMOp+mrBqc3indMh6e9hXi4LbaE
	55w3J6BaixvyAKmmypvujdv+XSsfNP+4Ef0ioH5B3ioFByUyfU3K9ChZ0fet2aQrysWZm2sG3fr
	/SDEPrkLhqSpGcoam2CR5IFnQ6Y11IUUyq9+1ci1V09sDoG53ahC+ukjAIgPxpHGI/TvbZIQkqg
	UK7Rbb0Jk61BOHXPviIe8CvyliGfsUHfpprK3guwyIYVOjbqI=
X-Received: by 2002:a05:6a20:3d92:b0:398:90c2:f6c3 with SMTP id adf61e73a8af0-39bcebe6be0mr7537046637.60.1774180144990;
        Sun, 22 Mar 2026 04:49:04 -0700 (PDT)
Received: from aadarsh.lan ([2409:4090:801b:f416:7c95:e777:1ffc:9a9b])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm6126336b3a.29.2026.03.22.04.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 04:49:04 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	luka.gejak@linux.dev,
	straube.linux@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH v6] staging: rtl8723bs: remove commented-out code
Date: Sun, 22 Mar 2026 17:18:53 +0530
Message-ID: <20260322114853.11747-1-aadarshmandal9354@gmail.com>
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

- Remove code that is not used anywhere in driver.
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
---

Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
---
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
