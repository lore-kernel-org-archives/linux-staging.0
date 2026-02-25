Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E143ACF17;
	Wed, 25 Feb 2026 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032066; cv=none; b=ljgBDWtNyJWcLu9JPqvRB7M9J3MUwhPqB0b8Jmu5jGt1C0sLfQ5bktRu4fWkjdSVQmuzI0FZFxdwMMVFYHg844qmuxzkELmt5zXwICNKQUwfmCwHBR+NecmcDzYKL6JdOhPIuq1s3I6P6JsqnkzSnfbEmJLEpCds6kwMx8V9EcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032066; c=relaxed/simple;
	bh=W9ZEFAx4LeiYLV5xy1we3vMgUayjTFSOD9WZCKUWqQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx+Wc0XqmXnySnFYYPY4J2Esu3Lq4lLIrYJQ+UZ5KBc4Mx0ezYj5ylKTNOIpYao4TwsjERFE1+zfzsD5wnqYkGxd3Ug/s6lAJTmtysfXyDrU5m36qgC+Qr0yyBzpChSiv0qZXat/hg+N0OEjHoC3+rU8o7/py7BNHAdr4o6cOYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R5XdrO+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R5XdrO+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F52AC19421;
	Wed, 25 Feb 2026 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772032066;
	bh=W9ZEFAx4LeiYLV5xy1we3vMgUayjTFSOD9WZCKUWqQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5XdrO+W1aGzdqCt+2YU9B0GD3U9KghtITTO4gISTzJrLq6sMXruTyaqS/QiPuAyx
	 0amSK35bjeK0+YLEEXxzPghcebcmZ9yvEcsYWKRzIeeWOyz7LJOdkOXzHfpiNl3MCo
	 jMIXOhM5m9jDtq570Dm5rEoXmEnXdcAW6mXu0lp4=
Date: Wed, 25 Feb 2026 07:07:38 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Rivka Bukchin <rivkab300@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix CamelCase variable name
Message-ID: <2026022525-prowler-tapestry-1881@gregkh>
References: <20260225142210.3493-1-rivkab300@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225142210.3493-1-rivkab300@gmail.com>

On Wed, Feb 25, 2026 at 04:22:10PM +0200, Rivka Bukchin wrote:
> Rename pHT_info_ie to ht_info_ie to address checkpatch warning.
> 
> Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>
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
