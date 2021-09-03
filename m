Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4D3FC1
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 15:52:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id s11so5914147pgr.11
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFKD/yrxgF4ZtEOd8B9HwTSlcSmRgfjnm+LXFcO8acs=;
        b=c/GHeJEjmJ3MKz3l3zv5+5EZf9NZWUYdcyQnXAivvf3yFZQnQK2ytu0RTcH4W/hXOy
         KazJjDrNWoRXdVKeL+Nk9qKeps7WCn+fkJyFTXmFcZT2taqZ1YzaXLYnmvWC3CO3kGo3
         LOxVnA/LvulXrHbj3hiYeAf5J5Q7aA0oYa98u0TDlWS4FF+RWlw2yhtjdVwUPd7VOyuI
         sd7sF/94+Rpqgmi/18gwEx/bIf6vPkAfSgATqHf8gw20V15NJFNbP/W0YFIL8wKorzMh
         FTEya60JrbpOJRShoH01O14Yv7IYsV2lBLP8sCiVPag5CiiW9E9CCbNFL5YYbd9lOKSn
         DQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFKD/yrxgF4ZtEOd8B9HwTSlcSmRgfjnm+LXFcO8acs=;
        b=aB3a/AEx9DS7tqyJtel6lQgng+rskpjIHIsToITaRVq+qfA+/ZUkBgorNTmpjZsxwv
         lvZPAmZScdnSaIROquReplZKvCuvjs8dwfah745oRhV9z5KJjkX/z4Q0l6qyIjnhoXwJ
         h9Uxe/xlMXuPzfruqj7WXDgh3br/Db65U7N2zecXz9ArbAH+Td6OAWWP3YGsGZyK04G2
         OzVvlToQ/cqTPCq7MzIdZQjTBHwshdQmTzAqycWbKEWoo2FTwoL/hBdla7yC7Ct6HaQ8
         lq3hAZmxP86xoZdhrv7+CdI1Y2uWk1yKeGVa47Gvs23VLbAwjZwviJ3cZitB20snUj+1
         cjIA==
X-Gm-Message-State: AOAM5304kdaYVncnMzE4ymNNafkVL4CyFhZDuW8v+9PnSbaRHLX8zrx7
	oPtPRAZWA3PU1H1vH5w7xVRKxh4mZ0WKEIWjy5/vw6QT0EY=
X-Google-Smtp-Source: ABdhPJx413bAvq3+1xQuNhPn9Jdd4jDL8Y9o/EkBBImdR5SR3hvSiPV8lQYSSAMVFRsGfu8CjuweI+b1gEJITDBbGno=
X-Received: by 2002:a65:6554:: with SMTP id a20mr4124534pgw.107.1630684377232;
 Fri, 03 Sep 2021 08:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902115215.GA582112@panther> <20210903070518.GF2151@kadam>
In-Reply-To: <20210903070518.GF2151@kadam>
From: Krish Jain <krishjain02939@gmail.com>
Date: Fri, 3 Sep 2021 17:52:45 +0200
Message-ID: <CAPGkw+xEVOvD-OYq=LwMTgJw_fbUKoOMfaL9aErhhXh1Jgt6mA@mail.gmail.com>
Subject: Re: [PATCH] Use BIT macro instead of (1 << HSDMA_GLO_BT_SHIFT)
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 10:10 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The subject is wrong.  It doesn't have the subsystem prefix.
>
> On Thu, Sep 02, 2021 at 01:52:15PM +0200, Krish Jain wrote:
> > This patch replaces (1 << HSDMA_GLO_BT_SHIFT) with the BIT(x) macro, as suggested by checkpatch.pl, for the file drivers/staging/mt7621-dma/hsdma-mt7621.c .'
>
> Run checkpatch on your patches.

Noted.

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
>
> No.  This block doesn't make sense now because one line is weird.
> Just leave it.  Checkpatch is wrong here because it only analyzes one
> line at a time.


How can I fix this then?


> >
> > @@ -164,8 +164,7 @@ struct mtk_hsdam_engine {
> >
> >  static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
> >  {
> > -     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
> > -                     ddev);
> > +     return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine, ddev);
>
> This is fine but it needs to be in a separate commit.
>
> >  }


Ok, this is already being worked on as a separate commit.


> regards,
> dan carpenter
>

Thanks.

Best Regards,

Krish
