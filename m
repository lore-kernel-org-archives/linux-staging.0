Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AE417F
	for <linux-staging@lists.linux.dev>; Fri, 16 Apr 2021 12:52:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDDFD61107;
	Fri, 16 Apr 2021 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618577523;
	bh=hwJ8s62yDIzmzZA0XYf+y6HvC+HhisQjYC0WgN+PGKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2m/SWVf8QKqq/Btcd4gPFqAbLsDT34XDLpJddTRhYn/QOuv+nKJIwxo3d7jjSkDU
	 1kAc68zdjhib0EwVoAVObGVbxEAG44nHvsCbKiduv7cvk1eaydVObPt+GcJUWUNW1B
	 jgyNLtAyDs+vdJYNMEiRjh+obC8KOE9gUdTmYock=
Date: Fri, 16 Apr 2021 14:51:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>,
	Phil Reid <preid@electromag.com.au>,
	Nishad Kamdar <nishadkamdar@gmail.com>
Subject: Re: [PATCH v1 1/2] fbtft: Rectify GPIO handling
Message-ID: <YHmIb2YrwfzZa7Wh@kroah.com>
References: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>

On Fri, Apr 16, 2021 at 03:31:16PM +0300, Andy Shevchenko wrote:
> The infamous commit c440eee1a7a1 ("Staging: fbtft: Switch to
> the GPIO descriptor interface") broke GPIO handling completely.
> It has already four commits to rectify and it seems not enough.
> In order to fix the mess here we:
> 
>   1) Set default to "inactive" for all requested pins
> 
>   2) Fix CS, RD, and WR pins polarity since it's active low and
>      GPIO descriptor interface takes it into consideration from
>      the Device Tree or ACPI
> 
>   3) Fix RESET pin polarity in the places missed by the commit
>      b918d1c27066 ("Staging: fbtft: Fix reset assertion when using gpio descriptor")
> 
>   4) Consolidate chip activation (CS assert) under default
>      ->reset() callback
> 
> To summarize the expectations about polarity for GPIOs:
> 
>    #RD			Low
>    #WR			Low
>    #CS			Low
>    #RESET		Low
>    DC or RS		High
>    RW			High
>    Data	0..15		High
> 
> See also Adafruit learning course [1] for the example of the schematics.
> 
> While at it, drop unneeded NULL checks, since GPIO API is tolerant to that.
> At the end, update TODO to mark this job eventually done.
> 
> [1]: https://learn.adafruit.com/adafruit-2-8-and-3-2-color-tft-touchscreen-breakout-v2/downloads

Shouldn't this be broken up into "one patch per thing" from your list
above?  Feels like you did a lot of different things all in the same
patch :(

thanks,

greg k-h
