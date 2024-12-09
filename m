Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BF113790B
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733760095; cv=none; b=RYUAzxEhH59vsBHwk9PVGGapQmIGScPqhFIKFuAJmbCtZoVIyeUn212Y7ymT37xisF7S7TCs85mmn2IzpGbRo8N74NSKYwuxoM9gzJHWr8eYoaddlircFiKW/7fvc8cFQZa4iWg3qsEjP3Rkm4LSVR+SrE0yLB7BqqvBtX1nJw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733760095; c=relaxed/simple;
	bh=YsmaQZZ7aHri0xZQmOreW0h9HuMwh4f8ohWOs2dBIjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8GgfHrwnwz5N5GJbO3y/E7uUDCkukfbSAxzsZQi1hghhI0rZIOLLCeGed8ohlcXbpj+Pab7/t+Ub1NQl7As8/DX6i+N6+Kf/uQiqiboIUjM4/SpQ5ylk9kjAIBFJvm5L/BgzU7Ifs8EI6JztlBtFvo0yPTYhjxLjtdfcv78Aew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3ea696c4dcaso2301760b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 08:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760092; x=1734364892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k77S1jSFGUUPDxhYWlw8l8v/eJWaaEdCFshjetT2cAo=;
        b=bRsfSuZm9L4w8CgP459omR6gALtja4A+YWC4MFdOZAYB+jV51GzGSw5Hh3eJKbPAtu
         t6ivR7Z0oU6ay8RMbj9oPYq0/RHQe2AsKx1kOx8dGKPynGQwqB5P3OtgXz9jwyt2FcMB
         9+zi0u8n3feVi3vRpVPrZafS4RgD6XAkqKT+Bug25SI/R+b8ZgfsQ48MR+voxEiVElC6
         eHr0+5eAltARrouXfu8Ms74L2KYrDOqhoa4qdL5SE0niKD/Fv8yF356aahvR2QsbPjFi
         BGWFqkYYcQnu3GQcAWcnb4wOb7s9k5hbVJ0wip3mcaWmyM/8BoSAZbSGM9zuJtCDJMLR
         8fPw==
X-Forwarded-Encrypted: i=1; AJvYcCU3lpnJNId47k8Nbc6xChLwcOng/vIc+0ibpRpOAUW/0aOUtMO+/bgh3hz5uOeqpJeJAOrsyjAgrGXMeniD@lists.linux.dev
X-Gm-Message-State: AOJu0YyfT/R26VAFssUXP5N4Ary5unMtajObU7KmHPXvmln2CsxW3uuU
	WJIl+gUrwFICZK1UIbAH+QZ8AodyF2lPgFDXSNOLEBlAHUb4QVoeY9oykBCeVBs=
X-Gm-Gg: ASbGncuhDo6u+JhL0B+hLmcrAEtCmp8pwSD7zwJTGVPPmAvK5xdUNhy1BkKRdpi8tMv
	VLpv91duU7d9/KWnvkdGN2FWSy4WQoK8B0jZ9bW3On0IlgMCBJaN78GHNT600GzaI9BeJChMgll
	n2DvEubMUObLHuIipIEVHsGi321+brnW0nhj79PpSsZsAaI/AgHzxgpYEZHvnrVY1sMzJ2rAhtr
	LsNjP/UhQosi+Beeyvinqkcrs1LiUNvQ32pwYn2/aqdp7krbpL4lWoB3BBWzmPIZulDAOA70P5U
	6z8jlRjDC8XN
X-Google-Smtp-Source: AGHT+IE7OoRfAgc53S2IUfTfw5+cxQW7HyNcfHF+EenLp/CYXAYfFpJd7zlD0Wj/qZdm4Q8Piuze0w==
X-Received: by 2002:a05:6808:3a0a:b0:3e6:35da:8f2b with SMTP id 5614622812f47-3eb19c16ac1mr11584679b6e.4.1733760092093;
        Mon, 09 Dec 2024 08:01:32 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f279223948sm2118675eaf.14.2024.12.09.08.01.31
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 08:01:31 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71deb545153so666223a34.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 08:01:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFFZi1daFgeXrfoPwcIXNwXAKveZVGRCEf46cLXS20WUegn0fdrmXufC5S/B9FvhXIWiia+q9799dGviIV@lists.linux.dev
X-Received: by 2002:a05:6358:2812:b0:1cb:3864:9739 with SMTP id
 e5c5f4694b2df-1cb386499ecmr132991755d.25.1733760090977; Mon, 09 Dec 2024
 08:01:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241204162128.25617-1-dpenkler@gmail.com>
In-Reply-To: <20241204162128.25617-1-dpenkler@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 17:01:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>
Message-ID: <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>
Subject: Re: [PATCH v5] staging: gpib: Fix i386 build issue
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, Dec 4, 2024 at 5:21=E2=80=AFPM Dave Penkler <dpenkler@gmail.com> wr=
ote:
> These drivers cast resource_type_t to void * causing the build to fail.
>
> With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned
> int which cannot be cast to a 32 bit pointer.
>
> Disable these drivers if X68_PAE is enabled
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@=
roeck-us.net/
> Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
> Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation G=
PIB driver")
> Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>

Thanks for your patch!

> --- a/drivers/staging/gpib/Kconfig
> +++ b/drivers/staging/gpib/Kconfig
> @@ -50,6 +50,7 @@ config GPIB_CEC_PCI
>         tristate "CEC PCI board"
>         depends on PCI
>         depends on HAS_IOPORT
> +       depends on !X86_PAE

!CONFIG_PHYS_ADDR_T_64BIT, to match the definition of phys_addr_t?

Or is this only showing up on x86?

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
