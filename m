Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082CC5382
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 21:19:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id h17so6236084plc.5
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 13:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
        b=JpEWCU5sl0Tb/FD34RSH61Ey9dRKreZqOQa3CJ02luf0uqIT78+8GWNevF0TXmNO1k
         V82hjNGseb3oWLNgnnFwXHAFmfIF+pTCtPsXm95pt2iCzBmJFwg04njU2K1WfIC8K4PQ
         JYTCrkA4ACMCh2biL4u47uoOFfhnbmO/1jCCSOx3OESfK5+oDGNitg9s7NqsmIU5fVsE
         xsR4ABTTJUTksMDshckaPyVLHegSArBm3erCaRT01IEJkH2S1g98XNdRHKV6JZW5AanM
         gI9+nSzlxhKCRaqGLAQjGqwME5o9/K6faQyfblLD265MKP0MWlgdnuFxCRxjUTwlasET
         Zo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
        b=pOgl5o2PVW3PIOtN6KPmbJ3wOppL0yZA8IqiOTerXU3pnia7z2UrJ8dV3sIdBy2gLx
         Y77f9sYEf05pAJyuyZkxOzl0uN4acjn6olXnNSGU2WyTeNIPEoBSYAXjWzXGUyEO1ZQl
         OByu9EfBAAzL7RnRXYAMoK9m2lSMMY2C0zbmSX4uk7TVeFhrpfXAWOskUDcO88roGHbA
         r80tQ7lJLYTa8rQqKdBDSNIRynOc+c3lwovtueUUzDfgtCQ7msd135Pm1dBNSqvj2Uwa
         ZFZaDsOajeQwgTHiUavIWkfJfBtH83qhb4L2IXWqh3atUCRHosMH+Oxpgsuo1j5G5+SK
         shKA==
X-Gm-Message-State: AOAM533U8gwBNaorLHQJ7qm/r2y8jb41qjeHThjqiT/0wHGtULgWXune
	BLsjXitdR/hPKUzXZcGDNwJ7uYT+1LUbkveONNQ=
X-Google-Smtp-Source: ABdhPJxYQDaw0FFWrTXZCk3OvnKpy6mSdQ8Z9qbCWYQ2FvSetamSp4Rz90y2uoGU7tjomvOtre1MYsL9s+rZuYttBVs=
X-Received: by 2002:a17:902:ce8a:b0:14f:fd0e:e4a4 with SMTP id
 f10-20020a170902ce8a00b0014ffd0ee4a4mr22765912plg.47.1646083147399; Mon, 28
 Feb 2022 13:19:07 -0800 (PST)
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
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
Reply-To: noloader@gmail.com
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 28 Feb 2022 16:18:56 -0500
Message-ID: <CAH8yC8nwp8f3rANhCiiP_Oiw2cjfqCwAgZdTXY9OxtN9Tmm7HA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jakob Koschel <jakobkoschel@gmail.com>, 
	alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org, 
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Cristiano Giuffrida <c.giuffrida@vu.nl>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, samba-technical@lists.samba.org, 
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com, 
	linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>, 
	KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, 
	linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, 
	"Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org, 
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

On Mon, Feb 28, 2022 at 3:45 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> ...
> > Just from skimming over the patches to change this and experience
> > with the drivers/subsystems I help to maintain I think the primary
> > pattern looks something like this:
> >
> > list_for_each_entry(entry, head, member) {
> >      if (some_condition_checking(entry))
> >          break;
> > }
> > do_something_with(entry);
>
>
> Actually, we usually have a check to see if the loop found anything,
> but in that case it should something like
>
> if (list_entry_is_head(entry, head, member)) {
>     return with error;
> }
> do_somethin_with(entry);

Borrowing from c++, perhaps an explicit end should be used:

  if (list_entry_not_end(entry))
    do_somethin_with(entry)

It is modelled after c++ and the 'while(begin != end) {}' pattern.

Jeff
