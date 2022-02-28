Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD2C15C1
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 18:47:16 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a23so26708782eju.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 10:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+acwbp8IAqy4EQhdzrRR6UrvnBSYJWdfAOCkLBEf6s=;
        b=LvJ51tK8OGXmUdrq1FTGfGhAU7kyWg6aDacet+/T6m1xcdm96SFLNin6cqkfGY+rbg
         A+4gdF9QL3th8X1CIPS6F2KrwGpjUcAkZFh2wMRAAEhyIS9gK5hzhXTjv7RRLGY5VhDN
         /ORnVKar4p0KNDioI7O/8vsyY3PJ0BwGF0c/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+acwbp8IAqy4EQhdzrRR6UrvnBSYJWdfAOCkLBEf6s=;
        b=qFDrpfkwk4G3yeHRQ267byrlVQSqNH591AP334GGN3r/w7dwtd7dBafiNLvh6AvJyf
         4uyLKRcWaL07PBTBYE9tmTCVHXbb6ceyIGJUSyd0qnneUXnw9t4ecR9H1yuc2XPSYdGp
         3YaJpvkp3Pmmu9bbZJxdCgiEuta85Q4GanUiWCo59FMRRscHPG1R47N9IWwrLXDI60hP
         +A8y5xbNVsdUFkWcXdk4AMDJk3oSGzj+94vJlng1kQwWDxksMJXr6v8Uhh0RJy/JtiR8
         dmE3l9/1J46U6tv3qOD5r4mNG8eJ2ufFtgRDxpTO9oGqDFEDb2cssZJ1jHwtSCJdLheM
         MC4Q==
X-Gm-Message-State: AOAM530N2NY4BxGOejlM0BH9Uo0oE7yEP0KlPpv+p3+qBIQGkXxCIDLb
	hXsEFZ2YTZsMN9VvYAP8fY8SIRCDihmVeE49jGQ=
X-Google-Smtp-Source: ABdhPJxkYL3nqKaqt+trqpgpUQUUxQiXqamn02Oc2Zxk/76POf+63+pMykCoEIBhLlEzCfVZ0Y+EOg==
X-Received: by 2002:a17:907:9043:b0:6cc:2e9d:233e with SMTP id az3-20020a170907904300b006cc2e9d233emr15542967ejc.53.1646074034476;
        Mon, 28 Feb 2022 10:47:14 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906244800b006ce72bed2e5sm4653792ejb.143.2022.02.28.10.47.14
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 10:47:14 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id u1so16882630wrg.11
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 10:47:14 -0800 (PST)
X-Received: by 2002:ac2:4c8c:0:b0:445:6c26:3cff with SMTP id
 d12-20020ac24c8c000000b004456c263cffmr13670491lfl.435.1646073655129; Mon, 28
 Feb 2022 10:40:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <YhyxML05rjJ/57Vk@FVFF77S0Q05N>
 <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
In-Reply-To: <CAK8P3a0CTmtUq+Uba2S3D7wjSstew2M+LfzZoOcKdKK9cfXO9A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 10:40:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjU+DCbFG4nd3Wne-KbQ1n5=BHynv3xEmRYTaayBj-EfQ@mail.gmail.com>
Message-ID: <CAHk-=wjU+DCbFG4nd3Wne-KbQ1n5=BHynv3xEmRYTaayBj-EfQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 3:37 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I think the KBUILD_USERCFLAGS portion and the modpost.c fix for it
> make sense regardless of the -std=gnu11 change

I do think they make sense, but I want to note again that people doing
cross builds obviously use different tools for user builds than for
the kernel. In fact, even not cross-building, we've had situations
where the "kbuild" compiler is different from the host compiler,
because people have upgraded one but not the other (upgrading the
kernel build environment is actually much easier than upgrading the
host build environment, because you don't need all the random
libraries etc, and you can literally _just_ build your own gcc and
binutils)

And we have *not* necessarily required that the host tools match the
kernel tools.

So I could well imagine that there are people who build their kernels,
but their host build environment might be old enough that -std=gnu11
is problematic for that part.

And note how any change to  KBUILD_USERCFLAGS is reflected in KBUILD_HOSTCFLAGS.

So I would suggest that the KBUILD_USERCFLAGS part of the patch (and
the modpost.c change that goes with it) be done as a separate commit.
Because we might end up reverting that part.

Hmm?

           Linus
