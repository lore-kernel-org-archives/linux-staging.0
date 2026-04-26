Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF223ABBF
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 03:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261855; cv=none; b=Uj2ItwfRSHhzEL3uBj3baTI18BOyC4qT1WhM9TCVB2YXqL6po2Jiwuj68ez3DOCXsIMilDjb78kT3BZmYe4NmGNtJuNAdZCepsPWbb+p9IhBLo5XDBhNhBVWZLp+LfQEk10FVjHuKttxCacKmXjQLstiPjuZw1ciCc60ugAGc50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261855; c=relaxed/simple;
	bh=Wzrrfagxcsc4+eKumd+NY0j9NX/O6hkbZKXRHwzwuNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDbUDTWRCzRqLSi9BFJ9nWxu8H/JIUEaJ/hAsrNgbymEpPKwdJowa3Z2qrH4fj0Xq2DagxOxXTfT5SYFOj9ju5DiImXk1VS9d3K4LvOMXkWKEV0yM2wsWoGgxRMDkWOVU/T9BH52wfTldlZCC5cTVTxcEiUFr6vsIO1JsW1xhII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oE3xwoRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oE3xwoRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0D5C19425;
	Mon, 27 Apr 2026 03:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261855;
	bh=Wzrrfagxcsc4+eKumd+NY0j9NX/O6hkbZKXRHwzwuNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oE3xwoRoItnX97nRqLnPTty0ZSFR3+D74lorPyBKyYR1RRIelgG/4U/ygc8ustLMj
	 B847tPUQ2mFxtgo3mNUzeZzyYv1+c+nDkcQ/BgnAQef4bCvnPEha0pP1pM934V7SLF
	 6l289sNVbUZOAkL927dg4MoK+Dj+wIdNPkkbxXCo=
Date: Sun, 26 Apr 2026 21:37:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, luka.perkov@sartura.hr
Subject: Re: [PATCH] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key
Message-ID: <2026042626-tabloid-suitor-33c5@gregkh>
References: <20260413113224.5201-1-feng@innora.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413113224.5201-1-feng@innora.ai>

On Mon, Apr 13, 2026 at 11:32:30AM +0000, Feng Ning wrote:
> The cfg80211 framework allows key sequence counters (NL80211_KEY_SEQ)
> up to 16 bytes, but ieee_param.crypt.seq is a fixed 8-byte buffer.
> When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
> without checking seq_len, a heap buffer overflow of up to 8 bytes
> occurs, overwriting adjacent fields key_len and key[].
> 
> Cap the copy length at the buffer size using min_t().
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Feng Ning <feng@innora.ai>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 7cb0c6f22..4fba53c2d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -883,8 +883,11 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
>  
>  	param->u.crypt.idx = key_index;
>  
> -	if (params->seq_len && params->seq)
> -		memcpy(param->u.crypt.seq, (u8 *)params->seq, params->seq_len);
> +	if (params->seq_len && params->seq) {
> +		size_t seq_copy = min_t(size_t, params->seq_len,
> +				       sizeof(param->u.crypt.seq));
> +		memcpy(param->u.crypt.seq, (u8 *)params->seq, seq_copy);
> +	}
>  
>  	if (params->key_len && params->key) {
>  		param->u.crypt.key_len = params->key_len;
> -- 
> 2.43.0
> 
> 
> 

This really is v5, right?  What happened to the changelog information?

Please fix up and send a v6.

thanks,

greg k-h
