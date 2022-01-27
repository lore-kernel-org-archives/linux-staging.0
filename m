Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD41629CA
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 16:34:50 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so3056240ota.10
        for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TkE5ArX6BFaW8oAI30DS2hxpGdwoTPUB8Ux3SxWDgeI=;
        b=QGT2t+qW5UWjMj0Gkd3nJ/86yRunTkPO8G0V17um9k6ChCDDLQZc4L8/dri6J65r1K
         zjWteQNbI8BjQ5JYcg0sdOgNyZNd/hhTLmf8gOoQMb+xgLsPasILyl1fXa+7xSlJoumE
         u2aSkxfbqBFM5zH5mxnupZiY7mHP95nE4+lFJKMEv0YJmBEdOtfp7FFv+3xHz604r4GX
         NGY02uTyRxkHd7LLIoux6O1uUqoOJrOoSmF1bNJBEwlK2je1RI/1XlQJeOzMyXvUz17F
         iCRkiKUyl/E4M44vPvIcgsuxgaELjwL6mo/TXod1iGksHqdlRLfdxFwP7Z6rTr/aAThY
         MSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TkE5ArX6BFaW8oAI30DS2hxpGdwoTPUB8Ux3SxWDgeI=;
        b=ocZpIM+PeoUHmsdabNdj4KaWBmaOh7mJAykgteuYgcvzKUBaC4Q1Wbl01sWhQZWwpX
         5dz7Roa8byDn1FRDQmkDrtq9pywyVNZ1en8JQaO+RxysJ8ZkoRDmDtz/JtFVW/2GvRQ2
         /UdyAk0hVIQwSwMaFTOrsAVyE9veQCDz/WSB46Ugf7Qt/AoXVjLMyCsmu8GogMLERCiW
         0GUEv5drULfmNYBZAvmmxCrafz03mP3u64xGGjy4GBX2HS176o+OnpFAUauvgGpdAYND
         L+8WFIoDCP/L9DTeK4ymidSEisvLG+OAS+KnjOz9SFAE2mqD1Wj/iqAp62p2lfz+kL/1
         iCZw==
X-Gm-Message-State: AOAM533N85gQHczonrC+3z4XRcNKPXx6RnFjlJTBEd5HfQaRfgtuZIa7
	KgBJnHVr7sioKQKIKmeNYYuvw7qiK1sRxWGKbe8r+g==
X-Google-Smtp-Source: ABdhPJzRAjo7eeV9hQx+B3TQzFGClLOL93ZZzsIXExu8vJz6C0QvfT5nzsCASkGZRmSn08vl5584Wr7ZwMlSAxC+ee4=
X-Received: by 2002:a05:6830:25d2:: with SMTP id d18mr1165208otu.319.1643301289432;
 Thu, 27 Jan 2022 08:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com> <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com> <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
 <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
 <20220127062945.GC1951@kadam> <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
 <YfJ9yWW+MH8N4r4A@phenom.ffwll.local>
In-Reply-To: <YfJ9yWW+MH8N4r4A@phenom.ffwll.local>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 27 Jan 2022 17:34:37 +0100
Message-ID: <CACT4Y+bLWWkZFd7iU6P1hWoF0Yp+9hDEo=puH4BfyETEmR7OMw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Dmitry Vyukov <dvyukov@google.com>, Dan Carpenter <dan.carpenter@oracle.com>, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-fbdev@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>, 
	Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, syzkaller <syzkaller@googlegroups.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jan 2022 at 12:11, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jan 27, 2022 at 11:32:58AM +0100, Dmitry Vyukov wrote:
> > On Thu, 27 Jan 2022 at 07:30, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Wed, Jan 26, 2022 at 11:31:02PM +0100, Daniel Vetter wrote:
> > > > dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > The other advantage of staging is the I don't think syzbot enables it.
> > > > > I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> > > > > get him to disable FBDEV.  :P
> > > > >
> > > > > The memory corruption in fbdev was a real headache for everyone because
> > > > > the stack traces ended up all over the kernel.
> > > >
> > > > Uh Dmitry disabled all of FBDEV?
> > >
> > > No that's the opposite of what I meant.  STAGING is disabled in syzbot
> > > and FBDEV is enabled.
> >
> > Is there still any problem with syzbot config?
> > syzbot configs are stored here:
> > https://github.com/google/syzkaller/tree/master/dashboard/config/linux
>
> CONFIG_FB and CONFIG_FRAMEBUFFER_CONSOLE are set, which are the things I
> care about. The one exception is upstream-kcsan.config, which doesn't have
> fbcon enabled.
>
> Also looking through your fbdev drivers, really the only ones you want to
> ever enable are:
> CONFIG_FB_VGA16=y
> CONFIG_FB_VESA=y
> CONFIG_FB_VIRTUAL=y
>
> The following isn't enabled, but I guess if you don't have EFI doesn't
> make sense, otherwise you really want it:
> CONFIG_FB_EFI=y
>
> The below are enabled in some configs and should be ditched
> CONFIG_FB_SIMPLE=y (use CONFIG_DRM_SIMPLEDRM instead, at least on kernels that have it)
> CONFIG_FB_I740=y (you don't have this hw or I'm blown away, this last shipped 20 years ago)
> CONFIG_FB_UDL=y (use CONFIG_DRM_UDL instead)
> CONFIG_FB_UVESA=y (does modesets by calling into a userspace helper to run x86 vbios code, just don't)
> CONFIG_FB_SMSCUFX=y (if you really have these then someone should port this to drm asap)
> CONFIG_FB_CIRRUS=y (use CONFIG_DRM_CIRRUS_QEMU instead since I'm pretty sure you don't have a real cirrus pci card)
>
> Also note that the simpledrm driver will eat all the firmware fbdev
> drivers and unload them. So you need to run two configs to really cover
> both sets of drivers in all cases.

Thanks!

I've sent PR to update these configs as you suggest:
https://github.com/google/syzkaller/pull/2993
