Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30593A9611;
	Mon, 11 May 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486102; cv=none; b=WpB9s63YJdwJpY9MF+r8baPJZmLwN6NUqawzaHIM3C67n20wmPnbreIq4+SkWoh19EzuS7XOefJJvbF9nCfI1GnMdEWHgXrAd6KmHOyHSGMRXMf7tq2hdy3Qha2j4yywGK3WfItirL51kwhp5TmyRsug6ExLCyA+zEVoji4b7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486102; c=relaxed/simple;
	bh=uTtZfoNIMsGKvElS5H8bVwCKaZfC4pFNFc/Ie5T4nrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upLVd+DqDAjJ9EQ31tC/Oab3T7XT52k97YxgajKX7A1kYgHN2aStiTCoolyO09qqY9itP0Sywgvs9J5PDFpEJd0LbizZe6bqZvYyCM86MISNlZRW/ERLdanVwMevLvzGecGbu2piUK81mbYyuS5LV31p82Rxl9z8+SFwOgH343A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eBfQkbQW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eBfQkbQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33940C2BCB0;
	Mon, 11 May 2026 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486100;
	bh=uTtZfoNIMsGKvElS5H8bVwCKaZfC4pFNFc/Ie5T4nrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBfQkbQWmxDE68vSJjBsX8bm8xdIGf2YvECiBfkL3ddYnBlPVK8zrlMbvpW8lA3AI
	 wF4YLiuZ9bE4ezkf0R862mOdyyooqGsIxrOmZybGzebl67RpbFyiKzE8O0+JeAMCRp
	 k+FeUvEBIX9sTsSsPYKkifSl3Esl0LL4qFW7m8ZY=
Date: Mon, 11 May 2026 09:54:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Greybus audio protocols drivers: correct sscanf() return
 value check
Message-ID: <2026051146-pope-shimmy-7c4b@gregkh>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>

On Sun, May 10, 2026 at 08:41:43PM +0200, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which always failed the operation.
> I corrected it to 6.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f954..ff323ca815 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
>  			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
>  			&desc.ip_devices, &desc.op_devices);
> 
> -	if (num != 7)
> +	if (num != 6)
>  		return -EINVAL;
> 
>  	num = gb_audio_manager_add(&desc);
> -- 
> 2.54.0
> 
> 

Cool, but was this tested?  How has this ever worked?

thanks,

greg k-h
