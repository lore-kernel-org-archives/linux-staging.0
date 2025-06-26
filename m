Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476041AC88B
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750969847; cv=none; b=HX0TC27kxz+NeSiSAEeIWITohQUOm3n9EGLG3eDtyaYR8ZSMKidvBK52sejjflif9fKg66jOIpGRN5a67rZYu1Kg2H2PRpCLF4B6GsRGM57pj7ZT0eEeO3Nez3VnQo38Ld2bAjFhRVxPP/PB/0Z1QZl9Z6dxtO8zr7twPQ8EOjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750969847; c=relaxed/simple;
	bh=kkdIh6WKEs2zlLRZjQlDGb3UT6MI5JXkZVTz46AZlIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4V4VuUVleUUt3yjt1VRu9kOlbc66s/2XNcYgepNW0EuyXNt8e/go8D8GlIuVMS1zImoRYlPqkI0RBoA8Jnba44vkRKNSrR/T8M2rmmw72gf4GYYTBEPaNM01sPAi4Lu3bujtJp+/lGpL5aY/mXfDtZCQgRdkoY0yPJu2l2yfvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VBhuulz5; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VBhuulz5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eISimfFBGx0mLKE0nYjWrV+uVU+VJ/fWpUp3su6l05g=; b=VBhuulz5Cu1TB3gBPCY85GhiIS
	eIxAtrt6e5ryEj8OHategKRe+V5Cf/1lb2/y3QWyAk3Y4M6Hyfibp6FCeaNnrcdGt2HsFl8RHxPSV
	UD4RXszfq+S2oostjRCOPRuZxYmQzFfv2Y+OXBBSdNhC+sAESE+tJnBCfhLfiHkPvancmfSUtXE+c
	kDsTENfIPjMIiMn62MQPbrDL9iuaSWLB+vhBaNuYLvPpLaKfHvofuCQWT+2SUr/AtCNCY07RtTKw5
	mrxArh6eEtT9xKSvl7tqXQIXuQfcLSUrUYhPDF9LA10oW8PG7Vo7YaqhgXAw8Xk1YV7rUxTOX3Fe0
	HjRy5x4Q==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uUtEt-0097vo-Na; Thu, 26 Jun 2025 22:30:31 +0200
Message-ID: <1db32ad6-b699-4a28-abc2-56f8efae38df@igalia.com>
Date: Thu, 26 Jun 2025 17:30:25 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
 Ojaswin Mujoo <ojaswin98@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250309125014.37166-1-wahrenst@gmx.net>
 <20250309125014.37166-5-wahrenst@gmx.net>
 <ba35b960-a981-4671-9f7f-060da10feaa1@usp.br>
 <7314139e-93fb-4abb-acac-0a07454d8d26@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <7314139e-93fb-4abb-acac-0a07454d8d26@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 26/06/25 17:14, Stefan Wahren wrote:
> Hi Maíra,
> 
> [add Arnd]
> 
> Am 26.06.25 um 20:22 schrieb Maíra Canal:
>> Hi Stefan,
>>
>> On 09/03/25 09:50, Stefan Wahren wrote:
>>> Creating the keep-alive thread in vchiq_platform_init_state have
>>> the following advantages:
>>> - abort driver probe if kthread_create fails (more consistent behavior)
>>> - make resource release process easier
>>>
>>> Since vchiq_keepalive_thread_func is defined below
>>> vchiq_platform_init_state, the latter must be moved.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>>   .../interface/vchiq_arm/vchiq_arm.c           | 69 +++++++++----------
>>>   1 file changed, 34 insertions(+), 35 deletions(-)
>>>
>>
>> After this patch landed on 6.12 stable, I started to observe the
>> following warning in Mesa CI [1]:
> Is this also reproducible with 6.15.x or mainline ?

I was able to reproduce it with 6.16.0-rc2 [2].

[2] https://gitlab.freedesktop.org/mairacanal/mesa/-/jobs/79092300

Best Regards,
- Maíra

>>
>> 20:07:07.830: [  242.653532] INFO: task vchiq-keep/0:85 blocked for 
>> more than 120 seconds.
>> 20:07:07.835: [  242.660404]       Not tainted 6.12.34-v8-+ #13
>> 20:07:07.843: [  242.666173] "echo 0 > /proc/sys/kernel/ 
>> hung_task_timeout_secs" disables this message.
>> 20:07:07.852: [  242.677126] task:vchiq-keep/0    state:D stack:0 
>> pid:85    tgid:85    ppid:2      flags:0x00000008
>> 20:07:07.854: [  242.690734] Call trace:
>> 20:07:07.857: [  242.693191]  __switch_to+0x188/0x230
>> 20:07:07.858: [  242.697010]  __schedule+0xa54/0xb28
>> 20:07:07.859: [  242.704889]  schedule+0x80/0x120
>> 20:07:07.859: [  242.712581]  schedule_preempt_disabled+0x30/0x50
>> 20:07:07.860: [  242.721437]  kthread+0xd4/0x1a0
>> 20:07:07.861: [  242.724606]  ret_from_fork+0x10/0x20
>>
>> If I revert this patch, I no longer get those warnings. From that, I was
>> wondering: is it possible that in some scenarios, we might never
>> actually get to the connected state and therefore, we wouldn't wake up
>> the kthread that we created when we initialized the state?
> Sure we communicate to the VideoCore and there might be reasons the 
> connection fail. I'm not aware that a missing wakeup cause a hanging task.
> 
> Best regards
>>
>> [1] https://gitlab.freedesktop.org/mairacanal/mesa/-/jobs/78940369
>>
>> Best Regards,
>> - Maíra
>>
>>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/ 
>>> vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/ 
>>> vchiq_arm.c
>>> index 0c7ea2d0ee85..64f9536f1232 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> @@ -280,29 +280,6 @@ static int vchiq_platform_init(struct 
>>> platform_device *pdev, struct vchiq_state
>>>       return 0;
>>>   }
>>>
>>> -int
>>> -vchiq_platform_init_state(struct vchiq_state *state)
>>> -{
>>> -    struct vchiq_arm_state *platform_state;
>>> -
>>> -    platform_state = devm_kzalloc(state->dev, 
>>> sizeof(*platform_state), GFP_KERNEL);
>>> -    if (!platform_state)
>>> -        return -ENOMEM;
>>> -
>>> -    rwlock_init(&platform_state->susp_res_lock);
>>> -
>>> -    init_completion(&platform_state->ka_evt);
>>> -    atomic_set(&platform_state->ka_use_count, 0);
>>> -    atomic_set(&platform_state->ka_use_ack_count, 0);
>>> -    atomic_set(&platform_state->ka_release_count, 0);
>>> -
>>> -    platform_state->state = state;
>>> -
>>> -    state->platform_state = (struct opaque_platform_state 
>>> *)platform_state;
>>> -
>>> -    return 0;
>>> -}
>>> -
>>>   static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct 
>>> vchiq_state *state)
>>>   {
>>>       return (struct vchiq_arm_state *)state->platform_state;
>>> @@ -1011,6 +988,39 @@ vchiq_keepalive_thread_func(void *v)
>>>       return 0;
>>>   }
>>>
>>> +int
>>> +vchiq_platform_init_state(struct vchiq_state *state)
>>> +{
>>> +    struct vchiq_arm_state *platform_state;
>>> +    char threadname[16];
>>> +
>>> +    platform_state = devm_kzalloc(state->dev, 
>>> sizeof(*platform_state), GFP_KERNEL);
>>> +    if (!platform_state)
>>> +        return -ENOMEM;
>>> +
>>> +    snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
>>> +         state->id);
>>> +    platform_state->ka_thread = 
>>> kthread_create(&vchiq_keepalive_thread_func,
>>> +                           (void *)state, threadname);
>>> +    if (IS_ERR(platform_state->ka_thread)) {
>>> +        dev_err(state->dev, "couldn't create thread %s\n", threadname);
>>> +        return PTR_ERR(platform_state->ka_thread);
>>> +    }
>>> +
>>> +    rwlock_init(&platform_state->susp_res_lock);
>>> +
>>> +    init_completion(&platform_state->ka_evt);
>>> +    atomic_set(&platform_state->ka_use_count, 0);
>>> +    atomic_set(&platform_state->ka_use_ack_count, 0);
>>> +    atomic_set(&platform_state->ka_release_count, 0);
>>> +
>>> +    platform_state->state = state;
>>> +
>>> +    state->platform_state = (struct opaque_platform_state 
>>> *)platform_state;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   int
>>>   vchiq_use_internal(struct vchiq_state *state, struct vchiq_service 
>>> *service,
>>>              enum USE_TYPE_E use_type)
>>> @@ -1331,7 +1341,6 @@ void vchiq_platform_conn_state_changed(struct 
>>> vchiq_state *state,
>>>                          enum vchiq_connstate newstate)
>>>   {
>>>       struct vchiq_arm_state *arm_state = 
>>> vchiq_platform_get_arm_state(state);
>>> -    char threadname[16];
>>>
>>>       dev_dbg(state->dev, "suspend: %d: %s->%s\n",
>>>           state->id, get_conn_state_name(oldstate), 
>>> get_conn_state_name(newstate));
>>> @@ -1346,17 +1355,7 @@ void vchiq_platform_conn_state_changed(struct 
>>> vchiq_state *state,
>>>
>>>       arm_state->first_connect = 1;
>>>       write_unlock_bh(&arm_state->susp_res_lock);
>>> -    snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
>>> -         state->id);
>>> -    arm_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
>>> -                          (void *)state,
>>> -                          threadname);
>>> -    if (IS_ERR(arm_state->ka_thread)) {
>>> -        dev_err(state->dev, "suspend: Couldn't create thread %s\n",
>>> -            threadname);
>>> -    } else {
>>> -        wake_up_process(arm_state->ka_thread);
>>> -    }
>>> +    wake_up_process(arm_state->ka_thread);
>>>   }
>>>
>>>   static const struct of_device_id vchiq_of_match[] = {
>>> -- 
>>> 2.34.1
>>>
>>>
>>
>>
> 

