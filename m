Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE9138F92A;
	Mon, 27 Apr 2026 03:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261858; cv=none; b=YozmIN8OKgePRkNHS675qbUqtc6PTaZwbM/UVcSEGPFIICPmzFxv7RLGEJtq0TUogAyg4xqRr1oPK6vgzd6rK6T0wkwaKk5ysK6grhYATQusBCPSB1dVWNBQCDy0BMH096QPOeZFX0L1LdJdAHbgPQeReArzF2ybHvK+50Lk+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261858; c=relaxed/simple;
	bh=+g4jVCRXNnoC7HPhATNdoo43pEd/wVNe9L+jmkbr8CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyjxDt1ubqtjZPoVNYmrrUuqTQyKG2CMliRwGujvabmRefxJ6DrI42TGXF84JaKu2Bbq7IK7L9Te3pPvMCmPSxZYeyguCuqPJSjzyPsC3h/x9ZmAAT5xwvgMiHW/Qy8e00TtQrOVBYqTad4zozv+A3ny457qKbfIe91YJpoIUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UvE9EiMr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UvE9EiMr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AD9C19425;
	Mon, 27 Apr 2026 03:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261858;
	bh=+g4jVCRXNnoC7HPhATNdoo43pEd/wVNe9L+jmkbr8CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvE9EiMrKOj95XVvySVRXA14ZM0LOaqxEl8i8vIn+ZFKYARFkkVNttCt/YL+pVCRK
	 7zOphjLQmvIcmNDMPZZjEtKdAAyg2UU796HpnbacQQMn5SW6ciscC6MFuQ/LevHBIQ
	 o6/MaQCkpyxZY5STTKuypCSNZ9zsOxsSRlIpyByw=
Date: Sun, 26 Apr 2026 21:57:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Josh Hesketh <josh.hesketh@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>,
	Luka Gejak <lukagejak5@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: remove commented out dead
 code in sdio_halinit.c
Message-ID: <2026042619-identify-elective-b85f@gregkh>
References: <20260412150633.12071-1-josh.hesketh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412150633.12071-1-josh.hesketh@gmail.com>

On Sun, Apr 12, 2026 at 04:06:31PM +0100, Josh Hesketh wrote:
> Remove commented out dead code that have been dead since the
> driver was introduced to staging. Code can be recovered from
> git history if needed.
> 
> Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> ---
> v2:
>  - Rebased on staging-next
>  - Split into separate patches per feedback
>  - Removed commented out dead code instead of fixing whitespace
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 24 --------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index f2f73c65a636..4d74b14c3cd4 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -46,8 +46,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  	u16 value16;
>  	u32 value32;
>  	u8 ret;
> -/* 	u8 bMacPwrCtrlOn; */
> -
>  
>  	/*  all of these MUST be configured before power on */
>  
> @@ -69,10 +67,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  	value16 |= EnPDN; /*  Enable HW power down and RF on */
>  	rtw_write16(padapter, REG_APS_FSMCO, value16);
>  
> -	/*  Enable CMD53 R/W Operation */
> -/* 	bMacPwrCtrlOn = true; */
> -/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
> -
>  	rtw_write8(padapter, REG_CR, 0x00);
>  	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
>  	value16 = rtw_read16(padapter, REG_CR);
> @@ -359,7 +353,6 @@ static void _InitNetworkType(struct adapter *padapter)
>  	value32 = rtw_read32(padapter, REG_CR);
>  
>  	/*  TODO: use the other function to set network type */
> -/* 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
>  	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
>  
>  	rtw_write32(padapter, REG_CR, value32);
> @@ -486,9 +479,6 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
>  {
>  	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
>  
> -	/*  Tx aggregation setting */
> -/* 	sdio_AggSettingTxUpdate(padapter); */
> -
>  	/*  Rx aggregation setting */
>  	HalRxAggr8723BSdio(padapter);
>  
> @@ -640,9 +630,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  		return _SUCCESS;
>  	}
>  
> -	/*  Disable Interrupt first. */
> -/* 	rtw_hal_disable_interrupt(padapter); */
> -
>  	ret = _InitPowerOn_8723BS(padapter);
>  	if (ret == _FAIL)
>  		return _FAIL;
> @@ -661,8 +648,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  
>  	rtl8723b_InitializeFirmwareVars(padapter);
>  
> -/* 	SIC_Init(padapter); */
> -
>  	if (pwrctrlpriv->reg_rfoff)
>  		pwrctrlpriv->rf_pwrstate = rf_off;
>  
> @@ -745,11 +730,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv.channel,
>  		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);
>  
> -	/*  Record original value for template. This is arough data, we can only use the data */
> -	/*  for power adjust. The value can not be adjustde according to different power!!! */
> -/* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
> -/* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
> -
>  	rtl8723b_InitAntenna_Selection(padapter);
>  
>  	/*  */
> @@ -791,8 +771,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  	/* ack for xmit mgmt frames. */
>  	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
>  
> -/* 	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
> -
>  	{
>  		pwrctrlpriv->rf_pwrstate = rf_on;
>  
> @@ -1080,8 +1058,6 @@ static void _ReadPROMContent(struct adapter *padapter)
>  	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
>  	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
>  
> -/* 	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
> -
>  	_ReadEfuseInfo8723BS(padapter);
>  }
>  
> -- 
> 2.53.0
> 
> 

Does not apply to my tree anymore :(
