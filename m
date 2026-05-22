Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AA7367282;
	Fri, 22 May 2026 05:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779426595; cv=none; b=UV9wp14uZ/7gjrgBtCgn2YYLagg1CYe1rREMrMi1W3i+/7ewvctcs96puhDeJ6hi2dEWbvB9vRPEtMno4nvhpYe6NPcm1Q8ZMFidow2MsXdN+2HAawv7O5GGe+Ptc9JR9wtbXR/qrdBvYwpDZMSk60xEtNCzskHlGTF0aN1RVgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779426595; c=relaxed/simple;
	bh=BLfjYPg091X5iquILIGmqMFkXaW6h5sG9iE+aM6aQD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNCDYWraHAblJmc1VSeoAkaUmfJbmqwSsTnnHMBGPC1ao/WmEAb0xR91uN/ze7Luy5cE6wDPbhTNtRqxcgFPjOSJ7m7n/VtgPCmkO6uVU/BJwI+hk+bZAb86ZCDGC5IEIW3tdT+TWvcGBHYRBHutBRzzeWapPEvXdWSQyLHqt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=voMbssy7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="voMbssy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7B11F000E9;
	Fri, 22 May 2026 05:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779426591;
	bh=YXYFnHKeEi4YZ1tN88Yt91calVux3YI8QSyjJ4B1/FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=voMbssy7CCi0UtvUpnWTecSc7snAS7fcQpkG/z0KliOBfgD3kKyJpdQEf1oEy01sV
	 pgUNGl0sroDbbFd2tY2wanTjBHs2ShCC3iZ15wu44q8voaOM3K/md9ZFczQCPGeV36
	 O4mKrSmXakF3ntxAHLaoxU1jjis1+/1j4Zj73BjM=
Date: Fri, 22 May 2026 07:09:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ahmet@sezginduran.net, error27@gmail.com
Subject: Re: [PATCH v5 4/4] staging: rtl8723bs: fix lines ending in
 parentheses in hal/sdio_halinit.c
Message-ID: <2026052200-leotard-overprice-bb1f@gregkh>
References: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
 <20260521125604.4688-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521125604.4688-1-artur.ugnivenko@gmx.de>

On Thu, May 21, 2026 at 02:56:04PM +0200, Artur Ugnivenko wrote:
> Fix checkpatch warnings on lines that end in patentheses in
> hal/sdio_halinit.c.
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 49 ++++++++++----------
>  1 file changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index e6570fa2e8fd..494fb74ad44f 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -74,7 +74,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  	rtw_write8(padapter, REG_CR, 0x00);
>  	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
>  	value16 = rtw_read16(padapter, REG_CR);
> -	value16 |= (
> +	value16 |=
>  		HCI_TXDMA_EN |
>  		HCI_RXDMA_EN |
>  		TXDMA_EN |
> @@ -82,8 +82,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
>  		PROTOCOL_EN |
>  		SCHEDULE_EN |
>  		ENSEC |
> -		CALTMR_EN
> -	);
> +		CALTMR_EN;

The original () is ok to keep.

>  	rtw_write16(padapter, REG_CR, value16);
>  
>  	hal_btcoex_PowerOnSetting(padapter);
> @@ -188,15 +187,13 @@ static void _InitTxBufferBoundary(struct adapter *padapter)
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

You can do better than this :)

try making it multiple variables per line.


>  {
>  	u16 value16 = (rtw_read16(Adapter, REG_TRXDMA_CTRL) & 0x7);
>  
> @@ -231,9 +228,13 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
>  		break;
>  	}
>  
> -	_InitNormalChipRegPriority(
> -		Adapter, value, value, value, value, value, value
> -	);
> +	_InitNormalChipRegPriority(Adapter,
> +				   value,
> +				   value,
> +				   value,
> +				   value,
> +				   value,
> +				   value);

That's crazy, perhaps the function should be changed?

thanks,

greg k-h
