Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515702F84
	for <linux-staging@lists.linux.dev>; Sat, 17 Apr 2021 07:18:46 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h4so19681032wrt.12
        for <linux-staging@lists.linux.dev>; Sat, 17 Apr 2021 00:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lzDESpnJwy8q2no0zZGoouoLNqh3tnmLEUrJ5GDonRs=;
        b=rzn2XdwumhMz3IMq2hTIY1ZtnZGekwQClLm2fRy8IPnOaGOBMFLf4aYOib1aCfHeqm
         1pAj2Gfd3TtRiRPgcWseBXWQVukxHfViduJLDUY2KjqKPNO/kTcjm589PqNe36Q7J3Wx
         wSdcPBGkmAPLMio+IZIFMTlN+eMTwScTkIboPUhj4Z7t07X1Hzk2UVN9Rxyjre7SW4lS
         aCsKzSysJz25T1yjzeAhtWKSHeLXUPb3ZSpi8RmzXKnbs56wmKjcw4LwoRe2GuQveYGH
         gte54cDVCR1OMW80mGjUnXdun3ldjiWz/whg8sNaNsGA60mp5GWKKLbfpUqmsd3DxaDT
         J0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lzDESpnJwy8q2no0zZGoouoLNqh3tnmLEUrJ5GDonRs=;
        b=o8agMg5GvaQqnLQHEWAZP1KMVLqMnvFfwONc5XHB00OE1bz3iippVMnBjSIIdJNkMI
         DjUFM0hSh+FyxqIG3mzMgqNMjCqS43ijlX1qfODwhgb/nQ8zFH4jkwutCGS20L51yYzk
         5KXFgZgSYT7X5XOOfZV5m4Pet0BBIv/lOxxlqEaoyHBviAP8q/ax9ENwqXNkjCvyNWVG
         WQaqwSACmC51gX950o4fUTOBWCcF5O/9kHbAE1GyzRjEqAd6UYMgIegsNqM0yzMgbL2d
         SEKGoyignL93fOnWyh0Ky90kD0nLaxPO5oLshn5Xeyg9nZninATIT+uNr/n1BfDJRBMe
         nwog==
X-Gm-Message-State: AOAM532hqTKaHfu1tKGTUc2kHIlAUBvOSZEe56uNdZ8dIOE7bwavzujw
	x3yfM5ckdrYyjRyCzHZfRNU=
X-Google-Smtp-Source: ABdhPJz0+l+y4ld0p2Udvtz/O3KNkgh30U2n0VS6z7cZMwrLx+P+RCwDkaRBydqu+x37EBy5qZLJgw==
X-Received: by 2002:adf:e108:: with SMTP id t8mr2836394wrz.371.1618643924864;
        Sat, 17 Apr 2021 00:18:44 -0700 (PDT)
Received: from agape.jhs ([5.171.80.7])
        by smtp.gmail.com with ESMTPSA id a2sm6954216wmn.48.2021.04.17.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 00:18:44 -0700 (PDT)
Date: Sat, 17 Apr 2021 09:18:41 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/4] fbtft: Replace custom ->reset() with generic one
Message-ID: <20210417071838.GA1401@agape.jhs>
References: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

'staging:' in mail subject is missing...

On Fri, Apr 16, 2021 at 05:20:41PM +0300, Andy Shevchenko wrote:
> The custom ->reset() repeats the generic one, replace it.
> 
> Note, in newer kernels the context of the function is a sleeping one,
> it's fine to switch over to the sleeping functions. Keeping the reset
> line asserted longer than 20 microseconds is also okay, it's an idling
> state of the hardware.
> 
> Fixes: b2ebd4be6fa1 ("staging: fbtft: add fb_agm1264k-fl driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: new patch split from the bigger fix (Greg)
>  drivers/staging/fbtft/fb_agm1264k-fl.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
> index eeeeec97ad27..4dfc22d05a40 100644
> --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
> +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
> @@ -77,19 +77,6 @@ static int init_display(struct fbtft_par *par)
>  	return 0;
>  }
>  
> -static void reset(struct fbtft_par *par)
> -{
> -	if (!par->gpio.reset)
> -		return;
> -
> -	dev_dbg(par->info->device, "%s()\n", __func__);
> -
> -	gpiod_set_value(par->gpio.reset, 0);
> -	udelay(20);
> -	gpiod_set_value(par->gpio.reset, 1);
> -	mdelay(120);
> -}
> -
>  /* Check if all necessary GPIOS defined */
>  static int verify_gpios(struct fbtft_par *par)
>  {
> @@ -439,7 +426,6 @@ static struct fbtft_display display = {
>  		.set_addr_win = set_addr_win,
>  		.verify_gpios = verify_gpios,
>  		.request_gpios_match = request_gpios_match,
> -		.reset = reset,
>  		.write = write,
>  		.write_register = write_reg8_bus8,
>  		.write_vmem = write_vmem,
> -- 
> 2.30.2
> 
> 

thank you,

fabio
