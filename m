Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5CD135A4D
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711652827; cv=none; b=SaY2E0xrg9CZqtBQC3KsDtsLNDeH+cMxcpxKDOdCBaOIYmLAqU8XV3kPmU2AM5+KMnoT/vj2ajvlAFOfxwhy/moq50bk2/pXo5Z4c0xwq86iMR8pq7F3mhG7Y9Nn4feR1Wf+lxCjm58TPEuJ0n/j/dTCXZH2peVxDBL+FZixETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711652827; c=relaxed/simple;
	bh=jCqD2WNUN/NTokNNp/LF03x52kjXnpqSWLmHiah6aD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpABouDtgzCvlYICQRpOOdX1jKDEUXu57YrK6r0yJqlDW4oeS37fyaBQeqwWyIPCNImm3Irh5nIjG3TaLWqMaCygtEXUt3jJ4euL+u1pBNlm+3l+34sKbqqMdiQVEW6B1siYs+Tc8sQ0n5lARNb4INMcmc6aQaZH84IidtCZ4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gH9KvgQ5; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gH9KvgQ5"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61130dd21c1so14124887b3.2
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1711652824; x=1712257624; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx5bQFtirnLDnDsEYsOa/PGFr1BhtXF1rNS0sTz2WVo=;
        b=gH9KvgQ528JFJrP0GTjyUlgzzvnf+6N0U4vTOj6KYZ4r1beOzhOQb3kFwsWBTHsCWR
         Pj9hYth0Wwn+yHvlTPaWLFOBcYdxhgorpje9ee6DzNF/AxlV2fm/kY6XaJ4sDGZKgc8I
         rdHoSlzJ30dtMNa467I6iKEWX8BFgV6Rpisvou+rXQjgv0m2cHWJyRQQFYYaS15MBbDW
         b/wsSKCT9tOUhXC2V4ZV32qTuPlF9xDm+B8z51rug8dzrSYeHlaJiwpcf265bK+zCjpK
         5UbvL2wTu8oB+CmL02u7zPpY0eLxpYcHcRPE0t2ZxaVV5Ng9ktuWN2Lxri0lWFUJ1zUm
         R8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711652824; x=1712257624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx5bQFtirnLDnDsEYsOa/PGFr1BhtXF1rNS0sTz2WVo=;
        b=WqmOd9m67oCMuD4FG4zMX3uYvau+Wk8V2E0DnKKZnpjXoNH+H664uCWUxPn1RUT5pX
         CJkzZiY6IVRJjHt9beh71L/jZNJ9JzcisYYt+mWU5R3zHDF7OdHNsFza8qby8tAs+n5a
         x2jNdRmi7sQ8lUcbwus8iG8/CB3l+DwKF8EB2bDzVEGtpxLFeOsqo2akKjD39ese3V/y
         qiAoIGs3rXxZOUID/+0Ko7ApWyqnc0lKMCie0L5HP5Z9nuyqoNDwSuW6G4qr11+aCY7a
         j63bQs9YMHNSZeyZf4piFFQPHyJHwxu7ei9XVCf1/ejkSzU6F/NXIxZSkAu7R/4ZZwjK
         5NsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyrchubSI63m+sfb2koKoLA7HAbg5VchbKFm1+fDVKOmsJagz6oSTcApjDGgVeOS1UDUmARhyEzl2ER1gvNmy/a5VfEAKjTWYto7vjqQ==
X-Gm-Message-State: AOJu0YwLbfx042w5xpe4t2ESR5VusA4euo4eMKO1yLnQPUuPfbmxsPYc
	VNjAjKWUx+KGzVFTD+u7IXmrJ8AYy1RrI0Yu23+zVQoxBKR9doYfoyoaI8odjS2+uBXor2bvL9K
	hcNrFJjuQw1I0XeIHilO1gnXe+AwHSecFyvumMg==
X-Google-Smtp-Source: AGHT+IH2Z+fUeO7oMhU8oz1cvYd/j8GYpqXqkPBpCHmCQiwm/BsMZiZLGjkjjVgwl7V15bnXS7RdHayF52jN0urPucg=
X-Received: by 2002:a25:2005:0:b0:dc7:4cff:9165 with SMTP id
 g5-20020a252005000000b00dc74cff9165mr220948ybg.59.1711652824045; Thu, 28 Mar
 2024 12:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328051615.618908-1-umang.jain@ideasonboard.com>
 <21465844-c2dd-4c6f-bc9b-fbe102fbdcc1@gmx.net> <2f02e574-dc47-429a-9e2f-fd439684866f@ideasonboard.com>
In-Reply-To: <2f02e574-dc47-429a-9e2f-fd439684866f@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 28 Mar 2024 19:06:47 +0000
Message-ID: <CAPY8ntAEpnhiyrc-vk9L4Abyy=DaZqLLzOhPQTvLctjx4pBrEA@mail.gmail.com>
Subject: Re: [PATCH] staging: vc04_services: Stop kthreads on .remove
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, 
	Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Umang

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

Sorry, that's not code I know at all.

  Dave

> >
> > I won't have the time for further investigations during the eastern
> > holidays. Maybe we should revert d9c60badccc1 and take the necessary
> > time for proper testing.
> >
> > Best regards
>
