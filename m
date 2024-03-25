Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EEF79D3
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 17:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711387513; cv=none; b=C5iRj87X8ohpmS9pPf2G0eqkvV4v+h2vkHu/R2pdZBjW2wQ4S2ZLKBZwO/atFaXfuMSgS60UPVhYWEd8mlHXer1+25CbbMOREQOjX04PQGw8IqFyhJ0hTRdapei4VXb3QbUUfF29dX+6fwa2lPCcHQRUnW16wsF5fYue1Ul6Yls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711387513; c=relaxed/simple;
	bh=Im8fSElPcwJhoaGSevQTn339Qc+KDItzGNhffc+HDek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRBISI3RNEFinF+LvDsUSeeqnxOVcVTVEdGAgz8fKbA7uJ7BV5lA8hvAv6kWpMVHZoFqiX4LBV3gWP/OJdU0UF6NptwaC2m2peTx2OI9jltuD6WZmir9wFLBDdp2u2hPYLrqn5BKPsMLUlOkXugpB8zU81ikZbzACO3dSKDBjnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kzd/dCN9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kzd/dCN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0750CC433F1;
	Mon, 25 Mar 2024 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711387512;
	bh=Im8fSElPcwJhoaGSevQTn339Qc+KDItzGNhffc+HDek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzd/dCN9mmtiSXqWSeKcjA+NCsfz5vgp63a1xjjEndvKPlOJ91Si0XK13ZJ6roKLX
	 LSYVdpF3ECwSPXB4grFcgbxZenPmyOw6TcWHMif8d9eNmYy0zvqiGpsi1kXAsYcHis
	 YhBmEvEWKkW6J44goZTotiO/g4C/qV8CdQHSaElI=
Date: Mon, 25 Mar 2024 18:25:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	linux-staging@lists.linux.dev, Alex Elder <elder@ieee.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH] greybus: lights: check return of get_channel_from_mode
Message-ID: <2024032543-village-reference-960d@gregkh>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307094838.688281-1-rmfrfs@gmail.com>

On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
> If channel for the given node is not found we return null from
> get_channel_from_mode. Make sure we validate the return pointer
> before using it in two of the missing places.
> 
> This was originally reported in [0]:
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Alex Elder <elder@ieee.org>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index c6bd86a5335a..6f10b9e2c053 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>  		channel = get_channel_from_mode(channel->light,
>  						GB_CHANNEL_MODE_TORCH);
>  
> +	if (!channel)
> +		return -EINVAL;
> +
>  	/* For not flash we need to convert brightness to intensity */
>  	intensity = channel->intensity_uA.min +
>  			(channel->intensity_uA.step * channel->led->brightness);
> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>  	}
>  
>  	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
> -	WARN_ON(!channel_flash);
> +	if (WARN_ON(!channel_flash))
> +		return -EINVAL;

We should NOT crash machines just because of this, the WARN_ON() should
be removed and just properly handle the error please.

thanks,

greg k-h
