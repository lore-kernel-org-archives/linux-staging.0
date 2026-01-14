Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E9481B1
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 01:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354368; cv=none; b=gxIRT7CSUAYU0KdmamtRK2bTkkihhRTGhvmjlmD5ATPJxt6siFumdL5eA4xuuay/DrodtWdtbk4qsr8N7nh0fKGPSdmtKVfC6NgKInjSKIVtxptnrb6T9YsBCkYqr+AIF7YcaToB6dJh/cyPmPvMNkKKSHhHl7W9HZUuzdn7w1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354368; c=relaxed/simple;
	bh=N243u3X5fWK7S8yKjYYX9anKFwVrzaMHzyFIHXTErGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPCfyX+tdg5yuAxspQZKiUfEmFsQzaBJNm+Ppp6hvpJ4CVz0zWC6VwZuiXgeQVtnaY5rEUsPw6afBVvXkFKF4zsSmhPNCpmNaoolgF5uBsoVa1yD+kYyWqXm8BP2LmT0tUy4ZoqXbQe67AJmsaZqCCrBRrTLhMaFiXnQJQ2IykQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCGR9uvb; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCGR9uvb"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55999cc2a87so2217667e0c.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 17:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768354366; x=1768959166; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zsefdc+MwhFoGG+CTzZehxsHmkCHIHGx4tMK4gMxl68=;
        b=TCGR9uvbrqSdnF2h2utHXP5eMiOC6N2oliCwlb+4G5XZ/KUcNOHYHc29ajWIuLfHwp
         lV9Mi1TZo+E3u7CD/BB3KHTJKnbsFSWLOSgNsl2UKbrqlUlTy9XGwjyDVsPfQmIiIC8Y
         mA+rxDOyd94A9H5pqxjdImmtGQxiWpcQtNi4GcYJTedJAk3sE4b3hIstQo0FVuhl2Vcu
         KNOAqqs1lex7iketyXCY5zfItdh3E3D84NV5MPZ9HlNzLho2fC8e8vkhdy+BydtBSml2
         TckZAdcR1xQ+f+XLDqU1nsii1BiyoNpHnaMSCsC5wB1WSy1bqWFWxe1j3fNkaE7IFPvY
         ZvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768354366; x=1768959166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zsefdc+MwhFoGG+CTzZehxsHmkCHIHGx4tMK4gMxl68=;
        b=E7IK0e+/K3Vzam8pe8SxMJZ5gsEm2uLSZ/5WGKVh4t/wfxXwLzoxq1mQjXvi8BkUhF
         VLAOL60UhRuKGSsoQN9TSgMtzGtcZtYWHLrHbc5LcLYdaAe1I0TmpszFKf/iUvCKKx5u
         uqHyjR5u7LR/gPIbLmCNGtJv5b2DmjVUPNM4Aa+7hcPFhN4r8m8eaToq1N2u9KxT75fJ
         B7OgUfLL/m4g41jx5U/p4UW+NkbS1JCqibzOqS4D8YYiIIfFf9Y5f4dz03CZFlsoIgCF
         kW3zRPvPKJotYjwWlydQsuPyO9/AxU/Z9dzstfPi5hdYYQ9uRp0mpVfFcBvsdicfqz1w
         IBvw==
X-Forwarded-Encrypted: i=1; AJvYcCXOas9Pjt0USo7FL+o5vzF/ukpsFIQiRmtWSQ83F8U6GYzFBu+qrdLu3b1RH+DWuuXDTDWyLiU1viGJw230@lists.linux.dev
X-Gm-Message-State: AOJu0YzE13Edu73QF4Q/ylXKwgmNOgrgbDZ4afaNOHcdAcmQMZU3dti1
	urnWjkXXuNWFnDk1JyMMfXNxV5q22zT7yjm8JYPluSi10/lLwoIp5AvF
X-Gm-Gg: AY/fxX6FO1+euqJ5Ot8DQ8B2KyzsfRSkzGtxBCGP8g+4sXQRkYyn8jD4KT8M7UOzi+K
	u76hMVedxB+piw93D1Ui6cnT9uXmqstISYmSP4W0aSXFftJf3t0xMyz3DOEZURgqcHtQ5/l9ppg
	K+48uwz9w+phvn2GbGo8OeO2tulk1VjfU4uBxr/a5kQ7aBIvtUcj0dJ1HrPougprn/oiF5Kyfr3
	kBR0rFzjMpMFh0icvTJQRfdGNaIc2oESn722CBwTtqD8EQi6R8Uayt3VLcEIzeyRWQZIbX+wDte
	eATxEv0fkhGSQQqVfCt817IsXPDdlHZX2jq4C+lSqlz67V7+tGIA5brS+KkJ3GTKPJNVKtyzLHy
	UGd3YtGf23ge7WinW4O9S5gtwGo+1MC8wdSXa4+oz3/YyiwshUj+MqIPTIhIC/qpyk6InNI+rQW
	cZ5lS5Kpd9iRj5uoZWnTw=
X-Received: by 2002:a05:6102:d90:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5f17f6310cfmr410757137.38.1768354365977;
        Tue, 13 Jan 2026 17:32:45 -0800 (PST)
Received: from localhost ([2804:30c:2766:a500:b70:8c42:f792:bef6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5efaf4b2963sm11548954137.13.2026.01.13.17.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:32:44 -0800 (PST)
Date: Tue, 13 Jan 2026 22:34:32 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/6] staging: iio: ad9832: convert to devm_mutex_init()
Message-ID: <aWbyqKxgs4dV1fkx@debian-BULLSEYE-live-builder-AMD64>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
 <20251230203459.28935-4-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230203459.28935-4-tomasborquez13@gmail.com>

On 12/30, Tomas Borquez wrote:
> Use devm_mutex_init() for automatic resource cleanup when the device
> is removed or probe fails.
> 
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 35d8d51d5c2b..4bb203a67046 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -310,7 +310,9 @@ static int ad9832_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, PTR_ERR(st->mclk), "failed to enable MCLK\n");
>  
>  	st->spi = spi;
> -	mutex_init(&st->lock);
> +	ret = devm_mutex_init(&spi->dev, &st->lock);
Can use just 'dev' instead of '&spi->dev' after the update from patch 1.

With that
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize mutex\n");
>  
>  	indio_dev->name = spi_get_device_id(spi)->name;
>  	indio_dev->info = &ad9832_info;
> -- 
> 2.43.0
> 
> 
