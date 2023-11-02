Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19001C2A6
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="adcSpwsZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so1757982a12.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Nov 2023 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698935724; x=1699540524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kxXGpASHb8vQvtPgEKuD/+7aWXQWstAKgMPv5Qzafs=;
        b=adcSpwsZvDIJLvlYXSqDa2f1T3w71iOzfbMp4hp5sZri99X9O9ofsJCQHFOX2HCzvj
         2o8i8QVMk0pLUUkzdCHY23IiFeSRbEebXdE+VLY9Ow8sIdFtUau/CTQnuDak1F67kBZ2
         /uGe2OIfblT1QVKV3jl7ydQZxAWNPdrHiqYmG4Xa4t3csHBi1XE/W0TXMq+W6ckj85bF
         PexdH9YFNbg2SNfTo4zuHVjK9v5LMcMNGBF1578tMk68ImyuxawWjb35AtKtqbVML0i0
         VLI/4juCQy2UwYgfLRjpKReQgdOgY/5fPVBvvEhG4V+hi9idFJHVzrCH5YCvwIsWi4bi
         rj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935724; x=1699540524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kxXGpASHb8vQvtPgEKuD/+7aWXQWstAKgMPv5Qzafs=;
        b=H//BSeQkIxegA/1p1f2WjVt2lG8lGAHpAyameAgoH9+3yCPC7ODG6nM7lEGKAEqEtE
         Zw9mqfFqKCcCfbpNTkJWqk1r8rEEbWF4upAiXJitFp+56jjiU1MdwNLlEhHEHQBFyqnh
         ni6L+F2pFF/5qfV+mHWgqDISWQ03cw95++Z8LVeawlyh+HuKhl+zV3pRikP6ER+rP9m2
         PKBSwfg/NI+q8d017cHF7J1n1+FJHAPg4kL33x4YzAnftnbV4/WmThue8fDaFXpBFyPE
         biKA2DHswg3hiWk19LJ8ENVqGajr44nb8/r5tghDDlyzNcF/fzVjkk+zcCiqK6GUbIA5
         KkVQ==
X-Gm-Message-State: AOJu0YxwIKsAuFDsS+UoWdnUsBJktpQmROcnxhk6JtJerpNNDUBBd9Ph
	QX6ZlT22KRBHV1a903n7Rb4C4g==
X-Google-Smtp-Source: AGHT+IHi4X/4Ey2n4dyewNyEL9R+lcjlEa8aSyNJ4kvkobPnvns1KYaw7NdgxkYdUuj6rCBOabCwMQ==
X-Received: by 2002:a50:aa93:0:b0:543:6ce3:f091 with SMTP id q19-20020a50aa93000000b005436ce3f091mr6167475edc.7.1698935724023;
        Thu, 02 Nov 2023 07:35:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j8-20020a50ed08000000b0053eb9af1e15sm2386006eds.77.2023.11.02.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:35:23 -0700 (PDT)
Date: Thu, 2 Nov 2023 17:35:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/4] Remove redundant return value check
Message-ID: <11e6e0bd-eab1-4aa7-8c5c-29de6cff1b3d@kadam.mountain>
References: <20231102141135.369-1-adiupina@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>

On Thu, Nov 02, 2023 at 05:11:32PM +0300, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c       | 6 +-----
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 2 --
>  drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 --
>  4 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 9fa390fbc5f3..f10931a03285 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -840,9 +840,7 @@ static int gc2235_probe(struct i2c_client *client)
>  	dev->ctrl_handler.lock = &dev->input_lock;
>  	dev->sd.ctrl_handler = &dev->ctrl_handler;
>  
> -	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		gc2235_remove(client);

Not related to your patch but why doesn't this error path return an
error?  Can that be right?

> +	media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>  
>  	return atomisp_register_i2c_module(&dev->sd, gcpdev, RAW_CAMERA);

regards,
dan carpenter
