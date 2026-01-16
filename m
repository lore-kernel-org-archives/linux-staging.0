Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEBA361664;
	Fri, 16 Jan 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560498; cv=none; b=bMYhtC40TYVgxZS1LNQd4MRBRqhSIx/zKASeEZ0pXWJHrh1N/SzoxL0PcdkWLSWcN22zg6aLpRrceu/czxiefvacxmTMzHv1Ht4nNdAw8eQ4g7n3Kd4dQkgIEylKNJh/uXkatY4kYIrR2udY+2oEa9WvspkDg4wNDp1nZKK6ksE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560498; c=relaxed/simple;
	bh=iCJ6EbP46EjJMBrDIjaB7dUG2DlJCwr/o18twaR+bwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WArR7xvnJyG0ZtJ8LV/GQbtGYXLyaZ41byLMyD2WLqdkAZAc3X+58ITDHXxie8otfHyoILtCEywxYI2b8/IbgV84JjpVM0UQwLLzHv40wpw1JW1aid7NN6wZ8t+u4yMOMmYPTE3pBqHFbQsdgGOqlce6NI0JZ7g29E52GDlhrlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8BO3iI3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8BO3iI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D01C19421;
	Fri, 16 Jan 2026 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768560498;
	bh=iCJ6EbP46EjJMBrDIjaB7dUG2DlJCwr/o18twaR+bwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8BO3iI3REI0cRSwbIDBlrZKN6g/X7qSWwnQvasUw4nFuGbsy7vwwgX6XFZNx6EQH
	 CICsQPzQcttohPQK9iGBC/IIL3u/FmjSrE3/ORieqnVkOsQiqSoyVRBkaglgIXGFVt
	 gzkybH7VoyT4PYlpt4TzYDsnNDMlXeE7HVIM2in/lXdJlF1lwinVhayq7FSpjZlS1O
	 IdMOzvksIlqjulc8tsMkiIAli53UbFtoVph3YKEMSi+xuqe94vbibIDAKGrBpb88kc
	 dQXhDLVj1wPBzXNOUi6hSMoLy89U/jutJ/FlzoKLZKWQ92qOOPii/153rQNaOK7wHX
	 gJ0pxJJS5T0Xw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vghNF-000000006XR-3elc;
	Fri, 16 Jan 2026 11:48:14 +0100
Date: Fri, 16 Jan 2026 11:48:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
Message-ID: <aWoXbQYqVeahIxc8@hovoldconsulting.com>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <aWdgCblk91iJE4T2@hovoldconsulting.com>
 <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>

On Wed, Jan 14, 2026 at 04:28:33PM -0800, Randy Dunlap wrote:
> On 1/14/26 1:21 AM, Johan Hovold wrote:
> > On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
> >> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
> >> tree. Drop it since it unused.
> >>
> >> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
> > 
> > As the commit message of that commit says this was done on purpose to
> > allow the driver to be compile tested without the out-of-tree driver
> > that never went upstream.
> > 
> > These days we have a USB hub driver that should probably be used
> > instead, but yeah, someone would need to do the rework.
> 
> We?
> Do you mean drivers/usb/core/hub.c?

I meant the on-board hub driver (now renamed to "on-board dev") which
did not exist when this greybus driver was written and merged to
staging:

	drivers/usb/misc/onboard_usb_dev_pdevs.c

> >> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
> >> -#include <linux/usb/usb3613.h>
> >> -#else
> >>  static inline int usb3613_hub_mode_ctrl(bool unused)
> >>  {
> >>  	return 0;
> >>  }
> >> -#endif
> >>  
> >>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
> >>  
> >> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> >> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> >> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
> >>  
> >>  config GREYBUS_ARCHE
> >>  	tristate "Greybus Arche Platform driver"
> >> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
> >>  	help
> >>  	  Select this option if you have an Arche device.
> > 
> > The above just seems to hide the fact that the driver currently cannot
> > be used.
> > 
> > Can you please at least add some kind of TODO comment to indicate that
> > the driver should be reworked to drop the dependency on the OOT driver?
> 
> Sure, I can add that, but I think it needs more info. Reworked how?
> What should the usb3613_hub_mode_ctrl() function do?

IIRC, this driver exists since we needed to power on the on-board USB
hub so that the controller could be enumerated. Since there was no
support for doing such things at the time in mainline, we have this
custom interface for calling into the out-of-tree hub driver.

I'd need to spend more time looking at this to say exactly how this
should be reworked.

> > And it's probably best to keep the depends on COMPILE_TEST until that
> 
> ack
> 
> > has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in
> > 
> > 	#ifdef CONFIG_COMPILE_TEST
> > 	...
> > 	#endif
> 
> Don't think so. The driver calls usb3613_hub_mod_ctrl() in 4 places,
> so it needs to be there.

Not if the driver can only be enabled for compile testing.

Perhaps replacing USB_HSIC_USB3613 with

	depends on BROKEN || COMPILE_TEST

and adding a comment above the ifdeffed usb3613_hub_mode_ctrl() helper
would make the state of things more clear.

Or just keep the dependency on the non-existing hub driver symbol. 

Johan
