Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B6570
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 16:30:50 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i13so23975647edb.9
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8OVoD/UCRoREhZUYu+gQHmOs+0flAlDPXRHdAtK/ig=;
        b=PoGp9f92+J7n+WBDGANlXbv0XTlKt4uZR02F3eFObRXhqT+x4PzglaqikIOZmgcB6U
         XFV1RXWXbhQPXxvsBP93SVbI6OBpsjF66rjp3+Z1Z3YpcJ4WfWs1I6SOQiY4g2P1DDPM
         LK2fdyjXowUysONkC/KA22FCrJPNEgeWaNurRx/s4FVbyOQXD63vFaPihQWiRIYCEIN3
         Ls8gskDnWMyL00FGy3Sx1/0y3A714+xnRR1ZH68k1ezaC8cf4AY3m599Y1jkZcbuLx09
         jIf045xR+o0sG8KuyPFeCGCEDTcbc7AT+G0xBSourtF3C/vhfvJyQKpCAS3G7Gq3Fx1H
         S4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8OVoD/UCRoREhZUYu+gQHmOs+0flAlDPXRHdAtK/ig=;
        b=fjKuRISEFeQFpgjfqBiocZLMrPviVz8YFL+V7VpuyQeKkztvsHgeV8BwfIzTKLoUZ9
         LUEbYcOTbpvqg963GDoxW5z6If128CfLzcKJXVi2GtZxL8Cpx0vM+5YrWxcO3E5Uqr44
         2fNUQZsy4xQ4dq5utA5Hi8URdFyrKvhZOtHVinmlLLC3pyopDoNpmIJDV1tnmWmsDWeG
         KPNXeUujZ5Y4pekxVZmoQpQo9e0rWS5+hNgLNTS3VF4npfQfBf0TOjcxLpLFy/KsdU5/
         OMvWTH7ah6lq2ausHC91fkEYJhIhTH1qOYHPygRkWWBs1uWG9a6XYh3YCNJC00V1TIu7
         ZGXg==
X-Gm-Message-State: AOAM530+5zRh0b4HsUrT8SymnYihf3yev6i4z46+izDL9DXVJISP8re5
	/YZQEuPiyc/ni+9NGe6DGSqR1WgRgTgR2uIPxLo=
X-Google-Smtp-Source: ABdhPJwh7svWqjQ0h5m/W/D+NxASqhWd8QCp1bCv/908crXNBOIjkw4kCEWj203qtkjoQswxzvS+HWnBp/VDvdTSRX4=
X-Received: by 2002:a05:6402:15:: with SMTP id d21mr8809748edu.66.1621614649421;
 Fri, 21 May 2021 09:30:49 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210521162519.677074-1-mudongliangabcd@gmail.com>
In-Reply-To: <20210521162519.677074-1-mudongliangabcd@gmail.com>
From: =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date: Sat, 22 May 2021 00:29:39 +0800
Message-ID: <CAD-N9QWMrEALHHweVZ1hgarzNQ3qi-+G0Qd44dP61AWTK4_yAQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	Greg KH <gregkh@linuxfoundation.org>, rkovhaev@gmail.com, straube.linux@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>
Cc: syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, May 22, 2021 at 12:25 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
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
> v1->v2: fix the initialization of pnetdev
>
>  drivers/staging/rtl8712/usb_intf.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> index dc21e7743349..57e773464e18 100644
> --- a/drivers/staging/rtl8712/usb_intf.c
> +++ b/drivers/staging/rtl8712/usb_intf.c
> @@ -593,13 +593,14 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
>         struct usb_device *udev = interface_to_usbdev(pusb_intf);
>
>         if (pnetdev) {
> +               struct net_device *newpnetdev = NULL;
>                 struct _adapter *padapter = netdev_priv(pnetdev);
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
> @@ -625,6 +626,10 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
>          */
>         if (udev->state != USB_STATE_NOTATTACHED)
>                 usb_reset_device(udev);
> +       if (pnetdev) {
> +               struct _adapter *padapter = netdev_priv(pnetdev);
> +               r8712_free_drv_sw(padapter);
> +       }
>  }
>
>  static int __init r8712u_drv_entry(void)
> --
> 2.25.1
>

I tested my patch in my local workspace. No matter for the latest
upstream or f40ddce88593482919761f74910f42f4b84c004b (the kernel
version for the first crash in the syzbot), my local workspace both
show the memory leak disappears once the kernel is patched. However,
syzbot testing shows it still triggers the memory leak. @Dmitry Vyukov
Can you please help take a look? Maybe I incorrectly use this feature.
Thanks in advance.
