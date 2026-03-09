Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81D71E1C11
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075206; cv=none; b=lEZMp7TUK6LO/sO1LcRIv16Rnw2lEdmr2UluH4gYSSUiqJbG7644BgDy+pCr7ZSnf9tWrCgh9IzsWBml8Twgtff2WW2LSjy7+2jgIZlhF+RKjVPqQDXZJbHr/HsJGurJG6Ajlsg1dIHtVRMqs16dD4kfH7OQqwFQ/DoLvVJ2Cx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075206; c=relaxed/simple;
	bh=oOYMTXtBqVpOUDN70ylK5T3IBBKC+hJa2REoxOWELlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS2tGnx6vi1CAnsbvL5G8FaeoLbawsbUJ01KNQUiUzPXRxFIFNUXgvbGxIHG8FcRomt+tIAewlOML1iRORRXVoJxr8MaGqOvbgMNoAj6B2fhP9wW3kzBPQbj2WmzzSoaPISFmMbIfLHCkVumDs0ylyNl4v6sFH/QwKIfKV0XEV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0fSt/qnO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0fSt/qnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF647C4CEF7;
	Mon,  9 Mar 2026 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075206;
	bh=oOYMTXtBqVpOUDN70ylK5T3IBBKC+hJa2REoxOWELlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0fSt/qnOhvwSAbYUt1EfIhP0sh+SFOiik+J72uSpTPOr0ovPykiATpHnZbzYdaICh
	 O4wbOaBxrOeOzy9d08rutinf30JAloHNb9gT1WT5n+8ZbyrjWpP9lywhnKUyUqd7GI
	 MLEpAc8VSqA8IqDZbkRwkuJTj9sPAHsxvtxw/ahY=
Date: Mon, 9 Mar 2026 17:53:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: linux-staging@lists.linux.dev, ethantidmore06@gmail.com
Subject: Re: [PATCH 1/4] staging: rtl8723bs: replace rtw_if_up() return type
 to bool
Message-ID: <2026030959-obsessive-scuff-26c4@gregkh>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
 <20260307160024.18039-2-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307160024.18039-2-nikolayof23@gmail.com>

On Sat, Mar 07, 2026 at 06:58:30PM +0300, Nikolay Kulikov wrote:
> Function rtw_if_up() actually return 'bool' value, but it's type is
> 'signed int'. Replace 'signed int' with 'bool' to make it more accurate.
> 
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c    | 6 ++----
>  drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 28dfb974fdff..85ec172d6a89 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -262,15 +262,13 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
>  	spin_unlock_bh(&scanned_queue->lock);
>  }
>  
> -signed int rtw_if_up(struct adapter *padapter)
> +bool rtw_if_up(struct adapter *padapter)
>  {
> -	signed int res;
> +	bool res = true;
>  
>  	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
>  		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
>  		res = false;
> -	else
> -		res =  true;
>  
>  	return res;

No need for res at all, just return true/false instead?

thanks,

greg k-h
