Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6A2C81
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 13:36:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3DBE61051;
	Sat, 13 Nov 2021 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636810612;
	bh=fp6UseD2UeNDrdF0AZQ9E0WNms+itCAHyBOMUPTn4FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBCtDT2M2sXX9130lKj2Ls0vno8Q2iCDjF/EErvEKGcdLEbn9KMHYSPUpWU09DGuk
	 AujUccIyaHKbdgqh4R3Q64An23gJyJHpbKdR/7KyOisltux/PNITj3EiVb31Vb4gU8
	 7cEDyEzDzWepb1dVy8d0Qj3F5tKec/xcehMMxPoI=
Date: Sat, 13 Nov 2021 14:36:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: mt7621-dma: reindent to avoid '(' at the end
 of line
Message-ID: <YY+/cflE5fowvTg+@kroah.com>
References: <20211113132033.363916-1-liujunqi@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113132033.363916-1-liujunqi@pku.edu.cn>

On Sat, Nov 13, 2021 at 09:20:34PM +0800, Liu Junqi wrote:
> A change to make the code more like typical coding style.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> index 1424d01d434b..f303579bd1a2 100644
> --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> @@ -455,9 +455,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>  	spin_unlock_bh(&chan->vchan.lock);
>  }
>  
> -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> -		size_t len, unsigned long flags)
> +static struct dma_async_tx_descriptor *
> +mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> +			  size_t len, unsigned long flags)
>  {
>  	struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
>  	struct mtk_hsdma_desc *desc;
> -- 
> 2.32.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
