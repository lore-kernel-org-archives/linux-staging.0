Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E0B23A0
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 06:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D351C385A9;
	Mon,  6 Jun 2022 06:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654495516;
	bh=zwJfnS/wE1sDCszcl+CSabMelPPt/DfmOcBmAm19SNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBfBqXmjcvTVkXHY4YUlGomdCIbCsWjiXKhvfIPP4l0umm3z4dhXYaw9aXEllFyBM
	 gHgkIKo642jP5ZmpGHm1qff5FpLMqEYamCzxmKIEDG+s6ifgK9HMIlxyDl4bhP63VJ
	 sswFJC9/J3HQUiDlsP5t2GD08acfEjgdb9Ii6CgU=
Date: Mon, 6 Jun 2022 08:05:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: r8188eu: remove rtw_usleep_os
Message-ID: <Yp2ZGp1JUSWaSzFI@kroah.com>
References: <20220602194807.281115-1-martin@kaiser.cx>
 <20220602194807.281115-3-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602194807.281115-3-martin@kaiser.cx>

On Thu, Jun 02, 2022 at 09:48:06PM +0200, Martin Kaiser wrote:
> Remove the rtw_usleep_os helper function. There are only two callers, both
> of which call rtw_usleep_os(100).
> 
> The original code would translate rtw_usleep_os(100) into msleep(1). Using
> msleep for < 20ms is not recommended. Replace the msleep calls with
> usleep_range, based on the explanations in
> Documentation/timers/timers-howto.rst.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 2 +-
>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
>  drivers/staging/r8188eu/include/osdep_service.h | 2 --
>  drivers/staging/r8188eu/os_dep/osdep_service.c  | 8 --------
>  4 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> index 7b816b824947..11fd05633529 100644
> --- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> +++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> @@ -266,7 +266,7 @@ static s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  			err = -1;
>  			break;
>  		}
> -		rtw_usleep_os(100);
> +		usleep_range(1000, 1200);

How do you know this is the proper range?

>  	}
>  
>  	return err;
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index e17375a74f17..1aa7d01b67b1 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -208,7 +208,7 @@ static void efuse_read_phymap_from_txpktbuf(
>  		rtw_write8(adapter, REG_TXPKTBUF_DBG, 0);
>  		timeout = jiffies + msecs_to_jiffies(1000);
>  		while (!rtw_read8(adapter, REG_TXPKTBUF_DBG) && time_before(jiffies, timeout))
> -			rtw_usleep_os(100);
> +			usleep_range(1000, 1200);

Same here, how do you know this is the correct range?

I would just use msleep as needed and later change to a range if you
have figured out that is allowed.

thanks,

greg k-h
