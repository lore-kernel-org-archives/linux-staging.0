Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B472
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 22:30:05 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 18so315675pfh.9
        for <linux-staging@lists.linux.dev>; Tue, 07 Sep 2021 15:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mP/IIf+MJPppx6rdwrLf1UIeleriTJ/3EK8yRMv6DsY=;
        b=OKiv359hU6qwhV0SwGATvX1niwWqBdt0iGVarRgaeolD4hzPmJDltZkhIaBcjrxj1g
         8yqQPMtR9hTicQqC8UdXe3yUS0N3dSxGGrPc9IrbaA8rPIH2uFWArfsiBL9gxZ02lRzt
         O663f/s9A0fsw5delQpKcLC6q9liiTEMIJmqOnSV4JrDPkBPxQQHSCSRa7lf0B3HHtvO
         S2DsnYxaJMzK2N+LCiesfvt4mPCPfFTZnVl2wK3EVkfJcPHs3Nk4T0Ny9h0NU6woqGE2
         pMUBvw488luPIt/5A6pXMXJSoXQMjUu3cDYu7Ve4Rziy5iIwyrF7OU90trUnnzjOpEPq
         V48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mP/IIf+MJPppx6rdwrLf1UIeleriTJ/3EK8yRMv6DsY=;
        b=ulDXtlenZLb1nNK9Mk7UdtMlAAcn4qBpPdyE0GW9v6PE8591uLjRnMWFkIcvRImT+J
         Ur33raoprJvu2E7sGD0LyBQEwk80Xv3cHC2SVQA0YbPmJFO7DJv5JWuzSWskWwDHu52H
         GfTbBUfOTBr3atG5huCfuT4e0aGImlVqzjZpLNAvKVRz8fGNFrHmdDQEg3AnnAuhdSBa
         FxOqfZtr9sKeVpnZaZg1OJTHCXucBPgM0v02N2pTEQY8De0lHVksi/ta8dFF/z108vVH
         WmJhqCi4e45Kfu9PpN/p1XntL3tAbLuevfUMZh0Ftmr8K3otrJV7iBxgEagAutg26bTQ
         14sQ==
X-Gm-Message-State: AOAM533KtbDtFldon/8GekbKXfW8KNMHH6nBDGPQD57z99gC4tOEPM2y
	pXPDZT4dBp45sR5cS1C+k+Pbp+w7fIArFvYBGBuUd2/4+baW2w==
X-Google-Smtp-Source: ABdhPJzgkyotWqm/GhDUt9M4xwX5X+VVZD0hVUEAJ1Bsel6IlV6f5bjhhHaFaC6IFBLXBU7Canbhv3p1uWvFRkEaI7g=
X-Received: by 2002:a63:dd46:: with SMTP id g6mr528777pgj.347.1631053804832;
 Tue, 07 Sep 2021 15:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210907210924.22287-1-straube.linux@gmail.com>
In-Reply-To: <20210907210924.22287-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 7 Sep 2021 23:29:53 +0100
Message-ID: <CAA=Fs0mg7ZjgK-NeeGehEVKczyfH2ZsruWe_nneroBJw6kz=zw@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove unused function Hal_ProSetCrystalCap()
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Sept 2021 at 22:09, Michael Straube <straube.linux@gmail.com> wrote:
>
> Remove unused function Hal_ProSetCrystalCap().
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mp.c    | 9 ---------
>  drivers/staging/r8188eu/include/rtw_mp.h | 1 -
>  2 files changed, 10 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
> index dabdd0406f30..82268f754da0 100644
> --- a/drivers/staging/r8188eu/core/rtw_mp.c
> +++ b/drivers/staging/r8188eu/core/rtw_mp.c
> @@ -924,12 +924,3 @@ void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
>  exit:
>         ;
>  }
> -
> -void Hal_ProSetCrystalCap(struct adapter *pAdapter, u32 CrystalCapVal)
> -{
> -       CrystalCapVal = CrystalCapVal & 0x3F;
> -
> -       // write 0x24[16:11] = 0x24[22:17] = CrystalCap
> -       PHY_SetBBReg(pAdapter, REG_AFE_XTAL_CTRL, 0x7FF800,
> -                    (CrystalCapVal | (CrystalCapVal << 6)));
> -}
> diff --git a/drivers/staging/r8188eu/include/rtw_mp.h b/drivers/staging/r8188eu/include/rtw_mp.h
> index b2befe09d944..73fb6974d076 100644
> --- a/drivers/staging/r8188eu/include/rtw_mp.h
> +++ b/drivers/staging/r8188eu/include/rtw_mp.h
> @@ -466,7 +466,6 @@ void Hal_TriggerRFThermalMeter(struct adapter *pAdapter);
>  u8 Hal_ReadRFThermalMeter(struct adapter *pAdapter);
>  void Hal_SetCCKContinuousTx(struct adapter *pAdapter, u8 bStart);
>  void Hal_SetOFDMContinuousTx(struct adapter *pAdapter, u8 bStart);
> -void Hal_ProSetCrystalCap (struct adapter *pAdapter , u32 CrystalCapVal);
>  void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv);
>  void MP_PHY_SetRFPathSwitch(struct adapter *pAdapter ,bool bMain);
>
> --
> 2.33.0
>

Looks good Michael, many thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
