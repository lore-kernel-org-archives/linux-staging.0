Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1C228C84A;
	Mon,  9 Mar 2026 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075769; cv=none; b=cO2vNjDdhwEp4B5ZuCRxVhedTVUp0U9UuB2sKXbBOjpLXqzFgEPE2FQ8R723Ve43EfMD7blE5T8/aemdMNURBOQGbHSgdg9vyZlgOqu9Z1oOsG1Oc9DTYtOxsufEmyXYGlUoMEu+CrbHV4Y9dk5+mA5cp5W++AW+c1sI6Dbq3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075769; c=relaxed/simple;
	bh=6/EaE9Uj1lukC/yGXo/EbU0Yg8PNOmSgAVBReOKuDCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMWmFkzDV98Mhi0xU3+SL1Cr59KkyioAWEy01AOEoWO4CSqURmZmxIILAjQNiPUPBITEms3VzJZ1swjWToRX02rgfj6tHXWS4EObNQSCLRHRsrTlxiVodBQxLWb5U4IX6paB4VdjOgPB7lBag9CVs20w5ksFvAJqZJAnbcOx8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lgnM1ZyP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lgnM1ZyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC7DC4CEF7;
	Mon,  9 Mar 2026 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075769;
	bh=6/EaE9Uj1lukC/yGXo/EbU0Yg8PNOmSgAVBReOKuDCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lgnM1ZyP4oGRC6T5ivJ+08gsvfzs5pbjaWlmeMEiw1uSm3t6aDli13J2VIgi4mZbT
	 IZjP28pjZWQ4vLXbk92P4jLsOQqqF5UT21asyzp5HLlyqlxX//KE7HcadtlAtF7g/z
	 BRAUI9yIrL7U22vxqgBhFlJGzTY3zG/5hHWwxs/Q=
Date: Mon, 9 Mar 2026 18:02:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dipesh Chaudhary <me@dipeshchaudhary.in>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: add missing blank line after
 declarations
Message-ID: <2026030931-bacon-automatic-60bf@gregkh>
References: <377ca946-1421-4251-a459-f8924945c266@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377ca946-1421-4251-a459-f8924945c266@smtp-relay.sendinblue.com>

On Mon, Mar 09, 2026 at 04:57:29PM +0000, Dipesh Chaudhary wrote:
> 
> Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
> to satisfy checkpatch warnings and improve code readability.
> 
> Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 666e241704d9..bd295bdd73f6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -991,6 +991,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
>  inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
>  {
>  	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
> +
>  	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
>  }
>  
> -- 
> 2.47.3
> 
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
