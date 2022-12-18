Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773803D76
	for <linux-staging@lists.linux.dev>; Sun, 18 Dec 2022 16:29:38 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1p6vvj-0007vO-HB; Sun, 18 Dec 2022 16:50:23 +0100
Date: Sun, 18 Dec 2022 16:50:23 +0100
From: Martin Kaiser <lists@kaiser.cx>
To: Kang Minchul <tegongkang@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Prefer kcalloc over kzalloc
Message-ID: <20221218155023.tn6244fhbtwgkl7o@viti.kaiser.cx>
References: <20221216223942.334221-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216223942.334221-1-tegongkang@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Kang Minchul (tegongkang@gmail.com):

> Fixed following checkpatch.pl warning:
>  * WARNING: Prefer kcalloc over kzalloc with multiply

> Instead of specifying (number of bytes) * (size) as arugment
> in kzalloc, prefer kcalloc.

> Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 34494f08c0cd..36ce1e3f9c81 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -1564,7 +1564,7 @@ int rtw_alloc_hwxmits(struct adapter *padapter)

>  	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;

> -	pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
> +	pxmitpriv->hwxmits = kcalloc(pxmitpriv->hwxmit_entry, sizeof(struct hw_xmit), GFP_KERNEL);
>  	if (!pxmitpriv->hwxmits)
>  		return -ENOMEM;

> -- 
> 2.34.1

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
