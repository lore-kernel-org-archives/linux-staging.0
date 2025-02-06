Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137519E98C
	for <linux-staging@lists.linux.dev>; Thu,  6 Feb 2025 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867251; cv=none; b=B8gcNLXj+H7vkSsfwN/tXXCAPOU6XajvRkFxFbqIYYeWcdhbD67qQSmvfjT6Gyg5wV0CFcMDmRTEvR5eQ1Acc07QC1LBGT+/fZzFuVLgXDu3asjNLX1SQ8UR6trXOZxSE32eG+H7BwXSA1f3qbem/hzmyUVKL/iFMJUGLx/O6sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867251; c=relaxed/simple;
	bh=Lf6xAoUU7NXYgLYtGsalOIOw/EEkhs0Vm3ezNCm6rGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huODoQiL+Vxn+ZXznVa/r8myXVlzZw8QH/iDZdF0lC16jAWZFMFxX1moLA7YYoy95kW50wmVVOoHtaZAp85pdPm1egnaluTWfXV+RYZnYtgPZuAyPCYc6RS3OZSYSbHOra2aKEzELL1EALAPhcNmcbEeMUQmpSnWWtOk3pUseO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wor0SPRB; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wor0SPRB"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30229d5b21cso11111091fa.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Feb 2025 10:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867247; x=1739472047; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/1KLNT4FmOlGoDXvAF/z9DFY3XvpbckXqXugGtWIbQ=;
        b=Wor0SPRBo9Dc9me5PdS3DXdSUOxnaSIzFjbpKADuzle+CYj1pzhIa/MgwRcTmhaK7e
         cb/vzpaOf7Yg6miisjkjYslwBAhThw6I8YPQhR5MGVb7ys73mKeHp47iMi8GO58UZ45+
         43nCFkyCEBD0injEsgLIu8IQsbT3HVmZsewVXeyCGlRaiCnKwpysCpLoxR7smXhpsvZV
         6XrIXT4wsYr7PPTx9xGtByMh22Hn72PKGp1VYAwnTwvtxb6vcmg3m1gBUeEZ2hxO8YZn
         OG09s9SJpRvYJ3RIHBoM4fGXYUnfuMsjnrc8/ix2DKvdvLIsWuEThZeGtuxZwsmpqXGL
         Fogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867247; x=1739472047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/1KLNT4FmOlGoDXvAF/z9DFY3XvpbckXqXugGtWIbQ=;
        b=UG43hG8RA1mNpADyqO9rMb+vN0KIo+284gFE3hcpfzhDwMsmcHhXPF98AH25f6FhH2
         cR1M0zhnvV+A/SNQQdtu+RVYhdK48Hd5vgegJ7Exlxkw8uQgfyC+eKCiQVS0ZJMiFXXC
         t2R768X0HkE9+bPc8IPhYih/tBl+CSyDlcznZD9FDjU3br8W1BXrS9cf7+ssJbBO4M/a
         64d/wycJyi+MVai7aKaA9fWWP2HO773sTf8bNtdLg7L0G/QqeL6BfyCTxK34pJMPUYeW
         bEer3p+BzfClpXt0kHC/LRwDAHjdSFRDkU9yzSZwORm1IY2P3YdnkJPOH6aes5YLBC1X
         D5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXvIY4dHB3RDkchQP8byBol4TwZu0YtSgMnA+JoVNzqDtgaOPNhdy4F/9JcM84TBAY3kIPmYh+KRU+oXEAP@lists.linux.dev
X-Gm-Message-State: AOJu0YxKC4cK2ccFSZxSNUuFnPT7b44T3NmrdVc0+SEcgjZXyhTRSj1R
	kKdLwEpHwc6DbBTronMBSOb9PNObdpcz6JAvTwcjbFDwbgcQAUYJ6nBW1Rp4ZS15hMbL1XZiSPI
	wqqmQ6yvq1LPVjF+DIo3jfTe2PwAxfPQmQ0gOVA==
X-Gm-Gg: ASbGncvcQBQYcYK5lECCanPmW6RcBCWUUoK3PwvMzJmdS3NwP0/ZOUGMT72tT8t4c9C
	n06vtEh+tadYC5uwMpu30S6Q+Tso6Rv9hO9yJfvlhsWZWcP0Igc+iJG/WdIbQS/V45GrFZss=
X-Google-Smtp-Source: AGHT+IHspHnGQVYfpoYQGi9ctVZueJrpds613XgEY1o23R9cbS1fqYkeI3XWSr+wkrN1AUux/D6h/Xqji3ktxx+ndmY=
X-Received: by 2002:a2e:bd8b:0:b0:300:38ff:f8de with SMTP id
 38308e7fff4ca-307e57fd2f3mr198711fa.16.1738867247273; Thu, 06 Feb 2025
 10:40:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com> <20250131163408.2019144-11-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20250131163408.2019144-11-laurentiu.palcu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:40:36 +0100
X-Gm-Features: AWEUYZmtqR_uDonJm17O7Egr0R6Qg4Q94CdBZrZSOSqXSwlcXN7zzDhUzAF6Dck
Message-ID: <CACRpkdYo9690n57FYAM1heSU+zGTKuze8B3d+Q4Py=HJr34-Eg@mail.gmail.com>
Subject: Re: [RFC 10/12] staging: media: max96712: add gpiochip functionality
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

thanks for your patch!

On Fri, Jan 31, 2025 at 5:35=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:

> The deserializer has GPIOs that can be used for various purposes. Add
> support for gpiochip.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Since you are using CONFIG_GPIOLIB unconditionally you need
to add

select GPIOLIB

in the Kconfig for this driver, or the autobuilder will soon start to
spam you with compilation errors.

> +static int max96712_gpiochip_probe(struct max96712_priv *priv)
> +{
> +       struct device *dev =3D &priv->client->dev;
> +       struct gpio_chip *gc =3D &priv->gpio_chip;
> +       int i, ret =3D 0;
> +
> +       gc->label =3D dev_name(dev);
> +       gc->parent =3D dev;

I don't think you need to assign parent. (Default)

> +       gc->owner =3D THIS_MODULE;

Or this. (Default)

> +       gc->ngpio =3D MAX96712_NUM_GPIO;
> +       gc->base =3D -1;
> +       gc->can_sleep =3D true;
> +       gc->get_direction =3D max96712_gpio_get_direction;
> +       gc->direction_input =3D max96712_gpio_direction_in;
> +       gc->direction_output =3D max96712_gpio_direction_out;
> +       gc->request =3D gpiochip_generic_request;
> +       gc->set =3D max96712_gpiochip_set;
> +       gc->get =3D max96712_gpiochip_get;
> +       gc->of_gpio_n_cells =3D 2;

Isn't that the default? Do you need to assign this?

Other than that this looks good, so with the small fix above:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
