Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F2423278D
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741039617; cv=none; b=jI7QdwO/wahfu2Xq4pJviq8/RZ9XQzhu6nc2N+Ja4q5kknt/pRFAzzqqweiaE6B6NhZtMFK+575VihCuf5guv+WER2uBhBDhE2XT6qSegCqDGKY0kHHACVEDyC3gZNr4eeMfPOi71yzO+Re3TMnxxG4SUN55hTm6fRN//9Vqf5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741039617; c=relaxed/simple;
	bh=JqxhaPx/4PkOgVkCLHhMzASh2FO9a3L/0EsE1pIt20Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYVLgVm8QK4vgwoOuG5htMCUWzodexoNgOxtwiutaPGLyFuvuYLBta4mFsupfv9LcZEy2wy/+kmC2q5h5PznvMzPQHliKyd6H7YW5z4evJyyMJfY2a99IGtWR488A/1IWUkIyDAyqWstLijInE+Ue+RwObwFDte769/MQ32XcvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvV8fElf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvV8fElf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22349dc31bcso86680965ad.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 14:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741039616; x=1741644416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nyrPi5HAkeHZcWwEBF6xTNbTlSUohW8oencgE4qGFYo=;
        b=jvV8fElf9uoqLVjK+bQOp4lVH/g6W+NXI+vSWh2GCky/MH0Ngb0+4EglbzCxkHCg9A
         WOF8jDn/YEfS34l1o9xjTs0nQ9YDVM2QTy1UysT3ERWAH4h7JAkQIOadDSqlL7pqUJM6
         AP/1LCISpMnwHVkHt2PF1uvKRSwHlH9oQ6deyhVcDq3q40Z1kEkjLXD34icBRCMU/Q61
         Y1Y5cIkRo170+i/FdasSR92k/kaICJC5kHsQ842T6FHQf8iYOGP4smO9g0kriaebtdR3
         NQsgWnB3eJunz7XQGsDgyJUxOWzEGyS4igYqig57Bv4tASTfUf9Op0eK5A4Rq7AZcc7E
         LanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741039616; x=1741644416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyrPi5HAkeHZcWwEBF6xTNbTlSUohW8oencgE4qGFYo=;
        b=phTgme8q5y/7Sc400vNILZtvK7bOYQJPJmPcGylfBE4clCOnEpgkxHi3VKXYJY0U5Q
         /FxZ1jKMg31JKbL+s0+I3fxHLxPv3MdF5Ie3QiD7r05YYYLPfoajYXs9D1mun2nhZnya
         NWCZgb9wG92yH06nmdlwIzmJQhgnUE+4HLIodhBtKoDMQ8qPVKbA88ZCAs/D06vV7wmO
         7JWdBP/EMZoOhHiAzu5AfAPvoQ7Yr5ltmu5lJo+LQFL+S6PAFLIkObFn5WDbZ+80DfpI
         qk5WUKtsjv/i1Frc9Gk7YFSgBC1ZShTEZuXfAvEba+QJ+QHFl+Fe3VJxR29fu9qV/I3l
         Cm5A==
X-Forwarded-Encrypted: i=1; AJvYcCXxAfJBtJlNC+k1bIa65fgSbdZJE7gAqi1g4LHSp5lAVojhrb7SR/BnQSsg2/uzMfbe2ZGoY1iwvGgtDu/V@lists.linux.dev
X-Gm-Message-State: AOJu0YyM1/Ts9xK2/pSLxqMlzbb/AlRHMNVYZG/9HZR+M4lV9LkIHtJO
	WnyP2g8EL05TXFfhZYemHeJ6x1R2KP+qooACqJa/0bCMhrJwR3sG
X-Gm-Gg: ASbGncsZYrLsBYow7l9bRy62FwVKR4nr8svUq4bPdCfk7U0vVGriGNIRJx7MB7sKw2T
	pFUcfmaeh3ArbpQ4TkRdWBqaxK2Mtj9A1sghDRjvbR3L2RdkO7L6o+QxMZ/wreMGVZSRuCYm6CG
	9Zm/qPwzXdieU7Lsey44pRIYemrJ4XIN1AxMFz96VJOc0D56E+2cN80+T/oqT8VBd4ym0Ikv+Sa
	K916Oh6aMW0piGv1xLlI2iJaueRAih5ZOD+W31OjdwEdwg/welwhUez9mgTULTAq4QR+2QyeZOx
	3C2QHMGLziZ9Lyet6MAANrBfHM+yq0hl1GfTR//XUhVp8crKHjtvJ10=
X-Google-Smtp-Source: AGHT+IF210btO6rb30eQ+sEDHAyP6Jb2nAg1Js5HWY+VJpxXxEm3Ip9l6khqtgq0M00D4C6JjlL1cA==
X-Received: by 2002:a62:f20c:0:b0:736:3184:7fe8 with SMTP id d2e1a72fcca58-73631848087mr13036440b3a.2.1741039615593;
        Mon, 03 Mar 2025 14:06:55 -0800 (PST)
Received: from localhost ([2804:30c:1f21:4300:1cf6:c485:6555:b1c5])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aee7ddf230dsm8757673a12.8.2025.03.03.14.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:06:54 -0800 (PST)
Date: Mon, 3 Mar 2025 19:07:47 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Saalim Quadri <danascape@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [RFC] staging: iio: ad9832: Use
 devm_regulator_get_enable_read_voltage()
Message-ID: <Z8YoM4ycB0qMQwOG@debian-BULLSEYE-live-builder-AMD64>
References: <20250303200347.23354-1-danascape@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303200347.23354-1-danascape@gmail.com>

Hello Saalim,

On 03/04, Saalim Quadri wrote:
> Use devm_regulator_get_enable_read_voltage() to reduce boiler plate
> code.
> 
> * Here I am particularly confused about regulator_enable(), part where I should
>   use devm_regulator_get_enable() to enable avdd supply?

I misread the driver yesterday and thought avdd and dvdd regulator voltages were
being read, but that is not true. devm_regulator_get_enable() is enough for the
cases where the voltage is not read.

> * I can resend this as a patch if everything is alright, specifically with
>   devm_regulator_get_enable() for dvdd
> 
If I'm not missing anything else, you'll probably be using
devm_regulator_get_enable() for both avdd and dvdd. And probably ok to update
both in a single patch.

Regards,
Marcelo

> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 37 +++-----------------------
>  1 file changed, 4 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 140ee4f9c137..9e7975265454 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -74,8 +74,6 @@
>  /**
>   * struct ad9832_state - driver instance specific data
>   * @spi:		spi_device
> - * @avdd:		supply regulator for the analog section
> - * @dvdd:		supply regulator for the digital section
>   * @mclk:		external master clock
>   * @ctrl_fp:		cached frequency/phase control word
>   * @ctrl_ss:		cached sync/selsrc control word
> @@ -94,8 +92,6 @@
>  
>  struct ad9832_state {
>  	struct spi_device		*spi;
> -	struct regulator		*avdd;
> -	struct regulator		*dvdd;
>  	struct clk			*mclk;
>  	unsigned short			ctrl_fp;
>  	unsigned short			ctrl_ss;
> @@ -297,11 +293,6 @@ static const struct iio_info ad9832_info = {
>  	.attrs = &ad9832_attribute_group,
>  };
>  
> -static void ad9832_reg_disable(void *reg)
> -{
> -	regulator_disable(reg);
> -}
> -
>  static int ad9832_probe(struct spi_device *spi)
>  {
>  	struct ad9832_platform_data *pdata = dev_get_platdata(&spi->dev);
> @@ -320,33 +311,13 @@ static int ad9832_probe(struct spi_device *spi)
>  
>  	st = iio_priv(indio_dev);
>  
> -	st->avdd = devm_regulator_get(&spi->dev, "avdd");
> -	if (IS_ERR(st->avdd))
> -		return PTR_ERR(st->avdd);
> -
> -	ret = regulator_enable(st->avdd);
> -	if (ret) {
> -		dev_err(&spi->dev, "Failed to enable specified AVDD supply\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(&spi->dev, ad9832_reg_disable, st->avdd);
> +	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "avdd");
>  	if (ret)
> -		return ret;
> -
> -	st->dvdd = devm_regulator_get(&spi->dev, "dvdd");
> -	if (IS_ERR(st->dvdd))
> -		return PTR_ERR(st->dvdd);
> +			return dev_err_probe(&spi->dev, ret, "failed to get AVDD voltage\n");
>  
> -	ret = regulator_enable(st->dvdd);
> -	if (ret) {
> -		dev_err(&spi->dev, "Failed to enable specified DVDD supply\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(&spi->dev, ad9832_reg_disable, st->dvdd);
> +	ret = devm_regulator_get_enable(&spi->dev, "dvdd");
>  	if (ret)
> -		return ret;
> +			return dev_err_probe(&spi->dev, ret, "Failed to enable specified DVDD supply\n");
>  
>  	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
>  	if (IS_ERR(st->mclk))
> -- 
> 2.34.1
> 
> 
