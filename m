Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041E2FB0
	for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 18:02:05 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id d15so1101976vka.13
        for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 11:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CFAXOYswwIGflCWWx9fpDZl57pj1QpRpAZ3Zwc4ZdWQ=;
        b=RWTeIOFxlJZEjp1mQLoYPt2ZaSri830cdsJ2xNXvpA+bRWdjdkBa0JeUa5Se6G/IoQ
         eSoS28sX5Upi9+mFCnrcbVmlrKrwbyAaiyuu3mGX2wBhctB5qUVrYBkdlh4+DWY6t3kR
         s7WvrlXn1xp1QJzHmheyEbgDY2E14TSfZ16Vz2lJNfQgf/pM9LedrHNrUH2X7QAxkwOE
         tmoX5V+leyk+MADCpM3skNyPsPgNJhwWbDEG2BCf0SO/1wDQAjTEjovqA3sFYaWbqRd1
         UA/s6UpnoLN86pA7NdUw9tExZ6i4zj6OlzQMh3IsOj35pNaSlaVIgHY9F1wYHeIjj0to
         gsQA==
X-Gm-Message-State: AOAM530T0SE01rO9cIyoeNRGu1+1h96d+J2yEbggIigcLpnTwNMnyYKB
	m22XRgJiWuKcaWVHn3X0jV6tj2sOeMQ/GuAghDc=
X-Google-Smtp-Source: ABdhPJznGi7hzvA1p2VsWdfv9lBV4MVLJwhvR4BKSFCYB+5JUdtBAWgTUa81Xuz+HTQ+Zc8W97HV8XtBugNdFeb48jQ=
X-Received: by 2002:a05:6122:a12:: with SMTP id 18mr7348420vkn.1.1627149724368;
 Sat, 24 Jul 2021 11:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210724151411.9531-1-len.baker@gmx.com> <20210724151411.9531-4-len.baker@gmx.com>
In-Reply-To: <20210724151411.9531-4-len.baker@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 24 Jul 2021 20:01:53 +0200
Message-ID: <CAMuHMdX6PUr0irndogg=Aa+AFDdiDJMeMWM74mLBkuLrW+zWng@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging/fbtft: Fix braces coding style
To: Len Baker <len.baker@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Phil Reid <preid@electromag.com.au>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Len,

On Sat, Jul 24, 2021 at 7:44 PM Len Baker <len.baker@gmx.com> wrote:
> Add braces to the "for" loop and remove braces from the "if" statement.
> This way the kernel coding style is followed.
>
> Signed-off-by: Len Baker <len.baker@gmx.com>

Thanks for your patch!

> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c

> @@ -1016,10 +1018,9 @@ int fbtft_init_display(struct fbtft_par *par)
>
>         i = 0;
>         while (i < FBTFT_MAX_INIT_SEQUENCE) {
> -               if (par->init_sequence[i] == -3) {
> -                       /* done */
> -                       return 0;
> -               }

These braces should not be removed, due to the presence of
the comment.

> +               if (par->init_sequence[i] == -3)
> +                       return 0; /* done */
> +
>                 if (par->init_sequence[i] >= 0) {
>                         dev_err(par->info->device,
>                                 "missing delimiter at position %d\n", i);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
