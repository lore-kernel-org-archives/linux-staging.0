Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE253C3BE8
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363354; cv=none; b=O+QKb1HwHMYKDA9fR4x0jxL94O3k/jdQ7X973jTNLY0tjNSDRRYCwDahkQx1uA/sQ46gUXAbfIDo+uM1EW9YwZHf2toEc7oxnUYig34N6mLpWOmb4ZT5cg0FC3uaqUThLYhdNPZsTQZ1NKhA1xmdcy5ccr4Z1f/j+Brg6/3gVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363354; c=relaxed/simple;
	bh=IfusTFgHV+ADsuryTpD4Q7uA8yj63ikIDnP9L4UJxko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjbK7oAL4jZWHgXo14c/17Mt6F8pBlZxh63CQCpuKO3fKCd2TXee5W2uRJoOwxRu25bW5ewBOwi7CJeOaOmepVuPGhG+8riGvJQGseluCkvU7nRnNG2NGVQ6y6ahKCRZlNKPhtOlZOyw4C1jfgU+Aur2avpOlFo4Y5qUkmyiTGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=lJruPlah; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="lJruPlah"
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:1199:0:640:2d84:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id C15E8C12D4;
	Thu, 21 May 2026 14:28:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp) with ESMTPSA id 9SRvsB1T7qM0-Lu0PumRs;
	Thu, 21 May 2026 14:28:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779362892;
	bh=shqZnsVkp8hA1UHYSKr3VicqH1oIsvGjRrTg1KITTY8=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=lJruPlahWeqv2tjjhuEcU8NN1+ru5cytIdRnKrdpFnONlXNkRIgb2arUkNUcB7Gct
	 kj0S8p7m5fZhdqJfBmOza5h7tYOCKQcz0mO+Y1000BGCM4JeehE/+we8KrscOvPdlA
	 tuIi6nZJyScwuBTge/q12JaQkmTd+aUZ6iEEwM5Q=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <cc1b42a5-131b-40b1-ae80-eade779205f1@sezginduran.net>
Date: Thu, 21 May 2026 14:28:09 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] staging: rtl8723bs: remove excessive whitespace in
 hal/sdio_halinit.c
Content-Language: tr
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 error27@gmail.com
References: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
 <20260521112345.16604-4-artur.ugnivenko@gmx.de>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260521112345.16604-4-artur.ugnivenko@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 2:23 PM, Artur Ugnivenko wrote:
> Fix checkpatch warnings on excessive empty lines after closing brackets,
> after opening brackets and multiple empty lines at once.
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> ---
>   drivers/staging/rtl8723bs/hal/sdio_halinit.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index 3756b8e3d8e9..e6570fa2e8fd 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -21,7 +21,6 @@ static u8 CardEnable(struct adapter *padapter)
>   	u8 bMacPwrCtrlOn;
>   	u8 ret = _FAIL;
>   
> -
>   	rtw_hal_get_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
>   	if (!bMacPwrCtrlOn) {
>   		/*  RSV_CTRL 0x1C[7:0] = 0x00 */
> @@ -235,7 +234,6 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
>   	_InitNormalChipRegPriority(
>   		Adapter, value, value, value, value, value, value
>   	);
> -
>   }
>   
>   static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
> @@ -244,7 +242,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
>   	struct registry_priv *pregistrypriv = &Adapter->registrypriv;
>   	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
>   
> -
>   	u16 valueHi = 0;
>   	u16 valueLow = 0;
>   
> @@ -283,7 +280,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
>   	}
>   
>   	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
> -
>   }
>   
>   static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
> @@ -328,8 +324,6 @@ static void _InitQueuePriority(struct adapter *Adapter)
>   	default:
>   		break;
>   	}
> -
> -
>   }
>   
>   static void _InitPageBoundary(struct adapter *padapter)
> @@ -372,7 +366,6 @@ static void _InitWMACSetting(struct adapter *padapter)
>   	struct hal_com_data *pHalData;
>   	u16 value16;
>   
> -
>   	pHalData = GET_HAL_DATA(padapter);
>   
>   	pHalData->ReceiveConfig = 0;
> @@ -526,7 +519,6 @@ static void _InitOperationMode(struct adapter *padapter)
>   	}
>   
>   	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
> -
>   }
>   
>   static void _InitInterrupt(struct adapter *padapter)
> @@ -569,7 +561,6 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
>   	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
>   	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
>   
> -
>   	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
>   
>   	/*  2010/08/25 MH INF priority > PDN Efuse value. */
> @@ -613,7 +604,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>   		/* do polling cpwm */
>   		start_time = jiffies;
>   		do {
> -
>   			mdelay(1);
>   
>   			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
> @@ -744,7 +734,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>   	/*  set 0x0 to 0xFF by tynli. Default enable HW SEQ NUM. */
>   	rtw_write8(padapter, REG_HWSEQ_CTRL, 0xFF);
>   
> -
>   	/*  */
>   	/*  Configure SDIO TxRx Control to enable Rx DMA timer masking. */
>   	/*  2010.02.24. */
> @@ -753,7 +742,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>   
>   	_RfPowerSave(padapter);
>   
> -
>   	rtl8723b_InitHalDm(padapter);
>   
>   	/*  */
> @@ -916,7 +904,6 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
>   				}
>   
>   				adapter_to_pwrctl(padapter)->pre_ips_type = 0;
> -
>   			} else {
>   				CardDisableRTL8723BSdio(padapter);
>   
> @@ -935,7 +922,6 @@ void rtl8723bs_init_default_value(struct adapter *padapter)
>   {
>   	struct hal_com_data *pHalData;
>   
> -
>   	pHalData = GET_HAL_DATA(padapter);
>   
>   	rtl8723b_init_default_value(padapter);
> @@ -951,7 +937,6 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
>   	struct registry_priv *pregistrypriv = &padapter->registrypriv;
>   	bool bWiFiConfig = pregistrypriv->wifi_spec;
>   
> -
>   	pdvobjpriv->RtOutPipe[0] = WLAN_TX_HIQ_DEVICE_ID;
>   	pdvobjpriv->RtOutPipe[1] = WLAN_TX_MIQ_DEVICE_ID;
>   	pdvobjpriv->RtOutPipe[2] = WLAN_TX_LOQ_DEVICE_ID;
> @@ -1003,7 +988,6 @@ static void _ReadRFType(struct adapter *Adapter)
>   	pHalData->rf_chip = RF_6052;
>   }
>   
> -
>   static void Hal_EfuseParseMACAddr_8723BS(
>   	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
>   )
> @@ -1098,7 +1082,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
>   	if (!padapter->hw_init_completed)
>   		_InitPowerOn_8723BS(padapter);
>   
> -
>   	val8 = rtw_read8(padapter, 0x4e);
>   	val8 |= BIT(6);
>   	rtw_write8(padapter, 0x4e, val8);

Doesn't apply to the staging-testing branch.

Regards,
Ahmet Sezgin Duran
