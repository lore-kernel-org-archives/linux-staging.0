Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007832C9D
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 11:17:42 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso29761408ota.5
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vi8MbxG85CYq9CNpZ44LAbBeodXmRyoupGjEHyG65DY=;
        b=iXezmFuJH1+Hgbo84C2QcMaXq6A4xQh3hOkRD9HWk7yHCPke2h6HeTl5PIURVm4tMU
         z9cH+9PY0fZy04TPo5fq33vjbfBhBHtwkn3HckuoJ9dulZNoeg9D4uG45Shx6WVqaeRh
         tbi98kBIcEmV93EKb49a2PP5+bgTw3o5Ni2CI5sNR92YWsIXIrpBWkpCLbcYhvbaAzK7
         aCZxW9hrP+Aij4zvRy4VwVybWiI6G/Hs6Q34Zog+2O6kS7iJZaUZzB9cjd+Vw0dOp8l1
         U5NNQndYtFX4Ei+IHUWknENj+emjKSvchbGOYwcydulPKJAmaBw0gNuzLJglsA3J1hU6
         GqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vi8MbxG85CYq9CNpZ44LAbBeodXmRyoupGjEHyG65DY=;
        b=Cz70wAY4ujrrKuadVC6CIje6WM8H0CIk2OdXW3uSlRXdp4Ru+g6ut/oSTKuPhIAC5V
         c31i/D41aBEVRg2Hv6CvMZZwB9zq4KR8CMwZ2Cyi5p60zIr1fwJC+ueutlavQf+NNf/w
         gAZCqVqbSPrwwyYcllMDDZsx6rZibGqiu8SbW4igM6pGvTWIM9f3vJv2O/KbFCwmr8U2
         ahaEWAYvVuDRkouZuh10NZC6jPbJHl+Xr2Am/HzNSCEgX6yREAjfbQzL/QCrWqOvtfgK
         7jH3l0qmMCovQVxDUcvjFQ10berkG0IhlEvUQ2gi7NEvLvjFQBLu5mTGiGO7mii6Nyxk
         o8ig==
X-Gm-Message-State: AOAM530lzorQwkiYBKiAGHKChYWM17nwRT81UWRSJerdK4p9El9KT5Kv
	eZNs1On58Dg+0i0334oz8yoZhR8AphsrYvE5BoY=
X-Google-Smtp-Source: ABdhPJzFuM1afuBfC8qppB4kUGyroaS87FAAfDg3iDhWzguxH+Ey/QnltKVZi8ZXLaP1OaZfp0JpspEBQSMDCMbLq5E=
X-Received: by 2002:a9d:326:: with SMTP id 35mr49780081otv.41.1638271062090;
 Tue, 30 Nov 2021 03:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211129221346.365883-1-makvihas@gmail.com> <20211130094727.GT6514@kadam>
In-Reply-To: <20211130094727.GT6514@kadam>
From: Vihas Mak <makvihas@gmail.com>
Date: Tue, 30 Nov 2021 16:47:31 +0530
Message-ID: <CAH1kMwTbjN4_fqG94j4Ei2SWmjSsjanwMaSJrk4M6kGOzfB9fw@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: use ARRAY_SIZE() macro and fix
 camelcase issues
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, Phillip Potter <phil@philpotter.co.uk>, 
	Greg KH <gregkh@linuxfoundation.org>, martin@kaiser.cx, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>> Get rid of both the "arraylen" and "array" variables.  They only obscure
>> what the code is doing.  You may need to do additional clean up to make
>> it work without making the lines too long...
Alright.


On Tue, Nov 30, 2021 at 3:18 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Nov 30, 2021 at 03:43:47AM +0530, Vihas Mak wrote:
> > Fix camelcase warnings from checkpatch.pl and use ARRAY_SIZE()
> > to make the code cleaner and avoid following cocci warnings:
> >
> >       drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c:142:51-52: WARNING: Use ARRAY_SIZE
> >       drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:174:52-53: WARNING: Use ARRAY_SIZE
> >       drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:450:52-53: WARNING: Use ARRAY_SIZE
> >       drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:655:49-50: WARNING: Use ARRAY_SIZE
> >       drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c:136:50-51: WARNING: Use ARRAY_SIZE
> >
> > Signed-off-by: Vihas Mak <makvihas@gmail.com>
> > ---
> >  .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |  6 ++---
> >  .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |  2 +-
> >  .../staging/r8188eu/hal/HalHWImg8188E_RF.c    | 24 +++++++++----------
> >  3 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
> > index f6e4243e0..ce46b3651 100644
> > --- a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
> > +++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
> > @@ -171,7 +171,7 @@ enum HAL_STATUS ODM_ReadAndConfig_AGC_TAB_1T_8188E(struct odm_dm_struct *dm_odm)
> >  {
> >       u32     hex         = 0;
> >       u32     i           = 0;
> > -     u32     arraylen    = sizeof(array_agc_tab_1t_8188e) / sizeof(u32);
> > +     u32     arraylen    = ARRAY_SIZE(array_agc_tab_1t_8188e);
> >       u32    *array       = array_agc_tab_1t_8188e;
>
> Get rid of both the "arraylen" and "array" variables.  They only obscure
> what the code is doing.  You may need to do additional clean up to make
> it work without making the lines too long...
>
> Same for the rest.
>
> If that is too complicated then it's fine too, just leave it as-is for
> now.  I know that sometimes people just want to silence the checkpatch
> warnings but I prefer to keep the warning as a marker for bad code so
> let's leave it until someone can fix this in the correct way.
>
> regards,
> dan carpenter
>


--
Thanks,
Vihas
