Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29D3FCD
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 05:46:12 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n4so481642plh.9
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 22:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PWomIj/3xZup69GCBAmD3TFC+Jg4fhrv1YuWaP6ySWM=;
        b=VJInqXvxR8UvNXaSTD/arIJz/F+0gO4y42feHeNUWI02QiWnKH4odzaRfQxOzAyZTB
         W4haq/nWTOOtmug9SxYR029A5Xt6joB/1tBnwlS8nqNFupV8Uum+tv1uZHPw2ZLxRJ5P
         02r+Ktozb0sueYCb+jEy4Zk4Q5JqR/jIkDaZUoQ8XGUJdLYrdE7J6hiJCw9+dK44qeQH
         aFDD9C5wtOc8VAtKVi3MICru33ezPcoeLoQ2rpNbW0aGK97xyKIAthGljNvfKYLwbFbo
         02wPYG98VenG9s96dZIwtt3VA1kTlr8vAVULyKVkgsIZbO2Nv46TGuFsZ7vJqIBygTiE
         mzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PWomIj/3xZup69GCBAmD3TFC+Jg4fhrv1YuWaP6ySWM=;
        b=etrt4SvRj8EotRYRn86PmYgaHJdfaUl/LAWAGM3AG4Wpm3l2xHCl/31i27KupObPXt
         YreDnKxYX4AujcAcNZ0/jkjT5zUG/f6ZqCViBfuhGQb2FCYul9IDEpGRHgcd+S2GBk/h
         Zwm193R8WPADXbVEubLQIkrTMuDGhL3DSbuy4nCM0ed7SM+GI2pOMxHRQIdvqK2CnQYF
         gdXfnEpc9RPkq/Gh5F+kEFGiyyO3H7KvyWEH7NtFnIlecLrgzX4Sp31GGmsD/Eit1j00
         7DRrCwUrj8R3+SoJldC1djNIYJNLvJ81vvxPKn+eE8wcVFrSSAWMrIXoKlaUKHn745md
         gObQ==
X-Gm-Message-State: AOAM532kyvRq4Uj+gRzmCvX4OV837xreTgxy5wpmd3qfLYeyLMfaq7a5
	Eir+e5R1xAiE/zv7ffROm9yfA2SnPJ7xFU6SU8LGVwpoZWY=
X-Google-Smtp-Source: ABdhPJz49OUl+Lz1V7PL1SEYh4olmHCiq6W0mw33ynBOFtUhvqqxxyuH8DLi48GU2MQreJM8WDjZKcwKrVQi15R67Uc=
X-Received: by 2002:a17:90a:520c:: with SMTP id v12mr1903904pjh.105.1630561571746;
 Wed, 01 Sep 2021 22:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902115215.GA582112@panther> <YTBhcdQ6HNXhGUQV@kroah.com>
In-Reply-To: <YTBhcdQ6HNXhGUQV@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Thu, 2 Sep 2021 07:46:00 +0200
Message-ID: <CAPGkw+wh34E7gPv-t0G5vLttGYv7XuL9J=UYPW_2j4TeNUdF8w@mail.gmail.com>
Subject: Re: [PATCH] Use BIT macro instead of (1 << HSDMA_GLO_BT_SHIFT)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi. How do I fix this issue, Greg? Thanks.


Best Regards

On Thu, Sep 2, 2021 at 7:30 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 02, 2021 at 01:52:15PM +0200, Krish Jain wrote:
> > This patch replaces (1 << HSDMA_GLO_BT_SHIFT) with the BIT(x) macro, as suggested by checkpatch.pl, for the file drivers/staging/mt7621-dma/hsdma-mt7621.c .
> >
> > Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> >
> > ---
> >  drivers/staging/mt7621-dma/hsdma-mt7621.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > index 89b72a802800..a99cec876110 100644
> > --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> > @@ -72,7 +72,7 @@
> >  #define HSDMA_GLO_TX_DMA             BIT(0)
> >
> >  #define HSDMA_BT_SIZE_16BYTES                (0 << HSDMA_GLO_BT_SHIFT)
> > -#define HSDMA_BT_SIZE_32BYTES                (1 << HSDMA_GLO_BT_SHIFT)
> > +#define HSDMA_BT_SIZE_32BYTES                BIT(HSDMA_GLO_BT_SHIFT)
> >  #define HSDMA_BT_SIZE_64BYTES                (2 << HSDMA_GLO_BT_SHIFT)
> >  #define HSDMA_BT_SIZE_128BYTES               (3 << HSDMA_GLO_BT_SHIFT)
> >
> > @@ -164,8 +164,7 @@ struct mtk_hsdam_engine {
> >
> >  static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
> >  {
> > -     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
> > -                     ddev);
> > +     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine, ddev);
> >  }
> >
> >  static inline struct mtk_hsdma_chan *to_mtk_hsdma_chan(struct dma_chan *c)
> > --
> > 2.25.1
> >
> >
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - Your patch did many different things all at once, making it difficult
>   to review.  All Linux kernel patches need to only do one thing at a
>   time.  If you need to do multiple things (such as clean up all coding
>   style issues in a file/driver), do it in a sequence of patches, each
>   one doing only one thing.  This will make it easier to review the
>   patches to ensure that they are correct, and to help alleviate any
>   merge issues that larger patches can cause.
>
> - You did not write a descriptive Subject: for the patch, allowing Greg,
>   and everyone else, to know what this patch is all about.  Please read
>   the section entitled "The canonical patch format" in the kernel file,
>   Documentation/SubmittingPatches for what a proper Subject: line should
>   look like.
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot
