Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720DC11731;
	Sun, 15 Oct 2023 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="lmT63O9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=j8EKEVq7xETVyP/OZQl8GFvNsqRyq5PaXInXR8hfZW8=;
  b=lmT63O9sBaE6tTwvvRQi7k91t1zue+xDYzESgRXsmMBCS6+Rla3wZP3e
   0rdppf/D+9yNXY68AuEGHrg7/XzgD3kmy0pI9ZhIpH1Al7rMCmMifv4aW
   eQHYKUUK03eJssP7Jf5eI/bidomVg0Zynuv6gA59IQscpBXNqZ0kQhNdX
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,226,1694728800"; 
   d="scan'208";a="68765621"
Received: from unknown (HELO hadrien) ([87.129.180.234])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 22:23:57 +0200
Date: Sun, 15 Oct 2023 22:23:54 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Dorcas AnonoLitunya <anonolitunya@gmail.com>
cc: outreachy@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
    Teddy Wang <teddy.wang@siliconmotion.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] Staging: sm750fb: Rename displayControl
In-Reply-To: <596de9b4cf3483d872b1ba25e1b02194aec34bac.1697400022.git.anonolitunya@gmail.com>
Message-ID: <a5cbf027-7990-c54d-8bfc-dc042ac166f@inria.fr>
References: <cover.1697400022.git.anonolitunya@gmail.com> <596de9b4cf3483d872b1ba25e1b02194aec34bac.1697400022.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 15 Oct 2023, Dorcas AnonoLitunya wrote:

> Rename variable displayControl to display_control. This follows
> snakecase naming convention and ensures consistent naming style
> throughout the file.Issue by checkpatch.

Actually, the variable seems to be dispControl?

julia

>
> Mutes the following checkpatch error:
> CHECK: Avoid CamelCase: <dispControl>
>
> Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_mode.c | 32 +++++++++++++--------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> index 431b273a347a..fc3db09de9ae 100644
> --- a/drivers/staging/sm750fb/ddk750_mode.c
> +++ b/drivers/staging/sm750fb/ddk750_mode.c
> @@ -15,7 +15,7 @@
>   */
>  static unsigned long
>  display_control_adjust_SM750LE(struct mode_parameter *mode_param,
> -			       unsigned long dispControl)
> +			       unsigned long disp_control)
>  {
>  	unsigned long x, y;
>
> @@ -36,42 +36,42 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
>  	       ((x - 1) & CRT_AUTO_CENTERING_BR_RIGHT_MASK));
>
>  	/*
> -	 * Assume common fields in dispControl have been properly set before
> +	 * Assume common fields in disp_control have been properly set before
>  	 * calling this function.
> -	 * This function only sets the extra fields in dispControl.
> +	 * This function only sets the extra fields in disp_control.
>  	 */
>
>  	/* Clear bit 29:27 of display control register */
> -	dispControl &= ~CRT_DISPLAY_CTRL_CLK_MASK;
> +	disp_control &= ~CRT_DISPLAY_CTRL_CLK_MASK;
>
>  	/* Set bit 29:27 of display control register for the right clock */
>  	/* Note that SM750LE only need to supported 7 resolutions. */
>  	if (x == 800 && y == 600)
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL41;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL41;
>  	else if (x == 1024 && y == 768)
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL65;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL65;
>  	else if (x == 1152 && y == 864)
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
>  	else if (x == 1280 && y == 768)
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
>  	else if (x == 1280 && y == 720)
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL74;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL74;
>  	else if (x == 1280 && y == 960)
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
>  	else if (x == 1280 && y == 1024)
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
>  	else /* default to VGA clock */
> -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL25;
> +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL25;
>
>  	/* Set bit 25:24 of display controller */
> -	dispControl |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
> +	disp_control |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
>
>  	/* Set bit 14 of display controller */
> -	dispControl |= DISPLAY_CTRL_CLOCK_PHASE;
> +	disp_control |= DISPLAY_CTRL_CLOCK_PHASE;
>
> -	poke32(CRT_DISPLAY_CTRL, dispControl);
> +	poke32(CRT_DISPLAY_CTRL, disp_control);
>
> -	return dispControl;
> +	return disp_control;
>  }
>
>  /* only timing related registers will be  programed */
> --
> 2.42.0.345.gaab89be2eb
>
>
>
