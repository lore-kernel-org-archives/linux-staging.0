Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06017CD
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 13:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80D8C433EF;
	Thu, 19 Jan 2023 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674134617;
	bh=igYu+qhIyrXNFbAbFgs4vKIuU5rceRVSV5PaFBZybAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xIYdObz9Ho39iM8xumlyLuUGHyQVDUv9pSjNbob6XL09kO0XIFZkRLqffR0oEowS2
	 W8QsDfzu0AVIs3POj8qo3fqWtjeE/fPA9ZjgmCI7cTH72pBKM4YcPYqmc2xEk1klpb
	 mZEit0NmXDesctCNy0tm8ruGg4kY5kAr9Pic5PLg=
Date: Thu, 19 Jan 2023 14:23:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuan Can <yuancan@huawei.com>
Cc: drv@mailo.com, damm+renesas@opensource.se, horms+renesas@verge.net.au,
	error27@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: emxx_udc: Add checks for dma_alloc_coherent()
Message-ID: <Y8lEVpJmSh5OgfIz@kroah.com>
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

On Thu, Jan 19, 2023 at 08:31:19AM +0000, Yuan Can wrote:
> As the dma_alloc_coherent may return NULL, the return value needs to be
> checked to avoid NULL poineter dereference.
> 
> Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")

This really is not a "fix" as you will never hit this in real life.
I'll drop that tag.

> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> changes in v2:
> - do the null pointer check right before the memcpy().
> changes in v3:
> - do the null pointer check right after the dma_alloc_coherent().
> 
>  drivers/staging/emxx_udc/emxx_udc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
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

Wait, why is this asking for GFP_DMA memory?  That's probably a
different bug...

thanks,

greg k-h
