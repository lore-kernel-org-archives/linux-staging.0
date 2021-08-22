Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E12F80
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 10:59:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o15so8665130wmr.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SS1H4Sg5i5wwLYNxXg4bnkUzl9S4j4w3w6dwzkqKszk=;
        b=g5eycY1dhNrjokKkkf2EWdHw3ybiyWXqQ2s4e0NjzpfTTe8G2TVRnbNTyDJgk2YsFj
         PeyNckiZLjwpNlahVt5yA5gboAo6Q+hEUyxZu/V4ECEgNAu9oesOOrBr5/X58obO3rs8
         rfRNRFs7nG/XMhQmD9Zh40R5xfoznOtQjVVzpR0GtfbkE9VZn7K/T054aLThGWiCU0dH
         9ggnZb/Gr7oiilA6lmPZ9CfmWh5j753Y3g0Dzz4gs3ejlAONI5rv2n15bSyWf4hI35hW
         eqjeajkuLKRP8GyVhxJkKG4s+2oG0jblT8Qnx3tkFF/SkWMA/jrxs4NfP3crBaEKi/ln
         Y9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SS1H4Sg5i5wwLYNxXg4bnkUzl9S4j4w3w6dwzkqKszk=;
        b=Toe3YgDroAP6EozO13YYYZMTEK5yBNSObWQUBgquWRi8hhoP6+lnLxUzp3GkeGkF4T
         LXDZuiSjk8f/0DDuFMOVwwywiOjDck7e3IljIKM6Xmo6Qu/TBvpwNtPQKSSUtdfxYR4F
         jntRXas1Au8n47P9hjWy11klgQ4Yj3Wvgutx5iBUMFwXS2GtqjI1q0XddcjKyshjdRDr
         Ic/P654ebRX5eVnNsvH5WyuT/NMnE+HJTMayQCG+0EG03JjdnVT1Th3Tlz1kktDIxeKs
         UFGBEQYoI+wX6+Ve5cnNG5+2+L4+/lWRq/63RM7rZs2wT7S0bSwVM24Qhnq436DiZUhK
         YjDw==
X-Gm-Message-State: AOAM532U0w77AcByHVd3Nf4EZhowEVxitqMU6pDSzH8WfHMEeDP6N4N3
	fJwXoCyVORh/vjPqzXvmoyM=
X-Google-Smtp-Source: ABdhPJwlsCu/vR1NpQZge59EGn5yPWt14P8YEDeW4maURjaBSaVldCYrhAadvltZe2PTv2hvojBhJA==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr8227646wmh.167.1629629969315;
        Sun, 22 Aug 2021 03:59:29 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id a77sm16099579wmd.31.2021.08.22.03.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 03:59:29 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YSFgrLUfXzgcT6k4@user>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <5d56fa86-854f-4876-be3b-b0adc129da70@gmail.com>
Date: Sun, 22 Aug 2021 12:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YSFgrLUfXzgcT6k4@user>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 10:23 PM, Saurav Girepunje wrote:
> Remove the condition with no effect (if == else) in rtw_led.c
> file.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_led.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> index 22d4df9c92a5..76cbd5f19f90 100644
> --- a/drivers/staging/r8188eu/core/rtw_led.c
> +++ b/drivers/staging/r8188eu/core/rtw_led.c
> @@ -148,10 +148,7 @@ static void SwLedBlink(struct LED_871x *pLed)
>   			_set_timer(&(pLed->BlinkTimer), LED_BLINK_SLOWLY_INTERVAL);
>   			break;
>   		case LED_BLINK_WPS:
> -			if (pLed->BlinkingLedState == RTW_LED_ON)
> -				_set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
> -			else
> -				_set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
> +			_set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
>   			break;
>   		default:
>   			_set_timer(&(pLed->BlinkTimer), LED_BLINK_SLOWLY_INTERVAL);
> --
> 2.30.2
> 
> 

Hi Saurav,

this does not apply to staging-testing. Please rebase against
staging-testing and send v2.

Thanks,

Michael
