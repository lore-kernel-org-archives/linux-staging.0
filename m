Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA92629C
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 04:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719981737; cv=none; b=GERiAf9maPhawEhuOVl5fH2wluuHvpA14nEwZyO/+iKNczbhsJm2FXZcbhi2NIgODLG4pG8EkFBdT3fPCRJJEq8gyRC5cED5UaFQs1mPjKA0ezxJNfEAld+zax0N5c0IOQ8wUN/FEd8bgJXXN3MQfJPou6LetyGeNkP46Ot3/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719981737; c=relaxed/simple;
	bh=ejLwv6bAui2csT2b7tPMPivh3W5zAhU1a2sM8h/mQxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jP5u7DcIvKSImPMHxI3A3lHMKJ3hf6C0hqJWPmuU7axtC1ZNNEUROek1G2iVgxQP6hXSz2v+TpidMn0X4HPxkXDohogrBm+ZXZ5LtWIL4iNLuKpsiDM4fwtlh2GbouzpuD2hokP1d1g8+Qq1oZURoXes3G+5ivLLoPfOfDJRwPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UDNzqdiB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UDNzqdiB"
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E06D04CA;
	Wed,  3 Jul 2024 06:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719981704;
	bh=ejLwv6bAui2csT2b7tPMPivh3W5zAhU1a2sM8h/mQxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDNzqdiBarj5aqlqB57ob4odDy2xOlsnGh7tRzoivbZ7Ry5IrDwT0nf3CIQNJ/qYk
	 gaKZTFhdjFuc2Iu6HiNh1IuH3tyfl3noBvZU7bj+6nDEhrsvORJAR5ktb33+ZMxpC9
	 0TPVyXXRkLhZ4ogfqk3R7ZOdK9f5M+tyrKQYkijw=
Message-ID: <eeff5576-e8d9-43f2-b571-ea0041c5f97b@ideasonboard.com>
Date: Wed, 3 Jul 2024 10:12:06 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] staging: vc04_services: vchiq_core: Stop kthreads on
 shutdown
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240702164256.754391-1-umang.jain@ideasonboard.com>
 <20240702164256.754391-3-umang.jain@ideasonboard.com>
 <ccc9025c-79d4-4f52-b575-c151ae88797c@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <ccc9025c-79d4-4f52-b575-c151ae88797c@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan

On 03/07/24 12:00 am, Stefan Wahren wrote:
> Hi Umang,
>
> Am 02.07.24 um 18:42 schrieb Umang Jain:
>> The various kthreads thread functions (slot_handler_func, sync_func,
>> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
>> vchiq_arm should be stopped when the module is unloaded.
>>
>> Previous attempt were made to address this but later reverted [1]
>> due to VC04 firmware corruption. The issue around
>> wait_event_interruptible() handling on stopping a kthread has been
>> handled in the previous commit. Hence, it is now safe to stop kthreads
>> on module unload, without any firmware corruption.
>>
>> This also completes the "Fix kernel module support" TODO item, hence
>> drop it from the list.
>>
>> [1] commit ebee9ca2f59e ("Revert "staging: vc04_services: vchiq_core: 
>> Stop kthreads on shutdown"")
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   drivers/staging/vc04_services/interface/TODO           |  7 -------
>>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c      | 10 +++++++++-
>>   .../vc04_services/interface/vchiq_arm/vchiq_core.c     |  6 +++---
>>   3 files changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/TODO 
>> b/drivers/staging/vc04_services/interface/TODO
>> index 05f129c0c254..dfb1ee49633f 100644
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
>> index 9e6102c43e00..48ec8a2b4601 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -737,6 +737,7 @@ void free_bulk_waiter(struct vchiq_instance 
>> *instance)
>>   int vchiq_shutdown(struct vchiq_instance *instance)
>>   {
>>       struct vchiq_state *state = instance->state;
>> +    struct vchiq_arm_state *arm_state;
>>       int ret = 0;
>>
>>       if (mutex_lock_killable(&state->mutex))
>> @@ -749,6 +750,9 @@ int vchiq_shutdown(struct vchiq_instance *instance)
>>
>>       dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
>>
>> +    arm_state = vchiq_platform_get_arm_state(state);
>> +    kthread_stop(arm_state->ka_thread);
> I think we came back to the discussion at the end of march.
>
> Can you please explain why do you think this is the right place to stop
> the keep alive thread?
>
> This function vchiq_shutdown() is exported to multiple drivers, but i
> think only the VCHIQ itself should stop this thread. Otherwise if we
> unload VCHIQ audio this might break VCHIQ video too. Or do i missed
> something?

No, you are correct. This is not the right place to stop the keep alive 
thread.

>> +
>>       free_bulk_waiter(instance);
>>       kfree(instance);
>>
>> @@ -1315,7 +1319,7 @@ vchiq_keepalive_thread_func(void *v)
>>           goto shutdown;
>>       }
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           long rc = 0, uc = 0;
>>
>>           if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
>> @@ -1782,6 +1786,10 @@ static void vchiq_remove(struct 
>> platform_device *pdev)
>>       vchiq_debugfs_deinit();
>>       vchiq_deregister_chrdev();
>>
>> +    kthread_stop(mgmt->state.sync_thread);
>> +    kthread_stop(mgmt->state.recycle_thread);
>> +    kthread_stop(mgmt->state.slot_handler_thread);
>> +
>>       kfree(mgmt);
>>   }
>>
>> diff --git 
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c 
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> index b5f5853924a8..623ffd49549b 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> @@ -1939,7 +1939,7 @@ slot_handler_func(void *v)
>>
>>       DEBUG_INITIALISE(local);
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           DEBUG_COUNT(SLOT_HANDLER_COUNT);
>>           DEBUG_TRACE(SLOT_HANDLER_LINE);
>>           ret = remote_event_wait(&state->trigger_event, 
>> &local->trigger);
>> @@ -1984,7 +1984,7 @@ recycle_func(void *v)
>>       if (!found)
>>           return -ENOMEM;
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           ret = remote_event_wait(&state->recycle_event, 
>> &local->recycle);
>>           if (ret < 0)
>>               return ret;
>> @@ -2006,7 +2006,7 @@ sync_func(void *v)
>>       int svc_fourcc;
>>       int ret;
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           struct vchiq_service *service;
>>           int msgid, size;
>>           int type;
>

