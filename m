Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EAB33C3
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 16:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FD3C3411E;
	Sun, 24 Jul 2022 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658679483;
	bh=cg7AgZYQWQqXNzFU4SmDbA8nxQ3ZVK2B6/Q1SO0ceJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyYkEmE2uL6e0+fCRPODF1gWXCEmxGzOA95keUgu3c1whUYqII5Bjdvpyfaa5dn/q
	 puyd+HXh6zCzqkgZE26jmXjQo0QRebfgUr+XyjTGB6e7RxxlUT6RhnVoLzMTwWm8C1
	 91AjsrKWg2pU/DcFmp3eYdUZ6a0xKAsap5MlN4O0=
Date: Sun, 24 Jul 2022 18:18:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: handle errors from
 ReadAdapterInfo8188EU
Message-ID: <Yt1wuJKzzUTpxMY3@kroah.com>
References: <20220724161405.146488-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724161405.146488-1-martin@kaiser.cx>

On Sun, Jul 24, 2022 at 06:14:05PM +0200, Martin Kaiser wrote:
> Update ReadAdapterInfo8188EU to return 0 for success or a negative
> error code. Don't use the infamous _SUCCESS and _FAIL defines.
> 
> Handle returned errors in rtw_usb_if1_init, this will eventually fail the
> probing of the r8188eu driver.
> 
> Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_halinit.c  | 7 ++++---
>  drivers/staging/r8188eu/include/hal_intf.h | 2 +-
>  drivers/staging/r8188eu/os_dep/usb_intf.c  | 3 ++-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 421fe7c40390..08d4b5dfd430 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -922,7 +922,7 @@ static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool
>  	}
>  }
>  
> -void ReadAdapterInfo8188EU(struct adapter *Adapter)
> +int ReadAdapterInfo8188EU(struct adapter *Adapter)
>  {
>  	struct eeprom_priv *eeprom = &Adapter->eeprompriv;
>  	struct led_priv *ledpriv = &Adapter->ledpriv;
> @@ -933,13 +933,13 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
>  	/* check system boot selection */
>  	res = rtw_read8(Adapter, REG_9346CR, &eeValue);
>  	if (res)
> -		return;
> +		return -1;

This is not a valid error code, please use a real -ESOMETHING instead.

thanks,

greg k-h
