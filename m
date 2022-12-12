Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7135D746F
	for <linux-staging@lists.linux.dev>; Mon, 12 Dec 2022 22:24:02 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id m15so4153486ilq.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Dec 2022 14:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbI+eTGIdrI44DmtbX1jGggNI5qyceGBZZvlSfYrIBA=;
        b=FR5uzaSNqtW4BhsAfYoxqJfqhcBjj3mMuZjOKAlK69RogWesOobPhr98bbCHFUes57
         XdQ2EaJ2hK0uuGQN6sb8YNS0IEtY+t2Qu31+uETU8R7VR8w3cG+3b0TDEt02sPNJdl8S
         qdvJzL4Bv6iYy+gBySf/XmATE+Sre+hXCO4yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbI+eTGIdrI44DmtbX1jGggNI5qyceGBZZvlSfYrIBA=;
        b=mQUKjyUbifoN+rRWc6Qpv4rgT4u9dw4urlgkX1QhvCJgHVR6s0O+Hn+k7xVdjmfUWb
         0HSxumZ0mf1HtfPWEh3n0B/rprg6qBixuboZvrLBs4cnS2fTm5iqurWTVXhn93nQ/Wg3
         MA8/D0MNoJbAuimrKWR5DbrVX8o4RmIaaoclQ0UelYrBhq3+9rLBYqM32mCkABG2f6QV
         lV0DrT1LUGseYxohmxbJOhjJBdaXnXoUI8adbaDCNJBgykjSLD1BDgwnRCkHC1Y+v8pN
         xN4FwR27Fw2fGfC1Ojm403v9D0jv4eQytW4L03VAYYfx03FPFIcH4tO+qDFm6Wjj181Q
         XBHg==
X-Gm-Message-State: ANoB5pksVUB3aaUSBeFeNPz5kptTX2wyPmSYbXoYFkuqh20MqBTWyTCL
	ByS9MxPoe2Zgcfr4BnHV/61gBQ==
X-Google-Smtp-Source: AA0mqf5cSTNIT7zNjXUgRRD66Jm0gkJcL/A796s5cGYTZ42sxUx2f6E6mcw+xXfeaHof+SH4A6Sibg==
X-Received: by 2002:a05:6e02:106f:b0:303:3ba0:1eeb with SMTP id q15-20020a056e02106f00b003033ba01eebmr8716815ilj.7.1670883841417;
        Mon, 12 Dec 2022 14:24:01 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id b18-20020a92db12000000b002f9b55e7e92sm3302440iln.0.2022.12.12.14.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:24:00 -0800 (PST)
Message-ID: <22fea66a-5b37-59ad-fa05-8caf75a9b539@ieee.org>
Date: Mon, 12 Dec 2022 16:24:00 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: greybus: codecs: Drop empty platform remove
 function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 kernel@pengutronix.de
References: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/22 4:13 PM, Uwe Kleine-König wrote:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I agree, this looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/audio_codec.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 0ad8aeabccbf..72ace74ea605 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1075,11 +1075,6 @@ static int gbaudio_codec_probe(struct platform_device *pdev)
>   			gbaudio_dai, ARRAY_SIZE(gbaudio_dai));
>   }
>   
> -static int gbaudio_codec_remove(struct platform_device *pdev)
> -{
> -	return 0;
> -}
> -
>   static const struct of_device_id greybus_asoc_machine_of_match[]  = {
>   	{ .compatible = "toshiba,apb-dummy-codec", },
>   	{},
> @@ -1094,7 +1089,6 @@ static struct platform_driver gbaudio_codec_driver = {
>   		.of_match_table = greybus_asoc_machine_of_match,
>   	},
>   	.probe = gbaudio_codec_probe,
> -	.remove = gbaudio_codec_remove,
>   };
>   module_platform_driver(gbaudio_codec_driver);
>   
> 
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476

