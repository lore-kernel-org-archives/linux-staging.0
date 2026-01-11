Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274FD1547EE;
	Sun, 11 Jan 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768136427; cv=none; b=osAkf7oG7XgU+8yYo6WikCo7ijcbdWeHFKkgGK0RmA0S0ALpllWnWjlelO7kuR4vYudypjQqhRibIDp9JLJJBqqR9jaUHTL2kB0RMF30TMGPe2kqXlr7LhhB7qYMytSaQYDLrYj01rutIPl7H9vLl3DsdHzeSdCrgivgh5fnBXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768136427; c=relaxed/simple;
	bh=wdPo6RFovzcmN4MnmNRESxbbAc8u9Xy7wab7O/GzO+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7euSQr1T21aoUayQ+QgJgGyAFhJZfPqmqI7cyEnFRhub7qoRiZJy+Yv/NtjfLxGP675pwxoxjByt1iizTmB9MTlNT5KO66vRmL9YZY+SDamtfri17Q/88mCTvAPLmaK75ll4KgLd24/OhOdYQkhKBU5AXfjaTZrdiaretehYaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wvRYViuc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wvRYViuc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685C8C4CEF7;
	Sun, 11 Jan 2026 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768136426;
	bh=wdPo6RFovzcmN4MnmNRESxbbAc8u9Xy7wab7O/GzO+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wvRYViucJr8dkBSqC87nHojCyoCGiea8v6qEPPqjRFHCuP0/hm28mMeP/NVXBlOgK
	 pTyRpMxgU+rGEHJMpk9F+o29hP6pmaBa4g5oz1b7mqxY6rZXpcXsj6fbntTncDo0d+
	 d/fT2X2x0v09GAgizY6ycqE7mExXydRM2lwW8zb8=
Date: Sun, 11 Jan 2026 14:00:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anubhav Kokane <dev.anubhavk@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix comparison order in
 rtw_ieee80211.c
Message-ID: <2026011107-confetti-fender-fe89@gregkh>
References: <20260111090034.9323-1-dev.anubhavk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111090034.9323-1-dev.anubhavk@gmail.com>

On Sun, Jan 11, 2026 at 09:00:34AM +0000, Anubhav Kokane wrote:
> Fix checkpatch warning: "Comparisons should place the constant on the
> right side of the test".
> 
> Move the constant _SUCCESS to the right side of the comparison
> operator.
> 
> Also fix whitespace around binary operator '+' and wrap lines to fit
> coding style limits.
> 
> Signed-off-by: Anubhav Kokane <dev.anubhavk@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 8fdeeda88..f45ae5d5f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -1009,7 +1009,8 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
>  	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
>  
>  	if (pbuf && (wpa_ielen > 0)) {
> -		if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
> +		if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
> +				     &pairwise_cipher, &is8021x) == _SUCCESS) {
>  			pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
>  			pnetwork->bcn_info.group_cipher = group_cipher;
>  			pnetwork->bcn_info.is_8021x = is8021x;
> @@ -1019,7 +1020,8 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
>  		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
>  
>  		if (pbuf && (wpa_ielen > 0)) {
> -			if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
> +			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
> +					      &pairwise_cipher, &is8021x) == _SUCCESS) {
>  				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
>  				pnetwork->bcn_info.group_cipher = group_cipher;
>  				pnetwork->bcn_info.is_8021x = is8021x;
> -- 
> 2.43.0
> 
> 

Does not apply to my tree anymore, due to someone else sending this
same change right before you did, sorry.

greg k-h
