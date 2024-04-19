Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35864D110
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713541382; cv=none; b=KVFLnkK6tnFvUXgDXtS7Y/5Y+3AqeAZH0BapIFGjMs0fCwDAVQH5r+AMBi1iHkiZBE3kYmOnGe/cGVusJp3WYR438FhCO+TrgVlhSIYPHzjrw1v/kyQoYCskGIiYabqbnXB03DcxttzoINN4uR59zM18JdW8qWveLY2D84tvRZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713541382; c=relaxed/simple;
	bh=0dzcK/haWxXGWE/kHTWcMTRnmr1u360U2PfxO2mEL6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+lJoaYebMeZlpeGKmZ6lHf1iv822viC3PUpW0Hhwmwpf55+1MgIrvLa/HiQ1XUzG4yqSpsclebRY2stl8DL5yGaCmcNIumDNPracJ9SQPQaHFReRkHWNGKmDTYjb484cf3aw425baxeNFBxD96kJxgpMojK/SccNQcHIipx6ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=DNmwI1kA; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="DNmwI1kA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713541368; x=1714146168; i=wahrenst@gmx.net;
	bh=hRSV/0Na2kVKClQw1Vj1AHtfM4i0DDw/3B9QIS+aqKk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DNmwI1kAmXIEcNrZxwE2v/oPeGCuFBaNXk5qseINqCRQx0uunzbOOsOhOEkxQMIP
	 hFr1+S524hJEMsrIYL52B6ZljVrQbUwKN8uaFFcb7B1TU57mEJLGpqi1yzNXX/dzl
	 iytngvkUZ7bylSzHwjApnK+073olw0jDWHwUd/XTSxoZXbrmcVeXNuvHjl+g1RySQ
	 CkIvhRIIpir4qeOZLJpQ+YbSIy6Hn/lSGZTeEuul3ezDzwfiS56O1G1BWuMtvkoyH
	 ms4JACSLzfjoQNzzApmu+0UfzFYxTW0Sw2l1othVOqDJrKNmHdiLbiLhYKam+N/qU
	 NFRTyCopCFYiqoIXiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1sgddX0lbr-011kr3; Fri, 19
 Apr 2024 17:42:48 +0200
Message-ID: <5fd9706f-8a43-4001-8e38-d24006340178@gmx.net>
Date: Fri, 19 Apr 2024 17:42:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vc04_services: vchiq_arm: Fix NULL ptr
 dereferences
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240419142650.206583-1-wahrenst@gmx.net>
 <20240419144442.GA6414@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240419144442.GA6414@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:WMWiBkJzo+25CPs2176WNWd5xHjW+vbMEjA87mPnpj2aykSb4Ol
 3AgofM8A8pVE6DQjVH9DkEvHoSGrUka6nel0Q70J3m4gH8gP+MgdByxrgl9ISN8xeAyrUI6
 qmeY5xVmpmuYCTjfhnoQC/+YYZvXOhnug7Mnb2qCpGrRg4eEO5gkJdil6OTuKNVXpQPuFnn
 yiUH0rBv8ZnQMBvozUuIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6YcdnnZtFss=;VVjJ0LdzMq6TBarRJk0lA+DGC5Z
 f721MstzzSZ2OUnt5mw447otnXSq2Q83PULwJJlleJ5VFNQrUQg1erw4nhjJ6N5wFvk8K4frl
 0P12wTEkLq88xOVDTtut2htbDsxFJecDV9z9SpskzZ5bumci4WyJlXXzXXr+l+LzdjR6rFFVo
 kdKhBQUcaVxdFn9kqpBsrr0v+plMqiP63elo3QGzyq1LAcuVIOxGk95rhqChBkvIItjvoTpoQ
 bpptah+ouM2BAUfEid6CXkIccKsNhPktsrNwNLMKLswTRwPbB12bo9nHyG8KjXYIEuycaHQJg
 JnLJbyBiegv00NxS3NpdGKEO16dCKVxtBF5dJzXfti9Iq5Q4H6BFIIOJL2jshM5HOdmESKlZN
 KkyY9WO5d1+d53VHejeWwWxUQlWc2oVCrXwjzC1uyNktBh/zvKUlEm9DfTnKtIQIIbHBBEw8e
 +JdUg+cgcjL9dyJxhd9fmVE4BGJPJwzuloS5NvioeMXMmtlbBk5g0+0mQVNHQCUlRUzMmNd7l
 FVpH1efdIkGBCGQynXUFgK5P+ACwftqKmPXt3w28bz7uzINZpyLOIk5iUOFbhaDXSGycURQdb
 UapWFrrFPUIQAa3k3Crqa8mLqk77bjdlNpvhxBbl0JXsHA5b0Jzu+Y0CYzFSzUm6hGDn3mI2L
 cSj/2pTfW1DhbCpuABmU8fZhOuf9+rHsjRmmh3vZ//EncMyiLQPVBIIwof5IvkS0ZQILFway/
 JQ/wDbqWioiPOAJ+Kr/kIOIaf6/5Rr+R4gzlWIBbg+Zcuulj19gc2vfGVMPUmlxj7DP1bX9bV
 7vMQGGoYGp8jBNrbhJJQeiYstekyqgUuc37BVbJUNp6l8=

Hi Laurent,

Am 19.04.24 um 16:44 schrieb Laurent Pinchart:
> Hi Stefan,
>
> Thank you for the patch.
>
> On Fri, Apr 19, 2024 at 04:26:50PM +0200, Stefan Wahren wrote:
>> The commit 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop
>> g_cache_line_size") introduced NULL pointer dereferences by
>> messing up usage of device driver data. But the real issue here
>> is the mixed usage of platform and device driver data. So fix
>> this by switching completely to device driver data.
>>
>> Fixes: 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop g_cache_line_size")
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 502ddc0f6e46..3b032d987f0c 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -257,7 +257,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
>>   	if (count >= INT_MAX - PAGE_SIZE)
>>   		return NULL;
>>
>> -	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
>> +	drv_mgmt = dev_get_drvdata(instance->state->dev);
>>
>>   	if (buf)
>>   		offset = (uintptr_t)buf & (PAGE_SIZE - 1);
>> @@ -436,7 +436,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>>
>>   	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
>>
>> -	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
>> +	drv_mgmt = dev_get_drvdata(instance->state->dev);
>>
>>   	/*
>>   	 * NOTE: dma_unmap_sg must be called before the
>> @@ -497,7 +497,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>>   static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>>   {
>>   	struct device *dev = &pdev->dev;
>> -	struct vchiq_drv_mgmt *drv_mgmt = platform_get_drvdata(pdev);
>> +	struct vchiq_drv_mgmt *drv_mgmt = dev_get_drvdata(dev);
> This hunk and the next one seem to be no-ops. Did you intend to make
> cosmetic changes here, or was something overlooked ?
Yes it was intended. But you are right, i should split it.
>
>>   	struct rpi_firmware *fw = drv_mgmt->fw;
>>   	struct vchiq_slot_zero *vchiq_slot_zero;
>>   	void *slot_mem;
>> @@ -1753,7 +1753,7 @@ static int vchiq_probe(struct platform_device *pdev)
>>   		return -EPROBE_DEFER;
>>
>>   	mgmt->info = info;
>> -	platform_set_drvdata(pdev, mgmt);
>> +	dev_set_drvdata(&pdev->dev, mgmt);
>>
>>   	err = vchiq_platform_init(pdev, &mgmt->state);
>>   	if (err)

