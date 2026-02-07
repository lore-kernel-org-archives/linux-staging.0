Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476CB823DD;
	Sat,  7 Feb 2026 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770466124; cv=none; b=L1a5s0wTZkTVVPn9+pnRLIMf8+8ycNz2MSOw41Bj3wGUon+K2YDrO7O3Ljt07EvK6hJlcnLtR+QKklkTeCuicbJHLG7uGQQoJI0hX3kUEyu5cN+FtHaWvilZOJz/cSBJ8PIWKvcOToL/Eha/E1q4WWCw9t8GlphRuwpqyhKTwlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770466124; c=relaxed/simple;
	bh=jt4jeYq8SSGhGnJTPU5MqkJft8mQXfCb4KS50hiXyxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQ9uq0uT2eDrvQub07kbyXWAtWBH6PJx6fsWhhb0qwLaBBFvHAUDrJT0mYj+0QIlU0IbtuYv6F+PXYt2vbXHa0cWXQpAxGvc5Rh/yxaCBhsG3KxB8jSKm0VXykXK+kZfEUCk0DLYHE200kVOz04owRzkQFu+QJ/O1AMWtoWMQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j7jhX6E3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j7jhX6E3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620ADC116D0;
	Sat,  7 Feb 2026 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770466123;
	bh=jt4jeYq8SSGhGnJTPU5MqkJft8mQXfCb4KS50hiXyxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7jhX6E3x0FuIeeaZTiq9S+54UnHzRlmUtpC6rOUTWNG3/hWPVlx8aDKW84CyCVeN
	 uANlvs1RQHUaQbnxfnej+ebPI+Vh8wwGfG4LRObxKUnvYv9RAip7d9Ls8FUOsd60Z6
	 XpaKgL7Mm79N+/7sdlfn/+bCxMajzMm3fkcTQZMA=
Date: Sat, 7 Feb 2026 13:08:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haroen Tmimi <tmimiharoen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in
 rtw_cmd.c
Message-ID: <2026020724-undiluted-edition-5c42@gregkh>
References: <20260204134447.138362-1-tmimiharoen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204134447.138362-1-tmimiharoen@gmail.com>

On Wed, Feb 04, 2026 at 02:44:47PM +0100, Haroen Tmimi wrote:
> checkpatch.pl issued a warning about msleep(10) not being at least 20ms.
> However, 10ms might not be precise enough.
> 
> usleep_range(10000, 11000) is a better choice.
> It allows for a little flexibility in scheduling.
> 
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ef2d92b55..97c923015 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		usleep_range(10000, 11000);
>  
>  	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
>  		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> -- 
> 2.52.0
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

- You sent a patch that has been sent multiple times in the past, and is
  identical to ones that has been recently rejected.  Please always look
  at the mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
