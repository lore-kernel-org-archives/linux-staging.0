Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1516B3921EE
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092768; cv=none; b=G/bTuWcObTu03sAdHo1tK+etX+ebO2enMmxvkhAaBtuP1zG4DLoC1s9e6Oo8eTYhVmDS8rMek52szWZv8RMNvHbKxCb6Xf7rody59WAMaL5lTddVi7i9qMuJVgfFAKHHrtGZpghDvEY3UJtltLwp9y+cjoCu0FmMmynlXmacXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092768; c=relaxed/simple;
	bh=qLG7wMVtf/j22IKOyovAjOUI9k6Ney9TZklG84nK0qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvs0kFcoD4VnJdixXhzQC39oxSBxdew3lF1S2YKSLHg5RZ1/FtfCKGdE73l4qzafpEfxFlbP1zDBOmM+vQ5aO+MgZvVcJ5aV7YnS66/wNM2OO1NQ/SaGphZqlSLbREupG37X8Kt2QFBhWxDBEhQDrOIfpt27WRNAA1dFNbBCnc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsS4Msiw; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsS4Msiw"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48375f10628so3778145e9.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 23:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772092763; x=1772697563; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLdqyb8yIbOLy6zeHm6lvt/oajlIBvuw62gXqoMgj+0=;
        b=DsS4Msiwobx/ktBO9wPcdY/MtOrqTsQUffIFLfUL//Qlh17Cbm72qAjVFO8K+UotYu
         YLDfRLuAOerF2tN8cWEW8PwHVBUYIJsqDQH2EhtheN21QVqzv1tulJxTTBMtPCdbpgFw
         OUHArm1yYs0Bu4AGjz86FC/GM0GfTN1w6mSiGUJY75eXFlKPJiOpwlQwFfk4fLvBRYGy
         iB8j3B9NECTUUAOJ//OEoajN62dHDb5mP/D+ZQzhRbcTWEa8k2kWXTfxYr5aYxOge1Ml
         o5Fvu8RHheVN2LNu+Xt6L+sHuS9irwS0vgd+C11fFoDMndKcwIn8d7ABqjChTOs4SRMM
         nBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092763; x=1772697563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLdqyb8yIbOLy6zeHm6lvt/oajlIBvuw62gXqoMgj+0=;
        b=cajfeurJ8A6Fr1blmrucg85xEIfZ8iDMqLmjea1daIle4TcL3URf5TjQW9V+1CGnr1
         VXIdFn1Vt+g4ewkWn9oFaRf71PptLApbsYpQs7LO7GGJQS0qTHtRSvz6hovsZaaUngyv
         GBJiWgi4mo5iAdw2+d/jzg9TNgjS0D7kr5c5eMVngj98BrG/CaxuFASZEjs6IeVun6gP
         x58pwUtpuGKtdBCLeIwRD733QusJ60Kv6a7+pNbxVvmuq2qNVp5aCjBwxQjcpr9qOkIi
         eJdQ07cgvxciNu1LJeyP0bi/Is6B7UgJ0I+1rZBPpyYQb185O8EbRVgGZETL3DwaaWgV
         9zkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAeM6hzImR/6JDWbfsB3gGmHI8SNR9cOahoY2motnOskNewVFZ1HELr1+WOp8KbLccSWpYJ54aM8uoLFeH@lists.linux.dev
X-Gm-Message-State: AOJu0YwOq0gS3liYY//YQ/bEtTmXNnrcGR2X/9y7+bCgCBeD5qC3m4LB
	v6RmBHMV8En0xL6u2I1eaZuJp2oLKB0xbgvkfXmAdZYgprK1D5ikeHwcIL53ZnBJ4Ok=
X-Gm-Gg: ATEYQzxH8CGesPjLw5Gk72VISnbpMEe0t7+w/gsvS35TWtJjyZMDFU2gaZ7T/hNNoKG
	57MXKijHu13ZejsVh1d0w0SgxTsGRw9mCz0bKHbBbM8Kgc9bpI4GLpcJ4drBgZ7h/xDcNTdkjxL
	epb9Ln+htgprMzDNYy9W4g0aelpzFX++3GHJPlyzadwB3DQq5CaLD6v5gkUJpVQmfwRREVEIrDa
	ii4XA7mKZg53cmWU8D1dxO5IBY+ydswuPjkWeLASfkiPFr9AemrIunZEa3mgcnODC6tWQOfrW9c
	bqrX3KKI5HyHgnqvxQslb+xYd223thR8cp1DyyzwNQu7MQcwnln/O8VsS+bESjxqVFped9cyCmo
	E8/gkSKYaZ6lhpL13Icw/hYtiDODfuDtlX0Rvms5kWFa2ZnWgpKfoXPuNU4fI5HiRL9Pib8tdUP
	jjeRBFYDGaAzdGiAyAyqXGlP8SWqVg
X-Received: by 2002:a05:600c:3b17:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483a95b15b6mr324802165e9.7.1772092763082;
        Wed, 25 Feb 2026 23:59:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm26081755e9.15.2026.02.25.23.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:59:22 -0800 (PST)
Date: Thu, 26 Feb 2026 10:59:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: uart: fix style issues
Message-ID: <aZ_9V7cldGzWNDrb@stanley.mountain>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>

On Thu, Feb 26, 2026 at 12:08:35AM +0530, Shubham Chakraborty wrote:
> Fix checkpatch.pl warnings by adding comments to mutex and spinlocks,
> and fixing alignment to match open parenthesis.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..1d2c4ef70865 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock;		/* protects read operations */

This is really vague, but I wouldn't say it was accurate.

> +	spinlock_t write_lock;		/* protects write operations */

Also really vague.  What does "operations" mean in this context?
But word "write" is correct at least.

>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;
> +	struct mutex mutex;		/* serializes port operations */

This comment is doesn't really add any value.

regards,
dan carpenter

