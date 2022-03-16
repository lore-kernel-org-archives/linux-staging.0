Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD92F2A
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 15:14:34 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id b16so2702481ioz.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=kYdVKa8HQQd4XhmmDIeciSc5gdT8cpPi0Vqsz/8eVFs=;
        b=LEjgeFBJFbL3lZQF1YeGU0E+75QxZD2INUycvw1BwX3z6jCdW6/KYCemiQE1gCip+y
         cOH1P4yGx0BpQkUCjqTQi2ksWIDFrlTTx5+/2YGWkMpx03ZwuCfxG8Kez7j+3bhzni/K
         c1E2+72+psCSK67LsXid7vffgQGOB+MSoLbgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kYdVKa8HQQd4XhmmDIeciSc5gdT8cpPi0Vqsz/8eVFs=;
        b=LWvmUV2SwDGyypCYDt7ZIkMOG4XXFyfj31n/iQia5aRLKRca4TP5GenZHLOt9m1pWp
         SDMnZ83U07jjNdyfyLberc2YsCjCpf+lq94Euyvbc9rAnVSN5vRZ/iMwdGFRrmWlSY12
         oAaPjrXZAvl0cZUryFQTwPCVMkhuEHeXgs/+eDZsXKzJWfFV9nTABeRnwcCqt8lEWhuZ
         D7LThNARl45U1nDg3Q3Y2+VWh4A8n6f/OlB2DQuxnBXu1RhmRd36uHxQAFW1nyvoVrvQ
         1YejqnDJ3ndZSxBRZzmfBTgrN7L/q9C33+T1h0SdO1k7RQKwPolKHHGo6p6QbUS1Q9pe
         7i9g==
X-Gm-Message-State: AOAM532xxokc027qBvjvyS3K5hXZa4rz9IWnjPxm8HLWSFdzKOB35+MV
	/GcvjJADVWFNM8BSqdROe27V/w8ksWRYeA==
X-Google-Smtp-Source: ABdhPJxrV6QRj/lzoH0KaD2xcOeZ79JwmoEE/P4htnTFDFGnW/pJKO/xmiSlSWBr8Tbkzn4uDn1SXQ==
X-Received: by 2002:a5d:83c8:0:b0:604:c09b:259c with SMTP id u8-20020a5d83c8000000b00604c09b259cmr256148ior.106.1647443673559;
        Wed, 16 Mar 2022 08:14:33 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id s13-20020a6bdc0d000000b006408888551dsm1114562ioc.8.2022.03.16.08.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 08:14:32 -0700 (PDT)
Message-ID: <49f18070-0215-8475-907b-487d1e01c15c@ieee.org>
Date: Wed, 16 Mar 2022 10:14:30 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5] staging: greybus: introduce pwm_ops::apply
Content-Language: en-US
To: Song Chen <chensong_2000@189.cn>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
References: <1647397285-30061-1-git-send-email-chensong_2000@189.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <1647397285-30061-1-git-send-email-chensong_2000@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/22 9:21 PM, Song Chen wrote:
> Introduce newer .apply function in pwm_ops to replace legacy operations,
> like enable, disable, config and set_polarity.

It's not just "like" those four, it replaces *exactly* those
four operations.

> This guarantees atomic changes of the pwm controller configuration.
> 
> Signed-off-by: Song Chen <chensong_2000@189.cn>

I see that support for the "atomic" ->apply operation was added
by commit 5ec803edcb703 ("pwm: Add core infrastructure to allow
atomic updates
").  And what you're doing here is removing the
enable, disable, set_polarity, and config operations provided
in this driver to use the new apply callback instead.

And that in turn depends on a prior commit (and another commit
or two after that) 43a276b003ed2 ("pwm: Introduce the pwm_state
concept
") to wrap the current state stored in the device in a
sub-structure.

As I understand it, if the period, duty cycle, polarity, usage power,
or enabled state of the device differs from the current state of
the device, the new ->apply callback changes the device's state to
match what is requested.

Please see my comments below.

> ---
> v2:
> 1, define duty_cycle and period as u64 in gb_pwm_config_operation.
> 2, define duty and period as u64 in gb_pwm_config_request.
> 3, disable before configuring duty and period if the eventual goal
>     is a disabled state.
> 
> v3:
> Regarding duty_cycle and period, I read more discussion in this thread,
> min, warn or -EINVAL, seems no perfect way acceptable for everyone.
> How about we limit their value to INT_MAX and throw a warning at the
> same time when they are wrong?
> 
> v4:
> 1, explain why legacy operations are replaced.
> 2, cap the value of period and duty to U32_MAX.
> 
> v5:
> 1, revise commit message.
> ---
>   drivers/staging/greybus/pwm.c | 59 +++++++++++++++++++++--------------
>   1 file changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 891a6a672378..3add3032678b 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -204,43 +204,54 @@ static void gb_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
>   	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
>   }
>   
> -static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> -			 int duty_ns, int period_ns)
> +static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			const struct pwm_state *state)
>   {
> +	int err;
> +	bool enabled = pwm->state.enabled;
> +	u64 period = state->period;
> +	u64 duty_cycle = state->duty_cycle;

The use of local variables here is inconsistent, and that
can be confusing.  Specifically, the "enabled" variable
represents the *current* state, while the "period" and
"duty_cycle" variables represent the *desired* state.  To
avoid confusion, if you're going to use local variables
like that, they should all represent *either* the current
state *or* the new state.  Please update your patch to
do one or the other.

>   	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
>   
> -	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns);
> -};
> +	/* set polarity */
> +	if (state->polarity != pwm->state.polarity) {
> +		if (enabled) {
> +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> +			enabled = false;
> +		}
> +		err = gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polarity);
> +		if (err)
> +			return err;
> +	}
>   
> -static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
> -			       enum pwm_polarity polarity)
> -{
> -	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
> +	if (!state->enabled) {
> +		if (enabled)
> +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> +		return 0;

If you are disabling the device, you return without updating the
period and duty cycle.  But you *do* set polarity.  Is that
required by the PWM API?  (I don't actually know.)  Or can the
polarity setting be simply ignored as well if the new state is
disabled?

Also, if the polarity changed, the device will have already been
disabled above, so there's no need to do so again (and perhaps
it might be a bad thing to do twice?).

> +	}
>   
> -	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
> -};

Since you're clamping the values to 32 bits here, your comment
should explain why (because Greybus uses 32-bit values here,
while the API supports 64 bit values).  That would be a much
more useful piece of information than "set period and duty cycle".

> +	/* set period and duty cycle*/

Include a space before "*/" in your comments.

> +	if (period > U32_MAX)
> +		period = U32_MAX;
>   
> -static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> -{
> -	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
> +	if (duty_cycle > period)
> +		duty_cycle = period;
>   
> -	return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
> -};
> +	err = gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_cycle, period);
> +	if (err)
> +		return err;

What if the new state set usage_power to true?  It would
be ignored here.  Is it OK to silently ignore it?  Even
if it is, a comment about that would be good to see, so
we know it's intentional.

					-Alex

> -static void gb_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
> -{
> -	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
> +	/* enable/disable */
> +	if (!enabled)
> +		return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
>   
> -	gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> -};
> +	return 0;
> +}
>   
>   static const struct pwm_ops gb_pwm_ops = {
>   	.request = gb_pwm_request,
>   	.free = gb_pwm_free,
> -	.config = gb_pwm_config,
> -	.set_polarity = gb_pwm_set_polarity,
> -	.enable = gb_pwm_enable,
> -	.disable = gb_pwm_disable,
> +	.apply = gb_pwm_apply,
>   	.owner = THIS_MODULE,
>   };
>   

