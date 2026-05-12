Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65A3314AC;
	Tue, 12 May 2026 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588151; cv=none; b=NKKPzfyZYo8kl+NCwyhXGpWfU2QaD2Rz7l6HCK6xXYok3PYKqu9chp3gC34W5gDcO9JAxwEisSIT58cGP7UYTH+y/PVTGJS7Jxlo6OLbt+Mil/yhfwLGKGrE743HpQgfsKSSLEgjJdU8eKlKqmSFWYbjNnvf95U3DcPdIPvVUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588151; c=relaxed/simple;
	bh=sOvdDuM6FVc0g1RDYAoz6O2G5K4mQ3MU3XYqOXI9SGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esjsV9Zptgtg2QEtubJnflb4lpYOl7v0pUZl1OfdTsZGwVv+DuF59NMWd4AW+v0giiD1nr6I3xoF6FeaeTGmMYKSQz+cDvBKs9+PhQlwC2FVGl5SERNwRWMRGdXHcZzvHvLLovBksE+jqS3/o87hZjN3pfLOA9wHt66ihsCipzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yPylVV1F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yPylVV1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCB3C2BCB0;
	Tue, 12 May 2026 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778588150;
	bh=sOvdDuM6FVc0g1RDYAoz6O2G5K4mQ3MU3XYqOXI9SGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yPylVV1Fkr5XtWmy6fMU8XStOCz6yf+kKV7xpkbGX3SpOr/Hk/nOv6n2h+jtGe6+t
	 Tmnf9aN1Qea4jZmzxcQCikkUxEcHjEq01OsVim7qNa8MT0/HIc3++WADjTKD1p61sq
	 PIqd4ylMGObwdnnhDRifc1lDXfZFx9QY+1iiMb3U=
Date: Tue, 12 May 2026 14:15:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: andriy.shevchenko@intel.com, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <2026051241-drench-mullets-84d7@gregkh>
References: <20260512113320.2548-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512113320.2548-1-shawharshit116@gmail.com>

On Tue, May 12, 2026 at 11:33:20AM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() calls with the correct
> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
> driver structure so the driver core automatically adds and removes
> the sysfs attributes when a device is bound or unbound.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c  |  3 -
>  drivers/staging/fbtft/fbtft-sysfs.c | 86 +++++++++++------------------
>  drivers/staging/fbtft/fbtft.h       |  2 +
>  drivers/staging/fbtft/internal.h    |  3 +-
>  4 files changed, 35 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 3da42c8ca6e3..e6d33127cecc 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -782,8 +782,6 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>  	if (ret < 0)
>  		goto reg_fail;
>  
> -	fbtft_sysfs_init(par);
> -
>  	if (par->txbuf.buf && par->txbuf.len >= 1024)
>  		sprintf(text1, ", %zu KiB buffer memory", par->txbuf.len >> 10);
>  	if (spi)
> @@ -826,7 +824,6 @@ int fbtft_unregister_framebuffer(struct fb_info *fb_info)
>  
>  	if (par->fbtftops.unregister_backlight)
>  		par->fbtftops.unregister_backlight(par);
> -	fbtft_sysfs_exit(par);
>  	unregister_framebuffer(fb_info);
>  
>  	return 0;
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
> index d05599d80011..416172533e33 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -142,37 +142,6 @@ static ssize_t show_gamma_curve(struct device *device,
>  	return sprintf_gamma(par, par->gamma.curves, buf);
>  }
>  
> -static struct device_attribute gamma_device_attrs[] = {
> -	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
> -};
> -
> -void fbtft_expand_debug_value(unsigned long *debug)
> -{
> -	switch (*debug & 0x7) {
> -	case 1:
> -		*debug |= DEBUG_LEVEL_1;
> -		break;
> -	case 2:
> -		*debug |= DEBUG_LEVEL_2;
> -		break;
> -	case 3:
> -		*debug |= DEBUG_LEVEL_3;
> -		break;
> -	case 4:
> -		*debug |= DEBUG_LEVEL_4;
> -		break;
> -	case 5:
> -		*debug |= DEBUG_LEVEL_5;
> -		break;
> -	case 6:
> -		*debug |= DEBUG_LEVEL_6;
> -		break;
> -	case 7:
> -		*debug = 0xFFFFFFFF;
> -		break;
> -	}
> -}
> -
>  static ssize_t store_debug(struct device *device,
>  			   struct device_attribute *attr,
>  			   const char *buf, size_t count)
> @@ -198,31 +167,40 @@ static ssize_t show_debug(struct device *device,
>  	return sysfs_emit(buf, "%lu\n", par->debug);
>  }
>  
> -static struct device_attribute debug_device_attr =
> -	__ATTR(debug, 0660, show_debug, store_debug);
> -
> -void fbtft_sysfs_init(struct fbtft_par *par)
> +void fbtft_expand_debug_value(unsigned long *debug)
>  {
> -	struct device *dev;
> -
> -	dev = dev_of_fbinfo(par->info);
> -	if (!dev)
> -		return;
> -
> -	device_create_file(dev, &debug_device_attr);
> -	if (par->gamma.curves && par->fbtftops.set_gamma)
> -		device_create_file(dev, &gamma_device_attrs[0]);
> +	switch (*debug & 0x7) {
> +	case 1:
> +		*debug |= DEBUG_LEVEL_1;
> +		break;
> +	case 2:
> +		*debug |= DEBUG_LEVEL_2;
> +		break;
> +	case 3:
> +		*debug |= DEBUG_LEVEL_3;
> +		break;
> +	case 4:
> +		*debug |= DEBUG_LEVEL_4;
> +		break;
> +	case 5:
> +		*debug |= DEBUG_LEVEL_5;
> +		break;
> +	case 6:
> +		*debug |= DEBUG_LEVEL_6;
> +		break;
> +	case 7:
> +		*debug = 0xFFFFFFFF;
> +		break;
> +	}
>  }
>  
> -void fbtft_sysfs_exit(struct fbtft_par *par)
> -{
> -	struct device *dev;
> +static DEVICE_ATTR_RW(debug);
> +static DEVICE_ATTR_RW(gamma);
>  
> -	dev = dev_of_fbinfo(par->info);
> -	if (!dev)
> -		return;
> +static struct attribute *fbtft_attrs[] = {
> +	&dev_attr_debug.attr,
> +	&dev_attr_gamma.attr,
> +	NULL,
> +};
>  
> -	device_remove_file(dev, &debug_device_attr);
> -	if (par->gamma.curves && par->fbtftops.set_gamma)
> -		device_remove_file(dev, &gamma_device_attrs[0]);
> -}
> +ATTRIBUTE_GROUPS(fbtft);
> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> index 317be17b95c1..ab71db017d05 100644
> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -299,6 +299,7 @@ static struct spi_driver fbtft_driver_spi_driver = {				\
>  	.driver = {								\
>  		.name = _name,							\
>  		.of_match_table = dt_ids,					\
> +		.dev_groups = fbtft_groups,					\
>  	},									\
>  	.id_table = _spi_ids,							\
>  	.probe = fbtft_driver_probe_spi,					\
> @@ -328,6 +329,7 @@ static struct platform_driver fbtft_driver_platform_driver = {             \
>  		.name   = _name,                                           \
>  		.owner  = THIS_MODULE,                                     \
>  		.of_match_table = dt_ids,                                  \
> +		.dev_groups = fbtft_groups,                                \
>  	},                                                                 \
>  	.probe  = fbtft_driver_probe_pdev,                                 \
>  	.remove = fbtft_driver_remove_pdev,				   \
> diff --git a/drivers/staging/fbtft/internal.h b/drivers/staging/fbtft/internal.h
> index ae2ff4a4a472..39fd1e167b41 100644
> --- a/drivers/staging/fbtft/internal.h
> +++ b/drivers/staging/fbtft/internal.h
> @@ -4,8 +4,7 @@
>  #ifndef __LINUX_FBTFT_INTERNAL_H
>  #define __LINUX_FBTFT_INTERNAL_H
>  
> -void fbtft_sysfs_init(struct fbtft_par *par);
> -void fbtft_sysfs_exit(struct fbtft_par *par);
> +extern const struct attribute_group *fbtft_groups[];
>  void fbtft_expand_debug_value(unsigned long *debug);
>  int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
>  			  const char *str, int size);
> -- 
> 2.53.0
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
