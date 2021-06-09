Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742172
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 10:37:59 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 102-20020a9d0eef0000b02903fccc5b733fso429483otj.4
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fFi8//Jkb3RjJoIz0ovgttmGp4ert/bfI3tH5gBS+JA=;
        b=HTFEHnSHFsYKfVW1wqDi57e7qrpPUal/hvNWcDIRtAH/q2dAFf8DOpB+nesCqsqfVg
         axa8WOhGXfeHS3jKcNdt9D+3Kez7irZItUsFB9RfWkvqkeBo7+/gTNW8KA6zVqtyTWIo
         +qo4IsfYRni6fvIAWLaHuWJXh2T2H1raPEaoPVvPLM3DZ0GLCT3MBjncplaRzzq2K135
         WQdCxwz5Asm0WMGH0FD0zqPSHnvXOS8Lpdm+lEzY4rWsRNlLKcsNtyl5neUkGwWsGxSW
         A6hHbaKUfH7UdgFWBXh6n08LTJpUjh6t5hJ30DjiGD5cAXhOYFWHmYQteA6XNc2MMe4N
         gi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fFi8//Jkb3RjJoIz0ovgttmGp4ert/bfI3tH5gBS+JA=;
        b=apFPAXyzvoqIP3ern6/tYwQ12iVFhvOwweENO1omaVwObfpAf+cF3b462zjqRA8VPX
         4tCCSFjnJAeIbiBotL+hGbGCvNvg+QNpFnE9HOspfx3YJe4C3/E4ou3Nd6ujUCZjIwdh
         BKfJa67wN/Nea/WHA7Kv5x71x/7MjaOZ8QChS7Mbt1XJtdml1XJNT6iWSlSnE/1CP36a
         ZSKQxEgfxWgmkR9a5Zc4e3aJeSqzE/kBuUiLugqGqdRvigCWuGFjyfq4nu3tBELg4bx6
         NoSGxCuyjxmw1+MbrLZbR4u2NXbZKAwfn9V1YpHCo3ciro4QFcH2KR1xY2haoVQTdFNt
         T2xQ==
X-Gm-Message-State: AOAM5313O1j8NP0CwHZe7GG/31RxSoS2cWweDD7XvH6dpFEN1Yt9ellK
	bdigOdHR4DO1SfXkwKjvLWY=
X-Google-Smtp-Source: ABdhPJzFyNWuqMRUMtqhGq43VKU6r0meNlR5eNDrG70/UvmV8Al20SqXvqOURHzZmHBQq6pzZVYlDA==
X-Received: by 2002:a9d:405:: with SMTP id 5mr23003438otc.9.1623235078909;
        Wed, 09 Jun 2021 03:37:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f25sm1368327oto.26.2021.06.09.03.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:37:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Jun 2021 03:37:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Romain Perier <romain.perier@gmail.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 6/7] staging: rtl8188eu: use safe iterator in
 rtl8188eu_xmitframe_complete()
Message-ID: <20210609103757.GF3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5i8W7BNla2DlrW@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5i8W7BNla2DlrW@mwanda>

On Mon, Jun 07, 2021 at 09:18:25PM +0300, Dan Carpenter wrote:
> This loop calls rtw_free_xmitframe(pxmitpriv, pxmitframe) which removes
> "pxmitframe" (our list iterator) from the list.  So to prevent a forever
> loop we need to use a safe list iterator.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> index 10a8dcc6ca95..19055a1a92c1 100644
> --- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> +++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> @@ -414,6 +414,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  				  struct xmit_priv *pxmitpriv)
>  {
>  	struct xmit_frame *pxmitframe = NULL;
> +	struct xmit_frame *n;
>  	struct xmit_frame *pfirstframe = NULL;
>  	struct xmit_buf *pxmitbuf;
>  
> @@ -422,7 +423,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  	struct sta_info *psta = NULL;
>  	struct tx_servq *ptxservq = NULL;
>  
> -	struct list_head *xmitframe_plist = NULL, *xmitframe_phead = NULL;
> +	struct list_head *xmitframe_phead = NULL;
>  
>  	u32 pbuf;	/*  next pkt address */
>  	u32 pbuf_tail;	/*  last pkt tail */
> @@ -507,10 +508,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  	spin_lock_bh(&pxmitpriv->lock);
>  
>  	xmitframe_phead = get_list_head(&ptxservq->sta_pending);
> -	list_for_each(xmitframe_plist, xmitframe_phead) {
> -		pxmitframe = list_entry(xmitframe_plist, struct xmit_frame,
> -					list);
> -
> +	list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
>  		pxmitframe->agg_num = 0; /*  not first frame of aggregation */
>  		pxmitframe->pkt_offset = 0; /*  not first frame of aggregation, no need to reserve offset */
>  
> -- 
> 2.30.2
> 
