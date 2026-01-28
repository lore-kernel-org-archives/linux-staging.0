Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B257532D0D3;
	Wed, 28 Jan 2026 05:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769579712; cv=none; b=GVNzz9IxcFPJ2K5Pr1+ZOO6Vd65Nuyid9ovVCFIsvxE5bjJ4H5dSg/ukgKRhIahYRs5zLEWnWjthMrXZhptwLEtyX8jsc/hu6alPRDcIqCHWXv04QqoZieQfwPsYkQ/XGjrEn3qjHpUCGjiV9iZzX0jJUvaxRCpmqMvO1vXiRt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769579712; c=relaxed/simple;
	bh=zUA1eu1esj0cUTw80+62NKvbiR9n9nitCFVfOt9TiOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKFSipR0zc2btLg2E9V+a899mwgSWhb8Oocn4GMhLTkYfDpRKziLyCcktA4crAx9qX1RSeYcpl0+50WcUYJ58Mf+IG9xTptGauwxkaNJ+4T6hOYwZbT+Mjy/q70XG1DnujTDkyQg5VujjyL0inp80BlWvJPkt79u7Lv4L6h8Uf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ihMlbkSN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ihMlbkSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9241C4CEF1;
	Wed, 28 Jan 2026 05:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769579712;
	bh=zUA1eu1esj0cUTw80+62NKvbiR9n9nitCFVfOt9TiOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihMlbkSNrZVsVXqiizGQqrKcVJ1RnYirT8QV9O543/94CPd1cPEb9bgD3fXG0Ho4X
	 aBd8qMbTedKQoWwzXNxdaqqj4RQBbcs6NMfp+e7DNGjWOTBajd3oWS4IsmNqc0hvlw
	 NcdaMp+ayX1dGv2Y9laYQrsCGJ95dkjv74SZZhX8=
Date: Wed, 28 Jan 2026 06:55:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Madhumitha Sundar <madhuananda18@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: make fix_id array fully const
Message-ID: <2026012854-shrink-mangle-f642@gregkh>
References: <20260127164816.91481-1-madhuananda18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127164816.91481-1-madhuananda18@gmail.com>

On Tue, Jan 27, 2026 at 04:48:15PM +0000, Madhumitha Sundar wrote:
> The fix_id array contains constant string literals, but the array itself
> is currently mutable. Make the array const so that the compiler can
> place it in the .rodata section.
> 
> This fixes the checkpatch warning:
> static const char * array should probably be static const char * const
> 
> Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index d100b9e1d3d5..092cfbadada4 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  		"kernel HELPERS prepared vesa_modes",
>  	};
>  
> -	static const char *fix_id[2] = {
> +	static const char * const fix_id[2] = {
>  		"sm750_fb1", "sm750_fb2",
>  	};
>  
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
