Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F33D667D;
	Mon, 11 May 2026 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518654; cv=none; b=Ml3qKDHhBGet74ZSZoIUG+UNtggU3E29X0bA6imTG9bcji1adGUKhD5mYhZKTg24SALmLhLokfJDzX5bUAuDYCSQYI0TWx5ckIpA/du6e9dTiSRM6V6V2Z0ESgQig1w5iAK28jXP4Y5PnPlvhs26prEOs0SV3mpPECcQockD7gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518654; c=relaxed/simple;
	bh=E7P/BbJJs1A1cOoCrmYpiQGezow5T7enhhnsL8hr/qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVlP7CurU7qSuP9PFiz5ap2zw86LMmPjlo4l2jPymIKaaHmIVWHgoHXhNohJVqe/vX+TyXZ1SbFpLpq0asdX1PPn83o4mVZucQOgLDQbteUCG4EhF4X5qgo/Dk4VGtOB7gVipG0ILOmbyraaBB+xsWwydvQtvVZgpv+FmQdhz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qeKQp52E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qeKQp52E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607B6C2BCC9;
	Mon, 11 May 2026 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778518653;
	bh=E7P/BbJJs1A1cOoCrmYpiQGezow5T7enhhnsL8hr/qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qeKQp52Ex6hQViHkNbh6QpIZA+6GrRlx9dHOb8kTpMN6ErFe9s+iTRkgCbZSSdsje
	 gb1lKQktI26NtJ2vFBpWICvkI3wNPItl+AQho36pbcBTeModCOHdOW0PLVVofljsiH
	 UdbD4bpGU00c3nB4GSNtc5nC0OsT0TqGalddpBc8=
Date: Mon, 11 May 2026 18:57:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayushman Rout <ayushmanrout27@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line lengths in rtw_cmd.c
Message-ID: <2026051113-peso-smoked-d8b1@gregkh>
References: <20260511152932.5894-1-ayushmanrout27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511152932.5894-1-ayushmanrout27@gmail.com>

On Mon, May 11, 2026 at 08:59:32PM +0530, Ayushman Rout wrote:
> Fixed 2 lines exceeding 100 characters
> 
> Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25ed36..e6857c9351ce 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -184,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>  		return -ENOMEM;
>  	}
>  
> -	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> +	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
> +		((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
>  
>  	pcmdpriv->cmd_issued_cnt = 0;
>  	pcmdpriv->cmd_done_cnt = 0;
> @@ -735,12 +736,16 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
>  	if (!pmlmepriv->assoc_by_bssid)
>  		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
>  
> -	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
> +	psecnetwork->ie_length = rtw_restruct_sec_ie
> +		(padapter, &pnetwork->network.ies[0],
> +		&psecnetwork->ies[0], pnetwork->network.ie_length);

Did you forget to run checkpatch on your patch?

Please always do so.

thanks,

greg k-h
