Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F9F2F80
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 10:11:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE6FE61029;
	Wed,  9 Jun 2021 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623233479;
	bh=VmFXhB0ZrpuqFDd1YXmA4y9nYU9ndBAjpIJbOp94CPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NtfwcnVlN4bHOcewFjusI7hQqsuJL8DKilDDdA8FEXpRKnPCKtMH5AVxzFdFXMZaF
	 FDlVjiqNNKiuSZ1WmC1W9BfMQkfaYx2tjXvsrA9TWmRQSD+FuJHWOMlyXH9L03aTMz
	 E8R15pEwmp++N/O6RLTl/jonX0uSK4oHiwMy+mCY=
Date: Wed, 9 Jun 2021 12:11:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Remove unnecessary alias of printk()
Message-ID: <YMCTxLcE/KF+8R5u@kroah.com>
References: <20210606034038.9657-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606034038.9657-1-fmdefrancesco@gmail.com>

On Sun, Jun 06, 2021 at 05:40:38AM +0200, Fabio M. De Francesco wrote:
> This module defines four alias for printk(). Removed them
> all, because they are not used anywhere else in the driver.
> Converted the only exception to the explicit use of printk().
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl8712_cmd.c   |  2 +-
>  drivers/staging/rtl8712/rtl871x_debug.h | 23 -----------------------
>  2 files changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
> index ff3cb09c57a6..e94604cb71fd 100644
> --- a/drivers/staging/rtl8712/rtl8712_cmd.c
> +++ b/drivers/staging/rtl8712/rtl8712_cmd.c
> @@ -55,7 +55,7 @@ static void check_hw_pbc(struct _adapter *padapter)
>  		/* Here we only set bPbcPressed to true
>  		 * After trigger PBC, the variable will be set to false
>  		 */
> -		DBG_8712("CheckPbcGPIO - PBC is pressed !!!!\n");
> +		printk(KERN_DEBUG "CheckPbcGPIO - PBC is pressed !!!!\n");

As an add-on patch, you should move this to netdev_dbg() or dev_dbg().

thanks,

greg k-h
