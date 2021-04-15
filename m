Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39D6D28
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 06:20:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D0A561626;
	Thu, 15 Apr 2021 06:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618467600;
	bh=HYP7yuHfpv8Q1ChKSjcORPDo6Pm/UOEFcuQ22NmOOXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sh6i2eyNs/SirnN/bSO29kEvVmnMAU19vtBs09nkBn7KSH0L6JWY3QeK+rGdcPauC
	 z19trp6HI+RWnTQT+QRa2P7Y1iWDcXpjCGjcOVlH7VlI6M6iUSfgufZLeCRGWn5TRW
	 nf4WB4lqxpTvrvareqizd8YMfMzLMkxikPn3WoME=
Date: Thu, 15 Apr 2021 08:19:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Outreachy patch] [PATCH v3 1/2] staging: rtl8723bs: Remove
 useless led_blink_hdl()
Message-ID: <YHfbC8EvrmwFs6If@kroah.com>
References: <20210414192750.4974-1-fmdefrancesco@gmail.com>
 <20210414192750.4974-2-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414192750.4974-2-fmdefrancesco@gmail.com>

On Wed, Apr 14, 2021 at 09:27:49PM +0200, Fabio M. De Francesco wrote:
> Removed useless led_blink_hdl() prototype and definition. In wlancmds[]
> the slot #60 is now set to NULL using the macro GEN_MLME_EXT_HANDLER. This
> change has not unwanted side effects because the code in rtw_cmd.c checks
> if the function pointer is valid before using it.
> 
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Changes from v2: no changes.
> Changes from v1: Corrected a bad solution to this issue that made use of
> an unnecessary dummy function.
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
>  3 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 0297fbad7bce..f82dbd4f4c3d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -150,7 +150,7 @@ static struct cmd_hdl wlancmds[] = {
>  
>  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
>  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
> -	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param), led_blink_hdl) /*60*/
> +	GEN_MLME_EXT_HANDLER(0, NULL) /*60*/

Do not do this "intermediate stage" type thing like this please.  This
should be one simple patch.  Again, look in the kernel archives for an
example of how to do this.

thanks,

greg k-h
