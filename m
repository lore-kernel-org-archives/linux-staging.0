Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9D2CA9
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 22:37:21 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id s9so2395995oib.11
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 14:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PifLMi0zlGTgQS9puH7XvyhNJKKGKBmnkxGjrrgwy5Q=;
        b=GmUR4KytawYOJqKRpnN088ETGAv0pHwfsXThUth7+jNbCxxZ7WKC1pSlHNC372YjB7
         3moR9FBbLK7Hy5tlWLYW2rmXU1yacgo1jR2KEJoSMCFTG9XzYfw5Q5gEmjHFK1hKj+jh
         brZH8ZXPAHAd6XcjvmokbcJL22NduYNXI+9xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PifLMi0zlGTgQS9puH7XvyhNJKKGKBmnkxGjrrgwy5Q=;
        b=XIoaBpTW/BXACHy8YiX/JkkQCcBCxTKAhKiwLwJIAd8CB6VcrM8C1Miz0M4MRsOnyN
         TzlZNWN9PWKr9Rp3krhKfFmhLJw0CxS9eQoT/mqTbOVL1YU7sC8crDWoR5rMKR6eMRPZ
         cCaPOVz7DUWajUeZbdHjfAz9ymDz6ZTB7J4q6zY0AlKrRvF11pxrzL6Kdet1UZlXV54Z
         NeIpiPIyVbFyfPEVJIBp4zdJemMUmfGby3uWJWQcWrQgLnAzqP3RJU5dZkTXEySUppHY
         7Vunb5PTGGZveG/kSHEVZYlIhZFYOOjmbx4YJdy5mwAMekWcKcsFgTJ/r0jHA2/hpaRx
         MbAA==
X-Gm-Message-State: AOAM530fru78oyq9fMKz56MAbILeS/+f+NDEku/yfV+aZIcbSyD/IxkF
	cXpDmfSTyJbi+8Z0eDZZpOqGLxWvAhjx+IuDIsLWTQ==
X-Google-Smtp-Source: ABdhPJynVYV2Qw40URajg8X99oS9Kekj6o6l97S3dWfHfSque0qeESj02QYmiIRzacI/nhXJ7inCFFpWeT+C9NYUHDo=
X-Received: by 2002:a05:6808:1406:: with SMTP id w6mr501539oiv.330.1643236640611;
 Wed, 26 Jan 2022 14:37:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de> <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de> <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com> <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com> <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com>
In-Reply-To: <YfFZkgE3wfPXLpYA@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 23:37:09 +0100
Message-ID: <CAKMK7uF=75vCS1z4wfvEdGEaHu9-Uxpyu94Y4umbXO9ihBhbvQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org, 
	Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 3:24 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Jan 26, 2022 at 03:18:14PM +0100, Javier Martinez Canillas wrote:
> > On 1/26/22 15:11, Andy Shevchenko wrote:
> > > On Wed, Jan 26, 2022 at 02:47:33PM +0100, Javier Martinez Canillas wrote:
> > >> On 1/26/22 14:27, Andy Shevchenko wrote:
> > >>> On Wed, Jan 26, 2022 at 12:18:30PM +0100, Javier Martinez Canillas wrote:
> > >>>> On 1/26/22 11:59, Helge Deller wrote:
> > >>>>> On 1/26/22 11:02, Andy Shevchenko wrote:
> > >
> > > ...
> > >
> > >>>>>> P.S. For the record, I will personally NAK any attempts to remove that
> > >>>>>> driver from the kernel. And this is another point why it's better not
> > >>>>>> to be under the staging.
> > >>>>>
> > >>>>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
> > >>>>> features or even attempting to remove fbdev altogether (unless all
> > >>>>> relevant drivers are ported to DRM).
> > >>>>
> > >>>> But that will never happen if we keep moving the goal post.
> > >>>>
> > >>>> At some point new fbdev drivers should not be added anymore, otherwise
> > >>>> the number of existing drivers that need conversion will keep growing.
> > >>>
> > >>> This thread is not about adding a new driver.
> > >>
> > >> It was about adding a new drivers to drivers/video/ (taken from staging).
> > >
> > > Does it mean gates are open to take any new fbdev drivers to the staging?
> > > If not, I do not see a point here.
> > >
> >
> > Good question. I don't know really.
> >
> > But staging has always been more flexible in what's accepted there and
> > that's why some distros avoid to enable CONFIG_STAGING=y in the kernel.
>
> And that's why if you load a staging driver, it enables TAINT_CRAP in
> your runtime flags :)

fwiw I'm fine with adding new fbdev drivers to staging, that really
doesn't hurt anyone. Adding drm drivers to staging tends to be pain,
least because if we need to do any changes to helpers there's a
cross-tree cordination problem usually, and the benefit of staging
hasn't in the past really outweighted that. Plus I try for us to land
new drivers when they're good enough directly into drivers/gpu, and
not aim for perfect.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
