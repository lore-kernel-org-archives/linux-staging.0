Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726D52C1A9
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 22:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665814; cv=none; b=T96agv+QaLydm3Lz+NaX+zLulKXJN91yHO/JWl7Rz7yv19dorVrgI12zgMMNSHuKLoXh9MhSDbgMikwToKut2cAID4pasRBXtmW02l+WNGCWdANp/ZpQHfXqObqU1WDOxhc4+lLhTyMYdrroJFevCW5ElxZnZPnnOYcXhQuag6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665814; c=relaxed/simple;
	bh=WrWV5S6f+92JRT/Pc1BBy1xAnS2Owg4kWAYVr1RlyDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNKOhrZIFihMWEUiy5AdtnwioNBAfAa42/6OLTifY7te4xCJGUKQngLHoGq64v8vbAKU/lzy7l07uD2xbV6ECFZwLENjZTDpu6IpmzD4sYn2ZLJhDtbW8xvLIF8fMvjcGb+QzeaIVE0RLBb5v5+FBnNVJDRtQ4PgkBqit8YlZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oVF2JM0i; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oVF2JM0i"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc236729a2bso1447880276.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 15:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1711665810; x=1712270610; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7BYluFKCP6oQemLiYHQoKJc6+MwxjFWf/sAQImN6JAU=;
        b=oVF2JM0iUypnPtdkZT+MdsTRms2HvaPnMLcAlUwRvQWhwFqB3sazQLJOXljaP6Cdz8
         k70Q4x2DpqWCFQ/doBX6pmTGbx5khou12XAb2FWGZLGnVsUxQsu9RjHwvoTOHdJYa2rg
         WGcUwRx6D8H44fECXwHdKjgQCU1gdGa1XuEFxgAC9lpYi4Xyc4ghcLGQ6H/cIwgrz8dO
         VSR9Gc0xfBZLJbMDuxVdU/Uh005KYvs+4xXOi7mvMscJAMfJOdMYnYZp2+Va6pBLABpA
         Mr+7W7fVVDQ3YIVg+q9zUHjuACPGIkBg6Tet2FzPNTEVrSOFjYcLVquYLWIMA5x8yUEZ
         w0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711665810; x=1712270610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BYluFKCP6oQemLiYHQoKJc6+MwxjFWf/sAQImN6JAU=;
        b=Tb2TFpjIQ542TNhBJrhUeq0p6dfB/MYIhqCmc2EThg7+stP+3ToZ9xLQqiDdIDneAP
         kefdlyCLYhWTah0JYpbLmN/lSmRn0s8zZO61rK5GcqEVW9b/5hbe9tPUUrv9EF2pxavA
         9PiN/twSOK58ZwrlRNadWQmxwrXaJioTz94XstXq68mQ/f2lwa+2n0alQvjSCdX4lVh8
         XFglPPkdnzu2V3iffiQl9btpoJEtHkTxFHdWVbn6ZlqzOKedQETn0zL4nM7cf2QpZJSe
         Gszim7WhYFJMU48PWenCMx4U+1yqgm7A7an8snYOQ/B/LCWvusTJGOsqPDfFs7gMb+kJ
         cHbg==
X-Forwarded-Encrypted: i=1; AJvYcCV2jYFdODic49p+lBpduezbOLb9z1ZZfMKRprhCsNG0CT4ngs8tm6BJAZ7UxySMls8+SZLEnVYoJOwqmWou+QroSC3V5PMNrKZG7tz1kA==
X-Gm-Message-State: AOJu0YxQfWV9pSH6Oznyl5UjMvNTHzIbS9Qe2ke9+ic7otk4grE1rETf
	ZYDTsoaOdFqTqZN4DHrgew/Au+Ow5clGg2nUc7j+8LO+m2fzo2hS0oU4C+o8q91s5AKmxgJZiwF
	so7PsFTvhJDjlZ52Rq+oxkb347Oh64mI2W3lgLw==
X-Google-Smtp-Source: AGHT+IHEW5oUd6tVPOe4GyWt+fnRWuuUYGLZ5GU5SgTP70RW9jwvB0VSeKqiWq8rgYUXjvr2DluC2bFpogSh72ayrb8=
X-Received: by 2002:a25:71d6:0:b0:dd9:1cf2:e3d3 with SMTP id
 m205-20020a2571d6000000b00dd91cf2e3d3mr612691ybc.59.1711665810679; Thu, 28
 Mar 2024 15:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328051615.618908-1-umang.jain@ideasonboard.com>
 <21465844-c2dd-4c6f-bc9b-fbe102fbdcc1@gmx.net> <2f02e574-dc47-429a-9e2f-fd439684866f@ideasonboard.com>
In-Reply-To: <2f02e574-dc47-429a-9e2f-fd439684866f@ideasonboard.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 28 Mar 2024 22:43:19 +0000
Message-ID: <CAMEGJJ2V1G+JNGeR-=eL32WZVbcME0X_KGgGs8bxJp6+aY4GSA@mail.gmail.com>
Subject: Re: [PATCH] staging: vc04_services: Stop kthreads on .remove
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Umang,

On Thu, 28 Mar 2024 at 16:54, Umang Jain <umang.jain@ideasonboard.com> wrote:
>
>
>
> On 28/03/24 10:19 pm, Stefan Wahren wrote:
> > Hi Umang,
> >
> > Am 28.03.24 um 06:16 schrieb Umang Jain:
> >> It turns out that stopping kthreads on vchiq_shutdown_internal()
> >> corrupts the vchiq firmware during probe.
> >>
> >> [   11.005324] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf
> >> unexpected msgid 0@b18db30a,0
> >>
> >> Since the kthreads are created during vchiq_probe(), symmetrically
> >> they should be stopped on vchiq_remove().
> >>
> >> Also, vchiq_shutdown_internal() is called by vchiq_shutdown() which
> >> is a exported function. Hence, modules can take indirectly shut the
> >> vchiq interface by stopping the kthreads.
> >>
> >> Fix it by stopping the kthreads in .remove instead.
> >>
> >> Fixes: d9c60badccc1 ("staging: vc04_services: vchiq_core: Stop
> >> kthreads on shutdown")
> >> Reported-by: Stefan Wahren <wahrenst@gmx.net>
> >> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >> ---
> >>
> >> Reproduced on rpi-3-b 32-bit kernel with multi_v7_defconfig and all
> >> vchiq configs options. Patch seems to fix the error mentioned in the
> >> commit message.
> > i tested the patch on my Raspberry Pi 3B+ with multi_v7_defconfig and
> >
> > CONFIG_BCM_VIDEOCORE=y
> > CONFIG_BCM2835_VCHIQ=m
> > CONFIG_VCHIQ_CDEV=y
> >
> > Now X came up, but if i run
> >
> > modprobe -r vchiq
> >
> > but i'm still getting
> >
> > [  146.730014] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf
> > unexpected msgid 0@10b01b8d,0
> >
> > so it seems to me stopping those kthreads isn't that trivial (which i
> > never expected). Maybe we need to care about the order or an even more
> > complex synchronization mechanism between VideoCore firmware and the
> > kthreads.
>
> Dave, Phil - would you happen to have any opinions on this behavior ?
> >
> > I won't have the time for further investigations during the eastern
> > holidays. Maybe we should revert d9c60badccc1 and take the necessary
> > time for proper testing.
> >

It's hard to be sure, but I would guess that stopping the thread is
causing the remote_event_wait in sync_func to terminate early. The
following code assumes that the message is valid, when it fact it will
have a message type of VCHIQ_MSG_PADDING.

If that's the case, you can either find some way to spot that the wait
has actually failed, or handle VCHIQ_MSG_PADDING explicitly in the
switch.

Phil
