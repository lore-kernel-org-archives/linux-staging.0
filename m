Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D828002B;
	Sun,  8 Feb 2026 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770561347; cv=none; b=p3dXNAqOyxC5i9cCcD1O2L+z0Ile9ZFQDuPvce7kdCCJPB5gJLnOdE9EUlClpi4MrfaNbE7iWRM4sQggApuveLissqpxgAKUBtVgIaAVKuOMlGySfeUyMMkuHWw+8pLRcP3sXZTMAVHoGJNlDnKLwejHhLHOgR3PJ0LrHy9WVpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770561347; c=relaxed/simple;
	bh=OsBdo/h8XbqHcvfcJq/6cb5JYSMNS2ZJa0dJnw3HfVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJ9ssodOvsGaBiewi1bgXYkYl8iaJt408arqY9ep0FIAZDy/z/9CUJU2oA1n67IF8MPuBcRZ+eaJSu25ckAm74UimlhbFH0ngjHYbOQQ4EEnWglAITHkV5wtSE2aDoMm3gMMJl77i0U4Jl5VwY2kxFtLCJAIJxpzr/7uaBV3csg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1jF8fri3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1jF8fri3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B27C4CEF7;
	Sun,  8 Feb 2026 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770561346;
	bh=OsBdo/h8XbqHcvfcJq/6cb5JYSMNS2ZJa0dJnw3HfVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1jF8fri3rKWiWDYd0q11ZQr3h+e/AyzbG/1slbRQzYQWmqBorlEdX47gdWUtlZSsM
	 l5f65pclCcddkmbrzURMs9D2zYO48xwAZWhdYndLZijAp7LA60UpGU15yoFeoGTJ28
	 51U/FLFZUp/pSgdd9WnaB1Zz3+C5ujQGcHYMqhDM=
Date: Sun, 8 Feb 2026 15:35:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Angel De la Vega Rodriguez <miguevrgo@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <2026020813-eleven-thee-a5e5@gregkh>
References: <20260208121500.164404-1-miguevrgo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208121500.164404-1-miguevrgo@gmail.com>

On Sun, Feb 08, 2026 at 01:15:00PM +0100, Miguel Angel De la Vega Rodriguez wrote:
> checkpatch.pl warns that msleep < 20ms can sleep for up to 20ms.
> 
> This patch replaces msleep(10) with usleep_range(10000, 11000) to
> improve timer precision and allow the scheduler to coalesce interrupts.
> 
> Signed-off-by: Miguel Angel De la Vega Rodriguez <miguevrgo@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index b2e7f479f72b..3f5b3ca2066d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		usleep_range(10000, 11000);
>  
>  	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
>  		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> -- 
> 2.53.0
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
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
