Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214ED7D08A
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711622749; cv=none; b=EETdH/qpHYa8N/i0JVeSQY1CuhkW+sRZiY4H3IUdFrN10CdVVCHbQ9JQeLfteAGfZaQWytXzasfkiAUPtyQksXi5eNlM6qNchB5h47f/ymYqk2waf6fANVpLiaJlyDrYubvqerNwV2VFPz1DyCAJosY5iCTOMNZvlxSL3YDbaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711622749; c=relaxed/simple;
	bh=sFRzPjNkM60GHyTWFA/KUbbzwl0Ttbqi/V1j0DatYT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV7YE29M+D1X1Xe5eFp9KF4S6dXRAa709egySuFUjI5uVLhJnlN+jtyTCBWII3kSbI0G52/r+YWvgHS2NfZHAkDmqAVxE93I09XiQov2ZtMDD2KK07apGMQWbB87b4lXPKN+c56L3ypqf72ZKnunEinGmpQXEb1WayF9dkM3NRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=o+gu+Qw5; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="o+gu+Qw5"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso827046276.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 03:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1711622746; x=1712227546; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nco96cykNocgKmajLjgSvpAkphSwnWUM1MRyb627Wo=;
        b=o+gu+Qw5bBnh3Mkvsyl4Q5ho9sMu5TH33DyxYOHQQTBVLEhg6q1LFgkZpmMhVNY+17
         exd4IRMBFjljDM/e9mpuwf81dCQq5uaUqxvDhkrPmwKhtM9abVQq0mJP7wzQp/ZMLTTu
         AxDSNvRZufVksekZQsRAZBF/pJkLDO8laXu0zXNoSUn58VMSizPS1N6frK0OwaxmHYz3
         R4ovgIMcJE5kuabDJKw9uxuPtMX8jWElpnHKGog9ppreKS69mwEROFfNSRWeHoisEe7d
         WQx12ChROs01EZbA1HcpfqbQCS8QU/6NTZNt0RqjftK3/QIgnYpWve7l0/7yC7mx3ZrM
         dVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711622746; x=1712227546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Nco96cykNocgKmajLjgSvpAkphSwnWUM1MRyb627Wo=;
        b=TebQ5jvBZ4FIy5eGyA2a0qFdjiWwYk60Qqj5BqeBxxT0DnKD5tpW31k7nGECXN3y+n
         aasX3PvTl1omSJuxlvB0MB9Z1Zl0sykzwtO7pr8PitlKDbSK3ALouQTi8RGQzKJ44/+O
         6DZ+7LKmsWL6EdtYqFNOVnv7LA+mEOh4+2ogvcOIa37p7rZwcMrBMcgbFvNZU1yf5ppG
         UG9cKbQRUz8TSfzocavKT91OSdehbcXx16dn7dxd+JR9njkB9d2U7RRKkQcWa+L7htCr
         05h8kBJqi7/6UPa6EwKS32I9K/Kla4J7qq53IHEo8s1NmuKL0/M4KaFmcBPT+cLpXA0Z
         JpCw==
X-Forwarded-Encrypted: i=1; AJvYcCXqmy0wkLSAbF2WlQqgi9Km6nOgOeCHpsySvi6LgcO7AH9mzKK32J6Wf4nny3mZSewGpiDsy6/O1VvPHwMNNnSJCSQnYGNC9YjmjyH4eQ==
X-Gm-Message-State: AOJu0Yy15qPkcvFXzy5IYTOdUBd62ldgne4o238fyCUejhmWMZeehHEI
	RL/9B/yffEb86tPNQq8ce2d+xu28rog/P7V8NXsKJZ7PPLwh+UKYCCObaT8FarbD/VnoDPfgRSO
	Tqo3IKtqGnPsXiIi1Wq067pGcD5tW4NEUHWn8jQ==
X-Google-Smtp-Source: AGHT+IGE/TOjWLJdZFnLmgbTnDrT03KJS30YdbAHxnSOV3vojq0PxrP3WT1fs6G0rzV5Iz4LS7m+cqGVSG/YPdif7nA=
X-Received: by 2002:a25:68c1:0:b0:dcd:c3ba:d788 with SMTP id
 d184-20020a2568c1000000b00dcdc3bad788mr2535729ybc.47.1711622746082; Thu, 28
 Mar 2024 03:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
 <20240321130737.898154-6-umang.jain@ideasonboard.com> <21fcc924-5502-48b6-9d42-b3eed5483944@gmx.net>
 <f4b729c7-744e-4c26-bdc0-23880a3bc4f5@ideasonboard.com> <7fc1488b-a0d8-468e-a13d-92ee6e23d657@gmx.net>
 <089cef2b-1493-4e59-9cfc-1e4acc336f01@ideasonboard.com>
In-Reply-To: <089cef2b-1493-4e59-9cfc-1e4acc336f01@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 28 Mar 2024 10:45:30 +0000
Message-ID: <CAPY8ntBaz_RGr2sboQqbuUv+xZNfRct6-sckDLYPTig_HWyXEw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] staging: vc04_services: vchiq_core: Stop kthreads
 on shutdown
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	Dan Carpenter <error27@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, 
	Greg KH <greg@kroah.com>
Content-Type: text/plain; charset="UTF-8"

Hi Umang

On Thu, 28 Mar 2024 at 05:18, Umang Jain <umang.jain@ideasonboard.com> wrote:
>
> Hi Stefan,
>
> On 28/03/24 2:10 am, Stefan Wahren wrote:
> > Hi Umang,
> >
> > Am 27.03.24 um 21:00 schrieb Umang Jain:
> >> Hi Stefan
> >>
> >> On 27/03/24 11:49 pm, Stefan Wahren wrote:
> >>> Hi Umang,
> >>>
> >>> Am 21.03.24 um 14:07 schrieb Umang Jain:
> >>>> The various kthreads thread functions (slot_handler_func, sync_func,
> >>>> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
> >>>> vchiq_arm should be stopped on vchiq_shutdown().
> >>>>
> >>>> This also address the following TODO item:
> >>>>   * Fix kernel module support
> >>>>
> >>>> hence drop it from the TODO item list.
> >>>>
> >>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >>>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>>> ---
> >>>>   drivers/staging/vc04_services/interface/TODO           | 7 -------
> >>>>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c      | 8 ++++++--
> >>>>   .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10
> >>>> +++++++---
> >>>>   3 files changed, 13 insertions(+), 12 deletions(-)
> >>>>
> >>>> diff --git a/drivers/staging/vc04_services/interface/TODO
> >>>> b/drivers/staging/vc04_services/interface/TODO
> >>>> index 05eb5140d096..57a2d6761f9b 100644
> >>>> --- a/drivers/staging/vc04_services/interface/TODO
> >>>> +++ b/drivers/staging/vc04_services/interface/TODO
> >>>> @@ -16,13 +16,6 @@ some of the ones we want:
> >>>>     to manage these buffers as dmabufs so that we can zero-copy import
> >>>>     camera images into vc4 for rendering/display.
> >>>>
> >>>> -* Fix kernel module support
> >>>> -
> >>>> -Even the VPU firmware doesn't support a VCHI re-connect, the driver
> >>>> -should properly handle a module unload. This also includes that all
> >>>> -resources must be freed (kthreads, debugfs entries, ...) and global
> >>>> -variables avoided.
> >>>> -
> >>>>   * Documentation
> >>>>
> >>>>   A short top-down description of this driver's architecture
> >>>> (function of
> >>>> diff --git
> >>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>>> index ad506016fc93..1d21f9cfbfe5 100644
> >>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>>> @@ -726,8 +726,9 @@ void free_bulk_waiter(struct vchiq_instance
> >>>> *instance)
> >>>>
> >>>>   int vchiq_shutdown(struct vchiq_instance *instance)
> >>>>   {
> >>>> -    int status = 0;
> >>>>       struct vchiq_state *state = instance->state;
> >>>> +    struct vchiq_arm_state *arm_state;
> >>>> +    int status = 0;
> >>>>
> >>>>       if (mutex_lock_killable(&state->mutex))
> >>>>           return -EAGAIN;
> >>>> @@ -739,6 +740,9 @@ int vchiq_shutdown(struct vchiq_instance
> >>>> *instance)
> >>>>
> >>>>       dev_dbg(state->dev, "core: (%p): returning %d\n", instance,
> >>>> status);
> >>>>
> >>>> +    arm_state = vchiq_platform_get_arm_state(state);
> >>>> +    kthread_stop(arm_state->ka_thread);
> >>>> +
> >>>>       free_bulk_waiter(instance);
> >>>>       kfree(instance);
> >>>>
> >>>> @@ -1310,7 +1314,7 @@ vchiq_keepalive_thread_func(void *v)
> >>>>           goto shutdown;
> >>>>       }
> >>>>
> >>>> -    while (1) {
> >>>> +    while (!kthread_should_stop()) {
> >>>>           long rc = 0, uc = 0;
> >>>>
> >>>>           if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
> >>>> diff --git
> >>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> >>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> >>>> index 76c27778154a..953ccd87f425 100644
> >>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> >>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> >>>> @@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
> >>>>
> >>>>       DEBUG_INITIALISE(local);
> >>>>
> >>>> -    while (1) {
> >>>> +    while (!kthread_should_stop()) {
> >>>>           DEBUG_COUNT(SLOT_HANDLER_COUNT);
> >>>>           DEBUG_TRACE(SLOT_HANDLER_LINE);
> >>>>           remote_event_wait(&state->trigger_event, &local->trigger);
> >>>> @@ -1978,7 +1978,7 @@ recycle_func(void *v)
> >>>>       if (!found)
> >>>>           return -ENOMEM;
> >>>>
> >>>> -    while (1) {
> >>>> +    while (!kthread_should_stop()) {
> >>>>           remote_event_wait(&state->recycle_event, &local->recycle);
> >>>>
> >>>>           process_free_queue(state, found, length);
> >>>> @@ -1997,7 +1997,7 @@ sync_func(void *v)
> >>>>               state->remote->slot_sync);
> >>>>       int svc_fourcc;
> >>>>
> >>>> -    while (1) {
> >>>> +    while (!kthread_should_stop()) {
> >>>>           struct vchiq_service *service;
> >>>>           int msgid, size;
> >>>>           int type;
> >>>> @@ -2844,6 +2844,10 @@ vchiq_shutdown_internal(struct vchiq_state
> >>>> *state, struct vchiq_instance *instan
> >>>>           (void)vchiq_remove_service(instance, service->handle);
> >>>>           vchiq_service_put(service);
> >>>>       }
> >>>> +
> >>>> +    kthread_stop(state->sync_thread);
> >>>> +    kthread_stop(state->recycle_thread);
> >>>> +    kthread_stop(state->slot_handler_thread);
> >>>
> >>> i had a little bit time to look at the corrupt issue, i think this
> >>> caused by this change. This function is called by vchiq_shutdown which
> >>> is exported and used by VCHIQ user drivers like bcm2835-audio or
> >>> mmal-vchiq. So this is absolutely not the right place to stop the
> >>> kernel
> >>> threads and the issue is not specific to the Raspberry Pi 3.
> >>
> >> Can you try building with ARCH=64-bit and testing it please? Please
> >> refer to the cover section where I have tested 64-bit on rpi4.
> > sorry, i don't understand the point behind this. As i mention it's clear
> > that we cannot call kthread_stop() from vchiq_shutdown_internal because
> > this function is also used by different drivers. The calls to create the
> > kthreads should be symmetric to the stop calls. From my understanding
> > the kthreads are created from vchiq_probe(), so the kthreads should
> > stopped directly or indirectly from vchiq_remove().
> >
> > This has nothing to do with Raspberry Pi 3 vs 4 or 32 bit vs 64 bit. It
> > was just luck that it worked in your case.
>
> It is my paranoia that there are probably firmware related differences
> between 32-bit and 64-bit.
>
> Since, I had no way to booting a 32-bit kernel yesterday and then I saw
> such reports
>
> https://github.com/raspberrypi/firmware/issues/1795#issuecomment-1478976548
> https://github.com/raspberrypi/firmware/issues/1795#issuecomment-1483176397
>
> Even the "32-bit" RPi OS came with 64-bit kernel (only rootfs was
> 32-bit). It made me thinking if the support for 32-bit kernel is still
> around or dropped somehow.
> See https://forums.raspberrypi.com/viewtopic.php?t=367889

Only on Pi4.
A 64bit kernel is preferable to LPAE where there is a need to address
more than 4GB of RAM.

Pi0-2 are only 32bit processors so will always run a 32bit kernel.
Pi3 & 02 only have 1GB and 512MB of RAM respectively, so having the
smaller pointer size of 32bit is generally an advantage, even though
they can run a 64bit kernel (and OS).

  Dave

> Anyway, I reproduced the issue on rpi-3-b as your setup and prepared a
> patch. It's on the list now.
> Thanks for reporting!
>
>
> >>
> >> Regarding 32-bit build for my Pi4 - everything gets broken for me RPi4
> >> (if I try to test via SD-card) ... and I am also having problems with
> >> setting up a NFS-mounted 32-bit rootfs today so can't boot the pi
> >> through NFS with 32-bit kernel :(
> >>
> >> My Pi3 power cable/microUSB went missing, so I have ordered a new one.
> >> It will take a couple of days to arrive before  I can test it there.
> >>
> >>
> >>>
> >>>>   }
> >>>>
> >>>>   int
> >>
> >
>
