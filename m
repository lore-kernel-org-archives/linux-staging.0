Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871511A38F4
	for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711202294; cv=none; b=Pjps70knnIpqWbXqvaW8+TSz4E0cZ/vHdoISfbZLrSj6zXXaJgNXrWaMH3Xw4Cno8Ys3P+xCCW0p0TVkRYVPTqcdUkL6xuSh1Zk7naE+qM4I6g0jKnmEML1S0t5RXU+It/mJ7HcNGsPWg6Dt1PVbrYKPZkPt/GMW4C236fIzm0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711202294; c=relaxed/simple;
	bh=86UGEEVWD7W3AmKvhXoWV3zST5jygEeWHGZZgQq0eWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z24BhbPyd4hx8Snw//ZYPDar8Tt2egnpx6Dac5euRRRg/EY7TvBnfLGqVe0NMaAM6soWdnLv7tHiAAmCbFPXzMnnrhVKivZ6oDrg3f7f+3UIbwZt9SOl6fKMbepPg4IANdEU9hqvuVb48oAe6GtNEq5DQMR6CNzqBaB+xO2JaR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YrR3GoQ0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YrR3GoQ0"
Received: from [192.168.1.105] (unknown [103.86.18.144])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2968FD8B;
	Sat, 23 Mar 2024 14:57:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711202260;
	bh=86UGEEVWD7W3AmKvhXoWV3zST5jygEeWHGZZgQq0eWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YrR3GoQ0pYJqipj35KRWxKwAjKloTUdgYuokiL6cSxhPpS8PQ0+O+sY/839DMTVeX
	 eHwDKKLYfa0DJwkm3RTlX6aBH7NV2Wn/X7f6DFct3nFPhmwAe4SojF5zXw+ArTTzl/
	 7+HlsH/hGZnBxX/mPGdgsAB7QcR2VMC+JcbP5Sjs=
Message-ID: <b8dd9579-cd1f-483d-be7e-5c6772343df5@ideasonboard.com>
Date: Sat, 23 Mar 2024 19:28:02 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] staging: vc04_services: Drop global variables
 tracking allocated pages
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240321103740.808561-1-umang.jain@ideasonboard.com>
 <20240321103740.808561-6-umang.jain@ideasonboard.com>
 <20240321195041.GY9582@pendragon.ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240321195041.GY9582@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

On 22/03/24 1:20 am, Laurent Pinchart wrote:
> Hi Uamng,
>
> Thank you for the patch.
>
> On Thu, Mar 21, 2024 at 04:07:39PM +0530, Umang Jain wrote:
>> The variables tracking allocated pages fragments in vchiq_arm.c
>> can be easily moved to struct vchiq_drv_mgmt instead of being global.
>> This helps us to drop the non-essential global variables in the vchiq
>> interface.
>>
>> However, g_regs is intentionally kept global since it is read/write
>> in fast paths (for e.g. doorbell IRQs). Introducing it in struct
>> vchiq_drv_mgmt and getting it in remote_event_signal handler, turns
>> out to be quite tedious. Add a comment for the same.
> The fast path argument doesn't really hold in my opinion, I think you
> can retrieve the variable through vchiq_state in vchiq_doorbell_irq().
>
> All callers for remote_event_signal have a vchiq_state pointer, so it
> shouldn't be that difficult to get rid of that global variable. It
> doesn't have to be done in this patch, it can be done on top.
>
>> Drop the TODO item as well, as it is now totally addressed:
>>> Get rid of all non essential global structures and create a proper per
>>    device structure
> Don't you need to also drop the g_state variable ?
>
>> No functional changes intended in this patch.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   drivers/staging/vc04_services/interface/TODO  |  8 ---
>>   .../interface/vchiq_arm/vchiq_arm.c           | 57 +++++++++----------
>>   .../interface/vchiq_arm/vchiq_arm.h           |  6 ++
>>   3 files changed, 34 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
>> index 05eb5140d096..15f12b8f213e 100644
>> --- a/drivers/staging/vc04_services/interface/TODO
>> +++ b/drivers/staging/vc04_services/interface/TODO
>> @@ -41,14 +41,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
>>   indentation deep making it very unpleasant to read. This is specially relevant
>>   in the character driver ioctl code and in the core thread functions.
>>   
>> -* Get rid of all non essential global structures and create a proper per
>> -device structure
>> -
>> -The first thing one generally sees in a probe function is a memory allocation
>> -for all the device specific data. This structure is then passed all over the
>> -driver. This is good practice since it makes the driver work regardless of the
>> -number of devices probed.
>> -
>>   * Clean up Sparse warnings from __user annotations. See
>>   vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
>>   is never disclosed to userspace.
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index ba096bcb32c8..c4807b302718 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -140,13 +140,11 @@ struct vchiq_pagelist_info {
>>   	unsigned int scatterlist_mapped;
>>   };
>>   
>> +/*
>> + * Essential global pointer since read/written on fast paths
>> + * (doorbell IRQs).
>> + */
>>   static void __iomem *g_regs;
>> -static unsigned int g_fragments_size;
>> -static char *g_fragments_base;
>> -static char *g_free_fragments;
>> -static struct semaphore g_free_fragments_sema;
>> -
>> -static DEFINE_SEMAPHORE(g_free_fragments_mutex, 1);
> Why is this code using a semaphore as a mutex ?? It should be replaced
> with a real mutex. This can be done on top of this patch.

Probably the RPi people can answer this (they're cc'ed to the series) 
but what I found  in `Documentation/locking/mutex-design.rst`

```
Disadvantages
-------------

Unlike its original design and purpose, 'struct mutex' is among the largest
locks in the kernel. E.g: on x86-64 it is 32 bytes, where 'struct semaphore'
is 24 bytes and rw_semaphore is 40 bytes. Larger structure sizes mean 
more CPU
cache and memory footprint.
```

So probably a resource constraint / resource-saving step?
>
>>   
>>   static int
>>   vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
>> @@ -377,20 +375,20 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
>>   	    (drv_mgmt->pinfo->cache_line_size - 1)))) {
>>   		char *fragments;
>>   
>> -		if (down_interruptible(&g_free_fragments_sema)) {
>> +		if (down_interruptible(&drv_mgmt->free_fragments_sema)) {
>>   			cleanup_pagelistinfo(instance, pagelistinfo);
>>   			return NULL;
>>   		}
>>   
>> -		WARN_ON(!g_free_fragments);
>> +		WARN_ON(!drv_mgmt->free_fragments);
>>   
>> -		down(&g_free_fragments_mutex);
>> -		fragments = g_free_fragments;
>> +		down(&drv_mgmt->free_fragments_mutex);
>> +		fragments = drv_mgmt->free_fragments;
>>   		WARN_ON(!fragments);
>> -		g_free_fragments = *(char **)g_free_fragments;
>> -		up(&g_free_fragments_mutex);
>> +		drv_mgmt->free_fragments = *(char **)drv_mgmt->free_fragments;
>> +		up(&drv_mgmt->free_fragments_mutex);
>>   		pagelist->type = PAGELIST_READ_WITH_FRAGMENTS +
>> -			(fragments - g_fragments_base) / g_fragments_size;
>> +			(fragments - drv_mgmt->fragments_base) / drv_mgmt->fragments_size;
>>   	}
>>   
>>   	return pagelistinfo;
>> @@ -420,10 +418,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>>   	pagelistinfo->scatterlist_mapped = 0;
>>   
>>   	/* Deal with any partial cache lines (fragments) */
>> -	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && g_fragments_base) {
>> -		char *fragments = g_fragments_base +
>> +	if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && drv_mgmt->fragments_base) {
>> +		char *fragments = drv_mgmt->fragments_base +
>>   			(pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
>> -			g_fragments_size;
>> +			drv_mgmt->fragments_size;
>>   		int head_bytes, tail_bytes;
>>   
>>   		head_bytes = (drv_mgmt->pinfo->cache_line_size - pagelist->offset) &
>> @@ -448,11 +446,11 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>>   				fragments + drv_mgmt->pinfo->cache_line_size,
>>   				tail_bytes);
>>   
>> -		down(&g_free_fragments_mutex);
>> -		*(char **)fragments = g_free_fragments;
>> -		g_free_fragments = fragments;
>> -		up(&g_free_fragments_mutex);
>> -		up(&g_free_fragments_sema);
>> +		down(&drv_mgmt->free_fragments_mutex);
>> +		*(char **)fragments = drv_mgmt->free_fragments;
>> +		drv_mgmt->free_fragments = fragments;
>> +		up(&drv_mgmt->free_fragments_mutex);
>> +		up(&drv_mgmt->free_fragments_sema);
>>   	}
>>   
>>   	/* Need to mark all the pages dirty. */
>> @@ -488,11 +486,11 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>>   	if (err < 0)
>>   		return err;
>>   
>> -	g_fragments_size = 2 * drv_mgmt->pinfo->cache_line_size;
>> +	drv_mgmt->fragments_size = 2 * drv_mgmt->pinfo->cache_line_size;
>>   
>>   	/* Allocate space for the channels in coherent memory */
>>   	slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
>> -	frag_mem_size = PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
>> +	frag_mem_size = PAGE_ALIGN(drv_mgmt->fragments_size * MAX_FRAGMENTS);
>>   
>>   	slot_mem = dmam_alloc_coherent(dev, slot_mem_size + frag_mem_size,
>>   				       &slot_phys, GFP_KERNEL);
>> @@ -512,15 +510,16 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>>   	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =
>>   		MAX_FRAGMENTS;
>>   
>> -	g_fragments_base = (char *)slot_mem + slot_mem_size;
>> +	drv_mgmt->fragments_base = (char *)slot_mem + slot_mem_size;
>>   
>> -	g_free_fragments = g_fragments_base;
>> +	drv_mgmt->free_fragments = drv_mgmt->fragments_base;
>>   	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
>> -		*(char **)&g_fragments_base[i * g_fragments_size] =
>> -			&g_fragments_base[(i + 1) * g_fragments_size];
>> +		*(char **)&drv_mgmt->fragments_base[i * drv_mgmt->fragments_size] =
>> +			&drv_mgmt->fragments_base[(i + 1) * drv_mgmt->fragments_size];
>>   	}
>> -	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
>> -	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
>> +	*(char **)&drv_mgmt->fragments_base[i * drv_mgmt->fragments_size] = NULL;
>> +	sema_init(&drv_mgmt->free_fragments_sema, MAX_FRAGMENTS);
>> +	sema_init(&drv_mgmt->free_fragments_mutex, 1);
>>   
>>   	err = vchiq_init_state(state, vchiq_slot_zero, dev);
>>   	if (err)
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> index 1190fab2efc4..1134187da6ab 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> @@ -41,6 +41,12 @@ struct vchiq_drv_mgmt {
>>   	bool connected;
>>   	int num_deferred_callbacks;
>>   	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
>> +
>> +	struct semaphore free_fragments_sema;
>> +	struct semaphore free_fragments_mutex;
>> +	char *fragments_base;
>> +	char *free_fragments;
>> +	unsigned int fragments_size;
>>   };
>>   
>>   struct user_service {

