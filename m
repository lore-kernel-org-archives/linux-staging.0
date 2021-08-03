Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250BF70
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 05:16:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A2F96023F;
	Tue,  3 Aug 2021 05:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627967774;
	bh=BD3EfVSm5ZmZYCUw/owaWZws+ZrwBusi9GEntH+libY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFClKNbEqUL85oHwHn4xjatoR4E5iYO4AuqK231Pcn41tJtZ+mdm7ik9BfaNHFIey
	 lZJfe/pbwnpYRWxeMg+BVJQDNcKSpBG0xKTOhr8JOhwdpnW1VO17dl8McybJh3WkBN
	 uiwMJ7bkXSk7f27vFyNnqzQsz+qXdNfda93c+zdA=
Date: Tue, 3 Aug 2021 07:16:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Salah Triki <salah.triki@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Amey Narkhede <ameynarkhede03@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gdm724x: get lock before calling
 usb_[disable|enable]_autosuspend()
Message-ID: <YQjRHLpJtvdavYjj@kroah.com>
References: <20210802223703.GA1425480@pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802223703.GA1425480@pc>

On Mon, Aug 02, 2021 at 11:37:03PM +0100, Salah Triki wrote:
> Based on the documentation of usb_[disable|enable]_autosuspend(), the
> caller must hold udev's device lock.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/staging/gdm724x/gdm_usb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/gdm724x/gdm_usb.c b/drivers/staging/gdm724x/gdm_usb.c
> index 54bdb64f52e8..31b3b3e563c8 100644
> --- a/drivers/staging/gdm724x/gdm_usb.c
> +++ b/drivers/staging/gdm724x/gdm_usb.c
> @@ -846,7 +846,9 @@ static int gdm_usb_probe(struct usb_interface *intf,
>  	udev->intf = intf;
>  
>  	intf->needs_remote_wakeup = 1;
> +	usb_lock_device(usbdev);
>  	usb_enable_autosuspend(usbdev);
> +	usb_unlock_device(usbdev);
>  	pm_runtime_set_autosuspend_delay(&usbdev->dev, AUTO_SUSPEND_TIMER);
>  
>  	/* List up hosts with big endians, otherwise,
> -- 
> 2.25.1

Please look at the other places where this function is called and note
that the pattern you have added here is not used in those situations
either, so perhaps this change is not correct at all.

thanks,

greg k-h
