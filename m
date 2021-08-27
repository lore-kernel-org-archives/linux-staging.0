Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590223FC1
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 19:46:24 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id fs6so5231867pjb.4
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s4fMrLdYeOVJ7FAKn+gTvf9DPyxEV4lP24CasHOh+wc=;
        b=MzfjLr+0zXATCfeKfj1gStH2r9/QkLKUuTwu6RXB6FF+pGTbHZMJ+BFncRZImDlMPz
         TAJyaIOa3bmr7oJZGTzsg4MpFCY+biqT7ydsHrVkpgxERshnnhRcoNCV0iZptmm9bIRG
         0kgLS4bmNoJpvCrqSocSeNlYdQEQoqk2yKatY5c8u0u+QPVi5Pkj9yN2HNOO72+x4tTY
         H++KZNGqU9Xe7riDUtun8bDsYCKjoXSKjVwMBPz9uj8QRO7qMuVJzDyOJ6Ql0Scgp2qI
         r+sd3NiWrgCnyC8/yuWqDISY9Rieufxx4HGUgjbk4EnFZVD6wFQ1Tv34UarPHE5AGl6P
         iMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4fMrLdYeOVJ7FAKn+gTvf9DPyxEV4lP24CasHOh+wc=;
        b=TNvuvX6lLzCxyFxpAp4xtp9NC3uiFom4kIybyU8c0xRlQFzalfjEJLFt6Onnq9SlgU
         tUfH9xipDpUt5bLgVRDO3PO6eHQUEYfAuEsGEJAXjbhO+TIaxlF0mO17vkRQN2hxHjNE
         RVeH/ZHE+XQUP6EgZRpYO84CQ+lyDf7Mf9xeHDcwh4ZwXvDcesgD/y6ICPs2ZS31ippz
         /Ptwtz0L+M2k14nVYSdcmnAiAj5/ey+9D1kIRaB0K4AywaOrpwf9iSrfH9S72pdLLfw/
         iI9eWRayIl2oi1NtI4fsqD6L77WFQNr3K2VZ/RP/Civbe/Ei05ko/VMA2UlRdyDM8ex3
         NMHA==
X-Gm-Message-State: AOAM531pc3mLm8teFklE1CuPVjILGahQM42RZLmobnONzN0ssDnG3v+U
	tcdEQJWaYugsmNgeDOR559hoq3jvwqIPa+D+yjk=
X-Google-Smtp-Source: ABdhPJyhoGQNesFUYfNUjnr0miUtKJi4NCcP9m86s9dOXozx81QaL8eN09mRDUUHlBTmWsoqEFWqTV/mqwxuKiAo2NU=
X-Received: by 2002:a17:90a:520c:: with SMTP id v12mr10155035pjh.105.1630093583921;
 Fri, 27 Aug 2021 12:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
 <3634721.RBzQ2xsved@localhost.localdomain> <1742120.GgyQvu0Ciu@localhost.localdomain>
 <CAPGkw+yJ=V0OwFE+uqCeWWS8JbJD=YBE3+Uk-OKpmHRnvSTh+A@mail.gmail.com> <CAPGkw+w-y+iC3dMDLxi8DR3N+jf8roiJ2Vs_-uHxJ=i57eTiUA@mail.gmail.com>
In-Reply-To: <CAPGkw+w-y+iC3dMDLxi8DR3N+jf8roiJ2Vs_-uHxJ=i57eTiUA@mail.gmail.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Fri, 27 Aug 2021 21:46:10 +0200
Message-ID: <CAPGkw+zyj4e-m19KdrHpAN_vHksNDy=k_cPPAftSN-hNoph0=w@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I unfortunately forgot to add Greg to this thread. Doing so now. I
apologize for the confusion, if any. This patch was regarding the
staging tree's file android/ashmem.c and declaring the file_operations
struct as const as done elsewhere in the kernel, because there are no
modifications to its fields.

Warm Regards


On Fri, Aug 27, 2021 at 8:38 PM Krish Jain <krishjain02939@gmail.com> wrote:
>
> So what do you think I can do?
>
> Best Regards
>
>
> On Fri, Aug 27, 2021 at 10:50 AM Krish Jain <krishjain02939@gmail.com> wrote:
> >
> > Hi, yes, this is my first time programming at this low level. And yes,
> > I read both docs now. Furthermore the issue is that my current
> > hardware can't handle building the kernel, it barely managed to
> > survive the first build after 2 hours so I don't know how I can. If I
> > change it to static const would it fix the issue and build
> > successfully?  If not what would be the error message, then I can
> > debug. Thanks
> >
> > On Fri, Aug 27, 2021 at 9:48 AM Fabio M. De Francesco
> > <fmdefrancesco@gmail.com> wrote:
> > >
> > > On Friday, August 27, 2021 8:49:30 AM CEST Fabio M. De Francesco wrote:
> > > > On Friday, August 27, 2021 3:59:28 AM CEST Krish Jain wrote:
> > > > >  From: Krish Jain <krishjain02939@gmail.com>
> > > > >
> > > > > Declare the file_operations struct as const as done elsewhere in the
> > > > > kernel, as there are no modifications to its fields.
> > > > >
> > > > > Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> > > > > ---
> > > > > []
> > > > Are you sure that it works? I wouldn't be.
> > > > You didn't build this file. Please build your changes before submitting patches.
> > > >
> > > > Furthermore, please always rebase to the current version of the staging tree.
> > > >
> > > > Finally, please use the class modifier "static" as the first keyword of a declaration/definition
> > > > as it is done everywhere in the kernel (see "grep -rn "static const" drivers/staging/" and
> > > > then switch to "const static" and read the output).
> > >
> > > Please don't misunderstand me: as far as I can see this is your first patch and
> > > (I'm pretty sure I can speak for everyone else about this) you are very welcome
> > > to staging and to kernel hacking :)
> > >
> > > However, before posting further works, you'd better read at least the following
> > > documents:
> > >
> > > https://www.kernel.org/doc/html/latest/process/4.Coding.html
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > >
> > > And please don't forget to always CC linux-kernel@vger.kernel.org.
> > >
> > > Have a nice time with kernel hacking.
> > >
> > > Thanks,
> > >
> > > Fabio
> > >
> > >
