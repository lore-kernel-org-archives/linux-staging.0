Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14972192F5
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304090; cv=none; b=alTzcJHazpkjSVFZUPb3EyjBKp2uypRcXpObIGQJ41BjLoIuy1NGi81wMNtJxAriE9jkxVVjuerHfcnqjBV5sVfc8qJZiQr11BUWYFTXPgn9Ohb9PGItFQ7VMg7pNiu9rL5ILF9Hna3/Lro0I5PVEfh8+1d5lK3u0Y34w9Z3E38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304090; c=relaxed/simple;
	bh=b+b5f49WuUM/GVoPNhs0qQ519kURG3dfG9PkIjCLyIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFnoiwPi42QdunhqFtFbQeQ/Jski4NoSLB7LzbPZAVZe5IfRuEFEz9LJYVppJd4bhFPHqftT/pQPfWdShJminlLdc49cpjBZa4ocFoRho2iBT5Se5RafXy5oEkU5EDg5SAgedyC85IKqsWCJVkZWR5suOCBzjhT3BuhAI8WXRWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fyokxpUY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fyokxpUY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c266c1389so3455012f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304087; x=1745908887; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pURcEhBEHdxpYhnWEBaI44DGcypxp9nMdkY7Iw/QyY=;
        b=fyokxpUY9Am09zUcwxtpCROj1olu3eTN0Fcz7ZEn3HE3D9EUiFE945BdC/h1UD0gqQ
         97zdqx4SxTVqmjihXVAKkz0ibxZ4+PXZOG4AKFYONtEkBAQL/tbV7nMR6428msvsmkjM
         XOXjBB/ewxQobx/795WCAztpcnl2ISfgVn6UJ2p1Fj080E50ZgrOJu/pjhBdTkuU1UG4
         015ZqbQYpNqP/KI9qIgc8L2taINovr0JUSZlWYDfyUlSMnStG0YMv8sFidzZDkCbce1I
         H+XUE2NZedFwjPl4y2UHAKIusxyj4sNcB/4za5FPM8+oxm9rY5USfrx60gBPhZd6HvKi
         nOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304087; x=1745908887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pURcEhBEHdxpYhnWEBaI44DGcypxp9nMdkY7Iw/QyY=;
        b=rovZlduqiJs+jPSAJFDf2NiViMnaATZTZgfmRj+2+idgNCXR8Oe0MXbG+Ql9HJNqSi
         zSB4Tq65KPThObVLPLSTfZXepBgAYxVvnXBQ/BeRJMR/CJXeStxIX+IyTBbcHbNnksg6
         n1NsDngo7dONlKsvC0MtBrNVpWsJe4WiLgvbvvm7HPdrCVu/XXXx8SUFoH/0FDtJnPl0
         2Unj8YowTrtpAju4DGJvz8lZnmWvvl2aH3lRk6DeKGWzZdRuOW84AX7IyScX8pkD5MLq
         U5n97WnpGDihsAMCA+8hweVxQZAiErL6+nwKQReQKBmlA7Kis+52Ys/63oUlQwqr4h/A
         /DYg==
X-Forwarded-Encrypted: i=1; AJvYcCVW+HinYTN0eZ2nnQYDvjHh+cTwTVY3BBuQBxxN1parbB1FzgVldP8x4S3FCMEjN4n1Xtw+QctxYuqzqbwB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2g/x5fAEz/YTGnPd8YQEVicK8ptVvEHleM2UKeSEgy/gZrIKp
	OJtrq6auln6/UduTW7LQHja92vqMthm8ZzwrGyzoG5JIPu4yOTwVWBNb+V54oa8=
X-Gm-Gg: ASbGnctYFLdLJ5DU/a0Ra5dtPcAJHl+Z6qW2lxXtzFHeF41svWKuF7DQ6cVt80uvTDW
	CroXARNH76RiXE09+PjjtsaujCOJOdVWipayr5NxLfIRQEZodyg1RTEP87EVHhto/vnaArHVahP
	rTuGwXwO6r45snQN8si3amqAfGcy9e0jl5cUh3uraOkFWyYEl+RfgyjdnpWh/EycgLGuooAUuwN
	VPZPKfjB9fHzpBK7WAO6Z2otStbxrKXmRufcmMHKnRBLLpZYMHfFg3ltAL+GY4xa7iObOJgyx4h
	W4aIBb1Ih1Zwf6I/tIhu2YuK7MQ/NSgXbgLTIE14JEeRSg==
X-Google-Smtp-Source: AGHT+IGY+z1SYzbAwHQ1bDwluBsR27wnP/M2SunDoCiRoLo03vSfRP0XeHzwdWtlYLn2l6uyLgUtbw==
X-Received: by 2002:a5d:584e:0:b0:39c:2264:43ea with SMTP id ffacd0b85a97d-39efba2a69bmr11843060f8f.3.1745304086981;
        Mon, 21 Apr 2025 23:41:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5bbc13sm159163195e9.17.2025.04.21.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:41:26 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:41:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	sonic.zhang@analog.com, vapier@gentoo.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 4/5] staging: iio: adc: ad7816: Use chip_info for device
 capabilities
Message-ID: <0145edf4-aef9-45c2-9a74-8c15abb1286c@stanley.mountain>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
 <20250419135638.810070-5-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419135638.810070-5-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 09:56:37AM -0400, Gabriel Shahrouzi wrote:
> Move device-specific capability information, like the presence of a
> BUSY pin, into the ad7816_chip_info structure.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 39310ade770d0..ab7520a8a3da9 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -44,21 +44,25 @@
>  struct ad7816_chip_info {
>  	const char *name;
>  	u8 max_channels;
> +	bool has_busy_pin;
>  };
>  
>  static const struct ad7816_chip_info ad7816_info_ad7816 = {
>  	.name = "ad7816",
>  	.max_channels = 0,
> +	.has_busy_pin = true,
>  };
>  
>  static const struct ad7816_chip_info ad7817_info_ad7817 = {
>  	.name = "ad7817",
>  	.max_channels = 3,
> +	.has_busy_pin = true,
>  };
>  
>  static const struct ad7816_chip_info ad7818_info_ad7818 = {
>  	.name = "ad7818",
>  	.max_channels = 1,
> +	.has_busy_pin = false,
>  };
>  
>  struct ad7816_state {
> @@ -98,7 +102,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
>  
> -	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
> +	if (chip->chip_info->has_busy_pin) {
>  		while (gpiod_get_value(chip->busy_pin))
>  			cpu_relax();
>  	}

Here we could just check if (chip->busy_pin)...  The place you really need
to change is ad7816_probe().

regards,
dan carpenter

