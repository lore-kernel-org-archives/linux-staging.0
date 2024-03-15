Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A346FAD
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 05:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710481647; cv=none; b=uywrEPZCUS8hvZSBn4IdCGXHg/mORa1WLjTlz2PeT+PpX4IVaXudWM5gd0LUtcYwe71vJ1b2COAEXrXM6jRegfdBoyWFAl4cF9dlkcneCClSlUtzs0rJlG6+6SneAdPlTuTBoIJLFDaXdQlrVeDJIZPUpjamklgMYLiUVtEh+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710481647; c=relaxed/simple;
	bh=xeYahBUMw9OW93kinvpocP6ut77/2HT82iabCjPPNA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgX8aT7d1rX3CerbzFDeYF4gWigFLJH2xeUvEVCpqcp+yzGknLA+JUj3SvnrMZlDYb0Fp8AX5h8y1d3hHfzaxhW9F90cG6FH7bj81TuO63ck1cpv9bqa4rh2Zjm4RP3wW0NHkYpjMs895itViqhL/1gEY22XKsMxbE9hQhr3l0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t8WwXBtz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t8WwXBtz"
Received: from [192.168.1.105] (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E68EB667;
	Fri, 15 Mar 2024 06:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710481618;
	bh=xeYahBUMw9OW93kinvpocP6ut77/2HT82iabCjPPNA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t8WwXBtzs/WS5DAy45AbCfJ0buV44cJ107prXQEtx2X3aEsbMPPHpX+trad2l1dDe
	 0GID03kPZxdRLN4usTSWvwnEmX6Kqhs4eJWsSwsClcaA/0NVmVrQMhS9RDiXyH7tM8
	 LK7ggJ5PNHS0hquxbMjYplNh2YqyQR2yBW+1op/M=
Message-ID: <996c4012-4274-4bbc-8155-43ae76368f79@ideasonboard.com>
Date: Fri, 15 Mar 2024 11:17:15 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] staging: vc04_services: Drop global variables
 tracking allocated pages
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter
 <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
 <20240314100607.336009-6-umang.jain@ideasonboard.com>
 <171042807436.252503.7131780241808072028@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <171042807436.252503.7131780241808072028@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 14/03/24 8:24 pm, Kieran Bingham wrote:
> Quoting Umang Jain (2024-03-14 10:06:06)
>> The variables tracking allocated pages fragments in vchiq_arm.c
>> can be easily moved to struct vchiq_drvdata instead of being global.
>> This helps us to drop the non-essential global variables in the vchiq
>> interface.
>>
>> Drop the TODO item as well, as it is now totally addressed:
>>> Get rid of all non essential global structures and create a proper per
>>    device structure
>>
>> No functional changes intended in this patch.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   drivers/staging/vc04_services/interface/TODO  |  8 ---
>>   .../interface/vchiq_arm/vchiq_arm.c           | 53 +++++++++----------
>>   .../interface/vchiq_arm/vchiq_arm.h           |  6 +++
>>   3 files changed, 30 insertions(+), 37 deletions(-)
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
>> index 282f83b335d4..666ab73ce0d1 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -140,12 +140,6 @@ struct vchiq_pagelist_info {
>>   };
>>   
>>   static void __iomem *g_regs;
> What happens with this one ? Is it essential to be global? Can it be
> part of the device? Who's mapping it? or unmapping?
>
> If we're keeping it global, I'd add a comment...

The keyword in the series in 'non-essential' and I feel this one is 
essential one.

It's on the irq request path so encapsulating it in the platform driver 
data and then again trying to get it from there, will make this affect 
performance.

See remote_event_signal() and vchiq_doorbell_irq()  in vchiq_arm.c

(For testing, a added a dev_info() in the vchiq_doorbell_irq() and it 
brought down the consistent 30fps IMX219 streaming to (15-26)fps 
inconsistent range)

>
>> -static unsigned int g_fragments_size;
>> -static char *g_fragments_base;
>> -static char *g_free_fragments;
>> -static struct semaphore g_free_fragments_sema;
>> -
>> -static DEFINE_SEMAPHORE(g_free_fragments_mutex, 1);
>>   
>>   static int
>>   vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
>> @@ -376,20 +370,20 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
>>              (drvdata->cache_line_size - 1)))) {
>>                  char *fragments;
>>   
>> -               if (down_interruptible(&g_free_fragments_sema)) {
>> +               if (down_interruptible(&drvdata->free_fragments_sema)) {
>>                          cleanup_pagelistinfo(instance, pagelistinfo);
>>                          return NULL;
>>                  }
>>   
>> -               WARN_ON(!g_free_fragments);
>> +               WARN_ON(!drvdata->free_fragments);
>>   
>> -               down(&g_free_fragments_mutex);
>> -               fragments = g_free_fragments;
>> +               down(&drvdata->free_fragments_mutex);
>> +               fragments = drvdata->free_fragments;
>>                  WARN_ON(!fragments);
>> -               g_free_fragments = *(char **)g_free_fragments;
>> -               up(&g_free_fragments_mutex);
>> +               drvdata->free_fragments = *(char **)drvdata->free_fragments;
>> +               up(&drvdata->free_fragments_mutex);
>>                  pagelist->type = PAGELIST_READ_WITH_FRAGMENTS +
>> -                       (fragments - g_fragments_base) / g_fragments_size;
>> +                       (fragments - drvdata->fragments_base) / drvdata->fragments_size;
>>          }
>>   
>>          return pagelistinfo;
>> @@ -421,10 +415,10 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>>          pagelistinfo->scatterlist_mapped = 0;
>>   
>>          /* Deal with any partial cache lines (fragments) */
>> -       if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && g_fragments_base) {
>> -               char *fragments = g_fragments_base +
>> +       if (pagelist->type >= PAGELIST_READ_WITH_FRAGMENTS && drvdata->fragments_base) {
>> +               char *fragments = drvdata->fragments_base +
>>                          (pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
>> -                       g_fragments_size;
>> +                       drvdata->fragments_size;
>>                  int head_bytes, tail_bytes;
>>   
>>                  head_bytes = (cache_line_size - pagelist->offset) &
>> @@ -449,11 +443,11 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>>                                  fragments + cache_line_size,
>>                                  tail_bytes);
>>   
>> -               down(&g_free_fragments_mutex);
>> -               *(char **)fragments = g_free_fragments;
>> -               g_free_fragments = fragments;
>> -               up(&g_free_fragments_mutex);
>> -               up(&g_free_fragments_sema);
>> +               down(&drvdata->free_fragments_mutex);
>> +               *(char **)fragments = drvdata->free_fragments;
>> +               drvdata->free_fragments = fragments;
>> +               up(&drvdata->free_fragments_mutex);
>> +               up(&drvdata->free_fragments_sema);
>>          }
>>   
>>          /* Need to mark all the pages dirty. */
>> @@ -489,11 +483,11 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>>          if (err < 0)
>>                  return err;
>>   
>> -       g_fragments_size = 2 * drvdata->cache_line_size;
>> +       drvdata->fragments_size = 2 * drvdata->cache_line_size;
>>   
>>          /* Allocate space for the channels in coherent memory */
>>          slot_mem_size = PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
>> -       frag_mem_size = PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
>> +       frag_mem_size = PAGE_ALIGN(drvdata->fragments_size * MAX_FRAGMENTS);
>>   
>>          slot_mem = dmam_alloc_coherent(dev, slot_mem_size + frag_mem_size,
>>                                         &slot_phys, GFP_KERNEL);
>> @@ -513,15 +507,16 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>>          vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =
>>                  MAX_FRAGMENTS;
>>   
>> -       g_fragments_base = (char *)slot_mem + slot_mem_size;
>> +       drvdata->fragments_base = (char *)slot_mem + slot_mem_size;
>>   
>> -       g_free_fragments = g_fragments_base;
>> +       drvdata->free_fragments = drvdata->fragments_base;
>>          for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
>> -               *(char **)&g_fragments_base[i * g_fragments_size] =
>> -                       &g_fragments_base[(i + 1) * g_fragments_size];
>> +               *(char **)&drvdata->fragments_base[i * drvdata->fragments_size] =
>> +                       &drvdata->fragments_base[(i + 1) * drvdata->fragments_size];
>>          }
>> -       *(char **)&g_fragments_base[i * g_fragments_size] = NULL;
>> -       sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
>> +       *(char **)&drvdata->fragments_base[i * drvdata->fragments_size] = NULL;
>> +       sema_init(&drvdata->free_fragments_sema, MAX_FRAGMENTS);
>> +       sema_init(&drvdata->free_fragments_mutex, 1);
>>   
>>          err = vchiq_init_state(state, vchiq_slot_zero, dev);
>>          if (err)
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> index f2fd572df2b3..d5c0a8e9fa2b 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
>> @@ -34,6 +34,12 @@ struct vchiq_drvdata {
>>          struct rpi_firmware *fw;
>>   
>>          struct vchiq_connected drv_connected;
>> +
>> +       struct semaphore free_fragments_sema;
>> +       struct semaphore free_fragments_mutex;
>> +       char *fragments_base;
>> +       char *free_fragments;
>> +       unsigned int fragments_size;
>>   };
>>   
>>   struct user_service {
>> -- 
>> 2.43.0
>>

