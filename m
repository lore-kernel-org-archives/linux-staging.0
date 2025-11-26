Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D96246BD5;
	Wed, 26 Nov 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142380; cv=none; b=YG5wuV4us+IR5IGdj37c35Fws1/dljoLmMPJex+XSDbk1qGTaSPHNsBmL1Sc3WHvATZPyzkgUvuSMjn7cJMGG2sM4WVQkT2kvszcRWbeUkIX1u0ubYVVlDOyXPAjQcj30utjKO9vauO0qLZN8V/YGPvN8CDzAnik2D1j3p+QVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142380; c=relaxed/simple;
	bh=UecjVz1Ha9Yw3qELxU6785YJ4y2UOWWmWqmp2YhMQ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fjz8mw5KQon3C5Y3g0VTItqrNGq0fCEo8YCgHLhriNYo+Rw9XSuoaWeo+bJBhFwUV/EoOE3J2BwEnps4NFUlvelB0UyBDo6TipsGVODrdj9VOcQZBshUO7iz4x7rfDsxwk3gzArHJB16Klb/C1z+mgjbRIXNTFRN6xxAkr1P2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k9pnSfqa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k9pnSfqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EA4C16AAE;
	Wed, 26 Nov 2025 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764142379;
	bh=UecjVz1Ha9Yw3qELxU6785YJ4y2UOWWmWqmp2YhMQ7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9pnSfqaDRI7mTvBZFV+CvqZQ67FWWySYQEB71wUje/gWUCgYpZdW2D0IAb7mEpzX
	 XxwXK8/pwTVv6WU8oUzKW8bk7J5f0GVc19qxh0mLL/bI0pPBnWWSh4njcuxfRXeCmx
	 fQ/0mCzDi7arByh9pHp+5hhH/AqZesNapQ3E1Vok=
Date: Wed, 26 Nov 2025 08:32:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Sadowski <tsdwski@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fluke_gpib: use kzalloc instead of kmalloc +
 memset
Message-ID: <2025112636-planner-straw-a530@gregkh>
References: <20251125140357.87880-1-tsdwski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125140357.87880-1-tsdwski@gmail.com>

On Tue, Nov 25, 2025 at 03:03:35PM +0100, Tomasz Sadowski wrote:
> Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
> ---
>  drivers/staging/gpib/eastwood/fluke_gpib.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> index 3ae848e3f738..2b6ba7882dba 100644
> --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> @@ -853,11 +853,10 @@ static int fluke_allocate_private(struct gpib_board *board)
>  {
>  	struct fluke_priv *priv;
>  
> -	board->private_data = kmalloc(sizeof(struct fluke_priv), GFP_KERNEL);
> +	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
>  	if (!board->private_data)
>  		return -ENOMEM;
>  	priv = board->private_data;
> -	memset(priv, 0, sizeof(struct fluke_priv));
>  	init_nec7210_private(&priv->nec7210_priv);
>  	priv->dma_buffer_size = 0x7ff;
>  	priv->dma_buffer = kmalloc(priv->dma_buffer_size, GFP_KERNEL);
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
