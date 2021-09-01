Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE573FCD
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 21:38:07 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id c6so550768pjv.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 14:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xNQ6P6EFcmcAJMTMCjiKeyU7SlQYs2bJGLIZBFWCZoA=;
        b=VSqQDw9/jL5E/fG3Nzue+/0fPP0/9b4Mi9EqiYWZMOqOzwdWI8cRUrUpIiU5vkjPo8
         yw0MR4gn1pUghdt70UWLzzRrP9TJLGZy9XKwgo1tjrNjmCyLALjHw9Ea/nS2nSmNdSqt
         2lf0vh3Kcvon9AJEc8rSvqGti2sx+ASvx+Ise7tsi0QnLXqqnu41CoJLUixBQNKaB7op
         wNhnNgYzqgEiV5q2ZIZiaNixtmj5iXSxl5Dlj9fgShNZj6XvSPv5JshClhvA3MAHEFRC
         EEDuqX8/I3fUEryUQEIk/oQuZqJA5MjJLeWyzhgAp/lobL/ODVXV1Yc6CjNUxSDY2PQn
         QJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xNQ6P6EFcmcAJMTMCjiKeyU7SlQYs2bJGLIZBFWCZoA=;
        b=Cp3Oyd6BrkOuczCof/3OhUKrTe8zJK0rOv2FDxPI3+Nk0gqH8KTvQM56knXAFeubux
         BFYGW3k38nKKWnegkX6x2sFl7wZZCDsK2vrOjVEIpG8CAVLc5t98oNMOScYoMunTz0WA
         vl7+dHVzGiY5QjCKmg1ILsoj7++rY4V8TVh3k9ANIYXTTyFukJA/qxSTihZdsEw8tDIt
         ZpeUZLhE4wHutYPTnN5f7iYI5dKA1nvsSzHHu2K73/15F4c29v++1EI5OEGS9pbj6GFp
         qMxTDgzdcHiymeyNpPOnXpOzxCWXMdnPyTKKGUkQ2jl+R94Aknb5gYjk8wxtNdbpqB7F
         pnNQ==
X-Gm-Message-State: AOAM533SEQ2eKctAcSrwtpXcXLRZf7xJ511xLsrV+D3Oko1jS+H5tnEX
	J3AvSLm7/TwqgfGLq85nNIUYaRn518H5yQ1e/4M=
X-Google-Smtp-Source: ABdhPJzjco38zvGNlkk1YlsDHz35y4dAxyDpRxEonvCzQfvC3m9HU+gIFzgmuFZ1jcbSTohNEdFJqlZLVKORna9ULVQ=
X-Received: by 2002:a17:902:930b:b029:12c:a7f4:afb2 with SMTP id
 bc11-20020a170902930bb029012ca7f4afb2mr1090487plb.24.1630532286830; Wed, 01
 Sep 2021 14:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902111118.GA576891@panther>
In-Reply-To: <20210902111118.GA576891@panther>
From: Krish Jain <krishjain02939@gmail.com>
Date: Wed, 1 Sep 2021 23:37:55 +0200
Message-ID: <CAPGkw+wO8PE6xf6-V6YZQYFx2xtXV_1i3ri-X+3gCcgObsWEHg@mail.gmail.com>
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 11:36 PM Krish Jain <krishjain02939@gmail.com> wrote:
>
> From: Krish Jain <krishjain02939@gmail.com>
>
> This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.
>
> Signed-off-by: Krish Jain <krishjain02939@gmail.com>
>
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


I am messing up on my mail client. Sorry again. Please ignore this mail
