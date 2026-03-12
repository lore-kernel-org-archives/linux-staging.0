Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513940DFB3;
	Thu, 12 Mar 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322301; cv=none; b=qaiORbcN1khyPzttKdzqGFz2LBH/gIimVJWeTTRT0fMCpoaVSOuZ1oKAk02Z5qZTnh53XRz+/+ntrgTdm5VnS2pyKsFLA8IjDPOnY84jEW+vgcEziM785FWtiRnot36U2guKZoH9hlziBQHFwHF8SDrbKnyHanO89pK/o5HxW+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322301; c=relaxed/simple;
	bh=aDImJejPShNnGhGhdyjd/qurwU2i6Jv6pDWqgFacyiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpf9T8UJd9pB5f4o84raGfHYI9FixmkVkQ8gbhL2cvWH+ufQz2+SVVQs1J3p7RMemP4NUywr41WkrzXIBxUoDuqTNDSnQ0WCN+OPS+4pNQPl0KSRXg38La9UYydntuAllY8Sdi9bd0ao7ur4wkb2xTcuBauLXZfORx/pFfYStog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XxZ6VO+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XxZ6VO+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D147EC19424;
	Thu, 12 Mar 2026 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773322300;
	bh=aDImJejPShNnGhGhdyjd/qurwU2i6Jv6pDWqgFacyiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxZ6VO+GHeuazxIsQSUvF5ZVtWo5vFLUjxGQyC02SkGHEb3oWrEapVAe/g/00+3YD
	 zdHjXiBj53PdK5sReWU6jqkqpbaNIAKUhb+jY9Xoys7R8RWiCG1HnUchrm3bxi54hZ
	 0kvi92lpMcExk5pKlaUWaFn3sAfZi1GGjdLTm5ZI=
Date: Thu, 12 Mar 2026 14:31:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: Simplify error handling
Message-ID: <2026031232-mushy-demeanor-299c@gregkh>
References: <20260312131933.29505-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312131933.29505-2-b9788213@gmail.com>

On Thu, Mar 12, 2026 at 04:19:34PM +0300, Bera Yüzlü wrote:
> Remove unnecessary ret variable and goto exit pattern. The function now
> returns immediately when an error occurs.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 30 +++++++--------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 7ba689f2d..fe910cc68 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -1124,36 +1124,27 @@ static int rtw_resume_process_normal(struct adapter *padapter)
>  	struct pwrctrl_priv *pwrpriv;
>  	struct mlme_priv *pmlmepriv;
>  
> -	int ret = _SUCCESS;
> -
> -	if (!padapter) {
> -		ret = -1;
> -		goto exit;
> -	}
> +	if (!padapter)
> +		return -1;
>  
>  	pnetdev = padapter->pnetdev;
>  	pwrpriv = adapter_to_pwrctl(padapter);
>  	pmlmepriv = &padapter->mlmepriv;
>  	/*  interface init */
>  	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
> -	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
> -		ret = -1;
> -		goto exit;
> -	}
> +	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS))
> +		return -1;

I understand the goal here, but are you sure that just exiting like this
in all of these places is actually correct?  Nothing needs to be
"unwound"?

> +
>  	rtw_hal_disable_interrupt(padapter);
>  	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
> -	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
> -		ret = -1;
> -		goto exit;
> -	}
> +	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS))
> +		return -1;
>  
>  	rtw_reset_drv_sw(padapter);
>  	pwrpriv->bkeepfwalive = false;
>  
> -	if (pm_netdev_open(pnetdev, true) != 0) {
> -		ret = -1;
> -		goto exit;
> -	}
> +	if (pm_netdev_open(pnetdev, true) != 0)
> +		return -1;

Like here, the irq is allocated, but an error happened, so what happened
to that irq?

thanks,

greg k-h
