Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF2C72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 09:39:54 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so7980807pjt.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MmLaKagS31srib53jXrdLBXwGqYoszuOVVS08Z19pEc=;
        b=qXCxsVgWNHCrsPxwnQAtn+x4zgRta3DM1dAW73hdbKD2o/ZD4lnbQfnpGK3UI+G6dc
         Ps4ETLezOE4j8YQjh2iNTGomuDXNOSGUxIcfPhm5FGN/Q05mddCpZH+xJjXGlg2f/Qqb
         iafAYlpZO/caOhXj5noLaJUYqIdzEk1RprQ4upehwj22YycWIFp8/+p5Her7mX8MvzPd
         tl5VQvwc9eXfeeCZR0WnbQVM4g2VgypaJ2TL9Xv6Egl01IqHICOcpM0b3NnI8bktL4Sv
         5rxNiK1eEwkgX06QrZrOtpq5TXWdtfXR57nrBvBqCXuSlmZokZ9BJS+mDQz5GcfcrTH8
         Tb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MmLaKagS31srib53jXrdLBXwGqYoszuOVVS08Z19pEc=;
        b=tcf1eSx3rvO+u0bzflF8AFVunrK0VN4tDGo+Fwj97cbfHm+XgqL11fMym9i40vLIPs
         p5pYYbUj8+arh7SvS0C7ydc314tP25pdhBpXPP3V6DzBffg+H2/V6hokm4nOgh1A2DNx
         UabE7RuGMHOuLBEcv0Wf+k0aejYPpgMQv6AqeNgDjWYuG+M625WHKWksRX+fDzY9f52c
         w0xSgmKlOUUr/hf7bdNRJwXsTLJn1KJQAj/7GtaA8pAn8na4UMeawzDTNLJIljnKQwU8
         +3nGoYn62J2V7Hd+DcQm1oDD9p7uLKz5EEvzxnUnA2yCE8DiuovqfnNSCIGZeHlZRw0j
         fM6w==
X-Gm-Message-State: AOAM530XQeVqzi8J/1eJPWQAbA94fHYMf6Fd98TzyFkDbJV4FayWlQ54
	gR0WE84wIXSDsBQeHKqGA6xHVgFTeq3KSlTPAMkEnxTai06wsA==
X-Google-Smtp-Source: ABdhPJz6TMQi08thXw+nqtgAQP1ZikB52XM8X5PQjditJTQcdD9njDMvK9qxSGPc+Yc8t5yJuNbDCNr9sz0phABq4FA=
X-Received: by 2002:a17:90b:1c83:: with SMTP id oo3mr20482892pjb.26.1630229993821;
 Sun, 29 Aug 2021 02:39:53 -0700 (PDT)
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
 <YSsmV3LIZ9NLZkdQ@kroah.com>
In-Reply-To: <YSsmV3LIZ9NLZkdQ@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sun, 29 Aug 2021 11:39:42 +0200
Message-ID: <CAPGkw+wOvXm6eZWdpULAi_Of41FWSGvC911S-cO1G2roSU7P8g@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2021 at 8:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Aug 29, 2021 at 04:13:43AM +0200, Krish Jain wrote:
> > On Sat, Aug 28, 2021 at 1:38 AM Bryan Brattlof <hello@bryanbrattlof.com=
> wrote:
> > > As for your patch, I built the driver using:
> > >
> > >   $ make CCFLAGS=3D-Werror W=3D1 M=3Ddrivers/staging/android
> > >
> > > Which produced the following error:
> > >
> > >
> > > drivers/staging/android/ashmem.c: In function =E2=80=98ashmem_mmap=E2=
=80=99:
> > > drivers/staging/android/ashmem.c:380:2: warning: =E2=80=98static=E2=
=80=99 is not at beginning of declaration [-Wold-style-declaration]
> > >   380 |  const static struct file_operations vmfile_fops;
> > >       |  ^~~~~
> > > drivers/staging/android/ashmem.c:431:16: error: assignment of read-on=
ly variable =E2=80=98vmfile_fops=E2=80=99
> > >   431 |    vmfile_fops =3D *vmfile->f_op;
> > >       |                ^
> > > drivers/staging/android/ashmem.c:432:21: error: assignment of member =
=E2=80=98mmap=E2=80=99 in read-only object
> > >   432 |    vmfile_fops.mmap =3D ashmem_vmfile_mmap;
> > >       |                     ^
> > > drivers/staging/android/ashmem.c:433:34: error: assignment of member =
=E2=80=98get_unmapped_area=E2=80=99 in read-only object
> > >   433 |    vmfile_fops.get_unmapped_area =3D
> > >       |                                  ^
> > > make[1]: *** [scripts/Makefile.build:271: drivers/staging/android/ash=
mem.o] Error 1
> > > make: *** [Makefile:1851: drivers/staging/android] Error 2
> > >
> >
> > Hi, this seems very useful and I tried this myself just now. I don't
> > get any errors that you do though. When I hit enter I just get a new
> > shell prompt. What am I doing wrong? Probably a silly mistake. I ran
> > make CCFLAGS=3D-Werror M=3Ddrivers/staging/android/.
>
> Are you sure the file is being built at all?  You usually have to select
> the proper configuration option to enable that driver as well.


Hi, what option do you mean?  I already ran make allmodconfig and sudo
make modules_install install and then make   "CCFLAGS=3D-Werror W=3D1
M=3Ddrivers/staging/android/" and now I do get output but one line
"WARNING: Symbol version dump "Module.symvers" is missing. Modules may
not have dependencies or modversions. You may get many unresolved
symbol warnings." . Then I tried "make CCFLAGS=3D-Werror V=3D1
M=3Ddrivers/staging/android/" and that outputted the following:


test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \
echo >&2; \
echo >&2 "  ERROR: Kernel configuration is invalid."; \
echo >&2 "         include/generated/autoconf.h or
include/config/auto.conf are missing.";\
echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
to fix it."; \
echo >&2 ; \
/bin/false)
make -f ./scripts/Makefile.build obj=3Ddrivers/staging/android \
single-build=3D \
need-builtin=3D1 need-modorder=3D1
sh ./scripts/modules-check.sh drivers/staging/android/modules.order
make -f ./scripts/Makefile.modpost
WARNING: Symbol version dump "Module.symvers" is missing.
         Modules may not have dependencies or modversions.
         You may get many unresolved symbol warnings.
make -f ./scripts/Makefile.modfinal



I followed this and ran make oldconfig && make prepare but all that is
outputted is again  "WARNING: Symbol version dump "Module.symvers" is
missing. Modules may not have dependencies or modversions. You may get
many unresolved symbol warnings." Then I just tried sudo make
modules_install install   again and what was outputted was:


sed: can't read modules.order: No such file or directory
make[1]: *** [Makefile:1494: __modinst_pre] Error 2
make: *** [Makefile:351: __build_one_by_one] Error 2



Any ideas?  I've been stuck on debugging for hours to no avail. Please
enlighten me on where I am messing up.


Best Regards





> thanks,
>
> greg k-h
