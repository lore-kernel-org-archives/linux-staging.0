Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A131B825;
	Mon,  9 Feb 2026 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640559; cv=none; b=HZO+ABIxw67KIrz+ezT8vRKo5qj9Ff8bMjexMcNBKfGauEET3ytCs/525HxP5ZVkyRspsaTY+qyxK+t6Ah2lNJsP6CrNVXRBqHjjRJzrZGO5Iuz6K528ApS3mBTiKV0mMTYdMyE8jSaMX4j+Gty5fl4jp1MZbD0bA2GYYEfvg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640559; c=relaxed/simple;
	bh=vVLeOPjW6ll7Le/2DvrhGjKfqYcIym2yM/3KsxHbPJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEWr9veTzMgFyQ+aQZvgsYLXQ2FwgxMJQMqXsgK7ytgoX067qROtzCAKe92iFbqXfu8L88VXHJ0W3AQwOmsUXcupukeDGLqx+85QYDk8NgtXpSxSGArY4AHHc3wpdH7/o5KdXuZfKhfDYdXowvn+oxBty9lo/dL6DBb+0yEe3sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WSopEz7Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WSopEz7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF123C116C6;
	Mon,  9 Feb 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770640559;
	bh=vVLeOPjW6ll7Le/2DvrhGjKfqYcIym2yM/3KsxHbPJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSopEz7ZjcIXbcsaGToiAQvnsIgt6zpIbBLKpGXj6L9s0IaZVpuQnNgNLyOlpRlCL
	 A2NVDy2imHXQYvvHxUkRac9vkizkfJ0NYozMB6QAmEr9WiQ47R0QD7LOaCxSh9KDeo
	 ErjgnU6iHrbzKBCwIa6kZ1RzLTmDDkbKGmCbIwu8=
Date: Mon, 9 Feb 2026 13:35:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ethan Lam <ethanlxkernel@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ignacio.pena87@gmail.com, bryant.boatright@proton.me,
	strnad.jj@gmail.com, mingo@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <2026020944-mummified-scope-4221@gregkh>
References: <20260209120709.29824-1-ethanlxkernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209120709.29824-1-ethanlxkernel@gmail.com>

On Mon, Feb 09, 2026 at 08:07:09PM +0800, Ethan Lam wrote:
> checkpatch.pl says that msleep < 20ms can sleep for longer than expected.
> The documentation says we should "Use uslee_range*()
> whenever accuracy of *sleep() is not sufficient)
> 
> Replaced msleep(10) with usleep_range(10000, 11000) so the delay
> is more accurate and percise
> 
> Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ef2d92b5588a..97c923015279 100644
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

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
