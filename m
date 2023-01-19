Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727E17471
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 13:47:55 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id a9so2542519ybb.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 05:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PSMpJcgB4/iWUNMRjULR1MuJgnZtYsNt64IxI/yg8y8=;
        b=eDVBeDp6HGMjUZ+KWIDom7Mh6Xqh62t/zpEx0yeX5zBGVXqKMMBK3817KAy67sh9Nu
         iLrH3wQEBzIwDR3pmWTeIW05HXE+IdMRth3fUg4NvViFR/tFTcPVuryHoWor1ecMPQyf
         IDuB5L5zwaIWMsEShLu285cRaoBklCKi/qxmw4JF/aYQVqyJFpX3yo0XryH/NmmnXnLx
         uzSjlPJi0ZlGcz4VezPnDnTedMDXRFquanUoDqjeUEp+4LTx0fpqaZncSfsK5p4D85KL
         ss20MK9rSaAgE7ODMwm7GbuSixRglGKENvSUegJqF9jVd7xzpFTAsnIr/GOrrnrHHR4H
         p6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSMpJcgB4/iWUNMRjULR1MuJgnZtYsNt64IxI/yg8y8=;
        b=0quVhCzsRIm+vJP4GnPt6dvxQa4aOmvgOyPoJ+JQvNarCSPjqzgxrVJToK94tDD0TP
         0akjv1/fUtRdnRYZEIVfEtRZGA3uOhDlCgNVekHdlpAjf+2JsVO7hkKwRfgxdXKm6FyK
         VzLJmi/dTNJbBA+L3w4BBUiASqe80gnUJrw4ACakd4FPm0Evvkm7/fETFcDQ6lV/vO6Q
         IAhe7wY2RwfFjrGXzm/wnFWe5RbX6UMFAsHJdzHVcqPK5nr71yfWrxqbffQK0pzIevdZ
         011ZtGXeXZzvpyRH3Tnkzw7fQ631O9XIpQo7715Z1qXRF+qVCXapjCKWIZMpvS1SLnlG
         UK6Q==
X-Gm-Message-State: AFqh2krwS/6M9O6l0EstagNXKrojbolAwFOSrxUfQOFCkZIaZBX8g7fs
	+A4s46iOVOnnAfKJRVH9bliwjtrRJIxKUicq+bIyLvHl6XNVVY5Dbds=
X-Google-Smtp-Source: AMrXdXtrMjpr+dkPCI15Z1YrTq3vEIqG9HQKNS7sllyosNcJ1sz9FAEKCEyXXbIAukoxGI1iBD0VmTuYLITNqakQYJY=
X-Received: by 2002:a25:d1d0:0:b0:6f8:c792:bde9 with SMTP id
 i199-20020a25d1d0000000b006f8c792bde9mr1371077ybg.614.1674136074295; Thu, 19
 Jan 2023 05:47:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
 <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com> <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
 <Y8lHqd9FlxiXTLuW@kroah.com>
In-Reply-To: <Y8lHqd9FlxiXTLuW@kroah.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 19 Jan 2023 13:47:44 +0000
Message-ID: <CAMEGJJ1oZ9XFw0609PrEABAgDwvapbc3hG4hJ=vBekUOepdiWw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Drop custom logging
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry <athierry@redhat.com>, 
	Dan Carpenter <error27@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jan 2023 at 13:37, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 19, 2023 at 01:31:12PM +0000, Phil Elwell wrote:
> > Hi all,
> >
> >
> > On Wed, 18 Jan 2023 at 17:55, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> > >
> > > Hi Umang,
> > >
> > > [add Phil]
> > >
> > > Am 18.01.23 um 12:58 schrieb Umang Jain:
> > > > Drop custom logging from the vchiq interface.
> > > > Mostly of them are replaced with dev_dbg and friends
> > > > and/or pr_info and friends.
> > > >
> > > > The debugfs log levels (in 4/4) are mapped to kernel
> > > > logs levels (coming from include/linux/kern_levels.h)
> > > > Would like some thoughts on it as I am not sure (hence
> > > > marking this is RFC)
> > > >
> > > >  From drivers/staging/vc04_services/interface/TODO:
> > > >
> > > > """
> > > > * Cleanup logging mechanism
> > > >
> > > > The driver should probably be using the standard kernel logging mechanisms
> > > > such as dev_info, dev_dbg, and friends.
> > >
> > > i don't have any experience with vchiq logging/debug. So i'm not sure if
> > > it's acceptable to lose the second log level dimension (like
> > > vchiq_arm_log_level) completely. Complex drivers like brcmfmac have a
> > > debug mask to avoid log spamming [1]. Maybe this is a compromise.
> > >
> > > Btw some loglevel locations has already been messed up during
> > > refactoring :-(
> > >
> > > [1] - drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h
> > >
> > > > """
> > > >
> > > > Umang Jain (4):
> > > >    staging: vc04_services: vchiq_core: Drop custom logging
> > > >    staging: vc04_services: vchiq_arm: Drop custom logging
> > > >    staging: vc04_services: Drop custom logging
> > > >    staging: vc04_services: Drop remnants of custom logging
> > > >
> > > >   .../interface/vchiq_arm/vchiq_arm.c           | 151 +++---
> > > >   .../interface/vchiq_arm/vchiq_connected.c     |   5 +-
> > > >   .../interface/vchiq_arm/vchiq_core.c          | 479 ++++++++----------
> > > >   .../interface/vchiq_arm/vchiq_core.h          |  39 --
> > > >   .../interface/vchiq_arm/vchiq_debugfs.c       |  26 +-
> > > >   .../interface/vchiq_arm/vchiq_dev.c           |  78 ++-
> > > >   6 files changed, 329 insertions(+), 449 deletions(-)
> > > >
> >
> > Thanks for the nudge - this patch set hasn't yet made its way through
> > the sluggish rpi-kernel moderation.
> >
> > I understand the desire to remove the custom logging. I don't welcome
> > the loss of flexibility that comes with such a strategy
>
> What "loss of flexibility"?  You now have access to the full dynamic
> debugging facilities that all of the rest of the kernel has.  What is
> lacking?

Perhaps I've missed something, either in this patch set or the kernel
as a whole, but how is one supposed to set different logging levels on
different facilities within a driver/module, or even for the module as
a whole? I don't consider anything that requires reference to
individual lines in the source code to be a suitable replacement,
clever though it is.

> > , but I'm not
> > going to argue about it. What's harder to understand is the state that
> > this patchset leaves VCHIQ logging in. From what I can see, the
> > per-service logging control has gone, but the code still contains
> > macros that hint at something useful. Similarly, the debugfs support
> > is completely vestigial, giving the appearance of control while
> > actually achieving nothing.
>
> The debugfs files should also be removed if they don't do anything
> anymore.
>
> thanks,
>
> greg k-h
