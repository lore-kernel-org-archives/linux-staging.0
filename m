Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119617C0
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 09:51:32 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id q189so2061689oia.9
        for <linux-staging@lists.linux.dev>; Wed, 09 Mar 2022 01:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2SlVsKKO93FzV+wyxvnSN8csGn56ANvACZsUIgue+Uw=;
        b=PWcjCYr3DRiNE77T78Li6ap2qkWuqGgRfxbbfPuOTZJtWEfvMfYnw94RVt59JAuWQ0
         xum4ppPaG13ENevZIAtYr5FobhL5M4d79ac0ncKXkXMDVmylIWVHbHi67Yc/eLTYatNk
         VU0V3XD1sCWR1Jzj9f4BxyTtjEW3JVF3K1RFbnEOYh0xG+f9yXBto1/8ICZIfEZJ1Vpe
         GgRlK88+/ABeBcdE74cEvGfa3UJIFSDL2fNwHDFGtHUuV9Oa2vDBD40WGuEeiead6Iw8
         dMUWYyB4jqC/DxnCBTIPp1xHHw+LRo9vPE41JpJ91illYfXHVTL/TWTTnv+xhQUQ+mia
         Ab2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2SlVsKKO93FzV+wyxvnSN8csGn56ANvACZsUIgue+Uw=;
        b=ACQK4sNYQ8dJdeDI33xAGEmpZiIfTVxXCG6cegLJfyrwA1NoOnSPqZf1u21AxGvrWT
         GxM5c59ogAbK0ObVdx1k9H1IRPBBBZvkhiIy2tL/bGh3rUB4jT8EH18zE17DdoNer0ra
         GVNICXsWbzh495ikZTd4Bq6hG40xgLoUo0TdvKkStJcoxp8LAzy+HtslbDDfOR1pOvSO
         TvSob6FvQK3LJnXsic++QMrgR6tMG7A0EE80z7XK5vqaHF0d91fZcNDdNnGp2xuk9WUW
         peYh8A+E8SSGy7e6wXYDyrFiZopy0+1HmlYQ2ysj5DWkG3xT8KhDs4WADBnRdveCUGRY
         0r7w==
X-Gm-Message-State: AOAM530sH09Po/QTyWd1VF9k4Gftr8MQWlnUdAuV4j9l3oNLzBMFkW/p
	BWdrFsS2ELEyTM6kHUWPqk+Vu1Lr35Kew8YMrC0=
X-Google-Smtp-Source: ABdhPJxA5k739fTu/pU+zLmLBYNtcaEYvt/4FbUHVLSAjSrPAf+RF4+Sdywdtjg77nLHt4n+ZA+alwX1f7By03XwP/g=
X-Received: by 2002:a05:6808:ec5:b0:2da:350d:f9f6 with SMTP id
 q5-20020a0568080ec500b002da350df9f6mr2079718oiv.276.1646819491917; Wed, 09
 Mar 2022 01:51:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220308205510.48431-1-makvihas@gmail.com> <20220308205510.48431-2-makvihas@gmail.com>
 <20220309075951.GQ3315@kadam>
In-Reply-To: <20220309075951.GQ3315@kadam>
From: Vihas Makwana <makvihas@gmail.com>
Date: Wed, 9 Mar 2022 15:21:20 +0530
Message-ID: <CAH1kMwT67mVn=UvwjtK28PvWy2CBddVx=CwvWRvqSV8_E81usw@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: call _cancel_timer_ex from _rtw_free_recv_priv
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	Martin Kaiser <martin@kaiser.cx>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> *If* then timer_setup() belongs in _rtw_init_recv_priv() then this is
> where the _cancel_timer_ex() belongs, yes.  But what about if the devs
> hid it in a different wrong place?
>
> Right the del_timer is in rtw_cancel_all_timer(), which is called
> from rtw_usb_if1_deinit() when we remove the USB device.  So something
> more complicated is wrong.  I would prefer to just note this as a bug
> until we can investigate more completely.

Sounds fair.

>
> I believe we can del_timer() twice without creating a bug, but I'm not
> positive.

Yes, we can. I tried it yesterday and it didn't create any bug.

On Wed, Mar 9, 2022 at 1:30 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Mar 09, 2022 at 02:25:09AM +0530, Vihas Makwana wrote:
> > The _rtw_init_recv_priv() initializes precvpriv->signal_stat_timer and
> > sets it's timeout interval to 1000 ms. But _rtw_free_recv_priv()
> > doesn't cancel the timer and we need to explicitly call
> > _cancel_timer_ex() after we call _rtw_free_recv_priv() to cancel the
> > timer.
> > Call _cancel_timer_ex() from inside _rtw_free_recv_priv() as every init
> > function needs a matching free function.
> >
> >
> > Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_recv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> > index d77d98351..61308eb39 100644
> > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > @@ -103,6 +103,7 @@ void _rtw_free_recv_priv(struct recv_priv *precvpriv)
> >       vfree(precvpriv->pallocated_frame_buf);
> >
> >       rtl8188eu_free_recv_priv(padapter);
> > +     _cancel_timer_ex(&precvpriv->signal_stat_timer);
> >  }
>
> *If* then timer_setup() belongs in _rtw_init_recv_priv() then this is
> where the _cancel_timer_ex() belongs, yes.  But what about if the devs
> hid it in a different wrong place?
>
> Right the del_timer is in rtw_cancel_all_timer(), which is called
> from rtw_usb_if1_deinit() when we remove the USB device.  So something
> more complicated is wrong.  I would prefer to just note this as a bug
> until we can investigate more completely.
>
> I believe we can del_timer() twice without creating a bug, but I'm not
> positive.
>
> regards,
> dan carpenter
>


-- 
Thanks,
Vihas
