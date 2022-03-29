Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A673E2572
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 15:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7B1C340ED;
	Tue, 29 Mar 2022 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648569426;
	bh=3Xtfj0qdi5cXHLbJKQrGPNIsGSjLL6x0WLhsq+/v46Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmOYMWUoCDRUBDheu6cIabeycMxE8ZjS8OWKaCZ7bUP1WyIBshy8ru93pCcunhuC2
	 APv+6B7Qgwnhfkynl8IKjhSimJFM9FiM7N4c7PJ/7y3kw2WpjPvbnwSDZ0RQUmzJMI
	 UG1jPO9nUogrIaJchgZqXVixvvOwiGlDU7zv7dXw=
Date: Tue, 29 Mar 2022 17:57:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: check the return value of kzalloc()
Message-ID: <YkMsTz/iJdgmUxtS@kroah.com>
References: <tencent_B489FA9F0FC49CF92A77916394E225DC4705@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B489FA9F0FC49CF92A77916394E225DC4705@qq.com>

On Fri, Mar 25, 2022 at 02:53:30PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to check the return
> of it to prevent potential wrong memory access.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_p2p.c  | 2 ++
>  drivers/staging/r8188eu/core/rtw_xmit.c | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
> index e2b6cf2..503c4a5 100644
> --- a/drivers/staging/r8188eu/core/rtw_p2p.c
> +++ b/drivers/staging/r8188eu/core/rtw_p2p.c
> @@ -35,6 +35,8 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
>  	DBG_88E("%s\n", __func__);
>  
>  	pdata_attr = kzalloc(MAX_P2P_IE_LEN, GFP_KERNEL);
> +	if (!pdata_attr)
> +		return 0;

0 is not an error.  Please propagate this error backwards properly.

>  
>  	pstart = pdata_attr;
>  	pcur = pdata_attr;
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 46fe62c..1696272 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -180,6 +180,10 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>  	pxmitpriv->free_xmit_extbuf_cnt = num_xmit_extbuf;
>  
>  	rtw_alloc_hwxmits(padapter);
> +	if (!pxmitpriv->hwxmits) {
> +		res = _FAIL;
> +		goto exit;
> +	}

You just leaked memory resources :(

How did you test this?


>  	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
>  
>  	for (i = 0; i < 4; i++)
> @@ -1524,6 +1528,8 @@ void rtw_alloc_hwxmits(struct adapter *padapter)
>  	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;
>  
>  	pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
> +	if (!pxmitpriv->hwxmits)
> +		return;

You have to return an error, you can not keep going as if all is well.

Please always be VERY careful with these types of fixes.  Especially if
you have not tested them.

thanks,

greg k-h
