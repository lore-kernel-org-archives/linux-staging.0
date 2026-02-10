Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1B27A904;
	Tue, 10 Feb 2026 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738081; cv=none; b=iZRDN589dy5o0BLbIA9HAbtGvcIuPAH+7V2/csVYENCq1qsDBpePUn2i+amaAkA10ZaU6VBJk7P/cmnb4gxrVizeHW7DPX826p5mLWG0CZyGkRpAdDxboseojQPTMncYogn93A3cA8uBGyFZWNpPL4s0BOWo9n9h1QJmr8IBFtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738081; c=relaxed/simple;
	bh=KhKyy1AI1aL4SkkvnPKm9SgPrkZbtrY0Po/EVlnagBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IG13FzZwmEXXwgCnSaV6iKgHoLNjahxuYRKMjFNwA7FuITqOVOJhG2X2kdtWj8l5Yi69QWZNrCPg5yPc8vrL6QNsd4lWVSDq81zaQ4GL6GvDkQICpnvKSau73DWS8rU/cZvrkvt0d5HHJiAqfdDVtiWyLNqDV2IJhsJqoIN7qko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qD4MS5/M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qD4MS5/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813A3C116C6;
	Tue, 10 Feb 2026 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770738081;
	bh=KhKyy1AI1aL4SkkvnPKm9SgPrkZbtrY0Po/EVlnagBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qD4MS5/MiTWllexXxTlJxH0DYaHt36GPnEQT5Sd7Ai+YnNM8IwTtKCoQsHB8KOkEh
	 3/T+RGNEnIDJoWm/VAJigF/8tEbTMg6Bp1cIJe/0eRU0skx2igLZhMaPcx3gyE5FzU
	 9rYJDnxntsJDGbntTRwzpOGpbHwLw7OPBGQRlSA4=
Date: Tue, 10 Feb 2026 16:41:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: trohan2000@gmail.com, bqn9090@gmail.com, straube.linux@gmail.com,
	hansg@kernel.org, abrahamadekunle50@gmail.com,
	davidzalman.101@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: use block-scoped loop variable in
 rtw_ap.c
Message-ID: <2026021006-abdominal-kleenex-f36e@gregkh>
References: <20260210152812.15637-2-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210152812.15637-2-dharanitharan725@gmail.com>

On Tue, Feb 10, 2026 at 03:28:13PM +0000, Dharanitharan R wrote:
> Convert the loop iterator to a block-scoped declaration
> using C99-style for-loop initialization.
> 
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 67197c7d4a4d..919bf8db6002 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -178,7 +178,6 @@ void expire_timeout_chk(struct adapter *padapter)
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	u8 chk_alive_num = 0;
>  	char chk_alive_list[NUM_STA];
> -	int i;
>  
>  	spin_lock_bh(&pstapriv->auth_list_lock);
>  
> @@ -278,7 +277,7 @@ void expire_timeout_chk(struct adapter *padapter)
>  		}
>  
>  		/* issue null data to check sta alive*/
> -		for (i = 0; i < chk_alive_num; i++) {
> +		for (int i = 0; i < chk_alive_num; i++) {
>  			int ret = _FAIL;
>  
>  			psta = rtw_get_stainfo_by_offset(pstapriv, chk_alive_list[i]);
> -- 
> 2.43.0
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
