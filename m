Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2C2572
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 16:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AF7C3410F;
	Tue, 29 Mar 2022 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648569854;
	bh=ZxlrXPLpc9Oe2F5UYadRcPARpQ5RGn7JNsYO/WUcz80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x0zxa9/Nwp13+QN9wd5CjBk7+jSwfIA4wqYEF2Q/V0qLXrN3TkD4Lzk1kEPPPCZ5U
	 eMMDGddrWF/3+7KK/CWcV7Uw4iG3v5yDj6WUiDj9lzD3r+Q8RDb0BppzCRJbjlj/Oc
	 uGhqnXvnM9RxVDBIIcVAK5aLrNUQVnHgMh/+6b8U=
Date: Tue, 29 Mar 2022 18:04:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] staging: r8188eu: remove HW_VAR_RXDMA_AGG_PG_TH from
 SetHwReg8188EU()
Message-ID: <YkMt/HqQz56jYOek@kroah.com>
References: <20220328113940.6396-1-straube.linux@gmail.com>
 <20220328113940.6396-6-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328113940.6396-6-straube.linux@gmail.com>

On Mon, Mar 28, 2022 at 01:39:36PM +0200, Michael Straube wrote:
> The HW_VAR_RXDMA_AGG_PG_TH case in SetHwReg8188EU() just sets a
> variable conditionally and then calls rtw_write8(). Set the variable
> in the caller and, call rtw_write8() directly and remove the
> HW_VAR_RXDMA_AGG_PG_TH case from SetHwReg8188EU(). This is part of the
> ongoing effort to get rid of the unwanted hal layer.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme.c    | 7 +++++--
>  drivers/staging/r8188eu/hal/usb_halinit.c  | 8 --------
>  drivers/staging/r8188eu/include/hal_intf.h | 1 -
>  3 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 6f0bff186477..14aff6a2040a 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -1817,10 +1817,13 @@ void rtw_joinbss_reset(struct adapter *padapter)
>  			threshold = 1;
>  		else
>  			threshold = 0;
> -		SetHwReg8188EU(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
> +
> +		if (threshold == 0)
> +			threshold = USB_RXAGG_PAGE_COUNT;
> +		rtw_write8(padapter, REG_RXDMA_AGG_PG_TH, threshold);
>  	} else {
>  		threshold = 1;
> -		SetHwReg8188EU(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
> +		rtw_write8(padapter, REG_RXDMA_AGG_PG_TH, threshold);

Can't you just ue 1 for the last parameter here?

And what about making this a function:
	rtw_set_threshold()?

thanks,

greg k-h
