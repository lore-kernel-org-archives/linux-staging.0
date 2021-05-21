Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333A70
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 12:10:17 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id s22so29904026ejv.12
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 05:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WEQXur4fHHNCbUkGisN9Mvm9Bkhht++DmG49GXVjdxc=;
        b=cS38JkZ2B1xj4stQHt9WIoVyEm4CvkrCowRF5mW7jIhrI/xCuBSRdZz+V0tvtFsG3+
         mMdcO+9h875uFiTKgfRa9kUWCM6xIBX8T+VJuKURTVYxLudIJaqkzP0FXgWCmGXuDHGu
         DAn2gI0aB9kfFMxiTB0ZZgWEMphBbQxLS37UBf9yrrNyuHwUTQLeFEDpAaFRHrWOZzUw
         9lfjwH1YvaO1xoTnhjiKMJMm+syivYt6EkS9Lu4AFn4V1OCL2LYweI2bG18lEgXUYTbT
         gqk5HfnqNxBHP0SdDBEvgaA4SEKUbPuxr5Kz4fg9NfK/hItQ9iHiPhQzpy/7c3vZ4zu6
         HK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WEQXur4fHHNCbUkGisN9Mvm9Bkhht++DmG49GXVjdxc=;
        b=eh7MvGUOQ/BrciltFWh4Y/dRP2vsKqIjwmU6+OPi/vu3saXqMAc3TwAzVaOr/rhn+X
         eraiSiK5xnJTVh+/1keDdXKGwVMqFxTzlnW4QZ0Y1+gDsQDd25RBEMUFS7skb8nlVpXE
         uBrLfyQXVucd45T5Vgw/sC4ZcgTPPifvK7UeIvTdyyVyuxUwbzNQWc+y7Ouffh5NZG5A
         aeuOCgO/WtVH3BhW9wIkZ7GASVhRQv4tfg4xXteANe7N+Wvv45jFqLFJpBH0xjcrcTnH
         f1XA5GALPVGSeqfG2sylkCcUVv24g6XGsI0htYHm6yDcJSo/CFRwbyo7aXqRCz3TdvQr
         k4DQ==
X-Gm-Message-State: AOAM533oJBJOdKClAwebcqpuh5sKiubtdlHxPWhiI6+Rkxpi1Y+UQhrG
	LmfBrs228LMPa99NEPXl4O0lABlOav0bb9BYVLw=
X-Google-Smtp-Source: ABdhPJxpNIzxd0YSkyamu5BEICCA7WZg2tqHLkDC/8e8LLRGzP8jqqSCC7ckt81BZ7FJ21mfAmlRIXnciFPZ90E/U8c=
X-Received: by 2002:a17:907:1002:: with SMTP id ox2mr9782899ejb.337.1621599015504;
 Fri, 21 May 2021 05:10:15 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210521120811.516339-1-mudongliangabcd@gmail.com>
In-Reply-To: <20210521120811.516339-1-mudongliangabcd@gmail.com>
From: =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date: Fri, 21 May 2021 20:09:06 +0800
Message-ID: <CAD-N9QX4A2dsDxS+oKvahHS8CC_Rt1iYCMABUEtR4NGJH5m1YQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	Greg KH <gregkh@linuxfoundation.org>, rkovhaev@gmail.com, straube.linux@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Cc: syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, May 21, 2021 at 8:08 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> r871xu_dev_remove failed to call r8712_free_drv_sw() and free the
> resource (e.g., struct urb) due to the failure of firmware loading.
>
> Fix this by invoking r8712_free_drv_sw at the failure site.
>
> Reported-by: syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
> Fixes: b4383c971bc5 ("staging: rtl8712: handle firmware load failure")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/staging/rtl8712/usb_intf.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> index dc21e7743349..a5190b4250ce 100644
> --- a/drivers/staging/rtl8712/usb_intf.c
> +++ b/drivers/staging/rtl8712/usb_intf.c
> @@ -589,7 +589,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
>   */
>  static void r871xu_dev_remove(struct usb_interface *pusb_intf)
>  {
> -       struct net_device *pnetdev = usb_get_intfdata(pusb_intf);
> +       struct net_device *pnetdev, *newpnetdev = usb_get_intfdata(pusb_intf);
>         struct usb_device *udev = interface_to_usbdev(pusb_intf);
>
>         if (pnetdev) {
> @@ -597,9 +597,9 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
>
>                 /* never exit with a firmware callback pending */
>                 wait_for_completion(&padapter->rtl8712_fw_ready);
> -               pnetdev = usb_get_intfdata(pusb_intf);
> +               newpnetdev = usb_get_intfdata(pusb_intf);
>                 usb_set_intfdata(pusb_intf, NULL);
> -               if (!pnetdev)
> +               if (!newpnetdev)
>                         goto firmware_load_fail;
>                 release_firmware(padapter->fw);
>                 if (drvpriv.drv_registered)
> @@ -625,6 +625,13 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
>          */
>         if (udev->state != USB_STATE_NOTATTACHED)
>                 usb_reset_device(udev);
> +       if (pnetdev) {
> +               struct _adapter *padapter = netdev_priv(pnetdev);
> +               /* Stop driver mlme relation timer */
> +               //r8712_stop_drv_timers(padapter);
> +               //r871x_dev_unload(padapter);

I am not sure if I should add those deallocation functions in this
branch. I will appreciate it if anyone can give some advice here.

> +               r8712_free_drv_sw(padapter);
> +       }
>  }
>
>  static int __init r8712u_drv_entry(void)
> --
> 2.25.1
>
