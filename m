Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114F3398B;
	Sat, 18 Jan 2025 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737214581; cv=none; b=tsc4lbNnFVbVoeTRI5IsOEso2LFhKDUZk+XIX50LQr27+XMiiztxGkkFnSU7nqaZD1mw8pOD36atYAe3I5IWAHdD9bi/02nJ2G5X0/pK8FPMECOqjvRHAavahjo+g9CltsbsBmtvLmQRx3cf9TXTMpWlG11kY3QV4iomH/eWn0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737214581; c=relaxed/simple;
	bh=FGUEcyT2DSvtnad3wlPHcECTW5eg7CVv90Vp9iD/2Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfDf+MBNzEgYjyfTM/DAlnZJvs5xuIAU95v23XnbklGPrYXcoWtsN0eaQuNRrziIAo8GUGiQLvSdKgSKHu+EBJJzZ+xMoNzl2P9jexRSPv3cJHtAeOLfRqe0ReRwYqK75oyz1cTLA3dqPRP7f2yF63NwQqB4cyerCCFlR8BgRjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ly4622M/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ly4622M/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F37BC4CED1;
	Sat, 18 Jan 2025 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737214578;
	bh=FGUEcyT2DSvtnad3wlPHcECTW5eg7CVv90Vp9iD/2Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ly4622M/nIxnM29641aIPu4gHPhVbc4ynK5hZdDJQhVtItAm9/1YwCgJKb+WHNoWe
	 zeRmK3yq7l1pO/kOXHFsmj5hXNAHSB5Za6N1IHt/Z0EktfWwtVQgo9JULotn1WYBXt
	 ew8RffVNMjAC0t834AykP+7r4PV5u19XKxJkNyTY=
Date: Sat, 18 Jan 2025 16:36:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: gpib: Fix NULL pointer dereference in detach
Message-ID: <2025011830-whoopee-dormitory-82da@gregkh>
References: <20250118145046.12181-1-dpenkler@gmail.com>
 <20250118145046.12181-2-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250118145046.12181-2-dpenkler@gmail.com>

On Sat, Jan 18, 2025 at 03:50:45PM +0100, Dave Penkler wrote:
> When the detach function is called after a failed attach
> the usb_dev initialization can cause a NULL pointer
> dereference. This happens when the usb device is not found
> in the attach procedure.
> 
> Remove the usb_dev variable and initialization and change the dev
> in the dev_info message from the usb_dev to the gpib_dev.
> 
> Fixes: fbae7090f30c ("staging: gpib: Update messaging and usb_device refs in agilent_usb")
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> index 34d85a1bdb37..2aaccebc3c7b 100644
> --- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> +++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> @@ -1442,12 +1442,10 @@ static int agilent_82357a_go_idle(gpib_board_t *board)
>  static void agilent_82357a_detach(gpib_board_t *board)
>  {
>  	struct agilent_82357a_priv *a_priv;
> -	struct usb_device *usb_dev;
>  
>  	mutex_lock(&agilent_82357a_hotplug_lock);
>  
>  	a_priv = board->private_data;
> -	usb_dev = interface_to_usbdev(a_priv->bus_interface);
>  	if (a_priv) {
>  		if (a_priv->bus_interface) {
>  			agilent_82357a_go_idle(board);
> @@ -1459,7 +1457,7 @@ static void agilent_82357a_detach(gpib_board_t *board)
>  		agilent_82357a_cleanup_urbs(a_priv);
>  		agilent_82357a_free_private(a_priv);
>  	}
> -	dev_info(&usb_dev->dev, "%s: detached\n", __func__);
> +	dev_info(board->gpib_dev, "%s: detached\n", __func__);

In the future, these dev_info() lines all need to go away as when
drivers work properly, they should be quiet.  I'll take this fix for now
as it's needed, just something to plan on for the future cleanups here.

thanks,

greg k-h
