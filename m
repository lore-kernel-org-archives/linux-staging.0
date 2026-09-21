Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091F49DB82
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997121; cv=none; b=k7e+jPKgdPU8eE1GXkU+Xl0jjhY5oXj0FUjdeJB50ftV1QN+9Qicw/4C68oDMrTX7Tf5XnQ5ShyZUbGg2j8upsUxF1r60rR7nMzbXR7MAiHKX49phwQaesHo13r42EtP//RxJHnKN5Er2Hr4f1Rw0pEMh+LyDVqRkByKBnf/7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997121; c=relaxed/simple;
	bh=/xqjr+2Xo3jrZ5ZkfrAm2z8zJAmMGGRPHRuSgWfh7Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj33zgeNPfKqs6At3DgxmByXBs8t8uL6LoZQSEJf9Saw2+ghcqcmF/lJD+EX9Pt88iU2+sUtj7cwvtLR2xDjfS8BjOngLaES7BrzyPgyGKqIoFcM3S31JIJG7WtypeFYM8J8v/BYb2tJWRo3rlUb9GXsMgLfgB1YORjauRw4ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnmgL3tE; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnmgL3tE"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso446065466b.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997118; x=1790601918; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWvOU2HFy2dN0GRMEA1Wtav+7uL5wo2+wayGCttWH+A=;
        b=OnmgL3tE9d9tCmWi7Yd6qsCYMnADMSQf6/nexpumFI7oAlRjxAUFNqYOteCiFpvubX
         6ZaOPgxLVzKejqn+Vuswc7y2ceOsqDaUGy9h5pGwUG3At9OrI1ZgSqsfb3WIz9FdG4u4
         aKJqsdIdLK48ACsTsMq77EIZ6v7tS15eRhpRlrdhL12ISRP3bvPY2xxed+4e9zAuCjjF
         xEyDJM6p7pGoRGV8HICF4ymtCyUzi8HruNj7JQbLaIFZtrEacjjOSYeensq/gQMVdEhd
         Psv+2DiM8RwcEse1NtGKWvHMKo1E19wvCLi/y95sNyEg2cMuYmGDJFo55Srjc5VlZLmj
         M3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997118; x=1790601918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWvOU2HFy2dN0GRMEA1Wtav+7uL5wo2+wayGCttWH+A=;
        b=SZUiwYSk0DRlm+AaWhdiXMftYqocJiDtbboXFKuG+/ATsDT3ITVxwEQ17cyIxUXqGl
         4G3qGYForZQ8YBaKfnDS1y3LeSKh6EYwkZVn1tXTHhuSxpYykWAb/Zq9Ez+YfOqUOv8J
         BnN+hLRMr0RPJqtPOcROlogCATHInzfv2hvN1w/lGXnTJjWQTlILauVRbcGHdiHtnNwc
         +lDMWafAMWzhdDaaGz6EpMQr3+43LqLRWgm+PKF2dJHZtyR+VYB8C1ZDNL0Gqc7pCwVB
         moMkXiJatSOR59WwFqZuXO1jFopms9vxzAxwD9SyIQXF/2cEMWe3x18aZg2CtT63S7Al
         02PA==
X-Forwarded-Encrypted: i=1; AKwUvByFf/UYg6FuS9NvJgKRxzGzUS5QC5UVlMhpSUjSdPJL8tGbNk4OW7nvQwXzgZn/UV2UhvOgSDNGAhLNmEJM@lists.linux.dev
X-Gm-Message-State: AFuF++mME1ooZqnz9wuJ2kwNFP9XmyCaPHOtF5Span2E+c07jRzFlvsC
	Vdd5gj9wXMiUKfoLNYGaiX6XIBsKifJBJBtJN7IX8VvzmzleEGgHCRyg
X-Gm-Gg: AYBFou32ajoKJLzprAHweHaAVkP5tnESi1m6ALUS99kfu/xeeDVRaK045UjA4SMswbK
	X13taCJSqNAeSHjA0qR8j4G0dwQ6HhPXVKNg6FFwmrmWYdagbI2yfDzlKy3Wp2/9ZoMznxYwGGy
	snOFEs9t3lLBDTu1Ls/nnLB7An0jEWmgXNh37RXUJ/7rR/dQj78n7eT+NakuaPs9TpClvZU1Wc8
	FwvFJWpDDGKXjv4XbpZ78gTUv11L87LxC56+kCmZmuH4NMI87EHx5EA8AWXl9BNiFk74HZGwgqC
	e7VQKNTYvFXp+vOEKTlM9L589/MDtM3XjIHYH8sbX+lEeo2Td79BPX2biNmngHTAt8oshtt8Upb
	50TAQodVhnst/2TRqkOWCl7wYljfyEJTtI+5IQjjC9Oh6+c1r30i+2RL897KlrN5z1K12i4RtuV
	Xy5GqacFajMgIpNSuu/pZg1ky+z2LHHWDUWjTJLsEeEUjwGjrcLBfekuTwbupquSefjuY=
X-Received: by 2002:a17:906:99c1:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c2a15841808mr872916566b.33.1789997117983;
        Mon, 21 Sep 2026 06:25:17 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67c71c59sm4377622a12.1.2026.09.21.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:25:17 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:25:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: UgwuRhema <hikarialiyev@gmail.com>
Cc: johan@kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: gpio: add comment describing irq_lock
 mutex
Message-ID: <arEwOc588OzriAf0@stanley.mountain>
References: <20260921122844.42816-1-hikarialiyev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921122844.42816-1-hikarialiyev@gmail.com>

On Mon, Sep 21, 2026 at 12:28:43PM +0000, UgwuRhema wrote:
> Add a description comment for irq_lock to clarify what the mutex
> protects and satisfy checkpatch checks.
> 
> Signed-off-by: UgwuRhema <hikarialiyev@gmail.com>
> ---
>  drivers/staging/greybus/gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 12185f7a9..7f19b3275 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -39,7 +39,7 @@ struct gb_gpio_controller {
>  
>  	struct gpio_chip	chip;
>  	struct irq_chip		irqc;
> -	struct mutex		irq_lock;
> +	struct mutex		irq_lock; /* protects IRQ configuration and hardware state */

No, I wouldn't say this is accurate at all.

regards,
dan carpenter

>  };
>  

