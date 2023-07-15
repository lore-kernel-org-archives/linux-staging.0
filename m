Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB507473
	for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 15:04:36 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-78666f06691so120365539f.0
        for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689433475; x=1692025475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lmHuW7kv0xV4VT3dumqkXFfTsOFC3icy4KTiLxdmbE=;
        b=YTV0XX5/LjVqIw+XoXG35FlvNF6M6nmuwYCHJqV89vyQgx7oSj3XynMq3PWrKuPs8s
         31oqRjJczQzQUU7E+GL/Pqwy2TpLq8zfVZVp7E5ePmpApR8Qcmxw0zX6ZV6w0nk45gAe
         OEhWaxT+/7n09BGFgFUAydDE6FsvXtHpCZ9aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433475; x=1692025475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lmHuW7kv0xV4VT3dumqkXFfTsOFC3icy4KTiLxdmbE=;
        b=I6rZ3hJnPdfasmq0/RKAh8AnxUxKmjwlRr5xd7SmMoInOcTKUYjdoRR3QeP5W3YUvu
         WE24W13l8BPz29mv+S2c7cBMacWDeBR4EIwDtnTD3kMDT5ZcoCZleUg3G32s1xd30hY9
         l9kPa5AsARAHgyrWPRtMVV7Uuk/56DSXmKavyv7dbYJuojQQVMGkARstaes668qbEnKa
         kam0ltjgOPJwPnZ22igHT8pwfUkfTNpZNBMTq0ibCfTQr7iYPpsVNbpVetaErrNU1gnc
         9V+C4pQL9hVgVGvZ/qJb6Wn1CzEGbb7J+HBi9Moz4ewa7ufLLAtcrkx2E8iv1niJ9XkG
         qgUw==
X-Gm-Message-State: ABy/qLbaDtVrH8dzP82jBSjghlD5H8HpMEC/XRWeWV3ZDDLnn8FVLIbN
	mi9r7YcL+0v3Fech9GbmKyVHTg==
X-Google-Smtp-Source: APBJJlGCHBR18RbqKTwOEfeQCS+sObjJ7YyFJMDRWSnlpsu4VZf0cz4VlODNl7iJszbyGz8zihBZwQ==
X-Received: by 2002:a5e:a811:0:b0:783:69e0:57a7 with SMTP id c17-20020a5ea811000000b0078369e057a7mr7171574ioa.16.1689433475484;
        Sat, 15 Jul 2023 08:04:35 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id x3-20020a6bfe03000000b0077e40979b41sm3448036ioh.45.2023.07.15.08.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:04:34 -0700 (PDT)
Message-ID: <58c62051-86b1-b0fe-5e96-8594561ce881@ieee.org>
Date: Sat, 15 Jul 2023 10:04:32 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] staging: greybus: pwm: Drop unused member from driver
 struct
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 kernel@pengutronix.de
References: <20230714201622.2490792-1-u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714201622.2490792-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/14/23 3:16 PM, Uwe Kleine-König wrote:
> The driver doesn't make use of struct gb_pwm_chip::pwm. So that struct
> member can just be dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/staging/greybus/pwm.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 88da1d796f13..f569d371a007 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -19,7 +19,6 @@ struct gb_pwm_chip {
>   	u8			pwm_max;	/* max pwm number */
>   
>   	struct pwm_chip		chip;
> -	struct pwm_chip		*pwm;
>   };
>   
>   static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

