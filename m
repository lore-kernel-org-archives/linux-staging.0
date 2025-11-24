Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95912316900;
	Mon, 24 Nov 2025 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003266; cv=none; b=XzHjDbSadT5IIrk1tz/rYkYiQ/PcSGfjvYsN0hyQfrstXqeP86HIsAXRZ1qOvwW2hM4R6QVEzb4+mctdZd9nMC554vpN3mzlFxMi58N1EpGm4Fq5PNhEb8REuQZqV4OBs7lCXsvcpy7xcGpkbNIRdYCbsleOZ6VMpb1YIbSlh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003266; c=relaxed/simple;
	bh=A3WFdKL3G7va0CxaDyLnDSMrgoPdTEyb7SFZ+okaKoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAyS6ygD2Z20IkwiyYZ1O1sUcBYzv3oWx56VmiqurfisWxvJGbOTT0PJwRn6eZyOzKgn/erj2OFJY51keUYdXX3IGf+Uvv5ToNseQegHowcPhILb4VIlKzZLbyP0xbBFwwXfLKmT42a6sfMxcfyhOYAAzjsPir+0mIrrva9pwP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mU0eafUn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mU0eafUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E7CC116C6;
	Mon, 24 Nov 2025 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764003266;
	bh=A3WFdKL3G7va0CxaDyLnDSMrgoPdTEyb7SFZ+okaKoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mU0eafUnS4GlUfjgRfNmeauIerUo6KSyxWDo6jKxG8DN6ZBJspmJBjX/BjQGiH0k7
	 hAxuI0BH00qzGC2z2QbjcYFW/SoagwnDJlNipeHLxErrqwYV3sIuvD3MfaBrlGv5YH
	 SR/ZD1HtT7LIhXhxC9gK4Y50tpdNOTM0ZWKkORYQ=
Date: Mon, 24 Nov 2025 17:54:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Adam Quandour <adam.quandour@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	niharchaithanya@gmail.com, dan.carpenter@linaro.org,
	matchstick@neverthere.org, dpenkler@gmail.com
Subject: Re: [PATCH] staging: gpib: Clean-up commented-out code
Message-ID: <2025112415-suitcase-console-5b2d@gregkh>
References: <20251117092020.8473-1-adam.quandour@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117092020.8473-1-adam.quandour@gmail.com>

On Mon, Nov 17, 2025 at 12:20:20PM +0300, Adam Quandour wrote:
> Remove unused code.
> 
> Signed-off-by: Adam Quandour <adam.quandour@gmail.com>
> ---
>  drivers/staging/gpib/cb7210/cb7210.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
> index 3e2397898a9b..24c61b151071 100644
> --- a/drivers/staging/gpib/cb7210/cb7210.c
> +++ b/drivers/staging/gpib/cb7210/cb7210.c
> @@ -1290,26 +1290,14 @@ static void cb_gpib_release(struct pcmcia_device *link)
>  
>  static int cb_gpib_suspend(struct pcmcia_device *link)
>  {
> -	//struct local_info *info = link->priv;
> -	//struct struct gpib_board *dev = info->dev;
> -
>  	if (link->open)
>  		dev_warn(&link->dev, "Device still open\n");
> -	//netif_device_detach(dev);
>  
>  	return 0;
>  }
>  
>  static int cb_gpib_resume(struct pcmcia_device *link)
>  {
> -	//struct local_info *info = link->priv;
> -	//struct struct gpib_board *dev = info->dev;
> -
> -	/*if (link->open) {
> -	 *	ni_gpib_probe(dev);	/ really?
> -	 *	//netif_device_attach(dev);
> -	 *
> -	 */
>  	return cb_gpib_config(link);
>  }
>  
> -- 
> 2.51.0
> 

The code has now moved directories :(
