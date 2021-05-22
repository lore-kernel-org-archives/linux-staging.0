Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9269D70
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 00:44:36 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id et19so25870118ejc.4
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 17:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xKufOdTA0IDQaVHCUEydAsDz+LCNGA7EJicC4zXyjAE=;
        b=JGk3UHtAI5QxjcGp02y0zo7b3sQDTM7jAlpgJjP1D2OeeSYCxi0EVBfN3+4gXl8Br+
         /HHrmyYUpszbjxoqfZQG4cz+Pl+pVo5byMq1CfBKnU+vJu5MvnKruhojl/mnUlSnIVrz
         IH5buevJO4hUrUdSMqtOX0LnoaDBpOYhUMD8btClUPiiloiAbswcuO2f5DcUNBN6I2Z6
         weSOznICMFbkkGwjEwVNacB8JLvj1JHBzP0nNLql56UU/dNRhWIN/CiNgYzA98S4ChOH
         JzuBi1+VDKwrXc2cENYFaj1MEnzpptC9dyom4psYlXnJ3zQBrwMdR2al8hGVXS+6pjiY
         RhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKufOdTA0IDQaVHCUEydAsDz+LCNGA7EJicC4zXyjAE=;
        b=dKAjS0vYeJOYjimKSUqMfyFme2uxT9007axi9zQMFGdR7MUVZvIMLeCoHq3MoXGkt/
         b+FTLoNXpmGhYaTC9un7g91/seF1o2TytuRwI46gU1Y9CIzoKkLKTpmef5glL9KyncxG
         CDVczzj1D1jE0++KXFwRCezvZbPzaoh6oIiBDiKXLAysdjhUGqwP4tyUudd453MmdvcM
         8WnaJIHwxI8h9xNcnyhl+zQoEFHFzcu3QF1lDA3srcrJzYy7PY2pQ8BOX0/0g7c7avXA
         xJJEBwa72WcyCFNQc6Zo2B04YrsGwuQyPvQWwESrVzJ0JG6A5oW6AQDsyZPTGwkyb/DL
         NbWA==
X-Gm-Message-State: AOAM533L5LTf31+sWEBuhAVVoDGR/sHaQrxhSL8W6DaruCv03Z2yu6BX
	NWy+5vgLHcNV8EEiTtkYXlKI6/8e4J6tWvn0PqM=
X-Google-Smtp-Source: ABdhPJySxFmmty9MypAq5rhbBvS1a6T3Pao+pMUqtLUfiDd6sRCF8pDdVx0MRZi4xButyiCbgl2gGtrUrQpwXq7sDfA=
X-Received: by 2002:a17:907:1002:: with SMTP id ox2mr12370999ejb.337.1621644275147;
 Fri, 21 May 2021 17:44:35 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210521162519.677074-1-mudongliangabcd@gmail.com> <YKfnjYAsNzbfJh1d@kroah.com>
In-Reply-To: <YKfnjYAsNzbfJh1d@kroah.com>
From: =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date: Sat, 22 May 2021 08:43:25 +0800
Message-ID: <CAD-N9QWiu=6QefJaWzfUS3ep-8so+KBv-=S0LQs+EqO3tf8Cew@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	rkovhaev@gmail.com, straube.linux@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, May 22, 2021 at 1:02 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, May 22, 2021 at 12:25:19AM +0800, Dongliang Mu wrote:
> > r871xu_dev_remove failed to call r8712_free_drv_sw() and free the
> > resource (e.g., struct urb) due to the failure of firmware loading.
> >
> > Fix this by invoking r8712_free_drv_sw at the failure site.
> >
> > Reported-by: syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
> > Fixes: b4383c971bc5 ("staging: rtl8712: handle firmware load failure")
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> > v1->v2: fix the initialization of pnetdev
> >
> >  drivers/staging/rtl8712/usb_intf.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> > index dc21e7743349..57e773464e18 100644
> > --- a/drivers/staging/rtl8712/usb_intf.c
> > +++ b/drivers/staging/rtl8712/usb_intf.c
> > @@ -593,13 +593,14 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
> >       struct usb_device *udev = interface_to_usbdev(pusb_intf);
> >
> >       if (pnetdev) {
> > +             struct net_device *newpnetdev = NULL;
> >               struct _adapter *padapter = netdev_priv(pnetdev);
> >
> >               /* never exit with a firmware callback pending */
> >               wait_for_completion(&padapter->rtl8712_fw_ready);
> > -             pnetdev = usb_get_intfdata(pusb_intf);
> > +             newpnetdev = usb_get_intfdata(pusb_intf);
>
> Please learn a bit more C knowledge before messing around in the kernel
> tree.  Between the mistake in this chunk you added, and the mistake in
> the previous submission, I think you need more experience here as there
> are some things you still need to learn.

I am a kernel newbie in developing patches for Linux kernel. Sorry for
my naive mistakes. I will learn more and then submit some "good"
patches.

BTW, I think I have pointed out the underlying bug here, you guys can
fix it yourself.

>
> Best of luck!
>
> greg k-h
