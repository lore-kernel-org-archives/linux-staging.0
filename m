Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C21C3FC3
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 23:58:21 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 17so13005064pgp.4
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ze576013se8gTETJRjtdN0zpKGBJhk+U/2xWctJQRKI=;
        b=bhEJ0rA28D8RxCMKQwAzZlwDOVlv3/Gn9NXMukx4btG5s4GTBms8IynaLMusHs16E3
         dZXPvFwTUUgEZ+/WdmXyIHpi1jJ0EBZInIBIyKqspSlG8+43VKZ0jGrg2Q8ny/ZOFi5E
         RAsu/WoYzres5Pw/XQyzjaOz6IYDyBRR7p28VL7p87/IlsKtIyTr24v3p8k67GQqGMa+
         mISQV18GQ/3yLbJOI0frMQjUMKXBogudyN2KaMWDSkdrtGuhb7ahPNNBxZkdnSspEpgG
         rC+I1JNQBq1198IMVNV8Wgy1pjdJ50MbDFiSsi4/qEHBcLEelb71SfSsV8fsEDYgaooy
         UadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ze576013se8gTETJRjtdN0zpKGBJhk+U/2xWctJQRKI=;
        b=OVkFl0QqSC0llp5SkBWwTbhVZeis9B+pBaddsmULH5/+Yatz2K3hN0/3E7AQGLr4UN
         W4z9QcdDysiX122QDvAs/bs1qd4+pFwXnYZal8Q2C67rDVPjl4W8AqJ7QblPD6eiifnf
         H/v3fPs4vMA14M1uSXNpz0qCpwY6Xqbh5DcXyUiTj8UweM/URYsP3UesxcZrEnEpNyhL
         EPcryjm43o9rVBDtEx50ZNTgw3QGCeKiz/RwJ/PANQDQ0MZGaPXAvQgMJu/xNwCbN2xh
         BuKs0w6RJXUS/Z3J1dyrOKzIXR9g9vWyKQUoMvKZzN+vQ70evWUbonCWVRTJ+v3/WipM
         vazA==
X-Gm-Message-State: AOAM533Jv3bxkewUoDaGvQagSo9/7HpV15rG/FmhqxHdUpjYz6A37WGr
	rw/+88uII+Si3a9W0ed03IPimvULXL8Sg8z0fRafhw==
X-Google-Smtp-Source: ABdhPJzWFJqq4vBBZ9oSiF99YbB7JP00V60CNeHb6sB3dmOCLQR5hIoOab/IOKpTDkysdkG1owqZozY04cVvTxkcmwU=
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr26837102pff.71.1629590300709; Sat, 21
 Aug 2021 16:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YSFgrLUfXzgcT6k4@user>
In-Reply-To: <YSFgrLUfXzgcT6k4@user>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sun, 22 Aug 2021 00:58:10 +0100
Message-ID: <CAA=Fs0kByg1NztU+Nf__RUzTHuVh_q2hvcyh+3JqXiVgn+_VeQ@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 21:23, Saurav Girepunje
<saurav.girepunje@gmail.com> wrote:
>
> Remove the condition with no effect (if == else) in rtw_led.c
> file.
>
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_led.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> index 22d4df9c92a5..76cbd5f19f90 100644
> --- a/drivers/staging/r8188eu/core/rtw_led.c
> +++ b/drivers/staging/r8188eu/core/rtw_led.c
> @@ -148,10 +148,7 @@ static void SwLedBlink(struct LED_871x *pLed)
>                         _set_timer(&(pLed->BlinkTimer), LED_BLINK_SLOWLY_INTERVAL);
>                         break;
>                 case LED_BLINK_WPS:
> -                       if (pLed->BlinkingLedState == RTW_LED_ON)
> -                               _set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
> -                       else
> -                               _set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
> +                       _set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
>                         break;
>                 default:
>                         _set_timer(&(pLed->BlinkTimer), LED_BLINK_SLOWLY_INTERVAL);
> --
> 2.30.2
>

Thanks for this, looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
