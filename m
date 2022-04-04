Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D207A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 14:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E958DC2BBE4;
	Mon,  4 Apr 2022 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649082740;
	bh=Dj36icQ5FGKXlBd/rFO86IF80muiRSiYMEcz20M5cfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=05KayeMn4CSJCwMj1m7ue4qAKCZbP/RK52o9OIj8pJUEvbaaPyjn3kIL+sUaNnuEH
	 O9pTzYMPV7e06rn0viw1qigtk4U2ByMyMnmY8h6NCyN9kiGOxIcmRWxBiw3Q8LdGGf
	 hnz7EVRjZS5kxyvxx1UQZ/xPUOz/4qDQFwj+p3lA=
Date: Mon, 4 Apr 2022 16:32:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: r8188eu: remove HAL_DEF_IS_SUPPORT_ANT_DIV
Message-ID: <YksBcUBXbgzXmEBO@kroah.com>
References: <20220403165255.6900-1-straube.linux@gmail.com>
 <20220403165255.6900-2-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220403165255.6900-2-straube.linux@gmail.com>

On Sun, Apr 03, 2022 at 06:52:51PM +0200, Michael Straube wrote:
> In order to get rid of the function GetHalDefVar8188EUsb(), remove
> the HAL_DEF_IS_SUPPORT_ANT_DIV case from it and move the functionality
> into a new function. This is part of the ongoing effort to get rid of
> the unwanted hal layer.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c     |  4 +---
>  drivers/staging/r8188eu/core/rtw_mlme.c    |  4 +---
>  drivers/staging/r8188eu/hal/usb_halinit.c  | 10 +++++++---
>  drivers/staging/r8188eu/include/hal_intf.h |  3 ++-
>  4 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 8b24330e97c1..c286485e6a40 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1099,11 +1099,9 @@ u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
>  	struct cmd_obj		*ph2c;
>  	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
>  	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
> -	u8	support_ant_div;
>  	u8	res = _SUCCESS;
>  
> -	GetHalDefVar8188EUsb(padapter, HAL_DEF_IS_SUPPORT_ANT_DIV, &support_ant_div);
> -	if (!support_ant_div)
> +	if (!support_ant_div(padapter))
>  		return res;
>  
>  	if (enqueue) {
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index f94b1536a177..b6ed5fb5b281 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -1458,7 +1458,6 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
>  	struct __queue *queue	= &pmlmepriv->scanned_queue;
>  	struct	wlan_network	*pnetwork = NULL;
>  	struct	wlan_network	*candidate = NULL;
> -	u8	supp_ant_div = false;
>  
>  	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
>  	phead = get_list_head(queue);
> @@ -1485,8 +1484,7 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
>  		rtw_free_assoc_resources(adapter, 0);
>  	}
>  
> -	GetHalDefVar8188EUsb(adapter, HAL_DEF_IS_SUPPORT_ANT_DIV, &supp_ant_div);
> -	if (supp_ant_div) {
> +	if (support_ant_div(adapter)) {
>  		u8 cur_ant;
>  		GetHalDefVar8188EUsb(adapter, HAL_DEF_CURRENT_ANTENNA, &cur_ant);
>  	}
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 4bc6b08fb282..31ec88b7a400 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -481,6 +481,13 @@ static void _BBTurnOnBlock(struct adapter *Adapter)
>  	rtl8188e_PHY_SetBBReg(Adapter, rFPGA0_RFMOD, bOFDMEn, 0x1);
>  }
>  
> +bool support_ant_div(struct adapter *adapter)

That's a very odd function name to add to the kernel's global namespace
:(

Pleas emake it more obvious what this is for, with the driver name as
part of the prefix?

thanks,

greg k-h
