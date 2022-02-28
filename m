Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A855382
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 21:47:05 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cm8so19513960edb.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
        b=DcAOXNn/ViLnmA/Pl4xJfWkhBybquVghVb27ULjvzphMd1cBlP8EnT2avc3nlq8Ncp
         XU0OlwqVPcxmpQGfXIX8cDSYeDqzQFDIjUJw6vYkNcJJHsbpQaotozEaUyIGD250VuoD
         60I5wOFshLHgsaHS54p/JatmHLrrllGTo/egDJjxoeGmck3vK6ZaE0ldZN4szqLK845U
         BQNwjpOC8zhohOQR/VOEr6j/DtNOqZN6I6F48XJrq+10cNhH40s7WdjZ8f4gJpCeR9JY
         suF4D0bui+heOiMd0XjHUkKuJX/fj0a+j8l22tTUgDxT9LwW7gkDbHU26uOV2JCB+l1v
         aZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
        b=JmbxTdOEJTllt7vkJya7ZQk6ueRO1+By2NSwOWZyqJeSvPaHd8NKisun8TWrH3v98s
         nkWXIGWu8SOxrIR5qu+qlgPJw1ozuMsd88mKGhSHYKOCjafPPrvRdYAr2vtWotPFyVQ7
         WOLyPzGWCu1LIcY0gCt7HtflzJwgWSYnJOQSM1VDapOv2UTaOJxfuy4/LqYRlX7p+q8A
         0eLKMC5Adlbp2UKX4A/8TEtG6oSDdH9PEptwWHn3gjd7jeWnghMk7ZIbLUUXhmQbQ4va
         kjvdPWh+RqTUequPaBq9DUoCOsiHZrd/u9Xy0WowOwl8Hff/lcO5FZ3ECojV9Mc8hyIl
         yAsw==
X-Gm-Message-State: AOAM533zMGn5JHG63eEMxb9DuaOhdhC8Anj8jK7HQOkhTYCHaHUjCCl9
	DPAUiE3DRKv7GlA5aqCHZtM=
X-Google-Smtp-Source: ABdhPJxKG2ff16tCWsK6Ck3Y2a57p3q44AgnQUgUMRZ3ajKrFkwS/Wlp6PHXO9g9MP9OhOujc97TPw==
X-Received: by 2002:a05:6402:40d0:b0:412:f86a:efd1 with SMTP id z16-20020a05640240d000b00412f86aefd1mr21791110edb.194.1646084823834;
        Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
        by smtp.gmail.com with ESMTPSA id ce7-20020a170906b24700b006cf095c2f5bsm4701847ejb.83.2022.02.28.13.47.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Date: Mon, 28 Feb 2022 22:47:00 +0100
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alsa-devel@alsa-project.org,
 linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)



> On 28. Feb 2022, at 21:10, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>=20
> On Mon, Feb 28, 2022 at 12:03 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>=20
>> Side note: we do need *some* way to do it.
>=20
> Ooh.
>=20
> This patch is a work of art.
>=20
> And I mean that in the worst possible way.
>=20
> We can do
>=20
>        typeof(pos) pos
>=20
> in the 'for ()' loop, and never use __iter at all.
>=20
> That means that inside the for-loop, we use a _different_ 'pos' than =
outside.
>=20
> And then the compiler will not see some "might be uninitialized", but
> the outer 'pos' *will* be uninitialized.
>=20
> Unless, of course, the outer 'pos' had that pointless explicit =
initializer.

The goal of this is to get compiler warnings right? This would indeed be =
great.

Changing the list_for_each_entry() macro first will break all of those =
cases
(e.g. the ones using 'list_entry_is_head()).
I assumed it is better to fix those cases first and then have a simple
coccinelle script changing the macro + moving the iterator into the =
scope
of the macro.

>=20
> Here - can somebody poke holes in this "work of art" patch?

With this you are no longer able to set the 'outer' pos within the list
iterator loop body or am I missing something? Like this it stays
uninitialized but you'll probably want to set it from within the loop.

You would then yet again need a variable with another name to use
after the loop.

I fail to see how this will make most of the changes in this
patch obsolete (if that was the intention).

>=20
>                     Linus
> <patch.diff>

- Jakob

