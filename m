Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D2202C58
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316513; cv=none; b=Cd5jNbh0QrW4FgU5U0G2Xu/uuV0JGtb/ZQYRFRZo6LSpwEVBjSUd3ADMJ0tKbPMnkJiyB1yhAhNhKUtCA0y9MhCLONe6jqY13hUB2arAQ6LcSAU+vPVR2dzoawrAAHt0UmvTjXcrlf/anVF97rB5tllhisdhOYpJchAq/BT1AZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316513; c=relaxed/simple;
	bh=anLjr1tReamUydhT8BOyd5WAfBLORHEW1TH2GPX2hgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJ4jtXD4ScuUt32DT8Pax1TaV1tv0LStTNiLdulVluDjhccVEuVToRewFCF+5wOYsGU+6OI/+6BjQ3GAUhJUgbFDmk6RFI7OohSKkTV7Q72oiulyA0+Yk0mqpAJYcya8+mRF3q1ASn4AT7Y7f8g7ZF36PsqNsYSbwVdd4UiWZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNQjxHWc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNQjxHWc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso42497075e9.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316509; x=1745921309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6B0Yh7dOpmfhINAPeCPvt7WU205S796TEUCdlISV0U=;
        b=UNQjxHWcV39CiLTOHs4TRAVx3wzTil+HTkszCVUSFaL9VRqpPVujIkByj3fU4pkhZS
         wbPaGC8FlasDsJSsPFl809XFEgQFs6GxKmhLhOV2yTdwXNHUKvwnCGV90qMvZCDlH/Dm
         jx/0tr+zvumBwmEA7rZbJHFrMu1bbci729Li3eWTrZW9Z2/lL30xBeGUh3eVBxwv+RYJ
         ElebWW63o72XOU9Ipt9w49Ku8NprXHKbowwtfeNmxmTTWiRxD1nfNKJOxbC6XkwHX9kK
         z8K6C4SnxaO9P89RAiiCExR7hbRF30l+COAHiSEggQ9IYNybNNrI6XfZzozEZATG0eL9
         sNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316509; x=1745921309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6B0Yh7dOpmfhINAPeCPvt7WU205S796TEUCdlISV0U=;
        b=L/H+xJQW2X6/kB6wuBpbGYzECZ9RZxGSIDvLE3G9sfp8dcyK0EpQ8teIZ1AUoIyqhv
         5EcSE/cEdN+yHGHy46Jw5Ts+85cdoIoYIEiVHcSdfOXDAo9+PvYFKhj2MWd18zji9Grh
         zyTJVRefLhUV1a0ru6zL7XapNl0PzreemevYT/To6DN/C+0JeZdao5ntH4YhAizp0lb5
         vqUnJOSftAv9d9LEMZoDLaW3M4Ekg3qqCzN20qQVL+30DyyL8maC01RrI+WbSzVC/7KD
         DW5QnSVdNyP9SiUk/LB9hxW0wvZS+u46/v57OB9qpLjI6XoCdw37Dz1Q9BZmSu/Tm2xJ
         kL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhM1jMyPMacInbHH4oP1WX5WIgQm02WBhTzCGYY53QASw2uyRz3gCO11Zqfqo/yNN/SKtS1XpwOKEGqPWC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx87f4kl997a1ztUVMspQfEoaDi29J7AOIBgNrKhzK5jqJeEeAE
	z+z3IqQ3j8RZ9g2uJM4bqc83HJ+4II/z9Pir4EkAeHLLoq4/LyBfXH7ulY3llPs=
X-Gm-Gg: ASbGncuHHk1A3Duo4oH1ceWz/V6Z/7IxRrWaac8Adb3XU5neucgyyGPwYENc64h0WN+
	oKxK1HwIhE4GECKaOZrEq+Zh/ZpXAF+m9+FXfgHQhYo581LMMO1G0Z+xUX5HQMZeaJjN5D3TycT
	aG4ikUFA976xWgw2S7lddZXRmqYuYsrPWxas94QTfs20vkCnVQp7QHoHRpvo7ftRelhpwgC1zRE
	7pgXj3UeVdgjdRNn2QyuczJdUQO+/btANDoZZA0pFYiHbGBtsHYwrn2IqaFJMbaIi3RBNLLEqJw
	NNMkK0CIfgVfWrjdl5/GeYV3GuNE7CHxdlV/adi2RxqmkqCzSG3VoUC/
X-Google-Smtp-Source: AGHT+IHzVpPPPr7Q08HSTDXKukGfeX85sPIQ5U7vWA+NG5QegCS1HXNyMGxJ3cf6h3kIB4C5AubgEw==
X-Received: by 2002:a05:600c:c0f:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-4406ab93badmr129900855e9.12.1745316509263;
        Tue, 22 Apr 2025 03:08:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5a9e50sm169732175e9.6.2025.04.22.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:08:28 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:08:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/3] staging: iio: ad9832: Add minor improvements to
 ad9832_write_powerdown
Message-ID: <e712ec88-d925-4a73-8df4-ca3387a903fd@stanley.mountain>
References: <20250420174725.887242-1-gshahrouzi@gmail.com>
 <20250420174725.887242-4-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420174725.887242-4-gshahrouzi@gmail.com>

On Sun, Apr 20, 2025 at 01:47:25PM -0400, Gabriel Shahrouzi wrote:
> Minimize size of type that needs to be used by replacing unsigned long
> with bool. Avoid redundancy by checking if cached power state is the
> same as the one requested.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index a8fc20379efed..2ab6026d56b5c 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -173,13 +173,19 @@ static ssize_t ad9832_write_powerdown(struct device *dev, struct device_attribut
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct ad9832_state *st = iio_priv(indio_dev);
>  	int ret;
> -	unsigned long val;
> +	bool val;
> +	bool cur;
>  
> -	ret = kstrtoul(buf, 10, &val);
> +	ret = kstrtobool(buf, &val);
>  	if (ret)
> -		goto error_ret;
> +		return ret;

Fold this whole thing into patch 2.  Don't write something and then fix
it in the next patch.

>  
>  	mutex_lock(&st->lock);
> +
> +	cur = !!(st->ctrl_src & AD9832_SLEEP);
> +	if (val == cur)
> +		goto unlock;
> +
>  	if (val)
>  		st->ctrl_src |= AD9832_SLEEP;
>  	else
> @@ -189,10 +195,10 @@ static ssize_t ad9832_write_powerdown(struct device *dev, struct device_attribut
>  	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
>  				st->ctrl_src);
>  	ret = spi_sync(st->spi, &st->msg);
> -	mutex_unlock(&st->lock);
>  
> -error_ret:
> -	return ret ? ret : len;
> +unlock:
> +	mutex_unlock(&st->lock);
> +	return len;

This should still be:

	return ret ? ret : len;

regards,
dan carpenter

