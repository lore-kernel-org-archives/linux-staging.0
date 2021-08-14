Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C642FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 17:13:26 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d1so15968037pll.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZdlSu+dxBgBNyDJIPOwKBeQJU2RsDPsbPH09vbpsfE=;
        b=jPZn0kMjXsEWkNzcvEvpypJrWNk7r1wa3GW06+21pqAxyUF5xx5EGz7b9L71aZKrpj
         bTI6/n66xaDAWDO1ifM9/uQtBvHSr9jKsP5yjqdz/1mWXGB/YRUQOKqqPH07pe5y5MrH
         Zn+6dXRMgUrd2SmhUgLc5nJE5sBJ03bZyCNmysgwWZ4PTN1JnQeShrBSX0v1QRXms2dZ
         QJTmyAmVxslRvAAgoKnKEhVtnn1SFo6uZw2pCNa1uEMKah/18LfU3TlS3dNLFtqlNkqR
         iX+6nIl+1jiFYZKr7nmWRK0f4p73Zcruqk58FF3zrOtG2RplPxlml7ph8/7ZQknsnYUN
         Rw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZdlSu+dxBgBNyDJIPOwKBeQJU2RsDPsbPH09vbpsfE=;
        b=ZDVgZ8WcYDECGCQVFk0zsA248NWNpW/6kZnrDKxjgt8Jax/rEHZO/PyocioWwHg70W
         Dig1pNxf7eReL7L59p0KJxcf691k1MBMUNYy/04boVB9IqQe70kBTPAzOsCpTUclDt/d
         yoDanJPFvQumEmM+p5/+fry3yUBZoHZ2ALFpYmfHdccOpFydyi/ybUqwmA5XJ1cNVAPm
         UWfr7yz1HqDWVOTqnlOB+hfV3GerKngDLXqBCWUgXzNCqMTFkO9sBi3rFIp5CqgPEK68
         zUG/UcCycWRyVHDrNXp+RxJY8R9z6brsap+wWOvOPxPlY0enAowYsQc2FcV/F6IaIgUf
         K5ag==
X-Gm-Message-State: AOAM533bFWcdZZykVnSP/akVnw5hWbqB7TJyHxmTvNpcSXRMcplbkaCY
	PLY7xsztLyMY0+PQvXZPpHzS18IIlZcx5V26pQnVug==
X-Google-Smtp-Source: ABdhPJzyzZ/e1km0VD5ChlgIUMAEyb76zPROBxmeQVG1rOT4VYcAMNdopaJ8o4oKy2NVfsfhdPEgMVa+9hOayKy27Jk=
X-Received: by 2002:a17:902:8c81:b029:12c:ee37:3f58 with SMTP id
 t1-20020a1709028c81b029012cee373f58mr6405719plo.45.1628961206255; Sat, 14 Aug
 2021 10:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210813073109.25609-1-straube.linux@gmail.com> <20210813073109.25609-5-straube.linux@gmail.com>
In-Reply-To: <20210813073109.25609-5-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 18:13:15 +0100
Message-ID: <CAA=Fs0kdfVMDJPZpZC-eE2MJJsvEqMjVYGO_PNJq6zJVDgWrUQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] staging: r8188eu: rename Hal_GetChnlGroup88E()
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 08:32, Michael Straube <straube.linux@gmail.com> wrote:
>
> Rename Hal_GetChnlGroup88E() to avoid camel case.
> HalGetChnlGroup88E -> hal_get_chnl_group_88e
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index 07ba5f0eecc2..24a82fc41872 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -2060,7 +2060,7 @@ static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G,
>         }
>  }
>
> -static void Hal_GetChnlGroup88E(u8 chnl, u8 *group)
> +static void hal_get_chnl_group_88e(u8 chnl, u8 *group)
>  {
>         if (chnl < 3)                   /*  Channel 1-2 */
>                 *group = 0;
> @@ -2114,7 +2114,7 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
>
>         for (rfPath = 0; rfPath < pHalData->NumTotalRFPath; rfPath++) {
>                 for (ch = 0; ch < CHANNEL_MAX_NUMBER; ch++) {
> -                       Hal_GetChnlGroup88E(ch, &group);
> +                       hal_get_chnl_group_88e(ch, &group);
>
>                         pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][group];
>                         if (ch == 14)
> --
> 2.32.0
>

Dear Michael,

Looks good to me, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
