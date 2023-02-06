Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657722F47
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 09:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB7CC433EF;
	Mon,  6 Feb 2023 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675676853;
	bh=F1zVXNR0pCBjMMQRJ8RZFHCDx+mRQOAL4BbWy1HOY7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmtYlDvBA+icC7EHF91v2UQqj137PRgCJeR0R7irElNN2XAQRWYkoPLjOF7YTvLhV
	 d/TyiSSJWOj6PHx822sJRVsxxraMjugfbi/I+hJnpQAtam3RlTnKGg2j+ggl5Gk1xz
	 0yJL0hyh6jgQeOPU1ReWhrmc6yX8gKROOGFPU8r0=
Date: Mon, 6 Feb 2023 10:47:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: r8188eu: correct error logic of
 _rtw_init_recv_priv()
Message-ID: <Y+DMsdD4l2qPpKjM@kroah.com>
References: <20230204101654.10232-1-straube.linux@gmail.com>
 <20230204101654.10232-3-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204101654.10232-3-straube.linux@gmail.com>

On Sat, Feb 04, 2023 at 11:16:54AM +0100, Michael Straube wrote:
> Convert the function _rtw_init_recv_priv() away from returning _FAIL
> and _SUCCESS, which uses inverted error logic. Return 0 for success
> and negative values for failure instead.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_recv.c   | 17 +++++------------
>  drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 70d43c10e53d..4c823bbcc22b 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -99,10 +99,8 @@ static int rtl8188eu_init_recv_priv(struct adapter *padapter)
>  int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
>  {
>  	int i;
> -
>  	struct recv_frame *precvframe;
> -
> -	int	res = _SUCCESS;
> +	int err = 0;
>  
>  	spin_lock_init(&precvpriv->lock);
>  
> @@ -115,11 +113,8 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
>  	precvpriv->free_recvframe_cnt = NR_RECVFRAME;
>  
>  	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(struct recv_frame) + RXFRAME_ALIGN_SZ);
> -
> -	if (!precvpriv->pallocated_frame_buf) {
> -		res = _FAIL;
> -		goto exit;
> -	}
> +	if (!precvpriv->pallocated_frame_buf)
> +		return -ENOMEM;
>  
>  	precvpriv->precv_frame_buf = (u8 *)ALIGN((size_t)(precvpriv->pallocated_frame_buf), RXFRAME_ALIGN_SZ);
>  
> @@ -139,16 +134,14 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
>  	}
>  	precvpriv->rx_pending_cnt = 1;
>  
> -	if (rtl8188eu_init_recv_priv(padapter))
> -		res = _FAIL;
> +	err = rtl8188eu_init_recv_priv(padapter);

You are keeping the original logic here, but this is odd, nothing
actually changes if this is an error except you return it?  That seems
wrong, and you might want to fix that up in further patches.

thanks,

greg k-h
