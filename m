Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52256B68
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711023026; cv=none; b=d3Q8dL1eYqFomlpV5SFWeK7JiZcae6F1G9IoaC0cYnuDfZlodvP3vMz6ODRqfUaGZXt2SwZW/e9gH0SYCA+dojAVby5vrUB1bBj7wdC+qXavk9AbUH0z4qdbuKvTQ4PwI/ZhAIt18e1DR0kJYdRm4Z5p+YrBEjChscRyizvIMIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711023026; c=relaxed/simple;
	bh=3aXVhl2oBHWMlFXWTNoDoxu9YFa3wwZI/v0aJH7qFLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWZ/uenECOsxbRdQEKOtOvS0vv1Kig9QHbV3L+YLlLXfM1MWtGlc1VbQ5M2nBkKDke6+4ZrkjbFwpuytmZWX28sw8xQ9BakCTs+FucKjohz+J7wkCB2vmiz3C2Zqcv3aCDq43ztf0r5wWZThFMGsI4U9xyjVBduHn7fZ+c6VQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f81nggxq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f81nggxq"
Received: from [192.168.1.105] (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ADF22B3;
	Thu, 21 Mar 2024 13:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711022993;
	bh=3aXVhl2oBHWMlFXWTNoDoxu9YFa3wwZI/v0aJH7qFLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f81nggxqdtnMmxPxKSnBGx7/Pf2owjqYzLZ3KUHy0NDQ0J1NVwm0ef+BnfTADz/Te
	 STqOZ/vK69ynrjqzrG1Mr/rCrDByvJKj1bEUb2LXxPSYFe6vxwAqzHH4MFxLYbg1qt
	 HhNDAS8mV3EQ9fMkOzatzOhxAgo81+vrgtysoRlw=
Message-ID: <3a6b414b-1c40-4aa2-9d04-82798494d7b1@ideasonboard.com>
Date: Thu, 21 Mar 2024 17:40:12 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] staging: vc04_services: vchiq_arm: Use appropriate
 dev_* log helpers
Content-Language: en-US
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter
 <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
 <20240315105659.111544-3-umang.jain@ideasonboard.com>
 <171058492288.2556397.4617260952431108092@ping.linuxembedded.co.uk>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <171058492288.2556397.4617260952431108092@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kieran,

On 16/03/24 3:58 pm, Kieran Bingham wrote:
> Quoting Umang Jain (2024-03-15 10:56:56)
>> Re-evaluate logs on error code paths and fix a few error logs
>> with  appropriate dev_* logging helpers.
>>
>> For a case where a null ptr check is performed, use a WARN_ON()
>> instead of logging to dev_err().
>>
>> No functional changes intended in this patch.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 1579bd4e5263..3c3e6f3e48ce 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -1317,7 +1317,7 @@ vchiq_keepalive_thread_func(void *v)
>>                  long rc = 0, uc = 0;
>>   
>>                  if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
>> -                       dev_err(state->dev, "suspend: %s: interrupted\n", __func__);
>> +                       dev_dbg(state->dev, "suspend: %s: interrupted\n", __func__);
> This looks good.
>
>>                          flush_signals(current);
>>                          continue;
>>                  }
>> @@ -1380,7 +1380,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>>                           service->client_id);
>>                  entity_uc = &service->service_use_count;
>>          } else {
>> -               dev_err(state->dev, "suspend: %s: null service ptr\n", __func__);
>> +               WARN_ON(!service);
> This sounds like something that shouldn't happen. Can it actually happen?
>
> If it can happen - can it be caused by userspace through the VCHIQ
> interfaces or is this just an internal code path?

Yes it can happen, when the char device /dev/vchiq is being closed by a 
process.  See vchiq_release()
calls the below call in 
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

....
vchiq_use_internal(instance->state, NULL, USE_TYPE_VCHIQ);
....

This was a review comment actually. I'll leave it out for this series 
and will handle it as standalone patch later.
>
> Bumping up to a WARN_ON could probably need justification that deserves
> it's own patch, but for the rest of the lines:

ack
>
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
>>                  ret = -EINVAL;
>>                  goto out;
>>          }
>> @@ -1753,7 +1753,7 @@ static int vchiq_probe(struct platform_device *pdev)
>>           */
>>          err = vchiq_register_chrdev(&pdev->dev);
>>          if (err) {
>> -               dev_warn(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
>> +               dev_err(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
>>                  goto error_exit;
>>          }
>>   
>> @@ -1763,7 +1763,7 @@ static int vchiq_probe(struct platform_device *pdev)
>>          return 0;
>>   
>>   failed_platform_init:
>> -       dev_warn(&pdev->dev, "arm: Could not initialize vchiq platform\n");
>> +       dev_err(&pdev->dev, "arm: Could not initialize vchiq platform\n");
>>   error_exit:
>>          return err;
>>   }
>> -- 
>> 2.43.0
>>

