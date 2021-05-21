Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4670
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 17:02:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84F83613D9;
	Fri, 21 May 2021 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621616529;
	bh=MA5it5WuPvv7lr+0xWzw4mBcIXDCBxAbqbu3dFK6ic4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUE6CqOcWpxb9OrMW4GI+CXHksdKOMwEIUSE3URi7Nw+T0BZNlxmWiJIQF/slz93F
	 N8pFwrm27lEI3DjpVyx73IqDmlBB0cPVzxiTa1XkrD2bHnhg0DkOVm85eYNPeFNBur
	 xMqzzlji+XJe9ANMK53hlBZ0bj8eMm2ibmv3ZjB8=
Date: Fri, 21 May 2021 19:02:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	rkovhaev@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] staging: rtl8712: Fix memory leak in
 r8712_init_recv_priv
Message-ID: <YKfnjYAsNzbfJh1d@kroah.com>
References: <20210521162519.677074-1-mudongliangabcd@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521162519.677074-1-mudongliangabcd@gmail.com>

On Sat, May 22, 2021 at 12:25:19AM +0800, Dongliang Mu wrote:
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
>  	struct usb_device *udev = interface_to_usbdev(pusb_intf);
>  
>  	if (pnetdev) {
> +		struct net_device *newpnetdev = NULL;
>  		struct _adapter *padapter = netdev_priv(pnetdev);
>  
>  		/* never exit with a firmware callback pending */
>  		wait_for_completion(&padapter->rtl8712_fw_ready);
> -		pnetdev = usb_get_intfdata(pusb_intf);
> +		newpnetdev = usb_get_intfdata(pusb_intf);

Please learn a bit more C knowledge before messing around in the kernel
tree.  Between the mistake in this chunk you added, and the mistake in
the previous submission, I think you need more experience here as there
are some things you still need to learn.

Best of luck!

greg k-h
