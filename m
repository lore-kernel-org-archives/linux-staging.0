Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C41822F8
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 16:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720025086; cv=none; b=gI7Yca0YoCoCifwp4BxhQ+j3qFbhRVE14pBfuX4+SSG/uB5xEhtpQ/2eqWwyrKQWQP9uzQjiF5idzDKvtDgsJ13dBd3vn5UHKJCuW7z/E38SZldw7fABOu9P3uplohadeYqOIJLuNJCrHDAaAE31S46K1rA3zZme7PQ4v2ZDx70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720025086; c=relaxed/simple;
	bh=OX2Mx2SKVMFDSJfMHUd5s/GuXodeFCe3AWDw7plNgdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jn7d7RuvorWKQKewVBhZX88tbZmCjAENurhRCWS4XdMDfgdCXL7wHCLvfQSzJm7e0Tce4WNFxkhIQSbqDZSu94Q/sMixQLAoVQZEfpvAFtEz+AfkAghm7/QPTm58k0qM+En24H/Jl7mr4i5jCgAJlmcPLrG40YPuZ06QQU+jqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nRnFm98N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nRnFm98N"
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C737D8A9;
	Wed,  3 Jul 2024 18:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720025048;
	bh=OX2Mx2SKVMFDSJfMHUd5s/GuXodeFCe3AWDw7plNgdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nRnFm98NXtTGV7m3KMkWbIBSNXkJ0ch7X4kZSjsz6fCpscIMshsRtaO3cvOt7w3BS
	 jL/ONc5my91QeriAR3nHhtif3xDHLBF+UQslKJbDC9yWS3PHGeqzWgLzNYwyqSTecM
	 kdxf1J7OnD5N66Ibjt8JvdsflagQXvqK9THeDc+M=
Message-ID: <082beafc-fe51-497c-a818-9e0b3955f917@ideasonboard.com>
Date: Wed, 3 Jul 2024 22:14:30 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] staging: vc04_services: vchiq_core: Stop kthreads
 on vchiq module unload
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240703131052.597443-1-umang.jain@ideasonboard.com>
 <20240703131052.597443-3-umang.jain@ideasonboard.com>
 <e9b38efc-1167-4e73-8c98-5cb611804b1e@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <e9b38efc-1167-4e73-8c98-5cb611804b1e@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan

On 03/07/24 10:01 pm, Stefan Wahren wrote:
> Hi Umang,
>
> Am 03.07.24 um 15:10 schrieb Umang Jain:
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
>> index 9e6102c43e00..c4d97dbf6ba8 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -1315,7 +1315,7 @@ vchiq_keepalive_thread_func(void *v)
>>           goto shutdown;
>>       }
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           long rc = 0, uc = 0;
>>
>>           if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
>> @@ -1776,12 +1776,20 @@ static int vchiq_probe(struct platform_device 
>> *pdev)
>>   static void vchiq_remove(struct platform_device *pdev)
>>   {
>>       struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
>> +    struct vchiq_arm_state *arm_state;
>>
>>       vchiq_device_unregister(bcm2835_audio);
>>       vchiq_device_unregister(bcm2835_camera);
>>       vchiq_debugfs_deinit();
>>       vchiq_deregister_chrdev();
>>
>> +    kthread_stop(mgmt->state.sync_thread);
>> +    kthread_stop(mgmt->state.recycle_thread);
>> +    kthread_stop(mgmt->state.slot_handler_thread);
> This is fine as long as vchiq_probe() is successful. But we also need to
> cleanup the kthreads during vchiq_probe() in case something went wrong
> after vchiq_init_state(). I think we should introduce a helper to
> cleanup them up.
>
> Finally the subject needs to be adjusted too.

I think what you are asking here is a entire de-init() sequence on 
probe() failure. It can be done (I haven't taken a look in deep yet) but 
it can also be done on top. cleaning up kthreads would be a part of it - 
but I suspect there might be other parts for that sequence

my preference here is to fix the issue we saw earlier on module unload

>> +
>> +    arm_state = vchiq_platform_get_arm_state(&mgmt->state);
>> +    kthread_stop(arm_state->ka_thread);
>> +
>>       kfree(mgmt);
>>   }
>>
>> diff --git 
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c 
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> index dd70f2881eca..50af04b217f4 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> @@ -1941,7 +1941,7 @@ slot_handler_func(void *v)
>>
>>       DEBUG_INITIALISE(local);
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           DEBUG_COUNT(SLOT_HANDLER_COUNT);
>>           DEBUG_TRACE(SLOT_HANDLER_LINE);
>>           ret = remote_event_wait(&state->trigger_event, 
>> &local->trigger);
>> @@ -1986,7 +1986,7 @@ recycle_func(void *v)
>>       if (!found)
>>           return -ENOMEM;
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           ret = remote_event_wait(&state->recycle_event, 
>> &local->recycle);
>>           if (ret)
>>               return ret;
>> @@ -2008,7 +2008,7 @@ sync_func(void *v)
>>       int svc_fourcc;
>>       int ret;
>>
>> -    while (1) {
>> +    while (!kthread_should_stop()) {
>>           struct vchiq_service *service;
>>           int msgid, size;
>>           int type;
>

