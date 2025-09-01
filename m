Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34102E03F2
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745283; cv=none; b=bM5La1r49iP3H8eZT6FVnQ8sc2otOlffGy/D/Orpu3Yz38+Iw+oh7X6CiVrfLkqcLM5aOQDPYhujrVU5udyfpoRVEo88WVBLRnoJbnaYKytUaiz12prG4fNHOG0cbHj80V0hxS7hVvos8YXyzFSAyvX2XkQf5iDhSQTzdmOg0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745283; c=relaxed/simple;
	bh=fkryIHu4I1xIx2CWEKCdM9po9RrcPxRizn7i/jnNbiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gw1YgndrJJVhGyRnYvaFwbONah94puY3wbantPWncFEhpgJXz1NOgAx9qofUkFnpDbgbbl46lQTVw+yuJRHMsaED3oahaMcoCTz/EOo6tXMo7jGL9cZCdrSQxr9gsdcVArZkMMwN2hDNBCirsEAdU8+RZbNJaWvv5vouZCv0gFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yndLNfBK; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yndLNfBK"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-30cceb749d7so2029094fac.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756745281; x=1757350081; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmhTGKLssoVeGJ2/TQJ8RgkIS6rn9bKv2i70wU++5KI=;
        b=yndLNfBKiYnBRn3BIl24CtXrRUZNB+HH6aKTN3tHK1PPlh8ySjW3i52leCbDMGn369
         gA2xapwVZ2WSL2Ns6Yn5+clitxfNO7RyCrGLyv6GZDYKGtr8GTAtBWRV47HyUVpXPYKM
         e8UmZ87M6FEkSbmggJPo/HT+bvZAGKQn7LfLyRfIOkToY983U9cj8DT/i30ntymw2cIn
         Jt1mwBVdahAYr08zGg+K1Qb0poMPEFzs2orLd9+fktYNOHxnKi6Radg1Zr0c2VX9A7/o
         UHHB0fWcyb896JrgEx0zEAq186axOCXX/0vbIvZYDcfsUsZFuyqR54lazHIvx4eOXVVo
         2/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756745281; x=1757350081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmhTGKLssoVeGJ2/TQJ8RgkIS6rn9bKv2i70wU++5KI=;
        b=XHdPR3vf4Ub4lqO6tqVFTlMGxW9s2actmIniDnseYPPfGUCP4aavY61eda8DEGrETY
         2unYxbXwPFkkxjZw6pt020T5/EstPbISEcz64Q4g8MUWP4HZB6bEifwN8M729YcZkeE4
         ORIEaIJykspiOrkfTtApDfPvm96pE0dlKaKN00rSzXAYAM4x36kbONOM8OwWk9VKBDB5
         HhNTpyxEgYSu+ft/KVgXTOZfogLTw1zRNIpVLAwwyy2hVbvOh4ARfK5/gnlnnF5BJNHL
         WaycINFJHEnmfov/7231Hs4fL8e9Di6F6gOny8dSJ8UPpKKbGRRzl4tfWxde1ApZtcT8
         ymHA==
X-Forwarded-Encrypted: i=1; AJvYcCWz302RKTJva2eZebk05CDRC4GwBAc2bVb+yNU+8pyfLAB7UBScbFS7o1Hgk82v2g2KqiawT6hTC1MJcDg9@lists.linux.dev
X-Gm-Message-State: AOJu0YymheBWQAjxXehrr4tHjePu5fMLtX9gec/wD8NHcYL4LCJ3OmsL
	GsXMgNPgkRlWFOFGSBOHYoTALxFfMAEbSUqaLG19T2FE1Gn7+p46sqL6/2lCVo/zMIA=
X-Gm-Gg: ASbGncs2y46EP61xuwy3PhGI9BQug45N3NBti82j0xjTULcOkivTxMRyiav8NboeYVK
	2zDH2TJWgh/ety30vpWsUOmGo0V2s/V2++/I+ylW3tsxCpNZt+k7pJfw9/qVvIpjOTsXzu02N1r
	2/4fEskv9KCPaGVp8330b4lfTUI+1PoQIXAZ+oZGg4Yf9u8jsRSK/ikWSr9d6FCR218YigmKsa0
	9l0NcfsRtxgqfQJcrq6evK1UFY6U8TmKxafhwERuDcMqoI8mfo3KuygL/vsZ/RebFP1WXVZgtxC
	xJoDdUbWHLK43F2l3Bj6F8CvxFv1XI8ZFbMwfNDUNXhvM9sTwrnnEyvX3VXo8wl9sklKQKO8DbM
	POmJ5Q6gnQHdY4g3xvk0lEEh6/eGnuUtMwHxA966nG4WQQeECiDDWqrt3yqvVmvEt3nht0Ijv7W
	JjppiSNpX/2gUK/PF8fA==
X-Google-Smtp-Source: AGHT+IFMcJUfkp0DBfp/hK2wpKwhpqBEsHP4VYRpkRr7ud68ywPh/oMdr28/f25+B6OHHS1ppf8vDg==
X-Received: by 2002:a05:6871:4b8a:b0:30b:85e1:d3ea with SMTP id 586e51a60fabf-31963183f91mr3959730fac.21.1756745279707;
        Mon, 01 Sep 2025 09:47:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3c0d:2a9:2478:d89e? ([2600:8803:e7e4:1d00:3c0d:2a9:2478:d89e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7457428c153sm1091594a34.8.2025.09.01.09.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 09:47:58 -0700 (PDT)
Message-ID: <b6c2ac13-2781-49ba-964f-ca821b32e2a2@baylibre.com>
Date: Mon, 1 Sep 2025 11:47:57 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: iio: adc: ad7816: add mutex to serialize
 SPI/GPIO operations
To: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org
References: <20250831153741.8820-1-moahmmad.hosseinii@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250831153741.8820-1-moahmmad.hosseinii@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/25 10:37 AM, Mohammad Amin Hosseini wrote:
> From: mohammad amin hosseini <moahmmad.hosseinii@gmail.com>
> 
> The ad7816 driver was accessing SPI and GPIO lines without
> synchronization, which could lead to race conditions when accessed
> concurrently from multiple contexts. This might result in corrupted
> readings or inconsistent GPIO states.
> 
> Introduce an io_lock mutex in the driver structure to serialize:
> - SPI transactions in ad7816_spi_read() and ad7816_spi_write()
> - GPIO pin toggling sequences
> - Updates to device state via sysfs store functions (mode, channel, oti)
> 
> The mutex ensures proper mutual exclusion and prevents race
> conditions under concurrent access.
> 
> Signed-off-by: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 4774df778de9..06567d048a6d 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -50,6 +50,7 @@ struct ad7816_chip_info {
>  	u8  oti_data[AD7816_CS_MAX + 1];
>  	u8  channel_id;	/* 0 always be temperature */
>  	u8  mode;
> +	struct mutex io_lock;	/* Protects SPI transactions and GPIO toggling */
>  };
>  
>  enum ad7816_type {
> @@ -67,13 +68,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  	int ret;
>  	__be16 buf;
>  
> +	mutex_lock(&chip->io_lock);

Could avoid the gotos by using:

	guard(mutex)(&chip->io_lock);

> +
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
> -	if (ret < 0) {
> -		dev_err(&spi_dev->dev, "SPI channel setting error\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto unlock;
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  
>  	if (chip->mode == AD7816_PD) { /* operating mode 2 */
> @@ -92,13 +93,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	ret = spi_read(spi_dev, &buf, sizeof(*data));
> -	if (ret < 0) {
> -		dev_err(&spi_dev->dev, "SPI data read error\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto unlock;
>  
>  	*data = be16_to_cpu(buf);
>  
> +unlock:
> +	mutex_unlock(&chip->io_lock);
>  	return ret;
>  }
>  
> @@ -107,12 +108,13 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
>  	struct spi_device *spi_dev = chip->spi_dev;
>  	int ret;
>  
> +	mutex_lock(&chip->io_lock);
> +
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	ret = spi_write(spi_dev, &data, sizeof(data));
> -	if (ret < 0)
> -		dev_err(&spi_dev->dev, "SPI oti data write error\n");
>  
> +	mutex_unlock(&chip->io_lock);
>  	return ret;
>  }
>  

...

> @@ -363,6 +371,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  	dev_set_drvdata(&spi_dev->dev, indio_dev);
>  
>  	chip->spi_dev = spi_dev;
> +	mutex_init(&chip->io_lock);

Prefer devm_mutex_init() instead.

>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;
>  

