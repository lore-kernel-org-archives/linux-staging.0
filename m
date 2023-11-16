Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756CF2D786
	for <linux-staging@lists.linux.dev>; Thu, 16 Nov 2023 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3yFw0Yb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso1005446a12.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Nov 2023 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700132264; x=1700737064; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c0Alq2NnZvkG1wKEvu5ji7SOJ948PkV/pj0sqQJJs20=;
        b=C3yFw0YbHBjxJ/0j2i/c0jcU2XnKBb8Pmxd0l9S6LUHv9bVTmLexgTh+ZaDbaUiFQl
         SQyTzNOQgejUMVrf6bQrZvttOv7SimADoUuNaSQ6o2b2oVIJl1oI/5bWzsKhB8zSUTvC
         ek3ApizPScLm0zE1YG324Ay/cqV7SyQK1UAvZA2VAyCrAKVtQP1XjgkZCWxLVMT+0saD
         s62nKTLoaJEdd5xMSD5WVIQ1ZdFbesiO4vp6FMV8jto8ZLYhlT39SvN/XONXc8zpwZZG
         jgC9ooANcxwAtVhrJ2kpXDEC2UfVQF5JbUvNWTb483vc94m1KPJCCrOlTCPnzFMoX6Uy
         69pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700132264; x=1700737064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0Alq2NnZvkG1wKEvu5ji7SOJ948PkV/pj0sqQJJs20=;
        b=hXFkK9wiUw9Z0/9SH/Wk0oI6zOXmR7Z9Na9E0kTbUjJ+Q0DYmyfCOh809I5UuHfF3c
         1kZqgCnC8bt77EZMC012rSvzsBBppcJ6D3udS6zhDVsTKIYAZAQNd5Ag4Zqu6WceDwkQ
         /ZPc9c94Y8lSYOUEJAGe33AzQkmnvwKxWXJ8BcKQrbvcJvBJ+V/i6gaQyXdWRymm+ZeZ
         /cC26y/5yeeYt2rf/MR+91VMQ6G8X6e0DNM9xIjq+RAiBQ9jWvsgq3tAoTypIK7fVwn2
         75Et1VJfaJdqxsJmuFJtwS1pZxi0XAktpqOGgSXHUpL6nb4hvmGbRV5yTzAnP6dGAzdY
         odSw==
X-Gm-Message-State: AOJu0YydweM7V5518fMInyLFkPSvZkRa89VjI3ek4nCcu89bvZGpNpFQ
	96RlamKvwR4Mng1dlots88lNE2LQra4jKNx24+s=
X-Google-Smtp-Source: AGHT+IEMyccX384cGXsYncIxNvNPWdps8uNibi1oGYh6tKgDwE4EswQCIBmJhnNXhS3SZ/wXaYBunJmToyOvaJ1n0O4=
X-Received: by 2002:aa7:dd56:0:b0:53e:7781:2279 with SMTP id
 o22-20020aa7dd56000000b0053e77812279mr11735675edw.36.1700132264420; Thu, 16
 Nov 2023 02:57:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231115195947.GD29486@pendragon.ideasonboard.com> <58fe01b9-5fb6-451c-a759-c6a5afd695e3@gmx.net>
 <20231116005030.GA21041@pendragon.ideasonboard.com> <45c0e7bbb2ed91ec559cdbf2d19ad80e@suse.de>
In-Reply-To: <45c0e7bbb2ed91ec559cdbf2d19ad80e@suse.de>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 16 Nov 2023 10:57:32 +0000
Message-ID: <CALeDE9PuquwZs3ou_RksH41LCYgVtMmQt6KbK7CnBq5S8_yp6g@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] staging: vc04_services: bcm2835-isp support
To: "Ivan T. Ivanov" <iivanov@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org, 
	kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	"Ricardo B . Marliere" <ricardo@marliere.net>, Dan Carpenter <error27@gmail.com>, 
	Guillaume GARDET <guillaume.gardet@opensuse.org>
Content-Type: text/plain; charset="UTF-8"

> >> > On Thu, Nov 09, 2023 at 04:02:52PM -0500, Umang Jain wrote:
> >> >> This series aims to upport bcm2835-isp from the RPi kernel.
> >> >> It is developed on top of staging-next which comprises many
> >> >> VC04 changes for it's de-staging. Hence, the merge of this
> >> >> driver is targeted when VC04 is de-staged completely (which I
> >> >> have been pushing), but it can be helped getting reviewed meanwhile.
> >> >> Hence, the reason for posting the series.
> >> >
> >> > Related question, what do people think about dropping the legacy
> >> > firmware-based bcm2385-camera driver once this gets merged ?
> >> > firmware-based camera operation is deprecated by Raspberry Pi, and
> >> > doesn't work on the Pi 5
> >>
> >> i don't remember exactly, but wasn't the bcm2835-camera required for
> >> Pi
> >> Camera V1.3?
> >
> > If I'm not mistaken (Dave can correct me), the legacy camera stack
> > works
> > only with the Raspberry Pi official camera v1, v2 and HQ modules.
> > Raspberry Pi has switched to a new camera stack based on libcamera,
> > which works on the Pi Zero 2, Pi 3, Pi 4 and Pi 5. This new stack
> > supports the same camera modules as the legacy stack, and many more.
> > The
> > legacy stack doesn't work on Pi 5 at all.
> >
> >> At the end cannot speak for the users. AFAIK OpenSuSE and Fedora use
> >> the
> >> driver.
>
> Guillaume (in CC) is more authoritative about this topic, but as long we
> have
> smooth migration plan I am more than happy to switch to proper camera
> driver.

From a Fedora PoV I am more than happy to move to the new libcamera
based stack for the RPi camera, IMO sooner the better :)
