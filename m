Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A9C28E03
	for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kClicbi0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3D2C433C7;
	Mon, 16 Oct 2023 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697468296;
	bh=zmZs3cT99Ur9yvFFGEPGXCP9E85IltaNJadsTOusyko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kClicbi0FEtJOIS2/IWCagp0cUksl6C6Tf/QrfEX9GfBmW89XU5uFV+l8/jAe1vip
	 OUsWpbUhVyGgMeY5w0k7kgVEEBIXsol7uxKBM5x225a19aIZenh4CSO1Hg9+7gJG9f
	 E4XKQBULQatlAAkf6qALInjQh9D6MqaaaZ4xRUcQ=
Date: Mon, 16 Oct 2023 16:28:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unnecessary parentheses
Message-ID: <2023101643-nemesis-residence-89a6@gregkh>
References: <20231016130053.GA9696@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016130053.GA9696@ubuntu>

On Mon, Oct 16, 2023 at 06:00:53AM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch:
> CHECK: Unnecessary parentheses
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
>  drivers/staging/sm750fb/sm750_accel.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index 0ef8d4ff2ef9..50e51d730d86 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -393,7 +393,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
>  	 * Return 0 if the GPIO pins to be used is out of range. The
>  	 * range is only from [0..63]
>  	 */
> -	if ((clk_gpio > 31) || (data_gpio > 31))
> +	if (clk_gpio > 31 || data_gpio > 31)
>  		return -1;
>  
>  	if (sm750_get_chip_type() == SM750LE)
> diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
> index 44b9e3fe3a41..bbef19a39f81 100644
> --- a/drivers/staging/sm750fb/sm750_accel.c
> +++ b/drivers/staging/sm750fb/sm750_accel.c
> @@ -215,7 +215,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
>  		}
>  	}
>  
> -	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
> +	if (nDirection == BOTTOM_TO_TOP || nDirection == RIGHT_TO_LEFT) {
>  		sx += width - 1;
>  		sy += height - 1;
>  		dx += width - 1;
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent a patch that has been sent multiple times in the past and is
  identical to ones that have been rrejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
