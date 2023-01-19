Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779972C9C
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 08:25:55 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NyFvG0XR5zqVf5;
	Thu, 19 Jan 2023 16:20:58 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 19 Jan 2023 16:25:52 +0800
Message-ID: <9f98f4f2-a8a2-702e-5d76-373ba5d87d7d@huawei.com>
Date: Thu, 19 Jan 2023 16:25:52 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] staging: emxx_udc: Add checks for dma_alloc_coherent()
To: Dan Carpenter <error27@gmail.com>
CC: <gregkh@linuxfoundation.org>, <drv@mailo.com>,
	<damm+renesas@opensource.se>, <horms+renesas@verge.net.au>,
	<linux-staging@lists.linux.dev>
References: <20230119023430.95919-1-yuancan@huawei.com>
 <Y8jSWCCZjGR9reA8@kadam>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <Y8jSWCCZjGR9reA8@kadam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected


在 2023/1/19 13:17, Dan Carpenter 写道:
> On Thu, Jan 19, 2023 at 02:34:30AM +0000, Yuan Can wrote:
>> As the dma_alloc_coherent may return NULL, the return value needs to be
>> checked to avoid NULL poineter dereference.
>>
>> Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
>> ---
>> changes in v2:
>> - do the null pointer check right before the memcpy().
>>
> No. No.  This should be:
>
> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
> index b4e19174bef2..f9765841c4aa 100644
> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -2587,10 +2587,15 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
>   		req->unaligned = false;
>   
>   	if (req->unaligned) {
> -		if (!ep->virt_buf)
> +		if (!ep->virt_buf) {
>   			ep->virt_buf = dma_alloc_coherent(udc->dev, PAGE_SIZE,
>   							  &ep->phys_buf,
>   							  GFP_ATOMIC | GFP_DMA);
> +			if (!ep->virt_buf) {
> +				spin_unlock_irqrestore(&udc->lock, flags);
> +				return -ENOMEM;
> +			}
> +		}
>   		if (ep->epnum > 0)  {
>   			if (ep->direct == USB_DIR_IN)
>   				memcpy(ep->virt_buf, req->req.buf,
Ok, thanks for this!

-- 
Best regards,
Yuan Can

