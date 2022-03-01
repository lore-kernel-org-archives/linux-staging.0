Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F887A
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 00:04:15 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h15so39250edv.7
        for <linux-staging@lists.linux.dev>; Tue, 01 Mar 2022 16:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4H0hy1V+vsSL/J4iRHU98fs6Ghx9E/bawvPg5OjXQmQ=;
        b=A1xSV6w+mnGI8KddmZFT+SVp47UhRqZlj7dZE7Ue1BgWjGw2+QCc51Zb6PIPvKiXuh
         /TGd1P3o63R0kiFyLwVU+kzDBf6Kt9wFSZwwJYnrWAqavu9szp3nfmKm0Qe68N3l8Mdl
         bWvesgtwBf4BWRSm4aUiCmj0pmAaHYwmzAjUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4H0hy1V+vsSL/J4iRHU98fs6Ghx9E/bawvPg5OjXQmQ=;
        b=7DBSI5LsuTX3zYSZtOIoy3oAsGDBcqEZPI6D2l8hLXefxBFWI6DiumnIL8+/kq8ujm
         IxUnI83+Wb1EReJrDOJU4jIfUbvIwGd5u/QlJI8V5O8jIF8UHD7WFFTZLWB7GO2C6OZP
         RfWJ7ZlWaFdiv72Z0HGp7paM1qDWDfaSIS8Zs1nDe3CSlAKGeC4VnBjGHiiduE2UxTRx
         kDqSouUXWp/JaVMlCk69+IGbWkbzTPW00duKzp+BBiZ7nEzXXo/KcCAMq6aIOBRrmxwk
         COatIcNiOJAk54Ue8KePa2rJNFvjBy3kKvm9986PrmDcKKFp++OM2O8wlL/e8w9HzCEq
         J78g==
X-Gm-Message-State: AOAM531FlIfSEH92emG1OyPkAOTaHCq9axdh9axtPIvYG75ivSyPT5Kp
	w/PV5g8ceuve1IIGJ6iMIS1OW5wdjoOqeMVqA0A=
X-Google-Smtp-Source: ABdhPJzdrFprct9bddrJxoyTJDot5KXLb83/9AEkNkm9i5OwURfNgQyGqCWGVgahuduWjGE20Gz1Rg==
X-Received: by 2002:aa7:c896:0:b0:413:c96d:6bfd with SMTP id p22-20020aa7c896000000b00413c96d6bfdmr9876285eds.331.1646179453437;
        Tue, 01 Mar 2022 16:04:13 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id t4-20020a056402524400b00415b90801edsm130027edd.57.2022.03.01.16.04.13
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 16:04:13 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id gb39so294529ejc.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Mar 2022 16:04:13 -0800 (PST)
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr17643498lfb.449.1646178958685; Tue, 01
 Mar 2022 15:55:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com> <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org> <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
 <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com> <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
 <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
In-Reply-To: <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 15:55:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
Message-ID: <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: David Laight <David.Laight@aculab.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, KVM list <kvm@vger.kernel.org>, 
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Cristiano Giuffrida <c.giuffrida@vu.nl>, 
	"Bos, H.J." <h.j.bos@vu.nl>, 
	"linux1394-devel@lists.sourceforge.net" <linux1394-devel@lists.sourceforge.net>, 
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>, linux-arch <linux-arch@vger.kernel.org>, 
	CIFS <linux-cifs@vger.kernel.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, linux-scsi <linux-scsi@vger.kernel.org>, 
	linux-rdma <linux-rdma@vger.kernel.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, 
	"kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	dma <dmaengine@vger.kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jakob Koschel <jakobkoschel@gmail.com>, 
	"v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>, 
	linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, 
	Netdev <netdev@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"samba-technical@lists.samba.org" <samba-technical@lists.samba.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>, 
	"tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 3:19 PM David Laight <David.Laight@aculab.com> wrote:
>
> Having said that there are so few users of list_entry_is_head()
> it is reasonable to generate two new names.

Well, the problem is that the users of list_entry_is_head() may be few
- but there are a number of _other_ ways to check "was that the HEAD
pointer", and not all of them are necessarily correct.

IOW, different places do different random tests for "did we walk the
whole loop without breaking out". And many of them happen to work. In
fact, in practice, pretty much *all* of them happen to work, and you
have to have the right struct layout and really really bad luck to hit
a case of "type confusion ended up causing the test to not work".

And *THAT* is the problem here. It's not the "there are 25ish places
that current use list_entry_is_head()".

It's the "there are ~480 places that use the type-confused HEAD entry
that has been cast to the wrong type".

And THAT is why I think we'd be better off with that bigger change
that simply means that you can't use the iterator variable at all
outside the loop, and try to make it something where the compiler can
help catch mis-uses.

Now, making the list_for_each_entry() thing force the iterator to NULL
at the end of the loop does fix the problem. The issue I have with it
is really just that you end up getting no warning at all from the
compiler if you mix old-style and new-style semantics. Now, you *will*
get an oops (if using a new-style iterator with an old-style check),
but many of these things will be in odd driver code and may happen
only for error cases.

And if you use a new-style check with an old-style iterator (ie some
backport problem), you will probably end up getting random memory
corruption, because you'll decide "it's not a HEAD entry", and then
you'll actually *use* the HEAD that has the wrong type cast associated
with it.

See what my worry is?

With the "don't use iterator outside the loop" approach, the exact
same code works in both the old world order and the new world order,
and you don't have the semantic confusion. And *if* you try to use the
iterator outside the loop, you'll _mostly_ (*) get a compiler warning
about it not being initialized.

             Linus

(*) Unless somebody initializes the iterator pointer pointlessly.
Which clearly does happen. Thus the "mostly". It's not perfect, and
that's most definitely not nice - but it should at least hopefully
make it that much harder to mess up.
