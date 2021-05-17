Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F3070
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 08:19:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EFB061285;
	Mon, 17 May 2021 08:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621239539;
	bh=YMJxBbd5NomzA9GZTlbdHn9jmA9o1/GA0kk6JvG6TcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3lO7O3I0fIoX/Jlep8hzzOWfDTxbEVhGjTkkAoTRHC8B7gDbkw0S0fJrb0+yyh+v
	 Rp6TTg/xJ/JNszezmGgpApYqgpS2gCKIbI2gj+CEQ4BZEUXT16+lFESJrpwzRRoN/3
	 GiK8dq8m41/DvVO3VChcSLZzTnrsxQ4Rm0VOY72U=
Date: Mon, 17 May 2021 10:18:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/17] Add an experimental driver for Intel NUC leds
Message-ID: <YKIm8TNJfXIMFl+W@kroah.com>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>

On Sun, May 16, 2021 at 12:53:28PM +0200, Mauro Carvalho Chehab wrote:
> Hi Greg,
> 
> This series add support for the LEDs found at Intel NUCs since
> NUC version 6.
> 
> On several NUC models, the function of the LEDs are programmable,
> which allow them to indicate several different hardware events.
> 
> They can even be programmed to represent an userspace-driven event.
> 
> Some models come with single colored or dual-colored LEDs, but
> high end models have RGB LEDs.
> 
> Programming them can ether be done via BIOS or by the OS.
> 
> There are 3 different API types, and there is already some OOT
> drivers that were written to support them, using procfs, each
> one using a different (and IMO confusing) API.
> 
> After looking at the existing drivers and not liking the uAPI
> interfaces there, I opted to write a new driver from scratch,
> unifying support for all different versions and using sysfs
> via the leds class.

Just do this the "right way" and not add it to staging first.  Just use
the existing LED class apis and all should be fine, no need for doing
anything unusual here.

thanks,m

greg k-h
