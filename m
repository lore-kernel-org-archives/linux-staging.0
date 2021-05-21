Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8414E70
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 13:16:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98FBA60FEF;
	Fri, 21 May 2021 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621602970;
	bh=FBX0bD/QwvdgDqyMyPHYv4EF0W+AaSMy4yVziaV6zK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaynOVFrEGFp1JGLp8Yz2xZ71bQcR33Q0y0Imfy2P9XO4VAt04su53WlB0UeCQOsp
	 467Rbb3nEXq4oAPmk+jJxPmhtgrgGD67X/dVZL1JNxSBKNt2fvqXKo8RmGTijWzGDF
	 VqKokPZxODwfeQnAMUEazZ2qZXhafit4lf4AU7Ws=
Date: Fri, 21 May 2021 15:16:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	rkovhaev@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>,
	syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Subject: Re: [PATCH] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
Message-ID: <YKeyl6DL9rZylbKw@kroah.com>
References: <20210521120811.516339-1-mudongliangabcd@gmail.com>
 <YKelBRkGsLFz4byw@kroah.com>
 <CAD-N9QUgYy4j3wnJX1gwq902ggarFaQPBQ3cyUAArYxv22Q-bQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QUgYy4j3wnJX1gwq902ggarFaQPBQ3cyUAArYxv22Q-bQ@mail.gmail.com>

On Fri, May 21, 2021 at 08:24:58PM +0800, 慕冬亮 wrote:
> On Fri, May 21, 2021 at 8:18 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 21, 2021 at 08:08:11PM +0800, Dongliang Mu wrote:
> > > r871xu_dev_remove failed to call r8712_free_drv_sw() and free the
> > > resource (e.g., struct urb) due to the failure of firmware loading.
> > >
> > > Fix this by invoking r8712_free_drv_sw at the failure site.
> > >
> > > Reported-by: syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
> > > Fixes: b4383c971bc5 ("staging: rtl8712: handle firmware load failure")
> > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > ---
> > >  drivers/staging/rtl8712/usb_intf.c | 13 ++++++++++---
> > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> > > index dc21e7743349..a5190b4250ce 100644
> > > --- a/drivers/staging/rtl8712/usb_intf.c
> > > +++ b/drivers/staging/rtl8712/usb_intf.c
> > > @@ -589,7 +589,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
> > >   */
> > >  static void r871xu_dev_remove(struct usb_interface *pusb_intf)
> > >  {
> > > -     struct net_device *pnetdev = usb_get_intfdata(pusb_intf);
> > > +     struct net_device *pnetdev, *newpnetdev = usb_get_intfdata(pusb_intf);
> > >       struct usb_device *udev = interface_to_usbdev(pusb_intf);
> > >
> > >       if (pnetdev) {
> >
> > Did you test this?
> 
> For now, I only tested this patch in my local workspace. The memory
> leak does not occur any more.
> 
> I have pushed a patch testing onto the syzbot dashboard [1]. Now it is
> in the pending state.
> 
> [1] https://syzkaller.appspot.com/bug?id=3a325b8389fc41c1bc94de0f4ac437ed13cce584
> 
> >
> > I think you just broke the code right here :(
> 
> If I broke any code logic, I am sorry. However, this patch only adds
> some code to deallocate some resources when failing to load firmware.
> 
> Do you mean that I replace pnetdev with the variable - newpnetdev?

Yes, and then the first thing the code does is check the value of
pnetdev which is totally undefined :(

