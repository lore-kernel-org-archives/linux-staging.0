Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6820447A7A
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710346101; cv=none; b=BCT2SVd0Z9gp5RHABzCwZzm1+nS7em8+6c9ULCJYPmBAiRyZwlb2vyGkvYmVTSKlS5Hby7MfuhWPePQ6WYrNREzpo3bywEmOwM1EjJ9plHwjPaQOPFyKM+RvSUA6dKp8OW9CuCBljQ2CUPBwE1lstvWEvauZQEGRYPzQ72+5ZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710346101; c=relaxed/simple;
	bh=CovmuhB1AdolpKpkG/Fj3Mesft/l/SlOhQMcpkg7uZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBMymT5WeT72BcneSXf+bSZ6hm/QtZDQTYVIhgaqSeI8/q/JvD9DBCtUKaNrqZLYdQ3ecLE0D6zlCtMQV/xYiQaLW0w9FIJf4NJqBRRPRloSs4nfbCNEnXa4NfRTEsQ06jzbvx3GyDT80wAAgpxQgkTn8lTMi6YJWC9+4U9PbVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejdtRsZG; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejdtRsZG"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29b7164eef6so36424a91.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710346100; x=1710950900; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6ULIWkqwYtQwHi0nH3X4LEjPNLviw6dhHiCy7dWpr8=;
        b=ejdtRsZGDstlJJuAj8/ZYiIm2pA+WD9Xxr6V7/669N6KRBzK/Lq0LiqRBZNVaa9FgB
         zotScGOxVk2Kpx+OG4o+PWA2dWLO+dX6hdZM4acrrvURtqG9HNjBdzcw4g4pgmWHtK00
         9hjZ6nWy6f3o12RfsUw52SBpqZi0r4uKiP8WBeUn2S2EgsRHix2YS3DlWWKXHFudSJSk
         lSVeAqmDXwm8hrWGMYxZsMWcLn+Gn0i4NAfSXcNWaZcSqgrvlNzXraYCvr/DQ69zZSXK
         NhGePLrfboIEzlU5Dq2neiQ2qciIYDIlfq8Xyw3BSw5BbkaKsORkjeqcEeVnZAP21rKB
         bg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710346100; x=1710950900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6ULIWkqwYtQwHi0nH3X4LEjPNLviw6dhHiCy7dWpr8=;
        b=TbSAUQk7MJjcd4SHulml63OPNyaeRuZYp88Eng49WXLme/Bvo9BfoSxYnkEtjiJNIS
         lQjga8ua20AVBXz6MwLSqtbR/QLyEKF+QyuAKOZzSu0sotYJfkm/FbLUssUIQH8+CDJu
         WphvCHSjByJrJEfENqNz+87zVQrpvFjtjfaUjxAlRJwFoySPvzFqWzDmSLeExHYI3P72
         JCFDeS8f26qPX29/TnQ7SrUBf9j0yubEiODqVns8IWtNN1qx9T83CuEj7Z3cfOpBM8DM
         sZui82pfjpblWTfErVDrCV1zU5/gbFhTsVPJTxaCY6ijg0+Ns2M92Viv122GZ90pChth
         Oe8w==
X-Forwarded-Encrypted: i=1; AJvYcCVzjpJpTV8HkoMkJArL8uPnYM3sU/aICSO707kd84jlmWTUvq0sZIGNUXedk1hFCY5Nh0yLdQCaEPWBOmqwWYDb7Qr2WjynZRdfB+cPjQ==
X-Gm-Message-State: AOJu0YxJo8rFomraIgC+xkvRoOmE7raAQGJWFZ1kKoeaYI7US2u3MlVa
	B+FELK3uv7nHROSb7dO+FU4FsIbBQBtfCO/Wbrbl4gyojHBC9l3eJepyD8vFDMffW+VPnf/2zBZ
	iKshfJQlNceN0DAx2scqRDmOdsLg=
X-Google-Smtp-Source: AGHT+IFw4NlwXdq8k5AaP0t6MV8Oqx6Tr91pjx5TGQukQAekNWRrB6XIh8BPrzA3MuN0QBTfxmlK7KxNwQu9LllcLBE=
X-Received: by 2002:a17:90a:a008:b0:29b:bbde:8f19 with SMTP id
 q8-20020a17090aa00800b0029bbbde8f19mr3568139pjp.33.1710346099732; Wed, 13 Mar
 2024 09:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de> <20240313154857.12949-2-tzimmermann@suse.de>
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Mar 2024 17:08:08 +0100
Message-ID: <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	deller@gmx.de, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for this!

Cc'ing Andy and Geert -- the new maintainer and reviewer.

Also, a couple quick notes below since I am here...

On Wed, Mar 13, 2024 at 4:49=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.

It is not exactly the same logic since `backlight_is_blank` accounts
for `BL_CORE_SUSPENDED`.

> -       int brightness =3D bl->props.brightness;
> +       int brightness =3D backlight_get_brightness(bl);

This can be `const` now (or even removed and have the call embedded below).

Cheers,
Miguel
