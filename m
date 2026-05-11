Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278E34846E;
	Mon, 11 May 2026 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494082; cv=none; b=k3A0U1in1FzoT8X+AbmAn6hCDSFczZhOh9EeDEIpCAMZbTNlE9z6PSLYS+nJKu13Bl1b4CLomc+KPJRO3lchNgiPXWGw9eUzsAhU++yIQzoadeyKwmTpLyo8x8KjLDinUtX/rUIntygxiF5Z4xYSiA6Wmlc3tAqjRNZGElxt1zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494082; c=relaxed/simple;
	bh=Nbljizss2S/ZpgjiIaDMH3Fy6IqbEV6yyocxG1uIy2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kh4WkcQsUNhpUtKQhndXbNRfsGWhgysFKTqSQM/0bUz1MHPUv82oM4c2kyFGByYavonLRKcLHvOQbBeOQFUvpVpctLo6fBoaTppwCMBGBuufFWpiofecNW19bzResM+EqmjVF00DbPwgWMdeHjuIaGxLQbQTmvF84TSq++7DwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YO+aaNgZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YO+aaNgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272D7C2BCB0;
	Mon, 11 May 2026 10:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778494082;
	bh=Nbljizss2S/ZpgjiIaDMH3Fy6IqbEV6yyocxG1uIy2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YO+aaNgZ1lTdvPrkJ+Zd48H8driL3kBDLK3SW2SzZt+534UMSyGXIO6lGj5MM3kcR
	 uJjEmG7tzSPm2JrgQRP3VtseKo2YOv4LZ2jyEIB2CrVzq4Eiis/EUh/4MIjLFkGf8z
	 v6J4n483cssvAN7+62fmU6BD0JP4EK6GErnupl8o=
Date: Mon, 11 May 2026 12:08:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: deller@gmx.de, tzimmermann@suse.de, chintanlike@gmail.com,
	andriy.shevchenko@intel.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: check return value of
 device_create_file()
Message-ID: <2026051146-banister-shelf-414f@gregkh>
References: <20260511100140.4794-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511100140.4794-1-shawharshit116@gmail.com>

On Mon, May 11, 2026 at 10:01:40AM +0000, Harshit Shaw wrote:
> device_create_file() can fail but its return value was being
> ignored in fbtft_sysfs_init(). Check the return value and
> emit a warning if sysfs file creation fails.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-sysfs.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
> index d05599d80011..cc6dbaeb6043 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -204,14 +204,21 @@ static struct device_attribute debug_device_attr =
>  void fbtft_sysfs_init(struct fbtft_par *par)
>  {
>  	struct device *dev;
> +	int ret;
>  
>  	dev = dev_of_fbinfo(par->info);
>  	if (!dev)
>  		return;
>  
> -	device_create_file(dev, &debug_device_attr);
> -	if (par->gamma.curves && par->fbtftops.set_gamma)
> -		device_create_file(dev, &gamma_device_attrs[0]);
> +	ret = device_create_file(dev, &debug_device_attr);
> +	if (ret)
> +		dev_warn(dev, "failed to create debug sysfs entry\n");

This sysfs file should not be there at all, can you work to remove it
and just use the "normal" debug api for logging stuff?

Also, no driver should be calling this function directly, a default
attribute group is the correct solution.  So don't paper over this
warning by just checking the error value now, do the right thing
instead.

thanks,

greg k-h
