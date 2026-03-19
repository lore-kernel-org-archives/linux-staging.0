Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670D13AD1C
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929482; cv=none; b=adU/KPcF9LtqpNY6yFa8/zraGISKNaJFp7WwLTrE1U1epoHoYFwY1REXreHco+rHhO6fKG4jC1z0E+9Fh0dRcagZPMKBvikArYbmVW/Wt/CNvRKA9tWAAtuoQf1hcOR6o2MwXWsAUTts9ZcjtACgiZoZm29gPmt66yjAbjcNbAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929482; c=relaxed/simple;
	bh=EHz3OH4NQl+5kez4lALoytwa8lBXo9ZxXlJ92g4WOaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcNqZo3GBdkHiBpwf8im8smyUkJbDfQRen5nKgWTYB3rkukx1X4Cji6Z2/MuCW7bJLapUpe1bgB2pMZVcueT3Dos6Fa7IO6sU64udamHhv3bjQTKMo7CGGcnlHK3LQKTvBxsI49K5tUfIxSEB23bwYL5vreQWh+QU9P/YrHv6sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8m5z+7v; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8m5z+7v"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso643806a91.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929480; x=1774534280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTUhuvZrbPLi65P2qC19uSSj7YWJnMpGLDgt32EXjPU=;
        b=P8m5z+7vJmPVqihT6RA2M/FMrfWWB8DCdOKvLknADFD7Ddvn/Z00LgxM5k3dEtiUGq
         vS/U3h2sKS0n5nJfeaTaWEgTPqPAhCuCCePXSGmoG6f7mC/+bEU5ITZ0jW4Q0yhx6hDH
         46/hSExTkqVpGVUkKeUp98ZGeKDgc3/wk0jq/6GaG+Xxjzp1iWs1ALXQbuQlXDjGEy0q
         eZGWAw53fr/sAovg7ecnZe0KiDhPlfMUdL/NIghRqhoSjdP685hcnmQgt7g7mtrI+Ds5
         T3f/SQZv/vUqMOIg7Ap8aziWCuub3xhz9bjGfwg4BxicEt5WBS+d41ciBCyiWEgqsbyN
         EF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929480; x=1774534280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTUhuvZrbPLi65P2qC19uSSj7YWJnMpGLDgt32EXjPU=;
        b=X+YCCCuj/+2HsaCNsWExxld2DFi07idCoAeLM7+WiO95XKX2rcje8qRk2mF40iRmig
         ugbM7tUuOwP3kPuac25cWGr7pz53s1kRJqzfwRyrVzU9aMZD8DEd6vbSoA2p5sEJGV5W
         Kz/p+12HnNoHz7B+mUwDvV9z2virX+huGzNxaPErKBRj/V5b/UFtgTSZvGr6do5aFOat
         VYYnUKLrmJqXSquuVFgPaE7HmZr3UWnFhN1u8XR6/Z8RWXOFmUPlF7I6HcHYsWTMuMKk
         YtlFHVfFO0nyXGGnFpnPOvjkip7uILt1BvAdiETeKuH3aHUQlVvQWqPkDUCWECx1SGOv
         iJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrydWaFk/FmvpTNJ81aRXmEUTc7QYMAkqSNFG9NbJpdUChkz4rqjt7yBt8Tgk19AuGvVL8z3jOeA2R9xuI@lists.linux.dev
X-Gm-Message-State: AOJu0YyYNlx3UvxpbAcfdOPyiA6v2sKCmGTCwn52cG71ER1NMHrmI5mj
	ymi3kGiirnianZwwJxx+8tRpzQIg/avJQl28QKmcMoENGUlLr0ltu5pw
X-Gm-Gg: ATEYQzxjJSpxJIDdXsjlYLxmDFX+x3JDFxO8hkj8fimz01W3rV2VBL3OgtN4ZhvG99u
	yzu/4JuVAAr+r40rSMfBZW417Lt0jUc2j18rg0pvRt+83+/1FxQjEZi7Ph0YHzNnrzt1/qX0ifm
	MmJxVuJPG2qjnVcYBxxNZVgIazqt88q1hnTsqnyi+o3HbVnKswLtARfRWRnMn5SflXCyra29Boi
	bMEMMTNxkx8T+09QwKDhJZUtAtx3LslSkHZRrH0dI3eEaQVISJa7pHpFThRmQzZKGCML2g36FQ4
	vgnARPvDYmZuFC1f+MipZbgViTPtg6ZEZCRuLJGLJp4f3hr+jsk9y7SOrSv/0WWPwRe52IZuZgu
	fNNRxVmO71H7BgYy7ghDvnq952KRuFt/e/sbKloOkjq9Qea70eQArVagEZ8BIAQ4eW4NDaN0HgO
	xEPKfgTn1ey1o+ePP7doBArLCjDc4AB1pb7A==
X-Received: by 2002:a17:902:ef4d:b0:2b0:5520:f49c with SMTP id d9443c01a7336-2b06e39a1dfmr83537885ad.25.1773929480129;
        Thu, 19 Mar 2026 07:11:20 -0700 (PDT)
Received: from aadarsh.. ([2409:40d0:11f4:e9ce:f110:1acf:6031:3b39])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b06e5ef3d1sm54781385ad.38.2026.03.19.07.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:11:19 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: luka.gejak@linux.dev
Cc: aadarshmandal9354@gmail.com,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: removed dead code
Date: Thu, 19 Mar 2026 19:41:09 +0530
Message-ID: <20260319141109.7212-1-aadarshmandal9354@gmail.com>
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
