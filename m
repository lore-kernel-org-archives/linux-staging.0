Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC0D72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:13:55 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id w7so8657707pgk.13
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 19:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/jnNuXLd6wympK+qQO0HGyCt2ZkGDthWPb/8Cl7JavY=;
        b=Ux8ccD4lPahs+CiIBEZQndRP3Xy2a4g9j7jWK8qERKOB61FrRrkEmZKEKJ0SOg8S3A
         LyXIVmOo0UHusA6h/UJmeEu+DXXQkrbNuKYnj5MoEV9FFtzGPfrFnU5PskOfT65adJGL
         0BJWzygpJn4c6PYDT0sBiXoIS6g4pEPYJZGbVkGWsUfhvAEW8/hOjTI2Fs+lOgVFSkvw
         Yyxoaiu19KFt1cAjLb9o5kDxe8kpKr8KQKVNDEO+b+VzNeuW4Mlb4SzHOC+GhbOneLUi
         QgdztfKYVXHGmxvgGl7EHZNJEx3F8bZd16zFEVMuvZEtj4mD2LJ3wSIC7qp/TavnKhcv
         3zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/jnNuXLd6wympK+qQO0HGyCt2ZkGDthWPb/8Cl7JavY=;
        b=Mk6DEJGHKI76Ej+2OYrarFkCpVUUMkqzOJ9LVkPAsypI1x4/XFz2iWH3Bat6l2s80h
         F9V8xPgVVY6GpVyc21Zshv//US+aohXVamg7QqFAlOTxKvmD+QxHERWvv0IuYtuLk1yc
         VixAt+e8cb8ks8cjF559VB4uzOmAXg+oDvlkZij21IkaEscJLcRiGgtOcZqYphLrPSdp
         sB11aSZGoFB9P+3J6p2lfMmR2KPGzzV0yRxxv5KJlKDxRAM0av2lEAklkhaJ9Mft3nvo
         1KmZHqSWik5SZa2BF+68IGwd2ewgP6SA90nmsqTzwH3r4mrwNtLuNgOCrfF8846hg6II
         tsHw==
X-Gm-Message-State: AOAM531mmYGCwA014vtRGFKSLXzs8Tn2nOnb/41CxUkIB9oaWNc985kY
	L9aaaxH7vzlGPbmWJCcdUsokXBbPPjIXXaXxJq5dRnYliarhgg==
X-Google-Smtp-Source: ABdhPJz1xfGNVEp2/v2bDCAZjwZFjZxC+X6U5MDLLaK6G4nW8OOvlKKS2kLQadxGCqBhCas3Hxm8hqZ+Rs2AcRZsCFE=
X-Received: by 2002:a62:e408:0:b0:3f8:d1ff:a263 with SMTP id
 r8-20020a62e408000000b003f8d1ffa263mr5997825pfh.24.1630203235166; Sat, 28 Aug
 2021 19:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
 <3634721.RBzQ2xsved@localhost.localdomain> <1742120.GgyQvu0Ciu@localhost.localdomain>
 <CAPGkw+yJ=V0OwFE+uqCeWWS8JbJD=YBE3+Uk-OKpmHRnvSTh+A@mail.gmail.com>
 <CAPGkw+w-y+iC3dMDLxi8DR3N+jf8roiJ2Vs_-uHxJ=i57eTiUA@mail.gmail.com>
 <CAPGkw+zyj4e-m19KdrHpAN_vHksNDy=k_cPPAftSN-hNoph0=w@mail.gmail.com> <20210827233835.px4az5hyqks2n4o5@h510>
In-Reply-To: <20210827233835.px4az5hyqks2n4o5@h510>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sun, 29 Aug 2021 04:13:43 +0200
Message-ID: <CAPGkw+x7sXUtrZYv6tm+Apbjk5CYwd1j1BvvL6uCPWsot3zKSg@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2021 at 1:38 AM Bryan Brattlof <hello@bryanbrattlof.com> wr=
ote:
>
> Hi Krish!
>
> I'm sure someone has said something by now, however "top posting", where
> you reply to emails by writing on the top can make things hard to read
> on the mailing lists. The conversation is upside down when reading.
>
>    https://en.wikipedia.org/wiki/Posting_style#Top-posting
>
> Next time try writing underneath the text your referring to like this:
> Don't worry we're all learning here :)
>
> On this day, August 27, 2021 thus sayeth Krish Jain:
> > I unfortunately forgot to add Greg to this thread. Doing so now. I
> > apologize for the confusion, if any. This patch was regarding the
> > staging tree's file android/ashmem.c and declaring the file_operations
> > struct as const as done elsewhere in the kernel, because there are no
> > modifications to its fields.
> >
> > Warm Regards
> >
>
> Things can be a little deceiving in the kernel. That's why testing your
> changes before you submit them can be helpful.
>
> But don't worry too much if you break something, there are countless
> bots trying to break the kernel every day. It usually means you're
> learning when you break something.
>
> >
> > On Fri, Aug 27, 2021 at 8:38 PM Krish Jain <krishjain02939@gmail.com> w=
rote:
> > >
> > > So what do you think I can do?
> > >
> > > Best Regards
> > >
>
> That's a tough one as it really depends on your situation. When I first
> started programming I had a *really* old (even for that time) laptop
> that couldn't do much.  It wasn't ideal but I found I could connect
> through ssh to a virtual machine my university lent me to "learn to
> code".
>
> I have no idea what your situation is like. Though having a second
> computer to compile code while I wrote worked for me.
>
> > >
> > > On Fri, Aug 27, 2021 at 10:50 AM Krish Jain <krishjain02939@gmail.com=
> wrote:
> > > >
> > > > Hi, yes, this is my first time programming at this low level. And y=
es,
> > > > I read both docs now. Furthermore the issue is that my current
> > > > hardware can't handle building the kernel, it barely managed to
> > > > survive the first build after 2 hours so I don't know how I can. If=
 I
> > > > change it to static const would it fix the issue and build
> > > > successfully?  If not what would be the error message, then I can
> > > > debug. Thanks
> > > >
>
> As for your patch, I built the driver using:
>
>   $ make CCFLAGS=3D-Werror W=3D1 M=3Ddrivers/staging/android
>
> Which produced the following error:
>
>
> drivers/staging/android/ashmem.c: In function =E2=80=98ashmem_mmap=E2=80=
=99:
> drivers/staging/android/ashmem.c:380:2: warning: =E2=80=98static=E2=80=99=
 is not at beginning of declaration [-Wold-style-declaration]
>   380 |  const static struct file_operations vmfile_fops;
>       |  ^~~~~
> drivers/staging/android/ashmem.c:431:16: error: assignment of read-only v=
ariable =E2=80=98vmfile_fops=E2=80=99
>   431 |    vmfile_fops =3D *vmfile->f_op;
>       |                ^
> drivers/staging/android/ashmem.c:432:21: error: assignment of member =E2=
=80=98mmap=E2=80=99 in read-only object
>   432 |    vmfile_fops.mmap =3D ashmem_vmfile_mmap;
>       |                     ^
> drivers/staging/android/ashmem.c:433:34: error: assignment of member =E2=
=80=98get_unmapped_area=E2=80=99 in read-only object
>   433 |    vmfile_fops.get_unmapped_area =3D
>       |                                  ^
> make[1]: *** [scripts/Makefile.build:271: drivers/staging/android/ashmem.=
o] Error 1
> make: *** [Makefile:1851: drivers/staging/android] Error 2
>

Hi, this seems very useful and I tried this myself just now. I don't
get any errors that you do though. When I hit enter I just get a new
shell prompt. What am I doing wrong? Probably a silly mistake. I ran
make CCFLAGS=3D-Werror M=3Ddrivers/staging/android/.


- Krish

> You shouldn't need to compile the entire kernel. That may be why your
> computer is having a hard time?
>
> Hope this helps :) and it was nice to meet you Krish
> ~Bryan
>
