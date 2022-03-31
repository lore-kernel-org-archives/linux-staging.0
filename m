Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC87E0
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D4AC340ED;
	Thu, 31 Mar 2022 06:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648706644;
	bh=hOXJMkseS08e01CeIVsti+iIcXcRTuNM0gHg+/pTb7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mB8dpQdEYJ3yPLeN9gzkAvyY7gKX0Hto9KYiqC4hN9Ibp7cyqIAfw0ak2DggvEiRc
	 n4f76aBtc2qJnQITwcwaxAnLLIouYb7qn585VlD7VSmN3ONKLinOz1W3XUblqQcDHM
	 qFnHuSFwmXPZgzp7g6VpM9uiop7oq4N0CHvzIeL0=
Date: Thu, 31 Mar 2022 08:04:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: r8188eu: fix potential memory leak in
 _rtw_init_xmit_priv()
Message-ID: <YkVEUnEh2tRev6EY@kroah.com>
References: <tencent_12789CD2DEBF33C818B3542E170737854506@qq.com>
 <tencent_2F72CC5068850B2BEDFC2B8058303FE6520A@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2F72CC5068850B2BEDFC2B8058303FE6520A@qq.com>

On Wed, Mar 30, 2022 at 11:29:22PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In _rtw_init_xmit_priv(), there are several error paths for allocation
> failures without releasing the resources.
> To properly release them, there are several error lables and some
> modifications for rtw_os_xmit_resource_free().
> The `for(; i >= 0; i--)` is to only release the explored items.
> While the modifications for rtw_os_xmit_resource_free() is 
> corresponding to the logic of rtw_os_xmit_resource_alloc() to break 
> unintentional wrong operations. 
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_xmit.c     | 41 ++++++++++++++++++---
>  drivers/staging/r8188eu/os_dep/xmit_linux.c |  8 +++-
>  2 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 5888979..813bddf 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -112,7 +112,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>  
>  	if (!pxmitpriv->pallocated_xmitbuf) {
>  		res = _FAIL;
> -		goto exit;
> +		goto free_frame_buf;
>  	}
>  
>  	pxmitpriv->pxmitbuf = (u8 *)N_BYTE_ALIGMENT((size_t)(pxmitpriv->pallocated_xmitbuf), 4);
> @@ -134,7 +134,12 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>  			msleep(10);
>  			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
>  			if (res == _FAIL) {
> -				goto exit;
> +				pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
> +				for (; i >= 0; i--) {
> +					rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
> +					pxmitbuf++;
> +				}

This logic should be at the end of the function, when you are exiting
due to an error.  Don't duplicate it in multiple places, that way is
ensured to get out of sync eventually.

thanks,

greg k-h
