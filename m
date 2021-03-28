Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6CE70
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 17:57:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A191361930;
	Sun, 28 Mar 2021 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616954247;
	bh=h7lWtpzr+nzRZm5zIxllBaJjD+FGFNmyTDDl8+aq6nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWdGrspgcZd4s0pFLcCeC1CHp1QWXfeRkGjOruxs9P1EQAI5u+zKmgeYn699xv0YM
	 i/2IR7pvK+PNrYnRbj5Me9s1CsVJHMRD/44yYzz0L12lvqiORm7QbixxA1edgjkASr
	 bXaf6H0oxrNRDyC1XTvlXA33bi2xd+lbQvz039DM=
Date: Sun, 28 Mar 2021 19:57:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: (trivial) remove a duplicate comment
Message-ID: <YGDDhGvTfd3eGbCz@kroah.com>
References: <20210328175200.27069-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328175200.27069-1-martin@kaiser.cx>

On Sun, Mar 28, 2021 at 07:52:00PM +0200, Martin Kaiser wrote:
> Keep the one that shows the wakeup capability.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/rtl8188eu/os_dep/usb_intf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> index 91a3d34a1050..e18f1fff59ca 100644
> --- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> @@ -377,7 +377,6 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>  		dvobj->pusbdev->do_remote_wakeup = 1;
>  		pusb_intf->needs_remote_wakeup = 1;
>  		device_init_wakeup(&pusb_intf->dev, 1);
> -		pr_debug("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~~~~\n");
>  		pr_debug("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~[%d]~~~\n",

This does not match your subject line, it is not a comment.

thanks,

greg k-h
