Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5842AFB4;
	Tue,  4 Aug 2026 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830256; cv=none; b=GyS2OWapKEMk3gbzRl8lTO35g+zKlTe+ft4lQrMAjgLtRYdA/pPsYv71Ga09GJR+1k1/cCL7RWTkulpEtEpbo8Hu89AIFLpIJhsJUYTMpbCQqRaUqKkI3ZVC/z4xpbx8Mi2DykiW1SYYQrw0HxhGphb3WLJkVME1+p/EG7h5Vvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830256; c=relaxed/simple;
	bh=sloL3lNMPOZrILU6Ra7fwtJcBCnFI6d+Vxa796XOsGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE2yHj2iJP+3yHV7yDzJKkTQ6e0sW5ht7VeGPeU70n0HJNMIn8ins5cZNtg5xTT6Jmxis86gopjT6NrdCwbow7LlKD70JoV2MNy/Jc7GkZCHgVqkQgGSUOo/tpLBS2boZ6hAYnIK28L38c9jv5oEuHKQjYtq6z4hK/GgHUXN3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0Oq817b9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0Oq817b9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB45D1F000E9;
	Tue,  4 Aug 2026 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785830255;
	bh=1JAOH2M//S+DM/C0walMDeJbYk3KoVCnCZAP68QxjGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0Oq817b9HDaID7ZF7WRiy4RI8ufVeihbV0X2lj/kasGvObIDdrKVTtx4wJXwkKx9m
	 CeIyUVh1bgpchiEkmfBCStKQo4aZZYeEUMc2DeWZQTfR9FtQzUc09n2YxjFsBXuxuy
	 qGwcWlj7j/Qz++rE2I59tYmCdfOdsvrNNoF61+Jw=
Date: Tue, 4 Aug 2026 09:57:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary parentheses
 from return
Message-ID: <2026080401-mounted-unrivaled-98ce@gregkh>
References: <20260804074831.14143-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804074831.14143-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 07:48:31AM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that return is not a function
> and therefore parentheses are not required.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index f31196f54b3..40793aa58d6 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -843,7 +843,7 @@ static int _netdev_open(struct net_device *pnetdev)
>  	netif_carrier_off(pnetdev);
>  	rtw_netif_stop_queue(pnetdev);
>  
> -	return (-1);
> +	return -1;
>  }
>  
>  int netdev_open(struct net_device *pnetdev)
> -- 
> 2.51.0.windows.1
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
