Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640C7A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 14:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C47C2BBE4;
	Mon,  4 Apr 2022 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649082620;
	bh=IcyeBgAAHvxYwTuDheUzskHb8csMKwWLHu5b7gmdrPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsTHmvgfz6NoHTcPiSkjvpj1w8YRqu+NyMyFORt01iwcWnSjP52tpYcBJcznduvEx
	 SCTXFaChc89lRt6EoZJAaQ1apaHvnHqX6QlieQR3l1CfIh9jMs5yjNfGR7DHU/p17s
	 sk+WrsCppy8BXrs0P4eYX/lbJc8C8viaEHTnVARs=
Date: Mon, 4 Apr 2022 16:30:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8712: change the type of
 _r8712_init_recv_priv()
Message-ID: <YksA+X5ip+sdrDjV@kroah.com>
References: <tencent_0A1273526E1E87150578F8B752CF7F178806@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_0A1273526E1E87150578F8B752CF7F178806@qq.com>

On Fri, Apr 01, 2022 at 01:06:35AM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> There is a memory allocation in _r8712_init_recv_priv(). Since the
> original type of this function is void, now it is changed to int to
> make the error of allocation failures propagate to its caller easily.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/rtl8712/recv_osdep.h   | 2 +-
>  drivers/staging/rtl8712/rtl871x_recv.c | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/recv_osdep.h b/drivers/staging/rtl8712/recv_osdep.h
> index d8c1fa7..f5b97c5 100644
> --- a/drivers/staging/rtl8712/recv_osdep.h
> +++ b/drivers/staging/rtl8712/recv_osdep.h
> @@ -18,7 +18,7 @@
>  #include "drv_types.h"
>  #include <linux/skbuff.h>
>  
> -void _r8712_init_recv_priv(struct recv_priv *precvpriv,
> +int _r8712_init_recv_priv(struct recv_priv *precvpriv,
>  			   struct _adapter *padapter);
>  void _r8712_free_recv_priv(struct recv_priv *precvpriv);
>  void r8712_recv_entry(union recv_frame *precv_frame);
> diff --git a/drivers/staging/rtl8712/rtl871x_recv.c b/drivers/staging/rtl8712/rtl871x_recv.c
> index c23f6b3..dd8cb07 100644
> --- a/drivers/staging/rtl8712/rtl871x_recv.c
> +++ b/drivers/staging/rtl8712/rtl871x_recv.c
> @@ -44,7 +44,7 @@ void _r8712_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
>  	_init_queue(&psta_recvpriv->defrag_q);
>  }
>  
> -void _r8712_init_recv_priv(struct recv_priv *precvpriv,
> +int _r8712_init_recv_priv(struct recv_priv *precvpriv,
>  			   struct _adapter *padapter)
>  {
>  	sint i;
> @@ -60,7 +60,7 @@ void _r8712_init_recv_priv(struct recv_priv *precvpriv,
>  				sizeof(union recv_frame) + RXFRAME_ALIGN_SZ,
>  				GFP_ATOMIC);
>  	if (!precvpriv->pallocated_frame_buf)
> -		return;
> +		return -ENOMEM;
>  	kmemleak_not_leak(precvpriv->pallocated_frame_buf);

Why are you still telling kmemleak that this was not a leak if you
properly handle it?

thanks,

greg k-h
