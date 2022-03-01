Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2DC5CD1
	for <linux-staging@lists.linux.dev>; Tue,  1 Mar 2022 17:40:08 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id d10so32963238eje.10
        for <linux-staging@lists.linux.dev>; Tue, 01 Mar 2022 09:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=pFdYiycpncfTymiwtZowrsS5EyWiXpYxNs42/BHAfYg=;
        b=jNa8kCMtl/UUGI9n6DMpRCjqu31f4wAijdvFFxZnjTmTKVAPvZHGvGIS5mEbyeVH7U
         2x/09r6Vjc5jlvMmGEJ/il9wQB7v0QaDJcbwnO54cttgXGRrRpdgplSbMXJLSVGPucZZ
         9N0BbQ67CEO0Sz9E19ATZ7SkTLFNHyfaTEafdxDnprAieU2S7WSxP1eMUqDcJyOgT3om
         KiVwLoBVmeYUr/3jVH1Ywgf3KLmBchJpZXF9NW4w0E+aOTUpi5SfsW8FSQSkfcXvzSp5
         ZeMWPQFNXAG0u+f0IIKFL+VZxclmrwVLcWvb/ml3Qc/gpz+jEOgbpY53v+25m0fIUJKc
         BDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=pFdYiycpncfTymiwtZowrsS5EyWiXpYxNs42/BHAfYg=;
        b=Dko5L22isvKWb8mCe3dPaCBy/TEypaUlbeGWJV2rq3qBaL9qDWpJVHLBUultgSwnif
         H/t4U1DhhFRkVz9nZOJGGuLe2dKTUZd8wv+QuufR7IzzFkF3jX7z5HX2LO5AmzWLM/He
         8v5VtXJuBoNtIAhADbezPAiiKdInysdsZmgNqagDTqyH3296qB4Rn/8up+z8n9wY2iPq
         sf9lexmDn/VeLpHuvpD++6zLUNgPFcOQdlZx2zIkpT7baKV5r6RzCnr0aG1CAxDRmoD/
         yaUbuCnpcyuEmF78/inEk3KhK7kdMPpmd1uTRybt0BZL7xa+9ECI9/sKRWN54tCAGed2
         vp0w==
X-Gm-Message-State: AOAM531ecCWG6BiQtw/A99jts2HDOmTYb9+b9I04RGrKJ27EqdOXycAR
	BOzYw83iQ4V8IDD7IOlH6k8=
X-Google-Smtp-Source: ABdhPJwzanGhehpmLWEMTTJkMBhYufoyhmHURG9yND716ZZIbM/kd8Ex5thBnsVmcSvoj9ZPyJ3fsw==
X-Received: by 2002:a17:906:948:b0:6d6:e479:1fe4 with SMTP id j8-20020a170906094800b006d6e4791fe4mr3312230ejd.240.1646156406993;
        Tue, 01 Mar 2022 09:40:06 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:6db3:8d4c:747e:98ad])
        by smtp.gmail.com with ESMTPSA id a25-20020a50ff19000000b0040f84cd806csm7398100edu.59.2022.03.01.09.40.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Mar 2022 09:40:06 -0800 (PST)
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
In-Reply-To: <Yh5ZmwiH5AxtQ69K@kroah.com>
Date: Tue, 1 Mar 2022 18:40:04 +0100
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
Message-Id: <4B1AFAD9-C1B3-499C-945A-C259361ABA8C@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com> <Yh5ZmwiH5AxtQ69K@kroah.com>
To: Greg KH <greg@kroah.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)



> On 1. Mar 2022, at 18:36, Greg KH <greg@kroah.com> wrote:
>=20
> On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
>>=20
>>=20
>>> On 1. Mar 2022, at 01:41, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>>>=20
>>> On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel =
<jakobkoschel@gmail.com> wrote:
>>>>=20
>>>> The goal of this is to get compiler warnings right? This would =
indeed be great.
>>>=20
>>> Yes, so I don't mind having a one-time patch that has been gathered
>>> using some automated checker tool, but I don't think that works from =
a
>>> long-term maintenance perspective.
>>>=20
>>> So if we have the basic rule being "don't use the loop iterator =
after
>>> the loop has finished, because it can cause all kinds of subtle
>>> issues", then in _addition_ to fixing the existing code paths that
>>> have this issue, I really would want to (a) get a compiler warning =
for
>>> future cases and (b) make it not actually _work_ for future cases.
>>>=20
>>> Because otherwise it will just happen again.
>>>=20
>>>> Changing the list_for_each_entry() macro first will break all of =
those cases
>>>> (e.g. the ones using 'list_entry_is_head()).
>>>=20
>>> So I have no problems with breaking cases that we basically already
>>> have a patch for due to  your automated tool. There were certainly
>>> more than a handful, but it didn't look _too_ bad to just make the
>>> rule be "don't use the iterator after the loop".
>>>=20
>>> Of course, that's just based on that patch of yours. Maybe there are =
a
>>> ton of other cases that your patch didn't change, because they =
didn't
>>> match your trigger case, so I may just be overly optimistic here.
>>=20
>> Based on the coccinelle script there are ~480 cases that need fixing
>> in total. I'll now finish all of them and then split them by
>> submodules as Greg suggested and repost a patch set per submodule.
>> Sounds good?
>=20
> Sounds good to me!
>=20
> If you need help carving these up and maintaining them over time as
> different subsystem maintainers accept/ignore them, just let me know.
> Doing large patchsets like this can be tough without a lot of
> experience.

Very much appreciated!

There will probably be some cases that do not match one of the pattern
we already discussed and need separate attention.

I was planning to start with one subsystem and adjust the coming ones
according to the feedback gather there instead of posting all of them
in one go.

>=20
> thanks,
>=20
> greg k-h

- Jakob=
