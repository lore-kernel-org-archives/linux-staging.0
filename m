Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49A1F190
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 17:35:54 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-991c786369cso140002966b.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 10:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689269753; x=1691861753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XG/k/cRtJtXp+BY1mTTrU8F/8twPnwgKPwg/xoLbVKM=;
        b=evZSon4l1w3MFy/kCvyyEqoToXQToZRIyQSE9MND+5jNfHLI1TOCN+fjMOdMWOA+eS
         SzG6Y6kTOYR4Z/Krhkc6fJHoZayn+73DK3FCT9ATfk7bRASMH1TfvrUsJs60UlE/aYfP
         qeEoeRn4twXlBqmEjfP74nuKcGUY9y7qtuT0vLISYCbtAsSQbbnOeRROTUlWHHPkkC+M
         fH3JbQ6FuK8MZVAWkbkJrk/54EUGSnvXAtPfK5f7bh/aMvWrU5ott8xJPk29+ahNZ7uh
         NVqogluvhA43Bj6BaNjawBGZs9zKBlK5fduPGsjcO3yyuB3MFukoncPmBtWdHzCqP5p7
         njsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689269753; x=1691861753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG/k/cRtJtXp+BY1mTTrU8F/8twPnwgKPwg/xoLbVKM=;
        b=D2Mr4W9/hUW+JrsiaU1fXF40BLNES39qmJpWv+gu8hxifGrw9un+03sqyIbebilSoI
         Y3s6HUgQ2cx6vTLsAXv0KHh4qoAhFARZa9q7bJk9deLGuaCLZ+yCZRyEyWo3sLXf2jTy
         8pNJDYFRWmKbvi8WPz2+a0hIwEGnXKdln9BX6tA3wG0l8TpJorIPiEg7QZ4cVjB7uMkL
         elWq4WCo0pDvNN3I9pubh3JEqCoB/RvKtyBSE3lXxq7wBkGm/27GbzTjV+v8jsBdj2ip
         gavp/8HRBkPOOub5f3v0mp6Muvrb21iueLDcHDE/X1AWy65o9vLvwVFEgt95T8k0qtTK
         +g3Q==
X-Gm-Message-State: ABy/qLZTvucG/pd5CkoG44k9z6Ez9cxSBda08TNbmivZ3C3EmpRqA6fF
	It2rXSfNf5c6pfPpopPLWkk=
X-Google-Smtp-Source: APBJJlEoVwCZyYqw2lRcbmkrycs1KkdtU2F3uyCceyq6KuekHGCkgPRN1+ZfVY/y4X2+tmz583Jdbw==
X-Received: by 2002:a17:906:8474:b0:993:d589:8b70 with SMTP id hx20-20020a170906847400b00993d5898b70mr2158652ejc.10.1689269753041;
        Thu, 13 Jul 2023 10:35:53 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709061dcb00b00986211f35bdsm4204682ejh.80.2023.07.13.10.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:35:52 -0700 (PDT)
From: Your Name <namcaov@gmail.com>
X-Google-Original-From: Your Name <my.email@gmail.com>
Date: Thu, 13 Jul 2023 19:35:51 +0200
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: 7811: Fix memory leak in _r8712_init_xmit_priv
Message-ID: <ZLA1942ebuVcUT3h@nam-dell>
References: <20230712205733.29794-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712205733.29794-1-Larry.Finger@lwfinger.net>

On Wed, Jul 12, 2023 at 03:57:32PM -0500, Larry Finger wrote:
> In the above mentioned routine, memory is allocated in several places.
> If the first succeeds and a later one fails, the routine will leak memory.
> Fixes commit 2865d42c78a9 ("staging: r8712u: Add the new driver to the
> mainline kernel").
> 
> Fixes: 2865d42c78a9 ("staging: r8712u: Add the new driver to the mainline kernel")
> Reported-by: syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
>  drivers/staging/rtl8712/rtl871x_xmit.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> index 090345bad223..16b815588b97 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> @@ -117,11 +117,8 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
>  	_init_queue(&pxmitpriv->pending_xmitbuf_queue);
>  	pxmitpriv->pallocated_xmitbuf =
>  		kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf) + 4, GFP_ATOMIC);
> -	if (!pxmitpriv->pallocated_xmitbuf) {
> -		kfree(pxmitpriv->pallocated_frame_buf);
> -		pxmitpriv->pallocated_frame_buf = NULL;
> -		return -ENOMEM;
> -	}
> +	if (!pxmitpriv->pallocated_xmitbuf)
> +		goto clean_up_frame_buf;
>  	pxmitpriv->pxmitbuf = pxmitpriv->pallocated_xmitbuf + 4 -
>  			      ((addr_t)(pxmitpriv->pallocated_xmitbuf) & 3);
>  	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
> @@ -130,12 +127,12 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
>  		pxmitbuf->pallocated_buf =
>  			kmalloc(MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ, GFP_ATOMIC);
>  		if (!pxmitbuf->pallocated_buf)
> -			return -ENOMEM;
> +			goto clean_up_xmit_buf;
>  		pxmitbuf->pbuf = pxmitbuf->pallocated_buf + XMITBUF_ALIGN_SZ -
>  				 ((addr_t) (pxmitbuf->pallocated_buf) &
>  				 (XMITBUF_ALIGN_SZ - 1));
>  		if (r8712_xmit_resource_alloc(padapter, pxmitbuf))
> -			return -ENOMEM;
> +			goto clean_up_xmit_buf;
>  		list_add_tail(&pxmitbuf->list,
>  				 &(pxmitpriv->free_xmitbuf_queue.queue));
>  		pxmitbuf++;
> @@ -146,6 +143,14 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
>  	init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
>  	tasklet_setup(&pxmitpriv->xmit_tasklet, r8712_xmit_bh);
>  	return 0;
> +
> +clean_up_xmit_buf:
> +	kfree(pxmitbuf->pallocated_xmitbuf);
> +	pxmitbuf->pallocated_buf = NULL;

The allocation was done in a loop. Shouldn't memory from previous loop iterations
also be freed? And allocation by r8712_xmit_resource_alloc() should be freed too.

Best regards,
Nam
