Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D26236A9C
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755612783; cv=none; b=IWdATRvhAvVPJTawLZ+TfBA+FRTahrfSxzqw9mzcvzhswFm9pUJxVZfTrw+l73OSbZnKXbpLlUc6whWArhGePM83kmY0o7dh2gPiQQVE2ytcl8y1G6ozQCw0qhmsftPxDMMX19Y9YspWJ0qNcn0FP/qKTXvDsnNYzohqTrElVS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755612783; c=relaxed/simple;
	bh=tcvLkDZhSYdC1JNpLYire5yRg2GM/bnYtQffZEEQXGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DqVVlYRlsCznv0gnJ0KEINGN5j4771uoJopZRn67fzZivhZoYpXAVTpIOvR8rIqs+xVIdl4jKrVQXyxayDiA56+8XIQrrW6jeYE//P8wW5lucpOW0Xpi/9RguFUJGExc4mwOj+ugDCqyUDJlH9RuKxxZbm/1pLBnTwGtf9J86TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QWG5TRik; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QWG5TRik"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-30ccebb0cc3so3715452fac.3
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755612781; x=1756217581; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sC03Vtb6Z+xfVGAeKON3EIuIsQUVP+6HYJOuJwwhIu4=;
        b=QWG5TRikrhCAGXqvQ4e560mps7T+a4pcOyg3aSGEGpJEqwDX/V9EXCH8kl4XqrEm6q
         th5LfHLv7LSPf/EazFxnYJIRqYo3PQSbjSPrrg2Uv9Dl5igYBonD4gEZWy/WI1q0bnrF
         Yt6tcNXNPW+m+ksWDgZnY580MMQpdkOn1OuZMo/h9teY6fB00dOxg295dKjXTNBdY+VA
         juQaKQ8RroEsKaDF1M0Teu4pcFyD5eOrEbLC4XFmavwpc4enPJSrNYmQpH9Lt2tS98D5
         x7hoDm0q+7pwhPCVZdvyGZi2BbsPJYYJYSWRIzTvNZqwNnfJik2l5Hlqk5hEJfBhskx2
         li5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755612781; x=1756217581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sC03Vtb6Z+xfVGAeKON3EIuIsQUVP+6HYJOuJwwhIu4=;
        b=L7ItBzjGr1JKvrqjd5cOJPEmoBuoyW0CbWh04kL+Xau6vVZrDE3mzw5x4RU2YeqK7+
         7IyQ9saO/HtPn076lA8aVCnEl6vG/rESvznX3zDyWLLjNTCASxnmF5Ui99XRpK5UuJA6
         R85AWLEVKBmNZgfW3Ey2PPa76q/bnglhCP+P2yPL+vS9l3ZmMX+a5uLIXOgD9OGLUUWI
         ZPVqnOWwYd4R5LE/4spx+Onm/RZUed7PpU+QrZoXrd/AVrSZ+Oa5DInCL89j+2pinSnJ
         Lyf53gEKVr3y+rXYrUKNPwZO4sp9wX5Cai6ZV7wJZbukp2RIvGYOy6YDDapTu289S+QN
         KQEg==
X-Forwarded-Encrypted: i=1; AJvYcCUzZGtjUhjFLsuYR924jpPZZGupQWloYQ3G73u/JxjAx/UFSX8hsrwc1vzgZxXA+Htb/idi6Y7Xg+mSAngU@lists.linux.dev
X-Gm-Message-State: AOJu0YzR7CprgKzeFazcetu7cwdljRLQxbXQYKqBokxrtzz3N8Xtj2hV
	MDBYo5a5f6AJhkBZtRJ0piC0c8TKTxGrxyERfFhl25kzgIWzm2oaNT6d1bAyAXhzax0=
X-Gm-Gg: ASbGncv4C8+nUaupy+PVQQSpdTy4G+V/HfgIUp1sG0X4PEJIAsTt4m1cnj2Su9c5ZUd
	0orgbBeRe6Flk2wvFMiNmdHLjcFTLrWzdUK14b+vE0SK+vGpx2IXcK/6RVNC9ej3Agex2CigYo9
	nM/eQIPBZGa1HRd9f/k7J7dT8F1nt1Bol/7w9yAEI06Pr0M0oaJBJ8Zwx2/3CsJwth40HEOF/iI
	an9GTKh8A4Js/9NEQfOAJ7k92ktwgnhN7GWEo0jfpDpr2nUdkhb2FDX02D/+N3TYvVrVGRR/YLg
	PWKI3Gg2H92OZz3SGzQmFpvDE0X+oxLwkC4yIZF9WwwO/j5LnmgOdE60LzfWNTMsbQnWz5Fs/Cg
	IDj3D+kMYDD7NvM0l6SM3KlupCgdEibT9ISxN8QGaJ5cmOIEzdLBjTBHbW+0Rrq0F8HLsPVIzBO
	M=
X-Google-Smtp-Source: AGHT+IE/mtp9q8E9onSsRDxS37DeKqaFV5tEDirGChhOYgu4v9D31FyRKTaNPgh6rP0QWQ29DpP8GA==
X-Received: by 2002:a05:6870:1f07:b0:2f3:e087:678d with SMTP id 586e51a60fabf-3110c0629c2mr1810405fac.11.1755612780668;
        Tue, 19 Aug 2025 07:13:00 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:990c:4d50:9c6c:f367? ([2600:8803:e7e4:1d00:990c:4d50:9c6c:f367])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7439203bd13sm2416648a34.24.2025.08.19.07.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 07:13:00 -0700 (PDT)
Message-ID: <6b915b3a-8e6d-485a-9050-474bce154fec@baylibre.com>
Date: Tue, 19 Aug 2025 09:12:59 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: iio: adc: ad7816: Use spi_set_drvdata() for
 clarity
To: Salah Triki <salah.triki@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <aKRigf3TtH-x-i1C@pc>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aKRigf3TtH-x-i1C@pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/19/25 6:39 AM, Salah Triki wrote:
> Replace the use of `dev_set_drvdata()` with the `spi_set_drvdata()`
> helper. This is functionally identical, but improves readability.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 4774df778de9..599f75103cb0 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -360,7 +360,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  		return -ENOMEM;
>  	chip = iio_priv(indio_dev);
>  	/* this is only used for device removal purposes */

This comment is no longer true. The driver does not have a .remove
callback. So we can just remove the comment and the dev_set_drvdata().

> -	dev_set_drvdata(&spi_dev->dev, indio_dev);
> +	spi_set_drvdata(spi_dev, indio_dev);
>  
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)

