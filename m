Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B517EE
	for <linux-staging@lists.linux.dev>; Fri, 23 Dec 2022 05:28:45 +0000 (UTC)
Received: from [IPV6:2401:4900:1f3f:d076:4da6:b729:f032:ed0a] (unknown [IPv6:2401:4900:1f3f:d076:4da6:b729:f032:ed0a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C736F93;
	Fri, 23 Dec 2022 06:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671773322;
	bh=Lew3jrQRHjRkccU+AQDJAFQBxkdZnuSTUagLXbMqiIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pnQNdZrdaRnxHqDRXI7NV3hu+0Ab9FozDptohx38HkRCag0hE1WY//6HScF5/p8CA
	 1+lj5CkbuJGybjA1Ll+W2tK3wl1bNa+pjZMkLHzpAaMQsh+UVGZ9J0WbgxWv85h74B
	 ww4AbXvhY0REUucqOCdF4JDquO76LzbCcOTlno9Y=
Message-ID: <3c864c60-91a6-9ef4-367e-3c8d453b765b@ideasonboard.com>
Date: Fri, 23 Dec 2022 10:58:31 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/4] staging: vc04_services: Stop leaking platform
 device on error path
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Adrien Thierry <athierry@redhat.com>, Stefan Wahren
 <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Dan Carpenter <error27@gmail.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221222191500.515795-1-umang.jain@ideasonboard.com>
 <20221222191500.515795-2-umang.jain@ideasonboard.com>
 <Y6S+d512bYo2BF0O@pendragon.ideasonboard.com>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <Y6S+d512bYo2BF0O@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/22 2:00 AM, Laurent Pinchart wrote:
> Hi Umang,
>
> Thank you for the patch.
>
> On Fri, Dec 23, 2022 at 12:44:57AM +0530, Umang Jain wrote:
>> vchiq driver registers the child platform devices in
>> vchiq_register_child(). However, in the registration error code path,
>> currently the driver is leaking platform devices by not destroying the
>> return platform device. Plug this leak using platform_device_put() as
>> mentioned in the documentation for platform_device_register().
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index dc33490ba7fb..fc7ea7ba97b2 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -1779,6 +1779,7 @@ vchiq_register_child(struct platform_device *pdev, const char *name)
>>   	child = platform_device_register_full(&pdevinfo);
>>   	if (IS_ERR(child)) {
>>   		dev_warn(&pdev->dev, "%s not registered\n", name);
>> +		platform_device_put(child);
> If IS_ERR(child), what do you expect platform_device_put(child) to do ?
> And have you read the implementation of platform_device_register_full()
> ?

Errr, yeah - it is handling the platform_device_put() as well. Stupid me!

(dropping this patch for v3)
>
>>   		child = NULL;
>>   	}
>>   

