Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26986846D
	for <linux-staging@lists.linux.dev>; Mon,  7 Apr 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033781; cv=none; b=jbQ4mtuUI6H8QpWnIwLpO23cN4JF43Y7hx+ien0F5RUSg1YYytgZvPrIdOaNcLcpdnAYdFRRLrrorRjI5UnevT+35eE48F2XSM9Winzu2YRoXQGSh85SsM/kvVmWBIkcYsTfwPJ/4OnG8G+ZpzEAg0zxlqka+AjdsVdhTfFSw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033781; c=relaxed/simple;
	bh=WhV9u4IQQhmqgaWXSsNMfBXHEeR56D8mrLfD4YSL1jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huYqEz3jN1PFgSX5IK+qBg0laWIvSb92D29U+uwbSnsdu0KO0eUb5TI2Wn3/QGZ8vHj/+Yh+apQbbTGwg7ol/rI94vXYeuFPHRqJ3OYHu4Glavrv/0vRC1EFzBGLLBfuEkH22YlkcN6EozFBiCmrQ59eAqJsnfej4NS8ujs7UUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=v9VNhk0I; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="v9VNhk0I"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3ff0df81fdbso1231464b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744033776; x=1744638576; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=v9VNhk0IedK+IvPrcDCaNaWOmBl3yCuCiSYMKQ2hG8BU3aebTrtrMsMS7ZijzEHmr3
         Z1hJYZuNvqb+NJ5giFurAbCHJFOOADTHwXh5b2jbZXB+it236K1rsSSPePMriRFag0eD
         cQPSYfYPFkuIVnWkFSTlOyYXad89Vl8MvpDhK/LblZ6owJSfvpXGHjR7vbCx1lNcTMEk
         zePx3VAP7OGjdhno5Mus6T8VPiWbOzpggW5kZ8VtheO5tXRMq6jxHJtDBhdzp/hCL5kY
         vBWHffFi53Eq5EfvtBOtThs1Q7SpHZliQxQEZM0nOlieHNCIwdNgaEBxIXfG3iBk5Mw7
         bAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033776; x=1744638576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=FX1m7MHvXgH1cbfCS3lVrpj9XYnAvju2JYrOGI22Q8dFt3K455WxF8pkXzISsqgsG0
         4VUDz/D4WzPiBc1d3J10HjARSWeuktD4K3jDKOWeu+39HaxvvzvODN8oxjWtEMH0Oh0d
         +0pEoBkextCqMX1TZIuT9GV8vBB/jf5pD62tLxTspsokQkK3FsSOHCOExC4MrFpizWNE
         NCM/K4Nldb7wN7atQ2HW/fbEl//eoRXllg5g2p7FVGRGm/YPQ5RiCE3KDENjd626G7z3
         2tRg6ZAerVrg+1SUk5jE9iVfHN7lsK6C4gnlRRlmTYU5uTLhXroguuMBKoclTNGYrA53
         Zklg==
X-Forwarded-Encrypted: i=1; AJvYcCWpNeCZu5g2I+74rdMAr1m+sNJgGsl6Hkbfojk8FHir2PhG8zi/P//ypo5fahDRdZI6nJIP+09xRm/Vqsjx@lists.linux.dev
X-Gm-Message-State: AOJu0YwKZunFy4y2HqCq+ABCKX8lUxfPia41mKYf4n/USfKgRnBRVoHs
	X3qypglwkzbue8VNxNPy3UazqP7bOv8CMkxBfoncvwv8tqvwNNOMLTSKN++ooio=
X-Gm-Gg: ASbGnct1Qa5adlSgURaQDTuOFIp2wrqr6ddWEGg2q9QukB2jCzSgyDZq7M9aR5enLuk
	H2oOwpw1KDMtrjEReLXaoys+GQB6inDCAXQJ/Voo+VA0OWxcLiSjLbyq0U5+GwReFRf+K0ffE4a
	LM3Q8+qElXYkEqC1lmsMA2ynLqqJ0ePoon6PMCFAZAW0onvaWOtfPZie0RrV7IIq9qOO3lvaFmV
	LjCUPBk121wgN5vcWWtESZI0iKCoLPnrHhPNH98jZqpKpgZ+1Sl4q8/X2wVHdBV7fhQL07BpcNi
	zTVwI4c4v+wQgFTatZnN/61UWp8ofgaq/EBjHSU4IvqsI7lWXQCJLuWleirM6OkO1Ds4SROAW1g
	SkMDDlaQNLQ==
X-Google-Smtp-Source: AGHT+IG/WeJOsYTJug2WwIegYoFPtqQ1kYLmD+mN7tixYlfHeBiAMs6zs8YlU4OTlrzTKkroXpuE/Q==
X-Received: by 2002:a05:6808:229e:b0:3fb:57ca:1ea7 with SMTP id 5614622812f47-4004668c4a6mr7559744b6e.36.1744033776048;
        Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40040099665sm1725950b6e.43.2025.04.07.06.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:49:35 -0700 (PDT)
Message-ID: <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
Date: Mon, 7 Apr 2025 08:49:34 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 2:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here is the commit that enabled these:
   98ce1eb1fd87e gpiolib: introduce gpio_chip setters that return values

This looks good.  Thank you.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/gpio.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 16bcf7fc8158..f81c34160f72 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
>   	return 0;
>   }
>   
> -static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> -					u8 which, bool value_high)
> +static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> +				       u8 which, bool value_high)
>   {
>   	struct device *dev = &ggc->gbphy_dev->dev;
>   	struct gb_gpio_set_value_request request;
> @@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   	if (ggc->lines[which].direction == 1) {
>   		dev_warn(dev, "refusing to set value of input gpio %u\n",
>   			 which);
> -		return;
> +		return -EPERM;
>   	}
>   
>   	request.which = which;
> @@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   				&request, sizeof(request), NULL, 0);
>   	if (ret) {
>   		dev_err(dev, "failed to set value of gpio %u\n", which);
> -		return;
> +		return ret;
>   	}
>   
>   	ggc->lines[which].value = request.value;
> +
> +	return 0;
>   }
>   
>   static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
> @@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
>   	return ggc->lines[which].value;
>   }
>   
> -static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>   {
>   	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
>   
> -	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
> +	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>   }
>   
>   static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> @@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>   	gpio->direction_input = gb_gpio_direction_input;
>   	gpio->direction_output = gb_gpio_direction_output;
>   	gpio->get = gb_gpio_get;
> -	gpio->set = gb_gpio_set;
> +	gpio->set_rv = gb_gpio_set;
>   	gpio->set_config = gb_gpio_set_config;
>   	gpio->base = -1;		/* Allocate base dynamically */
>   	gpio->ngpio = ggc->line_max + 1;
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186
> 
> Best regards,

