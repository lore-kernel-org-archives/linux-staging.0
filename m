Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF370
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 12:26:09 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b17so23149511ede.0
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/SES9st0MMJCDzZsStAlcXxLW6LgDl8DlkoGljECP8=;
        b=bL3nOloUg9ddy0iuHbn8BYu3mcEfrgPp/WVy7D4u+5AzXacck5TVjafZQ+Y/sW8emS
         w+AAukft58C6NRVuLoQolOzsJpV62fcdwWS4o0j8apIId2bWQDAFoh1cNf8/4Ypvtks6
         nenBks0sD3ZhIbs2mwTeMhDIq/WiwaUW1s5qIK9d8kFPpSAbBRFfQFm1KkqmE7JHS0Na
         nFjjAXYCOlkQmwsfeABBG9a5GuEzhR+Rwq0RvriokJlONfFJU4A33JVSG/Uzrk4ws+LS
         lTHze6Oa/6W6TA69iuQ35XiN0ADsCa1PylNE43lXFYks/dKwHfRJe/9ugy2tbhYmDQNk
         2kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/SES9st0MMJCDzZsStAlcXxLW6LgDl8DlkoGljECP8=;
        b=GWuJNdNcCDhWwCQrjFYMUOQFv8wITY2fqZGpeLQpCL5nX699N5ZHSIr6r0y7yKHG8Y
         hyf1IbavzCZXi7HxjeslMMOphWbNEru9k2xclWkMl6+0kkQzXXbbFbxV6PwKCZ5LYDLD
         bxPlw5wzsSNgg4qCuUXA3AtvgXsx5ZBRBUdNhaX9X94IQ/mMagMAkkmJrZ2pr45Fsous
         jSIEPF+fFL+bZ1B2lGNJEkV/PzrRd0ZP5q3oMBjoFQNCZlFlmc1E/xtvl7XodSzQDm83
         4i/M4HykxDmoP7LB00DS130vM0Ie/vavbecOfuiu7mACxQQfDskceK/kUnFlDPohPYFq
         wT1g==
X-Gm-Message-State: AOAM533PNbkHlRJRcQfIih519VbhGSioBdOeCtJUkJN/kkfSCsTh+v4E
	KtfTR71HYjGVwO5ZHxrOVcps22mVzWZMjE8nVRc=
X-Google-Smtp-Source: ABdhPJyVFoL4zM1kmrY/78qscmmvyrSNnnT//URUbsQPMqUwvwMJgoBSc7dbew1Ew9cgt1OFv8N9oCwh3Nk2Wi1MAZE=
X-Received: by 2002:a05:6402:1109:: with SMTP id u9mr11149356edv.174.1621599967673;
 Fri, 21 May 2021 05:26:07 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210521120811.516339-1-mudongliangabcd@gmail.com> <YKelBRkGsLFz4byw@kroah.com>
In-Reply-To: <YKelBRkGsLFz4byw@kroah.com>
From: =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date: Fri, 21 May 2021 20:24:58 +0800
Message-ID: <CAD-N9QUgYy4j3wnJX1gwq902ggarFaQPBQ3cyUAArYxv22Q-bQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	rkovhaev@gmail.com, straube.linux@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, May 21, 2021 at 8:18 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 21, 2021 at 08:08:11PM +0800, Dongliang Mu wrote:
> > r871xu_dev_remove failed to call r8712_free_drv_sw() and free the
> > resource (e.g., struct urb) due to the failure of firmware loading.
> >
> > Fix this by invoking r8712_free_drv_sw at the failure site.
> >
> > Reported-by: syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
> > Fixes: b4383c971bc5 ("staging: rtl8712: handle firmware load failure")
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  drivers/staging/rtl8712/usb_intf.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> > index dc21e7743349..a5190b4250ce 100644
> > --- a/drivers/staging/rtl8712/usb_intf.c
> > +++ b/drivers/staging/rtl8712/usb_intf.c
> > @@ -589,7 +589,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
> >   */
> >  static void r871xu_dev_remove(struct usb_interface *pusb_intf)
> >  {
> > -     struct net_device *pnetdev = usb_get_intfdata(pusb_intf);
> > +     struct net_device *pnetdev, *newpnetdev = usb_get_intfdata(pusb_intf);
> >       struct usb_device *udev = interface_to_usbdev(pusb_intf);
> >
> >       if (pnetdev) {
>
> Did you test this?

For now, I only tested this patch in my local workspace. The memory
leak does not occur any more.

I have pushed a patch testing onto the syzbot dashboard [1]. Now it is
in the pending state.

[1] https://syzkaller.appspot.com/bug?id=3a325b8389fc41c1bc94de0f4ac437ed13cce584

>
> I think you just broke the code right here :(

If I broke any code logic, I am sorry. However, this patch only adds
some code to deallocate some resources when failing to load firmware.

Do you mean that I replace pnetdev with the variable - newpnetdev?

>
> thanks,
>
> greg k-h
