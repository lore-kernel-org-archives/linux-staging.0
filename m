Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0772
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:47:15 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id x1so5206293plg.10
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dp139urNDxO4JTlPsXpj0kyL07J5UAiGj94dEKj6njg=;
        b=gYP3msuCsJfbPlYUKun+IfeDkptAAhdgN9OaIizYT0MZ3LV4l6g29qvogUOKmtO8+k
         koODEopMSx0JERsR18i8WFduTgbPTk6mkDnl59y9lbf43eSOrqUA2AzNfA74xehNqwx0
         NiRZ+t5YA18yHKBIcZ3H4PVKRImO1vPHwLkb72KEB4sLvkQjC6cfMh1l8TyymaRoCTUv
         /oWptnjpCr5Tn+L7W8n/kj3oHGjk0YzzDlJ2RnMQxCggo5JkpDRnz7gq7FwgUYGGEeLk
         b6LWnXrpW7JxmrS/8gAS+xFvSU1jiUuDA+iWTdQq7Qsg7X3gkR0EG+vtXdfksZJEqqXi
         SYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dp139urNDxO4JTlPsXpj0kyL07J5UAiGj94dEKj6njg=;
        b=QrQFja4aUzgQzBfKkbKr/+tONkRhGSfh30jP0zit9TU91RvMbUwgpKMrbsQuCBpo0t
         UODu+0IG4XLZPGfdHFihVNkyA/tYlSkUiSJNm6h7uA+qiFxUzvnjt0+JOOHIozNjIPRj
         e1rB2/mRwvEQ7umx3k25R47Mi9s4LhQ5vO7YD5i4+eQtVDDR2dxwcUOHVF/Xcrffb/Wx
         /moR+Eytu9f/8kS5dczGxSivmK3kbA+989rswjikNLu02vBJB9Qjn9ww9fcLC06LmF0Y
         4PblqpYQ6uQmbLNGBFM/Nd/GJ/k0SUcJBh59pr3yhQvSHVhYXDzrAc4KnVbkf8r1U0dT
         I5Lw==
X-Gm-Message-State: AOAM5308tataxNPtiyOR8TrgxdF/lTVz+UV8/jB8BZmHLWo/dcVDRu2x
	0z/l9X7NXWRdNUQKdl8H+SMmIBD7GvzPshr/9YJHMA==
X-Google-Smtp-Source: ABdhPJw1nUSZoC4Fgk6EAnr9TD8XGUM4E2iez0dfvw9SB3n+JzfIrzRr2uVctHs1MYga5xfnT0XYA0JLgFGvdk+rYzQ=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr21546731plo.37.1629568035580; Sat, 21
 Aug 2021 10:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-8-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-8-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:47:04 +0100
Message-ID: <CAA=Fs0nuut-+dqCMOB-QU0j7ecUV8y5b42cmsj36H9FAN5Y4xg@mail.gmail.com>
Subject: Re: [PATCH 08/10] staging: r8188eu: clean up the usb_writeN
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:50, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Remove unnecessary variables, check the length.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index e01f1ac19596..5408383ccec3 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -151,20 +151,15 @@ static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
>
>  static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata)
>  {
> -       u16 wvalue;
> -       u16 len;
> +       u16 wvalue = (u16)(addr & 0x0000ffff);
>         u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
> -       int ret;
> -
>
> +       if (length > VENDOR_CMD_MAX_DATA_LEN)
> +               return -EINVAL;
>
> -       wvalue = (u16)(addr & 0x0000ffff);
> -       len = length;
> -       memcpy(buf, pdata, len);
> +       memcpy(buf, pdata, length);
>
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, buf, len, REALTEK_USB_VENQT_WRITE);
> -
> -       return ret;
> +       return usbctrl_vendorreq(pintfhdl, wvalue, buf, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
>  }
>
>  static void interrupt_handler_8188eu(struct adapter *adapt, u16 pkt_len, u8 *pbuf)
> --
> 2.20.1
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
