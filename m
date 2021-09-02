Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E5D3FCD
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 05:57:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E87A160FC4;
	Thu,  2 Sep 2021 05:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630562253;
	bh=xiKmxZc2PzBguIPbButKw0C4X7GK6gO4zHqKeTZV+TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7kyob4m1Ps6VzVaS3Rm+IhGSvHZ59iPAxnZhq9ltTHnoiIYZ3memo16a5rI9jHmr
	 wmSbaqSc4vILlPqdm7+bguuye//8WRMjeChsYfu7p5vf10LX9FITK+z0lVi55vqUPY
	 CF71QqTm9ktqD3rX4DsNJhy88NyFwOSB290IwzrY=
Date: Thu, 2 Sep 2021 07:57:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Use BIT macro instead of (1 << HSDMA_GLO_BT_SHIFT)
Message-ID: <YTBnyK4li0fq/Uci@kroah.com>
References: <20210902115215.GA582112@panther>
 <YTBhcdQ6HNXhGUQV@kroah.com>
 <CAPGkw+wh34E7gPv-t0G5vLttGYv7XuL9J=UYPW_2j4TeNUdF8w@mail.gmail.com>
 <CAPGkw+yQp1waspqz8_S8g5BK4j5B4=9eDYYRayp-Nb46jwDH6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGkw+yQp1waspqz8_S8g5BK4j5B4=9eDYYRayp-Nb46jwDH6A@mail.gmail.com>

On Thu, Sep 02, 2021 at 07:46:59AM +0200, Krish Jain wrote:
> On Thu, Sep 2, 2021 at 7:46 AM Krish Jain <krishjain02939@gmail.com> wrote:
> >
> > Hi. How do I fix this issue, Greg? Thanks.
> >
> >
> > Best Regards
> >
> > On Thu, Sep 2, 2021 at 7:30 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 01:52:15PM +0200, Krish Jain wrote:
> > > > This patch replaces (1 << HSDMA_GLO_BT_SHIFT) with the BIT(x) macro, as suggested by checkpatch.pl, for the file drivers/staging/mt7621-dma/hsdma-mt7621.c .
> > > >
> > > > Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> > > >
> > > > ---
> > > >  drivers/staging/mt7621-dma/hsdma-mt7621.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > > > index 89b72a802800..a99cec876110 100644
> > > > --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > > > +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > > > @@ -72,7 +72,7 @@
> > > >  #define HSDMA_GLO_TX_DMA             BIT(0)
> > > >
> > > >  #define HSDMA_BT_SIZE_16BYTES                (0 << HSDMA_GLO_BT_SHIFT)
> > > > -#define HSDMA_BT_SIZE_32BYTES                (1 << HSDMA_GLO_BT_SHIFT)
> > > > +#define HSDMA_BT_SIZE_32BYTES                BIT(HSDMA_GLO_BT_SHIFT)
> > > >  #define HSDMA_BT_SIZE_64BYTES                (2 << HSDMA_GLO_BT_SHIFT)
> > > >  #define HSDMA_BT_SIZE_128BYTES               (3 << HSDMA_GLO_BT_SHIFT)
> > > >
> > > > @@ -164,8 +164,7 @@ struct mtk_hsdam_engine {
> > > >
> > > >  static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
> > > >  {
> > > > -     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
> > > > -                     ddev);
> > > > +     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine, ddev);
> > > >  }
> > > >
> > > >  static inline struct mtk_hsdma_chan *to_mtk_hsdma_chan(struct dma_chan *c)
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > >
> > > Hi,
> > >
> > > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> > > a patch that has triggered this response.  He used to manually respond
> > > to these common problems, but in order to save his sanity (he kept
> > > writing the same thing over and over, yet to different people), I was
> > > created.  Hopefully you will not take offence and will fix the problem
> > > in your patch and resubmit it so that it can be accepted into the Linux
> > > kernel tree.
> > >
> > > You are receiving this message because of the following common error(s)
> > > as indicated below:
> > >
> > > - Your patch did many different things all at once, making it difficult
> > >   to review.  All Linux kernel patches need to only do one thing at a
> > >   time.  If you need to do multiple things (such as clean up all coding
> > >   style issues in a file/driver), do it in a sequence of patches, each
> > >   one doing only one thing.  This will make it easier to review the
> > >   patches to ensure that they are correct, and to help alleviate any
> > >   merge issues that larger patches can cause.
> > >
> > > - You did not write a descriptive Subject: for the patch, allowing Greg,
> > >   and everyone else, to know what this patch is all about.  Please read
> > >   the section entitled "The canonical patch format" in the kernel file,
> > >   Documentation/SubmittingPatches for what a proper Subject: line should
> > >   look like.
> > >
> > > If you wish to discuss this problem further, or you have questions about
> > > how to resolve this issue, please feel free to respond to this email and
> > > Greg will reply once he has dug out from the pending patches received
> > > from other developers.
> > >
> > > thanks,
> > >
> > > greg k-h's patch email bot
> 
> 
> Oops, muscle memory, sorry for top posting. "How do I fix this issue,
> Greg? Thanks."

Did you read the above text from the bot?  What specific suggestions
there did you try and not agree with?

thanks,

greg k-h
