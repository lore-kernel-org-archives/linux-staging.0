Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49650CA73
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706281700; cv=none; b=LjvqBbc658qIsrsok+VjqfyfxF6BAJZXDG/ePr8SwyP1rmBCNK7P5TjvkbNu8oTQzL89fncBKys2d7EEkpMeO2sx4r/EGo3ga2dDFn6OT1GsB+uCl9heXGe2ztIOzxrz/1b9/gG9Iq9HGxesduLXIB4Y8IidGOmPUO0mfYk6ghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706281700; c=relaxed/simple;
	bh=yRINOnpUqG3VfKZRXhYter19REgTaOEOZfrrvjAYmpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KiqPKd6VW3twGg1FLeCbkD8ohCALiD/GC13Gc2+mfGWNIZf0Lx4GQE9jKGi/29WfVM+Fe8Ym32xiMk4tOhNnWjqRXfQchUmOHzUkawV21PRG+JbOwe18KOM2dPLH55Aneynd+tgJGktoNLHT+TPzdI2OxUgC10eKRaa3ZUebJPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=IBfbt09v; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="IBfbt09v"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-36287843b64so468335ab.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 07:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706281697; x=1706886497; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvgfzAhcnslUYcH0Du63qqL2ZhIEBQhQPLvfnd+sg0w=;
        b=IBfbt09vxw95sj8bjb4gZs2gwLoSCvypecRU2/NrsJFcTl0flQTDmF+uSSebzNoHJT
         qXUmznaX+iSclGhcEvJvX0Cn0hfTt+Twmpbknza/GQIBr2ynb8RvbJC19c2+C7E8CJHq
         NFZ9Ox5FHQ0s/D46jcMtCLLMIW7W6IQsEL9Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706281697; x=1706886497;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvgfzAhcnslUYcH0Du63qqL2ZhIEBQhQPLvfnd+sg0w=;
        b=Y/vmKlazhzLGstM0WhHLxU40L5lP+c4/b4nNVH3vnuSaijC6ZncQYQPY3FXNylBa3k
         qaDr4YOz2ZWz3gPGFgcpSzwG5f6qj5B4YGEG/+N7/Cf9/wRxHW6pYRdDJsiafNE9bCWO
         F8O2sl243JQZu3nX+C0jsVp2PqeFKrCxbTZhUVRLgQ2Y7hqAxzXxwrdVFawPzMa9/HoU
         d6lnPMw8FdquWQTCK1X7bwNYlm0IJDeIqfxJlgeSnwr98S9DlPs5rpR4/lmp1LNcbGEh
         Uidqe2jPCarz5qcYkbaItCDzt3CnEMVcWTN1hUNToN4JuLbgW23LuFi7wGYXKHYoKagu
         oakw==
X-Gm-Message-State: AOJu0YwsZ1P5KFri0vw4n4j+iZK4rYF7C4504T+MdXRycCP1a9o2puH+
	eQziL3mlAydIGOrnylFvZkxTvkhgXovsr6aho7eauj9nKvWmVplfI1XmdTuRPVmCrJWqKYUs/rL
	Sqw==
X-Google-Smtp-Source: AGHT+IHqjnaE5uZNvG3CYpn0yPtuBxKHcEQPeWd9PU4XTsIEFxzzz7EbPvmzTf2BvKucpdLYXKKr0Q==
X-Received: by 2002:a05:6e02:1a8e:b0:362:7f33:4988 with SMTP id k14-20020a056e021a8e00b003627f334988mr2150742ilv.26.1706281697226;
        Fri, 26 Jan 2024 07:08:17 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id a10-20020a056638018a00b0046f323505f8sm317507jaq.170.2024.01.26.07.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 07:08:16 -0800 (PST)
Message-ID: <4980ba8e-081f-47c3-aa63-a972a266577a@ieee.org>
Date: Fri, 26 Jan 2024 09:08:15 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 106/111] staging: greybus: pwm: Make use of
 devm_pwmchip_alloc() function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 kernel@pengutronix.de
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <fb29256a7f2dcda5ae92119997ac717a6280911f.1706182805.git.u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <fb29256a7f2dcda5ae92119997ac717a6280911f.1706182805.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/25/24 6:10 AM, Uwe Kleine-König wrote:
> This prepares the greybus pwm driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I think you are changing more than you need to in this code.

> ---
>   drivers/staging/greybus/pwm.c | 75 ++++++++++-------------------------
>   1 file changed, 20 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 75e0518791d8..a90f41c374dc 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -16,26 +16,11 @@
>   
>   struct gb_pwm_chip {
>   	struct gb_connection	*connection;
> -	u8			pwm_max;	/* max pwm number */
> -	struct pwm_chip		chip;
>   };
>   
>   static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
>   {
> -	return container_of(chip, struct gb_pwm_chip, chip);

Now I understand why you were changing the type of the argument
passed to all those functions.  I still don't think you need
to do that though.

> -}
> -
> -static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)

This function logically isolates doing the operation from
the rest of the code.  I'd rather you not get rid of it.

> -{
> -	struct gb_pwm_count_response response;
> -	int ret;
> -
> -	ret = gb_operation_sync(pwmc->connection, GB_PWM_TYPE_PWM_COUNT,
> -				NULL, 0, &response, sizeof(response));
> -	if (ret)
> -		return ret;
> -	pwmc->pwm_max = response.count;
> -	return 0;
> +	return pwmchip_get_drvdata(chip);
>   }
>   
>   static int gb_pwm_activate_operation(struct pwm_chip *chip, u8 which)
> @@ -45,9 +30,6 @@ static int gb_pwm_activate_operation(struct pwm_chip *chip, u8 which)
>   	struct gbphy_device *gbphy_dev;
>   	int ret;
>   
> -	if (which > pwmc->pwm_max)
> -		return -EINVAL;
> -
>   	request.which = which;
>   
>   	gbphy_dev = to_gbphy_dev(pwmchip_parent(chip));
> @@ -71,9 +53,6 @@ static int gb_pwm_deactivate_operation(struct pwm_chip *chip,
>   	struct gbphy_device *gbphy_dev;
>   	int ret;
>   
> -	if (which > pwmc->pwm_max)
> -		return -EINVAL;
> -
>   	request.which = which;
>   
>   	gbphy_dev = to_gbphy_dev(pwmchip_parent(chip));
> @@ -97,9 +76,6 @@ static int gb_pwm_config_operation(struct pwm_chip *chip,
>   	struct gbphy_device *gbphy_dev;
>   	int ret;
>   
> -	if (which > pwmc->pwm_max)
> -		return -EINVAL;
> -
>   	request.which = which;
>   	request.duty = cpu_to_le32(duty);
>   	request.period = cpu_to_le32(period);
> @@ -125,9 +101,6 @@ static int gb_pwm_set_polarity_operation(struct pwm_chip *chip,
>   	struct gbphy_device *gbphy_dev;
>   	int ret;
>   
> -	if (which > pwmc->pwm_max)
> -		return -EINVAL;
> -
>   	request.which = which;
>   	request.polarity = polarity;
>   
> @@ -151,9 +124,6 @@ static int gb_pwm_enable_operation(struct pwm_chip *chip, u8 which)
>   	struct gbphy_device *gbphy_dev;
>   	int ret;
>   
> -	if (which > pwmc->pwm_max)
> -		return -EINVAL;
> -
>   	request.which = which;
>   
>   	gbphy_dev = to_gbphy_dev(pwmchip_parent(chip));
> @@ -176,9 +146,6 @@ static int gb_pwm_disable_operation(struct pwm_chip *chip, u8 which)
>   	struct gbphy_device *gbphy_dev;
>   	int ret;
>   
> -	if (which > pwmc->pwm_max)
> -		return -EINVAL;
> -
>   	request.which = which;
>   
>   	ret = gb_operation_sync(pwmc->connection, GB_PWM_TYPE_DISABLE,
> @@ -263,38 +230,37 @@ static int gb_pwm_probe(struct gbphy_device *gbphy_dev,
>   	struct gb_connection *connection;
>   	struct gb_pwm_chip *pwmc;
>   	struct pwm_chip *chip;
> +	struct gb_pwm_count_response response;
>   	int ret;
>   
> -	pwmc = kzalloc(sizeof(*pwmc), GFP_KERNEL);
> -	if (!pwmc)
> -		return -ENOMEM;
> -
>   	connection = gb_connection_create(gbphy_dev->bundle,
>   					  le16_to_cpu(gbphy_dev->cport_desc->id),
>   					  NULL);
> -	if (IS_ERR(connection)) {
> -		ret = PTR_ERR(connection);
> -		goto exit_pwmc_free;
> +	if (IS_ERR(connection))
> +		return PTR_ERR(connection);

This is actually a bug fix that should probably be done
separately, prior to this series.

> +
> +	ret = gb_operation_sync(pwmc->connection, GB_PWM_TYPE_PWM_COUNT,
> +				NULL, 0, &response, sizeof(response));
> +	if (ret)
> +		goto exit_connection_destroy;

You didn't mention in your header that you were getting rid
of gb_pwm_count_operation(), and as I said above, I don't
think you should.  Just keep the existing code as it was
and focus only on your conversion to attaching driver data
to the PWM chip structure.

> +
> +	chip = devm_pwmchip_alloc(&gbphy_dev->dev, response.count, sizeof(*pwmc));
> +	if (IS_ERR(chip)) {
> +		ret = PTR_ERR(chip);
> +		goto exit_connection_destroy;
>   	}
>   
> +	pwmc = pwm_chip_to_gb_pwm_chip(chip);
>   	pwmc->connection = connection;
> +
>   	gb_connection_set_data(connection, pwmc);
> -	gb_gbphy_set_data(gbphy_dev, pwmc);
> +	gb_gbphy_set_data(gbphy_dev, chip);

I'm pretty sure driver data should still be the Greybus
structure, otherwise you're really changing the way this
works (most likely in a way that's different from other
Greybus drivers.

>   
>   	ret = gb_connection_enable(connection);
>   	if (ret)
>   		goto exit_connection_destroy;
>   
> -	/* Query number of pwms present */
> -	ret = gb_pwm_count_operation(pwmc);
> -	if (ret)
> -		goto exit_connection_disable;
> -
> -	chip = &pwmc->chip;
> -
> -	chip->dev = &gbphy_dev->dev;
>   	chip->ops = &gb_pwm_ops;
> -	chip->npwm = pwmc->pwm_max + 1;
>   
>   	ret = pwmchip_add(chip);
>   	if (ret) {
> @@ -310,14 +276,13 @@ static int gb_pwm_probe(struct gbphy_device *gbphy_dev,
>   	gb_connection_disable(connection);
>   exit_connection_destroy:
>   	gb_connection_destroy(connection);
> -exit_pwmc_free:
> -	kfree(pwmc);
>   	return ret;
>   }
>   
>   static void gb_pwm_remove(struct gbphy_device *gbphy_dev)
>   {
> -	struct gb_pwm_chip *pwmc = gb_gbphy_get_data(gbphy_dev);
> +	struct pwm_chip *chip = gb_gbphy_get_data(gbphy_dev);
> +	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
>   	struct gb_connection *connection = pwmc->connection;
>   	int ret;
>   
> @@ -325,7 +290,7 @@ static void gb_pwm_remove(struct gbphy_device *gbphy_dev)
>   	if (ret)
>   		gbphy_runtime_get_noresume(gbphy_dev);
>   
> -	pwmchip_remove(&pwmc->chip);
> +	pwmchip_remove(chip);
>   	gb_connection_disable(connection);
>   	gb_connection_destroy(connection);
>   	kfree(pwmc);

