Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB332F2F
	for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 22:41:33 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gb39so21334299ejc.1
        for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 14:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8l4d/g0eKsVGAXwcSHou4m9texHyFwjSyXWV84L8X0=;
        b=aS+Cuu53E5xh6ezL4BQQcygkZ7taEG098ncxgu4s2QZu+Pf48uAsX8EMwnsNmZzs5O
         eo+kkcQwg/L9tnVyFaERl40XHOJRfEwQ+3p4bNjtTIEqFgNZTrhkUr5c7jHIQo0R2QlD
         6Z3HbL6vTEGo3aFlsNtdBL0CtUa6ZZQikH6w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8l4d/g0eKsVGAXwcSHou4m9texHyFwjSyXWV84L8X0=;
        b=3ml17oHKzRWARCt2lCrYVpqU2lgGWPvmUU0vQNteduGQVo9rj5fQ9SZSciUli3BRjQ
         VRWrIlGmw0eAy+5W9XIfyuSNRso9xcXlMoX9ltYIgnC8eJvP2FHRSZxBfFIqWpJYTg8M
         myFfBCi2KOs76PmPgg7N8P7KoInvRMrTnjRPP+pItHxO728vCkVladPO+8ZbH5lVIoTE
         MxiV/4sHm0eeCePGPgca4fl3SIMVL65nNBgQCgM0mxLBY0+8RUVskAJKEZOn0hRGT2pV
         hFqTvBgSxCgN4JE46hRqZ+07yfeN/6Ueh3r1GKtICLA9hszZZko83M+GbHrrNtgChSdq
         jRGw==
X-Gm-Message-State: AOAM533+8ytsHncrrJlHyzOSMBOAzd6bZrR/lELZ9SNSAT1+/YKzEYcP
	ZiNBhgi5ZoSuxYc3hgpOAZQt1JNB+ZlZpLsWLg0=
X-Google-Smtp-Source: ABdhPJy8hykp0hMV8u7Stwx9yg9QtMcxod5iz4JkT8pl7rWRx/ryCxp+QBJ0ZBcQU5TFRLSsHoX/VA==
X-Received: by 2002:a17:906:b201:b0:6b5:58c8:e43c with SMTP id p1-20020a170906b20100b006b558c8e43cmr12876306ejz.441.1646001691138;
        Sun, 27 Feb 2022 14:41:31 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id b6-20020a50e386000000b00410d64cb3e4sm5439098edm.75.2022.02.27.14.41.30
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 14:41:30 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id qx21so21247128ejb.13
        for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 14:41:30 -0800 (PST)
X-Received: by 2002:a2e:aaa2:0:b0:244:bf42:3e6e with SMTP id
 bj34-20020a2eaaa2000000b00244bf423e6emr12796324ljb.176.1646001378532; Sun, 27
 Feb 2022 14:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org>
In-Reply-To: <20220227215408.3180023-1-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Feb 2022 14:36:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
Message-ID: <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 27, 2022 at 1:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Since the differences between gnu99, gnu11 and gnu17 are fairly minimal
> and mainly impact warnings at the -Wpedantic level that the kernel
> never enables, the easiest way is to just leave out the -std=gnu89
> argument entirely, and rely on the compiler default language setting,
> which is gnu11 for gcc-5, and gnu1x/gnu17 for all other supported
> versions of gcc or clang.

Honestly, I'd rather keep the C version we support as some explicit
thing, instead of "whatever the installed compiler is".

Not only do I suspect that you can set it in gcc spec files (so the
standard version might actually be site-specific, not compiler version
specific), but particularly with clang, I'd like that "GNU extensions
enabled" to be explicit. Yes, maybe it's the default, but let's make
sure.

The C version level has traditionally had a lot of odd semantic
meaning details - you mention "inline", others have existed. So it's
not just the actual new features that some C version implements, it's
those kind of "same syntax, different meaning" issues. I really don't
think that's something we want in the kernel any more.

Been there, done that, and we did the explicit standards level for a reason.

It may be true that c99/c11/c17 are all very similar, and don't have
those issues. Or maybe they do.

And I don't want somebody with a newer compiler version to not notice
that he or she ended up using a c17 feature, just because _that_
compiler supported it, and then other people get build errors because
their compilers use gnu11 instead by default.

Put another way: I see absolutely no upside to allowing different
users using higher/lower versions of the standard. There are only
downsides.

If gnu11 is supported by gcc-5.1 and up, and all the relevant clang
versions, then let's just pick that.

And if there are any possible future advantages to gnu17 (or eventual
gnu2x versions), let's document those, so that we can say "once our
compiler version requirements go up sufficiently, we'll move to gnuXX
because we want to take advantage of YY".

Please?

                   Linus

                   Linus
