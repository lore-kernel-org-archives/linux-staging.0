Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E72100
	for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 09:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D469C341C8;
	Mon, 27 Jun 2022 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656320814;
	bh=1gnVoaGuW6a9eUN1HMGFl1vsiRYSGtGUhkQ+scokzb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGoQlVBNwVHtMmTI89fC8rV1T9cwXGPJ/P/klazH38euiLYM6z22qK3/OVbVxDAqp
	 Y26odl5Rm8y3O1pS8bshbWe9p13b5I88nfxKMEtD+C5Ueb9x7XKGd8dUDSh2nwoM/G
	 vBlRrVOHWqKTlqWdLvXJ9PWX9OuF7mGutuuIQkd4=
Date: Mon, 27 Jun 2022 11:06:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: drop return value from
 receive_disconnect
Message-ID: <YrlzLEf1atin6gBd@kroah.com>
References: <20220626180734.287137-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220626180734.287137-1-martin@kaiser.cx>

On Sun, Jun 26, 2022 at 08:07:34PM +0200, Martin Kaiser wrote:
> The receive_disconnect function always returns _SUCCESS. None of the
> callers checks the return value. We can remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 5 ++---
>  drivers/staging/r8188eu/include/rtw_mlme_ext.h | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index cce0575e93b7..fc6e06d7b5ca 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -6191,14 +6191,14 @@ void start_clnt_assoc(struct adapter *padapter)
>  	set_link_timer(pmlmeext, REASSOC_TO);
>  }
>  
> -unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
> +void receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
>  {
>  	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
>  	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
>  
>  	/* check A3 */
>  	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
> -		return _SUCCESS;
> +		return;

Shouldn't this check return an error instead of success?  If not, what
exactly is this checking this for?

thanks,

greg k-h
