Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF823FCD
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 05:47:10 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id t1so783318pgv.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 22:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLnwzlkcb2oHzds8ZtsAAy2SdOEECENEJY/PR2nG25M=;
        b=g0AuoJMPAos6RLdoarE9itFgDF4/zTzZEAUqznXcbp9jn9ZGSPsB/r7dAbpm+hAEwM
         vAWQ3SP7uZ70VT37+GJy7XOvCAPFkYB8+Sn+ELSOWFCLYyHe3R7N0kfIjzLxjfWeBoQE
         lVxbTUHnllWVI9uOKUV1ebY1KbmA/I/kFRdyBTsgXU3kaie/6h75sCTW6NxWZE1hrqav
         6W/Nal8DWLk1Kl1oEjpmaXUF8Zy79SpdPHpjnKJgehYNOoqdevwMsPPmaPjsFrKJt/Hh
         ldK67m+MQcpg6EcpJV7kmfdg1Gb3BpsSr7AJXav+9R+7CERMkXXb428TmyZ0wjjFWwOL
         Ersw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLnwzlkcb2oHzds8ZtsAAy2SdOEECENEJY/PR2nG25M=;
        b=AykT1HZu5mPY++yTnhtm98+8/UB1xdKelp+sC9dhi4gBboeX/yREu9YzgbLpJxnAxj
         tYCAWrZudtODbSpTJjDXcuH8sKIFB3K1I7A7h9K+xZvhQq92AERGWfX2baiv6WYTn3dw
         iR/6YVDXv82AHoQO6dDmrKxwNDkW2yX+eILiqVTNEZB+0uONigCE0Ss3dljNMLr633/G
         wVRYmhoCaYM+mT3XQDEdNg5WzUyFUKgCBVOy6SHk0x29hbeb0wde962XMa43e/8uj7j7
         Dt7TyZI1hLokEd3j8sPCxUMvfW7NvrmCbtBuie7SEYC2DtjuCL9WaTntR5gPCMe7t5rw
         z9qQ==
X-Gm-Message-State: AOAM532lsc4OnP4tOmfS1/zsvV6IGbr/CM8o0x+k/opDhY7fgzlCwcMC
	yAYHwtF/wt8Kicx5oslnwdeHxEYCfaLvRaBwa+TZxGwuq8dbIg==
X-Google-Smtp-Source: ABdhPJxifCaDdUfEpBCjhUfhl5/fvX5ilOCG9VNyGBYcDHi/+5GqLItNaR0rmmw6AAxvy5v6gntNNHQfe84JOylUr44=
X-Received: by 2002:a63:fd12:: with SMTP id d18mr1522800pgh.129.1630561630505;
 Wed, 01 Sep 2021 22:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902115215.GA582112@panther> <YTBhcdQ6HNXhGUQV@kroah.com> <CAPGkw+wh34E7gPv-t0G5vLttGYv7XuL9J=UYPW_2j4TeNUdF8w@mail.gmail.com>
In-Reply-To: <CAPGkw+wh34E7gPv-t0G5vLttGYv7XuL9J=UYPW_2j4TeNUdF8w@mail.gmail.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Thu, 2 Sep 2021 07:46:59 +0200
Message-ID: <CAPGkw+yQp1waspqz8_S8g5BK4j5B4=9eDYYRayp-Nb46jwDH6A@mail.gmail.com>
Subject: Re: [PATCH] Use BIT macro instead of (1 << HSDMA_GLO_BT_SHIFT)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 2, 2021 at 7:46 AM Krish Jain <krishjain02939@gmail.com> wrote:
>
> Hi. How do I fix this issue, Greg? Thanks.
>
>
> Best Regards
>
> On Thu, Sep 2, 2021 at 7:30 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Sep 02, 2021 at 01:52:15PM +0200, Krish Jain wrote:
> > > This patch replaces (1 << HSDMA_GLO_BT_SHIFT) with the BIT(x) macro, as suggested by checkpatch.pl, for the file drivers/staging/mt7621-dma/hsdma-mt7621.c .
> > >
> > > Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> > >
> > > ---
> > >  drivers/staging/mt7621-dma/hsdma-mt7621.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > > index 89b72a802800..a99cec876110 100644
> > > --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > > +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > > @@ -72,7 +72,7 @@
> > >  #define HSDMA_GLO_TX_DMA             BIT(0)
> > >
> > >  #define HSDMA_BT_SIZE_16BYTES                (0 << HSDMA_GLO_BT_SHIFT)
> > > -#define HSDMA_BT_SIZE_32BYTES                (1 << HSDMA_GLO_BT_SHIFT)
> > > +#define HSDMA_BT_SIZE_32BYTES                BIT(HSDMA_GLO_BT_SHIFT)
> > >  #define HSDMA_BT_SIZE_64BYTES                (2 << HSDMA_GLO_BT_SHIFT)
> > >  #define HSDMA_BT_SIZE_128BYTES               (3 << HSDMA_GLO_BT_SHIFT)
> > >
> > > @@ -164,8 +164,7 @@ struct mtk_hsdam_engine {
> > >
> > >  static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
> > >  {
> > > -     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
> > > -                     ddev);
> > > +     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine, ddev);
> > >  }
> > >
> > >  static inline struct mtk_hsdma_chan *to_mtk_hsdma_chan(struct dma_chan *c)
> > > --
> > > 2.25.1
> > >
> > >
> >
> > Hi,
> >
> > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> > a patch that has triggered this response.  He used to manually respond
> > to these common problems, but in order to save his sanity (he kept
> > writing the same thing over and over, yet to different people), I was
> > created.  Hopefully you will not take offence and will fix the problem
> > in your patch and resubmit it so that it can be accepted into the Linux
> > kernel tree.
> >
> > You are receiving this message because of the following common error(s)
> > as indicated below:
> >
> > - Your patch did many different things all at once, making it difficult
> >   to review.  All Linux kernel patches need to only do one thing at a
> >   time.  If you need to do multiple things (such as clean up all coding
> >   style issues in a file/driver), do it in a sequence of patches, each
> >   one doing only one thing.  This will make it easier to review the
> >   patches to ensure that they are correct, and to help alleviate any
> >   merge issues that larger patches can cause.
> >
> > - You did not write a descriptive Subject: for the patch, allowing Greg,
> >   and everyone else, to know what this patch is all about.  Please read
> >   the section entitled "The canonical patch format" in the kernel file,
> >   Documentation/SubmittingPatches for what a proper Subject: line should
> >   look like.
> >
> > If you wish to discuss this problem further, or you have questions about
> > how to resolve this issue, please feel free to respond to this email and
> > Greg will reply once he has dug out from the pending patches received
> > from other developers.
> >
> > thanks,
> >
> > greg k-h's patch email bot


Oops, muscle memory, sorry for top posting. "How do I fix this issue,
Greg? Thanks."

Best Regards
