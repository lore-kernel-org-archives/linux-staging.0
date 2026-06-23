Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F063D3008;
	Tue, 23 Jun 2026 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214792; cv=none; b=ubjSKDpxuZZzmxW/HFRDYCPQRitdER/CgebiDhG2JYYTN3CQEVpelYP+Zts4T/4YZJsxmnGQNuWVijncRmLGxjv7i0PI6doaaGWvuX1BfiaGgE/3+9Wic3YA4QtnpKGRRt6gWzN11gB72HWicbdsGAoCao6ou2HeMoshDExJx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214792; c=relaxed/simple;
	bh=wmWpqsMqe50cvixzKDYKLUUZqsco/dMq19UuIpvpEJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOqGBfCYPrfcnThRlVyNzfPs8B4Oijuny4DeFy5ZPMjduvmcKXdwknIU6o5Y09eBZ2Z+UmUtCqLbAyfTyw/lkLkXFfk5S7v9uo2ku42Wtc2oVS47vJviwbX8tOTJaiDj+FljKC+Rwkh0yQ6PkVcoUuBRDGuMWZGmg5/j72WLxD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N7j3L3pT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N7j3L3pT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4601D1F000E9;
	Tue, 23 Jun 2026 11:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782214790;
	bh=IAxI+RdpxRXeJaNc2afLpo2hLF2VC1H1p5aWhAYtXd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N7j3L3pTqhaGguSy6JlIERcgmWlV6WoFm7UhwtetJiWu6UEDj1WcEm9B5FAyrxly3
	 QJRP54HnBG038vYMC1ET2JDnDXYq3G4CB+9a3CEwUx2uOV+WrW4gQPmml3EnYJKJuu
	 W1QV0PIiqTBGOcIkB7OW+Uong/6WMk+2UPWRlkpk=
Date: Tue, 23 Jun 2026 13:38:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruce Ou <oubruce1234@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase style warnings in
 rtw_efuse.c
Message-ID: <2026062328-coach-relatable-c8ba@gregkh>
References: <20260623112629.4953-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623112629.4953-1-oubruce1234@gmail.com>

On Tue, Jun 23, 2026 at 07:26:29PM +0800, Bruce Ou wrote:
> Fix coding style warnings reported by checkpatch.pl regarding
> CamelCase local variable names in rtw_efuse.c. This includes
> variables like contentLen, mapLen, efuseType, Bytetemp, bResult,
> and Address.
> 
> No functional changes are introduced.
> 
> Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 54 +++++++++++-----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index a40d6eab7249..b1d32f211102 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -44,33 +44,33 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>  u8
>  rtw_efuse_read_1_byte(
>  struct adapter *Adapter,
> -u16		Address)
> +u16		address)
>  {
> -	u8 Bytetemp = {0x00};
> +	u8 byte_temp = {0x00};
>  	u8 temp = {0x00};
>  	u32 k = 0;
> -	u16 contentLen = 0;
> +	u16 content_len = 0;
>  
> -	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
> +	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &content_len);
>  
> -	if (Address < contentLen) {/* E-fuse 512Byte */
> +	if (address < content_len) {/* E-fuse 512Byte */
>  		/* Write E-fuse Register address bit0~7 */
> -		temp = Address & 0xFF;
> +		temp = address & 0xFF;
>  		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
> -		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
> +		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 2);
>  		/* Write E-fuse Register address bit8~9 */
> -		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
> +		temp = ((address >> 8) & 0x03) | (byte_temp & 0xFC);
>  		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
>  
>  		/* Write 0x30[31]= 0 */
> -		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
> -		temp = Bytetemp & 0x7F;
> +		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 3);
> +		temp = byte_temp & 0x7F;
>  		rtw_write8(Adapter, EFUSE_CTRL + 3, temp);
>  
>  		/* Wait Write-ready (0x30[31]= 1) */
> -		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
> -		while (!(Bytetemp & 0x80)) {
> -			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
> +		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 3);
> +		while (!(byte_temp & 0x80)) {
> +			byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 3);
>  			k++;
>  			if (k == 1000)
>  				break;
> @@ -89,7 +89,7 @@ u16	addr,
>  u8	*data)
>  {
>  	u32 tmpidx = 0;
> -	u8 bResult;
> +	u8 result;
>  	u8 readbyte;
>  
>  	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
> @@ -114,13 +114,13 @@ u8	*data)
>  	}
>  	if (tmpidx < 100) {
>  		*data = rtw_read8(padapter, EFUSE_CTRL);
> -		bResult = true;
> +		result = true;
>  	} else {
>  		*data = 0xff;
> -		bResult = false;
> +		result = false;
>  	}
>  
> -	return bResult;
> +	return result;
>  }
>  
>  /*-----------------------------------------------------------------------------
> @@ -139,15 +139,15 @@ u8	*data)
>   * 11/11/2008	MHC		Create Version 0.
>   *
>   */
> -static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
> +static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuse_type, u8 *Efuse)
>  {
> -	u16 mapLen = 0;
> +	u16 map_len = 0;
>  
>  	Hal_EfusePowerSwitch(padapter, true);
>  
> -	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
> +	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
>  
> -	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
> +	Hal_ReadEFuse(padapter, efuse_type, 0, map_len, Efuse);
>  
>  	Hal_EfusePowerSwitch(padapter, false);
>  }
> @@ -216,20 +216,20 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
>   * 11/13/2008	MHC		Create Version 0.
>   *
>   */
> -void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
> +void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type)
>  {
>  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
> -	u16 mapLen = 0;
> +	u16 map_len = 0;
>  
> -	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
> +	Hal_GetEfuseDefinition(padapter, efuse_type, TYPE_EFUSE_MAP_LEN, &map_len);
>  
>  	if (pEEPROM->bautoload_fail_flag)
> -		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
> +		memset(pEEPROM->efuse_eeprom_data, 0xFF, map_len);
>  	else
> -		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data);
> +		Efuse_ReadAllMap(padapter, efuse_type, pEEPROM->efuse_eeprom_data);
>  
>  	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
> -	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
> +	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], map_len); */
>  } /*  rtw_efuse_shadow_map_update */
>  
>  /*-----------------------------------------------------------------------------
> -- 
> 2.43.0
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
