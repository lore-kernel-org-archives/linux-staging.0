Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5C20ADEE
	for <linux-staging@lists.linux.dev>; Wed, 11 Jun 2025 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626283; cv=none; b=dyOhHIonydwUkx55wJzopPw9ssyt5Wml99KmnT9kUHm9CQtYCMn+6YjgwiJqk7q74FCh8iUSa+n+Z/X3CBKnyK24uW9xLzM4yJnt3BhvSVTecRgpnYRl3WujHmpFtbEoielnqNKFrP2cuXoTH+uucGKXjOqPu1uR2u+Fl7wPREE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626283; c=relaxed/simple;
	bh=QNeImmfSFEHcHoVT5BWJstzzNsO907LECLn5apjX4dw=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=i2VUeARz27NOoptBGjx+HgT/Uy8n1uYjKyIwOavqEXqSU9MWQ+8mkP6yqHYEf/IGWsrF91JOXDyDraUMfaTDRp4q4MAXMGeqlVAR+itE0TmZCqLY6ENr77PEU+8juovLusqTO+64Tl7ZzIya3NNCdzjhOTbE3mT45qhkXLAbL+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0s1dKjO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0s1dKjO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441ab63a415so65720155e9.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Jun 2025 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749626280; x=1750231080; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UV16KNGvk2B5yuORUC0PMOaWLyG4ZWITjVZAENXr0k=;
        b=Z0s1dKjOqWGPKMW5oEGnSw/nYrga1w2cKEPJZpxP21iSYjh6zMpE5dYjHRIBB0JrHo
         2GxauNcVWQHxtZv2lIBxcPxjGMaod1hgWs+ETMDv2wst3PdsTZ1DUGgOGYc9BJ8YHcNi
         6HhKixz0Wmh3GZQ9BHWZ+RrhCqZBRnzGlELKs2L2Y+VNOjeiR8KHRrq63Xjb50iRo6S0
         AA+YbGdVa5v486Qbmy8L+dQWuyKqDNJKVjxUokMgUFkpwJoXq1d1OfgbmpV4cZrpNlC+
         waeZxX+2hJGT4w3d/8BSzHkDuxyZ6CehOsU16Ye8IhPG25jH7gi5UZF7B99VqMqUdKGx
         ptrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626280; x=1750231080;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UV16KNGvk2B5yuORUC0PMOaWLyG4ZWITjVZAENXr0k=;
        b=IYmuYt82sbpcb4x9Dy6zesQxycGJX+zigHgUZlIEj2BY4dKrpJHnLyiTwpM3yjxsWx
         6lrLa1QL0eUoS4nno6UUYwYcIAWBG6BKnZwR5O9cSPBQs+X9DZAK0FQY6hFbZhT10tw1
         ZSC56YwHGxg7/wk5T41tQrNt+YZenY5LSLcOyPnIbPFsaCCmHxHRpzu0sZ1b7lBYeNNz
         pXnc0RCoA6tztYL1GUCc36wNK6nU0A65hcDZvk4PysIvq2PuhEusSbMYO9MV2DcRsiIN
         C/R3QO7hKyNJSNKcl0DeSIRZk5kwW/XeyGzaXsJtyxK0q5MWDwIGoSKezR1odZPnZwcF
         tf5w==
X-Forwarded-Encrypted: i=1; AJvYcCXGdbVqkEnF1HUm4OZ5gFq684Z+iWsDuuREsO6UxvGCSXXwSfCLcAUc1XHCdL+HCinp9PqqzBhUpqcXKxZm@lists.linux.dev
X-Gm-Message-State: AOJu0YxmnkeVfag+2P5nyJiAbpwfGGacfwcYWC5jhlxrAc42X/0Ns29x
	L7/FhkHBGqvQo1TLb5GbFy9Y2luo3jEzQLHvCYAObM8bZ5LRqNoCLKpt
X-Gm-Gg: ASbGncvENvd+AUryqDDxuENC1yv70L03yPshJVwILaWAlF3E7W9bkORqFw3LZkKwu7N
	vIk04slEA6QhUKDcNIYFi9gYPNUO59cCwDJbip/eme2RxmammI+X08GNNlLv+WSULcOHFcEW4Lw
	Iq4l+2YaTg9SuqRZfpHmN5zv65viTwdK3tBaCZm9ul7hbvo2XBOyMBD4LxgOdASlLZ3Xp4JjSsc
	Jzsf8PD9CpQeeM/b279UvBYx1vTu1yn9P9Z8tcmdaak8hwiB433GwYx9x6EXbnPoQK+4fv14x9n
	IPup5545RNYyPL5lsc47nAa2A5Y3pgGJ8JklyQ/4uAMwjeAvYBToAcDWz5y+z1/6rdMs0yRRK9s
	rxfqLWyBx89rLCg==
X-Google-Smtp-Source: AGHT+IFT1pbBYNbS/cZPSP4PTxvgVaj3pNGhmXxZlh1AkFam1XP972B4SbHd1fccSvHvvnUVHTpBrQ==
X-Received: by 2002:a05:600c:3d13:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-453248cb4c2mr16102345e9.24.1749626279675;
        Wed, 11 Jun 2025 00:17:59 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45325176cf5sm12154925e9.21.2025.06.11.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:17:58 -0700 (PDT)
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
Date: Wed, 11 Jun 2025 08:17:58 +0100
Message-Id: <DAJIR40MBKSP.11QTS156Y7NH2@linaro.com>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] staging: greybus: remove unnecessary GPIO line
 direction check
References: <20250610152036.86099-1-brgl@bgdev.pl>
In-Reply-To: <20250610152036.86099-1-brgl@bgdev.pl>

Hey Bartosz,
Thanks for the patch.

On Tue Jun 10, 2025 at 4:20 PM WEST, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

LGTM.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
     Rui

> ---
>  drivers/staging/greybus/gpio.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpi=
o.c
> index f81c34160f720..1280530c8987a 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -192,12 +192,6 @@ static int gb_gpio_set_value_operation(struct gb_gpi=
o_controller *ggc,
>  	struct gb_gpio_set_value_request request;
>  	int ret;
> =20
> -	if (ggc->lines[which].direction =3D=3D 1) {
> -		dev_warn(dev, "refusing to set value of input gpio %u\n",
> -			 which);
> -		return -EPERM;
> -	}
> -
>  	request.which =3D which;
>  	request.value =3D value_high ? 1 : 0;
>  	ret =3D gb_operation_sync(ggc->connection, GB_GPIO_TYPE_SET_VALUE,
> --=20
> 2.48.1



