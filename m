Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A4486931;
	Thu,  8 Jan 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870120; cv=none; b=Te04bvj7A5T8kPrgfRRkpfYxbq/IxdueKulakj6ri669VAJRUAhiyXmITwsef2Z4Qspbpj+ehKsxxIMF+VpvGDCfahvTIe1xxkDBVB3I3qBJYO38UZnDulCxWyeoWf5ZYOsOszil5EysqKwfkpPaTDlZGNHRyVJdfT0vKapWC8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870120; c=relaxed/simple;
	bh=98AybA5x735gNEPlDPJLZLJcyS7t3JthzWn2wlLk7wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T48YLTuLH7YG4rzo9feyEVczkEuHH7LXl9itcXj3v9ybYDhnrn2SHe+f7nNyz1gy9KB74EbJJ3GWpLal1afDk1mBkIDeh4J/3fFywjvElVnlLhZqEIKLLcJNjEprMP36EAl1FJLqELIciwfAN/fuSZqJkvFZegneK+EL2Q+3Fn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XD+I3PMF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XD+I3PMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA006C116C6;
	Thu,  8 Jan 2026 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767870118;
	bh=98AybA5x735gNEPlDPJLZLJcyS7t3JthzWn2wlLk7wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XD+I3PMFWGNu3dPGQ77m9PZUOzR+zvbRproCO38zGfdJJ3qE6aabe/xhG3pM27hOT
	 5DSNKFZagZSOmLMP7rcLZH2qwd2ZZ46JCkxL45znlVqpXoyq8kQseibEqj4bjWzIL2
	 KiwhWTBCnbfB92HWb1C0dsG0QrQjCZN9r6i21b18=
Date: Thu, 8 Jan 2026 12:01:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
Message-ID: <2026010842-disown-reminder-752d@gregkh>
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
 <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>

On Thu, Jan 08, 2026 at 04:19:47PM +0530, Chaitanya Mishra wrote:
> gb_lights_light_config() stores channel_count before allocating the
> channels array. If kcalloc() fails, gb_lights_release() iterates the
> non-zero count and dereferences light->channels, which is NULL.
> 
> Allocate channels first and only then publish channels_count so the
> cleanup path can't walk a NULL pointer.
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index e509fdc715db..38c233a706c4 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
>  	if (!strlen(conf.name))
>  		return -EINVAL;
>  
> -	light->channels_count = conf.channel_count;
>  	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
>  	if (!light->name)
>  		return -ENOMEM;
> -	light->channels = kcalloc(light->channels_count,
> +	light->channels = kcalloc(conf.channel_count,
>  				  sizeof(struct gb_channel), GFP_KERNEL);
>  	if (!light->channels)
>  		return -ENOMEM;
> +	/*
> +	 * Publish channels_count only after channels allocation so cleanup
> +	 * doesn't walk a NULL channels pointer on allocation failure.
> +	 */
> +	light->channels_count = conf.channel_count;
>  
>  	/* First we collect all the configurations for all channels */
>  	for (i = 0; i < light->channels_count; i++) {
> -- 
> 2.50.1 (Apple Git-155)
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
