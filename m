Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD4285068;
	Mon, 23 Feb 2026 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859962; cv=none; b=Aer6CWQuJiRVGYtkmCj0SBZAhcsxCxVk/L/CnDzC5WVbnuTHBm+w80X5CO4wsZV/Z2K+iKeBFdiUFSRYJiDIKAevO053jDTNBmzJKV07Z8+0rRVirAHuRIHem2I/K9+AdjqmwffzgiVqsfWSPRTOitF68OfFNYL7aEWEE7U7ERM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859962; c=relaxed/simple;
	bh=LEvnGaZ3XtrcfVLbhUWKV72MLTHH/vtd8rfDlK5Yzws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyYE15Ox7XQFNZx//IkoNEmISGuW8563K/WuJ4bRv2Qk67hCjcqTQkBRJojsK30K9chIu63SEUoQToykrOw/oevV/PtkH8yM4mX++unioBRwLYoQyHkkfOs2MmlwmjHu1Jr3At7KWaHwedRB7BU2e1jKs/lSGTiwz8TuMctW8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mC5IFWkR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mC5IFWkR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5046BC116C6;
	Mon, 23 Feb 2026 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771859961;
	bh=LEvnGaZ3XtrcfVLbhUWKV72MLTHH/vtd8rfDlK5Yzws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mC5IFWkRJiWmZh717KJ5gDBE9PC6bWtSjbIgHxL3ImCTu7c6oFDuNjZQru0FzPjFv
	 jsZgK81DvbWIgudJU504uajPV4oZWsJUo+B/4wEWGTx6Xy/LtMN79q3KonDBr7Nly8
	 1oA54F97wBh867eJu2oxt+/QNiRzSaph66QfPYCc=
Date: Mon, 23 Feb 2026 16:19:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix YODA condition warnings
Message-ID: <2026022352-squid-consult-b1d7@gregkh>
References: <20260211135545.13505-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211135545.13505-1-mariyam.shahid135@gmail.com>

On Wed, Feb 11, 2026 at 06:55:45PM +0500, Mariyam Shahid wrote:
> Place the constants on right side of the comparison in rtw_security.c
> to follow kernel coding style. This resolves a checkpatch warning.
> 
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 8ee5bed252bf..601178dafcc7 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -1488,7 +1488,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
>  	struct security_priv *securitypriv = &(adapter->securitypriv);
>  	signed int keyid;
>  
> -	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
> +	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) ||
> +	    (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
>  		for (keyid = 0; keyid < 4; keyid++) {
>  			if (securitypriv->key_mask & BIT(keyid)) {
>  				if (keyid == securitypriv->dot11PrivacyKeyIndex)
> -- 
> 2.43.0
> 
> 

Does not apply to 7.0-rc1 :(
