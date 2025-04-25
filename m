Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BEE1B960
	for <linux-staging@lists.linux.dev>; Fri, 25 Apr 2025 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587091; cv=none; b=MKr/bK9Sg2wGFC4IW8JeMHMmsTXh+bBcygvqRSW8T70Ar+sD2qVcBLmqSO8Dv1ap/sxUNc6+c50E1JcoE+MEyg+gj3wo690y8Rys7mpILT4rpidjifQ9hxbK14v2S0lJDyoogoQaOR3PdAjcekgH/jlSn0TmLDLIWUt8YEj2zBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587091; c=relaxed/simple;
	bh=9juRr8sLTz6yET5bKxGWoa/rfH2ALpXj1tjC+No5OIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX1y56aTraJ4+YtWMUDKBrZliplRykpxXaaBlot1IdRUkKsjFuJah2M10XbQLCileo7Rpv3iJv7G4Yd61mP91qg0AFybRJBsYxSylRdxnRqeQKkTqw+26EBSJJe6M1c6S1fDRaqWstIDGkDsELS+sSVOqZB1qWnYqB+bTeFg7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbUOTWxu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbUOTWxu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso15040395e9.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Apr 2025 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745587088; x=1746191888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiZQEQXbMAh4QSTUazeZTDFr/XgIvOyC1vsWeFbPWQo=;
        b=YbUOTWxuTLP8eYFHDs8OtTGF6JrAmObhA3pBaajYsK7vzHS5+QS67N1BOwVeqD6yn0
         6PTTVNCg1vPQOA3V3TKbHrS98sO1Dh+to/p0nzqwoIr1QLB/Od0NujZySc8qAwK9hPbX
         w/vnH09rzoHqJeihAc5UKCw4yjrmPunYNi+tUKKIC/qi/tkL7zE8UzXB5zWildI+F6Sr
         iUsok41/WNDLuhntcE5CIAqKMyXgbkF99Rak1iSUMZ+j6N2yjSjtUkYhiCX5iHoWGRc2
         FH9rGHzeBQl8zstsJJF/wCRcwP7Z2J5yI+zw0PBwPfftYfnGvJ7ETf5Cb3pfWyS2D3fV
         wDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587088; x=1746191888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiZQEQXbMAh4QSTUazeZTDFr/XgIvOyC1vsWeFbPWQo=;
        b=dEnW5Nq4XyjgZoEppko8W/uF3YgEpnLIj9bz+PqetzhAUW/a/6tHN7SCvFr9rYuhX8
         7oVmGZ2oF/U1fHC3JS0An1PK/lqrG/SrwPKUoZE0dyybvm+ZrOxdJl1W9Dh9AWf8Hokg
         k2YW9+N0MPAXNoA3scrAwIb8jTfFywp4qtypVAUxfXtY2SaatP2CTAY7R5xHBJBfPLKv
         irb/usRL4G1JAkkYZhfVL7q+DnTaLpgFuxsWNWJlkZ+rE5dnEGp3ASaBfwDbVSN3k1S5
         9/hbdyy97r7UM14RC0YG3cyMC9FhqjxAkx7UVJT0fT/Z1JFowCwurqaoCMcQhYVZ1UrK
         9Uhg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Kfp5ArANt8NybuwNlOWoXyrX5BLcg3cPBStekr22FLbv2e8dIoin74tzAtMGX0PtrMBlc4aKfmnHkeLA@lists.linux.dev
X-Gm-Message-State: AOJu0YyK3MFXCKB4RDEsxhrFh0T7I2FtuxPaKkk6SrvNB9gwX6+UjJR3
	RbQ8vIC64yb/XM/e6NHjLbXk4SoktL4wrKAhU2R3wmFr3wbRUFSmG3N+LB415S0=
X-Gm-Gg: ASbGncucYTXRgpHWZQ1Oe8VILp4CnQ2sXmP3sq0H+W76iLVruhb6B9sPE2gU4V8fmkM
	oTw9wPafEeS2Y3GMoJWcUNt+V/Ra4a0GePV2IGaTTFbiQnxj7KAe+ki4OayS1KtS11OjFc33G42
	WNi4lCr9zb5y2ezy/2phzzUQYGPSL3MGrWI/cGhCIVumxlCj8gvHJd9OSqQYRzIFK8oqt+RuQ0W
	qIJjv+sWTbAI05wbB3WT5lWpPsX45RWxHRWtvSbZ18iFkdYMcqMGoX5Vu+/uZzCS9tZMe7JeNPm
	r1KZy5GxbDFXcdDtvX+t8Va+TwvPsKbgvFjivMcNKV+dkw==
X-Google-Smtp-Source: AGHT+IHbDjS1PQI7NTlpMT+Bu2EFu2dfDgHH1BOBPjpV0q2B/rN6BZiZF+DNqb4h89r5ixKpK9+CrA==
X-Received: by 2002:a05:600c:3b83:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-440a65def49mr25292515e9.10.1745587087859;
        Fri, 25 Apr 2025 06:18:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cbe386sm2330109f8f.42.2025.04.25.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:18:07 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:18:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: andy@kernel.org, dlechner@baylibre.com, gregkh@linuxfoundation.org,
	jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4 2/2] staging: iio: frequency: ad9832: Refactor
 powerdown control
Message-ID: <0771a9a7-ec49-487e-afaa-46a39f0b8ba2@stanley.mountain>
References: <20250424223210.91317-1-gshahrouzi@gmail.com>
 <20250424223210.91317-3-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424223210.91317-3-gshahrouzi@gmail.com>

On Thu, Apr 24, 2025 at 06:32:09PM -0400, Gabriel Shahrouzi wrote:
> Replace custom implementation with out_altvoltage_powerdown ABI. The
> attribute's logic is inverted (1 now enables powerdown) to match the
> standard.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> V3 -> v4:
> 	- Use guard(mutex) for simplified locking.
> 	- Use an extended attribute.
> v2 -> v3:
> v1 -> v2:
> 	Refactor powerdown functionality.
> ---
>  drivers/staging/iio/frequency/ad9832.c | 69 +++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 2e555084ff98a..b8b52302abf36 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -174,6 +174,32 @@ static int ad9832_write_phase(struct ad9832_state *st,
>  	return spi_sync(st->spi, &st->phase_msg);
>  }
>  
> +static ssize_t ad9832_write_powerdown(struct iio_dev *indio_dev, uintptr_t private,
> +				      const struct iio_chan_spec *chan,
> +				      const char *buf, size_t len)
> +{
> +	struct ad9832_state *st = iio_priv(indio_dev);
> +	int ret;
> +	bool val;

Declare val before ret.  Use reverse Christmas tree order.

	long long long_name;
	medium name;
	short name;

> +
> +	ret = kstrtobool(buf, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +	if (val)
> +		st->ctrl_src |= AD9832_SLEEP;
> +	else
> +		st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
> +				 AD9832_CLR);
> +
> +	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
> +					  st->ctrl_src);
> +	ret = spi_sync(st->spi, &st->msg);
> +
> +	return ret ? ret : len;
> +}
> +
>  static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  			    const char *buf, size_t len)
>  {
> @@ -185,9 +211,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  
>  	ret = kstrtoul(buf, 10, &val);
>  	if (ret)
> -		goto error_ret;
> +		return ret;

This is unrelated.  Do this in a separate patch.

>  
> -	mutex_lock(&st->lock);
> +	guard(mutex)(&st->lock);

same.

>  	switch ((u32)this_attr->address) {
>  	case AD9832_FREQ0HM:
>  	case AD9832_FREQ1HM:
> @@ -232,22 +258,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  						  st->ctrl_fp);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> -	case AD9832_OUTPUT_EN:
> -		if (val)
> -			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
> -		else
> -			st->ctrl_src |= FIELD_PREP(AD9832_SLEEP, 1);
> -
> -		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
> -						  st->ctrl_src);
> -		ret = spi_sync(st->spi, &st->msg);
> -		break;

This is related.  Keep this.

>  	default:
>  		ret = -ENODEV;
>  	}
> -	mutex_unlock(&st->lock);
> -
> -error_ret:
>  	return ret ? ret : len;

Unrelated.

>  }
>  
> @@ -270,8 +283,6 @@ static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
>  
>  static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
>  				ad9832_write, AD9832_PINCTRL_EN);
> -static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
> -				ad9832_write, AD9832_OUTPUT_EN);
>  
>  static struct attribute *ad9832_attributes[] = {
>  	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
> @@ -285,7 +296,6 @@ static struct attribute *ad9832_attributes[] = {
>  	&iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
>  	&iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
>  	&iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
>  	NULL,
>  };
>  
> @@ -293,6 +303,27 @@ static const struct attribute_group ad9832_attribute_group = {
>  	.attrs = ad9832_attributes,
>  };
>  
> +static const struct iio_chan_spec_ext_info ad9832_ext_info[] = {
> +	{
> +		.name = "powerdown",
> +		.shared = IIO_SEPARATE,
> +		.write = ad9832_write_powerdown,
> +	},
> +	{ },
           ^
No comma after a sentinal.

> +};
> +

regards,
dan carpenter

