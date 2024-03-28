Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B7E386
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 05:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711603109; cv=none; b=gaFz26pHYP9u2d+DFQnEuPhOqzDaAsZxuUmgXGQNidQIZrXt/Y+zUhEzbj9BgeU3hHFo8OH6ozkyMipQhNZ+8AoR6zdb1g55YgmcOmmOxrrZPeLR1678tQVDCn9B5HnDJ+sFZpBdhgtKNAN29dMC2IrRZnY2JTR7YJEtPWIA4Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711603109; c=relaxed/simple;
	bh=87zt8YTuWexO5GQgpu9/ppgTi2mFIxBBUMA4KZSW73c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiRB/H0B308ZazWI1zTLjR/eDZj7jVoWynSI+fCav2gcc8JmvdEDKwcWTtlOzj3zQU7tZ2IprbUGccJrPSldfSSDnjV6B5DFZTZdzpC42bfB3NIyMHKqgOuewUQUncMq3AP+l91NmisrhfuCn/AoZZUmUlBWS+oRaImcP0H+eMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PV3Ywq0d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PV3Ywq0d"
Received: from [192.168.1.105] (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7421D20;
	Thu, 28 Mar 2024 06:17:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711603072;
	bh=87zt8YTuWexO5GQgpu9/ppgTi2mFIxBBUMA4KZSW73c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PV3Ywq0dnW/+Gt7Z2sSRwNLVhbkg0DPcEubUYKMiL9V+1aUxhCfkpyOVFGnASmZ1U
	 64BYCKmKWgz3NkYP+c8t/fjfiKp+uAPjLpm2kQhMlv6c4+lKne0r50IOoMXSbR7u3n
	 no0NGzFarXc6Jf6Z1hK8GPQEXIPc20goCbIikn/U=
Message-ID: <089cef2b-1493-4e59-9cfc-1e4acc336f01@ideasonboard.com>
Date: Thu, 28 Mar 2024 10:48:19 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] staging: vc04_services: vchiq_core: Stop kthreads
 on shutdown
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
 <20240321130737.898154-6-umang.jain@ideasonboard.com>
 <21fcc924-5502-48b6-9d42-b3eed5483944@gmx.net>
 <f4b729c7-744e-4c26-bdc0-23880a3bc4f5@ideasonboard.com>
 <7fc1488b-a0d8-468e-a13d-92ee6e23d657@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <7fc1488b-a0d8-468e-a13d-92ee6e23d657@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 28/03/24 2:10 am, Stefan Wahren wrote:
> Hi Umang,
>
> Am 27.03.24 um 21:00 schrieb Umang Jain:
>> Hi Stefan
>>
>> On 27/03/24 11:49 pm, Stefan Wahren wrote:
>>> Hi Umang,
>>>
>>> Am 21.03.24 um 14:07 schrieb Umang Jain:
>>>> The various kthreads thread functions (slot_handler_func, sync_func,
>>>> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
>>>> vchiq_arm should be stopped on vchiq_shutdown().
>>>>
>>>> This also address the following TODO item:
>>>>   * Fix kernel module support
>>>>
>>>> hence drop it from the TODO item list.
>>>>
>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>>> ---
>>>>   drivers/staging/vc04_services/interface/TODO           | 7 -------
>>>>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c      | 8 ++++++--
>>>>   .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10
>>>> +++++++---
>>>>   3 files changed, 13 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/vc04_services/interface/TODO
>>>> b/drivers/staging/vc04_services/interface/TODO
>>>> index 05eb5140d096..57a2d6761f9b 100644
>>>> --- a/drivers/staging/vc04_services/interface/TODO
>>>> +++ b/drivers/staging/vc04_services/interface/TODO
>>>> @@ -16,13 +16,6 @@ some of the ones we want:
>>>>     to manage these buffers as dmabufs so that we can zero-copy import
>>>>     camera images into vc4 for rendering/display.
>>>>
>>>> -* Fix kernel module support
>>>> -
>>>> -Even the VPU firmware doesn't support a VCHI re-connect, the driver
>>>> -should properly handle a module unload. This also includes that all
>>>> -resources must be freed (kthreads, debugfs entries, ...) and global
>>>> -variables avoided.
>>>> -
>>>>   * Documentation
>>>>
>>>>   A short top-down description of this driver's architecture
>>>> (function of
>>>> diff --git
>>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>>> index ad506016fc93..1d21f9cfbfe5 100644
>>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>>> @@ -726,8 +726,9 @@ void free_bulk_waiter(struct vchiq_instance
>>>> *instance)
>>>>
>>>>   int vchiq_shutdown(struct vchiq_instance *instance)
>>>>   {
>>>> -    int status = 0;
>>>>       struct vchiq_state *state = instance->state;
>>>> +    struct vchiq_arm_state *arm_state;
>>>> +    int status = 0;
>>>>
>>>>       if (mutex_lock_killable(&state->mutex))
>>>>           return -EAGAIN;
>>>> @@ -739,6 +740,9 @@ int vchiq_shutdown(struct vchiq_instance 
>>>> *instance)
>>>>
>>>>       dev_dbg(state->dev, "core: (%p): returning %d\n", instance,
>>>> status);
>>>>
>>>> +    arm_state = vchiq_platform_get_arm_state(state);
>>>> +    kthread_stop(arm_state->ka_thread);
>>>> +
>>>>       free_bulk_waiter(instance);
>>>>       kfree(instance);
>>>>
>>>> @@ -1310,7 +1314,7 @@ vchiq_keepalive_thread_func(void *v)
>>>>           goto shutdown;
>>>>       }
>>>>
>>>> -    while (1) {
>>>> +    while (!kthread_should_stop()) {
>>>>           long rc = 0, uc = 0;
>>>>
>>>>           if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
>>>> diff --git
>>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>>> index 76c27778154a..953ccd87f425 100644
>>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>>> @@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
>>>>
>>>>       DEBUG_INITIALISE(local);
>>>>
>>>> -    while (1) {
>>>> +    while (!kthread_should_stop()) {
>>>>           DEBUG_COUNT(SLOT_HANDLER_COUNT);
>>>>           DEBUG_TRACE(SLOT_HANDLER_LINE);
>>>>           remote_event_wait(&state->trigger_event, &local->trigger);
>>>> @@ -1978,7 +1978,7 @@ recycle_func(void *v)
>>>>       if (!found)
>>>>           return -ENOMEM;
>>>>
>>>> -    while (1) {
>>>> +    while (!kthread_should_stop()) {
>>>>           remote_event_wait(&state->recycle_event, &local->recycle);
>>>>
>>>>           process_free_queue(state, found, length);
>>>> @@ -1997,7 +1997,7 @@ sync_func(void *v)
>>>>               state->remote->slot_sync);
>>>>       int svc_fourcc;
>>>>
>>>> -    while (1) {
>>>> +    while (!kthread_should_stop()) {
>>>>           struct vchiq_service *service;
>>>>           int msgid, size;
>>>>           int type;
>>>> @@ -2844,6 +2844,10 @@ vchiq_shutdown_internal(struct vchiq_state
>>>> *state, struct vchiq_instance *instan
>>>>           (void)vchiq_remove_service(instance, service->handle);
>>>>           vchiq_service_put(service);
>>>>       }
>>>> +
>>>> +    kthread_stop(state->sync_thread);
>>>> +    kthread_stop(state->recycle_thread);
>>>> +    kthread_stop(state->slot_handler_thread);
>>>
>>> i had a little bit time to look at the corrupt issue, i think this
>>> caused by this change. This function is called by vchiq_shutdown which
>>> is exported and used by VCHIQ user drivers like bcm2835-audio or
>>> mmal-vchiq. So this is absolutely not the right place to stop the 
>>> kernel
>>> threads and the issue is not specific to the Raspberry Pi 3.
>>
>> Can you try building with ARCH=64-bit and testing it please? Please
>> refer to the cover section where I have tested 64-bit on rpi4.
> sorry, i don't understand the point behind this. As i mention it's clear
> that we cannot call kthread_stop() from vchiq_shutdown_internal because
> this function is also used by different drivers. The calls to create the
> kthreads should be symmetric to the stop calls. From my understanding
> the kthreads are created from vchiq_probe(), so the kthreads should
> stopped directly or indirectly from vchiq_remove().
>
> This has nothing to do with Raspberry Pi 3 vs 4 or 32 bit vs 64 bit. It
> was just luck that it worked in your case.

It is my paranoia that there are probably firmware related differences 
between 32-bit and 64-bit.

Since, I had no way to booting a 32-bit kernel yesterday and then I saw 
such reports

https://github.com/raspberrypi/firmware/issues/1795#issuecomment-1478976548
https://github.com/raspberrypi/firmware/issues/1795#issuecomment-1483176397

Even the "32-bit" RPi OS came with 64-bit kernel (only rootfs was 
32-bit). It made me thinking if the support for 32-bit kernel is still 
around or dropped somehow.
See https://forums.raspberrypi.com/viewtopic.php?t=367889

Anyway, I reproduced the issue on rpi-3-b as your setup and prepared a 
patch. It's on the list now.
Thanks for reporting!


>>
>> Regarding 32-bit build for my Pi4 - everything gets broken for me RPi4
>> (if I try to test via SD-card) ... and I am also having problems with
>> setting up a NFS-mounted 32-bit rootfs today so can't boot the pi
>> through NFS with 32-bit kernel :(
>>
>> My Pi3 power cable/microUSB went missing, so I have ordered a new one.
>> It will take a couple of days to arrive before  I can test it there.
>>
>>
>>>
>>>>   }
>>>>
>>>>   int
>>
>

