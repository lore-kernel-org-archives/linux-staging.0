Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B172
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:46:05 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id g14so11544172pfm.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e643qqBpZbVsYxKj5JDyFUKhkri+Obgg4OYZAYu/gYo=;
        b=dB6oKr6272zP2J0nsocz3sbh4JD/sTQUm64Irx4HVYVJ+htD5Ii3GmO1psnQ5KJjtb
         FHpTmIXEEI3KGhpmCuETVT4RCxQZiiE2az3U2ZGjGHe159h9tT2R9L+aYxGGQSZmjdmQ
         U3W2z3N7XYbps7vkjU2MvE08dOxREVlvidr7ei7zZlc4JCGj03e4uHFznCDiDnS3eiDQ
         s29DyQ+I4oN0/Ay71fpo3SnY3eoV/DmP/4E5eoCiqiqWOiJ995nGvfhhgw4xwEDdlpJD
         eZ8JWNeyBMT5+zlpzhMe+4JAKgQSFrbuVsulMvx1502KTGTn+dvRsV6kT5yhgq4+02RF
         dV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e643qqBpZbVsYxKj5JDyFUKhkri+Obgg4OYZAYu/gYo=;
        b=S7X7SKFA2WqBHnWBiryo5Vq7cWl7y0DlIsqmqWuUlps/gZKvGKXLkizk7A6k7l/XG8
         dL6PluktNFW3VuEMxUlNcE/I62z9ipuvPupG6RP1ow7Ep8qSSf+1yzumSsPJYFc6FzH6
         KEXYA9MNHqC2uXTAmsg7v2UPAuo6XSiMz6edBIguOVZzRDWaPEnDzp4nFk8fjxRjGoZn
         4v51lrsJeyD84qChI6HDWpUNoFVIgOt4sHGa6avlFSQhCxhPAZbwimFJvKWHWxduvwpk
         nCd1vX18msyUvkHmK1eePoybrq0Y8pm0+L6+oTPrZVth5Y2AZv9jojVbMtzAL/ApLliC
         VU/Q==
X-Gm-Message-State: AOAM530MBnhcwWBSVh+c2TpBsiHKD89r2p9kBzO/ve/I6ed45ph9SlYg
	MUfRjd41W5VMGtX2sAjp5BxNXsHAFogaCToElsMVTA==
X-Google-Smtp-Source: ABdhPJwL58zI4l4ayQVs4fPyY/3JBK9jVnPC9GHrGu7JQhBAWTCpfcYcrnEJK+QQcuM/Cz12RXl/7159ebiRSYn2paY=
X-Received: by 2002:a63:d910:: with SMTP id r16mr24179672pgg.318.1629567965414;
 Sat, 21 Aug 2021 10:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-6-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-6-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:45:54 +0100
Message-ID: <CAA=Fs0=PHibU5SbfvEyepdzgdbxpFtX0zCnS72JnyOSLBHPKCg@mail.gmail.com>
Subject: Re: [PATCH 06/10] staging: r8188eu: clean up the usb_readXY functions
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
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 30 +++++----------------
>  1 file changed, 7 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index dccb9fd34777..cb969a200681 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -98,46 +98,30 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>
>  static u8 usb_read8(struct intf_hdl *pintfhdl, u32 addr)
>  {
> -       u16 wvalue;
> -       u16 len;
> -       u8 data = 0;
> -
> -
> -
> -       wvalue = (u16)(addr & 0x0000ffff);
> -       len = 1;
> -
> -       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_READ);
> -
> +       u16 wvalue = (u16)(addr & 0x0000ffff);
> +       u8 data;
>
> +       usbctrl_vendorreq(pintfhdl, wvalue, &data, 1, REALTEK_USB_VENQT_READ);
>
>         return data;
> -
>  }
>
>  static u16 usb_read16(struct intf_hdl *pintfhdl, u32 addr)
>  {
> -       u16 wvalue;
> -       u16 len;
> +       u16 wvalue = (u16)(addr & 0x0000ffff);
>         __le32 data;
>
> -       wvalue = (u16)(addr & 0x0000ffff);
> -       len = 2;
> -       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_READ);
> +       usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_READ);
>
>         return (u16)(le32_to_cpu(data) & 0xffff);
>  }
>
>  static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
>  {
> -       u16 wvalue;
> -       u16 len;
> +       u16 wvalue = (u16)(addr & 0x0000ffff);
>         __le32 data;
>
> -       wvalue = (u16)(addr & 0x0000ffff);
> -       len = 4;
> -
> -       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, REALTEK_USB_VENQT_READ);
> +       usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_READ);
>
>         return le32_to_cpu(data);
>  }
> --
> 2.20.1
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
