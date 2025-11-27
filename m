Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F5A2571B8
	for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225332; cv=none; b=nkFbBvKbhKlE8N/ERiGvGNstlclHqo5D5579FNcI180XWLOE1/4t97FScMjsNmevE9R1100hAtkvAnRww5SY+h9v7rO7PPl5UogCsHEqLnPKH5jorSKxyjcEMqyrx3CnrQXXsAU8lLbONLEkqXhoj1JY93/z1dVtlNO5hqCNXO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225332; c=relaxed/simple;
	bh=K7wkWLwbfTcY/AfS2EVsUuILQbKr9hsQgn/zdqfz6PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrqYv/Kp0h3u8HQtY8U1Dwen8dF3LXiFw/ieabD8/WsuhxWUE/ZTMU3MyIFQMbbQxIF19m+UvI0FeCGWkBt0JrPBTxAxRiBPlESxFNSeOjOjWhQ990GB9gOyHVp45gAliXioslqSDtXJKsZTxZNguANnvK1DD5Tsx11k5uSlhLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5YkTT/G; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5YkTT/G"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779a637712so2392755e9.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 22:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764225328; x=1764830128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QG1ab1vJmGEim6W8b8KLS1C7JN6Szi3cb3yM3drSkzs=;
        b=H5YkTT/GZgZ6oomhEUnf14lSmakFHMmqXEf8N9hWkRaBf4GnKiUe25NdXXJppdFgac
         zHBqr8ZYYYqnvt4dvZIEEwEuviMXWDQraeZOyptMJWepm2DI4ZcluRoKFmbokpJb73Dx
         fCGyS84KpwYCfz5+LMWd/HVrgPU9bnmf6gremQpH63n6BvEHVmEu0qfAvT/dOJ4iRQJd
         ZJpVwikqc0wggOnR3v42bz/VN6N7TAE5A8+p6FBUiMqg3bYDoFn5N027AQrSnz1VZu/I
         pVI9ptlicUI0uti637H8m4oCqJgXDomCH72q50kTNPzfkDGmCU+mRlfq/zgSTRfHlTnO
         /Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764225328; x=1764830128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QG1ab1vJmGEim6W8b8KLS1C7JN6Szi3cb3yM3drSkzs=;
        b=vOpbSSBSVWYetWG2k9ABLHQADfK91xqObs/GtysKEaZjPW4bQhLP5edj/QNz2TlR+w
         A7prAcWJdUbUgr1Y5zON/OmwwefX75heW3hVIKWfImgbGfExAAzAyR8sbzi9ZW0PqZ9m
         5J8iiLJ57TGrsLsnrHeNZdyADxEJPr7BLEqxbn5XRxGf0mTdkbawv+WQMBvTNkHQ9h8p
         p9CtqWW3iLE6zu+btORJLNArgGMZsKB/Udg9VreAst99rv7nMYiDwI4OT+7FhBQbGLk5
         vw2MvcJaeC18eaf5uLGQHPEVnVLEsUi/tc5NN7BfECZ9TLPwPwChG+M/vspDqAcD851u
         oF0g==
X-Forwarded-Encrypted: i=1; AJvYcCXw1QXiXFUAJh180zq9Eld5YXKfiF45zKFZzyMRTEYy6W49uXkiLBwuGLpAJDALVcIvucoGvqKlJEAxxj9A@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9FgTLSPck1kyk9jvM7ac5U9siF7KJlkkCoI3hNA2VH5Ok9AGk
	XCjakApvnbOSIo2E6ktvv/y7FYzCC/e7B95sCFXQI5Y7LX3ItX0AvsqglO0ClbAKYc4=
X-Gm-Gg: ASbGncuTPxGIs6522sFiZH6+BZFnUeItzGCaJvp5pKvlqYK4699Xs6R4GWR9H9of6pv
	QEo4QuCqyx17HD4w4t1NXAeDfvcxt9ZLB+9crqVw/BFwlx+NID5Z14Gce3mdHBPqYAvAwdj/mpu
	C9Xn3v4qVtYgl6rZPpvXY0fD4oH2eGTDm4B7cj8lQwx6Oqn7i2a13jTiztsoQJlrOswNkD/Vv1W
	TnKvhOkx3HYzjR9IrV8MvvPw/wn82ZX4nUqtBmnB6Tteu4M2TH13n3S/jE01igVU4aWC0yjTu9T
	v/8kMAq7w3rE4LPn2xJTfDsoOhN7b3emlF0H8V0X0gF2YT0GHhLWhDTuXFY5DMALlQTSDbRG0di
	lMAzLeDPDvY54asxyZpLNMBMdJmrLwPvi9gez8FA0rj90ElK3iRytWVASg8fg5oXkKmXe8vLh7b
	mj4hSi8vO2msSEI6r5
X-Google-Smtp-Source: AGHT+IHEmibK0udfIuppA6wX8xMIzq+UUpCQsBWcIRyGDYq7O11kWqm0w9k6oetirALRl5l1cBS4iw==
X-Received: by 2002:a05:6000:2411:b0:42b:3131:542f with SMTP id ffacd0b85a97d-42cc1cbcfd6mr24641070f8f.24.1764225328331;
        Wed, 26 Nov 2025 22:35:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d6049sm1691335f8f.10.2025.11.26.22.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 22:35:27 -0800 (PST)
Date: Thu, 27 Nov 2025 09:35:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, abdun.nihaal@gmail.com
Subject: Re: [PATCH v3] most: core: fix resource leak in
 most_register_interface error paths
Message-ID: <aSfxKwd7akeWllAr@stanley.mountain>
References: <20251126220856.3918-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126220856.3918-1-knavaneeth786@gmail.com>

On Wed, Nov 26, 2025 at 10:08:56PM +0000, Navaneeth K wrote:
> The function most_register_interface() did not correctly release resources
> if it failed early (before device_register). In these cases, it returned
> an error code immediately, leaking the memory allocated for the interface.
> 
> Fix this by initializing the device early via device_initialize() and
> calling put_device() on all error paths. This ensures the release
> callback is triggered to free memory.
> 
> Switch to using device_add() instead of device_register() to handle
> the split initialization.
> 
> Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> ---

Could we add this information to the commit message?

"The most_register_interface() is expected to call put_device() on
error which frees the resources allocated in the caller.  The
put_device() either calls release_mdev() or dim2_release(),
depending on the caller."

> Changes in v3:
>  - Dropped the USB cleanup patch as it was already applied upstream.
>  - Added Reported-by and Acked-by tags.
> 
>  drivers/most/core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/most/core.c b/drivers/most/core.c
> index da319d108ea1d..8635fd08035e9 100644
> --- a/drivers/most/core.c
> +++ b/drivers/most/core.c
> @@ -1283,18 +1283,23 @@ int most_register_interface(struct most_interface *iface)
>  	struct most_channel *c;
>  
>  	if (!iface || !iface->enqueue || !iface->configure ||
> -	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS))
> +	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS) ||
> +	    !iface->dev)
>  		return -EINVAL;

Don't add this NULL check.  We never pass a NULL pointer here.  It's
just confusing to check for it.

>  
> +	device_initialize(iface->dev);
> +
>  	id = ida_alloc(&mdev_id, GFP_KERNEL);
>  	if (id < 0) {
>  		dev_err(iface->dev, "Failed to allocate device ID\n");
> +		put_device(iface->dev);
>  		return id;
>  	}
>  
>  	iface->p = kzalloc(sizeof(*iface->p), GFP_KERNEL);
>  	if (!iface->p) {
>  		ida_free(&mdev_id, id);
> +		put_device(iface->dev);
>  		return -ENOMEM;

This is an annoying thing because the function uses a mix of direct
returns and an unwind ladder to clean up.  It should just use an
unwind ladder.  So this should be a "goto err_free_ida;".  That's
unrelated to this patch so don't mix the two but if someone wanted to
fix it, that would be great.

KTODO: cleanup error handling in most_register_interface()

>  	}
>  
> @@ -1304,7 +1309,7 @@ int most_register_interface(struct most_interface *iface)
>  	iface->dev->bus = &mostbus;
>  	iface->dev->groups = interface_attr_groups;
>  	dev_set_drvdata(iface->dev, iface);
> -	if (device_register(iface->dev)) {
> +	if (device_add(iface->dev)) {

Unrelated and minor, but this should really be:

	ret = device_add(iface->dev);
	if (ret) {

>  		dev_err(iface->dev, "Failed to register interface device\n");
>  		kfree(iface->p);
>  		put_device(iface->dev);

Again, unrelated to your patch, but there is still a bug in the
error handling because if the if (device_register(&c->dev)) { call
fails then we don't call list_del(&c->list) so it's a use after free.

The way to review these is, does the unwind ladder match the release
function, most_deregister_interface()?  In this case the release
function calls c->pipe0.comp->disconnect_channel() which is not
necessary when we're cleaning up from probe() so that's fine.  But
the list_del(&c->list) part is necessary.

Another very minor thing, but if I were writing this, I would move
the put_device(&c->dev) before the goto.  It's better to clean up
partial iterations inside the loop, without doing gotos there.  That
way you can add new rungs to the top of the unwind ladder.

I have a blog about this:
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter
