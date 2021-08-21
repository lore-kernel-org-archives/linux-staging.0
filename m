Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E105272
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:46:40 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id oc2-20020a17090b1c0200b00179e56772d6so6056439pjb.4
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vu1I56SlUB4H5MNFLJaRk7CI9dgtIkpJTCZCqyENsJo=;
        b=YQtkT+tqoJxn4EavjELNpI1oc5ZqmnIjhVgEVh3HZhAjpHmtNBTgxaVRTKa3P29cAT
         WgqdWaMOff58vgruNGhX6SVoq3gnSnEFp93qt5XWEPWuWGOgzsT8vVyBGfDm4Jnf2/Bk
         xYlNmMfdfy4VpNcvLyQj5EkSdUFVnZ9UJ17kyOddD39NYb+AH470I6LSaZHG0IWQn+02
         b22Cp3yU1k17GTOJPeyO4d6zDz4b7Lu/iK2fUTMCVG5ossfDjEyIqz5ByBHlEULc1Ni4
         Zxguhc4/BYDcV1cDp7l6gKJJPYa/4UQwHTc1I0noFAXalRgMmSP028zScaWvp1bkJ8JO
         OX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vu1I56SlUB4H5MNFLJaRk7CI9dgtIkpJTCZCqyENsJo=;
        b=TvFx/Qfaahs93gzw97zilLrKjfJ+IWxbf70LBFY76glgtMolDRRXbz2Gt/ZfkuXpSr
         rijX5VV2vSFTEIcsSDOR7z+M0f+4qSbddswST+V/Z50HnLf2h3E+caM/bE4eBQkX2p/V
         GxAvWlVF47yD9+P8LG7K+hkdAQ5aHfdlN/cpj5mX4Q/0+P4OEJkv3P8vGfodRAvR6Sk0
         BgNdYa7cz20HSby4UDXHLjOh2M0zNp/Y6+Rk734E9HyzFpp6FCDbAXjrYwT61Pf5x/XH
         WYJbykqBrp2s+cbXtaYLQluSax91nReN7lomphgqkWxGgkW2HY89uywI/ds8pFb0Kfv/
         eHiw==
X-Gm-Message-State: AOAM531GDMIjaf1plW/xNIc6tqu4WiuYdavGgBtjinAtLOyrph2z61Ie
	ZOZXt7/BmhcvhGWXOgxwTUl9cCApbHUhETy9toiRSA==
X-Google-Smtp-Source: ABdhPJwQkFaAK05n5mpz4eB+v1YRaPrVMP1AkRNqQiA3PUBmA8nhYh9IeIUFwb0sq3WTL7ih0BVpRQpl63ORCQA62vI=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr10969934pjq.217.1629568000545;
 Sat, 21 Aug 2021 10:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-7-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-7-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:46:29 +0100
Message-ID: <CAA=Fs0mEiBT81ZE=NMNOw95ezsZ_omqSyGJcLDBL8fxWRfLeqQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] staging: r8188eu: clean up the usb_writeXY functions
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:49, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Remove unnecessary variables, summarize declarations and assignments.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 50 ++++-----------------
>  1 file changed, 8 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index cb969a200681..e01f1ac19596 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -128,59 +128,25 @@ static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
>
>  static int usb_write8(struct intf_hdl *pintfhdl, u32 addr, u8 val)
>  {
> -       u16 wvalue;
> -       u16 len;
> -       u8 data;
> -       int ret;
> -
> -
> -       wvalue = (u16)(addr & 0x0000ffff);
> -       len = 1;
> -       data = val;
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_WRITE);
> +       u16 wvalue = (u16)(addr & 0x0000ffff);
>
> -       return ret;
> +       return usbctrl_vendorreq(pintfhdl, wvalue, &val, 1, REALTEK_USB_VENQT_WRITE);
>  }
>
>  static int usb_write16(struct intf_hdl *pintfhdl, u32 addr, u16 val)
>  {
> -       u16 wvalue;
> -       u16 len;
> -       __le32 data;
> -       int ret;
> -
> -
> -
> -       wvalue = (u16)(addr & 0x0000ffff);
> -       len = 2;
> -
> -       data = cpu_to_le32(val & 0x0000ffff);
> -
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_WRITE);
> -
> -
> +       u16 wvalue = (u16)(addr & 0x0000ffff);
> +       __le32 data = cpu_to_le32(val & 0x0000ffff);
>
> -       return ret;
> +       return usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
>  }
>
>  static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
>  {
> -       u16 wvalue;
> -       u16 len;
> -       __le32 data;
> -       int ret;
> -
> -
> -
> -       wvalue = (u16)(addr & 0x0000ffff);
> -       len = 4;
> -       data = cpu_to_le32(val);
> -
> -       ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_WRITE);
> -
> -
> +       u16 wvalue = (u16)(addr & 0x0000ffff);
> +       __le32 data = cpu_to_le32(val);
>
> -       return ret;
> +       return usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_WRITE);
>  }
>
>  static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata)
> --
> 2.20.1
>
Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
