Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671F7C
	for <linux-staging@lists.linux.dev>; Tue,  1 Mar 2022 18:47:47 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id hw13so33271287ejc.9
        for <linux-staging@lists.linux.dev>; Tue, 01 Mar 2022 10:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JZw99KMpsKBs3Ab/LBNeIPMebXALTITXobBfJpN/EsI=;
        b=ZEWbFFu3eWrZxUgaaScwD4ZJ//Z7mV4SGMyACB20WwCKEMFGKIBMMEXVkM4kZXdOyd
         EokMKBVyAcoYChV/SvtOh5q5h0Yafm3wlsC3jCGOeoM0h4pn550KTbE+/sUn3z3m8p0V
         ZL0gG9ZTrYCOlyUURTCDAGrluijISoqXbB1wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZw99KMpsKBs3Ab/LBNeIPMebXALTITXobBfJpN/EsI=;
        b=l2IxwN2q767Me+n6bfZ0LFKd9RjWTSo/GAcd6Qr8Ax/lU/I3b2uLGMZ2T/uhXhP+Rw
         tPdikGiljaGvmbfXDNHreIEkg28FW/pCovdekbxvCmc98PrxhBZWDoA6kTZvbnZnG4q3
         GwScq5jpG80RHgJirZxqnwwfW7ZNEhTa5F9pyFTVAB3oewbWZ1dcV41rZanHyNj1qvgf
         9rthZHdmtolhfonrxKS3mwUpWVykTUx6HtUBynWx6UIDuXW8oUfmDhiRoec1eKt8qRlT
         LQGDdAd8E6DaF6PDtNY5XEOZ5IpxsN6YtBJn5GQfTgtN6NqW9noKDQrpm7IjtlXUewlK
         oInw==
X-Gm-Message-State: AOAM5336pI/UrtOMIQLiilyYEK+2iHni8kt7j1spQu14JPYr25lp0jzk
	qq88F+Yrk50RtPDYLxRZQ2vRO2AFuGwJki/Eicg=
X-Google-Smtp-Source: ABdhPJw1x0pvXiJ6ZreEMWzOJh1tjLD9pseF8XzLYAkfTiWQ1FDQt16spNwIhu+bY2ZHngBsv5r8CQ==
X-Received: by 2002:a17:906:9f21:b0:6b6:1f07:fb86 with SMTP id fy33-20020a1709069f2100b006b61f07fb86mr20010050ejc.495.1646160465900;
        Tue, 01 Mar 2022 10:47:45 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id l5-20020a170906644500b006ce6b73ffd2sm5558415ejn.84.2022.03.01.10.47.41
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 10:47:43 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id qk11so33400898ejb.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Mar 2022 10:47:41 -0800 (PST)
X-Received: by 2002:a05:6512:2033:b0:443:3d49:dac with SMTP id
 s19-20020a056512203300b004433d490dacmr16440784lfs.52.1646160451271; Tue, 01
 Mar 2022 10:47:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org> <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org> <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
 <202203011008.AA0B5A2D@keescook>
In-Reply-To: <202203011008.AA0B5A2D@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 10:47:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=whccSm8HKANQbomYrF8cqBa1wUi1dvUEUc3Nf=WoX3WHQ@mail.gmail.com>
Message-ID: <CAHk-=whccSm8HKANQbomYrF8cqBa1wUi1dvUEUc3Nf=WoX3WHQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Kees Cook <keescook@chromium.org>
Cc: Matthew Wilcox <willy@infradead.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jakob Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org, 
	linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Cristiano Giuffrida <c.giuffrida@vu.nl>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net, 
	drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>, 
	CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, 
	linux-scsi <linux-scsi@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>, 
	linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>, 
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org, 
	kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com, 
	Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Arnd Bergman <arnd@arndb.de>, 
	Linux PM <linux-pm@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, 
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, v9fs-developer@lists.sourceforge.net, 
	linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org, 
	linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
	linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>, 
	tipc-discussion@lists.sourceforge.net, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, dma <dmaengine@vger.kernel.org>, 
	linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 10:14 AM Kees Cook <keescook@chromium.org> wrote:
>
> The first big glitch with -Wshadow was with shadowed global variables.
> GCC 4.8 fixed that, but it still yells about shadowed functions. What
> _almost_ works is -Wshadow=local.

Heh. Yeah, I just have long memories of "-Wshadow was a disaster". You
looked into the details.

> Another way to try to catch misused shadow variables is
> -Wunused-but-set-varible, but it, too, has tons of false positives.

That on the face of it should be an easy warning to get technically
right for a compiler.

So I assume the "false positives" are simply because we end up having
various variables that really don't end up being used - and
"intentionally" so).

Or rather, they might only be used under some config option - perhaps
the use is even syntactically there and parsed, but the compiler
notices that it's turned off under some

        if (IS_ENABLED(..))

option? Because yeah, we have a lot of those.

I think that's a common theme with a lot of compiler warnings: on the
face of it they sound "obviously sane" and nobody should ever write
code like that.

A conditional that is always true? Sounds idiotic, and sounds like a
reasonable thing for a compiler to warn about, since why would you
have a conditional in the first place for that?

But then you realize that maybe the conditional is a build config
option, and "always true" suddenly makes sense. Or it's a test for
something that is always true on _that_architecture_ but not in some
general sense (ie testing "sizeof()"). Or it's a purely syntactic
conditional, like "do { } while (0)".

It's why I'm often so down on a lot of the odd warnings that are
hiding under W=1 and friends. They all may make sense in the trivial
case ("That is insane") but then in the end they happen for sane code.

And yeah, -Wshadow has had tons of history with macro nesting, and
just being badly done in the first place (eg "strlen" can be a
perfectly fine local variable).

That said, maybe people could ask the gcc and clan people for a way to
_mark_ the places where we expect to validly see shadowing. For
example, that "local variable in a macro expression statement" thing
is absolutely horrendous to fix with preprocessor tricks to try to
make for unique identifiers.

But I think it would be much more syntactically reasonable to add (for
example) a "shadow" attribute to such a variable exactly to tell the
compiler "yeah, yeah, I know this identifier could shadow an outer
one" and turn it off that way.

               Linus
