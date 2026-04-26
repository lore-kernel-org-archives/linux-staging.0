Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B9F363C7F
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261886; cv=none; b=b74WHmUiZKXozxYLP1YPtDqiL8K5N3x4ubjCyK4hugctuw5aGkbP4F5VQ7eqy33I3coIT/sHSB9a8HU3Tft6nBrD6T+a1BmiH4f10DqN/aPSzsO4BC5G8yY9CxqrYRpd4yRt0zb0F7AssiVwMMg9dvOwsoDuqe7H0J7WZNoHEhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261886; c=relaxed/simple;
	bh=VlUXsNXeHaMRbqtsoujVmVQQyE1JRu3HzPRdasdYkLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tehIQ8HM0GR7izRWp9P6t0IU5wPto9VvchwIaHiYPa4g1Ksv1QS6pMBBoZN8IF4cjnVoAEcZMoGIFgIucn+PDRV671lzppPEypHprHZbgZrV4swAx9lGG3O9PolzctaPOB8hrJ+O7v+dAxjFxD96Eo0z0GQRC0FVQ7ehe0iYtRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xj5myQvD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xj5myQvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6D1C2BCB5;
	Mon, 27 Apr 2026 03:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261886;
	bh=VlUXsNXeHaMRbqtsoujVmVQQyE1JRu3HzPRdasdYkLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xj5myQvDgmFnZ1vbUGRQ0kk5YR9C1Pdqg1oSDXlIea56vuVRIUgYhZlECZDoPbp3R
	 zM89tPVR+CWsq8+JNbemdecBnuHe16A/nor+CoxcbYh9NKk6WCdB4DiyDIdD1dMLbW
	 5DwX+uFLlgqDRVfwCYJAMDFSovUE8pGVXGbMsG24=
Date: Sun, 26 Apr 2026 22:08:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/11] staging: rtl8723bs: rename
 DisableInterrupt8723BSdio() to snake_case
Message-ID: <2026042624-shifty-overplay-3b53@gregkh>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
 <20260419072034.19824-12-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419072034.19824-12-nikolayof23@gmail.com>

On Sun, Apr 19, 2026 at 10:19:37AM +0300, Nikolay Kulikov wrote:
> Rename function DisableInterrupt8723BSdio() to
> rtw_sdio_disable_interrupt() and format its description to comply with
> Linux kernel coding style.
> Declare this function without 'extern' prototype in the .h file to fix
> checkpatch.pl warning.
> 
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c     | 17 +++++++----------
>  drivers/staging/rtl8723bs/include/sdio_ops.h |  2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  2 +-
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c |  4 ++--
>  4 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 0d8d0935e4a2..a7713acccce9 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -742,16 +742,13 @@ void rtw_sdio_enable_interrupt(struct adapter *adapter)
>  	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
>  }
>  
> -/*  */
> -/*	Description: */
> -/*		Disable SDIO Host IMR configuration to mask unnecessary interrupt service. */
> -/*  */
> -/*	Assumption: */
> -/*		Using SDIO Local register ONLY for configuration. */
> -/*  */
> -/*	Created by Roger, 2011.02.11. */
> -/*  */
> -void DisableInterrupt8723BSdio(struct adapter *adapter)
> +/*
> + * Disable SDIO Host IMR configuration to mask unnecessary interrupt service.
> + *
> + * Assumption:
> + *	Using SDIO Local register ONLY for configuration.
> + */
> +void rtw_sdio_disable_interrupt(struct adapter *adapter)
>  {
>  	__le32 himr;
>  
> diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
> index 7bb4b2047cc1..13f13076bc16 100644
> --- a/drivers/staging/rtl8723bs/include/sdio_ops.h
> +++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
> @@ -28,7 +28,7 @@ extern u8 CheckIPSStatus(struct adapter *padapter);
>  extern void InitInterrupt8723BSdio(struct adapter *padapter);
>  extern void InitSysInterrupt8723BSdio(struct adapter *padapter);
>  void rtw_sdio_enable_interrupt(struct adapter *padapter);
> -extern void DisableInterrupt8723BSdio(struct adapter *padapter);
> +void rtw_sdio_disable_interrupt(struct adapter *padapter);
>  extern u8 HalQueryTxBufferStatus8723BSdio(struct adapter *padapter);
>  extern void HalQueryTxOQTBufferStatus8723BSdio(struct adapter *padapter);
>  #endif /*  !__SDIO_OPS_H__ */
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index f9995e02485e..b240b8285995 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -1140,7 +1140,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
>  		if (ret)
>  			goto exit;
>  	}
> -	DisableInterrupt8723BSdio(padapter);
> +	rtw_sdio_disable_interrupt(padapter);
>  	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
>  	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
>  		ret = -1;
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index f6fa51f952e0..d6e3a74f2edd 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -212,7 +212,7 @@ static void sd_intf_stop(struct adapter *padapter)
>  	if (!padapter)
>  		return;
>  
> -	DisableInterrupt8723BSdio(padapter);
> +	rtw_sdio_disable_interrupt(padapter);
>  }
>  
>  
> @@ -281,7 +281,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  	/*  set mac addr */
>  	rtw_macaddr_cfg(&psdio->func->dev, padapter->eeprompriv.mac_addr);
>  
> -	DisableInterrupt8723BSdio(padapter);
> +	rtw_sdio_disable_interrupt(padapter);
>  
>  	status = _SUCCESS;
>  
> -- 
> 2.53.0
> 
> 

This one did not apply as well.  Can you rebase those 2 patches on my
staging-next branch when it shows up on kernel.org tomorrow, and resend
them?

thanks,

greg k-h
