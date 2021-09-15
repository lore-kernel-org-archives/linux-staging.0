Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668073FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 14:20:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MeCd5-1n0g471NHL-00bIG2 for <linux-staging@lists.linux.dev>; Wed, 15 Sep
 2021 16:20:00 +0200
Received: by mail-wm1-f44.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso4944014wms.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 07:19:59 -0700 (PDT)
X-Gm-Message-State: AOAM530XePu+l9eT0uFPDaEbO0SVVaaCWec/78Hw9h9dM5Z+nitiFvuc
	pj2gZ+0arembua8MgGGs9RhSWt7M6KpkYaaq3Co=
X-Google-Smtp-Source: ABdhPJz8J4pJD+afwfweySjUuRBGa8LE2pnN/Ho6Oq2xiKUYXAx1VWdT2VBNYglVJPI9KXcGv93s3eNUwo2NtweqBfs=
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr4757847wmp.173.1631715599598;
 Wed, 15 Sep 2021 07:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210914213532.396654-1-gascoar@gmail.com> <260b38b8-6f3f-f6cc-0388-09a269ead507@i2se.com>
 <d09502f2-84d2-839f-1350-ae7f248e5981@raspberrypi.com>
In-Reply-To: <d09502f2-84d2-839f-1350-ae7f248e5981@raspberrypi.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Sep 2021 16:19:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3HGm1cPo4sW9fOY4E8AN8yAq3tevXxU5m8bmtmsU8WKw@mail.gmail.com>
Message-ID: <CAK8P3a3HGm1cPo4sW9fOY4E8AN8yAq3tevXxU5m8bmtmsU8WKw@mail.gmail.com>
Subject: Re: [PATCH 1/8] staging: vchiq_arm: replace sleep() with usleep_range()
To: Phil Elwell <phil@raspberrypi.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Gaston Gonzalez <gascoar@gmail.com>, 
	linux-staging@lists.linux.dev, gregkh <gregkh@linuxfoundation.org>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ojaswin98@gmail.com, 
	Amarjargal Gundjalam <amarjargal16@gmail.com>, 
	"moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:sIEfIE7Gnk3aKfR5qC2Jie8MhH4JhL6QzeY6TsEHch0cjkRphK0
 o10RETQzs3f1odTHaKAjuJwMFqdvqwLPQdZJhFi9qEWo/pWeBRdi81WcDrDQriEsIVRtu8l
 unOJ0lF9n7lKC6AM+WLxgR8eyExDmTlq6kvat6KG/SEfRYxZoWd44R2jl7ki5k3j8oWjP+G
 9/hvwYpY/Ihq3wJ4J2bdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C2lxkHMm7GA=:5Xbfm6n1KxSJ+X4L5yXF7I
 6P4gXT/NcNB6BBBZPJhO40oh6IMGkN5QcaocJgSzCv+AjfH25fmCxXiM/ams6gT5hqho0xDUs
 xq3HiIcqOUla+ioyLUyALFabQ5h7tuPnyqEowD/6spmdyEkwr3zHhhnPMrRnoEg97NYVGtE9/
 u80RKeVFyqXqNv41PO/mwOZpmVO7AU7ZfRRDwLNR+7QiwrXe13nyNwKWhsK4I4YeNUTIiCjCB
 LJuc8g2O4CYNVJBQ5ob28eYC0zxSzD10SCTQsbYQ5G8uP9P59XeUvKvMc6hN7q01x9Kpt0wjG
 D1bJHCbi3ROXIq7MD8Dk9/XbTIUtn0SYhl05390h68X6FAhRTVpH/oRWLwaloyNEXsxURstEr
 1mL8Va4hb/RAKBPlyvxZLYOfGkygrI9ARgs3XPhrnZkodM9lXM/lR5IJ/ksje4+yPwktKvKmt
 Z1gW1VKwYzoMmokjWeGlFN2dItEvLX0CGJMa1fOVmq7HlmoZxO5Fs1yeApFFShZMk3vc4wa7G
 0hGfLmLxRO04pYQ1XBqmoAQ8C2t4EPxM1IYM57DLAfnYTAPB4fu+MLeGEYHFJl0eIfrVALBUQ
 sphIUbToLDZK5y1IBckZefuPbxCJJf+nW09CKjY8EEp4uehanyXHhocQA1POB8GCyYHYoX7SO
 JX6gOu4USZLFpwVrwDXObbShEttqFzU4d6hdhUciH0MFVYcGhvRnv5WsgQ40eVm6h5KOJYMBm
 ZiJB0yrf5kfQypF7odRigUkyHGcdD7H+25DBLOHy65b4YJgi9sLVP1ZEKr4EXQ5kgPyXwXJOt
 RhwmU3/FsB4na7nKtYOF85nqPIQEtlaFGDaw1lBX8TZf3Z8g9XjbIGNLVqus+U7TltH1yZMLW
 8I4cnpxm4S0TAKi4u3XQ==

On Wed, Sep 15, 2021 at 10:06 AM Phil Elwell <phil@raspberrypi.com> wrote:
>
> Hi Stefan,
>
> On 15/09/2021 06:21, Stefan Wahren wrote:
> > Hi,
> >
> > Am 14.09.21 um 23:35 schrieb Gaston Gonzalez:
> >> usleep_range() should be used instead of sleep() when sleepings range
> >> from 10 us to 20 ms, [1].
> >>
> >> Reported by checkpatch.pl
> >>
> >> [1] Documentation/timers/timers-howto.txt
> >> ---
> >>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> index b25369a13452..0214ae37e01f 100644
> >> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >> @@ -824,7 +824,7 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
> >>              if (status != VCHIQ_RETRY)
> >>                      break;
> >>
> >> -            msleep(1);
> >> +            usleep_range(1000, 1100);
> >
> > from my understanding the usage of usleep_range() and hrtimers isn't
> > necessary here. The intention is to sleep a little bit and not "exactly"
> > 1 ms.
> >
> > @Phil Elwell: what is your opinion?
>
> Exactly - the aim is just to stop it spinning.

This is usually a sign for something else being wrong in the thing it's
waiting for. I can see multiple 'return VCHIQ_RETRY' statements in
vchiq_bulk_transfer(), however these all happen when the task
has received a signal and wait_for_completion_interruptible()
or mutex_lock_killable() has returned an error.

I don't see why one of them would return on any signal and the other
one only fatal signals, as you usually want those conditions to be the
same, but in either case, the loop is broken because as soon as
you get a signal, those interfaces will keep returning the same error
and you can never break out of the loop any more.

I don't know how to properly fix it, but it's clear that vchiq_bulk_transmit()
needs to propagate the -EINTR or -ERESTSTARTSYS back to user space
to let the calling task handle the signal before retrying.

        Arnd
