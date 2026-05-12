Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78923B27DB;
	Tue, 12 May 2026 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579062; cv=none; b=WrtK4yfPJ9akYKnVwjm6j5sNrisE1UUOYwftTH08c9j5J4dGO+/XA4rGRJLRsE4fY2IwDBj0FuE/eL3bT08KO6H8teI3/HXxIQlhqgHGIYdPZI1ClDgtry5CodvlnO3BjUgjdrSrDSS8xQV+X/b/w7d0/EFyxg3Ulx+fDmVgwgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579062; c=relaxed/simple;
	bh=GvnzlNG5g3zJL3ZOrWbzxKWfeezO8vgv/5Dc4nhHsU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ09wz2gplY6G5ApVI1kAtDBXt1aTB1d7GYLsjBKY4r36WTsqKTX6qqneiE1LwiMT785MbYz4m2wte8tPIc6XHxhny5WJFsC6yR9m5zMGPlMaulFV8/4h5wfGc3dNv3hDctfMXkCIJ9DOMHkzvG8ciBnmijRoj25sm1wng+iCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1QNuGL6Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1QNuGL6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44252C2BCB0;
	Tue, 12 May 2026 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778579062;
	bh=GvnzlNG5g3zJL3ZOrWbzxKWfeezO8vgv/5Dc4nhHsU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1QNuGL6Y4qHAXvUOm9BnFaPHzkvnHFE5v+QlwHMNHBnIvC5UvZFiz24YkBQjCAlQL
	 g4FlvTFm0hMOsAtfMbIf3SnRgqQsePZWcerBrMz42JUzd2F9yoSjJC2hff0BHBM7jZ
	 Vct+9yN8HQHkrkcaNSnjf1uky9tLk3sh5uI3TJjs=
Date: Tue, 12 May 2026 11:44:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: deller@gmx.de, chintanlike@gmail.com, tzimmermann@suse.de,
	andriy.shevchenko@intel.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: convert sysfs attributes to use
 attribute_group
Message-ID: <2026051235-lent-genre-813a@gregkh>
References: <20260512092817.1941-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512092817.1941-1-shawharshit116@gmail.com>

On Tue, May 12, 2026 at 09:28:17AM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() and device_remove_file() calls
> with the correct attribute_group API using sysfs_create_group() and
> sysfs_remove_group(). This is the proper way to register sysfs
> attributes in kernel drivers.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-sysfs.c | 83 ++++++++++++++++++-----------
>  1 file changed, 52 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
> index d05599d80011..8d3c4e49b68e 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -142,9 +142,30 @@ static ssize_t show_gamma_curve(struct device *device,
>  	return sprintf_gamma(par, par->gamma.curves, buf);
>  }
>  
> -static struct device_attribute gamma_device_attrs[] = {
> -	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
> -};
> +static ssize_t store_debug(struct device *device,
> +			   struct device_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct fb_info *fb_info = dev_get_drvdata(device);
> +	struct fbtft_par *par = fb_info->par;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &par->debug);
> +	if (ret)
> +		return ret;
> +	fbtft_expand_debug_value(&par->debug);
> +
> +	return count;
> +}
> +
> +static ssize_t show_debug(struct device *device,
> +			  struct device_attribute *attr, char *buf)
> +{
> +	struct fb_info *fb_info = dev_get_drvdata(device);
> +	struct fbtft_par *par = fb_info->par;
> +
> +	return sysfs_emit(buf, "%lu\n", par->debug);
> +}
>  
>  void fbtft_expand_debug_value(unsigned long *debug)
>  {
> @@ -173,45 +194,45 @@ void fbtft_expand_debug_value(unsigned long *debug)
>  	}
>  }
>  
> -static ssize_t store_debug(struct device *device,
> -			   struct device_attribute *attr,
> -			   const char *buf, size_t count)
> -{
> -	struct fb_info *fb_info = dev_get_drvdata(device);
> -	struct fbtft_par *par = fb_info->par;
> -	int ret;
> -
> -	ret = kstrtoul(buf, 10, &par->debug);
> -	if (ret)
> -		return ret;
> -	fbtft_expand_debug_value(&par->debug);
> +static DEVICE_ATTR(gamma, 0644, show_gamma_curve, store_gamma_curve);
> +static DEVICE_ATTR(debug, 0644, show_debug, store_debug);
>  
> -	return count;
> -}
> +static struct attribute *fbtft_attrs[] = {
> +	&dev_attr_debug.attr,
> +	NULL,
> +};
>  
> -static ssize_t show_debug(struct device *device,
> -			  struct device_attribute *attr, char *buf)
> -{
> -	struct fb_info *fb_info = dev_get_drvdata(device);
> -	struct fbtft_par *par = fb_info->par;
> +static struct attribute *fbtft_gamma_attrs[] = {
> +	&dev_attr_gamma.attr,
> +	NULL,
> +};
>  
> -	return sysfs_emit(buf, "%lu\n", par->debug);
> -}
> +static const struct attribute_group fbtft_attr_group = {
> +	.attrs = fbtft_attrs,
> +};
>  
> -static struct device_attribute debug_device_attr =
> -	__ATTR(debug, 0660, show_debug, store_debug);
> +static const struct attribute_group fbtft_gamma_attr_group = {
> +	.attrs = fbtft_gamma_attrs,
> +};

Why not use the ATTRIBUTE_GROUPS() macro instead?  That's what it is
there for :)

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
> +	ret = sysfs_create_group(&dev->kobj, &fbtft_attr_group);

Close, but if you ever find a driver calling a "raw" sysfs_* function,
something is really wrong.

This group needs to be added to the driver itself, as a default group
pointer, and then the driver core will add/remove the group
automatically for you when a device is bound/unbound from the driver.
No need to ever do this on its own.

thanks,

greg k-h
