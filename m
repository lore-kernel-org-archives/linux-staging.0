Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49E15A3
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 02:10:41 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ny5dr5CsZz16MhD;
	Thu, 19 Jan 2023 10:08:48 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 19 Jan 2023 10:10:33 +0800
Message-ID: <96b806c5-ceed-7738-3d4e-241214183a2d@huawei.com>
Date: Thu, 19 Jan 2023 10:10:32 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] staging: emxx_udc: Add checks for dma_alloc_coherent()
To: Greg KH <gregkh@linuxfoundation.org>
CC: <horms+renesas@verge.net.au>, <damm+renesas@opensource.se>,
	<linux-staging@lists.linux.dev>
References: <20221125083711.1837-1-yuancan@huawei.com>
 <Y8bmXLwmq4b0kxE9@kroah.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <Y8bmXLwmq4b0kxE9@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected


在 2023/1/18 2:18, Greg KH 写道:
> On Fri, Nov 25, 2022 at 08:37:11AM +0000, Yuan Can wrote:
>> As the dma_alloc_coherent() may return NULL, the return value needs to be
>> checked to avoid NULL poineter dereference.
>>
>> Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
>> ---
>>   drivers/staging/emxx_udc/emxx_udc.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
>> index b6abd3770e81..3c0c9c5eb733 100644
>> --- a/drivers/staging/emxx_udc/emxx_udc.c
>> +++ b/drivers/staging/emxx_udc/emxx_udc.c
>> @@ -2594,6 +2594,10 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
>>   			ep->virt_buf = dma_alloc_coherent(udc->dev, PAGE_SIZE,
>>   							  &ep->phys_buf,
>>   							  GFP_ATOMIC | GFP_DMA);
>> +		if (!ep->virt_buf) {
>> +			spin_unlock_irqrestore(&udc->lock, flags);
>> +			return -ENOMEM;
>> +		}
> This should be checked in the if statment, not outside of it, right?
Yes, the next version will do the check just before the memcpy, thanks 
for the suggestion.

-- 
Best regards,
Yuan Can

