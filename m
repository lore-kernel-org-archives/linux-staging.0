Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45515318BA4;
	Wed, 14 Jan 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382481; cv=none; b=a9cyjYuBVeeysPbozXmaqa8d6naEltKXChR8xExK+/spt0UOrXRuPsgA2J5P8soN7MJ99MISEndvlMFiMMHh3gEDq/KJys1VEHJUliqIacC+DvrQnvkq6F/m+DZJhGzlFD4fvx4GoyZGclSyenPDmovGqY/4swjRSJSiJpE/Iig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382481; c=relaxed/simple;
	bh=RiZtDJYUAJTA+wEkD7Xo+CUG4dhyfOyMyYtjam37kf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSLDgmZbXby/6hQ3On094QS+AaDQG8oYu1lTR7m/TzbS1mKKqdxnN/hYBRWWfIJteU7cdDzfS2nG0uQSfw1bRwrW1XscuFT1i4VlYZGbSPTtO/k9R9FGoOZcJ4daCFz7nETngeHbxpAgltOE4B5k+fxmbRUrRJnN5tpiu11nE6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wx4usfiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wx4usfiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F19C4CEF7;
	Wed, 14 Jan 2026 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768382480;
	bh=RiZtDJYUAJTA+wEkD7Xo+CUG4dhyfOyMyYtjam37kf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wx4usfiJgHXmqwlwjvvqIGtiFVVymaFvzEPmlCtfdiZOp9vKtTZpj3JV7I81OiY17
	 /dIrH0IX9DXPiSIeuXzn/4TQUMgIFfZZ9W57xSLhmt73YsU4SlJ3esNQ84d8OwAPxo
	 LGB+wWyKIv+QfiT5S4JrxNyKGteMfK5z2IJTmhH8spNKk9z/mv7+n2a6v/lc4ExrZQ
	 JydmKkicBrdMRvDZl7KKrzQ49VOloGlupw6mjz7gozknTBt7dZ1eHOWuCoF5mw7/p/
	 oJrp0Dsq2q3nvy6CI4n10xJW5V4wspJGigqhbN0TqdXB0bXxe8J6ZSsERQ/ZbWTbpU
	 zfLNPp3em8MHw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfx3x-000000007gZ-1gzr;
	Wed, 14 Jan 2026 10:21:14 +0100
Date: Wed, 14 Jan 2026 10:21:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
Message-ID: <aWdgCblk91iJE4T2@hovoldconsulting.com>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230062704.3339404-1-rdunlap@infradead.org>

On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
> tree. Drop it since it unused.
>
> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")

As the commit message of that commit says this was done on purpose to
allow the driver to be compile tested without the out-of-tree driver
that never went upstream.

These days we have a USB hub driver that should probably be used
instead, but yeah, someone would need to do the rework.

And while referencing the commit is good, I'm not sure a Fixes tag is
warranted.

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
 
> --- linux-next-20251219.orig/drivers/staging/greybus/arche-platform.c
> +++ linux-next-20251219/drivers/staging/greybus/arche-platform.c
> @@ -23,14 +23,10 @@
>  #include <linux/of.h>
>  #include "arche_platform.h"
>  
> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
> -#include <linux/usb/usb3613.h>
> -#else
>  static inline int usb3613_hub_mode_ctrl(bool unused)
>  {
>  	return 0;
>  }
> -#endif
>  
>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
>  
> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>  
>  config GREYBUS_ARCHE
>  	tristate "Greybus Arche Platform driver"
> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>  	help
>  	  Select this option if you have an Arche device.

The above just seems to hide the fact that the driver currently cannot
be used.

Can you please at least add some kind of TODO comment to indicate that
the driver should be reworked to drop the dependency on the OOT driver?

And it's probably best to keep the depends on COMPILE_TEST until that
has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in

	#ifdef CONFIG_COMPILE_TEST
	...
	#endif

Johan
