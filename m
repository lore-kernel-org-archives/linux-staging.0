Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C72367B3
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303793; cv=none; b=geG79YHtzJvPqnfxL76OHf2y9+fQ4i82pf+HAmZiGp2xqygEK2GQ5Qa5TAiWiHzyIS3z+reg8lli9lnbNc4aC1o3yQRG2RndTQnoJVgQjQ/8CxpneqxnBOET6p939NoSl14LJ4HQ1Ux1X6HGGuTi/GPEixcr7pfPVL1WabA2DpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303793; c=relaxed/simple;
	bh=GiP/jlLbMozxOxUvrEms2VWQOoLHWMI7XjFly4V6b/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSiJZj22AceCvFk50RvdBPLK47tMFfDX+UJhJ8rqj2BUPq9MfQiE17m0jk5SrNx22e3FI0jfhsxTM0pknHBktyGwXDsmsnQcxiciORKXzgwQIyOhj10XUrMOvIluJKC010ekQ6sP8ELAKQ8925fjp1jtm+Pl8d/Bqh61ljr4+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eb4QTehu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eb4QTehu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso56085915e9.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745303789; x=1745908589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuuIFzXKAKOtJ/juljvbLrxvScq2q/lihuCqoG9qgYs=;
        b=Eb4QTehuwEpzyGv8dojXeTZWJ7USpnqWxHIYFi4KP8sfFjGFItc0BnlcgbHOz7xbjw
         hesaS1vgOr/NjwJZE3DOGwoCjC+7mVf27pFrgmIyJYr0LrSG+wwSQ8aLKU4pVh8u7EBI
         RaKs+Q4v3eFvSQQlxDNrB4vbBM/nVQF7xAzaXAqhCUMjkc7zXp6w8nXqhdVG8d0YiA6x
         C34rPw2OaKRAk7hNGpGGIQ4VWF4/JrGr/QLBZdwi9lSJ0qXrvVlFx8kRLb+kqLupcsPB
         Wtq3FM7WY6o/hOhTfQhlhqh7XDtSjZoS6SqYmd1r1YHelp4uk4PqTH/fV/1m+g9Gc22W
         7Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745303789; x=1745908589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuuIFzXKAKOtJ/juljvbLrxvScq2q/lihuCqoG9qgYs=;
        b=H1gunCR3ykxiJM9zNmP2gvqC4hidQ6kqAAziArhLvzMYNzX9xR3Y1rZIyIZXod4Qm2
         0rP3tW/AaBDZdJcX5cdD/CJk20sqngbHNM5lgjzx1BEy7xrEdp2fcEnNUyt5F1HzUyDK
         AReuGQAUDeklp0hnHUqCFW+i7OZ849uJ2TyyITQdm1iWFWpA+i5w9x4f/FeAuLHWfHi3
         eI3CpNUyB3ptD2AT9LRPH08B+j07VtV6rlM1Du+oKCv3N6kZOrLACFP3Il35agdME4vu
         Bddc6/t6oHdxZF/dZSpmt8vnuZGEhuEy4Kzy7Hz3Ph4VLRWVxut4e3YFeRjp6KwDRaOu
         wBFw==
X-Forwarded-Encrypted: i=1; AJvYcCUoGbJoJpKcXngACq7noek9t9uBmHgSzPJezD/YN+1MCkU/UX6xGFdI0npueYNWIpfZCVAKoFlbYZEXcwHu@lists.linux.dev
X-Gm-Message-State: AOJu0YyAUwulIfDKt0xtJOcfyfWkl19s9x+CFP+2cYtIrbBv1Du3BUnk
	fFT8k7Tjt0ch1UKRFn8U83VYDTVEE2DhC+UUnwqHCFycuNW6xWl7of76Ge6uULo=
X-Gm-Gg: ASbGncvxWiHcuwpOCs4zuH3+lFIM7o/ESvUHbjyuyT/SGWGPYH9RSu/sTjhrXOMCoQ9
	UJW9seXFbTSXytyaU/SCVhACvtSY8hYOmtAG1fkLfz5yQXA48NUMCK0Lj9W3HgIn53AKNMiBl2q
	pZeJfQx93AoKSqpJO/rEck8j+vqRFAZPjxfhIqdz92mXAtdRj9nCbiOGlnib/bO/79NLo8iX06W
	F+cM3aejtR9Rw4r5/IeL8i47F1zJRZTF6jGNiQriee1V3SZc+SCko4LCfEMc+RiwYpLpcxLwX97
	IIpotDUWogupxrFKOC6/WST7q0RVdALMwxUdipzcv/LjMA==
X-Google-Smtp-Source: AGHT+IG58ERkjB/D7cQnQR9ULR7mf0eJW0CrGoysFAmK0fVh9EIq2V04mHgq1He3cbNy5XZ0uVNl7A==
X-Received: by 2002:a05:600c:1c12:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-4406ac20146mr111342455e9.32.1745303789459;
        Mon, 21 Apr 2025 23:36:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa433133sm13898825f8f.28.2025.04.21.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:36:29 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:36:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	sonic.zhang@analog.com, vapier@gentoo.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/5] staging: iio: adc: ad7816: Introduce chip_info and
 use pointer matching
Message-ID: <b17dc4de-9fd2-410e-8c5e-f27e550d3eca@stanley.mountain>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
 <20250419135638.810070-4-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419135638.810070-4-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 09:56:36AM -0400, Gabriel Shahrouzi wrote:
> @@ -84,7 +98,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
>  
> -	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
> +	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
>  		while (gpiod_get_value(chip->busy_pin))
>  			cpu_relax();
>  	}
> @@ -353,6 +367,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  {
>  	struct ad7816_state *chip;
>  	struct iio_dev *indio_dev;
> +	const struct ad7816_chip_info *info;
>  	int i, ret;
>  
>  	indio_dev = devm_iio_device_alloc(&spi_dev->dev, sizeof(*chip));
> @@ -362,11 +377,15 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  	/* this is only used for device removal purposes */
>  	dev_set_drvdata(&spi_dev->dev, indio_dev);
>  
> +	info = device_get_match_data(&spi_dev->dev);
> +	if (!info)
> +		return -ENODEV;
> +	chip->chip_info = info;
> +
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;
>  
> -	chip->id = spi_get_device_id(spi_dev)->driver_data;

Delete the struct ad7816_state ->id member since you are no longer setting
or using it.

Btw, this patch didn't apply for me on linux-next.

regards,
dan carpenter

