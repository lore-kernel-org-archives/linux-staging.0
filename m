Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C2215C1
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 20:03:54 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id t14so18935244ljh.8
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 12:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uod9R4vPcpqIjzHofeC96qXcIXUlGW+U5alvKq7K0ZA=;
        b=Y+K+LAchMzIcesbCiqrzhisJgvbUIKYh3oFG/AlZJTKul1K9rRfHylHsN/EgM8hdwz
         P3hABFpC0Wcw+/0V4cKR5X0P787Wy9QwMeL5ORY50P9+oNZqmMp6NkFq4yV6NAIkP79C
         0bvk8ZnwfFSPqzKfD7Qqea+fs2YLRTaNcLanw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uod9R4vPcpqIjzHofeC96qXcIXUlGW+U5alvKq7K0ZA=;
        b=kGshW8WmaNIcFUk63spzpcXs/SbzcVJZ8MUzDh6qVr1OnvodeVkna//Sw8ty01CZm7
         NpG3WhjRPlwwzfqKzDVRpD7e+zEQWFXXGcrwF8cd6CI5pbP5qPDK2JkNpGHstFsmHl8t
         kb8N6Zr2/veYrA4oJTOw6Zl5a3jKu3zDUvohD5BmcpworKUWRtHrwwWJ2RQW9F8vBIqH
         6I0eOEleIzDkHAbfJ1KPfhiBLgLgk8pPlAc9W3ldgbx4/3d5U0MWmQNTrnqSssXpR6lZ
         CPep51DDgmUUbWb1K75ik1oX9NJWIAVDmKdaF7YvMr1n8quUIVK69tYrGCV02BrsQ3Ed
         50eQ==
X-Gm-Message-State: AOAM533LLxMYeU3OVkhsNVlCr+v/y1+EUOY9Rf2GTlx1yG6O51XjQ3HH
	DLZ564rSca1eAl1u5s5/87bbxp2UUNus7wpNvks=
X-Google-Smtp-Source: ABdhPJwbXNL8VOMGUftHV3EHGJJjHtEXhOK9GTwwPXYYPwyTU4dVsy2STdag6hzjQW2Orrt0kZwK/g==
X-Received: by 2002:a2e:8890:0:b0:244:d635:b4af with SMTP id k16-20020a2e8890000000b00244d635b4afmr14886433lji.33.1646078632906;
        Mon, 28 Feb 2022 12:03:52 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id r11-20020a19ac4b000000b00443d571f256sm1116527lfc.66.2022.02.28.12.03.51
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 12:03:51 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id i11so23315258lfu.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 12:03:51 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr7653619lfm.27.1646078630855; Mon, 28 Feb
 2022 12:03:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
In-Reply-To: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:03:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
Message-ID: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jakob Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org, 
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
	Linux Media Mailing List <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
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

On Mon, Feb 28, 2022 at 11:56 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I do wish we could actually poison the 'pos' value after the loop
> somehow - but clearly the "might be uninitialized" I was hoping for
> isn't the way to do it.

Side note: we do need *some* way to do it.

Because if we make that change, and only set it to another pointer
when not the head, then we very much change the semantics of
"list_for_each_head()". The "list was empty" case would now exit with
'pos' not set at all (or set to NULL if we add that). Or it would be
set to the last entry.

And regardless, that means that all the

        if (pos == head)

kinds of checks after the loop would be fundamentally broken.

Darn. I really hoped for (and naively expected) that we could actually
have the compiler warn about the use-after-loop case. That whole
"compiler will now complain about bad use" was integral to my clever
plan to use the C99 feature of declaring the iterator inside the loop.

But my "clever plan" was apparently some ACME-level Wile E. Coyote sh*t.

Darn.

                   Linus
