Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62BC38333A;
	Tue, 28 Jul 2026 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224220; cv=none; b=rVnJH4AkiloQf6OImM+JsAbqtH2PRnG/8g3PAOBR1maY9DoJC39kheiyd/c4tbjOtoSLSjGByXY8I4ri+fvInuEcv1mJ6tM3fdrSMlmzbIjU0G98yFTSVPQxJykyo/o6okZmGB2G/vAX2aR+VOTRMCKwI13xyJbyXShFk3T2xlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224220; c=relaxed/simple;
	bh=+qS94dwPEHLDyOH4K043bgu+lzWhYwnUqcjC5d4hABk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBsPk7I1cznmJ19dupKTDk8tGQQ6X9GZ/td1eJi7PUcGeDKZ57bIXbjl7UnTwJiLhKQFrxPJ3LT/ln3/NVhgQacEQrV9BoK8es+m6dCGscjhkdHzfPVVztrybGTGHL8fYolnvLH/Kx5dhDRM+EJtb28d+omMYc7pKw0dTMzSy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xHtpy9yV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xHtpy9yV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEB31F000E9;
	Tue, 28 Jul 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785224218;
	bh=RqzgTrocNXUrq0Ife2fNnldTvDGU2B6EKmqhZoZjvMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xHtpy9yVXH5GrdVCJkRheKpSuwnFt6GTElz3HfeSVEDP2K7Q22nt1AP7gSeIHoddh
	 neZ0DeTyDNajeljpzWQ3vSB8RAsy4nEsj3NS0KlJSzULRkhiMoO9+/jP4wIRl6jfok
	 RMULgR3BocrWgrTzTZVydar0uhUQwL3V3dE9NlyQ=
Date: Tue, 28 Jul 2026 09:36:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dang Vu Duc Hien <dvdh12707@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces
Message-ID: <2026072834-shrug-winner-1fb0@gregkh>
References: <20260726092319.529566-1-dvdh12707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726092319.529566-1-dvdh12707@gmail.com>

On Sun, Jul 26, 2026 at 04:23:19PM +0700, Dang Vu Duc Hien wrote:
> Fix the checkpatch.pl warning:
> "WARNING: braces {} are not necessary for single statement blocks"
> in rtw_wlan_util.c.
> 
> The if-statement only contains one line of code. Remove the redundant
> pair of braces to comply with the kernel coding style.
> 
> Signed-off-by: Dang Vu Duc Hien <dvdh12707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index a4de53872..f107304eb 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
>  {
>  	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
>  
> -	if (dvobj->oper_channel != ch) {
> +	if (dvobj->oper_channel != ch)
>  		dvobj->on_oper_ch_time = jiffies;
> -	}
>  
>  	dvobj->oper_channel = ch;
>  }
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
