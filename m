Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D9173
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 14:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781D1C36AE3;
	Thu,  6 Jan 2022 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641477852;
	bh=vagtv4d0QkzdvwtqkyA9ntM9HugyoKiIJ3Sgw7fKpBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lp1u25aJVBBOdTEq/ORyja1wa9XhMvMe7FEHZgZNbba5uBggie7V8oAOoZeD/zDoL
	 PmRHUpT8G2pYLLdOgwIkuPv85i0vmtfvZwJnWxpXvRzFUSBzKU038KY5h+uRw4iRi6
	 Aa4WcmGGs9OeJlfe0lEvtOVTTEHoQWiF4Tcb2xqg=
Date: Thu, 6 Jan 2022 15:04:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: move get version func to where all other
 functions are
Message-ID: <Ydb22Tuvm0MwfpOK@kroah.com>
References: <20220106093110.GA20011@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106093110.GA20011@mail.google.com>

On Thu, Jan 06, 2022 at 10:31:10PM +1300, Paulo Miguel Almeida wrote:
> As a convention for the pi433 driver, all routines that deals with the
> rf69 chip are defined in the rf69.c file. There was an exception in
> which the uC version verification was being done directly elsewhere.
> While at it, the Version Register hardcoded value was replaced with a
> pre-existing constant in the driver.
> 
> This patch adds rf69_get_chip_version function to rf69.c
> 
> Additionally, the patch below must be applied first as it was sent
> before and touches the same file.
> https://lore.kernel.org/lkml/20220103222334.GA6814@mail.google.com/
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>  drivers/staging/pi433/pi433_if.c | 4 +---
>  drivers/staging/pi433/rf69.c     | 8 ++++++++
>  drivers/staging/pi433/rf69.h     | 1 +
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
> index 29bd37669059..a19afda5b188 100644
> --- a/drivers/staging/pi433/pi433_if.c
> +++ b/drivers/staging/pi433/pi433_if.c
> @@ -1116,9 +1116,7 @@ static int pi433_probe(struct spi_device *spi)
>  		spi->mode, spi->bits_per_word, spi->max_speed_hz);
>  
>  	/* Ping the chip by reading the version register */
> -	retval = spi_w8r8(spi, 0x10);
> -	if (retval < 0)
> -		return retval;
> +	retval = rf69_get_chip_version(spi);

This can not fail anymore, like it used to be able to.  So I think you
just broke the functionality for why this call was being made in the
first place (i.e. ping the chip to see if it was alive, and fail if it
is not.)

thanks,

greg k-h
