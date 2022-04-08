Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1958A362
	for <linux-staging@lists.linux.dev>; Fri,  8 Apr 2022 08:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB26C385A1;
	Fri,  8 Apr 2022 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649405641;
	bh=XDlebbqKT3weA3tUvZioQrpxHAe1YfgeHmh4ZAqmS7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X771eGmwW1BYwZByt5brTrTHkhtD3qJ95KfehH5uHrE3yUNFpnqJK8Zr24reL1Qjs
	 TFYkmQBveyH5adrH3iv6ejpW3bjUpDjUBOmV1zrIzgdHSREyH1YySuAwPgSgYmApcJ
	 AXMDaKpwy3bzNPwNJ/mxH/wgLCEqCb+qUb/VX5cw=
Date: Fri, 8 Apr 2022 10:13:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artur Bujdoso <artur.bujdoso@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon-usb: remove unnecessary parentheses
Message-ID: <Yk/uxoi4VUaR9OpO@kroah.com>
References: <Yk/knRtaujd/PzK7@crux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk/knRtaujd/PzK7@crux>

On Fri, Apr 08, 2022 at 09:30:37AM +0200, Artur Bujdoso wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses
> 
> Signed-off-by: Artur Bujdoso <artur.bujdoso@gmail.com>
> ---
>  drivers/staging/octeon-usb/octeon-hcd.c | 62 ++++++++++++-------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/octeon-usb/octeon-hcd.c b/drivers/staging/octeon-usb/octeon-hcd.c
> index a1cd81d4a114..32bcd6c582f5 100644
> --- a/drivers/staging/octeon-usb/octeon-hcd.c
> +++ b/drivers/staging/octeon-usb/octeon-hcd.c
> @@ -1101,9 +1101,9 @@ static struct cvmx_usb_pipe *cvmx_usb_open_pipe(struct octeon_hcd *usb,
>  	pipe = kzalloc(sizeof(*pipe), GFP_ATOMIC);
>  	if (!pipe)
>  		return NULL;
> -	if ((device_speed == CVMX_USB_SPEED_HIGH) &&
> -	    (transfer_dir == CVMX_USB_DIRECTION_OUT) &&
> -	    (transfer_type == CVMX_USB_TRANSFER_BULK))
> +	if (device_speed == CVMX_USB_SPEED_HIGH &&
> +	    transfer_dir == CVMX_USB_DIRECTION_OUT &&
> +	    transfer_type == CVMX_USB_TRANSFER_BULK)
>  		pipe->flags |= CVMX_USB_PIPE_FLAGS_NEED_PING;

Nah, the original is fine, no need to change this.

Unless, do you have this hardware?  If so, getting this out of staging
would be nice to have happen one day.

thanks,

greg k-h
