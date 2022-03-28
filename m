Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB67C
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 08:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C96C340ED;
	Mon, 28 Mar 2022 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648457267;
	bh=aCy1183IFeSJEQ/PvYRHTMEfAcgEEitlYrwCkkKgiSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MX3gCVLJyItskiLMyOpDpXgDdaC2i9inH9p+RNcDTUqYTphF66BnOK1B/otYzGxUK
	 2TraMoHCww74EnS9ZquMBxPHBsFGqCZIPgfSVK3kKVklcTZkLw+ATny7mKTujwe+nX
	 6qSaISaGLQyfGIE+sdXdVYkRjXMMKF2Y+tOWhmbE=
Date: Mon, 28 Mar 2022 10:47:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] staging: r8188eu: Directly return _SUCCESS instead of
 using local ret variable
Message-ID: <YkF2MRdxlUWow0UC@kroah.com>
References: <1648457028-4226-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648457028-4226-1-git-send-email-baihaowen@meizu.com>

On Mon, Mar 28, 2022 at 04:43:48PM +0800, Haowen Bai wrote:
> fixes coccinelle warning:
> ./drivers/staging/r8188eu/core/rtw_mlme_ext.c:357:5-8: Unneeded variable: "res".
>  Return "_SUCCESS" on line 380
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
> V1->V2: split into two patches.
> 
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 931e6f2..4b7b0ee 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -354,7 +354,6 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
>  
>  int	init_mlme_ext_priv(struct adapter *padapter)
>  {
> -	int	res = _SUCCESS;
>  	struct registry_priv *pregistrypriv = &padapter->registrypriv;
>  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -377,7 +376,7 @@ int	init_mlme_ext_priv(struct adapter *padapter)
>  
>  	pmlmeext->active_keep_alive_check = true;
>  
> -	return res;
> +	return _SUCCESS;

If a function can only ever succeed, why return anything?  Please make
this a function return void.

thanks,

greg k-h
