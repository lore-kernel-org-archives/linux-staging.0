Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2130C29CA
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 09:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA5CC004E1;
	Tue,  8 Feb 2022 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644313460;
	bh=lUoNb62Lq9FASwuSu15eW59Kx2+UCvqdXJF+KIBTrEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPbub3oGEMtLKMEte6nnKtTe5kKYEGC2Sw+7JRCCJkQv8qHT3QJKL85VtWlQhs45l
	 Wz6+zXZ8oWnxhCz0L5oJlsZONy8M1Wx1DARBFvCoHirO3eRA3FoMXUdipMSm8QJpwf
	 iMvccnnrHs5UASFRHd6PEIQKPRx9WH1GI6IERktU=
Date: Tue, 8 Feb 2022 10:44:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Leonardo Araujo <leonardo.aa88@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: core: Concatenated strings should use
 spaces between elements
Message-ID: <YgI7cZ+YhZccXq8g@kroah.com>
References: <20220207235643.29768-1-leonardo.aa88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207235643.29768-1-leonardo.aa88@gmail.com>

On Mon, Feb 07, 2022 at 08:56:43PM -0300, Leonardo Araujo wrote:
> This patch fixes the following checkpatch.pl warning:
> 
> CHECK: Concatenated strings should use spaces between elements
> 
> Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
> index c7803144355a..30f5ad4e7ca7 100644
> --- a/drivers/staging/r8188eu/core/rtw_ap.c
> +++ b/drivers/staging/r8188eu/core/rtw_ap.c
> @@ -1093,7 +1093,7 @@ int rtw_sta_flush(struct adapter *padapter)
>  	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
>  	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
>  
> -	DBG_88E(FUNC_NDEV_FMT"\n", FUNC_NDEV_ARG(padapter->pnetdev));
> +	DBG_88E(FUNC_NDEV_FMT "\n", FUNC_NDEV_ARG(padapter->pnetdev));
>  
>  	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
>  		return ret;
> -- 
> 2.29.0
> 
> 

This too does not apply, sorry.

greg k-h
