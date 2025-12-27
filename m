Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8629408
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766844962; cv=none; b=fz/USV4rChyNHfggBE0j662lS4V1b6R5BVkWCXt1tO4IERZEE81vSOvlN4IhyBFgs+YLaEeGwmz6BsyphNci+v36EhYaPYNhlBTHWySI1Mo8oF4MIn+7ay7a07jgVI37b+viBK3AQeoFNErX/nyNK0h/hhDjhamJCFOLKkxIe1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766844962; c=relaxed/simple;
	bh=hiQNhsW0O2LINJmqDsutnCu2EMiEeW/p3tCBUzseyS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo6PZND9oU/lLLR/E+m6vQZgzScRdUUGZv8tlnwR8uUE6PbqkmDkVkivYl19n1MFq9hbhCDK5CKyUKj3IxaQCs+TRj+jk1OGwdPIXzEGd+7uH5xwSYQ7Bzg9IKfH4b4mwJDTEpVaXc1jj+688VUQGsuHJlq+dS5lmR331sOs6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjKm2rSm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjKm2rSm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b79ea617f55so1470597166b.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766844959; x=1767449759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qeew5kbRgKn77uDh8eaOpRmb++U6/kEJVcuYh9HUj70=;
        b=LjKm2rSmw2KtpVVrpcPh9qlknTHLvDG+Ym49ra+sVNQP8vBD+i17ekC8N9iJPBXEyV
         WhbrRW1ZEBOzRTP2McPgT6suAv+g3bHoTvTq8VNwmGwdNI+Z/666OniDzq1xg751xuFF
         EtGPnEcTYaPPODjYBCPs9Hhdt94t95p/34HC+hSLWczZsZewyt4W+IiDhyAHvkn0TtwA
         d9HGmeNq8EY1RzhHA3jSQnLtcTnTqxw8w+VxrsN29UWvMQlK2D1bjTDPYr4I4LfUEAWf
         XOhC479IgBOhrAFwaMzmjaqiZlA2A/1iXSSIWM9yhZ96ghjPDHt5jgjyFvRZ609idajO
         NJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766844959; x=1767449759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qeew5kbRgKn77uDh8eaOpRmb++U6/kEJVcuYh9HUj70=;
        b=vmBiK6TbaXSt6kQ5b7wWxWk2A1LmpWM6xWUNizFH9jfXL91vvhR6gRKB0P+aJu7kqe
         J7BVhuLx3wlmxux/MiluYopyZ4Ym4b/8y0uUzLsvQUcJ6h+N8YlYjJpJm2z7mirymlRc
         2QgXZv9hBrDyErgnogcYvmOVvA8vG5JkgwadgXjh7XcfMgZ3/W7GPdNVMlwe77sD6X4b
         hvJ2JHBI1yr9xrP4D1GhNbkjRZCHPHGPYX36db5unjrEuhu3YGdnKQGo0k/TkiqwF14z
         +RTdiONyhLYmHYvI45CawfW554U7el8W78OkxK8FJOwOPa53lJcXiDuKai+BAdZk+42j
         dslQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMlunP4mEoWTfXPejbh7K0X3tG5MMc2BQEEJOdmbg7AkUiV9PqaIfO2R4N8+1eSzBBMPteHXfdQsE+Sulu@lists.linux.dev
X-Gm-Message-State: AOJu0Yx++TlO0mOnL1o8X/Di7S8HPKmLGsXciYJWp93ufYrwXddlF7tR
	saknimH15aoIikjTEzJv2HpFtCuUv2A52asrZ0EAJANQU430QfRmhrOdMJTP4TKfI/m6bKOQphI
	Ld0G+iWyJOU6UUruIQN4qIL1jzV64s8s=
X-Gm-Gg: AY/fxX7fn4cVb010/hVp9MoiZebobSDNNI+C1O1uDe3P9AIjhIFWfbw48PPZYR2wZ4/
	MMu5ywhy0rFIE+Kp+Pw5o10jF1/2uIkqcO1YRCW1qb3WU9vcfmB6MdbkxmvJcpWjymai6l/ogFN
	Ge7n7St3/E+psX59jBOgfYIams43PW2VAHmVHK1XrBSJuZsuoSuizCYNvS3t32iyRyK8BFU+AVS
	ZHOvaXPFUIHxcUm+GsnXTxuaUyGk8gFwnoDRvXUdw+TJqP6wboNGNN/180tw/m7ARqCjaubd9Wn
	YPTZIuDFGCjd3EtZ2QVHUe6xt+ebhYK/kfiv2qDQQ1wjn1u95jwA6S7DOBK6FZ6oci+77zA=
X-Google-Smtp-Source: AGHT+IE5XjXyiX8e5+y2/EJWJkUx9mNmIJWTZRQHZ+11Rz7xT9i6UD39yeJWDYfoSFEzyyea9QAld86n3jERGsExmoA=
X-Received: by 2002:a17:907:7f25:b0:b80:614:b72a with SMTP id
 a640c23a62f3a-b80371756d1mr2980300466b.31.1766844958759; Sat, 27 Dec 2025
 06:15:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-3-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-3-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:15:22 +0200
X-Gm-Features: AQt7F2r_BktXpE7AknVIdZhLL9UU8kDl403QzVGaeIdoMKWSeHXNJeJhHMAVJRQ
Message-ID: <CAHp75VeroxzYs7GScKMv-gOFqJz_U=561b5FH6ifdo2WQNYNyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
>
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.
>
> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
> - Use dev_of_fbinfo() to guard sysfs creation and removal
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>  drivers/staging/fbtft/Kconfig       |  5 ++++-
>  drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
>  2 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfi=
g
> index c2655768209a..578412a2f379 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -2,11 +2,14 @@
>  menuconfig FB_TFT
>         tristate "Support for small TFT LCD display modules"
>         depends on FB && SPI
> -       depends on FB_DEVICE
>         depends on BACKLIGHT_CLASS_DEVICE
>         depends on GPIOLIB || COMPILE_TEST
>         select FB_BACKLIGHT
>         select FB_SYSMEM_HELPERS_DEFERRED
> +       help
> +         Support for small TFT LCD display modules over SPI bus. FB_DEVI=
CE
> +         is not required, but if enabled, provides sysfs interface for d=
ebugging
> +         and gamma curve configuration.
>
>  if FB_TFT
>
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/=
fbtft-sysfs.c
> index e45c90a03a90..848702fc871a 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -203,14 +203,24 @@ static struct device_attribute debug_device_attr =
=3D
>
>  void fbtft_sysfs_init(struct fbtft_par *par)
>  {
> -       device_create_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;
> +
> +       device_create_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_create_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_create_file(dev, &gamma_device_attrs[0]);
>  }
>
>  void fbtft_sysfs_exit(struct fbtft_par *par)
>  {
> -       device_remove_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;
> +
> +       device_remove_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_remove_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_remove_file(dev, &gamma_device_attrs[0]);
>  }
> --
> 2.43.0
>


--=20
With Best Regards,
Andy Shevchenko
