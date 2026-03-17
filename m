Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7B301016
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758659; cv=none; b=JoEcCcjWHsRR159L0mpQGATxkeY4YpAO44Uk5yQhQRqZDEp85E8ZXLZ+1vFqvK3VudspikXPTq4qITPrxl6pDhpdApIdGHB8jNHcvWWWeHlNUHkqkhH61lbkqlvVFmxQcAGZppxNOSF1dJN8ZoLjIYAIQXawHc7/HQxfyuG1ouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758659; c=relaxed/simple;
	bh=/lQKc4RWjClPYwy5GhiuYFdZiaSmsAVh0wNDXmbpJoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBgXxaiJ0doGxCR0fOdn/73P8ew7JAubbs40R4HtkrrEupiegtaCXxs00gEhlaGK7rbD9zl/1q4rgB3v///P2mHD79BbNzguAc0KKDAnJkfAJB+yvrXDOxQD6JRQqNnXBr7zcY9CmNeIIW4Mj8zxYPcGmud51pJJocy4x9SV5NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8bri8qL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8bri8qL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so53037205e9.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758657; x=1774363457; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPmJE/ZDBtcsRuCApMprqj5MgjddWs0EvxZ7lU2ScvU=;
        b=T8bri8qL+/gMAIHokbdZGU94u6oQNrrnESt3zwFg/5girfdHRbSKn+6XsViZjVeha0
         BKlnIUVAe9G9PdyCGJnvsbvUiEL4adR4uPNJ37Y/jDAzsb65hvYU+86tVqjfVtuPwyGy
         Xsoc4qulwlpQc7yX0STTRrR37AdlInn2z3WdqB/Ta+8MHD3OeMio1qgK5OnPkG/FxGhP
         mxWgvUYdC1pzi7+njMjDxemFaG7CU1UnMsUJDOXsLNCpIHuY7eosv8wRipBbHFhxZC3e
         1jU2SoGP16izDxxvZwZE2fylE9oNDtlMmN1Ya2u2GMMn1t/jDpt8LriTIzg4W8lC1nDZ
         aNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758657; x=1774363457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPmJE/ZDBtcsRuCApMprqj5MgjddWs0EvxZ7lU2ScvU=;
        b=cTri7/DMFpasfZWIp4YVD9D4zsIz24VrJRhpFUV+0nsCWP7X6PnNHsKE7FhjoyCYhH
         7RAWoenOlIBhQq3NrDSkeJswSrmXmjvYNr/6gIZiuX7sFUC7j8SoERivPM5y8y6wEZln
         wDEcm+YIjwi2GFK6cQXUYFS38G6jg3sowLRurEBoYMHYZEZdHV+SxdN3H3HBblvobVN1
         hKT54lGV92GCyqETH/xb0j+fju7X+HlKhpuW655gfdXU34vZM9eTOqlnsigMpmm3J0EM
         014SAmOYiZ5jcphSFlnBtJ7r5Wb9xF645DXM3HoDZXnOamq/kih2et8F3rmwMd0NXIXE
         AQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpXOnQEszG/iJu1WA9jl4J3aTWR8biRQWHnvL66uiXSgZL1zg38AoXZboz2nbN1aO5UHbeKRr31tWIYvQ/@lists.linux.dev
X-Gm-Message-State: AOJu0YzZIzOkykfV1tnwPe/hWXaFQbf3WzeSmO7q/2k4HRj3MJ4R9uL3
	BlJbdaQ1wNbRkju3FrAXPHP4Q5Kw2ev8VtznCZnmSfzH321ZpbZOfpxhkE2R1iwDSEU=
X-Gm-Gg: ATEYQzziwa5CxfsescDoYeWhQYf/t83hcS5opzk02WqTgthyJNSceh6AaH16piU5j0Y
	kCJro93VCR57jSMqgSuhdXbkCP6CfqrcGIxw8HvRLxv8h9lzpSxiDD8h3ZU1zmwdMo3+ou9/jqM
	3Szc55cEyVChFaUVl6gyDiUaE4rvgiTSqeL0emEfEpXnh+EsIolnbzqOlX7mIV8Y6iJsMHBd2Y3
	9A8XmyQvBeZ1iHfyeCw9FoFnlJ4zPeClvQXiJjNYdv2fS5hFOQwkcxIihXUTiP0H5/2OHohTqzx
	CtXcglSaBrkpWMI7SOsEqwaldeG2tdTrK5reY8YHZiboHaI5IIrWKsb7h+JtNxx1KYrKFHLaRpg
	BjLyayQ5tuya4InU9tRJsuQ30/cmax/6Icq3N8rvr/S50+xycGnQQaRwdzNzsj6xjq7kwo8v+YA
	ymz29uNFTchP8Tf1Fg/UIKs0L2bczP
X-Received: by 2002:a05:600c:a15:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-48556710fd5mr300281185e9.33.1773758656794;
        Tue, 17 Mar 2026 07:44:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm68882275e9.6.2026.03.17.07.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:44:16 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:44:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Teng Liu <27rabbitlt@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add blank line after declarations in
 fake_driver struct
Message-ID: <ablovfRxnxK93WDk@stanley.mountain>
References: <20260317131821.54768-2-27rabbitlt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317131821.54768-2-27rabbitlt@gmail.com>

On Tue, Mar 17, 2026 at 02:18:22PM +0100, Teng Liu wrote:
> Add a blank line between regular field declarations and function pointer
> declarations in struct fake_driver to follow the kernel coding style
> convention of separating declarations for improved readability.
> 
> This addresses the following checkpatch warning:
>   WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Teng Liu <27rabbitlt@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index be4ad47ed..eb918a857 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,6 +67,7 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +
>  	void (*lm_callback[4])(void *);

This is in a struct, right?  It's all declarations...  Just ignore
checkpatch when it prints nonsense.

regards,
dan carpenter

>  	void *lm_data[4];
>  	struct tasklet_struct int_tasklet;
> -- 
> 2.53.0
> 
