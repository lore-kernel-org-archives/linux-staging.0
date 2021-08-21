Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68172
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:45:16 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id y23so12440278pgi.7
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kF6aHsrAj7KUVldSv2hRrmUYmHo9pqAIsV/DNdAO92I=;
        b=w5MLn0PH0pocM4tRhMdT6Jp21GHTHt3O05eDb6/VtoU3KlJ5rDDMkk1HfFu8ap0QJx
         QFZAWKuMnI0lksoN19rfZN/TaeazW6B0aCFmDdA3Apj30+0wvb2De4cdhTzgVLrGvPHh
         1aY0Dl41hPouBDKxHDy0846SrM2qWmBNPxULtSJMlNUtyrkCrqB2GhGSuhb5Tm6v8mZ8
         OxtjRIwHOxOfazg8I/o1pVJrRbLcjqwql5Fl8m70IeiEOKSHx5u1NFK1mSn8khQJfl2J
         H/RwlOvpIoDJ2I0AlntVsicY6JKUFhSx0Btn+w2z8inh9SXVj4iioXiht9YTN2neNxq9
         CA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kF6aHsrAj7KUVldSv2hRrmUYmHo9pqAIsV/DNdAO92I=;
        b=ZwMVVdZIkqicGfmE625midQk+YpKiIQ6cAeepB7G4lzY5J9RsnNM2Yvt1KLfky5ad9
         0gh4tjRBmmcNAjH9rxA6UghlJ7La7zFvbPh1YxpzLLmhXHEpKwTp1FvEZQc/MNBLLQYc
         YEzVAX7uuSLC8RJoBQu31/HVOE2e+LWQ+nPdF1Ts5vYGVHSIO9hiIWAdCC+WRvKwo4go
         IlvIpWjS2MJV0iSQAz5QRjZ2pjH8ugGF+2+BGOORvzK/EaTZ3ruIIsd83JDC9+VGljgv
         9CLwA+pM9QxDU5lETSyqHAwPJidgCRicBK84xpPyxrEjVyZBlVou5rg5Ebi0PgL7uJ0h
         rWHA==
X-Gm-Message-State: AOAM533T3SSbFhDUxX82QBI7zdYl4k2+ez8lsTbpRo719DmpegVglkZR
	yby1VwCD9DpSyvgC1aqOeYqILtR4cZ78bS4o2mtlD0hWCrOSHIViY2Q=
X-Google-Smtp-Source: ABdhPJzgeb4c2OgI2VGn1CCT3EcAui9DerXhEPu7Rr1rFXmPt9mUs1zz0sMMQ8EVCkXkgh7BtSZl1hZBqTtuvY8m4Ak=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr24547403pgo.208.1629567916187;
 Sat, 21 Aug 2021 10:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-4-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-4-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:45:05 +0100
Message-ID: <CAA=Fs0mETti1k5=m0yzE+zwN6etRyGeRGAGBKtWy-9d3oDix1Q@mail.gmail.com>
Subject: Re: [PATCH 04/10] staging: r8188eu: rewrite usb vendor request defines
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:49, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Replace the numeric values with USB constants to make their
> meaning clearer.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/include/usb_ops.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
> index 5d290199e37c..b6a1cd536adf 100644
> --- a/drivers/staging/r8188eu/include/usb_ops.h
> +++ b/drivers/staging/r8188eu/include/usb_ops.h
> @@ -8,8 +8,8 @@
>  #include "drv_types.h"
>  #include "osdep_intf.h"
>
> -#define REALTEK_USB_VENQT_READ         0xC0
> -#define REALTEK_USB_VENQT_WRITE                0x40
> +#define REALTEK_USB_VENQT_READ         (USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE)
> +#define REALTEK_USB_VENQT_WRITE                (USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE)
>  #define REALTEK_USB_VENQT_CMD_REQ      0x05
>  #define REALTEK_USB_VENQT_CMD_IDX      0x00
>
> --
> 2.20.1
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
