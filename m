Received: from smtprelay.hostedemail.com (smtprelay0008.hostedemail.com [216.40.44.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC62C82
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 18:56:15 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 92E471809CC38
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 08:19:38 +0000 (UTC)
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id 8A8DA837F24D;
	Sat, 13 Nov 2021 08:19:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 7C4B780193D0;
	Sat, 13 Nov 2021 08:19:30 +0000 (UTC)
Message-ID: <f4ac00433f64d0637f5bbcf19b631072bddad097.camel@perches.com>
Subject: Re: [PATCH] Staging: mt7621-dma: reindent to avoid '(' at the end
 of line
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 13 Nov 2021 00:19:29 -0800
In-Reply-To: <YY9xD1K0cUpc5iCW@kroah.com>
References: <20211113052815.358793-1-liujunqi@pku.edu.cn>
	 <YY9xD1K0cUpc5iCW@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Stat-Signature: k4wax484oj33isr6s7ng4qkrgrpfxddc
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 7C4B780193D0
X-Spam-Status: No, score=-4.78
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/bjIbunX20jf5R9k4knLoAmPpVgNYPdLo=
X-HE-Tag: 1636791570-751348

On Sat, 2021-11-13 at 09:02 +0100, Greg KH wrote:
> On Sat, Nov 13, 2021 at 01:28:15PM +0800, Liu Junqi wrote:
> > Fixed a coding style issue.

This isn't really a fix, but instead is a change to make
the code more like typical coding style.

> > diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
[]
> > @@ -455,9 +455,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
> >  	spin_unlock_bh(&chan->vchan.lock);
> >  }
> >  
> > -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> > -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> > -		size_t len, unsigned long flags)
> > +static struct dma_async_tx_descriptor
> > +*mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> 
> No, this is now worse looking.  The original was not pretty, but better
> than this.

More typical would be to have the return value on a separate line
as using * on the start of a line is poor form in the kernel.

static struct dma_async_tx_descriptor *
mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
			  size_t len, unsigned long flags)
{
	...
}

