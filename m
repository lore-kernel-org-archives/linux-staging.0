Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2674C218D;
	Thu,  8 Jan 2026 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869192; cv=none; b=rsxB6N67cTeNjxySCk10bf1GafEIk8YCs173FQEa1PfoVIaN6C3u2uKhi/z1SuZOHun7/z6/dgsm6HNa5oEXVfm38GivtDFZflbhFk2gGuMkppPkBaGMfQ1roppYhcixbHjYbupwu7zTynh79ylT57eDh3oulNl7nVw3uyFFp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869192; c=relaxed/simple;
	bh=ffL7OckPnkAqROe4W0fLxVBdeQh1mt1C5mLWdRdw/js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KySC0mS8pUXpQhbFNfpxFVooy0EcgHgcLDX4AgjL48AQzooAL66vwzQH6vt3mOrMzmBELadRgs3Pry+jwhm4G1UGhvFdhhj8q6UJp+Yfgrn6W4w3tVG/fZh5UzLRpPHP3kz7Z2rRbvIaWmzo2AnQSBFyAGtcjLFIcbVc5lc6OYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1U9pnynJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1U9pnynJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AC9C116C6;
	Thu,  8 Jan 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767869189;
	bh=ffL7OckPnkAqROe4W0fLxVBdeQh1mt1C5mLWdRdw/js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1U9pnynJC9/un5w03XZGq7nj7/Fstw+xP4W5hoQqMBhVkvM2g6Q+rBRFj/EaaO+lP
	 MlRrAaLpf9nMbO79QGsh/k73UjUPlfRbrK86dT7ApNgCRAnAWZjTlqejXbmbyelHFZ
	 V5CQN+XNROkCFbJAaYZcijMtu19PCXvfxNhSvGY4=
Date: Thu, 8 Jan 2026 11:46:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: lights: avoid NULL deref
Message-ID: <2026010814-displease-jawed-688e@gregkh>
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>

On Thu, Jan 08, 2026 at 04:07:00PM +0530, Chaitanya Mishra wrote:
> gb_lights_light_config() stores channel_count before allocating the
> channels array. If kcalloc() fails, gb_lights_release() iterates the
> non-zero count and dereferences light->channels, which is NULL.
> 
> Allocate channels first and only then publish channels_count so the
> cleanup path can't walk a NULL pointer.

How was this issue found?  How was the fix generated?  How was it
tested?

> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index e509fdc715db..4c9ad9ea8827 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -1008,14 +1008,14 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
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
> +	light->channels_count = conf.channel_count;

This is "tricky", perhaps add a comment here as to why you are only
assigning this now and not before?

thanks,

greg k-h
