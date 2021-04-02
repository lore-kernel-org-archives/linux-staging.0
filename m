Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1A259E
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 14:33:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96D9D60551;
	Fri,  2 Apr 2021 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617374030;
	bh=gKktK/Qq2hZC2VYSSgZoSCFdBPIyQ2cePPDSdDW2ERY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXEzEGBVJj+8VQHIyJ5VaVG88E6lYCpfMA8whUnxygnxwPLvxpGTLlKyk07gH6dai
	 eAbjKv0tiRFBVVSptgaeb0Ih1N1CMzczoD4SLsx7WgIrGtJ6FtYeG2xIP8uBr7uNMg
	 A721+zzovfvJXm75bQYyZbjO8yd19OZxH1xSSOGg=
Date: Fri, 2 Apr 2021 16:33:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	Takashi Iwai <tiwai@suse.de>, linux-staging@lists.linux.dev,
	Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH] bcm2835-pcm: Allow up to 8 channels and 192kHz data rate
Message-ID: <YGcrS43e/R32m6iz@kroah.com>
References: <1617373688-8715-1-git-send-email-stefan.wahren@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617373688-8715-1-git-send-email-stefan.wahren@i2se.com>

On Fri, Apr 02, 2021 at 04:28:08PM +0200, Stefan Wahren wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> The firmware driver can support this, so allow it to be selected
> Increase the buffer sizes to handle the higher data rates.
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Why are we adding new features to this code instead of working to get it
out of staging?

What is left to do here, it should have been cleaned up and long gone...

thanks,

greg k-h
