Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED85F17D35A
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112922; cv=none; b=Bjbrv2b3pAoPnakLyFRnCHTNu2gju4313DwjzvK/IHxojLu9NSpxQ8U8vkGUuaJoHCJgKkMoUWJvYeb3DFxsqAqS/q3PPa+uQOzpkHyhKG//i0GyqO+8ZGBJjT2PzEK9vUcrm5KV8R0LZTEli86O7rsOCjIA586aYjCPlW+CXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112922; c=relaxed/simple;
	bh=+0d6v5n0atppJQ/nmp3CSYCQvACU9OB8sPkVUFznm90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thI5nIV29cI0Y7JoglBK3Ccv4Hit7rstUw0VbQDmXMJRr4erRN7XDBNGKRH+gt+0HA0zcMGHvmW6j7iD17g3DqFuuf8pnhVpK/sIJXjRWvAfwOh0FEveFUZb25pInZE2bNpdX+eWCLHCVCXIHFUt+Ei3InxGHK/tNLgBQVvNDeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895B3152B;
	Tue, 11 Jun 2024 06:35:43 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7F303F5A1;
	Tue, 11 Jun 2024 06:35:17 -0700 (PDT)
Message-ID: <28a88478-3f3b-4e4a-96b2-840661c14790@arm.com>
Date: Tue, 11 Jun 2024 14:35:16 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING:
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364
 vchiq_prepare_bulk_data
To: Stefan Wahren <wahrenst@gmx.net>, Arnd Bergmann <arnd@arndb.de>,
 Phil Elwell <phil@raspberrypi.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-staging@lists.linux.dev
References: <ad2b7034-ecc9-4d6e-844c-bfe32fb5b23c@gmx.net>
 <9d603d43-0f8a-4f9b-b11b-9e7543f421b9@app.fastmail.com>
 <CAMEGJJ3BqY9=9cq_JpKTVhyWKO50hcbEK0MXkBcYZwqadciGiA@mail.gmail.com>
 <72a414e4-4cd0-4b12-a662-cb73d1e3515e@app.fastmail.com>
 <20240610091534.GO18479@pendragon.ideasonboard.com>
 <28495bd5-41af-41b8-b427-6b6fd36a2740@app.fastmail.com>
 <CAMEGJJ30ffMSd40YpqGuMWOeazoT+oiDvzkYEc37jOTx4fZBNg@mail.gmail.com>
 <04b1276d-4db3-41a5-9960-15e96b779b13@arm.com>
 <d6f28773-d408-425c-8347-d0dbf301aea6@gmx.net>
 <9c2917fa-d2ee-4d0b-b42a-a27191e93088@app.fastmail.com>
 <5113a1df-858b-4ba1-bd8b-c53c0313c7ce@gmx.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5113a1df-858b-4ba1-bd8b-c53c0313c7ce@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/06/2024 12:37 pm, Stefan Wahren wrote:
> Am 11.06.24 um 13:08 schrieb Arnd Bergmann:
>> On Tue, Jun 11, 2024, at 12:47, Stefan Wahren wrote:
>>> Am 10.06.24 um 12:25 schrieb Robin Murphy:
>>>> On 2024-06-10 10:24 am, Phil Elwell wrote:
>>>>> On Mon, 10 Jun 2024 at 10:20, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>>        Arnd
>>>>> vchiq sends partial cache lines at the start and of reads (as seen
>>>>> from the ARM host) out of band, so the only misaligned DMA transfers
>>>>> should be from ARM to VPU. This should not require a bounce buffer.
>>>> Hmm, indeed the dma_kmalloc_safe() takes into account that unaligned
>>>> DMA_TO_DEVICE does not need bouncing, so it would suggest that
>>>> something's off in what vchiq is asking for.
>>> I'm available to debug this further, but i need more guidance here.
>>>
>>> At least i extend the output for the error case:
>>>
>>> -               WARN_ON(len == 0);
>>> -               WARN_ON(i && (i != (dma_buffers - 1)) && (len &
>>> ~PAGE_MASK));
>>> -               WARN_ON(i && (addr & ~PAGE_MASK));
>>> +               if (len == 0)
>>> +                       pr_warn_once("%s: sg_dma_len() == 0\n", 
>>> __func__);
>>> +               else if (i && (i != (dma_buffers - 1)) && (len &
>>> ~PAGE_MASK))
>>> +                       pr_warn_once("%s: following block not page
>>> aligned\n", __func__);
>>> +               else if (i && (addr & ~PAGE_MASK)) {
>>> +                       pr_warn_once("%s: block %u, DMA address %pad
>>> doesn't align with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
>>> +                       pr_warn_once("sg_dma_is_swiotlb: %d, dma_flags:
>>> %x\n", sg_dma_is_swiotlb(sg), sg->dma_flags);
>>> +               }
>>>
>>> Example result:
>>>
>>> [   84.180527] create_pagelist: block 1, DMA address 0x00000000f5f74800
>>> doesn't align with PAGE_MASK 0xfffffffffffff000
>>> [   84.180553] sg_dma_is_swiotlb: 0, dma_flags: 0
>>>
>>> Is this helpful?
>> It's interesting that this does not have the SG_DMA_SWIOTLB
>> flag set, as the theory so far was that an unaligned
>> user address is what caused this to bounce.

dma-direct doesn't use that flag (at least for now; potentially it might 
offer a tiny micro-optimisation, but not enough to really matter). At 
this point, len and pagelistinfo->dma_dir (as passed to dma_map_sg()) 
are what would have defined the bounce condition...

>> I think the most helpful bit of information that is
>> currently missing is the 'ubuf' and 'count' arguments
>> that got passed down from userspace into create_pagelist(),
>> to see what alignment they have in the failure case.
> Here is my attempt:
> 
>          if (len == 0)
>              pr_warn_once("%s: sg_dma_len() == 0\n", __func__);
>          else if (i && (i != (dma_buffers - 1)) && (len & ~PAGE_MASK))
>              pr_warn_once("%s: following block not page aligned\n",
> __func__);
>          else if (i && (addr & ~PAGE_MASK)) {
>              pr_warn_once("%s: block %u, DMA address %pad doesn't align
> with PAGE_MASK 0x%lx\n", __func__, i, &addr, PAGE_MASK);
>              pr_warn_once("sg_dma_is_swiotlb: %d, dma_flags: %x\n",
> sg_dma_is_swiotlb(sg), sg->dma_flags);
>              pr_warn_once("type = %s\n", (type == PAGELIST_WRITE) ?
> "PAGELIST_WRITE" : "PAGELIST_READ");
>              if (buf)
>                  pr_warn_once("buf = %p, count = %zu\n", buf, count);
>              else
>                  pr_warn_once("ubuf = %p, count = %zu\n", ubuf, count);
>          }
> 
> Output:
> 
> [   66.184030] create_pagelist: block 1, DMA address 0x00000000f5fc7800
> doesn't align with PAGE_MASK 0xfffffffffffff000
> [   66.184056] sg_dma_is_swiotlb: 0, dma_flags: 0
> [   66.184063] type = PAGELIST_READ

...so from the dma_dir assignment, this would imply DMA_FROM_DEVICE, 
(indicating vchiq writing to RAM, CPU reading from RAM) which with the 
unaligned address below would indeed cause a bounce. However that 
appears to contradict what Phil said is supposed to happen :/

Thanks,
Robin

> [   66.184066] ubuf = 00000000266a70a7, count = 0
>>
>>       Arnd
> 
