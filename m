Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED337E
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 17:47:37 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id x22-20020a4aca96000000b00338fbaf797bso2921735ooq.10
        for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m21FEJxNvF+ScKNVrQB2zjxzVrh9tftainj7QUwtfio=;
        b=bKSmgB4uNcLImMcLm04M81HS6AbvME1OHxdry0sHNt+CPp7FhCj+aZMsKORP3RqiM6
         ciGUKuuqTUU1NcZhKRglQt9V5L0fd2piqGMhfnAVnl7eG86JUNrbt6Hn/Rni3i9nWuc4
         oVBI9ignz5nDa4wqhYH2zQfXyBKsBqLLWlo4JvbL13pezeqGgufxksdnf6tAcR92EmLT
         eVMhItywFnc3Y3AR2qH44CvO0UsE8QYu25ybvd8ScZ+mhIaOWbl0qlzOtZDyITYJ2S6+
         CN9YPyvClh+zevOpK5SzqoW3pfDpzLf5heRc1BVndaDx2omKtZvjxrfNhcR4M0iZGN6v
         4qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m21FEJxNvF+ScKNVrQB2zjxzVrh9tftainj7QUwtfio=;
        b=FTESMm792BhXI8/16tpI5Z4cCKwd/0L1TIYQPw9sUX5FOfLUFzhv+zNKCnG0kluIb+
         LkAf1sp/3m7ss+s/xjYo4FHYbndZk0zg9Nt7o393xhkFxT81cuGhrqvND9EznodFoiFb
         E2qj0Moo54wKnSjElhfmPXRxzMjFJ71QMsdNXoRBWOvN4OYHWXvVplE8JarGP7AcbD4g
         kVJQ1E5UK3CWSaQKJRdGbMnhHCYeX3WuO1Tw9D9kwMAh+RCnadUDxDglM+2iyetnDkUp
         wNOtlY3iMPLSDxXb7MD14p+8UP5MHG4G1/4MAAoerKof6wNJ/HzZbny42Uk5i1oZ7oP9
         SiqA==
X-Gm-Message-State: AOAM5304jwJSVNtC35733eJAZQ88DOWygGkA4d9fP1Somomi0Xes/SPO
	V6NbNGlKL+HGQLH/HBv/dDmdwAVTpxxz/eWdtrU=
X-Google-Smtp-Source: ABdhPJxX43gYEJBSlIIAHRVesXis2DaOfUdo3u4PZEMOqQKg4mXGDJALqDKFDYk6BPQ6mFrw9Zmagh3Fjh4pkMvq8M4=
X-Received: by 2002:a4a:a2cd:0:b0:33a:49a9:6d46 with SMTP id
 r13-20020a4aa2cd000000b0033a49a96d46mr6818911ool.46.1650908856172; Mon, 25
 Apr 2022 10:47:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220424163132.37007-1-makvihas@gmail.com> <20220424163132.37007-3-makvihas@gmail.com>
 <85f946c9-235e-cc69-4d19-1ebf972cd935@gmail.com>
In-Reply-To: <85f946c9-235e-cc69-4d19-1ebf972cd935@gmail.com>
From: Vihas Makwana <makvihas@gmail.com>
Date: Mon, 25 Apr 2022 23:17:25 +0530
Message-ID: <CAH1kMwQ+vAcqcbsimB2Rr8gyhLtjPEQYi11uVi48Rm5PQRmpoA@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: r8188eu: fix null check in _rtw_enqueue_recvframe
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 25, 2022 at 12:23 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi Vihas,
>
> On 4/24/22 19:31, Vihas Makwana wrote:
> > There's a NULL check on padapter in rtw_recv.c:189 which makes no sense as
> > rtw_recv.c:184 dereferences it unconditionally and it would have already
> > crashed at this point.
> > Fix this by moving the dereference line inside the check.
> >
> > Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> > ---
> >   drivers/staging/r8188eu/core/rtw_recv.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> > index 4cf9b4b8f..7d306a3c6 100644
> > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > @@ -181,12 +181,13 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
> >   int _rtw_enqueue_recvframe(struct recv_frame *precvframe, struct __queue *queue)
> >   {
> >       struct adapter *padapter = precvframe->adapter;
> > -     struct recv_priv *precvpriv = &padapter->recvpriv;
> > +     struct recv_priv *precvpriv;
>
> Actually, `&padapter->recvpriv` is not a de-reference, it's just address
> calculation, so in case of padapder being NULL precvpriv will contain
> offsetof(struct adapter, recvpriv).
>
Oh, I see.
> >
> >       list_del_init(&precvframe->list);
> >       list_add_tail(&precvframe->list, get_list_head(queue));
> >
> >       if (padapter) {
> > +             precvpriv = &padapter->recvpriv;
> >               if (queue == &precvpriv->free_recv_queue)
> >                       precvpriv->free_recvframe_cnt++;
> >       }
>
>
>
>
> With regards,
> Pavel Skripkin



-- 
Thanks,
Vihas
