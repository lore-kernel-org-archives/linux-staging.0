Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC08C8E4
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bp9uI8rM"
Received: from [192.168.1.110] (unknown [103.251.226.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C91BAE;
	Tue,  7 Nov 2023 10:56:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699350979;
	bh=ekA3FYI0k8YI2bapWfZDlfBUH0eK52iFhY4CfT3AYwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bp9uI8rMpM2H2mSB9gN8HxJ34LE1rG7Jjkc93ibUpGnEbLDlrGyGlHMOBGQ9SsfTb
	 dVlSvk5LSj7FVa7E0OnaboeHIM0JrZyPykGFWDrNgLYhXARJcIwLpjziQstxb3MeCq
	 fpjGviD3SxfxGVd6w/VYb1EVsD4akAs2bUS0NfGY=
Message-ID: <3cec02ba-81fa-7519-2c45-991b074f1fce@ideasonboard.com>
Date: Tue, 7 Nov 2023 15:26:34 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] staging: vc04_services: vchiq_core: Log through
 struct vchiq_instance
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Phil Elwell
 <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
 <20231102210603.1201311-2-umang.jain@ideasonboard.com>
 <cbe1fdf0-513a-42d0-9daf-7d1855cec8c9@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <cbe1fdf0-513a-42d0-9daf-7d1855cec8c9@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 11/6/23 1:43 AM, Stefan Wahren wrote:
> Am 02.11.23 um 22:06 schrieb Umang Jain:
>> The handle_to_service() helper can return NULL, so service pointer
>> can indeed be set to NULL. Hence, do not log through service pointer,
>> use the vchiq_instance function argument to get access to the
>> struct device.
> I'm not sure but the change looks like fix, which deserve a Fixes tag 
> to me.

Sounds good to me.

I have the tag to the patch and this series is subsumed under "[PATCH 
0/9] staging: vc04_services: Smatch fixes and remove custom logging".

>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git 
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c 
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> index 39b857da2d42..8a9eb0101c2e 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> @@ -245,7 +245,7 @@ find_service_by_handle(struct vchiq_instance 
>> *instance, unsigned int handle)
>>           return service;
>>       }
>>       rcu_read_unlock();
>> -    vchiq_log_debug(service->state->dev, VCHIQ_CORE,
>> +    vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
>>               "Invalid service handle 0x%x", handle);
>>       return NULL;
>>   }
>> @@ -287,7 +287,7 @@ find_service_for_instance(struct vchiq_instance 
>> *instance, unsigned int handle)
>>           return service;
>>       }
>>       rcu_read_unlock();
>> -    vchiq_log_debug(service->state->dev, VCHIQ_CORE,
>> +    vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
>>               "Invalid service handle 0x%x", handle);
>>       return NULL;
>>   }
>> @@ -310,7 +310,7 @@ find_closed_service_for_instance(struct 
>> vchiq_instance *instance, unsigned int h
>>           return service;
>>       }
>>       rcu_read_unlock();
>> -    vchiq_log_debug(service->state->dev, VCHIQ_CORE,
>> +    vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
>>               "Invalid service handle 0x%x", handle);
>>       return service;
>>   }
>

