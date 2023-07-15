Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0C67473
	for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 15:04:47 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3457a3ada84so13768695ab.1
        for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689433487; x=1692025487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gOGWAD6wBVovUk2BHvSqIfOjzXSeVMRftgvw0qpfvg=;
        b=Dq890GHuhMH3ZbDuB9bZXTLcJD42Y7MTkD+Fb+3WQZMCsN4S7EW/o8q/zy8vwm1ewH
         2WkvXs/uUU5MO+7s5tdCYy4R3zwhpiOhhGqAdRIClaywsmn8BLqJ+kFswcWpdylW3Acc
         9+WnXhEzLih006uvdqL9Mpf+JT/dQS0WEP7V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433487; x=1692025487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gOGWAD6wBVovUk2BHvSqIfOjzXSeVMRftgvw0qpfvg=;
        b=hb1f3J/57E0LdckXXZlo+k+e+U6wf3Gsi1D7OZs8ZRdpBvFpySybXYnEx60bVy4/gz
         5gPcxmUhz3u6tvz1lGp7lPStkM2dDQJ2S45oYY+Y6zmq59GknpsvvUfsNwZSfb5Rkluf
         wXir0oukCfbEMa7GUetGjYEFAvpbxg+Sw0MshP1xLValj/ExQK0Smn6bYFcGfiZP7gxZ
         GjSX9Tjq1XedXmyl/fUpsVkfNh6Z+UCP6twG2yuyHgcCI/0bwy9yG9VSJQOwNtRB8VFK
         Zi3i/LO7HBjGMAqGpP7gf6RQK9NdhfPaAkvTlBDHglGEykYDrOmD7vgaqWh/vrvS3lEl
         RR3A==
X-Gm-Message-State: ABy/qLZKkpv4rP31GLh5yxwmEGb02+6rRmdpXjDWD7otMJPWhROGk1RH
	ntqa7y1Jy9R7M2iYSN8nfphQsw==
X-Google-Smtp-Source: APBJJlFLQ3qqt+bf2ZY7TjorWA6fP5Mtk4I1NR6VlGwIKrAhe/fQRo9Dg0t06pQGdEpXhw8baAKnrg==
X-Received: by 2002:a6b:917:0:b0:77e:3e85:34ee with SMTP id t23-20020a6b0917000000b0077e3e8534eemr7761979ioi.13.1689433487040;
        Sat, 15 Jul 2023 08:04:47 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id z16-20020a6b5c10000000b0076373f90e46sm3414217ioh.33.2023.07.15.08.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:04:46 -0700 (PDT)
Message-ID: <f8aec2a1-45ae-712f-db60-f923f2bf2a5b@ieee.org>
Date: Sat, 15 Jul 2023 10:04:45 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/10] staging: greybus: pwm: Consistenly name pwm_chip
 variables "chip"
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 kernel@pengutronix.de, linux-pwm@vger.kernel.org
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
 <20230714205623.2496590-11-u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714205623.2496590-11-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/14/23 3:56 PM, Uwe Kleine-König wrote:
> All function parameters of type pointer to struct pwm_chip in this
> driver are called chip which is also the usual name of function
> parameters and local variables in most other pwm drivers. For consistency
> use the same name for the local variable of that type.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/pwm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 88da1d796f13..c483e1f0738e 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -267,7 +267,7 @@ static int gb_pwm_probe(struct gbphy_device *gbphy_dev,
>   {
>   	struct gb_connection *connection;
>   	struct gb_pwm_chip *pwmc;
> -	struct pwm_chip *pwm;
> +	struct pwm_chip *chip;
>   	int ret;
>   
>   	pwmc = kzalloc(sizeof(*pwmc), GFP_KERNEL);
> @@ -295,13 +295,13 @@ static int gb_pwm_probe(struct gbphy_device *gbphy_dev,
>   	if (ret)
>   		goto exit_connection_disable;
>   
> -	pwm = &pwmc->chip;
> +	chip = &pwmc->chip;
>   
> -	pwm->dev = &gbphy_dev->dev;
> -	pwm->ops = &gb_pwm_ops;
> -	pwm->npwm = pwmc->pwm_max + 1;
> +	chip->dev = &gbphy_dev->dev;
> +	chip->ops = &gb_pwm_ops;
> +	chip->npwm = pwmc->pwm_max + 1;
>   
> -	ret = pwmchip_add(pwm);
> +	ret = pwmchip_add(chip);
>   	if (ret) {
>   		dev_err(&gbphy_dev->dev,
>   			"failed to register PWM: %d\n", ret);

