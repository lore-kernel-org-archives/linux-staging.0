Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5E1FECB0
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667222; cv=none; b=dPvYgpM1UbCHAIv9HrEPpjYSvL0BM0k18mcPhXceK4HSBpLC7CQAfVN7TMc9kiVzJ+jLm1V8NMSChlO/c73qSTYjpt8ysDwW/LoFIcLsWFj/NIDB9yy68Xg80dnUFQDSfadWvH+OksVwxfWS3sjCZMCU4vm3PilfAMkDdFrBEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667222; c=relaxed/simple;
	bh=oldOK+SEqNxqlOGODh2EIN8YmdIpNbq8Vzo7xSKjONo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THtRkAmO4KWnu2SZlnxLSFmpyg5RDkXVQDwbdD4fzKotk9NOUXebzBM9qu2D17QeVUR82hUH7YanhSFgYnzFwk4tBX8ZgFnJ3Vwnp2ZpZMJceJkz+AowLT1KIGcQDzMXhnC6tBNsCJaoFGRtUgXdO98TrSu8wFPe2+Ao8UNa5Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q6J0gTRh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q6J0gTRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5DAC4CEF0;
	Wed, 16 Jul 2025 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752667222;
	bh=oldOK+SEqNxqlOGODh2EIN8YmdIpNbq8Vzo7xSKjONo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6J0gTRhbtcgSj1/d9cXs+MyKdQExjSoWOA6br13IE4hJR7v0AavdAmGbtAXcw3zO
	 inoFpBjLbiECyPCTrDI/Ieilnu1LmoQfYYa8iGXdrkWeyZZZTL2W3F/iY7WkXW08p+
	 MzhA4Sfy8K+oLVosPasCIdRDfgQUY+9aKJsNRjFk=
Date: Wed, 16 Jul 2025 14:00:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/3] staging: rtl8723bs: remove unnecessary commented
 code
Message-ID: <2025071617-hamlet-finite-090e@gregkh>
References: <20250716113740.73025-1-ignacio.pena87@gmail.com>
 <20250716113740.73025-3-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113740.73025-3-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:37:40AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Remove commented out code that serves no purpose, as suggested
> by Greg KH.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 437934dd2..abc789def 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1317,9 +1317,6 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
>  	/* struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter); */
>  	u8 res = _SUCCESS;
>  
> -	/* if (!pwrctrlpriv->bLeisurePs) */
> -	/* 	return res; */
> -
>  	if (enqueue) {
>  		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
>  		if (!ph2c) {
> -- 
> 2.39.5
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
