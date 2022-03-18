Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE648B7
	for <linux-staging@lists.linux.dev>; Fri, 18 Mar 2022 11:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2D8C340E8;
	Fri, 18 Mar 2022 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647602886;
	bh=XLQdldPHGNEHIsD6t21nuOci19JYv52oxjj5ejLailY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUl4eWnxAjZyFOZZQFeg+pe4ZX1NO98jHQGDXaPAKwUzDX9kKfj8efmQeuE1CqVRz
	 OZTs+nliTyrlSXQPAwgI1i71ZOjVBXGu31afm7Mltc7AbaKgv2uNHhfH3cgk18QobM
	 Wd5ZuiWnArMRVMl8LQib6pK8o3sS2qIin4MuTptw=
Date: Fri, 18 Mar 2022 12:28:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sathish Kumar <skumark1902@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8712: Fix CamelCase warnings
Message-ID: <YjRswrHu0JUm9331@kroah.com>
References: <20220318101440.13887-1-skumark1902@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318101440.13887-1-skumark1902@gmail.com>

On Fri, Mar 18, 2022 at 03:44:40PM +0530, Sathish Kumar wrote:
> This patch fixes the checkpatch.pl warnings like:
> CHECK: Avoid CamelCase: <blnEnableRxFF0Filter>
> +   u8 blnEnableRxFF0Filter;
> 
> Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
> ---
> Changes in v2:
>     - Remove the "bln" prefix
> ---
>  drivers/staging/rtl8712/drv_types.h   | 2 +-
>  drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
>  drivers/staging/rtl8712/xmit_linux.c  | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/drv_types.h b/drivers/staging/rtl8712/drv_types.h
> index a44d04effc8b..4de3aad08242 100644
> --- a/drivers/staging/rtl8712/drv_types.h
> +++ b/drivers/staging/rtl8712/drv_types.h
> @@ -157,7 +157,7 @@ struct _adapter {
>  	struct iw_statistics iwstats;
>  	int pid; /*process id from UI*/
>  	struct work_struct wk_filter_rx_ff0;
> -	u8 blnEnableRxFF0Filter;
> +	u8 enable_rx_ff0_filter;

Shouldn't this be a boolean?

>  	spinlock_t lock_rx_ff0_filter;
>  	const struct firmware *fw;
>  	struct usb_interface *pusb_intf;
> diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
> index acda930722b2..69d3c55ee9e5 100644
> --- a/drivers/staging/rtl8712/rtl871x_cmd.c
> +++ b/drivers/staging/rtl8712/rtl871x_cmd.c
> @@ -202,7 +202,7 @@ u8 r8712_sitesurvey_cmd(struct _adapter *padapter,
>  	mod_timer(&pmlmepriv->scan_to_timer,
>  		  jiffies + msecs_to_jiffies(SCANNING_TIMEOUT));
>  	padapter->ledpriv.LedControlHandler(padapter, LED_CTL_SITE_SURVEY);
> -	padapter->blnEnableRxFF0Filter = 0;
> +	padapter->enable_rx_ff0_filter = 0;
>  	return _SUCCESS;
>  }
>  
> diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
> index 90d34cf9d2ff..d58ae5b387d4 100644
> --- a/drivers/staging/rtl8712/xmit_linux.c
> +++ b/drivers/staging/rtl8712/xmit_linux.c
> @@ -102,11 +102,11 @@ void r8712_SetFilter(struct work_struct *work)
>  	r8712_write8(adapter, 0x117, newvalue);
>  
>  	spin_lock_irqsave(&adapter->lock_rx_ff0_filter, irqL);
> -	adapter->blnEnableRxFF0Filter = 1;
> +	adapter->enable_rx_ff0_filter = 1;
>  	spin_unlock_irqrestore(&adapter->lock_rx_ff0_filter, irqL);
>  	do {
>  		msleep(100);
> -	} while (adapter->blnEnableRxFF0Filter == 1);
> +	} while (adapter->enable_rx_ff0_filter == 1);

Ah, that's funny.  It's amazing it works at all and that the compiler
doesn't optimize this away.  This isn't a good pattern to use in kernel
code.  I know it's not caused by your change here, but perhaps you might
want to fix this up to work properly?

thanks,

greg k-h
