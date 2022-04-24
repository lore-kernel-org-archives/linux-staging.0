Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B867A
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 09:27:57 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id m11so3215735oib.11
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 02:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XGfh8EfUa/71STJGMxPbCQwj50vcBi6lUdptORUuTtU=;
        b=mOtSMeD38hB1Ln7QFmLgtxBBGD+oQPSf+iLUc0NLLkNszOpB4d6EIwNHyK6pMorfDG
         VlN6HWzqk/URRT4/BniBP4yYUJopdj+TaE7K3WxsvxyWPffaITFSDpBFo096T+gju3gM
         jOBHEQtSibpdc3wyHviWgCgWXnnDZegdNSA4QgAJq2tW0w4uHtwz+zXhTu7BSBq30P2A
         /VFuZ9ABGC2gJaxlaGEpQHjJFserKQJ4jw189wwQ6o12mD0VA5QrU4SCm/jKm2em4+py
         D7P24V1bYW1ktQJ4zFDUSr8FAo4grAZdXf1t/MDSuY2tagSVbrzoYARsr4MIEmTHY2Tk
         Hugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XGfh8EfUa/71STJGMxPbCQwj50vcBi6lUdptORUuTtU=;
        b=MAV91Z1pLfekN7vvspVpoaLh9T8eHa+Su4n7a0yvW9tXz7s6W7QnrUhDmW4Y3ZM5O6
         Mm2CN1pqwj28kTE+4udXaiLNNwabwJA7+ZOsb1J7TONi4c0blZb4h+MelM1QJ6N2pb47
         NqH6zwtyvdxdwRnCkbM7KHrQRqdQ9b+vLrHox0GK5fqY5pcJRNNuUYSHv2PgCiLcyaz8
         OJcmcGIQdCbtuJTQz4cXYKsn9F6yiNUfVI1GOgLtJpwjdA7CvGpqOua+NSdCT8cMnKTs
         A+Rcpv9+HRs8bSkbEw99XHB+knq+ytC7Bsu22sm0ppmO42sVYcZFjK1w4eE5QQV6CVUL
         TdZA==
X-Gm-Message-State: AOAM532c9+wgOXlABXhhBQi1nY5K3zZ91yDxd2oVcKzW+OM584MTzFvR
	8zC51BZQgPpQn5QP9ZF4ERSFNInhCIBf1DFmnTk=
X-Google-Smtp-Source: ABdhPJxIgM5ZYlj0ri3lZjBQqBO255sXOTD9eqpLJg58/ifArO33kJJn4O9Ihzjqf7GCRyRX6ude2mgb8KMuEc2T3BA=
X-Received: by 2002:aca:1306:0:b0:322:9104:6cf9 with SMTP id
 e6-20020aca1306000000b0032291046cf9mr5701436oii.112.1650792476305; Sun, 24
 Apr 2022 02:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220423184745.21134-1-makvihas@gmail.com> <3607997.MHq7AAxBmi@leap>
In-Reply-To: <3607997.MHq7AAxBmi@leap>
From: Vihas Makwana <makvihas@gmail.com>
Date: Sun, 24 Apr 2022 14:57:45 +0530
Message-ID: <CAH1kMwSZbogptqDdiJVoiLcZamY_PmX_p0oXPZguoAnY=dibug@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: fix a potential NULL pointer dereference
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@oracle.com>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 24, 2022 at 5:17 AM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On sabato 23 aprile 2022 20:47:48 CEST Vihas Makwana wrote:
> > recvframe_chk_defrag() performs a NULL check on psta, but if that check
> > fails then it dereferences it, which it shouldn't do as psta is NULL.
> >
> > Set pdefrag_q to NULL if above check fails and let the code after it
> handle
> > that case.
> >
> > Fixes: 1cc18a22b96b ("staging: r8188eu: Add files for new driver - part
> 5")
> > Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/
> r8188eu/core/rtw_recv.c
> > index c1005ddaa..db54bceff 100644
> > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > @@ -1244,7 +1244,7 @@ struct recv_frame *recvframe_chk_defrag(struct
> adapter *padapter, struct recv_fr
> >                       pdefrag_q = NULL;
> >               }
> >       } else {
> > -             pdefrag_q = &psta->sta_recvpriv.defrag_q;
> > +             pdefrag_q = NULL;
>
> Hi Vihas,
>
> To me the code looks like this...
>
>         struct sta_info *psta;
>         ...
>         psta = rtw_get_stainfo(pstapriv, psta_addr);
>         /* The code is about to test if "psta" is a valid pointer */
>         if (!psta) {
>                 /* "psta" is NULL */
>                 ...
>         } else {
>                 /* "psta" is not NULL */
>                 ...
>
> >       }
> >
>
> Also, even if "psta" were NULL (but it isn't), your change would still be
> no good.
>
> Please be very careful with these types of changes next time :)
>
> Thanks,
>
> Fabio M. De Francesco
>
> >       if ((ismfrag == 0) && (fragnum == 0))
> > --
Oh yea, sorry about this. I don't know how I missed this.
Thanks for clarification Fabio. Will take care next time.


-- 
Thanks,
Vihas
