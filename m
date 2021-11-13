Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C303B68
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 08:02:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA37B60EB4;
	Sat, 13 Nov 2021 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636790548;
	bh=QCklIn07a4Q9kSJmzDKlN3UHyVzwJygAHFISjCNIgy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0QMq1/NXq1hjwEBts4ABOzyJ6At+fTHmRdTpVjpF7P2vWEOaCWe3wWFTUO30Ja3ex
	 gQZGnnnkDGSI1U/AledGlSktAh8VitaquWaOTrQvCTO6owkIeQkn8pDXoJUKtTc0+O
	 mMKfkspT8o/M+zFcw00H/XnZ9JH7HVLSrYzhRUfk=
Date: Sat, 13 Nov 2021 09:02:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: mt7621-dma: reindent to avoid '(' at the end of
 line
Message-ID: <YY9xD1K0cUpc5iCW@kroah.com>
References: <20211113052815.358793-1-liujunqi@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113052815.358793-1-liujunqi@pku.edu.cn>

On Sat, Nov 13, 2021 at 01:28:15PM +0800, Liu Junqi wrote:
> Fixed a coding style issue.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> index 1424d01d434b..282fc807d0de 100644
> --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> @@ -455,9 +455,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>  	spin_unlock_bh(&chan->vchan.lock);
>  }
>  
> -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> -		size_t len, unsigned long flags)
> +static struct dma_async_tx_descriptor
> +*mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,

No, this is now worse looking.  The original was not pretty, but better
than this.

thanks,

greg k-h
