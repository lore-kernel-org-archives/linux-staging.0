Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5881AF0BB
	for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742650762; cv=none; b=q6t+EIcHU3CQ3VOZkvS/IkEKL2fpwPcV/Ix3AwR6LtL1q+aMQTtIZG1JWUWMO7OuiuvPUiJuA/CDezVGxYO9v+56EQDyx/vC53Z8GAxZ76/j4iKU332p5bYvovP8/i789iOZwMvFVyxWCO3nIMOypei+++FlYELPVA3ZFCO46EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742650762; c=relaxed/simple;
	bh=XKIrgqCUqKzr2rLYyevfJSm1vWGqKfiisyvyw/yc950=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHghjAI7QTeGg0RHhMTUHwqnoe5GayOrvQyBSiWXm0kub9kLgWZKnYW/UknlKpyKJ8z2Tk0h/QqB+0dwzMWD7b3V3qbWeyz1vqih3yv3Ellf0PmhXPhiSU/At85WeEaBqOL+anBJ5r2VtsSQ8abG4OnEW5RQV4OMASzRQAVxgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PavmyH0C; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PavmyH0C"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3031354f134so2349456a91.3
        for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 06:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742650761; x=1743255561; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P+EUS7u6sE/lUiUTaK0rB8xpgpACxlJdevNW8AvmFBk=;
        b=PavmyH0CBRs52gVv4vL4OQW+JjCsAarV7eDCS+hVR+/Qxc4DihEU+z/q6P03jFz8SV
         x3pr5PNQrvXMWi8nAu9hVSl7YD1WV4J/mmeN+Ay8qGvLBQZYnockzM9/2uaecuw8dze4
         s+NonoZBbOmJFUQ+hYmz6cY7BoDhVcYXGuZk0P3DaT2IS5NS0UnHg3DhpnXH/VY7m0KE
         kI1dpZ+6ylOJ2xia7KLhbIRkTCyiPH840ccO+LJWwZgPo7YFtST4fk2NRXW607KiShb+
         hKzF4JxSbKrNt3Pv28WEFYxyQSEiN0Tfo6D9G6hQDI1FKslWLRMhKbdqo6AtuVp2XJBa
         CHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742650761; x=1743255561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+EUS7u6sE/lUiUTaK0rB8xpgpACxlJdevNW8AvmFBk=;
        b=I/V/HeVFma0Uq8eKKyhpbai558gkAx0uYLZZ6+JXaLjnKc+RnC6pcvw0C8O336KhQ5
         /cealdZqDvCH+Ghrye5ng9g4fValzNKJoplGVfBpIGMdN7VOR5k8u4Rm4Lei22pkRbDc
         sUHmEx+8dcda8i3Nm8CFcQjxlR7dvskRkpzSXS0gje0Ma641d4BkvjA11JKQuhBfBRHk
         B66n8v6P5ONhkXXTj6Coogu+Ya2yAQ1xlbCUxPtuxuqvV0bf0c3BnrekikhPsaSzyqAC
         jVbt4QiNcmD4MWLtyhG2FpS+LEK8D1rj6I/V5i9KtqTpW53R0z7wSp3xPjTFZ6DcK4T+
         vxBA==
X-Forwarded-Encrypted: i=1; AJvYcCUZTWzDBzi8rw4xNxWAZorVNaokdptFMlWCcJGWi98mMciX0YIRTUnAoQU0tcPj61WTq7jrPHb97AbXyu6t@lists.linux.dev
X-Gm-Message-State: AOJu0YyhS4L9Mg2Uj9+b53s1jjMQu2RrbXqicfrfmzG+1dCf1Aivo93M
	0aNj8VRkLVG9saWBGpGROD66fhspC48R6jRwnz3P8Z9X8D1E9SDz
X-Gm-Gg: ASbGncsPrDm5nzJvvIfG1yu8f00bHVyiNQXAy3JEjJEildBdCNfg1i3Hit8tIg4hwAF
	oRmsFq0MuOfIUj1mNZUZzUiPjfglndwToCKmvOrArTriqbSSB5V1/vdNN1HNN/rMQYJqNyG2ytU
	egVWDOmweEWhGPJGcAwQ8H8J/aDbyRjOR5nXUtkHqbUPTbG5liVUy+4DNOGg3WCfacM1dWXq77I
	TRi+Cm0Tq1Q6A0K+JRdbIxQHhIhC+ktkDyDJxyogmLUygn/QFviv9aJHFtlBQni0oH6DflAesIy
	niL8A9Fr2JpdDGprABa6zyDw2vSNezlndVZyfYrIKwSk68e5wXBAYw==
X-Google-Smtp-Source: AGHT+IGAMRI8qghoQ88hiRYeDKHXI01kQCTBp3E3XmT2HIRI1dnp6VXTaODfyPRS6ZuF/s9XRLJFog==
X-Received: by 2002:a05:6a20:d81b:b0:1f5:67c2:e3e9 with SMTP id adf61e73a8af0-1fe4342cc6emr12058393637.29.1742650760092;
        Sat, 22 Mar 2025 06:39:20 -0700 (PDT)
Received: from localhost ([2804:30c:b31:2d00:277c:5cbe:7f44:752b])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7390615874csm4122480b3a.143.2025.03.22.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 06:39:18 -0700 (PDT)
Date: Sat, 22 Mar 2025 10:40:17 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] iio: frequency: ad9832: devicetree probing support
Message-ID: <Z969wZRJxMCyVuqy@debian-BULLSEYE-live-builder-AMD64>
References: <20250322081108.202654-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322081108.202654-1-simeddon@gmail.com>

LGTM, one minor suggestion inline.
With that applied,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

On 03/22, Siddharth Menon wrote:
> Introduce struct for device match of_device_id
> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 9a27acd88926..506478ddede3 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -439,6 +439,13 @@ static int ad9832_probe(struct spi_device *spi)
>  	return devm_iio_device_register(&spi->dev, indio_dev);
>  }
>  
> +static const struct of_device_id ad9832_of_match[] = {
> +	{ .compatible = "adi,ad9832" },
> +	{ .compatible = "adi,ad9835" },
> +	{},
I think Jonathan prefers to have a space separating the null terminator braces.
	{ },

> +};
> +MODULE_DEVICE_TABLE(of, ad9832_of_match);
> +
>  static const struct spi_device_id ad9832_id[] = {
>  	{"ad9832", 0},
>  	{"ad9835", 0},
> @@ -449,6 +456,7 @@ MODULE_DEVICE_TABLE(spi, ad9832_id);
>  static struct spi_driver ad9832_driver = {
>  	.driver = {
>  		.name	= "ad9832",
> +		.of_match_table = ad9832_of_match,
>  	},
>  	.probe		= ad9832_probe,
>  	.id_table	= ad9832_id,
> -- 
> 2.48.1
> 
