Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8D36A009
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702462; cv=none; b=KkFF4qL4hvDm76cqyVx2TezrXvPMbhrZb/Sp/9yiUF8elMWuvwGGgOz8Q0g1cug9ZW6uRLVk1EJSIhQG5bz1IWbRSPAEJAw2qLzqtDJzGNr3Ae8yY6DdEaabOtmT0aMKHTuX8KeFcoZJNVz4ncZjKFNeoVp0RCGN4l4wOuzVBqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702462; c=relaxed/simple;
	bh=jI/OcbOYVD0sHS6G3h2jYDflQSErX9zgXGnhGKq7Zn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSPbcWJ4xTKL3VQRFdCIPtk+oKWMQsyLrZO+zx2F2Juhz2yVwlpBikGYR2DebaePpR0p/grICglXBwR53+TXA7HCMUiHBppF517dbmf3YJvYYhp7jnXHz051xqLDf2QrZclzp8a0DxMHBbMYumUOGg1uCmMbS9wKcMRyalYi9Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPQxYw9+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPQxYw9+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so4913315e9.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702460; x=1784307260; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRW82qDeqWbcTEIWdeHg6T9X6r+SnQDhkFtAVKzYK4Y=;
        b=YPQxYw9+HYtKfS1W6j1mv3yaOS4omBlGYLiulCgdkaDzVLlUGT2YEmFviAsmJ4V12C
         4ReIGusrFvx9ZgFPT2WUEHfyUyLVX+xEchwAlfGDD9a0qS6z20OR09Yy2157o77XpN1B
         iCHrAr2OtAcvBmkyFl4ECKK6uFLxleOmb1KcECtVmBJLthcoFkIIhSwvBec580ug54fs
         D4tJsnIPblTz56ubDlyzCm6QL/fny6tK83V5LLEZo7QztH12pihBTGNpnvheCQZKBQ0K
         KOUPW+T5gMQzVKCtNELTEvEXyXgcEv5i9Cfh4ppIqvPFoh2UIaM9WKCdktOaQYC22vZt
         RZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702460; x=1784307260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRW82qDeqWbcTEIWdeHg6T9X6r+SnQDhkFtAVKzYK4Y=;
        b=BpHYSNIp+TqGBHtXUd7m3+EdWszl4UlDlC82rjpcIRrEpJl3uynRpoY1Oxy8xcqTkg
         wWLeqoS0EBphn5Er5uhmqn0kzSDWer7MjkFUHsnSCspsp+w4mhpAXxs4fY3a4Dx2AdNQ
         E2dXrVO7hMd8Up2wGtTvwmrbtBKVt2GhhEvrKiSD134hdjpTaYKLJkYaqyKVlVWYWVE0
         EkW9vr0puRcQIes71pEVxi4DWvLeej94uSGY4yOWxMD5uLMDscwWtWB+GU2UXxIDcCS3
         IUcVwkdMGJG8IF91Ooq5dL1oG4PpDWvreshU4RM9hJUNNjOGdyWVWhpWf710HX/2JMW+
         E7zw==
X-Forwarded-Encrypted: i=1; AHgh+Rqwo0xWI6hppZglf6y9oBR7L3LqAWkTJpJnPB9DXQyHFj8kdVwD6f7AHWbWJ+ScsXehGEorf3K0+4QhuxqE@lists.linux.dev
X-Gm-Message-State: AOJu0YxARl1PfePL/hHG83Nc08KQr0eFRVlC2f2FHmLyySkSmv81TbHt
	9tzP8Tzvs99FhnLBB2AciNwcVXwgD+GsFSRQ5Kd5cpMJzBCctn7xqwH9OK8KZnbx2PE=
X-Gm-Gg: AfdE7clFWE075+Rpx6mBlVD28CGq49VpJPK/tfafdKryUGH3sT/xz1MmUSKqjV4NgO0
	UhKRgXgFBRDWRdC9dWxMHjaGNA2tXCZTxPvhQacLoQEuzy09/tbWP9PkErEDY9MteVctLxvocbw
	+fC/+ljxB8+sSF4wMcMY/CvfYZYWJO94Tw8zL48hw/HAropR3S1HnYahdjNN6CUkUFn4lIF4ly+
	wnQ4uw8G0vR/UVXnwXT7V6okdxQjLU9IZYJkk3jXNepVXGQlKjPzWh8eA7HQp9x8kvncvYIvj5u
	rGqZ8BlJv+BUavtxTj7JupzvvXZmWANTBNGXyX1fkI0JIPfphBRGyze2tqwAmNnJmnukE/tyd14
	JBOWSp9Q83JYWnSzy8eU/GcW2XcFE+v/OBHtgdtmw2W0fGODq8b9Q/sZS2pSA04Z9tH+XmzqYf+
	zeEaF53bwD
X-Received: by 2002:a05:600c:1d16:b0:493:f73d:cc6d with SMTP id 5b1f17b1804b1-493f73dccd1mr17291625e9.24.1783702459655;
        Fri, 10 Jul 2026 09:54:19 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e6607fsm54696025e9.1.2026.07.10.09.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:54:18 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:54:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Taha Narimani <tahanarimani3443@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: adc: ad7816: Use
 devm_gpiod_get_optional() for busy GPIO
Message-ID: <alEjtybak6T5sH7I@stanley.mountain>
References: <20260710160001.29856-1-tahanarimani3443@gmail.com>
 <20260710160001.29856-2-tahanarimani3443@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710160001.29856-2-tahanarimani3443@gmail.com>

On Fri, Jul 10, 2026 at 04:00:01PM +0000, Taha Narimani wrote:
>  /*
>   * struct ad7816_chip_info - chip specific information
> @@ -48,7 +48,7 @@ struct ad7816_chip_info {
>  	struct gpio_desc *convert_pin;
>  	struct gpio_desc *busy_pin;
>  	u8  oti_data[AD7816_CS_MAX + 1];
> -	u8  channel_id;	/* 0 always be temperature */
> +	u8  channel_id; /* 0 always be temperature */

What changed here??

>  	u8  mode;
>  };
>  
> @@ -84,10 +84,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
>  
> -if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
> -		while (gpiod_get_value(chip->busy_pin))
> -			cpu_relax();

This patch doesn't apply.  Not sure what went wrong but maybe it's
related to this?

> -	}
> +	while (gpiod_get_value(chip->busy_pin))
> +		cpu_relax();
>  
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);

regards,
dan carpenter

