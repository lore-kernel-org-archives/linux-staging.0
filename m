Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3BC72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:16:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u6so8623655pfi.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 19:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f9IIPedBoddZPb1L8A5yGgQYZa4Tn0bJxJHmZki7lF8=;
        b=JXlhH0/Idz1rKZtD3UnVeLuKZSAEtUSbrRL2HzPie7vqr981mOQt/jfYyua2skG7mc
         y3cX3TNwEVDMUUJEjXapZZAViZ0dqv2egyIduHY1erEZLdWO9NU16O84S/vfT2S/r+UR
         cQceRkXzrobO4xtubW5L6bJV0/VFFbr2cgNqTlLU+IVXJmzMeJTVPqJsFg8RbtOajpe6
         VNNnXzTF4Tq7RzmikrWtX613cZACwfFpQlrEr+G0GHMcb3qLVftMP5kD6XjK13ixip8q
         YKSbnURBhL5TR1JUIZiDbYPWS6aP4NX9QanrKM+/W/b0wVwxPFWCRH0/FpNOUJrXxOmD
         BhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f9IIPedBoddZPb1L8A5yGgQYZa4Tn0bJxJHmZki7lF8=;
        b=XM/1eG6E5Ff1lhN6Uq/UdzqyRgpdvFcFIuch6/7wmAGYg+oKNcM68v5KytqsmXnxa/
         bHXt+2kFPHKX2fTrGkGVhZ5iwJ43W50mtHEr0/4zvJSoL4WSXjreCiT+7a3nHJa3SIDV
         9T/dLFwO5v/RgEZ2NJUBi8J0lI8+ackmYesWZLDjA0W5uipkeI78PuiNJuMZU90ko09G
         d/EsxBo0ZmtqQyc3DqC9zC7xQAzZ/ZJeehD/YapPbFmakET8unyPLp/IzvtN9ge0taDJ
         ZwR6PfUJwpliVDGkUrdWS4xedxsf2hNQ134js/c/5+XhGEbxXcfFbVYXx4+XCOZPfl/W
         Tihg==
X-Gm-Message-State: AOAM530uzkyT3JvL2MTm+FrQZGY8KMuRX18ed6PtEhl3jkjTGw3fYbf1
	E1RdyCHhf4OXlRn97B3C7MQg2PFrWeK/tgG2ZR8=
X-Google-Smtp-Source: ABdhPJynDG0YcWK/cctFt2DrnC29NiuL+mFXOjzsnlAulCrmBpeSfFKvGMdJVeeDEDj49dSLLo3PJWRFd2xsMBKtfjo=
X-Received: by 2002:a63:c045:: with SMTP id z5mr6936583pgi.374.1630203384198;
 Sat, 28 Aug 2021 19:16:24 -0700 (PDT)
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
 <CAPGkw+zyj4e-m19KdrHpAN_vHksNDy=k_cPPAftSN-hNoph0=w@mail.gmail.com>
 <20210827233835.px4az5hyqks2n4o5@h510> <CAPGkw+x7sXUtrZYv6tm+Apbjk5CYwd1j1BvvL6uCPWsot3zKSg@mail.gmail.com>
In-Reply-To: <CAPGkw+x7sXUtrZYv6tm+Apbjk5CYwd1j1BvvL6uCPWsot3zKSg@mail.gmail.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sun, 29 Aug 2021 04:16:13 +0200
Message-ID: <CAPGkw+xQCwRU8Bw97-x5Qf1v2Bncq7tC9ksXznezefYZQSxCGg@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I meant I ran "make CCFLAGS=3D-Werror W=3D1
M=3Ddrivers/staging/android"  and I get no error.

On Sun, Aug 29, 2021 at 4:13 AM Krish Jain <krishjain02939@gmail.com> wrote=
:
>
> On Sat, Aug 28, 2021 at 1:38 AM Bryan Brattlof <hello@bryanbrattlof.com> =
wrote:
> >
> > Hi Krish!
> >
> > I'm sure someone has said something by now, however "top posting", wher=
e
> > you reply to emails by writing on the top can make things hard to read
> > on the mailing lists. The conversation is upside down when reading.
> >
> >    https://en.wikipedia.org/wiki/Posting_style#Top-posting
> >
> > Next time try writing underneath the text your referring to like this:
> > Don't worry we're all learning here :)
> >
> > On this day, August 27, 2021 thus sayeth Krish Jain:
> > > I unfortunately forgot to add Greg to this thread. Doing so now. I
> > > apologize for the confusion, if any. This patch was regarding the
> > > staging tree's file android/ashmem.c and declaring the file_operation=
s
> > > struct as const as done elsewhere in the kernel, because there are no
> > > modifications to its fields.
> > >
> > > Warm Regards
> > >
> >
> > Things can be a little deceiving in the kernel. That's why testing your
> > changes before you submit them can be helpful.
> >
> > But don't worry too much if you break something, there are countless
> > bots trying to break the kernel every day. It usually means you're
> > learning when you break something.
> >
> > >
> > > On Fri, Aug 27, 2021 at 8:38 PM Krish Jain <krishjain02939@gmail.com>=
 wrote:
> > > >
> > > > So what do you think I can do?
> > > >
> > > > Best Regards
> > > >
> >
> > That's a tough one as it really depends on your situation. When I first
> > started programming I had a *really* old (even for that time) laptop
> > that couldn't do much.  It wasn't ideal but I found I could connect
> > through ssh to a virtual machine my university lent me to "learn to
> > code".
> >
> > I have no idea what your situation is like. Though having a second
> > computer to compile code while I wrote worked for me.
> >
> > > >
> > > > On Fri, Aug 27, 2021 at 10:50 AM Krish Jain <krishjain02939@gmail.c=
om> wrote:
> > > > >
> > > > > Hi, yes, this is my first time programming at this low level. And=
 yes,
> > > > > I read both docs now. Furthermore the issue is that my current
> > > > > hardware can't handle building the kernel, it barely managed to
> > > > > survive the first build after 2 hours so I don't know how I can. =
If I
> > > > > change it to static const would it fix the issue and build
> > > > > successfully?  If not what would be the error message, then I can
> > > > > debug. Thanks
> > > > >
> >
> > As for your patch, I built the driver using:
> >
> >   $ make CCFLAGS=3D-Werror W=3D1 M=3Ddrivers/staging/android
> >
> > Which produced the following error:
> >
> >
> > drivers/staging/android/ashmem.c: In function =E2=80=98ashmem_mmap=E2=
=80=99:
> > drivers/staging/android/ashmem.c:380:2: warning: =E2=80=98static=E2=80=
=99 is not at beginning of declaration [-Wold-style-declaration]
> >   380 |  const static struct file_operations vmfile_fops;
> >       |  ^~~~~
> > drivers/staging/android/ashmem.c:431:16: error: assignment of read-only=
 variable =E2=80=98vmfile_fops=E2=80=99
> >   431 |    vmfile_fops =3D *vmfile->f_op;
> >       |                ^
> > drivers/staging/android/ashmem.c:432:21: error: assignment of member =
=E2=80=98mmap=E2=80=99 in read-only object
> >   432 |    vmfile_fops.mmap =3D ashmem_vmfile_mmap;
> >       |                     ^
> > drivers/staging/android/ashmem.c:433:34: error: assignment of member =
=E2=80=98get_unmapped_area=E2=80=99 in read-only object
> >   433 |    vmfile_fops.get_unmapped_area =3D
> >       |                                  ^
> > make[1]: *** [scripts/Makefile.build:271: drivers/staging/android/ashme=
m.o] Error 1
> > make: *** [Makefile:1851: drivers/staging/android] Error 2
> >
>
> Hi, this seems very useful and I tried this myself just now. I don't
> get any errors that you do though. When I hit enter I just get a new
> shell prompt. What am I doing wrong? Probably a silly mistake. I ran
> make CCFLAGS=3D-Werror M=3Ddrivers/staging/android/.
>
>
> - Krish
>
> > You shouldn't need to compile the entire kernel. That may be why your
> > computer is having a hard time?
> >
> > Hope this helps :) and it was nice to meet you Krish
> > ~Bryan
> >
