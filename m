Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B53232
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 10:49:42 +0000 (UTC)
Received: from momiji.horms.nl (86-93-216-223.fixed.kpn.net [86.93.216.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by zeeaster.vergenet.net (Postfix) with ESMTPSA id 1A182200A3;
	Thu, 19 Jan 2023 10:49:41 +0000 (UTC)
Received: by momiji.horms.nl (Postfix, from userid 7100)
	id A69CC94047A; Thu, 19 Jan 2023 11:49:40 +0100 (CET)
Date: Thu, 19 Jan 2023 11:49:40 +0100
From: Simon Horman <horms@verge.net.au>
To: Yuan Can <yuancan@huawei.com>
Cc: gregkh@linuxfoundation.org, drv@mailo.com, damm+renesas@opensource.se,
	error27@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: emxx_udc: Add checks for dma_alloc_coherent()
Message-ID: <Y8kgRGvYdx+BlKij@vergenet.net>
References: <20230119083119.16956-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119083119.16956-1-yuancan@huawei.com>
Organisation: Horms Solutions BV
X-Virus-Scanned: clamav-milter 0.103.7 at zeeaster
X-Virus-Status: Clean

On Thu, Jan 19, 2023 at 08:31:19AM +0000, Yuan Can wrote:
> As the dma_alloc_coherent may return NULL, the return value needs to be
> checked to avoid NULL poineter dereference.
> 
> Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> changes in v2:
> - do the null pointer check right before the memcpy().
> changes in v3:
> - do the null pointer check right after the dma_alloc_coherent().
> 
>  drivers/staging/emxx_udc/emxx_udc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I am no longer associated with Renesas, as I was when the patch
that added this problem was accepted.

But, FWIIW,

Reviewed-by: Simon Horman <horms@verge.net.au>

> 
> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
> index b4e19174bef2..f9765841c4aa 100644
> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -2587,10 +2587,15 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
>  		req->unaligned = false;
>  
>  	if (req->unaligned) {
> -		if (!ep->virt_buf)
> +		if (!ep->virt_buf) {
>  			ep->virt_buf = dma_alloc_coherent(udc->dev, PAGE_SIZE,
>  							  &ep->phys_buf,
>  							  GFP_ATOMIC | GFP_DMA);
> +			if (!ep->virt_buf) {
> +				spin_unlock_irqrestore(&udc->lock, flags);
> +				return -ENOMEM;
> +			}
> +		}
>  		if (ep->epnum > 0)  {
>  			if (ep->direct == USB_DIR_IN)
>  				memcpy(ep->virt_buf, req->req.buf,
> -- 
> 2.17.1
> 
