Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA3216397;
	Fri, 20 Dec 2024 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734709590; cv=none; b=ACE3o20zfc4T/UzWnuRl71WJCRChYW1RiSWIkDiu8wNR7ENbgrUfJELC4O3ML6EwKnTEMydwPJTxiAgE8JbtEV2jfQVOM60if6qXU4HgE4oMmL6EK9X9da2n2xheGwYd2qcaF40MJumydFcF3tIyv1u4rVJQwkMf2oQFvZ7KY+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734709590; c=relaxed/simple;
	bh=y7d8BAb8BJasjgjVG8pLlEuTZd2zArgVZxPtJQ/TIVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4Tq2bykKwuisSDtlVWCZn/F2jmLuAzGLqMenk7VfcGEGdfBVoUZ8HcRXGb11betfjUFxAErXRFvQgKEw4wJkQp0Yn7u53OJU9AQRHOvJBOqT4zByPa7w6aGNv2dAKdmD2hyMWs3SotPF7X+eESZupAMvumpdoF3cXEggfHuUBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cM4GB6uY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cM4GB6uY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85989C4CED3;
	Fri, 20 Dec 2024 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734709590;
	bh=y7d8BAb8BJasjgjVG8pLlEuTZd2zArgVZxPtJQ/TIVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cM4GB6uYtNuh4ZV6N6Y03QKtbbIA51LdjJwIOSY7cuiX8e4pL8dMtAvVpA0V+xGgo
	 9QF6expIcwlxWMCvS8Nn9d93xkstY4v6Xeva5LAFShRDwNz/kKiZkNVLWG4gdd3I8G
	 7PTIb2Jrkyph5o3kV3KU719C1yx3rJYwiL5jd3KU=
Date: Fri, 20 Dec 2024 16:46:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sandeep Salwan <salwansandeep5@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Remove unnecessary parentheses in
 fbtft-core.c
Message-ID: <2024122049-establish-giddiness-ab22@gregkh>
References: <20241219023741.11100-1-salwansandeep5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219023741.11100-1-salwansandeep5@gmail.com>

On Wed, Dec 18, 2024 at 06:37:41PM -0800, Sandeep Salwan wrote:
> Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 4cfa494243b9..b4e9d6000b9a 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -664,7 +664,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  		txbuflen = 0;
>  
>  #ifdef __LITTLE_ENDIAN
> -	if ((!txbuflen) && (bpp > 8))
> +	if (!txbuflen && bpp > 8)
>  		txbuflen = PAGE_SIZE; /* need buffer for byteswapping */
>  #endif
>  
> -- 
> 2.39.5 (Apple Git-154)
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
