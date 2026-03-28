Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB52D6407
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711061; cv=none; b=aGlDBel8LwfTwePgvnirl12ossy3m4ysbLNVvnemxzjMnpcFztTcMsR7UTWDl/jJLidZufY1vxy1YPbu8g6lRQs1eY1bV58hb41wTIwYS4axPEj+xEeBjHB9PDlvTLEA3TcWKs6N6lwvScwbXMcYrqEhxdjLIcgPoQ9YeoKs/zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711061; c=relaxed/simple;
	bh=1OphPQRI1j0wicxzEux2Iz4eW7vHsJnCW2fAjYoMVn0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=aR/MD0VmmjkmR57ZpfFh0SQKkkm3Ih38i7bwzVl254sY6x8mAQDVr9+QtAvVWfuGm/TsV6y7xdP+6sikQ87WcCaRo6typaEgS36GoHvPs953IP0QV+52iAVw5tLhfFw2OwhCL5xHQD0na9Cgcl67jOYxeYLM8A0OrAx0hDbtOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vYNuCAal; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vYNuCAal"
Date: Sat, 28 Mar 2026 16:17:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774711057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLhsWq3yA8A8CRFAhqRbwLzKjmbemage5Kbc2HYtnlE=;
	b=vYNuCAalVagE0lKninsuSlvGic67O7Ig2/f6l78910J6bht16DeLwYhaayNFSeczMtdH08
	3y4656Eoqim5QmOX5bABWEsbxjQB2tDajRrB7rVGn4uUqfii48O2d15i4P+CbVSv5xvSVm
	VmAC41RjIXhZu8iPOOOD1HwpgEM1lr8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>, gregkh@linuxfoundation.org
CC: dan.carpenter@linaro.org, ethantidmore06@gmail.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 straube.linux@gmail.com
Subject: Re: [PATCH v8] staging: rtl8723bs: remove commented-out code
In-Reply-To: <20260328033128.27946-1-aadarshmandal9354@gmail.com>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com> <20260328033128.27946-1-aadarshmandal9354@gmail.com>
Message-ID: <99D7E656-D6B0-4FB4-A6D8-A355DBF5E2AD@linux.dev>
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

On March 28, 2026 4:31:28 AM GMT+01:00, Aadarsh Mandal <aadarshmandal9354@g=
mail=2Ecom> wrote:
>Remove code that is not used anywhere in driver=2E
>
>Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail=2Ecom>
>---
>v7:
> - Change in commit style=2E
>v6:
> - Change in commit style=2E
>v5:
> - Change in commit style=2E
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
>---
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 31 +-------------------
> 1 file changed, 1 insertion(+), 30 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/sta=
ging/rtl8723bs/hal/sdio_halinit=2Ec
>index f2f73c65a636=2E=2Ed0b0e7adb68f 100644
>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>@@ -46,8 +46,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
> 	u16 value16;
> 	u32 value32;
> 	u8 ret;
>-/* 	u8 bMacPwrCtrlOn; */
>-
>=20
> 	/*  all of these MUST be configured before power on */
>=20
>@@ -69,10 +67,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
> 	value16 |=3D EnPDN; /*  Enable HW power down and RF on */
> 	rtw_write16(padapter, REG_APS_FSMCO, value16);
>=20
>-	/*  Enable CMD53 R/W Operation */
>-/* 	bMacPwrCtrlOn =3D true; */
>-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
>-
> 	rtw_write8(padapter, REG_CR, 0x00);
> 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
> 	value16 =3D rtw_read16(padapter, REG_CR);
>@@ -359,7 +353,6 @@ static void _InitNetworkType(struct adapter *padapter=
)
> 	value32 =3D rtw_read32(padapter, REG_CR);
>=20
> 	/*  TODO: use the other function to set network type */
>-/* 	value32 =3D (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
> 	value32 =3D (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
>=20
> 	rtw_write32(padapter, REG_CR, value32);
>@@ -410,9 +403,6 @@ static void _InitAdaptiveCtrl(struct adapter *padapte=
r)
> 	value32 |=3D RATE_RRSR_CCK_ONLY_1M;
> 	rtw_write32(padapter, REG_RRSR, value32);
>=20
>-	/*  CF-END Threshold */
>-	/* m_spIoBase->rtw_write8(REG_CFEND_TH, 0x1); */
>-
> 	/*  SIFS (used in NAV) */
> 	value16 =3D _SPEC_SIFS_CCK(0x10) | _SPEC_SIFS_OFDM(0x10);
> 	rtw_write16(padapter, REG_SPEC_SIFS, value16);
>@@ -484,10 +474,7 @@ static void sdio_AggSettingRxUpdate(struct adapter *=
padapter)
>=20
> static void _initSdioAggregationSetting(struct adapter *padapter)
> {
>-	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
>-
>-	/*  Tx aggregation setting */
>-/* 	sdio_AggSettingTxUpdate(padapter); */
>+	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
>=20
> 	/*  Rx aggregation setting */
> 	HalRxAggr8723BSdio(padapter);
>@@ -640,9 +627,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
> 		return _SUCCESS;
> 	}
>=20
>-	/*  Disable Interrupt first=2E */
>-/* 	rtw_hal_disable_interrupt(padapter); */
>-
> 	ret =3D _InitPowerOn_8723BS(padapter);
> 	if (ret =3D=3D _FAIL)
> 		return _FAIL;
>@@ -661,8 +645,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>=20
> 	rtl8723b_InitializeFirmwareVars(padapter);
>=20
>-/* 	SIC_Init(padapter); */
>-
> 	if (pwrctrlpriv->reg_rfoff)
> 		pwrctrlpriv->rf_pwrstate =3D rf_off;
>=20
>@@ -704,8 +686,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
> 	pHalData->RfRegChnlVal[1] =3D
> 		PHY_QueryRFReg(padapter, (enum rf_path)1, RF_CHNLBW, bRFRegOffsetMask)=
;
>=20
>-
>-	/* if (!pHalData->bMACFuncEnable) { */
> 	_InitQueueReservedPage(padapter);
> 	_InitTxBufferBoundary(padapter);
>=20
>@@ -745,11 +725,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
> 	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv=2Echannel,
> 		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFS=
ET_DONT_CARE);
>=20
>-	/*  Record original value for template=2E This is arough data, we can o=
nly use the data */
>-	/*  for power adjust=2E The value can not be adjustde according to diff=
erent power!!! */
>-/* 	pHalData->OriginalCckTxPwrIdx =3D pHalData->CurrentCckTxPwrIdx; */
>-/* 	pHalData->OriginalOfdm24GTxPwrIdx =3D pHalData->CurrentOfdm24GTxPwrI=
dx; */
>-
> 	rtl8723b_InitAntenna_Selection(padapter);
>=20
> 	/*  */
>@@ -791,8 +766,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
> 	/* ack for xmit mgmt frames=2E */
> 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_=
TXQ_CTRL) | BIT(12));
>=20
>-/* 	pHalData->PreRpwmVal =3D SdioLocalCmd52Read1Byte(padapter, SDIO_REG_=
HRPWM1) & 0x80; */
>-
> 	{
> 		pwrctrlpriv->rf_pwrstate =3D rf_on;
>=20
>@@ -1080,8 +1053,6 @@ static void _ReadPROMContent(struct adapter *padapt=
er)
> 	pEEPROM->EepromOrEfuse =3D (eeValue & BOOT_FROM_EEPROM) ? true : false;
> 	pEEPROM->bautoload_fail_flag =3D (eeValue & EEPROM_EN) ? false : true;
>=20
>-/* 	pHalData->EEType =3D IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : E=
EPROM_BOOT_EFUSE; */
>-
> 	_ReadEfuseInfo8723BS(padapter);
> }
>=20

Looking good to me, applies cleanly=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
