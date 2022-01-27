Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81F2CA0
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 11:11:09 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f17so4129841wrx.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 03:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q+ftSI0F0/Im74lDzb4er70a9ByF00QgQAuRt8psbLQ=;
        b=N5Fa1T8zfl0y2EjCaDtDX+8dseudhqkFzw/Vi14SNkB/atAy/QGQLlf19t0nUpYRXr
         P1n7AE9R37LW3Tfm/a1TXW86YKv6K0YNFmg/DKnf7HQuFb2VSyOSFbrWcYaDPgeK3yYe
         Uz2bykGO2FQD/+wh8ZoTsqjM+kiTtXY4KplsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Q+ftSI0F0/Im74lDzb4er70a9ByF00QgQAuRt8psbLQ=;
        b=ylXAfyRxk07AP5K6U2j3mVvLtFw9ThlTLkVmZ563nz6IjiqEzSWPV6hbDXzp5B3jNs
         sBV9S2zt3YaJGZB3CCdBHZ+XFGi8JqMvP/7ngu/LByUMT45YU6nkj+nPa3dtG+ToyS/4
         ANZk7V/Q3ERwUTwAOB6H4kUyYei03KWuKDwX45WKvP2Wx2jt2UDITV6uWysTaI40iWr4
         CJt76s8msqeyMqafpCnvhPXLcvCsAGRR7u4+grUlElpPg2qxPNtJWz46qXeAHQxlLkrL
         vrie3YQK6urDZGp38EoA+GagsvgqdEMB8B2Z5fZjwK1spJDCVvURymTedT++epd807As
         cKTw==
X-Gm-Message-State: AOAM53188wk1B5cd5trgQdgji98IHN4azdC5Z71PHQvb7As+upi8UokW
	8Kpz3G9+/Qd8FrIEsus+CXeDRQ==
X-Google-Smtp-Source: ABdhPJwAFil42wR4BzzRzMkyK3qxmmts6cgadNUMSsg5Myn0J+D62I0vtwRvYDkdPdH775qoOOP+Tg==
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr2565698wrx.221.1643281868064;
        Thu, 27 Jan 2022 03:11:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w8sm1873068wrq.3.2022.01.27.03.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 03:11:07 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Carlis <zhangxuezhi1@yulong.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	syzkaller <syzkaller@googlegroups.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfJ9yWW+MH8N4r4A@phenom.ffwll.local>
Mail-Followup-To: Dmitry Vyukov <dvyukov@google.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Carlis <zhangxuezhi1@yulong.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	syzkaller <syzkaller@googlegroups.com>
References: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
 <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com>
 <20220126144524.GB1951@kadam>
 <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
 <20220127062945.GC1951@kadam>
 <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 

On Thu, Jan 27, 2022 at 11:32:58AM +0100, Dmitry Vyukov wrote:
> On Thu, 27 Jan 2022 at 07:30, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Wed, Jan 26, 2022 at 11:31:02PM +0100, Daniel Vetter wrote:
> > > dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > The other advantage of staging is the I don't think syzbot enables it.
> > > > I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> > > > get him to disable FBDEV.  :P
> > > >
> > > > The memory corruption in fbdev was a real headache for everyone because
> > > > the stack traces ended up all over the kernel.
> > >
> > > Uh Dmitry disabled all of FBDEV?
> >
> > No that's the opposite of what I meant.  STAGING is disabled in syzbot
> > and FBDEV is enabled.
> 
> Is there still any problem with syzbot config?
> syzbot configs are stored here:
> https://github.com/google/syzkaller/tree/master/dashboard/config/linux

CONFIG_FB and CONFIG_FRAMEBUFFER_CONSOLE are set, which are the things I
care about. The one exception is upstream-kcsan.config, which doesn't have
fbcon enabled.

Also looking through your fbdev drivers, really the only ones you want to
ever enable are:
CONFIG_FB_VGA16=y
CONFIG_FB_VESA=y
CONFIG_FB_VIRTUAL=y

The following isn't enabled, but I guess if you don't have EFI doesn't
make sense, otherwise you really want it:
CONFIG_FB_EFI=y

The below are enabled in some configs and should be ditched
CONFIG_FB_SIMPLE=y (use CONFIG_DRM_SIMPLEDRM instead, at least on kernels that have it)
CONFIG_FB_I740=y (you don't have this hw or I'm blown away, this last shipped 20 years ago)
CONFIG_FB_UDL=y (use CONFIG_DRM_UDL instead)
CONFIG_FB_UVESA=y (does modesets by calling into a userspace helper to run x86 vbios code, just don't)
CONFIG_FB_SMSCUFX=y (if you really have these then someone should port this to drm asap)
CONFIG_FB_CIRRUS=y (use CONFIG_DRM_CIRRUS_QEMU instead since I'm pretty sure you don't have a real cirrus pci card)

Also note that the simpledrm driver will eat all the firmware fbdev
drivers and unload them. So you need to run two configs to really cover
both sets of drivers in all cases.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
