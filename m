Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0A1A682E;
	Sun, 23 Aug 2026 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787509460; cv=none; b=k69MxwMvhPJqYOYjmeluU7/8Q/DnHlvI4Rj5UPbmevTeDP6zamPH2x0HmfnofkR/exYOPei4SpWlOH76JtzsMm5BDGyFQA6H8Xir9AwxgGATR/P/GYXQ4wJEvZ7UElHeM1J07cWEohcLKqH4CBHsZ72IPj2NEPfUSHKriFm5bdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787509460; c=relaxed/simple;
	bh=U3J0WSjk4LXeFJPUV5pUswOJcEM4VtXTgQdIohtuz04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSOAetu00H32yfpxSOjwrUdeqlG3uJ6zjsCkPOuL3ce4RkLKhkptuivUK7+fgyqjYXpv9ani7G+HfCof+ejj3Dr3JsrUKmxWyAPXjOrJlzF+lqKRuBuVRcK53/Lw6Q0+r1aL3a6YAgpVAal6tHjsaRkyzNP4B4Yz5koj6zpOEDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vBwLWbhi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vBwLWbhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D094B1F000E9;
	Sun, 23 Aug 2026 18:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787509458;
	bh=5i//a8AAERY203Hile6Fed3CtmQzX6MfxvZeRY/u//I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vBwLWbhiSS79Vpno253usTBkjFNXln/i+slWrH80gx5vr3wCwovxOevpKZKoF54l2
	 6C8QkWP6WgrY5VaBnJvibou6BkPW538mdY/XZ3UKN43FEzoV63Fk8O1ACazSypcnOP
	 lcJDjU2vpDUuYkzg4A5CiXy46h3e+tc1c2ltm33E=
Date: Sun, 23 Aug 2026 20:22:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew <matthew-kernel@post.cz>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: remove unnecessary void
 function return
Message-ID: <2026082321-mongrel-justifier-d4d0@gregkh>
References: <20260823181141.265635-1-matthew-kernel@post.cz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823181141.265635-1-matthew-kernel@post.cz>

On Sun, Aug 23, 2026 at 08:11:41PM +0200, Matthew wrote:
> Remove an unneeded return statement at the end of a void function
> in atomisp_cmd.c. This cleans up the code and fixes a checkpatch.pl
> warning: "void function return statements are not generally useful".
> 
> Signed-off-by: Matthew <matthew-kernel@post.cz>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9fd26..81d0afae8041 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  
>  err:
>  	atomisp_css_free_stat_buffers(asd);
> -	return;
>  }
>  
>  static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
> -- 
> 2.39.5
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
