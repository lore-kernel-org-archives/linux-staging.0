Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6320D71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 09:31:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5494461182;
	Sat, 10 Apr 2021 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618047079;
	bh=dLqzpPxQV6VLbGBARRZ7SF+swEOzYvvusa6Xhacvhsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZR5uxYuJNKPQjKllJFffuIUxykNDky0RWSygO3WaeD1KbCrS9Ml/xR0fNbTenb/5y
	 9Hb3Vq7CVYMPO/3bCsvZLBScu0mDlFalUC8cmdJ4Lle4wi8f4sHTVbM5hK1oQHR45t
	 KpT2GlZp4Lq6Ak4kCSuOdwFlJLoUSky3Ms4Y3auE=
Date: Sat, 10 Apr 2021 11:31:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 4/4] staging: rtl8723bs: Change the
 type and use of a variable
Message-ID: <YHFwZCh+s7ymrsQN@kroah.com>
References: <20210410092232.15155-1-fmdefrancesco@gmail.com>
 <20210410092232.15155-5-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410092232.15155-5-fmdefrancesco@gmail.com>

On Sat, Apr 10, 2021 at 11:22:32AM +0200, Fabio M. De Francesco wrote:
> Change the type of fw_current_in_ps_mode from u8 to bool, because
> it is used everywhere as a bool and, accordingly, it should be
> declared as a bool. Shorten the controlling
> expression of an 'if' statement.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
> index 96fe172ced8d..8dc4dd8c6d4c 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> @@ -348,7 +348,7 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
>  
>  void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
>  {
> -	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode == true) {
> +	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
>  		if (padapter->HalFunc.hal_dm_watchdog_in_lps)
>  			padapter->HalFunc.hal_dm_watchdog_in_lps(padapter); /* this function caller is in interrupt context */
>  	}
> diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> index 0a48f1653be5..0767dbb84199 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> @@ -203,7 +203,7 @@ struct pwrctrl_priv {
>  	u8 LpsIdleCount;
>  	u8 power_mgnt;
>  	u8 org_power_mgnt;
> -	u8 fw_current_in_ps_mode;
> +	bool fw_current_in_ps_mode;
>  	unsigned long	DelayLPSLastTimeStamp;
>  	s32		pnp_current_pwr_state;
>  	u8 pnp_bstop_trx;

If this is only checked, how can it ever be true?  Who ever sets this
value?

thanks,

greg k-h
