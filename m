Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228CA3B3C00
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158914; cv=pass; b=KxvXtAfFogDUEzF05UqiLbDs0A1jb5Wm/cUvV/YzP4opfD01VlAfhIFAWYPOpTj6xVBWxk+6eUdowoCVwuUS3ePZEepZCEAH0usLMQ2Mp9OL5RNyVn8HxzKKPGziO1ALdxDHUL5Yo3pC8Mn5jFL7LMf6H50ioVk7+gSLStdbPkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158914; c=relaxed/simple;
	bh=S0tgmUHkcrWQ6G8DB2v4KMGgpg0DX/f7SeHE8XinXvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIeZBL4c9bOWOOTaowK4wN0ksWTz4pHwYegCqbTJRK6jhsW4L4/N+4tKAQWpGzNgYxSMXMmxEXlLpktJ2+Jlt1z71sKjkiAVzwQYiTgdc99nRoUf6xDZYOlBSHT+VzXwtG3Q/Va5OVMN5RGruTtnNA+pQouksiKMT0vFTzr9tK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1B95R7T; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1B95R7T"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9841aecf72so684601666b.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776158911; cv=none;
        d=google.com; s=arc-20240605;
        b=jYz8da22XbeiXZfn7rvlY5XFfJLeCi5pl4z9Rxs8ExPuMut+SL1IewkRQ2OsQUhUwH
         usnX+fOQjy70m2J/UtvNR1MjokL9JU2/6YQZWP0cG/bWeesVFjPhBs1VDFSUxVvP9KZB
         A1s1UVt5+xL0HdWgq+O6OIklu3TpfZXK8jofMiNavcNwKjqzZBlXWisCwP9qbc9pXSOG
         uyCzGA15jeabanhpLVsSPL0xIMdZbDlcmwyPvWTDp/CPMfreCN3zI7HzaQLNscc2gleG
         zVHylTjuRH2uUu+iRxVzto+42+WTPg2zsCpQ4g+tR47bWCfEUelimullEuFC5BTMlyqr
         cMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0c17HBzzMbEFO8QMpld+K6t3UX5CRd9Uatl/nTsytQ=;
        fh=3eyfyLiDRjnDxxRAm9bNMXHskUl6v+RrdjoAHYriK80=;
        b=JecR8z9D8tUtmkKO/mqEVCN3wV3s+FMgQjkaJBs4FADw2k5Oq6uBFwRe1UkrSsDMQs
         G+Wv+0NvtpG6DfTcal1U9fZwHyOF7PqpTUHLJmYaw+qOMUAazUjSCgEp9IB1mz7xQBzu
         wTh4FpqQY86xYKrVcOv1+Tcnrh9VUP93lbEUPpgfOlwpa+NrOoL7Ewl8l9Yf2SCu3cGb
         bbZHhuKAEhRWzVIplTGbegyccSw8MU1PeI2GFeY3hbe0Y1IJjNnedVgT7JaCtIBhOvLK
         ImN0ip46BIexs0fbIl7248E4reixuNBpnRAs2S8r0/Kff8LTCb/45ZSvyJPSSR2mva9v
         1FlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776158911; x=1776763711; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0c17HBzzMbEFO8QMpld+K6t3UX5CRd9Uatl/nTsytQ=;
        b=K1B95R7TOATx/tah22M3Gz8iz3Kn+t4LBVNFH4sHE1VKTD95G0cHzZXpmPPw4S96Xm
         bO02LBUCXzScHMkmyZYEExwsmP9VsbhxMWvM5I0Mwm+alOPIsMqsIHIAjzfaX1CF54zD
         U577ZGfzpkJZ7Vyy1juAEY6Mjl/5T0I29PgZpUMUKiTTsILcm7apjBWYylN0GKUO2VIY
         zilpNEUjtz3Oxchzq2x0asONtDJ9jboh+3fZE69ZePlQOoCBzSwojyhv0fon0e7twvrd
         VyjXj89aF86H/F93qiTSQzIYQ5vt+yN4ZkpTiftfh4ggHSxcWRC2FJ1vxj+Ii4TIcVlw
         Rh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158911; x=1776763711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0c17HBzzMbEFO8QMpld+K6t3UX5CRd9Uatl/nTsytQ=;
        b=RW5/g/pD5sAHj6u69DBhbVrEFFhMDz9anoq626oQVYfzEUCNb4454Eh5M7cSV/Txgh
         pT96d0Sqy2bUMv/ND5gWlc1hLW3H2F18OITDgtB1dIGObxGFEzAu1rH+Jy7fpBnca3zf
         HRQYMzvdzzzLo7UkHY3q1+ukyQhZmCV+V9g0wTGn8RFGBPVYCi1TEEfb54Lz9h1243ig
         TxISsgMDanfBoanx7i1Ac2EWV9vvvPjRHlCkq+xJzfldqYaYUGtjm9RNG422XUGvyIBM
         d0+ofg/b1OzXvCgyLiHRrouqGcvwWcOqimuhXjyvdDXu9z+Ge8ovMpBqW0oxcBY9plzQ
         PBgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Wv7emlPUxkgqH6yGkdLRf8hr2/kqd1Ye6boeApxZRyCUSiYcMJZwEIGdjD1lZP6pMgai+JyFEEn4CI6gu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy156POKRQ0f38Px9Dmi2Ku4yl0e+9x5BzVwhCyyJ9lNa7+oeKE
	b+8GY6CbMo5uCeA80BuFlOHIFP9nslrjN4gx/9FFej1kin4xi1BuKvYqZNuekplj0025vVCgdDo
	XP6djwI8JtVgFmbZiPa8SDnLBF995YzU=
X-Gm-Gg: AeBDieu/DAetBwm8x345VqJRxgWoJsgQVyI+HSX3d8bvBfc2y7+QWqo2si+b2lhZrk+
	xBa0VwfpFxEI2p8gH1vCiZzb7WLJPzp5C578YTZym8fonzJVEpuy5QbglJ4fW38i7sJ/AdlJyRQ
	LMYAAVTCnCSiDGHzsLKX+5Xcy34V4+1kN+fF6a+YxM4oXH8g79Rvj8G4ckbOHVPps/AMxtHo2G1
	0yb9TEkkF47ERcHJ6m1mqu4OZ+iB4ubCutejPQHIMoK5q203MuhVcMvZx7i7HJciNImksX62a1E
	fV8UnN9pgknM0/hZf5sk/yjqr8XzggpKCW1CwYfvSqJm9qALcxoZDl1UGxOUIBQxxQIe/8L2hUK
	ZR9AwFMc=
X-Received: by 2002:a17:907:1c1d:b0:b97:cdcb:a296 with SMTP id
 a640c23a62f3a-b9d7248ab05mr789863266b.19.1776158911306; Tue, 14 Apr 2026
 02:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413112904.98864-1-feng@innora.ai>
In-Reply-To: <20260413112904.98864-1-feng@innora.ai>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Apr 2026 12:27:54 +0300
X-Gm-Features: AQROBzCR8zLKYAWLihhcXz_VskeGU9AEe4QbGCQP9GPOjDs-hPQDGrtnJ9YqQ4o
Message-ID: <CAHp75VcoNkEQs7QQLDg8xZjdouNc8Yc6Vjg+Pdqb7LViqSKysg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: use kvmalloc_objs() for
 overflow-safe allocations
To: Feng Ning <feng@innora.ai>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 2:29=E2=80=AFPM Feng Ning <feng@innora.ai> wrote:
>
> From: feng <feng@innora.ai>

Please, make sure you have your full name being spelled in From: as well.

> Replace open-coded width * height * sizeof() multiplications with
> kvmalloc_objs() and array_size() to prevent integer overflow in buffer
> allocations.
>
> The atomisp driver computes DVS, morphing table, shading table, and
> statistics buffer sizes using unchecked arithmetic.  When dimensions are
> large, the product can silently wrap, causing kvmalloc() to allocate an
> undersized buffer.
>
> kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
> on overflow, so kvmalloc() returns NULL instead of succeeding with too
> few bytes.  array_size() provides the same overflow protection for the
> two-factor dimension products.

...

>  #include "sh_css_param_dvs.h"
> +#include <linux/overflow.h>
> +#include <linux/slab.h>

In the previous version it was located correctly IIRC. So, you should have

overflow.h
slab.h
...blank line...
The rest of the custom headers below

>  #include <assert_support.h>
>  #include <type_support.h>
>  #include <ia_css_err.h>

...

>                 /* Generate Y buffers  */
> -               dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * s=
izeof(uint32_t),
> -                                                GFP_KERNEL);
> +               dvs_config->xcoords_y =3D kvmalloc_objs(*dvs_config->xcoo=
rds_y,
> +                                                      array_size(width_y=
, height_y));
>                 if (!dvs_config->xcoords_y) {
>                         IA_CSS_ERROR("out of memory");
>                         err =3D -ENOMEM;
>                         goto exit;
>                 }
>
> -               dvs_config->ycoords_y =3D kvmalloc(width_y * height_y * s=
izeof(uint32_t),
> -                                                GFP_KERNEL);
> +               dvs_config->ycoords_y =3D kvmalloc_objs(*dvs_config->ycoo=
rds_y,
> +                                                      array_size(width_y=
, height_y));

Wouldn't make sense to have now the array_size in the temporary
variable because I don't see it changes in between.

  size_t xy_array_size;
  ...
  xy_array_size =3D array_size(...);
  ...
  dvs_config->ycoords_y =3D kvmalloc_objs(*dvs_config->ycoords_y, xy_array_=
size);

>                 if (!dvs_config->ycoords_y) {

>                         IA_CSS_ERROR("out of memory");

Also consider killing these (all -ENOMEM) error messages from the
driver (in a separate change), the kernel MM will print much more
before even coming to this point.

>                         err =3D -ENOMEM;

...

>  #include <linux/math.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>

Here the headers are well located!

>  #include "gdc_device.h"                /* gdc_lut_store(), ... */
>  #include "isp.h"                       /* ISP_VEC_ELEMBITS */

...

> -       me->ver_proj =3D kvmalloc(grid->width * IA_CSS_DVS_NUM_COEF_TYPES=
 *
> -                               sizeof(*me->ver_proj), GFP_KERNEL);
> +       me->ver_proj =3D kvmalloc_objs(*me->ver_proj,
> +                                    array_size(grid->width,
> +                                               IA_CSS_DVS_NUM_COEF_TYPES=
));

It's better to have the logical wrap, exempli gratia

       me->ver_proj =3D kvmalloc_objs(*me->ver_proj,
                                    array_size(grid->width,
IA_CSS_DVS_NUM_COEF_TYPES));

OR (if that is too long)

       me->ver_proj =3D
               kvmalloc_objs(*me->ver_proj,
                             array_size(grid->width,
IA_CSS_DVS_NUM_COEF_TYPES));

>         if (!me->ver_proj)
>                 goto err;

...

Otherwise the patch looks good to me. Note, that comments apply to the
entire change whenever it seems the case.

--=20
With Best Regards,
Andy Shevchenko
