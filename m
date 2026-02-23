Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E632235B64D;
	Mon, 23 Feb 2026 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859688; cv=none; b=LcLD/VWR6LnIexy/VH5lwA6S2D9rGVP/p8tIVK7dg7xbhBhdws7qGkz1OhIaiOfOQBxxkZ0KEgVXP39OI8wH/6zl97kCAzdGA9G/cvTG94pf3rKKskkRi7lI0mdkZ8URfRiFYFu9kisG5d1ezEL2p88gMAqKmVDmYa7Hz9JS3Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859688; c=relaxed/simple;
	bh=eCuaPH13svjz5HWI+NAGnQJXEv6pKnPoueR5MR5h+CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOTHmIBKTTcb1k4/Lg/CWRJS9B1eflopDck0V55MUkuz7xJZu7oARN/YiXVtK6xTPHdwZ3G7hFImeuSaLezdimF4uFqfyVmsfd52mkr0Xx4BcAH185ngxkZhyXps7y9eX3d+WpL91pgTRCYwBtoivW1MydbASBYVNetc6OmNpNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q6/skh/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q6/skh/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D92EC116D0;
	Mon, 23 Feb 2026 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771859687;
	bh=eCuaPH13svjz5HWI+NAGnQJXEv6pKnPoueR5MR5h+CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6/skh/t0/YWuC4YiNW0oipxvC6pyccp5PeTnbnHPUs+bJwWaFpvw9cyKAj3XZ7XK
	 ww+2MAUseJihcIN5MEO7Pc8MyZl4INCwlaRF4ouGPi2gT34Rb6t+6UwQHZlHgwd+Sp
	 dMO6dseeUcjzEkORJ3hIPXNXWFjuYaRX9latLkOM=
Date: Mon, 23 Feb 2026 16:14:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rivka <rivkab300@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase variable name
Message-ID: <2026022357-shirt-dowry-9dbb@gregkh>
References: <20260212072536.2817-1-rivkab300@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212072536.2817-1-rivkab300@gmail.com>

On Thu, Feb 12, 2026 at 09:25:36AM +0200, Rivka wrote:
> Rename pht_info_ie to ht_info_ie to address checkpatch warning.
> 
> Signed-off-by: Rivka <rivkab300@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 67197c7d4..9ab2219cd 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -802,7 +802,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  	int ret = _SUCCESS;
>  	u8 *p;
>  	u8 *pHT_caps_ie = NULL;
> -	u8 *pHT_info_ie = NULL;
> +	u8 *ht_info_ie = NULL;
>  	struct sta_info *psta = NULL;
>  	u16 cap, ht_cap = false;
>  	uint ie_len = 0;
> @@ -1060,7 +1060,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  		       &ie_len,
>  		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
>  	if (p && ie_len > 0)
> -		pHT_info_ie = p;
> +		ht_info_ie = p;
>  
>  	switch (network_type) {
>  	case WIRELESS_11B:
> @@ -1097,7 +1097,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  
>  		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
>  
> -		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
> +		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
>  	}
>  
>  	pbss_network->length =
> -- 
> 2.34.1
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
