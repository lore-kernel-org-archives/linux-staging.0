Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6944F208
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569637; cv=none; b=Pj/uuu4XQEkClRwXbRO4KNUvyBscBGz7D+wNMDg9/uRKBkJaAaqF+32dgKK7DuVyqNmeH4nH7+/1pcakRA2C8fDZ0VcPkL9Q7+DvptZs9i2q73O2HGCexIz1PNVHdMsc2zBPDH/KhSIjO85f6InlFNCIUP8yWZHt80BTrV/rmEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569637; c=relaxed/simple;
	bh=MCxe9k1kn7twRStKnvwIf4UCqNTNYlvqMnzG8X3phWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8zQkghhN0qrdcIxy6loghpy2FX9bVs4D4/4a4OFjcGTNA3Gqse28Fk5oTesbsYiI7MF7bqjA2Ufn8o7ZlHIRXsjBAtHugUqMkv8OF/RlnYTDv+06oBLJV0W0zNEv/CRYcUjoqENk8/M+1JS0s/3//V0I5cdSvI1XvJSqV4SKxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kd7vStwb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kd7vStwb"
Received: from [192.168.1.105] (unknown [103.251.226.53])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33490899;
	Wed, 27 Mar 2024 20:59:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711569599;
	bh=MCxe9k1kn7twRStKnvwIf4UCqNTNYlvqMnzG8X3phWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kd7vStwbNgL/glxbgPYepT5sv/9ZyEOQN7LvMaQiJ5g1TvSze25n0EN4oiLAKVnjT
	 DydfWr9N7FKQR+Nhy2Wc+6oxRfG2jI+EzEA0MbCWyaK2P6ZyWbdjKuZ1DN602hyEo1
	 ZPM0LjipY94/uVUcin8DdSDvr3qCmcLw7mNeO0vI=
Message-ID: <f4b729c7-744e-4c26-bdc0-23880a3bc4f5@ideasonboard.com>
Date: Thu, 28 Mar 2024 01:30:24 +0530
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
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <21fcc924-5502-48b6-9d42-b3eed5483944@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan

On 27/03/24 11:49 pm, Stefan Wahren wrote:
> Hi Umang,
>
> Am 21.03.24 um 14:07 schrieb Umang Jain:
>> The various kthreads thread functions (slot_handler_func, sync_func,
>> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
>> vchiq_arm should be stopped on vchiq_shutdown().
>>
>> This also address the following TODO item:
>>   * Fix kernel module support
>>
>> hence drop it from the TODO item list.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>   drivers/staging/vc04_services/interface/TODO           |  7 -------
>>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  8 ++++++--
>>   .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++++---
>>   3 files changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/TODO 
>> b/drivers/staging/vc04_services/interface/TODO
>> index 05eb5140d096..57a2d6761f9b 100644
>> --- a/drivers/staging/vc04_services/interface/TODO
>> +++ b/drivers/staging/vc04_services/interface/TODO
>> @@ -16,13 +16,6 @@ some of the ones we want:
>>     to manage these buffers as dmabufs so that we can zero-copy import
>>     camera images into vc4 for rendering/display.
>>
>> -* Fix kernel module support
>> -
>> -Even the VPU firmware doesn't support a VCHI re-connect, the driver
>> -should properly handle a module unload. This also includes that all
>> -resources must be freed (kthreads, debugfs entries, ...) and global
>> -variables avoided.
>> -
>>   * Documentation
>>
>>   A short top-down description of this driver's architecture 
>> (function of
>> diff --git 
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c 
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index ad506016fc93..1d21f9cfbfe5 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -726,8 +726,9 @@ void free_bulk_waiter(struct vchiq_instance 
>> *instance)
>>
>>   int vchiq_shutdown(struct vchiq_instance *instance)
>>   {
>> -    int status = 0;
>>       struct vchiq_state *state = instance->state;
>> +    struct vchiq_arm_state *arm_state;
>> +    int status = 0;
>>
>>       if (mutex_lock_killable(&state->mutex))
>>           return -EAGAIN;
>> @@ -739,6 +740,9 @@ int vchiq_shutdown(struct vchiq_instance *instance)
>>
>>       dev_dbg(state->dev, "core: (%p): returning %d\n", instance, 
>> status);
>>
>> +    arm_state = vchiq_platform_get_arm_state(state);
>> +    kthread_stop(arm_state->ka_thread);
>> +
>>       free_bulk_waiter(instance);
>>       kfree(instance);
>>
>> @@ -1310,7 +1314,7 @@ vchiq_keepalive_thread_func(void *v)
>>           goto shutdown;
>>       }
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           long rc = 0, uc = 0;
>>
>>           if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
>> diff --git 
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c 
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> index 76c27778154a..953ccd87f425 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> @@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
>>
>>       DEBUG_INITIALISE(local);
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           DEBUG_COUNT(SLOT_HANDLER_COUNT);
>>           DEBUG_TRACE(SLOT_HANDLER_LINE);
>>           remote_event_wait(&state->trigger_event, &local->trigger);
>> @@ -1978,7 +1978,7 @@ recycle_func(void *v)
>>       if (!found)
>>           return -ENOMEM;
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           remote_event_wait(&state->recycle_event, &local->recycle);
>>
>>           process_free_queue(state, found, length);
>> @@ -1997,7 +1997,7 @@ sync_func(void *v)
>>               state->remote->slot_sync);
>>       int svc_fourcc;
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           struct vchiq_service *service;
>>           int msgid, size;
>>           int type;
>> @@ -2844,6 +2844,10 @@ vchiq_shutdown_internal(struct vchiq_state 
>> *state, struct vchiq_instance *instan
>>           (void)vchiq_remove_service(instance, service->handle);
>>           vchiq_service_put(service);
>>       }
>> +
>> +    kthread_stop(state->sync_thread);
>> +    kthread_stop(state->recycle_thread);
>> +    kthread_stop(state->slot_handler_thread);
>
> i had a little bit time to look at the corrupt issue, i think this
> caused by this change. This function is called by vchiq_shutdown which
> is exported and used by VCHIQ user drivers like bcm2835-audio or
> mmal-vchiq. So this is absolutely not the right place to stop the kernel
> threads and the issue is not specific to the Raspberry Pi 3.

Can you try building with ARCH=64-bit and testing it please? Please 
refer to the cover section where I have tested 64-bit on rpi4.

Regarding 32-bit build for my Pi4 - everything gets broken for me RPi4 
(if I try to test via SD-card) ... and I am also having problems with 
setting up a NFS-mounted 32-bit rootfs today so can't boot the pi 
through NFS with 32-bit kernel :(

My Pi3 power cable/microUSB went missing, so I have ordered a new one. 
It will take a couple of days to arrive before  I can test it there.


>
>>   }
>>
>>   int

