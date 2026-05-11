Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F15D47885C;
	Mon, 11 May 2026 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523789; cv=none; b=GTpRrbOvGJaQmi3iC9Gqu3AyMKbvFNxGMNU4Yq5xOecEHHHrmp/vbuUnJ5m8F0+8DpmVcYfOAEM8102bYNR4TTd2XPXjEaPnpceSyTQk9mwxAgjaeEcSsEFjCGoutx/vpFGEGcdqEDbN51ak2AjfkwxuUgHXW4iTt3juYnbHtPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523789; c=relaxed/simple;
	bh=zuQEPfTfEivt+i8QuBoBDvJF4yAK/UH/GRRuRGxmfCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mf9ahQPrkq32gYb5MCaiEeEN2S8/sCbBlbk8DK9DeRLc2GZvpcWs6MhbyaEJ3HtS8TeV90gFnbMZdvt3dN5aZzScItHuQ3wreSlMnq6oie11sempeNpyyBcVohh2b7YyZk4vnwvLspleCx7aqqOdbZOe3fE1zdwGiumWbFaePmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BaJzR5+p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BaJzR5+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54468C2BCC9;
	Mon, 11 May 2026 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778523788;
	bh=zuQEPfTfEivt+i8QuBoBDvJF4yAK/UH/GRRuRGxmfCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaJzR5+pcxo4XBArhB3qIYY4F8KKtG2D2gAkYj69hSBxXt3pVyYzQooyEiLmfA29i
	 fgbd1u1i186oA29uAgfMF7FmviJAGyUIxD61E0YrqHvEj7qjCG4o6bnlJvDcN+uIur
	 1lcn+R+gOJNBlUJ7hGiCo7oEKv2U9YQ8NWQyn2qI=
Date: Mon, 11 May 2026 20:23:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: andriy.shevchenko@intel.com, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: remove sysfs debug interface
Message-ID: <2026051156-debunk-faceted-3ad7@gregkh>
References: <20260511180912.1625-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511180912.1625-1-shawharshit116@gmail.com>

On Mon, May 11, 2026 at 06:09:12PM +0000, Harshit Shaw wrote:
> The debug sysfs entry exposed via device_create_file() is not the
> correct approach. Remove fbtft_sysfs_init() and fbtft_sysfs_exit()
> along with the debug sysfs attribute. Drivers should use the standard
> kernel debug API (dev_dbg/pr_debug) instead.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c  |   3 -
>  drivers/staging/fbtft/fbtft-sysfs.c | 111 ----------------------------
>  drivers/staging/fbtft/internal.h    |   2 -
>  3 files changed, 116 deletions(-)
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
> index d05599d80011..925b6c699599 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -89,63 +89,6 @@ int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
>  	return ret;
>  }
>  
> -static ssize_t
> -sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
> -{
> -	ssize_t len = 0;
> -	unsigned int i, j;
> -
> -	mutex_lock(&par->gamma.lock);
> -	for (i = 0; i < par->gamma.num_curves; i++) {
> -		for (j = 0; j < par->gamma.num_values; j++)
> -			len += scnprintf(&buf[len], PAGE_SIZE,
> -			     "%04x ", curves[i * par->gamma.num_values + j]);
> -		buf[len - 1] = '\n';
> -	}
> -	mutex_unlock(&par->gamma.lock);
> -
> -	return len;
> -}
> -
> -static ssize_t store_gamma_curve(struct device *device,
> -				 struct device_attribute *attr,
> -				 const char *buf, size_t count)
> -{
> -	struct fb_info *fb_info = dev_get_drvdata(device);
> -	struct fbtft_par *par = fb_info->par;
> -	u32 tmp_curves[FBTFT_GAMMA_MAX_VALUES_TOTAL];
> -	int ret;
> -
> -	ret = fbtft_gamma_parse_str(par, tmp_curves, buf, count);
> -	if (ret)
> -		return ret;
> -
> -	ret = par->fbtftops.set_gamma(par, tmp_curves);
> -	if (ret)
> -		return ret;
> -
> -	mutex_lock(&par->gamma.lock);
> -	memcpy(par->gamma.curves, tmp_curves,
> -	       par->gamma.num_curves * par->gamma.num_values *
> -	       sizeof(tmp_curves[0]));
> -	mutex_unlock(&par->gamma.lock);
> -
> -	return count;
> -}
> -
> -static ssize_t show_gamma_curve(struct device *device,
> -				struct device_attribute *attr, char *buf)
> -{
> -	struct fb_info *fb_info = dev_get_drvdata(device);
> -	struct fbtft_par *par = fb_info->par;
> -
> -	return sprintf_gamma(par, par->gamma.curves, buf);
> -}
> -
> -static struct device_attribute gamma_device_attrs[] = {
> -	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
> -};

This is not a debugging log level attribute, why remove that?

Again, first turn this into using the correct api (an attribute group),
then fix up the debugging functions that use the "debug" variable to not
do that, and then remove the debug attribute.

thanks,

greg k-h
