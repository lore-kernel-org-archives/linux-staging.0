Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C814C40DFA6
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019586; cv=none; b=eKtRKIprVGLZcsquU0wTwOsknb1NKnQZCD5AYhvKrBr+oEeGkrS0SR1rrpLLzhpOLX0FkUZzlztKDv4b3nkaHs+pO3kqnnEBRQ+Ls0/j5+OAGPS8lFCSZSW1TTurYHljyDUMN2wLZLAwvjgNsHC4v3hmSnd1c6dAvMnycs29nLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019586; c=relaxed/simple;
	bh=1AgKZbIo1nNG5qtD4Y7hz/tgg5Pl0fHs8hcn3vrt/sM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=H38HXb/nIuBl+tYJmzX7LTSl2/2XnOrq6yWuqN/T3pUsm1WkT0N+P1xlU4gSCGzvqduROdkax1k+CwbtBhZqWw+p3CK/NlvBf/BH8bKehImsAmlDGnZ9Nj1K8P3dL7LX4b0QMUUHFoT2ut+EaMVyjaeHnke8Pz58lZeUylH7J1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gbRZE1KN; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gbRZE1KN"
Date: Fri, 20 Mar 2026 16:12:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774019572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=axFOdb8jpWKuGxhMceF8xlohglf+vIU/eYlOcHhV0l8=;
	b=gbRZE1KNc6H808A8Oihhxanz5CSRiB6aq6Gy86HauxanhpdswAV3PKF3LDQ2pSaFFSJWns
	cnsjwb/FKGaclEP7euspHPB/tTnAktFIGne535nf7FS22LFzCRfWHynxehOpbna9S5DwWo
	GC51gi/XotG0ENr3k7Q80tRHihDnEQo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>, gregkh@linuxfoundation.org
CC: dan.carpenter@linaro.org, ethantidmore06@gmail.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 straube.linux@gmail.com, luka.gejak@linux.dev
Subject: Re: [PATCH v5] staging: rtl8723bs: cleaned up patch formatting
In-Reply-To: <20260320144653.33626-1-aadarshmandal9354@gmail.com>
References: <20260319141109.7212-1-aadarshmandal9354@gmail.com> <20260320144653.33626-1-aadarshmandal9354@gmail.com>
Message-ID: <B0959315-D773-47DD-8747-BA756CB78494@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On March 20, 2026 3:46:52 PM GMT+01:00, Aadarsh Mandal <aadarshmandal9354@g=
mail=2Ecom> wrote:
>Fix commit message formatting for the previous patch=2E
>
>Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail=2Ecom>
>---
>v4:
> - Remove extra space insertion=2E
> - Delete remaining commented-out code=2E
>v3:
> - Add the extra space that count as insertion=2E
> - Remove unwanted addition=2E
>v2:
> - Restore braces for standalone code blocks {}=2E
> - Delete reindented commented-out code and extra space=2E
>v1:
> - Reindented commented-out code;extra space remained=2E
>
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 17 -----------------
> 1 file changed, 17 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/sta=
ging/rtl8723bs/hal/sdio_halinit=2Ec
>index 063a0737933e=2E=2E96a0c8e304da 100644
>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>@@ -481,9 +481,6 @@ static void _initSdioAggregationSetting(struct adapte=
r *padapter)
> {
>	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
>
>-	/*  Tx aggregation setting */
>-/*	sdio_AggSettingTxUpdate(padapter); */
>-
>	/*  Rx aggregation setting */
>	HalRxAggr8723BSdio(padapter);
>
>@@ -635,9 +632,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>		return _SUCCESS;
>	}
>
>-	/*  Disable Interrupt first=2E */
>-/*	rtw_hal_disable_interrupt(padapter); */
>-
>	ret =3D _InitPowerOn_8723BS(padapter);
>	if (ret =3D=3D _FAIL)
>		return _FAIL;
>@@ -656,8 +650,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>
>	rtl8723b_InitializeFirmwareVars(padapter);
>
>-/*	SIC_Init(padapter); */
>-
>	if (pwrctrlpriv->reg_rfoff)
>		pwrctrlpriv->rf_pwrstate =3D rf_off;
>
>@@ -740,11 +732,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv=2Echannel,
>		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSE=
T_DONT_CARE);
>
>-	/*  Record original value for template=2E This is arough data, we can o=
nly use the data */
>-	/*  for power adjust=2E The value can not be adjustde according to diff=
erent power!!! */
>-/*	pHalData->OriginalCckTxPwrIdx =3D pHalData->CurrentCckTxPwrIdx; */
>-/*	pHalData->OriginalOfdm24GTxPwrIdx =3D pHalData->CurrentOfdm24GTxPwrId=
x; */
>-
>	rtl8723b_InitAntenna_Selection(padapter);
>
>	/*  */
>@@ -786,8 +773,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>	/* ack for xmit mgmt frames=2E */
>	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_T=
XQ_CTRL) | BIT(12));
>
>-/*	pHalData->PreRpwmVal =3D SdioLocalCmd52Read1Byte(padapter, SDIO_REG_H=
RPWM1) & 0x80; */
>-
>	{
>		pwrctrlpriv->rf_pwrstate =3D rf_on;
>
>@@ -1075,8 +1060,6 @@ static void _ReadPROMContent(struct adapter *padapt=
er)
>	pEEPROM->EepromOrEfuse =3D (eeValue & BOOT_FROM_EEPROM) ? true : false;
>	pEEPROM->bautoload_fail_flag =3D (eeValue & EEPROM_EN) ? false : true;
>
>-/*	pHalData->EEType =3D IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EE=
PROM_BOOT_EFUSE; */
>-
>	_ReadEfuseInfo8723BS(padapter);
> }
>
>--
>2=2E43=2E0

Your commit message can't be: "Fix commit message formatting=20
for the previous patch=2E" Instead, it should be something like=20
"Removed code that is not used anywhere in the driver=2E"
Sincerely,
Luka Gejak
