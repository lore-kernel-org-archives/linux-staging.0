Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A307E
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 17:55:44 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-e5ca5c580fso16892499fac.3
        for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NXFAC2IHRVkyeVboZLBfX7Ba1biHdUse85NUhdHGxTI=;
        b=WbCZmixVJm2Bmbgib3awwgetaxMvcxocv1dRfoys8Ibh6yKiTzbSlMEfASsx8EJcGz
         MAMtlVp7hWjCvdVo5P58iEjT2QfTazUX+gup39QZ1eb/jrrObx14IoaKVf1PLPByYFhU
         VUtV2f4+kXPdiQTeipQJXJ4fgRM/XjRhRW6kiV+MhNiBsSMTyzvsVlDNRC3ocS6nDk98
         ceJXxMQbAEO14zR68b4JKrMJXj4EoebLcC0BkHxGavO9f1xK/HFX1ubx3aRYNhpwtEwg
         ah9wTa8hvQIRQmuSxeu1lqXL9QDF8NoiQmzZt4xn/HN0bDgvTaEzRmT4NfDfC2xfVdzU
         QIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NXFAC2IHRVkyeVboZLBfX7Ba1biHdUse85NUhdHGxTI=;
        b=rUezEf7yFWorxMynNxWU1DxWawkdursxgyxaXLv/t4nBANF0K36pgGjQ8KpBNdjMlE
         BgQJvOYH6adzS1rBL+oRJj1itutFT5qbvv/VMDs9BoJNcaBJbC0/bd78agQXSztBgRGC
         HejLviNS8t0rO3Rm+66EtVylXZeb3iHY7Z11zOd4XxV6s1mkuBLg/RadbMR5UoEJmANo
         EMv5aQ2YGBdQgzkZU3Va5r3ZMPpRyA7TMZZPyk593otKEVMWDiXTjHeivI/MmKL/dYpk
         niSMZ6EubYkR5o63QV+rUjP7BgypAzknfqYhylIzZjJgC7tMBRcAvELduiSp6zUD9l3F
         2akg==
X-Gm-Message-State: AOAM532uwFm/KsCZrZ9GwNua9nzCxBRldx5G8hs+tcahgQWn0kHggHVA
	TZRtvc5BlW9BVnR6858olBdoraYP5AsZv/n3NNs=
X-Google-Smtp-Source: ABdhPJzQbz55hcjBsibxoT2dF8eTY6kR4H/8Rvs3ujIV60F44UwSLTFgtSRMK1IEsCdR4UkZTxHZ7S+A7aZ20p/tMvE=
X-Received: by 2002:a05:6870:89a1:b0:d2:ca93:8797 with SMTP id
 f33-20020a05687089a100b000d2ca938797mr7428640oaq.112.1650909343234; Mon, 25
 Apr 2022 10:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220424163132.37007-1-makvihas@gmail.com> <20220424163132.37007-4-makvihas@gmail.com>
 <2e4fa41d-cd06-75e4-17ac-120127fe9b2a@gmail.com>
In-Reply-To: <2e4fa41d-cd06-75e4-17ac-120127fe9b2a@gmail.com>
From: Vihas Makwana <makvihas@gmail.com>
Date: Mon, 25 Apr 2022 23:25:32 +0530
Message-ID: <CAH1kMwTT7kEB5O6ZvCWEJk3RGzkRek_fzaNPUnUpFFKq_fhGvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: r8188eu: fix null check in _rtw_free_mlme_priv
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 25, 2022 at 12:30 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi Vihas,
>
> On 4/24/22 19:31, Vihas Makwana wrote:
> > There's a NULL check on pmlmepriv in rtw_mlme.c:112 which makes no sense
> > as rtw_free_mlme_priv_ie_data() dereferences it unconditionally and it
> > would have already crashed at this point.
> > Fix this by moving rtw_free_mlme_priv_ie_data() inside the check.
> >
> > Signed-off-by: Vihas Makwana <makvihas@gmail.com>
>
> That's good catch, but looks like the check is just redundant
>
> This function is called only from it's wrapper called
> rtw_free_mlme_priv() and rtw_free_mlme_priv() is called from 2 places:
>
> 4 drivers/staging/r8188eu/os_dep/os_intfs.c|531 col 2|
> rtw_free_mlme_priv(&padapter->mlmepriv);
> 5 drivers/staging/r8188eu/os_dep/os_intfs.c|579 col 2|
> rtw_free_mlme_priv(&padapter->mlmepriv);
>
> _Very_ unlikely that `&padapter->mlmepriv` expression will become NULL.
>
So I guess either we should remove the check or mark it with the
`unlikely()` macro.
>
> > ---
> >   drivers/staging/r8188eu/core/rtw_mlme.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> > index 081c02417..87c754462 100644
> > --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> > +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> > @@ -109,12 +109,10 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
> >
> >   void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
> >   {
> > -
> > -     rtw_free_mlme_priv_ie_data(pmlmepriv);
> > -
> > -     if (pmlmepriv)
> > +     if (pmlmepriv) {
> > +             rtw_free_mlme_priv_ie_data(pmlmepriv);
> >               vfree(pmlmepriv->free_bss_buf);
> > -
> > +     }
> >   }
> >
> >   struct      wlan_network *_rtw_alloc_network(struct mlme_priv *pmlmepriv)/* _queue *free_queue) */
>
>
>
>
> With regards,
> Pavel Skripkin



-- 
Thanks,
Vihas
