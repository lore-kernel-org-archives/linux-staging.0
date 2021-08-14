Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC272FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 17:13:03 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id a8so19987223pjk.4
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ulnCaxbnm9fxcS4SqwelNUN+wWuJnGF9LyN6HPS3uvE=;
        b=GQl+bA5kUXvs5Nsqc8x8ECr6NzBQNS9CRsZ8Z+fk/lUrrKllQWu0WwTXkihZN5T9oj
         H8ywnnNhPgs0u0PtquXh3jRL2wiD1bO6zDL6xjXevlt3lJ2LCa750l7JoVjjCIWJ3970
         3KgJ4O05/Rs8Vs9pAbg7KHotag2NLtelNnVH/W1C9axQoHzIttytRjcZWtwjH+xtFShZ
         EpmxqokQaqpZ1MzmXsRak7Rw3OitYQD8M+P8QDbtK7ebCbj2sVgg5S2W1jb6svcyoVNR
         R/vPnt3iiWU1+UYjAg6H5Kd6wPirdc+xok2wW3ME/++gyeF11394iaLykpat1YnVgejC
         tZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ulnCaxbnm9fxcS4SqwelNUN+wWuJnGF9LyN6HPS3uvE=;
        b=akvzccW+ZKkRXvBjqdBVMIKbg6LGIAbCdMuW4jMxhKwsF2j31fUT7RI8e1Dyp0p+AL
         X/at2oQR/ZUK2nF40VMwIGL+Hh0m6tQRf/TUVidk84IOvOj18tmMHuhm4TGVF84ypeiK
         EhHpUi6ehVi0ptN/+vf4uMl8NhdwdYk3OGJFXARQX9umViPhU+7Fhl0H+p21owGUK520
         2xm4L3jYVbWcB6xP8Z6jcmapZpCFZEpxFhoKoKFBLJO5MMo1i12JQmMENYTOgtaNrITl
         0QiZMzOLOdDoy9rg+bx0/kn7/jCvwHmAW0yOcAJWakliuPNiqLCtWLaKLVQ6+BSgXE6l
         y+/A==
X-Gm-Message-State: AOAM531uA6xGvj0AWJNFd1vg4jlhIWalTQOS5xRDJ+BwTsM+Op3pVEfG
	8glqm28inEtLOTLYUti9X/16W8zxdSycoNRNeVPMpA==
X-Google-Smtp-Source: ABdhPJyipbhFpqVeinMI8fTLh0kGagCCpiKlw7u84bawz1NzjpUge43EOFoIIUqh5f0iTjvs7HKnq/ru7oNIethOIZg=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr7653466pgo.208.1628961183442;
 Sat, 14 Aug 2021 10:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210813073109.25609-1-straube.linux@gmail.com> <20210813073109.25609-4-straube.linux@gmail.com>
In-Reply-To: <20210813073109.25609-4-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 18:12:52 +0100
Message-ID: <CAA=Fs0n=P1hzvHdpe+HRqH8tiL3+V8QG38HRszGnUTMpxaP55g@mail.gmail.com>
Subject: Re: [PATCH 3/4] staging: r8188eu: rename parameter of Hal_GetChnlGroup88E()
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 08:32, Michael Straube <straube.linux@gmail.com> wrote:
>
> Rename parameter of Hal_GetChnlGroup88E() to avoid camel case.
> pGroup -> group
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index d3345fa0eb60..07ba5f0eecc2 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -2060,20 +2060,20 @@ static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G,
>         }
>  }
>
> -static void Hal_GetChnlGroup88E(u8 chnl, u8 *pGroup)
> +static void Hal_GetChnlGroup88E(u8 chnl, u8 *group)
>  {
>         if (chnl < 3)                   /*  Channel 1-2 */
> -               *pGroup = 0;
> +               *group = 0;
>         else if (chnl < 6)              /*  Channel 3-5 */
> -               *pGroup = 1;
> +               *group = 1;
>         else if (chnl < 9)              /*  Channel 6-8 */
> -               *pGroup = 2;
> +               *group = 2;
>         else if (chnl < 12)             /*  Channel 9-11 */
> -               *pGroup = 3;
> +               *group = 3;
>         else if (chnl < 14)             /*  Channel 12-13 */
> -               *pGroup = 4;
> +               *group = 4;
>         else if (chnl == 14)            /*  Channel 14 */
> -               *pGroup = 5;
> +               *group = 5;
>  }
>
>  void Hal_ReadPowerSavingMode88E(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
> --
> 2.32.0
>

Dear Michael,

Looks good to me, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
