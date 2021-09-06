Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9CD3FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 09:38:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00C6460E76;
	Mon,  6 Sep 2021 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630921084;
	bh=EwIJ+KTQedZv2Gfbne1BBWJlowtz3e3gQhzNHTR0smM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3F8Xywjs5FYvkaym4yPPdKE2u2yKokNuAtQTM7FGqd2UttjrTNDkTMjEPwudQHnA
	 uhkWCLJkTp6Q+EeqQVOYcbufW7K6SIgf5v0TitbsLmp//0gyEnidgdwoKj2SN0zqUD
	 +k/KTScdfBzRhkLEb+PxSRa7pKjmvYh7VjuQUBg4=
Date: Mon, 6 Sep 2021 11:38:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] mt7621-dma: Properly format lines in "hsdma-mt7621.c"
 ending with an open parenthesis
Message-ID: <YTXhen5jNRFc3FS0@kroah.com>
References: <20210905090201.GA283023@panther>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210905090201.GA283023@panther>

On Sun, Sep 05, 2021 at 11:02:01AM +0200, Krish Jain wrote:
> From: Krish Jain <krishjain02939@gmail.com>
> 
> This patch fixes the format of the code. It properly formats lines that
> should not end with a '(' as suggested by checkpath.pl.
> 
> Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> ---
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Any reason why you didn't match up other patches for this driver for the
subject line?

$ git log --oneline drivers/staging/mt7621-dma/ | head
1f92798cbe7f staging/mt7621-dma: mtk-hsdma.c->hsdma-mt7621.c
d887d6104ade staging: mt7621-dma: Fix a resource leak in an error handling path
773cfe0684a3 staging: mt7621-dma: fix alignment warnings
08446a45d194 staging: mt7621-dma: convert tasklets to use new tasklet_setup() API
5d6633b26bc3 staging: mt7621-dma: quoted string split across lines
e71903106721 staging: mt7621-dma: align to match open parenthesis
62a6e25ed677 staging: mt7621-dma: Remove unnecessary line continuations
390e4f967299 staging: mt7621-dma: use devm_platform_ioremap_resource() to simplify code
04d15d5cadb8 staging: Remove dev_err() usage after platform_get_irq()
4c1d2fc7d56c staging: mt7621-dma: sizeof via pointer dereference

Please always put 'staging' as the prefix here, so that our tools catch
things easily.

> 
> diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> index b0ed935de7ac..89b72a802800 100644
> --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> @@ -162,8 +162,7 @@ struct mtk_hsdam_engine {
>  	struct mtk_hsdma_chan chan[1];
>  };
>  
> -static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(
> -		struct mtk_hsdma_chan *chan)
> +static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
>  {
>  	return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
>  			ddev);
> @@ -174,8 +173,7 @@ static inline struct mtk_hsdma_chan *to_mtk_hsdma_chan(struct dma_chan *c)
>  	return container_of(c, struct mtk_hsdma_chan, vchan.chan);
>  }
>  
> -static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(
> -		struct virt_dma_desc *vdesc)
> +static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(struct virt_dma_desc *vdesc)
>  {
>  	return container_of(vdesc, struct mtk_hsdma_desc, vdesc);
>  }
> @@ -457,9 +455,7 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>  	spin_unlock_bh(&chan->vchan.lock);
>  }
>  
> -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> -		size_t len, unsigned long flags)
> +static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src, size_t len, unsigned long flags)
>  {
>  	struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
>  	struct mtk_hsdma_desc *desc;
> -- 
> 2.25.1
> 

What happens when you run this patch through checkpatch.pl?  Didn't you
just add new warnings with your attempt to fix them?

thanks,

greg k-h
