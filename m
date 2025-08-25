Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B8130A73
	for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106723; cv=none; b=uXuBre18aS2wLq5NSJDNX2xGooKJ6fkmbM0R2zDKtgxaC17XfT/uC4Uv6MrjqUbE8lyGfmguWzPx/3SVDVdVbIZVgjIxJU6f9oIryJjxeqEfnkgus4z3jWqM7yXWkMwjx8FuEWU/R4ozHke9LWzlQFs7CEvxOXN4YSRY/RFk5AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106723; c=relaxed/simple;
	bh=C1Jwe7SEYGbaPWwABKag0qTiskJafE866UuIeQ2vBhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKG7IdO0Pc1OXZqAfKN3yE3jUZxJM74eJkDfZjxPl75RjayKMYfFlSpZ1YVWK35TqZD+QYSqX+ts4TvGyebb77qopHH8cY9Ohnrrut+Z4K/FOZoj5cKi5jeQyCXtu4JEiuGPraq0k3iRSDlKR9IptZ2YjROW47yzCItoLfZc/gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fY+ZQrwY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fY+ZQrwY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso596168066b.3
        for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756106720; x=1756711520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXwmDm0jwcdMF+1aml2jZ/twWNGaZ36CwgVMBAiyBUk=;
        b=fY+ZQrwY00W6F7yJTCo7m1jINkw1JYk4Ga6LgwKblw/Ae+aBd3HthsAFF4xNZM8ik6
         Qynx2POYAYkaHDeVs1bR6PToBIYGgLzwEHIazUWQcejts8BilGMNAf8mueqWpLzeGEk2
         GWinl47wfiUxW4b/MWQlIp44p3+3c2dz+VY0/RU+r0gR0aXrZzypVh/EWZWlYGZ4ZQbD
         1sE2x/MjeWceyEJWFMrHqYYc9eM/c7a6fLBODKjIJW9RiAuTkOubo9Bs5zFkBvVMYXb6
         VWH8Gh3/NWerTVZuhs8Ij/INy4dKOOzwXEHojwE3lT/unyli/vMZqv/2+MKeG2bjnfpp
         TprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106720; x=1756711520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXwmDm0jwcdMF+1aml2jZ/twWNGaZ36CwgVMBAiyBUk=;
        b=OutRmehQyTKaD+cfsih/Embqpxiklca82llDzyL8Zy4KOyBOmGHUcj2Y0AkBMGUre6
         WWNJUB0J8dXEGkGFpweXXPwX9j1QcMXRCJXffmw2JwxXEQ77Z/eUSTC3NVm5fBi8okmM
         VXIWK6j9Brrx1k9zEO+7MyWx7lfuOUZU7gd3eeFN5q9ZTz9C7YFSpkq2c/cuksU4TgNE
         snK5KawT21r7NFiPrfgDjiNLRnJYrmgFT5deF41YtNAEKYrmEITdOI40N7hmFwjlqjaO
         a8ycdTlmWi73OxWomm/GX2sqIvF7F9iQSVQ5SLjVEGuD+jiXLfQ9uiKBscOo3eO+eB+C
         Xvrg==
X-Forwarded-Encrypted: i=1; AJvYcCUF/FygHFcthZfxNnQB/w2QVN3+LmoEFDDWoUxklgmxbtlV3WOn46jvPTHtSb1EFmLn9wvgYPu0JL91neWr@lists.linux.dev
X-Gm-Message-State: AOJu0YwjS4fPN7XEM2aWZoYf3e7I5vU9IRNL4BvRkyn09HmurXX7daq2
	ytP2Pr77kGJ0VkVPHiiFAG0caRXiLVDty2B+it6rvaTgemfcoE99fpY2IX8gKJyG5ZNSQkmbf57
	s1Di4MGE0GGLJjQdpd1keHO/H3vCXKzI=
X-Gm-Gg: ASbGncuaH0TU9rIFJzas18LtXhATbaaXUHxNAvyn7j0FZH4eCq4IQX1H4mY4ND7sp3w
	Hne/JUjuTvHqPffZf9x9pRbtxGG9WS2ga+yzhZ3LCs0TIKuEPsB4fkXn1yQ+1HerD3dEVaiolFe
	ZwqZ7efMVKYH4Sls3DkvkjwJ92T18XmRxOfoP0FBJVvjeK0xVH9BHlmy0+m89SvHtNpJCuMjbbD
	H4bBlg=
X-Google-Smtp-Source: AGHT+IFAfstrjNTSy+zxUMo9sweg9FrlyPV/a/zIOtTyu6FO3SUdw/jRQMtzpvd3QDf5fW4qRv6zh2RmmNddFiGIiSk=
X-Received: by 2002:a17:906:4ec3:b0:afe:74a3:f76d with SMTP id
 a640c23a62f3a-afe74a3fda1mr281251366b.16.1756106719408; Mon, 25 Aug 2025
 00:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250824150656.2387516-1-chelsyratnawat2001@gmail.com>
In-Reply-To: <20250824150656.2387516-1-chelsyratnawat2001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Aug 2025 10:24:43 +0300
X-Gm-Features: Ac12FXyUVFfIPQSqjxdn30gGhlenP2UYN6P40UQcEy83nkbUBa4f1SQpLMPrS4Y
Message-ID: <CAHp75VeskiXhCYZZjOVYn=_d9Uo51RyXu=5s2yt-5FTWi1FSGQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Use string choices helpers
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, tian.shu.qiu@intel.com, bingbu.cao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 6:07=E2=80=AFPM Chelsy Ratnawat
<chelsyratnawat2001@gmail.com> wrote:
>
> Use string_choices.h helpers instead of hard-coded strings.

>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c     | 3 ++-
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c    | 5 +++--
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c             | 5 +++--
>  .../staging/media/atomisp/pci/runtime/binary/src/binary.c    | 3 ++-
>  drivers/staging/media/atomisp/pci/sh_css.c                   | 3 ++-
>  drivers/staging/media/ipu3/ipu3-css.c                        | 3 ++-
>  drivers/staging/media/ipu3/ipu3-v4l2.c                       | 5 +++--

Split to two patches =E2=80=94 one per driver.

...


>  #include <linux/platform_device.h>
>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"
> +#include <linux/string_choices.h>

Please, move this to be in the group of the generic headers, i.e. in
_this_ case it's expected to be

  #include <linux/platform_device.h>
  #include <linux/string_choices.h>
  #include "../../include/linux/atomisp_platform.h"
  #include "../../include/linux/atomisp_gmin_platform.h"

...

> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -17,6 +17,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/bits.h>
>  #include <media/v4l2-fwnode.h>
> +#include <linux/string_choices.h>

Ditto.

...

> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -8,6 +8,7 @@
>  #include <linux/mm.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/string_choices.h>

Prevent the order.

--
With Best Regards,
Andy Shevchenko
