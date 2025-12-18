Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B7274FE8
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766068637; cv=none; b=ElsLMtP4y9Kk4PEZ+eJQHXNqwdrQ+pLcV8qvfCxmOXzvCbmCp3hrPdxgsE4h9b6UqfLhpkKHjEXrnYUmLEIcTUrGgmnaH40SObXnsaYjlKaDRTnfrOpUImrfsLjIkQ0Dg9A6/zLgfq/VJdjZ7NXEO0UcYJujp1wrIpfLPdQR4mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766068637; c=relaxed/simple;
	bh=DxtyRnzdSJwt8HkqzKj/nu+FArvP4MZdiT5K2ZOumNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLEh3SXkwcnX+DW6+XrCm6LHmpaZX+dUDixvIyrEi/4nb9IH5LuNcZEms07foUA+4Csj7iXWmA1nqmgU2+DRsqbI2jtQw+KVAUsk/sOghGshAcvSg631TkbAeP/6NOkoRkP496saTrxO9hGPzfl4YXnnAHSP2A6bjBifu8zVnms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOHN5K1q; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOHN5K1q"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a137692691so8588595ad.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766068634; x=1766673434; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TR3PplabcnA7UkJBFlt/TnM938reXt23QxQT7MrdzIY=;
        b=VOHN5K1qkw32N2vDzDGzH5ZB/42vasv7uNeHByIGlSShnioB3nwbOZgf6TjsJHpukW
         RU1mOuYdyOaG5LpfvSVpGmnKBULOoEDaCFnxO1L1cHrKGvh5U+tmzVnu/JGj/BdlShJB
         v95/cJUkDxk4CLRm3S9Y6MpovmSlwFRhRjAs89v7cMu2fluuPep/oFffgW7+xZwweKKu
         VnVTd5qtPE2ob6x/LsFcWIcfBEsC9M4vnC4moFpSaCJGnkLz4IIdfMDO8HSHGS6db7g/
         w2thR1A4LQG0lQEDVjElT4LD+7Dul1E9XUlm9FYqeDCQcNH+xtLrVVyruVq12HYnhYhI
         S0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068635; x=1766673435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TR3PplabcnA7UkJBFlt/TnM938reXt23QxQT7MrdzIY=;
        b=D9j2Dm2ZuYsVlxJEo+JBj571frxs58h0GVrGs/pvRCblQBIPBJx50whdhg4Nm7hJmF
         e98OqTAwFpYHMzyRYncQ+e0NkBWtY3t11nEYvGecNuSkZQZVsVn9FVPY8S6Qv0ArDQB2
         3xYraAe3dAfbEwdC6GYA1GkpAazvF4JYv6Z0P315Mdc9QkHsRifJAOxQlb+Fhwyl76F4
         Tla1rRTDY/Zk23gH88IW7vSqeujGQ5HCpZwPLdvFdOvULVS44yoMsStWPjyRFKeW8r48
         IEuKx5EExARHJCTvRFH2ZoyeYkgNaAHhxlR3HKQ/+H8Xt+e+HB0oIl3i5+I5ZCjFAhVW
         ji5w==
X-Forwarded-Encrypted: i=1; AJvYcCWnENb8Zo/cvhM2hssGLlnyXYQYW0VJbcJcubiN9OkZIHytv5ojw/cKI7OMGpkVhi/CBPt5vt8OvHn0UVjT@lists.linux.dev
X-Gm-Message-State: AOJu0YySX36B/41G7musBDnYiYfus8VIu060YuDYXczh7ACxAr4JuKYX
	abQtc9pqigt5SSYaF3J50ZGtevUMFqUqOGA1cmJorV6+PEWKZDRFgRdP
X-Gm-Gg: AY/fxX4Kny6kGUqSr/Doj4hEYY9oZ7jsBMXGmnIvfuONuU+597mwgM4AZ6fJ0Mi2+Pp
	PM0odf6Yn1+3cowExKh7mEmysMV7ps7F5B1JBAPedBhzgnzjUMti9/9YS1OSeHSDoAtfLxjtgry
	uDpxnB1IvqgwzUdbHrqn/vxIjwdGC/pjVez5mxFvpCX6D6H+Lz//jIHMjqakhggZpoOLpkGIGcB
	MtkehcxaXyzhDMuw5hYr4RcTJ2BSez6naS8BobTPVuXnzTQAIj93luK4UYhGznn+uyGfVyVGK6y
	vgcIifAMdh0CJnz6hQrrCK4Xc8NfqH4M+B3zJDHbyttSsNI/voiJtBmOdiPJff7boWyn5r62wXy
	djJrtgbHXn0XSIehDNsO5AmmDFooWq0RrZ9XwIa3lzpSgxwRpnSg1OgnEG/2zUKj2qH8D0SsEsd
	OIF2M5EWurB6Vt1fwP+V4=
X-Google-Smtp-Source: AGHT+IHklmQ9OYtCFpJ6W2rLqAN4zF9YoH2D4KR8JaJzkloRbmKoMsSz7BP5QMv66aUqN8WuYp28+Q==
X-Received: by 2002:a05:701b:2605:b0:11b:f056:a1b3 with SMTP id a92af1059eb24-11f34be9b9cmr18708999c88.11.1766068634462;
        Thu, 18 Dec 2025 06:37:14 -0800 (PST)
Received: from localhost ([2804:30c:165b:7000:d59:b973:da75:f845])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f58ba0sm7980511c88.8.2025.12.18.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:37:13 -0800 (PST)
Date: Thu, 18 Dec 2025 11:38:54 -0300
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
Subject: Re: [PATCH 3/5] staging: iio: ad9832: cleanup dev_err_probe()
Message-ID: <aUQR_vBHQwg9CWFn@debian-BULLSEYE-live-builder-AMD64>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
 <20251215190806.11003-4-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215190806.11003-4-tomasborquez13@gmail.com>

On 12/15, Tomas Borquez wrote:
> Cleanup dev_err_probe() by keeping messages consistent and adding
> error message for clock acquisition failure.

This is also a clean-up patch while patch 2 is a driver update so I would
provide this patch (currently patch 3) before the patch updating to use guard().

> 
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index f9ef3aede4..8d04f1b44f 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -302,15 +302,15 @@ static int ad9832_probe(struct spi_device *spi)
>  
>  	ret = devm_regulator_get_enable(&spi->dev, "avdd");
>  	if (ret)
> -		return dev_err_probe(&spi->dev, ret, "failed to enable specified AVDD voltage\n");
> +		return dev_err_probe(&spi->dev, ret, "failed to enable AVDD supply\n");
I'd break the lines and write the message in the line below for this and other
dev_err_probe() that exceed 80 columns. E.g.

		return dev_err_probe(&spi->dev, ret,
				     "failed to enable AVDD supply\n");

Note this is just a personal preference of mine, not enforced code style, so
fine if you prefer keep it as it is.

>  
>  	ret = devm_regulator_get_enable(&spi->dev, "dvdd");
>  	if (ret)
> -		return dev_err_probe(&spi->dev, ret, "Failed to enable specified DVDD supply\n");
> +		return dev_err_probe(&spi->dev, ret, "failed to enable DVDD supply\n");
>  
>  	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
>  	if (IS_ERR(st->mclk))
> -		return PTR_ERR(st->mclk);
> +		return dev_err_probe(&spi->dev, PTR_ERR(st->mclk), "failed to enable MCLK\n");
>  
>  	st->spi = spi;
>  	mutex_init(&st->lock);
> -- 
> 2.43.0
> 
> 
