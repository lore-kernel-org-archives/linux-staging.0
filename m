Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1113B8935;
	Mon,  9 Mar 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072108; cv=none; b=HyR9MNWvi9N6J4emzIu19lzOADGmOzz3uJImthP6cvRTIGXJZfBWcoygUVQFWlmu9SDMugFLsrLlqSGHl7zklmTwcrKFxHIcTSVIHN1pdg11ydwhdWALufyvSsGvd2ICjXqC2UYG1L9Xe2nEtkFoEAx1MNN5ayF/AO4V0nMdDQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072108; c=relaxed/simple;
	bh=Mzc8GwOFQOJ0Adaas1KLuopyj8LcmRDkLCBQqQ86yJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJ+5Cm6H03DBtDW1ZfwgxvTlU3MjObddmO0Ncxf+v9ZzAmT9Jfh/KQpG9t/uQR2ZzB7UBUpP0D0P6uVZMau2pU8yGdn7UZ5+Z8B7/fUJ2EUNZJr4altUxirtfblcWMvDU1ETkbmsf2iWhn2KSBfadvUJnV5fdwxKSAwUdWFbeEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eB8K65hm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eB8K65hm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B76DC4CEF7;
	Mon,  9 Mar 2026 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072107;
	bh=Mzc8GwOFQOJ0Adaas1KLuopyj8LcmRDkLCBQqQ86yJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eB8K65hmjLOX09QcUlUA+sCMT1RYYrWblXGjHuTTVUNSClzrHtGbwTeovtUm3/6XR
	 muaTSwjQOHYAQGljrq31ezgb4/dXQF43GNLrKXuOf9SV5k7ACg3rOT0K43sJJ86mpk
	 PKKZp0CqP38vg76diMm5Mz0iwn+R+RFHhyluqccQ=
Date: Mon, 9 Mar 2026 17:01:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: sluisr <luistermc789@gmail.com>
Cc: david.laight.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, sluisr <contact@sluisr.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <2026030929-rebate-rinsing-aa36@gregkh>
References: <20260309004050.19339-1-contact@sluisr.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309004050.19339-1-contact@sluisr.com>

On Sun, Mar 08, 2026 at 06:40:50PM -0600, sluisr wrote:
> This patch addresses the checkpatch.pl warnings:
> WARNING: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
> 
> It is recommended to use usleep_range for delays less than 20ms.
> 
> Signed-off-by: sluisr <contact@sluisr.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index abb84f8ae..f6293f049 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		usleep_range(10000, 11000);
>  
>  	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
>  		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index b1f20aa81..7ac013519 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -5833,7 +5833,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
>  		return H2C_SUCCESS;
>  
>  	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
> -		msleep(10);/*  10ms, ATIM(HIQ) Windows */
> +		usleep_range(10000, 11000);/*  10ms, ATIM(HIQ) Windows */
>  
>  		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
>  		spin_lock_bh(&pxmitpriv->lock);
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 1c9e02732..ad6c375ba 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -420,7 +420,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  			err = -1;
>  			break;
>  		}
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  
>  	return err;
> -- 
> 2.53.0
> 
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
