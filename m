Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CD72
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 09:38:05 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id s11so8300563pgr.11
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VlKqcGCYTB8qCl/7bAn2JOSlW1jbMj9qo0YUTPNwJFg=;
        b=fvI6aGb13Mh1TOwOiNGp+GkN6oI86FxZ4fMg6lAOVgLsQ6EaIeqoDTj44IIc+fUSyD
         wCiBE0PKdvSkntniNEDDx/ZzTpON4h+ipovTG6bPxhdxYe9i6b3b4yD2oJHUVUuLQWSh
         E/zmy388CCV1JLFSvCWaIEOIRtRGabrlzLUy+F8AVM1PuSG5pea4EuiEmVS5ZwnQ18HP
         zAJkrjXnjBihD34qF8yEb501DoK2f1bFwQqC8WTsBdQfz/2XShqBIXip54fRLITfwCf4
         JCoGWvoVbP5G9RFdCZMF8pcv+B4nNRSLFZy0zxPOsrjnlp2ArkWUe1iBVYyjIW41+uIJ
         5hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VlKqcGCYTB8qCl/7bAn2JOSlW1jbMj9qo0YUTPNwJFg=;
        b=VJ/zFH7EsHDv01xQUDkDy5fqYIPGxQgQt7/4awKfMbVUO6Y6RvxfLBEKe7tr/BDf4k
         FmTMxYYj3ck383ptFjr1wFDWrujPxZhbupeN8z9eg2h3ToXKvH8BMeFlKyC+RNZYHz89
         xF0YdMM7xLCbEXfb2VIrAIkl7DzDg6XXzRLGRYbH3gV9w1R4OJ4PW7yHi8dmHBL0IGeP
         LkaePnLCfKEETmxdL2Y6pJ71kuut+kY2Tk3d27TEI/qX8TwVwx24j/SGXm7FhTaVObQ0
         GnDu5kiZkHsDfukymmGfBTIigvdIKsnlRBMW/B5ecKoJ/KZwVmJb+srgTzWWex3iuvDP
         MEGQ==
X-Gm-Message-State: AOAM533Hb1H9E/MgP6jOS7iyo2gNIz96iOM1OKWpwat0zbpV1/VWqq2z
	qd4l7OBOBFSq9PG4jrjuyKMF0G6soMaSSXJfum9x8998uTwfbw==
X-Google-Smtp-Source: ABdhPJzg8ec89ducd5rROTI4aPCpYTrJNpLa0CzESkw7X2XlG8vF1qiZjpYZod0BzwgzPjkyVQkIQ1DJzkcWq2o2PXI=
X-Received: by 2002:aa7:9d02:0:b0:3f3:df3b:81ae with SMTP id
 k2-20020aa79d02000000b003f3df3b81aemr7096763pfp.19.1630143484584; Sat, 28 Aug
 2021 02:38:04 -0700 (PDT)
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
Date: Sat, 28 Aug 2021 11:37:50 +0200
Message-ID: <CAPGkw+wq6LcVXSmuoDcTqOo=ULBBT_4DVXqXnpf7S5GW3Vzy2w@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi. Thanks for your response. Changing to  "const static" would fix
the first error but looking at the second error indicates that it
can't be a const, right? So checkpatch.pl was wrong?


Best Regards

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
>
> You shouldn't need to compile the entire kernel. That may be why your
> computer is having a hard time?
>
> Hope this helps :) and it was nice to meet you Krish
> ~Bryan
>
