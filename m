Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791F625
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713689950; cv=none; b=YrOTAngXUb+X4AycN4EZPVPQaQaCBMUXa2RWhmyuaA0Sxl0rp0HulVvqUPCpxf2P3Q2xrkXEhxHe97etdXa6T/mz4jli9VRstj2Uvhs0lWVPGYN2EjiFFZlkPdYsZ+ZCkDopKiECi+1Oq2RYlFClC5OOIH7BjkrSJyOmX34iNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713689950; c=relaxed/simple;
	bh=bVu7OmyVq4BqZBV8DnSNC7o+2/NqLbqraHl6g0a/1Xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8b3q13ZAbFV0XhZ3nZeIjesJHDZKxtO+aNBV2JnnrTR4gR18UVBBQjz0VSV2qBbx71dgHXqHW/TPpYLg+PlGSotr8+r8axU1SWpXIes+UfNt20J8YWWBdMeWjEvsTlIWVYrXT5AyB6cMJClroQk3sh2A89qUDdmuqyMlPtKvT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rfuEnzWe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rfuEnzWe"
Received: from [192.168.1.105] (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F069F674;
	Sun, 21 Apr 2024 10:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713689897;
	bh=bVu7OmyVq4BqZBV8DnSNC7o+2/NqLbqraHl6g0a/1Xo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rfuEnzWeGiVCyozfC9EOpepZ7tsFBchNUfN1jQtngWO/tkLUpHTE7I17Ia9UoUN7H
	 I5/nESfNBu7pUwhCPhj3V9xmn7kOU1tlW95vr7BEPSSNIG0YCvN+ZE+ZPN680jAldv
	 aR+d9Rd7veqq/kQysNFqcMqGs8H3KwPhjOE0L3lo=
Message-ID: <7e7a20bc-c7c9-40d1-952b-c13a5b185cf2@ideasonboard.com>
Date: Sun, 21 Apr 2024 14:28:57 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] staging: vc04_services: vchiq_arm: Drop
 g_cache_line_size
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-4-umang.jain@ideasonboard.com>
 <837906bb-0e40-444a-803f-f5ed5d693c2f@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <837906bb-0e40-444a-803f-f5ed5d693c2f@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan

On 19/04/24 7:34 pm, Stefan Wahren wrote:
> Hi Umang,
>
> Am 12.04.24 um 09:57 schrieb Umang Jain:
>> The cache-line-size is cached in struct vchiq_platform_info.
>> There is no need to cache this again via g_cache_line_size
>> and use it. Instead use the value from vchiq_platform_info directly.
>>
>> While at it, move the comment about L2 cache line size in the kerneldoc
>> block of struct vchiq_platform_info.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   .../interface/vchiq_arm/vchiq_arm.c           | 34 ++++++++-----------
>>   .../interface/vchiq_arm/vchiq_arm.h           | 11 ++++++
>>   2 files changed, 25 insertions(+), 20 deletions(-)
>>
>> diff --git 
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c 
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 7cf38f8581fa..af74d7268717 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -131,17 +131,6 @@ struct vchiq_pagelist_info {
>>   };
>>
>>   static void __iomem *g_regs;
>> -/* This value is the size of the L2 cache lines as understood by the
>> - * VPU firmware, which determines the required alignment of the
>> - * offsets/sizes in pagelists.
>> - *
>> - * Modern VPU firmware looks for a DT "cache-line-size" property in
>> - * the VCHIQ node and will overwrite it with the actual L2 cache size,
>> - * which the kernel must then respect.  That property was rejected
>> - * upstream, so we have to use the VPU firmware's compatibility value
>> - * of 32.
>> - */
>> -static unsigned int g_cache_line_size = 32;
>>   static unsigned int g_fragments_size;
>>   static char *g_fragments_base;
>>   static char *g_free_fragments;
>> @@ -212,6 +201,7 @@ static struct vchiq_pagelist_info *
>>   create_pagelist(struct vchiq_instance *instance, char *buf, char 
>> __user *ubuf,
>>           size_t count, unsigned short type)
>>   {
>> +    struct vchiq_drv_mgmt *drv_mgmt;
>>       struct pagelist *pagelist;
>>       struct vchiq_pagelist_info *pagelistinfo;
>>       struct page **pages;
>> @@ -226,6 +216,8 @@ create_pagelist(struct vchiq_instance *instance, 
>> char *buf, char __user *ubuf,
>>       if (count >= INT_MAX - PAGE_SIZE)
>>           return NULL;
>>
>> +    drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
> this patch is wrong and cause a null pointer dereference:
>
> [  232.297800] Unable to handle kernel NULL pointer dereference at
> virtual address 00000004 when read
> [  232.317576] [00000004] *pgd=02963831, *pte=00000000, *ppte=00000000
> [  232.334240] Internal error: Oops: 17 [#1] ARM
> [  232.348423] Modules linked in: bcm2835_v4l2(C) videobuf2_vmalloc
> videobuf2_memops bcm2835_mmal_vchiq(C) videobuf2_v4l2 videobuf2_common
> snd_bcm2835(C) raspberrypi_hwmon bcm2835_rng rng_core vchiq(C) configfs
> [  232.377176] CPU: 0 PID: 504 Comm: VCHIQ completio Tainted: G
> C         6.9.0-rc2+ #1
> [  232.395690] Hardware name: BCM2835
> [  232.409044] PC is at vchiq_prepare_bulk_data+0x26c/0x528 [vchiq]
> [  232.425441] LR is at vchiq_prepare_bulk_data+0x4ec/0x528 [vchiq]
> [  232.441815] pc : [<bf0154f8>]    lr : [<bf015778>] psr: 60000013
> [  232.458395] sp : ccc29d80  ip : 00000000  fp : c7c43000
> [  232.473982] r10: bf022fc8  r9 : 43cd7000  r8 : c64a4000
> [  232.489690] r7 : 00000001  r6 : 00000000  r5 : c7c43020  r4 : 43cd7000
> [  232.506316] r3 : 00000000  r2 : 0000028c  r1 : c3cd7a80  r0 : 00000000
> [  232.522865] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> Segment none
> [  232.540123] Control: 00c5387d  Table: 02828008  DAC: 00000051
> [  232.556061] Register r0 information: NULL pointer
> [  232.570951] Register r1 information: non-slab/vmalloc memory
> [  232.586845] Register r2 information: non-paged memory
> [  232.602036] Register r3 information: NULL pointer
> [  232.616689] Register r4 information: non-paged memory
> [  232.631750] Register r5 information: 0-page vmalloc region starting
> at 0xc7c00000 allocated at iotable_init+0x0/0xf8
> [  232.652526] Register r6 information: NULL pointer
> [  232.667439] Register r7 information: non-paged memory
> [  232.682558] Register r8 information: slab kmalloc-4k start c64a4000
> pointer offset 0 size 4096
> [  232.701421] Register r9 information: non-paged memory
> [  232.716545] Register r10 information: 4-page vmalloc region starting
> at 0xbf021000 allocated at load_module+0x73c/0x16e0
> [  232.737816] Register r11 information: 0-page vmalloc region starting
> at 0xc7c00000 allocated at iotable_init+0x0/0xf8
> [  232.758991] Register r12 information: NULL pointer
> [  232.774079] Process VCHIQ completio (pid: 504, stack limit = 
> 0xe510e83c)
> [  232.791136] Stack: (0xccc29d80 to 0xccc2a000)
> [  232.805806] 9d80: 00000000 00000000 00000036 00000000 00000001
> 00000001 c7c43008 00000001
> [  232.824634] 9da0: c1d610e8 0002b28c 00000001 00000010 47c43000
> 10a55ba2 c2291744 c1d61000
> [  232.843077] 9dc0: c1d610d4 00000000 00000000 00001002 00000000
> c1d610e8 c1d61170 bf012bd8
> [  232.861553] 9de0: 00000800 00000001 6c6b6a69 706f6e6d c8209748
> ccc29e28 74737271 c236006c
> [  232.880103] 9e00: 00000000 00000000 00000072 0002b28c 00000006
> c64a4000 00000051 c2c9e580
> [  232.898623] 9e20: ccc29e90 10a55ba2 00000000 c22b2dc0 c64a4000
> c014c406 b6ceaca8 00000000
> [  232.917119] 9e40: c2c9e580 00000036 c1d61000 bf0173a0 00000800
> 00001002 00000000 00000001
> [  232.935668] 9e60: 00000002 c8200194 00000007 00000003 c1d61000
> c64a4020 00000002 c2c9e580
> [  232.954296] 9e80: 00000003 00000000 b6eaf22c 00001001 0000d001
> 0002b28c 00000800 00001002
> [  232.973059] 9ea0: 00000000 c2643420 cbfc8160 c0112bec 00000000
> c644fc18 cbfc8160 00000255
> [  232.991818] 9ec0: 0b98b34f c0227c9c 00000001 c1c6d200 00000255
> 00001020 b6308000 ccc29fb0
> [  233.010716] 9ee0: c1c6d204 c644fc18 00000cc0 10a55ba2 b6308000
> c22b2dc0 c22dd600 b6ceaca8
> [  233.029603] 9f00: c014c406 c2c9e580 00000003 00000036 b6eaf0d8
> c026d4d0 c22b2dc0 c026de50
> [  233.048517] 9f20: b6321000 ccc29fb0 00000817 b6308734 c2c9e580
> c22dd601 00000255 c096a730
> [  233.067479] 9f40: ccc29fb0 c096a730 00000000 ccc29f50 00000000
> c010271c 40000000 ee08aa10
> [  233.086503] 9f60: ccc29fb0 c010271c ccc29fb0 b6e9af40 c0102648
> c2c9e580 00c5387d 10a55ba2
> [  233.105615] 9f80: b6cead48 b6eaf130 b6ceaca8 c014c406 00000036
> c01002c0 c2c9e580 00000036
> [  233.124926] 9fa0: b6eaf0d8 c0100060 b6eaf130 b6ceaca8 00000003
> c014c406 b6ceaca8 00000000
> [  233.144213] 9fc0: b6eaf130 b6ceaca8 c014c406 00000036 00000800
> 00001002 0002b28c b6eaf0d8
> [  233.163431] 9fe0: b6eaf060 b6ceac9c b6e9c0c8 b6dd353c 80000010
> 00000003 00000000 00000000
> [  233.182630] Call trace:
> [  233.182680]  vchiq_prepare_bulk_data [vchiq] from
> vchiq_bulk_transfer+0x1e4/0x3d4 [vchiq]
> [  233.215907]  vchiq_bulk_transfer [vchiq] from
> vchiq_ioctl+0x1d4/0x1114 [vchiq]
> [  233.234685]  vchiq_ioctl [vchiq] from vfs_ioctl+0x28/0x3c
> [  233.251519]  vfs_ioctl from sys_ioctl+0xc4/0x928
> [  233.267303]  sys_ioctl from ret_fast_syscall+0x0/0x54
> [  233.283472] Exception stack(0xccc29fa8 to 0xccc29ff0)
> [  233.299605] 9fa0:                   b6eaf130 b6ceaca8 00000003
> c014c406 b6ceaca8 00000000
> [  233.318897] 9fc0: b6eaf130 b6ceaca8 c014c406 00000036 00000800
> 00001002 0002b28c b6eaf0d8
> [  233.338126] 9fe0: b6eaf060 b6ceac9c b6e9c0c8 b6dd353c
> [  233.354204] Code: e3530001 1a000032 e59d300c e1db20b6 (e5933004)
>
> Please always test your changes as documented in interface/TESTING
>
> I will send a follow-up fix soon

thanks for the fixup!

I was testing it till v3, and I see that v4 where the bug was introduced 
by me. And I must have completely missed testing it as per interface/TESTING

Shouldn't happen again, I should streamlining process for testing VC04 
services patches now (including compile-test and functional-test). It 
has been very adhoc (Rpi3 / Rpi4 / 32-bit / 64-bit / ) from a long time 
now :(

Apologies again for the pain.

