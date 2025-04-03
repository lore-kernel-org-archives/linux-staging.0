Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D719CC3D;
	Thu,  3 Apr 2025 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743657567; cv=none; b=Pb+cFAzYGTue7+oXTCLgpEz51sGij9dGFS3jpJ50XuwgXjT3TSTFcRJyvnYGcQDc0Agg/l9clzPaqu/McTtg3bUJRc1IViGc1RN+FeEjfZcBskRWuueIhEsK94HMVpjVcHTDvgmXqVmIthawsPHgTejDJ/8dQnU2sMNuCXv9ouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743657567; c=relaxed/simple;
	bh=LBDXDYPwVBltf6WpjfM/sVy0wUZu9uYUl4MhDaGqzfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ei5r5IzzAhRGCpYFKJ/fGmCcuXZZj8CzfxPOmBkfVZT/0QU4144htHMx8CoDdNaAioDToQIX2eaTcFZpHZhLiPMrqJLi/Fs/waEiZorDEn4yFQwB7kpQ+FkRTsSSVlT3xG/Ein5SIGLcaOC0io05Ufy6cOy4qDEK4lAHyXzrXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVh1/fY6; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVh1/fY6"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac34257295dso94245166b.2;
        Wed, 02 Apr 2025 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743657564; x=1744262364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E+iZYcCPNYOvmbdSSEK90MoKd4i8WPkQ7UDbg2N7Zw=;
        b=eVh1/fY6OglWjg2JEiekONjiupT2pcIgGVn98kwUifVcJxq42Bwy+WvXt7GlGgWBL5
         QbC+Xo0h6y5b68GxS6Yvbf8cr2RmZzOVUmRqC+kjp5U5E0XFProMv0nveonXRi9OKr4o
         fPEaj0LVcbDfrG8Iz1HQ3S4Ae9JPGt3R3FHaGNn0J/sRtK9PSJCwsTVQqsx7kLZ5vNRI
         f5vmQTzohzuQ84xLdJVtOJmli2n80sShnK8febxpX/F2OyjgjNwSgkNkxY1DQGLu4heT
         sq5uxMVUsDJWzCKiQNi8Jx4WNTN+HH/IG4gg4ThBZWQ/boGka84yz+vM+54hmbG3alXO
         /2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743657564; x=1744262364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E+iZYcCPNYOvmbdSSEK90MoKd4i8WPkQ7UDbg2N7Zw=;
        b=jcQvgcsGUTkuPX2sJfVGKnvaW13P92/lCzKZxIbxR5AdgC1/YPMeUyz9+BeE5rfNg2
         d8pq41LYb3f4qO7YUAtMLnLOh/78G1g7bj6sDqpBfz56nyp+4YViYylA2ertjHKeE/9Y
         MEhWj+cUBMpchF+S+1R34qdD8nM3t8pj101PSmfBuxpaUtPcJzBdysuk8w2C9vCiD8he
         KcYWjKp5TGDo6tj4VHGZSzlb7V3FigGnnvmF58p9yHjDiasT/t/igKCJP0MrQzAYenjV
         XWWVFx7LHDLZ1qp8Cmso9hvXAy7XNFcbeRTFgMoIv9p1jNmN2reCyY3aHwrj54qqKFRb
         lTbw==
X-Forwarded-Encrypted: i=1; AJvYcCWQejHc08w5Lbj7JpwX8WoJEvQIB6FWwvLs0rAD5DIVbNUnedpjLDjNnPhVv9PFpVxRdiejzpdQkEfleidH@lists.linux.dev
X-Gm-Message-State: AOJu0YyTcpvqy3Iv6XnETYyOo5OV9KLYcRhT4E/wKI2/ktTzaLatWEah
	fzulFT6LBuLWXpH45HSL6aPYsNd9mzesc9LBG9OoZZXNRTth+kaw9/NBHHbq52lBm3EIikigh6y
	dC5JmuM+fyY47L8PzyoozsaueNAg=
X-Gm-Gg: ASbGncu9TNn4lM8WhZcGi6BlgsQY2oYhHWAHNmAKqdb1XJ9AxbAmTIAiWWirrxvSB7b
	o2Mzw/dAnJPmPOxD4RAN3zTXmO+tWsdHF3Rs5/F058rqF6g2ae1LD5kk/OTJxlQoNzhWfvUtb47
	62xzkXMGXi+BbBAour9pGsRhundA==
X-Google-Smtp-Source: AGHT+IG5EbBLfk+a++Lf1d8KLuWy5t9OVqcVAdEepuVcJDL9Q2EPpXL8y9V/ZJv+B4xR2onXjAG+ZpfsrPoPmqJ9TeQ=
X-Received: by 2002:a17:907:7d8c:b0:ac3:1373:8a3d with SMTP id
 a640c23a62f3a-ac738a01edfmr1554380866b.20.1743657563398; Wed, 02 Apr 2025
 22:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743635480.git.abrahamadekunle50@gmail.com> <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
In-Reply-To: <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 08:18:47 +0300
X-Gm-Features: AQ5f1JrAee71IeO5RCFI5zeCzsyf3Lq4mvs_EnjRXEAk6UlxP5mxjnKIxryxluA
Message-ID: <CAHp75VcT5OBxo2jMTYK6Vw8MB+h+jBWT42GVtS27YTkq-JZoLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: Remove NULL test on an already tested value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:30=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
>
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.

>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  drivers/staging/media/av7110/sp8870.c                     | 2 +-

Please, split this on per driver basis, as they have different
maintainers and trees to go through.

...

> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *d=
ev,
>          * if it founds something different than string, letting it
>          * to fall back to the old code.
>          */
> -       if (cur && cur->type !=3D ACPI_TYPE_STRING) {
> +       if (cur->type !=3D ACPI_TYPE_STRING) {
>                 dev_info(dev, "found non-string _DSM entry for '%s'\n", v=
ar);
>                 ACPI_FREE(obj);
>                 return -EINVAL;

This change is good.

...

> diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/medi=
a/av7110/sp8870.c
> index 0c813860f5b2..8c5fa5ed5340 100644
> --- a/drivers/staging/media/av7110/sp8870.c
> +++ b/drivers/staging/media/av7110/sp8870.c
> @@ -508,7 +508,7 @@ static int sp8870_set_frontend(struct dvb_frontend *f=
e)
>         }
>
>         if (debug) {
> -               if (valid) {
> +               {
>                         if (trials > 1) {
>                                 pr_info("%s(): firmware lockup!!!\n", __f=
unc__);
>                                 pr_info("%s(): recovered after %i trial(s=
))\n",  __func__, trials - 1);

But this is not fully done. Why do we need to keep {}? Just shift left
the code and remove those {} altogether.

--=20
With Best Regards,
Andy Shevchenko
