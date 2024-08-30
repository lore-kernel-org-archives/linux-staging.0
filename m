Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16215F40D
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005768; cv=none; b=eCKzUfwNfVtRedyvyMRE0x7NReGSz9SNg5jV6q/bZlTAeL33YZ4Fsp9++ZmHNEYYoSR3CTbyGk9MPJn+EK8Sidpa/LPBZI9ClTCPvJL9/tsnhgyJTUieC9RQpf9+DxkWRs1A25gjONvObPQU+w0tcNJAghk+VQlr4DhW2CqH9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005768; c=relaxed/simple;
	bh=Usj4NDMMSuTQv4/ZNF1nZLx1UwIIHViFNSe98IS9hVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+lhpzPA599q6z1sybijYNISy5a7WSKJGlgNqh/BfbPBQ/2wjNRAmlInGzh+56ukvPp0ApyAK4keybaDGUZ0y4Cxb5yPhT+l/QVaxrLTlGuWNBHwy1H2VgzpFg1zTXTotQSEkVsKyvLJDnC1YSoVUnjGhMbFjZz95wLPOkkzeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6d3c10af2efso6665537b3.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 01:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005765; x=1725610565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4Ql5/in0ZIVOL75Q1qx4NaZGeDqu/Tw36Q8q0H0JF8=;
        b=EtJW0ceQofQJBZFVLV4QdBH9cliYX/RdrpT0PA9QWFIj0uxoXYE+zn9y7ILK3o7FwA
         cXRZnVwUHmxmaE5+CXM4N5QF9aP7sWwQ3wqGEIpOW/IFCWvSrHbcX0SujH8WJ/26lfkb
         49NhB8Nqgqug7XpLAmUyiY0xBsUP/QtfGQ6Q6XsUFMx3mpPCiSh5eSY4R9IjUQMfkPMw
         h8QBzXbuGyfcKeNL0Xv0tl1cgE2oodJcUHJCeCG93B5hFG3nlgXcVYL1hYGCkf7yGMFf
         6cgMYWollw1esds/NeyMHR0qj5gGnSxk2SfBTS/s1J6HaFb/XxIfjjE4w2CperyQOJjG
         48bA==
X-Forwarded-Encrypted: i=1; AJvYcCXLbWGVIPlLLNx8DRtPOC+aJVj0JOcY2M6b9OARb+/gbobA6jY/M+QXxIxOC9JkjMW/2U6095oJxtOippt/@lists.linux.dev
X-Gm-Message-State: AOJu0Yww9puUKZtYQ1j/uRq6ZefRrSpCt7is0g67I163IGwg4i7m6GCC
	lPLubIVIm8wyREN9NuCUdIESPIOsulvKY4b98T4h9ftELc9BuGV+1+JXXsyz
X-Google-Smtp-Source: AGHT+IFyiUdubor/tt/hDw8c4fLW/kgBfL/YvwurHmSZ86tufQULNKpdNI5msSvZLRprnu/Sc2S04A==
X-Received: by 2002:a05:690c:5718:b0:6d3:e081:fc84 with SMTP id 00721157ae682-6d40ff0db5amr9410027b3.42.1725005764923;
        Fri, 30 Aug 2024 01:16:04 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d3e9908bsm5490327b3.30.2024.08.30.01.16.04
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:16:04 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d3c10af2efso6665277b3.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 01:16:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSSZR6vm57B/py0tNGN6oMxpgPXOqnRgfNXlqv7dUwZ11eEXh5IDfJPNOZv6ekw+q2EauZwiloFJK8A09v@lists.linux.dev
X-Received: by 2002:a05:690c:6384:b0:664:4b9c:3de with SMTP id
 00721157ae682-6d40de67fbdmr12609087b3.13.1725005764298; Fri, 30 Aug 2024
 01:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se> <20240829165051.2498867-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240829165051.2498867-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 10:15:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGzK9EMneHzTJXPQiYRSpnTgP5A9_ZMeSc353ZwR4VKw@mail.gmail.com>
Message-ID: <CAMuHMdUGzK9EMneHzTJXPQiYRSpnTgP5A9_ZMeSc353ZwR4VKw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: staging: max96712: Document the DEBUG_EXTRA register
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Julien Massot <julien.massot@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Aug 29, 2024 at 6:52=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The DEBUG_EXTRA register is not part of soon to be added MAX96724
> device. To make it easier to understand the differences when reading the
> code prepare for the addition by creating named defines for the
> register.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v2
> - New in v3.

Thanks for your patch!

> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -16,6 +16,10 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>
> +#define DEBUG_EXTRA_REG                        0x09
> +#define DEBUG_EXTRE_PCLK_25MHZ         0x00
> +#define DEBUG_EXTRE_PCLK_75MHZ         0x01

s/EXTRE/EXTRA/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
