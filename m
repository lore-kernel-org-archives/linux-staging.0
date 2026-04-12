Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD8233722
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776009919; cv=none; b=kVOn028T9pOIVF4qsREn6X45fVVoTPARY7fA4EiXGdXPVdcJ8Bk6EYs/4E19CyuGpA3K7o42zY4Ay9YWY+0SQR6drJXaoLN9HHvP5XwlIq1cpHFXy/FDm451UspEvO3zvyKNP31mw2I0Su9zc7UOIQss3dgl0WebMmJ2WGplLpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776009919; c=relaxed/simple;
	bh=tBovWnNObEzNw2KsrwvW65q1Hxb+4dRW+dIhKIK0jGM=;
	h=From:Date:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dn5fuFJZYqyniyc8VA14jnhylM9/pnCgyDEeMpyHsLzkQoQJ2YM3Nhd9ftoqq2+2ImbKxKa4soasCcs6WFlKg/q5OUD3ICPRCLIw+XfAXy2CC1F00iLR/Nf+hEuM/1NNy0eJNOp7YiyrhD7cFrDNV/NQ+BOGt/q0T6ZCGHoCDwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrApvgmP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrApvgmP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488971db0fdso35815015e9.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776009916; x=1776614716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wC/3mbKh4Jia5xjgb7N3qVQgvwa11PmO5aeBln3pAXE=;
        b=HrApvgmPLQk4HKyEJm6gAJ9qczzONXlLMfz9r7Cly5nt14R6xo/UvgA9e+IL9kJIQ5
         kY8/V5abWyO03PQfJNU2aC6BCw2HCUsKImBy6CZ0A7wUU25M6uwG7cVL3a5eM1Z301tL
         P/+vao3BSigs6Vi/HgAq91To9RbQf89lNBLjsfl3uXgO1NfEyBJGmJE/9q3sRqylD5T7
         DGd0BFuiAXjMTfxqgWTb/jZ479YlPNQHhHX3MclsH4r0QIxtSy7WXyO8TA1KACZS/rNB
         P/yry9Vr6+jXNhmEnz3ETxSn22oKbgR49JWCIpg+COlMd6fqzhjj98ZejQixGXLq39WT
         5dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776009916; x=1776614716;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC/3mbKh4Jia5xjgb7N3qVQgvwa11PmO5aeBln3pAXE=;
        b=BNgA4FAvROO7scQeRLvijRxWdckGRnNXOphfh2TGX0uEaPjijf+2H12QZnqRSLGKkr
         sZlM4EylPeLvfgSPSSE+n11NIWdbRMfkCqvzRPoum/TjGCShMOWLNfHvMg7b7/aaQA3N
         w3mnO9etvMKFHfKAZV1+SFdXY3+UEwYaJlcNYw0T/25SPu8Gte1EADb6/2lHEjhEUMKz
         nahgNXfE4CXn8PZUS5mJ/UQ4EpHPRUy8LchleDz6ROZsQoFRuPI0llqo38JgV2HpEUwP
         4bMoYdgDo6kanq43ATc2o9khp+kYfDIOX2e6PCM3dc4e0cPU2XNmc8RP34QRQI0Leqq1
         eG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvGvLt2PQk6p2onG9qqHPytvvJhQsLl9ROzGYvnX1wItIr1yBwQqJtMkJ+x/jUAVgs9cBBccg4QMUUArxQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxXFeBcxofr6UryKRiJW7Vc6Qbc7SrpuBQ/tcmXzr0ezhIJ70n/
	7zRAr9S9/rLQef3+4QlOgaf/BuyU2+UK/NoZWhy13Jfv/yZAssyY/0U=
X-Gm-Gg: AeBDiesnKHbAXHjh+HdWpL87GYLXWh6o0X9l5sQxY2jzlUk6P/7oKNzKIKJ0GEN4Qn2
	xPzcL8aS9834JCByjC5Uqw1g7girQi7dS70vQohXdRYWLivgymBpQAJVYBqbbkq689kq2LGMuHQ
	EXh4YVTQCl0sOWOq14dIcXMpa/GHLtu8ZVllMumYcQ07lmA51RrBgz7A8n1Evz8P0W4d/ZSt37Y
	hVSGllPTWmKue8S9ilIvOUebccab4AYGCBclul/0UODr8KzDGQl+5h/+BpdenMz0icNNqFm00Gt
	9wkXfrNvEFrXfSXq3f/0s1k6rDIQU2wnZMlZ0MJcMcJUFBghjbl1FYHRIXXIBEJtl/4jbFV0QxN
	uAKaDp5WwKnAwjoJEr4qT5L02W14MJrMhXcPxMMJ5qGUuY3/R8yL5bVzIJb3giJuaqNlHSorZ4N
	k8Gb57yYnFgfnHACyYA8II6xd/zyScb/kaKjSmHrxblK5TbNwMxCyGVFL78zwCDIVWmrPT4nh9G
	p4NXKdZ6IBLTVXTq3zKzmA=
X-Received: by 2002:a05:600c:64c4:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-488d686c04fmr125862875e9.21.1776009916032;
        Sun, 12 Apr 2026 09:05:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([31.223.145.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f1f9sm280937675e9.1.2026.04.12.09.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 09:05:15 -0700 (PDT)
From: Luka Gejak <lukagejak5@gmail.com>
X-Google-Original-From: Luka Gejak <luka.gejak@linux.dev>
Date: Sun, 12 Apr 2026 18:05:11 +0200
To: Josh Hesketh <josh.hesketh@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/3=5D_staging=3A_rtl8723bs=3A_remo?=
 =?US-ASCII?Q?ve_commented_out_dead_code_in_sdio=5Fhalinit=2Ec?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260412150633.12071-1-josh.hesketh@gmail.com>
References: <20260412150633.12071-1-josh.hesketh@gmail.com>
Message-ID: <A851CDD7-4FD8-42AA-8E4F-3588B128E46F@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

LGTM=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

On April 12, 2026 5:06:31 PM GMT+02:00, Josh Hesketh <josh=2Ehesketh@gmail=
=2Ecom> wrote:
>Remove commented out dead code that have been dead since the
>driver was introduced to staging=2E Code can be recovered from
>git history if needed=2E
>
>Signed-off-by: Josh Hesketh <josh=2Ehesketh@gmail=2Ecom>
>---
>v2:
> - Rebased on staging-next
> - Split into separate patches per feedback
> - Removed commented out dead code instead of fixing whitespace
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 24 --------------------
> 1 file changed, 24 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/sta=
ging/rtl8723bs/hal/sdio_halinit=2Ec
>index f2f73c65a636=2E=2E4d74b14c3cd4 100644
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
>@@ -486,9 +479,6 @@ static void _initSdioAggregationSetting(struct adapte=
r *padapter)
> {
> 	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
>=20
>-	/*  Tx aggregation setting */
>-/* 	sdio_AggSettingTxUpdate(padapter); */
>-
> 	/*  Rx aggregation setting */
> 	HalRxAggr8723BSdio(padapter);
>=20
>@@ -640,9 +630,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
> 		return _SUCCESS;
> 	}
>=20
>-	/*  Disable Interrupt first=2E */
>-/* 	rtw_hal_disable_interrupt(padapter); */
>-
> 	ret =3D _InitPowerOn_8723BS(padapter);
> 	if (ret =3D=3D _FAIL)
> 		return _FAIL;
>@@ -661,8 +648,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>=20
> 	rtl8723b_InitializeFirmwareVars(padapter);
>=20
>-/* 	SIC_Init(padapter); */
>-
> 	if (pwrctrlpriv->reg_rfoff)
> 		pwrctrlpriv->rf_pwrstate =3D rf_off;
>=20
>@@ -745,11 +730,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
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
>@@ -791,8 +771,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
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
>@@ -1080,8 +1058,6 @@ static void _ReadPROMContent(struct adapter *padapt=
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
