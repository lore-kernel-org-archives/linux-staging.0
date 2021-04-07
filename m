Received: from p3plsmtpa07-02.prod.phx3.secureserver.net (p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0996D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 09:45:57 +0000 (UTC)
Received: from mail-vs1-f43.google.com ([209.85.217.43])
	by :SMTPAUTH: with ESMTPSA
	id U4ihlFPCVw7iwU4ijlsUZm; Wed, 07 Apr 2021 02:43:34 -0700
X-CMAE-Analysis: v=2.4 cv=LJqj/La9 c=1 sm=1 tr=0 ts=606d7ec6
 a=rRTVnpH5p7cRNWdn2Ps6fQ==:117 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=3YhXtTcJ-WEA:10 a=pFd2Zl5z2vwA:10 a=ZZnuYtJkoWoA:10 a=pGLkceISAAAA:8
 a=4RBUngkUAAAA:8 a=1XWaLZrsAAAA:8 a=VDxRAwm8vqx6A6xO54EA:9 a=QEXdDO2ut3YA:10
 a=cDyXFGGuxjcA:10 a=_sbA2Q-Kp09kWB8D3iXc:22
X-SECURESERVER-ACCT: vthakkar@vaishalithakkar.in
Received: by mail-vs1-f43.google.com with SMTP id 2so8392758vsh.4
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 02:43:33 -0700 (PDT)
X-Gm-Message-State: AOAM533/ZKg7N6gI27j+I/WUXEwN4xEbHyktuDiG2sIlYW4fg/xLtm4P
	kym14FZi+c5EDqmepVmIuqBH+qZsXF0x0TM3cPQ=
X-Google-Smtp-Source: ABdhPJy1M/fyqnE1o5lW1Et1vqkfqgXbcQbsXSJXp0F3eHyhHPgQoVEfpM+SH58XUlUq6WZybPkDPjWCe1PCugK0zhw=
X-Received: by 2002:a67:c01d:: with SMTP id v29mr1207009vsi.23.1617788611161;
 Wed, 07 Apr 2021 02:43:31 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406160037.27225-1-fmdefrancesco@gmail.com>
 <YG1qxdRtNIIVK3fX@kroah.com> <3526833.TqPzfDAv2q@localhost.localdomain>
In-Reply-To: <3526833.TqPzfDAv2q@localhost.localdomain>
From: Vaishali Thakkar <vthakkar@vaishalithakkar.in>
Date: Wed, 7 Apr 2021 11:43:19 +0200
X-Gmail-Original-Message-ID: <CAK-LDb+JGK-m7A9CSQNCicbwMj9dfekeyT9OZwnWgSFdp6U6vg@mail.gmail.com>
Message-ID: <CAK-LDb+JGK-m7A9CSQNCicbwMj9dfekeyT9OZwnWgSFdp6U6vg@mail.gmail.com>
Subject: Re: [Outreachy kernel] [PATCH v3] staging: rtl8723bs: hal: Remove
 camelcase in Hal8723BReg.h
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Outreachy <outreachy-kernel@googlegroups.com>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CMAE-Envelope: MS4xfNPxJo61KJ3+BbiriolAq9F4BTzKVWRiAUMFnekrcFlE7aTXHjuIZ8HDkZ5Souwj17g4AvH7GJ3niHTs2bByIvTP8e9Pi/ofguAo50O8ycadkjNfOIbu
 iJjemTXDf2UzwD06uHwHsakJu4BFbcBLgUKJFwWA11KMAeV89z3kXxVOiy9cc/iPYjtNPAHKoY1La/UmZHq5XfkSs0sccaHGtn8iR5NLTpX7gTWaqpXk6Nmh

On Wed, Apr 7, 2021 at 10:49 AM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On Wednesday, April 7, 2021 10:18:13 AM CEST Greg KH wrote:
> > On Tue, Apr 06, 2021 at 06:00:37PM +0200, Fabio M. De Francesco wrote:
> > > Remove camelcase in some symbols defined in Hal8723BReg.h. These symbols
> > > are not used anywhere else, therefore this patch does not break the driver.
> > >
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > >
> > > Patch v3 changes nothing with respect to v2 and v1. It exists only to cc some recipients that were missing in the header of the previous email.
> > >
> > >  drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
> > >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > This patch does not apply to my tree right now.  Can you refresh and
> > rebase your copy of my branch and rebase it and resend?
> >
> Sure. I'm about to submit that patch again in a few minutes.

Also while you're at it, don't forget to put the information under -- about
what has changed since the first version of it. Otherwise it becomes
hard for the reviewers to track the progress of each version.

Ideally it should go like below:

Changes since v2:
Changes since v1:

> Thanks,
>
> Fabio
> >
> > thanks,
> >
> > greg k-h
> >
>
>
>
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/3526833.TqPzfDAv2q%40localhost.localdomain.



-- 
Vaishali
