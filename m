Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BBD51C
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5BAC43392;
	Tue, 17 Jan 2023 18:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673979487;
	bh=HZ8eMhhP99TJ8hMmH6uWrb820zov//VveE7QZ6T1iz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeJtE4sq2lfFRrcqMXt9qwUfWe0d/2Jr2suEqDKJ1mQeSn59HwgP2nweSObXj8x6/
	 NpppGCqmPbiw/pYCiOjqj/pd88wdjT7Nr5l5wV+aJphGZbXkRZfqw/VjaL9/+6Xc1H
	 MPTn3VNdUevaobOWikmqqfcHrxOV/UJtdOxa5EIE=
Date: Tue, 17 Jan 2023 19:18:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuan Can <yuancan@huawei.com>
Cc: horms+renesas@verge.net.au, damm+renesas@opensource.se,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: emxx_udc: Add checks for dma_alloc_coherent()
Message-ID: <Y8bmXLwmq4b0kxE9@kroah.com>
References: <20221125083711.1837-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125083711.1837-1-yuancan@huawei.com>

On Fri, Nov 25, 2022 at 08:37:11AM +0000, Yuan Can wrote:
> As the dma_alloc_coherent() may return NULL, the return value needs to be
> checked to avoid NULL poineter dereference.
> 
> Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/staging/emxx_udc/emxx_udc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
> index b6abd3770e81..3c0c9c5eb733 100644
> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -2594,6 +2594,10 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
>  			ep->virt_buf = dma_alloc_coherent(udc->dev, PAGE_SIZE,
>  							  &ep->phys_buf,
>  							  GFP_ATOMIC | GFP_DMA);
> +		if (!ep->virt_buf) {
> +			spin_unlock_irqrestore(&udc->lock, flags);
> +			return -ENOMEM;
> +		}

This should be checked in the if statment, not outside of it, right?

thanks,

greg k-h
