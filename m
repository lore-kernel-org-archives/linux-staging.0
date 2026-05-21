Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F8217B43F;
	Thu, 21 May 2026 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354963; cv=none; b=P18hh22uPoO1k4G6y/WDPh+MKtatKw4rA8Q0WnQA7tADk78QEydYOmXuP6awO2T0+qxtq0K+5iJO1iF8Q1ZfmOcw0/GIT/xEN4rOyJRe3ywaaakTRqZllrmDbO9wlkPHHtxua5CMtRD8hCiLQmwccwF5xIHe7ij36XRfMWavFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354963; c=relaxed/simple;
	bh=0Virm5fh00ePbgOdeFd0vyNb5uVvXAEKaATf1fUGPOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFx7ORGS8jRKoOnRskhiUmHxtG74EZryiRK2mcbJyej1ADqOgoUdJJ6aRA+HlM5BGYWrxccUUW11WDS/s27WB1ArJamnujAq3yQpgnOt6//5jFnL66Y7gYQy0v+3egwOwJna3g7+Dt9Wy2rcNFn/alJaJHiGjdr5o98Yu3p+sKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wj32NASh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wj32NASh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7331F000E9;
	Thu, 21 May 2026 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779354962;
	bh=1/E0dgpgDGYKeLhhncu0gJ3nB0ZCHOe2OQHYK1c3JIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wj32NAShzs6kOIDqoGTWewDcHg+UKKUB7sdhdGonuTCAVjbPGuJKWFBM1WVx46XW4
	 R5ORXn//Kyjich0vR5ynbDXTmkrzE+3dhMN4FxP+6sfBjE3dy/PSgr5qoL5sr06eVG
	 HgcfiuEaoITC5JlNrCzjhrwFs8eltYuy9/iTuIXs=
Date: Thu, 21 May 2026 11:16:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Noah Techoueyres <noahtechoueyres@gmail.com>
Cc: linux-staging@lists.linux.dev, dan.carpenter@linaro.org,
	nikolayof23@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] staging: rtl8723bs: fix block comment formatting
Message-ID: <2026052150-container-starlet-b496@gregkh>
References: <20260512155712.6998-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512155712.6998-1-noahtechoueyres@gmail.com>

On Tue, May 12, 2026 at 11:57:11AM -0400, Noah Techoueyres wrote:
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25ed36..067b54c6111e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1743,7 +1743,11 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
>  	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
>  
>  	switch (pdrvextra_cmd->ec_id) {
> -	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
> +	case DYNAMIC_CHK_WK_CID:
> +		/*
> +		 * only primary padapter go to this cmd, but execute
> +		 * dynamic_chk_wk_hdl() for two interfaces
> +		 */
>  		dynamic_chk_wk_hdl(padapter);
>  		break;
>  	case POWER_SAVING_CTRL_WK_CID:
> @@ -1881,7 +1885,10 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
>  		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>  
>  		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> -		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
> +		/*
> +		 * we will set _FW_LINKED when there is one more sta
> +		 * to join us (rtw_stassoc_event_callback)
> +		 */
>  	}
>  
>  createbss_cmd_fail:
> -- 
> 2.53.0
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
