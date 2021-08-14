Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7B2FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 17:15:49 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso6612956pjh.5
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDDi2ITyznJdEvYgoFlgdqKOsOTi4UGXz+quqcdg0tw=;
        b=PqX39jo+Ze3T0CQ3dTZICSBpo0FBjV604nKhrbpkSZ+jBfbu9fOZ98qXVOyancXZeg
         L2xAWeA9IMb3Yp4AqjXhKou2FEVmIX4JMEBhcbBHvmOj8MDsF3PxG72wlhPBrQopWA1N
         2um+1NuPOW6cm8+caR2uvpYK9o5vfKNxtejLsPMvZ0T9rSb2fC35rpDF+t0/xxreF5Hl
         W4OnA3PNzjnGgWe5NnyRngMkjIDTaWiQgTW3ernDSTFnQCF4GHtVY8w/LsunPmI/BYS7
         qOEIR9oDfG3IsjZzX6zXmRP5dolYsqc4IJ9dFdvWRadWzyuufyzcsHWGBUal83Kpvbi0
         QNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDDi2ITyznJdEvYgoFlgdqKOsOTi4UGXz+quqcdg0tw=;
        b=Gt9+P2Iotl7YBa8ONm4gyR/lmIcFaD97lQdjGJtkut6uvK7SjBFZOPYL524+y/zWBs
         AmBmRIom3QVx2qMUajSxRZ0GfGU+oUYBXNgVgnSGhrC0IfUpZRbVsZXNls7T0yc8S6DD
         kPNsrKM6WprlCQnPP/QN68Et7CZlgQVdG0qkSoj2fCT1jFYB3JAfb2tfLRKxPndbn2+S
         F7toy0t///0LUtmOAhXOa8lQ4oIkAKQdeq3LsDOcGMomUgkcFDEIsIVOXGjMYsBSQs2F
         sV10ynAg+oMobOsCzQBI82koc+VlbRiO6CdJTfhG3DJkbUjyVLnjOmk5sI3r3uJSCmMf
         0Yzg==
X-Gm-Message-State: AOAM5305YzIdjvj/+6GOnEtNqXPtXROV0DN4k792TjYtIJMOzkD9o6hu
	bkDzdW2e0wKuTkN2nEv8Vday4XBwp1uVjOjBR4NEiQ==
X-Google-Smtp-Source: ABdhPJxBiHJ+QcorDH5wOzManRua9hxJKXtjxeHWpyDLpTerb964YjW8uz54MQJhgWj4y3mzFWFJTM3GaFati4ckNi8=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr6421510plo.37.1628961349449; Sat, 14 Aug
 2021 10:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210813160812.17603-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210813160812.17603-1-fmdefrancesco@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 18:15:38 +0100
Message-ID: <CAA=Fs0m8nh318ox0s2sg+fMtaqqdn7anev5a9pLbM0yUvkXajA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: Remove variables and simplify PHY_SwChnl8188E()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 17:08, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Remove "bResult" and "tmpchannel" and all tests and assignments that
> are related to them in the code of PHY_SwChnl8188E().
>
> "bResult" was always true, therefore its test led to a null statement.
> "tmpchannel" was used only to restore "pHalData->CurrentChannel" to its
> previous value only if _PHY_SwChnl8192C() was not called; therefore
> assign "channel" to "pHalData->CurrentChannel" if and only if
> _PHY_SwChnl8192C() is to be executed (and get rid of that temporary
> storage).
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
> index 02955b8c4005..9af91ec92d36 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
> @@ -1091,8 +1091,6 @@ void PHY_SwChnl8188E(struct adapter *Adapter, u8 channel)
>  {
>         /*  Call after initialization */
>         struct hal_data_8188e   *pHalData = GET_HAL_DATA(Adapter);
> -       u8 tmpchannel = pHalData->CurrentChannel;
> -       bool  bResult = true;
>
>         if (pHalData->rf_chip == RF_PSEUDO_11N)
>                 return;         /* return immediately if it is peudo-phy */
> @@ -1100,17 +1098,8 @@ void PHY_SwChnl8188E(struct adapter *Adapter, u8 channel)
>         if (channel == 0)
>                 channel = 1;
>
> -       pHalData->CurrentChannel = channel;
> -
>         if ((!Adapter->bDriverStopped) && (!Adapter->bSurpriseRemoved)) {
> +               pHalData->CurrentChannel = channel;
>                 _PHY_SwChnl8192C(Adapter, channel);
> -
> -               if (bResult)
> -                       ;
> -               else
> -                       pHalData->CurrentChannel = tmpchannel;
> -
> -       } else {
> -               pHalData->CurrentChannel = tmpchannel;
>         }
>  }
> --
> 2.32.0
>

Dear Fabio,

Good stuff, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
