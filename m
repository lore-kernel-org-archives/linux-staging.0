Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0618572
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 10:39:24 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id l13-20020a9d708d0000b02903fca0eacd15so531741otj.7
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KqX35mCyxhWCPmImmyUXFJ6q/RCRNm/UJq3q6VtoIW0=;
        b=L3bUf/YNw4EiSAx+NN0M/nD53ZmJuIViEpNAZe5oi/7bko+QO31e9HaJFXR6TYYaEF
         0O6e4xkoum+yHa2sfj8I3PIsOsNnM916tu1XLYJvEk9tQ4btu2GH723pIthIyxxPaL9W
         Cs8an+Y5kQjE4urVDLUujhgj/Nh2YlbAG05if+nhZvJ74ypXtiPl61yzvIJaZ6qEPHnV
         AFeegMWfCCPGl/CMzJJ9esSEPEibqRx1eaal76CBVioJR+QcnDzRBsOWaMj4HcUZfV3z
         uGwTnVkKLf/+ppYiF3P1szB3mskDV8xP3T1r83Cel/o6WeduauQ9EsA3mRP4Ap6tgy1Z
         OelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KqX35mCyxhWCPmImmyUXFJ6q/RCRNm/UJq3q6VtoIW0=;
        b=Xl6OuARytKixnc1lAFm+tRwch2ePcvS0cd4BeNDtxPRDGG+rASKzNkLC5un1qEB0wn
         NifBvSEt0FFBA/bKlHIX6uYwIEjx5DtTj832YrXXUVp6k3Ixry+1Hp9Fna9xjo3nYr3N
         VDiysUI6qCRlXXYubhuWU9JlcZwoLTfXwThobsXmEg8ZtdkNeDaOvOakS+OtaUhfGgpg
         GdLonaxDnvL8MzSLDiCj3YDWWNUAxjV85Jqf2xWgWhgfXucwJGVx5VGj+nr1WVdgJyMM
         EC42pJltGA1+oVapVF/Cmx9f+KKlUhtm5jnnwItN9SVcFIvxUBxCeAUEJ348Zh6V3Srs
         3mag==
X-Gm-Message-State: AOAM532JSVptZlPQnGvkS5DLoyD2oI+TpKqELNSbBbSP1JMJCfWnU6sh
	NzdbN3Fl2LkAWSxkIn8iOD4=
X-Google-Smtp-Source: ABdhPJw8b40nDyS0v6IDdycCWF4GVsok+GQSLMhcq1O4mflqt4iAfwBQ5f6wuLkaeNGiYG3aUBqawA==
X-Received: by 2002:a05:6830:3089:: with SMTP id f9mr12607717ots.276.1623235164401;
        Wed, 09 Jun 2021 03:39:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t26sm3754255oth.14.2021.06.09.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:39:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Jun 2021 03:39:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Romain Perier <romain.perier@gmail.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 7/7] staging: rtl8188eu: delete some dead code
Message-ID: <20210609103922.GG3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5jFF9ldj0W9P1f@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5jFF9ldj0W9P1f@mwanda>

On Mon, Jun 07, 2021 at 09:19:00PM +0300, Dan Carpenter wrote:
> Calling rtw_free_xmitframe() with a NULL "pxmitframe" parameter is a
> no-op.  It appears that originally this code was part of a loop but it
> was already dead code by the time that the driver was merged into the
> kernel.
> 
> Fixes: 7bc88639ad36 ("staging: r8188eu: Add files for new driver - part 17")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> index 19055a1a92c1..d82dd22f2903 100644
> --- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> +++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
> @@ -413,8 +413,7 @@ static u32 xmitframe_need_length(struct xmit_frame *pxmitframe)
>  bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  				  struct xmit_priv *pxmitpriv)
>  {
> -	struct xmit_frame *pxmitframe = NULL;
> -	struct xmit_frame *n;
> +	struct xmit_frame *pxmitframe, *n;
>  	struct xmit_frame *pfirstframe = NULL;
>  	struct xmit_buf *pxmitbuf;
>  
> @@ -443,8 +442,6 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
>  		return false;
>  
>  	/* 3 1. pick up first frame */

Comment could be removed as well. Otherwise,

Thanks a lot for taking care of this, and sorry again for the mess I created.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> -	rtw_free_xmitframe(pxmitpriv, pxmitframe);
> -
>  	pxmitframe = rtw_dequeue_xframe(pxmitpriv, pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
>  	if (!pxmitframe) {
>  		/*  no more xmit frame, release xmit buffer */
> -- 
> 2.30.2
> 
