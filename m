Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5E125B0AD
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 05:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292731; cv=none; b=uCdXwTcike2u+qI/CtbXnJ/jJomdAvlHhcWPJkUpEZttQjVqKuNiARdj4pcJ3z8ywrIih2nZbWuF47TsP4WW63DGn2UnTwrRcn2ZrXI4bHDlW3JPHkrpQgiK2MFwNy1RnJ2GSTwkHRYlCR3SoSRXVknrEVw8fKq67ouq3Sv6hDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292731; c=relaxed/simple;
	bh=G3kg6LWnUkW+fuyv6vQsuJ0K83Z0l81Hyg+XRq0FOdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7mv6i+OFyzTnyleK++xcbfLJejfLRjXjjSSdRtZiXuH7jqLkzgnX1y0JDTgN/RImIgXAQhVOtVdXMgT0U0DcPmdcfYXoEFk4O3G+31xWQVrcDdzVMJyy+rsyYXn+9s1eJoImqjdhepiO0RtfrP/keWgslR/4eW0zGak4mRpSrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y9SD/6OB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y9SD/6OB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8F31F00893;
	Mon,  1 Jun 2026 05:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780292729;
	bh=dryJxJkomuWU7M3myzEaD2QKxPzT0+x9I5gV0266eeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y9SD/6OB0HmVQ7cXSkQzFThV+pLRGz5r2olxPr0vQ1gO02PkTbCzdul57kCneWp3t
	 yVCHlarjuYZmglGHNbTsMN8mUS26vmYMDcAg7TaprRDjmNA5zaVkMmLpLh1uC9uujM
	 mi/L6qckTVQ8/vNHpFr2vOkTKt7icT1d6zHy2DnA=
Date: Mon, 1 Jun 2026 07:44:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Enchanted Hunter <enchantedredhunter@gmail.com>
Cc: linux-staging@lists.linux.dev, andy@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] staging: fbtft: replace sprintf with snprintf
Message-ID: <2026060110-unlisted-headache-aec7@gregkh>
References: <CAOSULec2OpwTGB3OUb_n3CdKO6H_DGJnxw=qsBswbd+JBjemKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSULec2OpwTGB3OUb_n3CdKO6H_DGJnxw=qsBswbd+JBjemKA@mail.gmail.com>

On Mon, Jun 01, 2026 at 03:43:55AM +0300, Enchanted Hunter wrote:
> This patch replaces unsafe sprintf calls with snprintf
> infbtft_register_framebuffer() to prevent potential buffer
> overflow.Signed-off-by: rat1bor <enchantedredhunter@gmail.com>

> From a79c6098f2e8bb2ee9e276d339710522175db977 Mon Sep 17 00:00:00 2001
> From: rat1bor <enchantedredhunter@gmail.com>
> Date: Mon, 1 Jun 2026 03:18:59 +0300
> Subject: [PATCH] staging: fbtft: replace sprintf with snprintf
> 
> Signed-off-by: rat1bor <enchantedredhunter@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index ca0c38221c16..66509347255a 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -784,10 +784,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>  	fbtft_sysfs_init(par);
>  
>  	if (par->txbuf.buf && par->txbuf.len >= 1024)
> -		sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len >> 10);
> +		snprintf(text1, sizeof(text1), ", %zu KiB buffer memory", par->txbuf.len >> 10);
>  	if (spi)
> -		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
> -			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
> +		snprintf(text2, sizeof(text2), ", spi%d.%d at %d MHz",
> +			 spi->controller->bus_num, spi_get_chipselect(spi, 0),
> +			 spi->max_speed_hz / 1000000);
>  	fb_dbg(fb_info,
>  	       "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>  	       fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> -- 
> 2.34.1
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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
