Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E2421A15;
	Tue,  4 Aug 2026 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828086; cv=none; b=pbpcoLuj8Oaj/BgSpkIAOuMfo2m7C+1tF8WiQKYlORul0lTtxidieQ5aX4wab3slmuSPZDWQmTvKe7KPBxsnKinSxiChGod6szNkoYsbWlQ6SpcYoIAvGkors7Zv6C/sbeXbSObben++d9MXhh1g3h92mQsQvZUieedfSWUcj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828086; c=relaxed/simple;
	bh=XVFQZAh2fXvUxC6/2yoCDARgrYJ3NWoW6GU4Nb/wbNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHASW5ZQQX3qqIDZmy3AedD0MJ/WgPM6yWtFcpdULem5nKYym3P4w4ea+rM5sBNsBUiufABodY2FznWwKLYTppV37FfOEm5Y1jw82AtCqM1hqqZ/TAau0xqVFtu8lD1UtKgf1gMtE23+TQyADZQ2O9wJx1ovjhS7vzLBLQNPYXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vA70elR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vA70elR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FD81F00A3F;
	Tue,  4 Aug 2026 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785828085;
	bh=beArhH1oSmQbBeZCCYGI55332WAf03A4Glzw2xAMNRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vA70elR3ctUI8N26bZGc7wZQ54Q300ALifDciu+uITmtr6+DjfSK5hR+OU2B/P4ls
	 6zNIwS0eLwmyh8y05FNTd6iZ7dPE0xG3J05mQxijoXqkA2A2PW8+UW6nm/IL97yLqT
	 0XDUgW4qDwZz/0KnQWCsP2x2Ha8wCBQSrvqFO9aY=
Date: Tue, 4 Aug 2026 09:19:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary parentheses
 from return
Message-ID: <2026080443-unneeded-judgingly-98ed@gregkh>
References: <20260803180605.430-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803180605.430-1-work.ashmitkumar@gmail.com>

On Mon, Aug 03, 2026 at 06:06:04PM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that return is not a function
> and therefore parentheses are not required.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c       | 2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea..ed09be2fed4 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}
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
> 2.43.0
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
