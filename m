Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0F17CD
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 13:31:23 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id p188so2466868yba.5
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yCqPKnSa7WozhuTI0rKqXlgcivKBLrizV645POVS478=;
        b=db7e5U5L08xVk+LSrK+0Kzj2SoihxS7LOo1B9e7WOS2L+qKfJwkApXLkv/jZ78/G4H
         IxqD/5L3tUGUwSXT/PlYvrRWcXFJQtmwaZ87c9sThcKO68mhz8X6oLhWLdcUFiOU92gl
         PrYEbE44mJj16MmmijES1wJSe5H5wNjUyxUk4L1BBnDtXvDeFy7FNOwRAQxRsNnx2ug9
         x5kxH4b+8T6jpqZVva65untJEfUlHIdFw6Ve5kC0Cqa/lP6v3pSkQwyaSa93O+SLcAtj
         byulHgj3QUqnPkTvDeNeBt1lME23sk2JxOVWIcb64lVVsgkUaZEyLZNkmF9zxOya7tAL
         XcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCqPKnSa7WozhuTI0rKqXlgcivKBLrizV645POVS478=;
        b=fwT191j6VORr0U03MS6shbBZ6DuH0AT9+ROUiqhS5GAMT4B3zJHUAxI1OnQRQ4jIn/
         RnV3xiMJ1laLCea8C1nYeIFO3CdSiXiRHUQmOIwJYQ78u95aZw+rUk8RAdH+FO15gyGG
         oyrRTeKi7MpEr8sNAC3EusuV5styU6kXKYFoXkcD8YqmZSeossdxeCo4ky0HDAzp2+71
         2nc2uYtwL8lr0dBtGdl7fEYY4nwSiXLFKEp2rk7Yqx6HpYX/4aAQbu1UimG1kQGZ5iIr
         mYu5/3QQOqP7QT2bY1yhh6xpsekgigS7NI7nYQIcJ4UHsPGBBZB7pAaNeVGdDrMv23Cm
         VDiQ==
X-Gm-Message-State: AFqh2kr+7vzYAqnxgb76s/mJmHFdFAJHAstKeESx2LWNBfeER2FeMZhA
	PaEqbyauW2cIc632k+yJdcgdCsYNcUCt5n1p1GdYgQ==
X-Google-Smtp-Source: AMrXdXu0SAHmeBGFvcM/lvwMo9hMvjdUbZWFyuQeTWjeUppruJ9ehZC0zWYFLLPApsAUyfmneXtDjaVH+rYR5GfcM3k=
X-Received: by 2002:a25:bd14:0:b0:73f:fb7d:400 with SMTP id
 f20-20020a25bd14000000b0073ffb7d0400mr1646414ybk.352.1674135082149; Thu, 19
 Jan 2023 05:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230118115810.21979-1-umang.jain@ideasonboard.com> <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
In-Reply-To: <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 19 Jan 2023 13:31:12 +0000
Message-ID: <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Drop custom logging
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry <athierry@redhat.com>, 
	Dan Carpenter <error27@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,


On Wed, 18 Jan 2023 at 17:55, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Umang,
>
> [add Phil]
>
> Am 18.01.23 um 12:58 schrieb Umang Jain:
> > Drop custom logging from the vchiq interface.
> > Mostly of them are replaced with dev_dbg and friends
> > and/or pr_info and friends.
> >
> > The debugfs log levels (in 4/4) are mapped to kernel
> > logs levels (coming from include/linux/kern_levels.h)
> > Would like some thoughts on it as I am not sure (hence
> > marking this is RFC)
> >
> >  From drivers/staging/vc04_services/interface/TODO:
> >
> > """
> > * Cleanup logging mechanism
> >
> > The driver should probably be using the standard kernel logging mechanisms
> > such as dev_info, dev_dbg, and friends.
>
> i don't have any experience with vchiq logging/debug. So i'm not sure if
> it's acceptable to lose the second log level dimension (like
> vchiq_arm_log_level) completely. Complex drivers like brcmfmac have a
> debug mask to avoid log spamming [1]. Maybe this is a compromise.
>
> Btw some loglevel locations has already been messed up during
> refactoring :-(
>
> [1] - drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h
>
> > """
> >
> > Umang Jain (4):
> >    staging: vc04_services: vchiq_core: Drop custom logging
> >    staging: vc04_services: vchiq_arm: Drop custom logging
> >    staging: vc04_services: Drop custom logging
> >    staging: vc04_services: Drop remnants of custom logging
> >
> >   .../interface/vchiq_arm/vchiq_arm.c           | 151 +++---
> >   .../interface/vchiq_arm/vchiq_connected.c     |   5 +-
> >   .../interface/vchiq_arm/vchiq_core.c          | 479 ++++++++----------
> >   .../interface/vchiq_arm/vchiq_core.h          |  39 --
> >   .../interface/vchiq_arm/vchiq_debugfs.c       |  26 +-
> >   .../interface/vchiq_arm/vchiq_dev.c           |  78 ++-
> >   6 files changed, 329 insertions(+), 449 deletions(-)
> >

Thanks for the nudge - this patch set hasn't yet made its way through
the sluggish rpi-kernel moderation.

I understand the desire to remove the custom logging. I don't welcome
the loss of flexibility that comes with such a strategy, but I'm not
going to argue about it. What's harder to understand is the state that
this patchset leaves VCHIQ logging in. From what I can see, the
per-service logging control has gone, but the code still contains
macros that hint at something useful. Similarly, the debugfs support
is completely vestigial, giving the appearance of control while
actually achieving nothing.

Phil
