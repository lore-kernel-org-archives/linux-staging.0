Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764F8233722
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010379; cv=none; b=SYObpdVZfPlkve8QRAhBnfq9oaiCPtbekYi38BZrmvcRD/Oz2q2z02nVFG0FoOoV6GlJ/rEdP+WwDutn/krrzTSZhNAnf8wBxhU9buUdM8kWuu7ZNye2eqxn+1OexTNfz4zw9hX9VaWZIenEclajkVnDfoglmtlDOupHI2/WImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010379; c=relaxed/simple;
	bh=62R923OOZ6gZYoM55Qy9oiW3cCxs/uqgvP4Lz5rHpNA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fAdI5TkWF9u2sNbzUSE0rpHZ6PtZ1slb+P4O2sMVpVchuQK468IgPqtXBXKdEo94jZSN5+6lk7hC1/fMz7uS/kURQ5P2BuwqoGxR9CGyBx5iNy+nsd8rj1Te/ByOuM5oc4yq4sh2wX55ytWaNppRm9Xylnw7mFr6+V8BytfAnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gPY1qQ0y; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gPY1qQ0y"
Date: Sun, 12 Apr 2026 18:12:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776010375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28NRUOuWPHy7hHmhZnmWJ2GGd+4Ylul7bokkU6CJaRs=;
	b=gPY1qQ0yN3AHakqTZ1XsE+39MEzT/UZkC+zFV3J0GhhLHev8S0CCv+MFf+gGpHpNF3OA9e
	M57HPe4unl9UdN88EF3N6NqvdIP7KtY7vtDqmHCXweNosnN9n9oQm91gSb5e28xiAxUZy9
	fHQZ8IC/XmJreVW52AOeU8y7hEb1lFw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Josh Hesketh <josh.hesketh@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/3=5D_staging=3A_rtl8723bs=3A_remo?=
 =?US-ASCII?Q?ve_commented_out_dead_code_in_sdio=5Fhalinit=2Ec?=
In-Reply-To: <A851CDD7-4FD8-42AA-8E4F-3588B128E46F@linux.dev>
References: <20260412150633.12071-1-josh.hesketh@gmail.com> <A851CDD7-4FD8-42AA-8E4F-3588B128E46F@linux.dev>
Message-ID: <91F9C971-D0CE-4909-8E3A-85DB6734D136@linux.dev>
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

On April 12, 2026 6:05:11 PM GMT+02:00, Luka Gejak <lukagejak5@gmail=2Ecom>=
 wrote:
>LGTM=2E
>Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>
>On April 12, 2026 5:06:31 PM GMT+02:00, Josh Hesketh <josh=2Ehesketh@gmai=
l=2Ecom> wrote:
>>Remove commented out dead code that have been dead since the
>>driver was introduced to staging=2E Code can be recovered from
>>git history if needed=2E
>>
>>Signed-off-by: Josh Hesketh <josh=2Ehesketh@gmail=2Ecom>
>>---
>>v2:
>> - Rebased on staging-next
>> - Split into separate patches per feedback
>> - Removed commented out dead code instead of fixing whitespace
>> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 24 -------------------=
-
>> 1 file changed, 24 deletions(-)
>>
>>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/st=
aging/rtl8723bs/hal/sdio_halinit=2Ec
>>index f2f73c65a636=2E=2E4d74b14c3cd4 100644
>>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>>@@ -46,8 +46,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>> 	u16 value16;
>> 	u32 value32;
>> 	u8 ret;
>>-/* 	u8 bMacPwrCtrlOn; */
>>-
>>=20
>> 	/*  all of these MUST be configured before power on */
>>=20
>>@@ -69,10 +67,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>> 	value16 |=3D EnPDN; /*  Enable HW power down and RF on */
>> 	rtw_write16(padapter, REG_APS_FSMCO, value16);
>>=20
>>-	/*  Enable CMD53 R/W Operation */
>>-/* 	bMacPwrCtrlOn =3D true; */
>>-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
>>-
>> 	rtw_write8(padapter, REG_CR, 0x00);
>> 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
>> 	value16 =3D rtw_read16(padapter, REG_CR);
>>@@ -359,7 +353,6 @@ static void _InitNetworkType(struct adapter *padapte=
r)
>> 	value32 =3D rtw_read32(padapter, REG_CR);
>>=20
>> 	/*  TODO: use the other function to set network type */
>>-/* 	value32 =3D (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); *=
/
>> 	value32 =3D (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
>>=20
>> 	rtw_write32(padapter, REG_CR, value32);
>>@@ -486,9 +479,6 @@ static void _initSdioAggregationSetting(struct adapt=
er *padapter)
>> {
>> 	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
>>=20
>>-	/*  Tx aggregation setting */
>>-/* 	sdio_AggSettingTxUpdate(padapter); */
>>-
>> 	/*  Rx aggregation setting */
>> 	HalRxAggr8723BSdio(padapter);
>>=20
>>@@ -640,9 +630,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>> 		return _SUCCESS;
>> 	}
>>=20
>>-	/*  Disable Interrupt first=2E */
>>-/* 	rtw_hal_disable_interrupt(padapter); */
>>-
>> 	ret =3D _InitPowerOn_8723BS(padapter);
>> 	if (ret =3D=3D _FAIL)
>> 		return _FAIL;
>>@@ -661,8 +648,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>>=20
>> 	rtl8723b_InitializeFirmwareVars(padapter);
>>=20
>>-/* 	SIC_Init(padapter); */
>>-
>> 	if (pwrctrlpriv->reg_rfoff)
>> 		pwrctrlpriv->rf_pwrstate =3D rf_off;
>>=20
>>@@ -745,11 +730,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>> 	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv=2Echannel,
>> 		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFF=
SET_DONT_CARE);
>>=20
>>-	/*  Record original value for template=2E This is arough data, we can =
only use the data */
>>-	/*  for power adjust=2E The value can not be adjustde according to dif=
ferent power!!! */
>>-/* 	pHalData->OriginalCckTxPwrIdx =3D pHalData->CurrentCckTxPwrIdx; */
>>-/* 	pHalData->OriginalOfdm24GTxPwrIdx =3D pHalData->CurrentOfdm24GTxPwr=
Idx; */
>>-
>> 	rtl8723b_InitAntenna_Selection(padapter);
>>=20
>> 	/*  */
>>@@ -791,8 +771,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>> 	/* ack for xmit mgmt frames=2E */
>> 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW=
_TXQ_CTRL) | BIT(12));
>>=20
>>-/* 	pHalData->PreRpwmVal =3D SdioLocalCmd52Read1Byte(padapter, SDIO_REG=
_HRPWM1) & 0x80; */
>>-
>> 	{
>> 		pwrctrlpriv->rf_pwrstate =3D rf_on;
>>=20
>>@@ -1080,8 +1058,6 @@ static void _ReadPROMContent(struct adapter *padap=
ter)
>> 	pEEPROM->EepromOrEfuse =3D (eeValue & BOOT_FROM_EEPROM) ? true : false=
;
>> 	pEEPROM->bautoload_fail_flag =3D (eeValue & EEPROM_EN) ? false : true;
>>=20
>>-/* 	pHalData->EEType =3D IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : =
EEPROM_BOOT_EFUSE; */
>>-
>> 	_ReadEfuseInfo8723BS(padapter);
>> }
>>=20

EDIT: Sent from wrong email address(I hate thunderbird and I'm not=20
near my laptop)=2E
LGTM=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
