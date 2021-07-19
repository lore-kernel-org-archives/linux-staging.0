Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71D70
	for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 07:53:41 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id q20so6484226uaa.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 00:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFrHGkePZup1taj30Rt41mFp0n9XCiwOIs/xt1tbnaw=;
        b=tWsAsWGJydgp2qvsCAis2Nza9UXsMFOJyw7cuqZsgm0yGdj5NKr4ZDbgYlXdJ+hSFq
         vHbmmrAcQkBQ69xVUQv+w1VhuCoTAVRZpwlVEFT9AQvDfBYgZazUscOn0x8dTDfqufMs
         QRnYpWDvAFsHRklm+xk/20wCpe+TGKFF6KjkpZW+vh0zAsbV/RA6AUm9c0WAWPAnDwMr
         q+V7ik5r2CT29cMhK9hNoKa5yXeLxtihpRugA+3/AE7XfIDJ1BdGitiwrjjIJdXr9lb+
         6tf7UgJGr7nvGHzMh9ECdfr7IBQMOfBgKKMWILDOodytziMQ0dD5HgtxjWdHp1hHvpHR
         Bc8Q==
X-Gm-Message-State: AOAM533ytvcyr170HJWZ1Ko94ZKPIuR/AVprX/WcoK4tS/xwnO5o2A2V
	VAQBQOTX+SmpwYha1ee2xkUtM0Bykr2dHGgmFHM=
X-Google-Smtp-Source: ABdhPJzXmKaiICvApSnCr48W0kVIIhAe0HClSDvRY/+X8t7EqH9YSmdjsOer92Kdg8iWZJTvPkJd3JyN+8IpVFrQ92Y=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr24866271uaj.100.1626681220672;
 Mon, 19 Jul 2021 00:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210718133920.15825-1-len.baker@gmx.com> <CAHp75VeEA0=KFsfdjCnBm-b9+F+NnFWJ38nkh+qtb85XdXVWog@mail.gmail.com>
In-Reply-To: <CAHp75VeEA0=KFsfdjCnBm-b9+F+NnFWJ38nkh+qtb85XdXVWog@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jul 2021 09:53:29 +0200
Message-ID: <CAMuHMdXnhzumSrr=MAkv5nwY2o8xCa4s5zKa9meJTuo0r9yABw@mail.gmail.com>
Subject: Re: [PATCH] staging/fbtft: Remove all strcpy() uses
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Len Baker <len.baker@gmx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Phil Reid <preid@electromag.com.au>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 18, 2021 at 9:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Jul 18, 2021 at 4:43 PM Len Baker <len.baker@gmx.com> wrote:
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. The safe replacement is strscpy() but in
> > this case it is simpler to add NULL to the first position since we want

"NULL" is a pointer value, "NUL" is the character with value zero.

> > to empty the string.
>
> > This is a previous step in the path to remove the strcpy() function.
>
> Any document behind this (something to read on the site(s) more or
> less affiliated with what is going to happen in the kernel) to read
> background?
>
> ...
>
> >                 case -1:
> >                         i++;
> >                         /* make debug message */
> > -                       strcpy(msg, "");

While this strcpy() is provably safe at compile-time, and will probably
be replaced by an assignment to zero by the compiler...

> > +                       msg[0] = 0;
>
> Strictly speaking it should be '\0'.
>
> >                         j = i + 1;
> >                         while (par->init_sequence[j] >= 0) {
> >                                 sprintf(str, "0x%02X ", par->init_sequence[j]);

... the real danger is the

        strcat(msg, str);

on the next line.
Fortunately this whole debug printing block (including the strcpy)
can (and should) be rewritten to just use "%*ph".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
