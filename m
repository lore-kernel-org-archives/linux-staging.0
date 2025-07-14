Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944022641E2
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752511118; cv=none; b=e7wEasU/nwmWUx5li3Ok+mtqmzvo2IpJyf0uKI+gbv9qaW3eYxaoOWm+UfQisyNA3xfOGsYTQSN9jXQjC1aBBQSc0gveCpp7yfq8MxdrSYcpI19pb8KloTyrnVho3Zf8JBrm26aePunjSAgxS+3kc5EUFjfsPCY67mrEV5uiaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752511118; c=relaxed/simple;
	bh=OvX1o4Xe0KwoA95UmnLfFc9oEE9tei1n0VStVxlruSw=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=TRrxv5WabGWiDZxadeKuo8rbZZknM+MS+hasuh/vaOma4ROzUmKb1K3Sq2wuez6z4HyN+Sp4dPAs4k7fQdJ6FkTrOVw/BcdNHg7XdTS7NKJBsoq66HXOzvU2JzT8twCtlQGtHTHdow2GGehMhvMEhmifmc6VpWYbACDYdCD0aBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD6FTJmH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD6FTJmH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so6481775e9.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752511114; x=1753115914; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA6MOwgCp6FTYVinfvEZJR7VSvHLCjeqeD7Gs1ZsFHc=;
        b=BD6FTJmHQ4Qgy9hMpCrbCThB1u92VDGGxhCNWtaoVglHBKURkj4QpCiWwr/KZ1/zA8
         wL9DkyFe+WGORXNTCnEkv8LNNDqY6CLoIns0z3o+qJcvcNP8jhyrtiDOs+4uN4FYSKUN
         qrZwPDFzGkCK/UdLFQCQJ3FgX9WsNw/JN5LNtXpYiFsJXYRIJdYvFXhfr2Mx6XtVTYg/
         rdy0KiDxfG1IwvJjx1/RfEcT9G9Qd/XNcwvbdq2fzhH3LKC9ornhy64kGrEQ9Lr+Y1Su
         R8pvzGWdH1nfQaH+1+IMMKw7J7CRzq6+LFDFRCcplxxOZ71F3j4N+uQlTOfwHCUS8O3o
         abEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752511114; x=1753115914;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nA6MOwgCp6FTYVinfvEZJR7VSvHLCjeqeD7Gs1ZsFHc=;
        b=hqY2rn/sQRoDCDEtw2dg6uTVNJ501uXST08TC0VlYjwzN4z0F89C+r5zfPq8b07wER
         n7V6POS61CESUC2+lJjg14fl2NCWLK5brQFNZELjvgKfIdyQCbnoKnOq7gsn0ZDRrsVX
         T7P0St1Ar6guAYAGa7Xgg/cyEZIem/5CHRuswnLDYnV3U0Y+b/4efM3arKkznEv4bp//
         ayqay/rZk6e4nNflOngWhOg84cfK12dQGEzHijMz0UZJcxc+p++4+vFkn1jflZ8mTAlZ
         JOn+Qzyw4U2MgBM7R2PJ04IQSjs58OyRxtqqzOjp+S5u8PbmzQh0WFkHaiTKK1+dySxB
         3kzg==
X-Forwarded-Encrypted: i=1; AJvYcCWfZwV+EJvj9kKL0YFjaY2W/KqMEgQk2K7eHHM1fXF5aaN3KN4khEhqePnRThy5X3Ow1oPYIJ9ZVBHNYJHc@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy3FvNm5OpAE/+IqtecmdMH9ll0B3zWNXM/3cJDkGjUKOIlY7g
	XFdOXpDckNryggFEFleaNUsOkojeZujZVlGW0uN/499KLB1XzHPwGa80
X-Gm-Gg: ASbGncsptO0+JrSWJNufIxsW2lYcgC3+5GThiBITXb+Kyi0RMQpXPreodU07UB/+O7b
	oMs17vqqQXHZKsSZuQHxyE3Hdc/cOIr0htW9DBOio60rNdhqPL5wJcD3JBAaeLOU27zBZxWn++G
	WSSlQmh67Uiqk+NeN1LPXbQpU1YJ5u4iH4MBJ0N+SxQaUH/uOCyY45OPoMMQQGJN07jn8kjpJUW
	2lHv802ICZS5GV1il/u4Am1OhsPTeWaiPf6uOkCfR6+8dWNtepifJgW4pEZ0LjJw8KZbIY6U1xU
	xSjLcKpEu49oRl24IeaWrlP67jmBmfocA5Kg5ByPq9ya/8j4izvVzuzrYZ918G8/9wmoAoLQpVn
	vwLbWlkH1JLzFbVaNB/uhSJIXCkokypBVNZq0miJqcpFNJUXGcw==
X-Google-Smtp-Source: AGHT+IH3FzHWgfO64SorIO2LSrTeSaITLBr9pADAESGyIjq06fDfQg9wHeJoPO/Fp0S4R0e2GAEolg==
X-Received: by 2002:a05:600c:5304:b0:456:207e:fd83 with SMTP id 5b1f17b1804b1-456207efef8mr27541745e9.4.1752511113555;
        Mon, 14 Jul 2025 09:38:33 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4560538da14sm80523135e9.23.2025.07.14.09.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:38:32 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 17:38:31 +0100
Message-Id: <DBBXCAEMM5ZO.GTKVMMR2XDJ7@linaro.com>
Cc: <~lkcamp/patches@lists.sr.ht>, <koike@igalia.com>
Subject: Re: [PATCH] staging: greybus: power_supply fix alignment
To: "Akhil Varkey" <akhilvarkey@disroot.org>,
 <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rmfrfs@gmail.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
References: <20250714135606.41671-1-akhilvarkey@disroot.org>
In-Reply-To: <20250714135606.41671-1-akhilvarkey@disroot.org>

Hey Akhil,
Thanks for your patch.

All looks good with the exception of a small nit...

On Mon Jul 14, 2025 at 2:56 PM WEST, Akhil Varkey wrote:

> Fix checkpatch check "CHECK:Alignment should match open parenthesis"
>
> Signed-off-by: Akhil Varkey <akhilvarkey@disroot.org>
> ---
>
> Hello, This is my first patch, I appreciate any feedbacks. Thanks!!

Welcome, and continue...

> ---
>  drivers/staging/greybus/power_supply.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/gre=
ybus/power_supply.c
> index 2ef46822f676..a484c0ca058d 100644
> --- a/drivers/staging/greybus/power_supply.c
> +++ b/drivers/staging/greybus/power_supply.c
> @@ -324,7 +324,7 @@ static struct gb_power_supply_prop *get_psy_prop(stru=
ct gb_power_supply *gbpsy,
>  }
> =20
>  static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
> -				     enum power_supply_property psp)
> +				 enum power_supply_property psp)
>  {
>  	struct gb_power_supply_prop *prop;
> =20
> @@ -493,7 +493,7 @@ static int gb_power_supply_description_get(struct gb_=
power_supply *gbpsy)
>  	if (!gbpsy->model_name)
>  		return -ENOMEM;
>  	gbpsy->serial_number =3D kstrndup(resp.serial_number, PROP_MAX,
> -				       GFP_KERNEL);
> +					GFP_KERNEL);
>  	if (!gbpsy->serial_number)
>  		return -ENOMEM;
> =20
> @@ -546,7 +546,7 @@ static int gb_power_supply_prop_descriptors_get(struc=
t gb_power_supply *gbpsy)
>  	}
> =20
>  	gbpsy->props =3D kcalloc(gbpsy->properties_count, sizeof(*gbpsy->props)=
,
> -			      GFP_KERNEL);
> +			       GFP_KERNEL);
>  	if (!gbpsy->props) {
>  		ret =3D -ENOMEM;
>  		goto out_put_operation;
> @@ -634,8 +634,8 @@ static int __gb_power_supply_property_get(struct gb_p=
ower_supply *gbpsy,
>  }
> =20
>  static int __gb_power_supply_property_strval_get(struct gb_power_supply =
*gbpsy,
> -						enum power_supply_property psp,
> -						union power_supply_propval *val)
> +						 enum power_supply_property psp,
> +						 union power_supply_propval *val)

Here you fix the alignment, but the last line goes over column 81, even
though 80 is not really one hard requirement anymore, all code
(strings is ok to go over to be easier to grep for messages) is on that
register.

So, to be coherent, if you could please send a V2 without this specific cha=
nge
would be great, Or even better, if you could get rid of all the _ and __
prefixes in functions names that would be great, and will give more
space for function paramethers.
Your call.

Also, gives you also the chance to practice to send a new
version ;).

Cheers,
    Rui

>  {
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_MODEL_NAME:
> @@ -943,8 +943,8 @@ static int gb_power_supplies_setup(struct gb_power_su=
pplies *supplies)
>  		goto out;
> =20
>  	supplies->supply =3D kcalloc(supplies->supplies_count,
> -				     sizeof(struct gb_power_supply),
> -				     GFP_KERNEL);
> +				   sizeof(struct gb_power_supply),
> +				   GFP_KERNEL);
> =20
>  	if (!supplies->supply) {
>  		ret =3D -ENOMEM;
> --=20
> 2.47.2



