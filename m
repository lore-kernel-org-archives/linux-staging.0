Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EC22BB1D
	for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522539; cv=none; b=OS+eorHfNczROlj187ysy7vqsvlMebQ6y/dlbEUbeZZpOqD1p9aPRwEaLd0QqpkrVOcoN2CPNOzCj3djqQHE9oiYwAStdlzE782T5NUq9tx17ANOpWF+cFNvmQ1MmJ+hyQagddTZ4fyaC4Xy5i0Cb5tVZLlQ7lmsdW2aj4Qpsbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522539; c=relaxed/simple;
	bh=jS7CeHrv/AeGZdOQ/WoM0enjwVnBDM2WkTpACOOaB8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5Aes+a29nXJgfX+kl4CvnsErs0okwWnlKZXaDYZbbie8yILQc/MAC1k3wYNYv7Z5L5J/LX1se/0+X86lPVLOsjzVSbiP8o6G+7+4R8BNZx7RMq9NHv0Ky09ysVYmF2VHj3TMFti1qhFEe7g1Q9ncYYiq696X8P9FhfxVabQKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h26u/l5c; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h26u/l5c"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so414686f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Sep 2025 23:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758522536; x=1759127336; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZLlyj1lrTQJXPVDMgRBgvEm8gNKaL9UfywhFXowTYg=;
        b=h26u/l5ci3t9AYG9QiD/errIbqOgeaSjuZ9PyARAwC/Ek1CSwPi4IHrkLi+Gkdypin
         W1DZbjPsEKyyFNcKpiCnCeron0wV8GQBCla+AFkB2xMiBNsyyVZyplinFSONDzMVtcPj
         /1FvaJkmPctjmcbC26rWw2CkJLrr6p/e5axSbrkySo3lYbE/zKKWC+o7VIu7oM8SrGU6
         hPyz+R2nwwl1aOVCMt0bKqKlsX97t7RopPaWAY/r4BvX3p0+jYF+Yw78oZrbx5XxWVLA
         JKB2wx+IMEh1cp8CEMcGoonyJhNZZ+i+lZn8kt4G7WXGs7ywXLYNXb9pv5M+iwNS+8i9
         jnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522536; x=1759127336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZLlyj1lrTQJXPVDMgRBgvEm8gNKaL9UfywhFXowTYg=;
        b=f6+Xyo2DKx/yC+os3C0gpfANxE56WIqS+8icsf2wyE9hh4gQzAcg5xVjLlLsFKpcp9
         FlFoh6GpbHB33Z3R/Lv8tMLByo6VrhE55UnFTcDcFoZdQTzGLltbABMzJiUcfdC5fBe8
         pwyWUjaSPCAbUTLZYQw2Z1OsIS18natvZ0f/LFy/tkJtUV+Wo33QX1q99OzAboN15lbN
         sT3Z17Xt2bdPxT4nxY5ILham/Tgfl/GZsUGT+rMpPF0nwc6Q41+C69kYH+gFAuewd0Ii
         B2Wno8VaWmjS8bKRuK5dysm1Ub4i3Oov8piwIjiQo5pugfn/gsAaz3VM3u86DFBvqkwr
         KPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU33C9+5t5kmfOt9arIBjn5MSN4uq42WiHd75r35Udekys3VPleHb6fof58dHWGhoAejee2+VNvjPEQKpx2@lists.linux.dev
X-Gm-Message-State: AOJu0YyuHVdMTH64gqVrQFPpVyo5rN9HrArTCydtZmrvuAXdUfw3p1Qo
	4RYm0SxQE7C3BjwsT/F8XYmicTc+D8ZDQUi02f7Bd4YnFPn8uiIGOk1mwPDIwPCdKIA=
X-Gm-Gg: ASbGncuiL/8nzTPExkekhQyFUqTmFflkmC4h0jm4VrAsT9oVRvAAtI0fyXBRD5ykA4G
	8Lw95s9ogZnNb5iNfhIoN4epy9vIc7dPDOJZrk6QJexO8oUnYb9FAxss+silBx7iOYlx2PL/tZ7
	7W9ApVnaiok4Fb6QSjKT0FbQMV5/MLYuyk6WPL9jiQI3YBZlsXXLDBeuprXVDn3PWumJlRuBXRw
	bVs+PaMoNR+j/BoLnholjevStoMvuIjGjv3U+grJjMDwPOoDDLvEQycLoYrVfq33rXfx6sZx08O
	/l2j1m//1eZT3fPJdK6wC4KTqGenGrModkHoNJ4OHEFoB80VY2PBOjZfSP7Lgi4pD7JsN0Orpzp
	SSPFMTpYRajbpKhxM+5t+GU7WIVYZ
X-Google-Smtp-Source: AGHT+IEi7y+wmyoeJmcLrzMj7JBQYxtJq3v3U/Csxfuh3DcOz0vyeFncb6QmMd0G2jzMcncIY5GShg==
X-Received: by 2002:a05:6000:248a:b0:3df:22a3:d240 with SMTP id ffacd0b85a97d-3edd43ac9ebmr12498231f8f.4.1758522536140;
        Sun, 21 Sep 2025 23:28:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f0aac3fdsm183666865e9.1.2025.09.21.23.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:28:55 -0700 (PDT)
Date: Mon, 22 Sep 2025 09:28:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	matchstick@neverthere.org, dominik.karol.piatkowski@protonmail.com,
	arnd@arndb.de, nichen@iscas.ac.cn, paul.retourne@orange.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Fix device reference leak in fmh_gpib
 driver
Message-ID: <aNDspDsgj5I5KGLe@stanley.mountain>
References: <20250922023831.21343-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922023831.21343-1-make24@iscas.ac.cn>

On Mon, Sep 22, 2025 at 10:38:31AM +0800, Ma Ke wrote:
> The fmh_gpib driver contains a device reference count leak in
> fmh_gpib_attach_impl() where driver_find_device() increases the
> reference count of the device by get_device() when matching but this
> reference is not properly decreased. Add put_device() in
> fmh_gpib_attach_impl() and add put_device() in fmh_gpib_detach(),
> which ensures that the reference count of the device is correctly
> managed.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
> index 4138f3d2bae7..245c8fe87eaa 100644
> --- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
> +++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
> @@ -1395,14 +1395,17 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	pdev = to_platform_device(board->dev);
>  
>  	retval = fmh_gpib_generic_attach(board);
> -	if (retval)
> +	if (retval) {
> +		put_device(board->dev);
>  		return retval;

Do this with an unwind goto.

	if (reval)
		goto put_dev;

	...

	retval = fmh_gpib_init(...);  /* this bug wasn't fixed btw */
	if (retval)
		goto put_dev;

	return 0;

put_dev:
	put_device(board->dev);
	return retval;

Actually, this function needs a bunch of other frees as well.  See
my blog for more details:

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

> +	}
>  
>  	e_priv = board->private_data;
>  	nec_priv = &e_priv->nec7210_priv;
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpib_control_status");
>  	if (!res) {
> +		put_device(board->dev);
>  		dev_err(board->dev, "Unable to locate mmio resource\n");
>  		return -ENODEV;
>  	}
> @@ -1410,6 +1413,7 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	if (request_mem_region(res->start,
>  			       resource_size(res),
>  			       pdev->name) == NULL) {
> +		put_device(board->dev);
>  		dev_err(board->dev, "cannot claim registers\n");
>  		return -ENXIO;
>  	}

request_mem_region() needs a release_region().

> @@ -1418,6 +1422,7 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	nec_priv->mmiobase = ioremap(e_priv->gpib_iomem_res->start,
>  				     resource_size(e_priv->gpib_iomem_res));
>  	if (!nec_priv->mmiobase) {
> +		put_device(board->dev);
>  		dev_err(board->dev, "Could not map I/O memory\n");
>  		return -ENOMEM;
>  	}

ioremap() needs an iounmap();

> @@ -1426,12 +1431,14 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma_fifos");
>  	if (!res) {
> +		put_device(board->dev);
>  		dev_err(board->dev, "Unable to locate mmio resource for gpib dma port\n");
>  		return -ENODEV;
>  	}
>  	if (request_mem_region(res->start,
>  			       resource_size(res),
>  			       pdev->name) == NULL) {
> +		put_device(board->dev);
>  		dev_err(board->dev, "cannot claim registers\n");
>  		return -ENXIO;
>  	}

release_region()

> @@ -1439,6 +1446,7 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	e_priv->fifo_base = ioremap(e_priv->dma_port_res->start,
>  				    resource_size(e_priv->dma_port_res));
>  	if (!e_priv->fifo_base) {
> +		put_device(board->dev);
>  		dev_err(board->dev, "Could not map I/O memory for fifos\n");
>  		return -ENOMEM;
>  	}

iounmap();

> @@ -1447,10 +1455,14 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  		(unsigned long)resource_size(e_priv->dma_port_res));
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		put_device(board->dev);
>  		return -EBUSY;
> +	}
> +
>  	retval = request_irq(irq, fmh_gpib_interrupt, IRQF_SHARED, pdev->name, board);
>  	if (retval) {
> +		put_device(board->dev);
>  		dev_err(board->dev,
>  			"cannot register interrupt handler err=%d\n",
>  			retval);

request_irq() needs a release_irq()

> @@ -1461,6 +1473,7 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	if (acquire_dma) {
>  		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
>  		if (!e_priv->dma_channel) {
> +			put_device(board->dev);
>  			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
>  			return -EIO;
>  		}

This needs a free too.  There may be other things outside of what I
can see in this email.

> @@ -1517,6 +1530,12 @@ void fmh_gpib_detach(struct gpib_board *board)
>  					   resource_size(e_priv->gpib_iomem_res));
>  	}
>  	fmh_gpib_generic_detach(board);
> +
> +	if (board->dev) {
> +		dev_set_drvdata(board->dev, NULL);
> +		put_device(board->dev);
> +		board->dev = NULL;

I explain this in my blog, that the free function should be a cut
and paste of the cleanup.  So this stuff isn't done in the cleanup
so one or the other of these is not correct.

The question is should this be done in one patch or several patches?
Adding cleanup to one function is generally considered One Thing
in terms of One Thing Per Path.  If we were going to backport bits
of cleanup to different stable kernels then we would want to break
it up into the easiest way for backporting.  But realistically we're
not going to do that here because this doesn't affect real life
users generally.  It's just from review.  It's not a security patch.
And this is staging as well so the standards for backports are not
necessarily as strict.  (Staging drivers are often really really bad).

regards,
dan carpenter

