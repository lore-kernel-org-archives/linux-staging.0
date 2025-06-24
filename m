Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A492E7634
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791495; cv=none; b=u1h0DHaNX3nJHwW0gSaKR0exvwR0+YMiBPXY97o6ojXMiWIsfkdPaJ0GWyhcnRKVs3V+24ctRoo0L44nG8+NnsmSYenngiHTKEsBNKqZh0xfBqdZgTcr26Pkq1KXqYj34Hsrnop9jga7DChCqKLFO8gUGBhNCxV0VLykEkc2U8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791495; c=relaxed/simple;
	bh=npWwWKZPd5rdEqfk5ixF6kz+HcjFPiAMk+Q3wRxBc94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdeeMv2KWup3DbSOvUK+bJUrz8xKV3R4eJnjyFL3JdAMGxUOZM9CHhv18R2yOejgG7qikBDBuTIWmVAZj9psN8j5zlSXT5rLtnJMHvNzfJowx5uyBGcogBGI05H5nfc3b5o6ehzHPAoRY0J4+0UBn2F6Zbk/prVDRVzkZpx0iJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JSOFrs5O; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSOFrs5O"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b7fd20f99so2066941fa.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750791492; x=1751396292; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=JSOFrs5Oh4irAZXynklk2g4PkVvgIWj3qWkr4nurUmDSJt7oh0azxj0YwqsxwN7HaZ
         j31OTD3QTboxXEkkb71X14yN/oz9e8emUf7GzXj5EUOmh7xPMG8YXlGSoHzFh09Bo25A
         v3If/xQlcCiQFmyd5IRS+sxe1M7WB1Ge8RNjAa2/hvawWc4R4BFCFfwCoy5YCOM796fr
         C//94Ft4UwyuKM0xXgd2Kbr6BaEylreEwmFoYhsHNFZz8kbHI3QyN4CW9xMUE9qc26cS
         16jnxBTADNKGBaNyHlKF/rs22Dby0GMUJuKDyl2pleactTFY0TxcGtMFqzG5WM3Z+eoE
         TNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791492; x=1751396292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=PfWW0VkySqyxVRtwoffUx3DgLOr0pRe6Jy0DOwhh9y/rc5wSGg6kz6+1WU0PKLxUw/
         997MXeXTVVv+SzQBzebxUSUtdwppzwgCrWcW7rkaV2297TYTNz21AXYks2jnfzImzTiO
         2cC1r3bRHdGfwYNhgcAB7hGGcazgtkoN3j9D8XPOyR5abvKKhbOj4PwIxLTdhQMG82Cd
         FnpOtCE6xABSK5wXxOsmuTShHmWJpvdLRT+PKyDP1UKBkJyJe8ItBKAlf6uebBiizdOI
         wHsufD4dIDbk1dPkJDoDzRCjJp6iz+aZKutgXx7c5q9m1I8vrZARLpqq9BKqNjGxbLA5
         zLAw==
X-Forwarded-Encrypted: i=1; AJvYcCWYw7FZitSiT5JBQ9oVrAJ0n/gtOnFzvDohKOxBny8ZY1lVk10yiZ9UsxpJxPJkQu45qQYhE554DvgLmq9+@lists.linux.dev
X-Gm-Message-State: AOJu0YyorJUGS4/PBSbpJXsowhbGJKVGOoruRF2tZLb9erWERDpQ6MDD
	0XBd89WeVBqbboabmj6lo63fccc8HF5P+El5U0S8iAD+xFBQXIi5vdCTaxgcCFakkpWDRlPwiLT
	qhHaonpLWXgPRY/UD3fksh8IIM5OfMy2NmxToJ4bZpw==
X-Gm-Gg: ASbGnctfQ02+9+leYn05O5WVcJwhEbaaI1rlBYa35sxHUa6JOaqfhOO13imZaU9Oml+
	TRLQrJDHP6Lncqy7jKJXOFOUZX9v0W9dxz9W7V0evZB+rkqUepaydXx64OJQILAKZAlP9XSnnXP
	etLRRzv3fOosPZy/vzbIkDY+POdAcbNefnOeZw1eLHuqk=
X-Google-Smtp-Source: AGHT+IFHkwtjvOJNCrFEWstn9L634lZ8TSAnodhGn+aKzDIVOJMa02nwLbdMCDdRl+xviZehHHIuiwGlHeUOdx9D6us=
X-Received: by 2002:a05:651c:214b:b0:32c:a690:724b with SMTP id
 38308e7fff4ca-32cb968d882mr10090081fa.19.1750791491756; Tue, 24 Jun 2025
 11:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618095858.2145209-1-demonsingur@gmail.com> <20250618095858.2145209-5-demonsingur@gmail.com>
In-Reply-To: <20250618095858.2145209-5-demonsingur@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 20:58:00 +0200
X-Gm-Features: AX0GCFv3Y0xzvM4_ytzUY9wWsLoaPRcLNq10rxfdsma9gTvF5iQYKz-0B24NXH0
Message-ID: <CACRpkdYwBAaEi--y64oVwVcAMH9z0LO5ZG_fvNK-CuxdERiYBQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cosmin,

thanks for your patch! Overall this looks good!

On Wed, Jun 18, 2025 at 11:59=E2=80=AFAM Cosmin Tanislav <demonsingur@gmail=
.com> wrote:

> MAX96717 is capable of configuring various pin properties.
>
> Add pinctrl/pinconf properties to support this usecase.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
(...)
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3

Would be great to have some SI units on this? Like how many milliseconds
etc.

> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.

What does that mean?

> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,gmsl-rx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while receiving value from GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31

Maybe add some words about what an GMSL link is somewhere?

> +      maxim,rclkout-clock:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Clock value.
> +          0 - XTAL / 1 =3D 25MHz
> +          1 - XTAL / 2 =3D 12.5MHz
> +          2 - XTAL / 4 =3D 6.25MHz
> +          3 - Reference PLL output
> +        minimum: 0
> +        maximum: 3

I'm no expert but isn't this something the clock framework has some standar=
d
binding for? assigned-clock-rates?

Yours,
Linus Walleij
