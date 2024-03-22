Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFC1BA27
	for <linux-staging@lists.linux.dev>; Fri, 22 Mar 2024 04:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711081301; cv=none; b=cJQVfpgzrs0ySFXof6wVfUgCaDfVrMtkSnROkTtTxVfV3tCdpzrlm4Q+e570qaM32A55PrFVmgZww/i6ynr9zJFdki0YBpjGR52mV0DaH7OnzbtVbJUz94un3p3Sm55OBNaJkpKNyVEdNAJ4Xiocb4DdrWLYyO6dZjiwKN2mo9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711081301; c=relaxed/simple;
	bh=Jwh8nlkjnz9gJSiIgNaom3SWbQx1YFv1WEWcZP5pfvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ls3WGWMbp0KtErkpaXu6IIHINpG/cxoa2g7CVZR6aWzJ7iUwPAPNjjSyu1fSunEMhLZhmIpF1rBMCNd3bhXO+5Lt8sCdXuD7AAfLI/2oO6XB/JYCN+CzlKVcV+0lqon0ZbRFL/oql3WAFXX4IYLtaIeu0gxiqoJjFxmA/asvWOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QyxkaZp+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QyxkaZp+"
Received: from [192.168.1.105] (unknown [103.86.18.144])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 015DF82A;
	Fri, 22 Mar 2024 05:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711081269;
	bh=Jwh8nlkjnz9gJSiIgNaom3SWbQx1YFv1WEWcZP5pfvU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QyxkaZp+09bwP3KdRI+uvxZn18Hyfuf+vQGPI/0Jr4i0X7s2lCrXR0cDcbPGiL4ud
	 Ua/hLbpw/MqjoPEAWxMxO5Q/7qKRfRp1R41IJAAIMATsu973FPqoGfpy/js4evUhta
	 CJc5KkG4USs2As/ltW/7MPUrXVaSM6oidbp7Af5M=
Message-ID: <b1087699-2992-4abe-be35-ad07409126d1@ideasonboard.com>
Date: Fri, 22 Mar 2024 09:51:27 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] staging: vc04_services: Implement vchiq_bus
 .remove
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter
 <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
 <20240321130737.898154-5-umang.jain@ideasonboard.com>
 <171104150601.3566204.5965127233700490228@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <171104150601.3566204.5965127233700490228@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kieran,

On 21/03/24 10:48 pm, Kieran Bingham wrote:
> Quoting Umang Jain (2024-03-21 13:07:36)
>> Implement the struct vchiq_bus .remove() so that cleanup
>> paths can be executed by the devices registered to this
>> bus, when being removed.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
> Don't forget a changelog when possible.
>
> v2:
>   - Check driver->remove before calling

Already mentioned in cover-letter v2 changelog
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
>>   .../vc04_services/interface/vchiq_arm/vchiq_bus.c      | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
>> index 68f830d75531..93609716df84 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
>> @@ -37,11 +37,21 @@ static int vchiq_bus_probe(struct device *dev)
>>          return driver->probe(device);
>>   }
>>   
>> +static void vchiq_bus_remove(struct device *dev)
>> +{
>> +       struct vchiq_device *device = to_vchiq_device(dev);
>> +       struct vchiq_driver *driver = to_vchiq_driver(dev->driver);
>> +
>> +       if (driver->remove)
>> +               driver->remove(device);
>> +}
>> +
>>   const struct bus_type vchiq_bus_type = {
>>          .name   = "vchiq-bus",
>>          .match  = vchiq_bus_type_match,
>>          .uevent = vchiq_bus_uevent,
>>          .probe  = vchiq_bus_probe,
>> +       .remove = vchiq_bus_remove,
>>   };
>>   
>>   static void vchiq_device_release(struct device *dev)
>> -- 
>> 2.43.0
>>

