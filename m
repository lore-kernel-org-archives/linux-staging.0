Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128B2FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 17:21:12 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id nt11so20065686pjb.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fyesMPCu3k5uc0fgNeqD03U46W6GxKBW5HWGQ4LWGoI=;
        b=dr3K0lC3+hydsYfmF4LNXP9kNBYbRwbwvG1cqCwLp2I4avlJX2/VcIxp4K1H6+U2e/
         7YN1MViTWvTNkpou/ORaB56Mn4+wyR8rq+CRb3yOvwip9Ghsjv1lcZSqnRL4HXrjEnsi
         3c2X1WeWyOC9xbCteobrr7i3lZO/9ofZ2ClKb28THncJHcQKViJLkM+21z3S7EfmGEgd
         yyUs3mkf0lsN+Gs6FOpL+/vSxKt4p1sxxfNa8jDCgvQmOsnCGy9MJymc+hpy7vJpP3ko
         aEFu2db80lUQZ5vgsU4VZ/cUzD05bujAS392WV+j+i+2TOG3CCkbCnr4q8yd7GhaXwej
         sQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fyesMPCu3k5uc0fgNeqD03U46W6GxKBW5HWGQ4LWGoI=;
        b=b1FiekdfuqsF+4hLj4+bl0vLCQ+sNcCsAI4d8k1QtRbma4ZsQZEfsGusueVm4XBbEK
         SOOeKrHgO5DOYWNDh//7fxsxngppb8hVjyxjF0s28Y+VP8hGpEQpkfTG4Icyn2P6ZxTV
         oIhnpOe//M8Fq9KqelgmPcOT86bBHRrYkyOkZRNws686SLxA/oFqFWE+r5jZBvGZRxBl
         k9BUD7KdigjHh3048UKqYS2kWPsk0aT6O7LKTQ9UggV6whi+1KI5iZHIdUOy/nwZWf8f
         e8jfaFx1ROteU4oYtlvLFcM3duZfkN8pj6tTWMtLRRtx5xIpT5UhnE6u638zoRwFGkCc
         uRWg==
X-Gm-Message-State: AOAM530os9eR/EfIqRe42bvivOWEB8PO6oIpuz3k9Ki9iRl/2I790HiZ
	EqeifX0jJGyOipDVZBUY+2MaFHS5uSe6yJ5/WrfRmQ==
X-Google-Smtp-Source: ABdhPJydsTE5t381NdSdc+1LZBbPFmloDE3yb7+LSMrr/cWBNFjwpATbqkHkxCLrr7et+tBaGj+zopm3SmbyD0Iy6po=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr6434306plo.37.1628961671656; Sat, 14 Aug
 2021 10:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210814073920.3551-1-straube.linux@gmail.com>
In-Reply-To: <20210814073920.3551-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 18:21:00 +0100
Message-ID: <CAA=Fs0nH4x3TQnN3AVUMXJbCVa=a1mA2t2rF87cYUazttdsNOg@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove ODM_GetRightChnlPlaceforIQK()
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Aug 2021 at 08:40, Michael Straube <straube.linux@gmail.com> wrote:
>
> Function ODM_GetRightChnlPlaceforIQK() returns always zero for
> channels <= 14. The driver is for chips that do not support 5 GHz,
> so remove the function and replace the usage of its return value
> with zero.
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 29 ++------------------
>  1 file changed, 3 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> index 643a4d348b2e..c92a76aebc11 100644
> --- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> +++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> @@ -1004,27 +1004,6 @@ static void phy_IQCalibrate_8188E(struct adapter *adapt, s32 result[][8], u8 t,
>         }
>  }
>
> -#define ODM_TARGET_CHNL_NUM_2G_5G      59
> -static u8 ODM_GetRightChnlPlaceforIQK(u8 chnl)
> -{
> -       u8      channel_all[ODM_TARGET_CHNL_NUM_2G_5G] = {
> -               1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
> -               36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64,
> -               100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122,
> -               124, 126, 128, 130, 132, 134, 136, 138, 140, 149, 151, 153,
> -               155, 157, 159, 161, 163, 165
> -       };
> -       u8      place = chnl;
> -
> -       if (chnl > 14) {
> -               for (place = 14; place < sizeof(channel_all); place++) {
> -                       if (channel_all[place] == chnl)
> -                               return place-13;
> -               }
> -       }
> -       return 0;
> -}
> -
>  static void phy_LCCalibrate_8188E(struct adapter *adapt, bool is2t)
>  {
>         u8 tmpreg;
> @@ -1088,7 +1067,7 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
>         struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
>         struct mpt_context *pMptCtx = &adapt->mppriv.MptCtx;
>         s32 result[4][8];       /* last is final result */
> -       u8 i, final_candidate, Indexforchannel;
> +       u8 i, final_candidate;
>         bool pathaok, pathbok;
>         s32 RegE94, RegE9C, RegEA4, RegEB4, RegEBC, RegEC4;
>         bool is12simular, is13simular, is23simular;
> @@ -1200,14 +1179,12 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
>                         pathb_fill_iqk(adapt, pathbok, result, final_candidate, (RegEC4 == 0));
>         }
>
> -       Indexforchannel = ODM_GetRightChnlPlaceforIQK(pHalData->CurrentChannel);
> -
>  /* To Fix BSOD when final_candidate is 0xff */
>  /* by sherry 20120321 */
>         if (final_candidate < 4) {
>                 for (i = 0; i < IQK_Matrix_REG_NUM; i++)
> -                       dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].Value[0][i] = result[final_candidate][i];
> -               dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[Indexforchannel].bIQKDone = true;
> +                       dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[0][i] = result[final_candidate][i];
> +               dm_odm->RFCalibrateInfo.IQKMatrixRegSetting[0].bIQKDone = true;
>         }
>
>         _PHY_SaveADDARegisters(adapt, IQK_BB_REG_92C, dm_odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
> --
> 2.32.0
>

Nice work, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
