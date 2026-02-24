Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908C1CBEB9;
	Tue, 24 Feb 2026 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956695; cv=none; b=GUlM0RwhgtPAph0ZAwqJw1TqCxeCVcsLKAGr96dtKNTFuBTkAaRGR2s57pDfaiPbnP8lAzGw8gCCjPqOYkjv7pnFz0LF8rXx4Wmt9eO+QcMlHzOyEWI3f+29f8PjvTqAIf9+0UL7aeQ/pG+kM9ba8g55NdDawRZn3gM1GLYzIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956695; c=relaxed/simple;
	bh=DaqufXpXzxKzTzL6amuGYm1ikhFqCJcQvZxyaMXVgw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4THEtmgt8/yzKH4wmAbith1PdGfxyR4bhYLLVmnCJvBvyakCJAsEBGx8jxdmwmbUJL0aRtL4MeLyhqHQ/cdbBm813Wc1y/NrpKxia0zVIHTdU+JwQ0olS5pWx7+0NFY3L8WBEuSXfR8uq9h54iU47bBC2Xj6Ci8uyMUnJ4HTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wjonzioI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wjonzioI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62C6C19422;
	Tue, 24 Feb 2026 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771956695;
	bh=DaqufXpXzxKzTzL6amuGYm1ikhFqCJcQvZxyaMXVgw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wjonzioIJ246EO0A8mAh3mogH9I6E33SRWQVe6b/7IeH/+njebSl9eVOfPGHqrTRf
	 YJ+QaFWJb1H0u0JH4W+YaR3Sf2z8ssbXqWJwfFALIWLEwBr+/fIkqvxBCE5HjJva4H
	 DYeiHz32sKQHxNQoOg2ieJ5sMLpFCT9tM3gcr5ec=
Date: Tue, 24 Feb 2026 10:11:29 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: dan.carpenter@linaro.org, ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace comparison to false with !
Message-ID: <2026022410-upswing-gurgle-532d@gregkh>
References: <20260223170708.9627-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223170708.9627-1-mariyam.shahid135@gmail.com>

On Mon, Feb 23, 2026 at 10:07:07PM +0500, Mariyam Shahid wrote:
> Replace comparisons to false with their logical negation
> to fix checkpatch warnings.
> 
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index ebe73abab892..0192543cdec0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  
>  		rtw_ht_use_default_setting(padapter);
>  
> -		if (pmlmepriv->htpriv.sgi_20m == false)
> +		if (!pmlmepriv->htpriv.sgi_20m)
>  			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
>  
> -		if (pmlmepriv->htpriv.sgi_40m == false)
> +		if (!pmlmepriv->htpriv.sgi_40m)
>  			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
>  
>  		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
> -- 
> 2.43.0
> 

This doesn't apply to my tree as someone else sent this change before
you and I applied it, sorry.

thanks,

greg k-h
