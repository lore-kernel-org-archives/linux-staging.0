Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A27810A34;
	Thu,  7 Mar 2024 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709796178; cv=none; b=b4EoequUb1ZJB3fDTxtK5PWXxGSjakhaQo35KIXKR+eQl8lET3qWooh73D2UxNHGo+pon3kBiURiAg/wYV0AJfB4IMgDIxw/GMv5nEqwwQDXJbiMQ1OdO7hGe529RxW02GQAiELh5t9hAiAm9pSLOrTnn/WCDKfEzuHnx62wO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709796178; c=relaxed/simple;
	bh=mYeTr/PVA7qLckL6hZPOwvh3EKEs7bYJRSUcHTQxSaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQqQHpEv4GAXtSo5gsiyQT7PvOdD3H1mzOlF7nv937z1fDMYzU6bBVD4TN5MLx6Z/2FDpTJYFt3SFRZP7UKr0P/Ln+lbtjCqLzqhrgQt8dcZrs1ORhUWtkxId9K/sej52NQm9Z8g2yXDcfyucYyMv2UXFUkWuWs1ZwJxCfRWcnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yK3PytcK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yK3PytcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63724C433F1;
	Thu,  7 Mar 2024 07:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709796177;
	bh=mYeTr/PVA7qLckL6hZPOwvh3EKEs7bYJRSUcHTQxSaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yK3PytcKtJl151RSmjZMY4tjwVzFQA5X8USlWEy47UfzkhTXfkZV5tU/poAkkuqIL
	 1F7m7dib/kXQAJJZJcp52TyUYrZOJST+aTu16+2PhKFntyTQU8vG7GuCmEqSJkL/0W
	 +m1vF9m28pczPc27Tj1fVEKcffHK2FrcbwFRr36g=
Date: Thu, 7 Mar 2024 07:22:55 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: sm750fb: Rename variable
 sii164EnableHotPlugDetection
Message-ID: <2024030726-corrosive-thicket-9cde@gregkh>
References: <20240305224518.39357-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305224518.39357-1-dorine.a.tipo@gmail.com>

On Tue, Mar 05, 2024 at 10:45:18PM +0000, Dorine Tipo wrote:
> Rename variable sii164EnableHotPlugDetection to
> sii164_enable_hot_plug_detection to silence checkpatch warning Avoid
> CamelCase
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> index c12df1f9fb00..1ce44c50617a 100644
> --- a/drivers/staging/sm750fb/ddk750_dvi.c
> +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> @@ -21,7 +21,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
>  		.reset_chip = sii164_reset_chip,
>  		.get_chip_string = sii164_get_chip_string,
>  		.set_power = sii164_set_power,
> -		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
> +		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
>  		.is_connected = sii164IsConnected,
>  		.check_interrupt = sii164CheckInterrupt,
>  		.clear_interrupt = sii164ClearInterrupt,
> --
> 2.25.1
> 
> 

Hi,

You sent 5 patches, all look to be broken and not tested.  Please fix
them up and send them as a patch series.

thanks,

greg k-h
