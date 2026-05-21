Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447C3A640F;
	Thu, 21 May 2026 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360044; cv=none; b=DgFcOh7YFgLQSR8/z10XwjRX9xBANO5zTCcX3vBJ2uTWGmpnGpUMxJhtcscMxAz+DACqObv8NLiRroG89JtHsW4mWee9byHiwMUmljnQASzPtg7er43hUTjWd/Vv7F7/nJ2JYT2FT5wHffies+EK4gK0DbF1mOGr2QIjVA2/I34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360044; c=relaxed/simple;
	bh=sa9B8ZgR705BdReGZjUfoZmD09noJnIlR3tGTfRZljM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdEsF543WzYpsGfIsmW/liDL33ishQsP27qK9M6cBx3mg6+6I2dpxsjwvpVf3MsPFbALf77Agtht+pTyrJiSsXqlOPvD/0VlGqfzDLAvovxhBQ5aJm8w7tTxH4ytr+b1aAcLZoUJUfwvmVe6Da1lWGqhUCutBf4XbgVJEwUdG5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T11AP9oE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T11AP9oE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614481F000E9;
	Thu, 21 May 2026 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779360040;
	bh=arwJFR6Cuu+SxM1H0XJxO4PRkLfpRrHNR7G/ZSNOYTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T11AP9oElWDtb420bn6SB/825rpXkSfqkAlcGm6Kr+6NIfXA3ZOcDzpqp4/p9ELOx
	 Uk0MDgVUFzm/OnmJbixWn4nypQ1NbMA4ZSU7ZDIz+zj99rAGOfpxbfUlMKPQhoY6xa
	 nI+2VFJPrdYxXlN3n8sh0mOdKLkkci9e3xkJz35k=
Date: Thu, 21 May 2026 12:40:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Subhang Mall <subhangmall.os@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to true in
 ioctl_cfg80211.c
Message-ID: <2026052126-sympathy-mangy-233b@gregkh>
References: <agkHbiHcjT2mHIdl@subhangs-thinkpad>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agkHbiHcjT2mHIdl@subhangs-thinkpad>

On Sat, May 16, 2026 at 05:10:22PM -0700, Subhang Mall wrote:
> There were multiple checkpatch.pl warnings in
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> relating to explicitly comparing a value to true;
> comparing a boolean-like variable to true is
> redundant.
> 
> Signed-off-by: Subhang Mall <subhangmall.os@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index fd3bae31b0e..dc871076ca4 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1033,7 +1033,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
>  	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
>  	int ret = 0;
>  
> -	if (adapter_to_dvobj(padapter)->processing_dev_remove == true) {
> +	if (adapter_to_dvobj(padapter)->processing_dev_remove) {
>  		ret = -EPERM;
>  		goto exit;
>  	}
> @@ -1140,7 +1140,7 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
>  
>  		/* report network only if the current channel set contains the channel to which this network belongs */
>  		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set, pnetwork->network.configuration.ds_config) >= 0
> -			&& true == rtw_validate_ssid(&(pnetwork->network.ssid))) {
> +			&& rtw_validate_ssid(&(pnetwork->network.ssid))) {
>  			/* ev =translate_scan(padapter, a, pnetwork, ev, stop); */
>  			rtw_cfg80211_inform_bss(padapter, pnetwork);
>  		}
> @@ -1634,7 +1634,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
>  
>  	padapter->mlmepriv.not_indic_disco = true;
>  
> -	if (adapter_wdev_data(padapter)->block == true) {
> +	if (adapter_wdev_data(padapter)->block) {
>  		ret = -EBUSY;
>  		goto exit;
>  	}
> -- 
> 2.54.0
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
