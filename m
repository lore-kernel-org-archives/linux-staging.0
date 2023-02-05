Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E72F43
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 13:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA86BC433EF;
	Sun,  5 Feb 2023 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675603014;
	bh=gfb7EUkxJTdKxi4HiHtIpiCABzHObkm5GGkpfIm+MZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDaZiae5jGCpCX0Y9voEUmcocpwGOXBAblZWgOi8IXNc21kfIpz4pWYVeb6la8bgS
	 7gNWCn5rMQhNLMVpOSrzW8Qqpu5AacwGOWO7oGv9LmvCG0VVyZLFoaJrF+hBcwnfQJ
	 ujC/MsDW7xrXmE9RNA6EvJHuCzzcTQSXSl8RjBM0=
Date: Sun, 5 Feb 2023 14:16:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y9+sQr1v9IfapvJW@kroah.com>
References: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>

On Sun, Feb 05, 2023 at 02:08:02PM +0100, Guru Mehar Rachaputi wrote:
> This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> as '(iobase)' to avoid precedence issues"
> 
> ---
> Changes in v3:
> 	- Whitespace error from checkpatch fixed
> 
> Changes in v2:
> 	- Macros with one statement that is to call 'iowrite8' function changed
> 	to inline function as reviewed by gregkh@linuxfoundation.org.
> 	In relation to this, names of the callers of macro are also modified
> 	to call this function.
> 
> Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> ---
>  drivers/staging/vt6655/card.c    | 3 +--
>  drivers/staging/vt6655/channel.c | 2 +-
>  drivers/staging/vt6655/mac.h     | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index a6ff496b01b6..d2d122dc16d8 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -643,8 +643,7 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
>  				   &byRsvTime);
>  	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_72);
>  	/* Set to Page0 */
> -        vt6655_mac_select_page0(priv->port_offset);
> -
> +	vt6655_mac_select_page0(priv->port_offset);
>  
>  	spin_unlock_irqrestore(&priv->lock, flags);
>  }
> diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
> index e9a44bcebe32..60b445c38424 100644
> --- a/drivers/staging/vt6655/channel.c
> +++ b/drivers/staging/vt6655/channel.c
> @@ -121,7 +121,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
>  		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWRCCK);
>  		RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
>  		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWROFDM);
> -	        vt6655_mac_select_page0(priv->port_offset);
> +		vt6655_mac_select_page0(priv->port_offset);
>  
>  		spin_unlock_irqrestore(&priv->lock, flags);
>  	}
> diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
> index b9a7ca0fe604..ae3064303691 100644
> --- a/drivers/staging/vt6655/mac.h
> +++ b/drivers/staging/vt6655/mac.h
> @@ -539,12 +539,12 @@
>  
>  static inline void vt6655_mac_select_page0(void __iomem *iobase)
>  {
> -        iowrite8(0, iobase + MAC_REG_PAGE1SEL);
> +	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
>  }
>  
>  static inline void  vt6655_mac_select_page1(void __iomem *iobase)
>  {
> -        iowrite8(1, iobase + MAC_REG_PAGE1SEL);
> +	iowrite8(1, iobase + MAC_REG_PAGE1SEL);
>  }
>  
>  #define MAKEWORD(lb, hb) \
> -- 
> 2.34.1
> 
> 
> -- 
> Thanks & Regards,
> Guru
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
