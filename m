Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804063FC9
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 22:39:19 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id s11so4831661pgr.11
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xmvml1AShCn8Vbbw+i5nSyQiXWYXUYVF7OcOpWlVsg8=;
        b=TRjLFxN+XF9HLfdeVXJy+r8mPkCEWxyHc+iJ1oTBL+pyO78FOkkirScn1774V+48jK
         QBf0+d8+KiOXhtTO/Jyzp1G7fut4wTTr+13NBOdgMlHNkzEsrhJBmuierxHmIyDNzYNA
         SYDMDWY2c9eEyB7AEHjjSD4Mv4bKmzAx4gCfHuhLVXNfBd1WlsGP+1MgJuJnpE0d6jby
         CgomrisDr26N++9vjNVISlnTnTHqyiUuOcfX0Bbji/p05UMgPfzU3sYSl+HANhUQjDk+
         oOUiCDzBEiJ654X2Oawh9Cu5fEpFh3E69jf6lKDzpi4kfjg9IcXNTOFMrujE4x/Oir4n
         zmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xmvml1AShCn8Vbbw+i5nSyQiXWYXUYVF7OcOpWlVsg8=;
        b=TA+tcGwiW0RFROA4gAs35ET03YQ4g1jlx/vPWdujq6bmlXXWT60+80PFzYXCfGjsaV
         83oTOWumQB7O8kKPatKZn06eLZ1V1DOGHIo5MUu7NC7QSFdx9fMFGMlFDxencF0mbeyg
         M/mMEx6Uu5t+MR3xRDWzByzqwOB1dJMHKrenjRO0uyRm2XGLpL10tzf9eQ5HLf41oLxp
         3Y0fMGcd6h8IGYvM+BgoS1fzW1UXuSN9o0fB3nSxqTAyfJDs3WmLdYDUtHTBTNjy79a+
         GXfVwdC4c/qJrV+eyp4uebgXU0XRCvVeslO+7FUk47danUcklnRGIwJ/Y6QZyALq4xb7
         Y3nQ==
X-Gm-Message-State: AOAM532sp3FhU7OJcFQ6LGTjwCiLTZfcwfGwCczavHhEtjnVxU46JNc2
	FhPX9o4VhtD2bLq3ggB+e4dQ+h07l6t1NK4KQEw=
X-Google-Smtp-Source: ABdhPJxfaGoJjLExjWQKCivbiz/+dZ1HoqlcqxeZ+1vvjstwpw7i9PuGOXgq+F+Ye20rUxhpnJv7V8clz6VpUz/tlRA=
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id
 c6-20020a056a000ac6b0290374a33b0a74mr13396883pfl.51.1630881558800; Sun, 05
 Sep 2021 15:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210905090201.GA283023@panther>
In-Reply-To: <20210905090201.GA283023@panther>
From: Krish Jain <krishjain02939@gmail.com>
Date: Mon, 6 Sep 2021 00:39:07 +0200
Message-ID: <CAPGkw+yYqNtUQdVPmWVTd+WYHcfguMWJ+Dat2B=DvAeAaWetug@mail.gmail.com>
Subject: Re: [PATCH v2] mt7621-dma: Properly format lines in "hsdma-mt7621.c"
 ending with an open parenthesis
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 4, 2021 at 10:48 PM Krish Jain <krishjain02939@gmail.com> wrote:
>
> From: Krish Jain <krishjain02939@gmail.com>
>
> This patch fixes the format of the code. It properly formats lines that
> should not end with a '(' as suggested by checkpath.pl.
>
> Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> ---
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> index b0ed935de7ac..89b72a802800 100644
> --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> @@ -162,8 +162,7 @@ struct mtk_hsdam_engine {
>         struct mtk_hsdma_chan chan[1];
>  };
>
> -static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(
> -               struct mtk_hsdma_chan *chan)
> +static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
>  {
>         return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
>                         ddev);
> @@ -174,8 +173,7 @@ static inline struct mtk_hsdma_chan *to_mtk_hsdma_chan(struct dma_chan *c)
>         return container_of(c, struct mtk_hsdma_chan, vchan.chan);
>  }
>
> -static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(
> -               struct virt_dma_desc *vdesc)
> +static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(struct virt_dma_desc *vdesc)
>  {
>         return container_of(vdesc, struct mtk_hsdma_desc, vdesc);
>  }
> @@ -457,9 +455,7 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>         spin_unlock_bh(&chan->vchan.lock);
>  }
>
> -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> -               struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> -               size_t len, unsigned long flags)
> +static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src, size_t len, unsigned long flags)
>  {
>         struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
>         struct mtk_hsdma_desc *desc;
> --
> 2.25.1
>

Hi, Greg, just to follow up on this, is this submission OK?


Best Regards,

Krish
