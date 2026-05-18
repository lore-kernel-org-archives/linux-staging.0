Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922D388375;
	Mon, 18 May 2026 05:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081213; cv=none; b=UXKAVsNXES+FCx1C8KJ1LJkrf+9465X2AhDqDZMhLl0nXUvmOzJxpSMEa/FfSnsgFUDPUviAK+LObBDRl4BvlPY6SIcChZ6wEP0ByKROMV11i/N08iIAKu0f42ZdZZMvyiG8BEcnAQmhoTGgAn//TvYAu0e4ldu0WUMQ6T1tq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081213; c=relaxed/simple;
	bh=uCQVNpx9LvUWUyAWIk+esl0XfHOVObCjeS9eS0MamCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBlp1oArkU6ixn60cDi4uJNa+bARAfJcNEH32cbZjBVtDCosCsJdOUzdOTb4c5DVwGv/Kulpc6ab0VEY4lFUbT1UdOMJvuwKttuHgUupy3HTAE3FLPMutxBMhlW82SOn2r1ezztfGISFkjuwRcdZr+NqXB0J1fAIUTsx6jMU7lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VIiBsCXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VIiBsCXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767D8C2BCF7;
	Mon, 18 May 2026 05:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779081212;
	bh=uCQVNpx9LvUWUyAWIk+esl0XfHOVObCjeS9eS0MamCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIiBsCXJlRc/xUUlMi1HtIY8h5l5BNYCozoLi/wqybq9JTmG/NcqgkQsdh3yvN7mG
	 xeyixc2vLeokSQVMj4pEhOy9XZnMyqxADTAM7M1XGZTTecAg4T7b5Zx8qKiuPy3dUC
	 uDd8eEoqpp90v+O8P0V8mDFUUeTcs09e1mXoNSv8=
Date: Mon, 18 May 2026 07:13:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>
Cc: ahmet@sezginduran.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: clean up style in
 hal/sdio_halinit.c
Message-ID: <2026051819-twiddle-broadcast-5aa7@gregkh>
References: <27a0c849-7aba-4ee6-89b6-362e1eb9c43d@sezginduran.net>
 <20260517210237.27136-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517210237.27136-1-artur.ugnivenko@gmx.de>

On Sun, May 17, 2026 at 11:02:37PM +0200, Artur Ugnivenko wrote:
> Fix checkpatch style warnings in hal/sdio_halinit.c:
> - excessive empty lines
> - inconsistent braces in if/else statements
> - long lines (very long function calls)
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> ---
> Changes in v2: make the patch apply to gregkh/staging-testing
> 
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 133 +++++++++++--------
>  1 file changed, 78 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index 1e0498268aee..27c5d23662e4 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -21,20 +21,24 @@ static u8 CardEnable(struct adapter *padapter)
>  	u8 bMacPwrCtrlOn;
>  	u8 ret = _FAIL;
>  
> -
>  	rtw_hal_get_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
>  	if (!bMacPwrCtrlOn) {
>  		/*  RSV_CTRL 0x1C[7:0] = 0x00 */
>  		/*  unlock ISO/CLK/Power control register */
>  		rtw_write8(padapter, REG_RSV_CTRL, 0x0);
>  
> -		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
> +		ret = HalPwrSeqCmdParsing(padapter,
> +					  PWR_CUT_ALL_MSK,
> +					  PWR_FAB_ALL_MSK,
> +					  PWR_INTF_SDIO_MSK,
> +					  rtl8723B_card_enable_flow);
>  		if (ret == _SUCCESS) {
>  			bMacPwrCtrlOn = true;
>  			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
>  		}
> -	} else
> +	} else {
>  		ret = _SUCCESS;
> +	}
>  
>  	return ret;
>  }
> @@ -70,7 +74,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  	rtw_write8(padapter, REG_CR, 0x00);
>  	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
>  	value16 = rtw_read16(padapter, REG_CR);
> -	value16 |= (
> +	value16 |=
>  		HCI_TXDMA_EN |
>  		HCI_RXDMA_EN |
>  		TXDMA_EN |
> @@ -78,8 +82,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  		PROTOCOL_EN |
>  		SCHEDULE_EN |
>  		ENSEC |
> -		CALTMR_EN
> -	);
> +		CALTMR_EN;
>  	rtw_write16(padapter, REG_CR, value16);
>  
>  	hal_btcoex_PowerOnSetting(padapter);
> @@ -105,7 +108,11 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  }
>  
>  /* Tx Page FIFO threshold */
> -static void _init_available_page_threshold(struct adapter *padapter, u8 numHQ, u8 numNQ, u8 numLQ, u8 numPubQ)
> +static void _init_available_page_threshold(struct adapter *padapter,
> +					   u8 numHQ,
> +					   u8 numNQ,
> +					   u8 numLQ,
> +					   u8 numPubQ)
>  {
>  	u16 HQ_threshold, NQ_threshold, LQ_threshold;
>  
> @@ -180,15 +187,13 @@ static void _InitTxBufferBoundary(struct adapter *padapter)
>  	rtw_write8(padapter, REG_TDECTRL + 1, txpktbuf_bndy);
>  }
>  
> -static void _InitNormalChipRegPriority(
> -	struct adapter *Adapter,
> -	u16 beQ,
> -	u16 bkQ,
> -	u16 viQ,
> -	u16 voQ,
> -	u16 mgtQ,
> -	u16 hiQ
> -)
> +static void _InitNormalChipRegPriority(struct adapter *Adapter,
> +				       u16 beQ,
> +				       u16 bkQ,
> +				       u16 viQ,
> +				       u16 voQ,
> +				       u16 mgtQ,
> +				       u16 hiQ)
>  {
>  	u16 value16 = (rtw_read16(Adapter, REG_TRXDMA_CTRL) & 0x7);
>  
> @@ -223,10 +228,13 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
>  		break;
>  	}
>  
> -	_InitNormalChipRegPriority(
> -		Adapter, value, value, value, value, value, value
> -	);
> -
> +	_InitNormalChipRegPriority(Adapter,
> +				   value,
> +				   value,
> +				   value,
> +				   value,
> +				   value,
> +				   value);
>  }
>  
>  static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
> @@ -235,7 +243,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
>  	struct registry_priv *pregistrypriv = &Adapter->registrypriv;
>  	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
>  
> -
>  	u16 valueHi = 0;
>  	u16 valueLow = 0;
>  
> @@ -274,7 +281,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
>  	}
>  
>  	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
> -
>  }
>  
>  static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
> @@ -319,8 +325,6 @@ static void _InitQueuePriority(struct adapter *Adapter)
>  	default:
>  		break;
>  	}
> -
> -
>  }
>  
>  static void _InitPageBoundary(struct adapter *padapter)
> @@ -363,7 +367,6 @@ static void _InitWMACSetting(struct adapter *padapter)
>  	struct hal_com_data *pHalData;
>  	u16 value16;
>  
> -
>  	pHalData = GET_HAL_DATA(padapter);
>  
>  	pHalData->ReceiveConfig = 0;
> @@ -517,7 +520,6 @@ static void _InitOperationMode(struct adapter *padapter)
>  	}
>  
>  	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
> -
>  }
>  
>  static void _InitInterrupt(struct adapter *padapter)
> @@ -560,7 +562,6 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
>  	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
>  	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
>  
> -
>  	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
>  
>  	/*  2010/08/25 MH INF priority > PDN Efuse value. */
> @@ -604,7 +605,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  		/* do polling cpwm */
>  		start_time = jiffies;
>  		do {
> -
>  			mdelay(1);
>  
>  			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
> @@ -720,8 +720,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  
>  	invalidate_cam_all(padapter);
>  
> -	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv.channel,
> -		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);
> +	rtw_hal_set_chnl_bw(padapter,
> +			    padapter->registrypriv.channel,
> +			    CHANNEL_WIDTH_20,
> +			    HAL_PRIME_CHNL_OFFSET_DONT_CARE,
> +			    HAL_PRIME_CHNL_OFFSET_DONT_CARE);
>  
>  	rtl8723b_InitAntenna_Selection(padapter);
>  
> @@ -735,7 +738,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  	/*  set 0x0 to 0xFF by tynli. Default enable HW SEQ NUM. */
>  	rtw_write8(padapter, REG_HWSEQ_CTRL, 0xFF);
>  
> -
>  	/*  */
>  	/*  Configure SDIO TxRx Control to enable Rx DMA timer masking. */
>  	/*  2010.02.24. */
> @@ -744,7 +746,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  
>  	_RfPowerSave(padapter);
>  
> -
>  	rtl8723b_InitHalDm(padapter);
>  
>  	/*  */
> @@ -794,7 +795,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  
>  			restore_iqk_rst = pwrpriv->bips_processing;
>  			b2Ant = pHalData->EEPROMBluetoothAntNum == Ant_x2;
> -			PHY_IQCalibrate_8723B(padapter, false, restore_iqk_rst, b2Ant, pHalData->ant_path);
> +			PHY_IQCalibrate_8723B(padapter,
> +					      false,
> +					      restore_iqk_rst,
> +					      b2Ant,
> +					      pHalData->ant_path);
>  			pHalData->odmpriv.RFCalibrateInfo.bIQKInitialized = true;
>  
>  			hal_btcoex_IQKNotify(padapter, false);
> @@ -825,7 +830,11 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
>  	u8 bMacPwrCtrlOn;
>  
>  	/*  Run LPS WL RFOFF flow */
> -	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
> +	HalPwrSeqCmdParsing(padapter,
> +			    PWR_CUT_ALL_MSK,
> +			    PWR_FAB_ALL_MSK,
> +			    PWR_INTF_SDIO_MSK,
> +			    rtl8723B_enter_lps_flow);
>  
>  	/*	==== Reset digital sequence   ====== */
>  
> @@ -854,7 +863,11 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
>  
>  	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
>  	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
> -	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
> +	HalPwrSeqCmdParsing(padapter,
> +			    PWR_CUT_ALL_MSK,
> +			    PWR_FAB_ALL_MSK,
> +			    PWR_INTF_SDIO_MSK,
> +			    rtl8723B_card_disable_flow);
>  }
>  
>  u32 rtl8723bs_hal_deinit(struct adapter *padapter)
> @@ -866,7 +879,10 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
>  				u8 val8 = 0;
>  
>  				rtl8723b_set_FwPwrModeInIPS_cmd(padapter, 0x3);
> -				/* poll 0x1cc to make sure H2C command already finished by FW; MAC_0x1cc = 0 means H2C done by FW. */
> +				/*
> +				 * poll 0x1cc to make sure H2C command already finished by FW;
> +				 * MAC_0x1cc = 0 means H2C done by FW.
> +				 */
>  				do {
>  					val8 = rtw_read8(padapter, REG_HMETFR);
>  					cnt++;
> @@ -875,12 +891,16 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
>  				/* H2C done, enter 32k */
>  				if (val8 == 0) {
>  					/* set rpwm to enter 32k */
> -					val8 = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
> +					val8 = rtw_read8(padapter,
> +							 SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
>  					val8 += 0x80;
>  					val8 |= BIT(0);
> -					rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
> +					rtw_write8(padapter,
> +						   SDIO_LOCAL_BASE | SDIO_REG_HRPWM1,
> +						   val8);
>  					adapter_to_pwrctl(padapter)->tog = (val8 + 0x80) & 0x80;
> -					cnt = val8 = 0;
> +					cnt = 0;
> +					val8 = 0;
>  					do {
>  						val8 = rtw_read8(padapter, REG_CR);
>  						cnt++;
> @@ -908,7 +928,6 @@ void rtl8723bs_init_default_value(struct adapter *padapter)
>  {
>  	struct hal_com_data *pHalData;
>  
> -
>  	pHalData = GET_HAL_DATA(padapter);
>  
>  	rtl8723b_init_default_value(padapter);
> @@ -924,7 +943,6 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
>  	struct registry_priv *pregistrypriv = &padapter->registrypriv;
>  	bool bWiFiConfig = pregistrypriv->wifi_spec;
>  
> -
>  	pdvobjpriv->RtOutPipe[0] = WLAN_TX_HIQ_DEVICE_ID;
>  	pdvobjpriv->RtOutPipe[1] = WLAN_TX_MIQ_DEVICE_ID;
>  	pdvobjpriv->RtOutPipe[2] = WLAN_TX_LOQ_DEVICE_ID;
> @@ -976,10 +994,9 @@ static void _ReadRFType(struct adapter *Adapter)
>  	pHalData->rf_chip = RF_6052;
>  }
>  
> -
> -static void Hal_EfuseParseMACAddr_8723BS(
> -	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
> -)
> +static void Hal_EfuseParseMACAddr_8723BS(struct adapter *padapter,
> +					 u8 *hwinfo,
> +					 bool AutoLoadFail)
>  {
>  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
>  
> @@ -991,9 +1008,9 @@ static void Hal_EfuseParseMACAddr_8723BS(
>  	}
>  }
>  
> -static void Hal_EfuseParseBoardType_8723BS(
> -	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
> -)
> +static void Hal_EfuseParseBoardType_8723BS(struct adapter *padapter,
> +					   u8 *hwinfo,
> +					   bool AutoLoadFail)
>  {
>  	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
>  
> @@ -1001,8 +1018,9 @@ static void Hal_EfuseParseBoardType_8723BS(
>  		pHalData->BoardType = (hwinfo[EEPROM_RF_BOARD_OPTION_8723B] & 0xE0) >> 5;
>  		if (pHalData->BoardType == 0xFF)
>  			pHalData->BoardType = (EEPROM_DEFAULT_BOARD_OPTION & 0xE0) >> 5;
> -	} else
> +	} else {
>  		pHalData->BoardType = 0;
> +	}
>  }
>  
>  static void _ReadEfuseInfo8723BS(struct adapter *padapter)
> @@ -1070,7 +1088,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
>  	if (!padapter->hw_init_completed)
>  		_InitPowerOn_8723BS(padapter);
>  
> -
>  	val8 = rtw_read8(padapter, 0x4e);
>  	val8 |= BIT(6);
>  	rtw_write8(padapter, 0x4e, val8);
> @@ -1080,8 +1097,14 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
>  	_ReadPROMContent(padapter);
>  
>  	if (!padapter->hw_init_completed) {
> -		rtw_write8(padapter, 0x67, 0x00); /*  for BT, Switch Ant control to BT */
> -		CardDisableRTL8723BSdio(padapter);/* for the power consumption issue,  wifi ko module is loaded during booting, but wifi GUI is off */
> +		/* for BT, Switch Ant control to BT */
> +		rtw_write8(padapter, 0x67, 0x00);
> +
> +		/*
> +		 * for the power consumption issue, wifi ko module is loaded
> +		 * during booting, but wifi GUI is off
> +		 */
> +		CardDisableRTL8723BSdio(padapter);
>  	}
>  
>  	return _SUCCESS;
> @@ -1175,9 +1198,9 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
>  /*	Description: */
>  /*		Query setting of specified variable. */
>  /*  */
> -u8 GetHalDefVar8723BSDIO(
> -	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
> -)
> +u8 GetHalDefVar8723BSDIO(struct adapter *Adapter,
> +			 enum hal_def_variable eVariable,
> +			 void *pValue)
>  {
>  	u8 bResult = _SUCCESS;
>  
> -- 
> 2.54.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
