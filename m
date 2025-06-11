Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78910A3E
	for <linux-staging@lists.linux.dev>; Wed, 11 Jun 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651382; cv=none; b=q+eavRuGdGHUtJxBvPbcnchFUxnBvRrl8C5PS6WoiGKyShxeWuWAJpdTOw7wQubY61RSmn71unwi2XU2tXJq04K5GNz1Yp5kZJPNd/0vBBm7c31me1UZv+G3gSm5VJkc0CHS2tiy8UIsrcKkPp1ERZxwMvLnoxH/irijcoE53E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651382; c=relaxed/simple;
	bh=EXJnlVTnNud7vFOMtkEXkO8+20lQ+8pjSYNNNw59vac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGJKMYRog3NEsRCD3LWXhmnXUwy79VASK4JCxpDCLITTSVa6CHOGMluZ/p3g+u0zoISNFkTtknWlgXr1zywsIfwbhAMKN5z1NdMUkkW2AEizXf+1UZI6sk32p5h3BoMe5o/9bquAlyyF1x5SdrOHLebY9GKiL2leiUIledpydWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hBi7v09G; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hBi7v09G"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso66359596d6.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Jun 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749651379; x=1750256179; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1AY2fjU0MUFNTnTPpkTJ6hjB0BWW24lbL76NZAT2+E=;
        b=hBi7v09GvtGF0zmEsYbBKjLKHJumztZIr2C1DgCxkYk0SNKVE58o1u9B3CRNqp8jI+
         mRpuoQTlyAitWRWDHtMkC4dyRmA1V9/6jmDDyl2E3EkYiFViaALqUpCByH5TWBcvTn1r
         RSW1IzDZ9Kdy24cjqGZJiuUJMwhF8hzCbm2Noo1+0BBW2YuCJObm7TyZC0TDf+B6PKRx
         PjdZFWX/JsC6ZY7TWZ7BXjWQ89zinmL2WcXB0Kncm+Hl1jeCL8uRdkL/B/OtMwnBMm70
         C/6qO01tUWQpPFQniMTBgM4KeuDhr4X6oKUTcyVHPEYWjx5rIKVHmMv3FsVWM0SPpexn
         xO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651379; x=1750256179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1AY2fjU0MUFNTnTPpkTJ6hjB0BWW24lbL76NZAT2+E=;
        b=mfFVOp4ogHIi3RsS5rVzvE33ABrlBrM49+2TUkSAT7Z5w2loFKvEzOd3nZe+jHVY/d
         ozcpfE8FceR8gPYOi7zW9GbYRHO36m8D8WEdp6EhMfnzFxGr/SmXa29isBQ5b8iWaPgh
         5pwWdYfQ0H8isX5iDwE5Rucdwpt7z9VnxTKzpGcaBCQ0ftOV6Ai6hRZDcf6qh418VvW9
         n2tgVcgK5yTEPgiZChzrXkPgIhtFqmcBVb9BnXf0An2h6d6d7hcSTSuvMmKXBfJ+BUZ7
         YQH4zmA/Y8q/n7C6w96ytKycR3yGr1TCv/0CJ7JqKdY8LscUkGoD86abDLcejt9/1sNH
         fFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAIyBMLmK1IMNq+kBD6xrO3knO17qhtBJNk/LLBVu38hwzrdvC7BfoOCnRLO+8KTBcJO7qeipeXAXgrtm/@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrs5CycIUM8MvbcTtyPHDUhDwNpsJGgmdYvlaIVxMINESGsN/b
	PNvH2v8UoBXWbQf7EvQ4k4LAjH/RufJp76QdXsTD5Vu7P5JQ14dvojFFWwqwngp+cmxL6uvLy0z
	+VVSH
X-Gm-Gg: ASbGnctHiwg07SSqfEl/Q9mSMtyKZMPICBgpiDHOzAR/CVk/Jr5RRYKFNThTerxGAUa
	kS5n0Oo/V7Y/pPyVRezYtxpSOTlWLzMkoYVBaGed4266Gvy7gDZvVkcctIbEoxIGi+a+rqeUcWO
	+rfXukoIgWWCyLUYKi7db3wac31D4/Ol0LVr65mIJp864fFmEz0KaMoHSBV5E2ZbL4Ri2r3GkeD
	f/Sa2xlzdSAIhv7yl33NCJqL2nrETd/1S4Ktvw53+3U6KUCOT2ZiDhMrwJLt9dvxTEbdkbheCvD
	fnSWElxSYVgA+xHwIYhNAG48PO2Mu1a444dovxkw4ZiMW7QLjAnvpmChCqFOkSbvv2DmAtKN3+u
	sPji8Rh4IlxQNo8aX+2hc3TfLtjoe0+PkWJAv
X-Google-Smtp-Source: AGHT+IHUfOaV6u8X5qxFKUlC7LB2yebCfftGMi8JimcjPKwM6QWalazzeWJt1jF5l4ISY9kVP+ktuQ==
X-Received: by 2002:a05:6808:3086:b0:403:3814:b2b1 with SMTP id 5614622812f47-40a5d081c0emr2562964b6e.10.1749651368697;
        Wed, 11 Jun 2025 07:16:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494? ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d95e797sm337318b6e.40.2025.06.11.07.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:16:08 -0700 (PDT)
Message-ID: <71b66cbb-ab2f-44e3-926f-9ae4bcb3aadc@baylibre.com>
Date: Wed, 11 Jun 2025 09:16:06 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] spi: expand bits_per_word_mask to 64 bits
To: Da Xue <da@libre.computer>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Mark Brown <broonie@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev
References: <20250611000516.1383268-1-da@libre.computer>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611000516.1383268-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 7:05 PM, Da Xue wrote:
> Most current controller IP support 64-bit words.
> Update the mask to u64 from u32.
> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/iio/adc/ad7949.c         | 2 +-
>  drivers/spi/spi-dln2.c           | 2 +-
>  drivers/spi/spi-ingenic.c        | 2 +-
>  drivers/spi/spi-sh-msiof.c       | 2 +-
>  drivers/spi/spi.c                | 4 ++--
>  drivers/staging/greybus/spilib.c | 2 +-
>  include/linux/spi/altera.h       | 2 +-
>  include/linux/spi/spi.h          | 6 +++---
>  8 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
> index edd0c3a35ab7..469789ffa4a3 100644
> --- a/drivers/iio/adc/ad7949.c
> +++ b/drivers/iio/adc/ad7949.c
> @@ -308,7 +308,7 @@ static void ad7949_disable_reg(void *reg)
>  
>  static int ad7949_spi_probe(struct spi_device *spi)
>  {
> -	u32 spi_ctrl_mask = spi->controller->bits_per_word_mask;
> +	u64 spi_ctrl_mask = spi->controller->bits_per_word_mask;

I think this driver is incorrectly accessing bits_per_word_mask
directly and should be using spi_is_bpw_supported() instead.

This driver checks for SPI_BPW_MASK(8) at one point but doesn't
take into account that if bits_per_word_mask == 0, then 8 is
implied. spi_is_bpw_supported(), on the other hand, takes this
into account.

>  	struct device *dev = &spi->dev;
>  	const struct ad7949_adc_spec *spec;
>  	struct ad7949_adc_chip *ad7949_adc;

...

> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 24e9c909fa02..087eed1879b1 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -27,7 +27,7 @@ struct gb_spilib {
>  	unsigned int		op_timeout;
>  	u16			mode;
>  	u16			flags;
> -	u32			bits_per_word_mask;
> +	u64			bits_per_word_mask;

This is assigned by:

	spi->bits_per_word_mask = le32_to_cpu(response.bits_per_word_mask);

in gb_spi_get_master_config(), so changing to u64 doesn't have any
effect and should likely be omitted to avoid confusion.

(The response struct is defined by a communication protocol and can't be
changed, otherwise it would break the communications.)

>  	u8			num_chipselect;
>  	u32			min_speed_hz;
>  	u32			max_speed_hz;
