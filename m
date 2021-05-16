Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE112FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 19:24:53 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id q6so2152705qvb.2
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0TGwNjsGKm/LEKBNwkdX1PTEJhiJkYnKeiNijmSSLlQ=;
        b=Lj3/Qc2/bO0m3yHFXZp1IpZPMO6eL0eU6Cxaq4RZN0Z+ApwCNY8FLgvw8UKXd4hAZv
         db1VwsA06sh8PqpNtvp40ukwzoG4NGu8Q7zW5rr+YVJSXMtrcvLoex3q5rsTEBOyk/EU
         fKyj8a+v3k/9CwM4Y6g4vAOaus1QjKaWwTHr/oR9izarDrwkSv/FVSXj4scXz8HAHqlW
         +5wZ86g6DEkM7yxxUI9wiut9LQiOMEA7I+N+a/u1B/rnfBM+rWFhF8CNTzMx+Xqt35HM
         xGLWYGiy5ZKMAstD+a9OvT/WcinHSLB1IkdtctOs0GS0aIVM2bY/l+tOV/gcY11pvFu7
         v60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0TGwNjsGKm/LEKBNwkdX1PTEJhiJkYnKeiNijmSSLlQ=;
        b=uGHJhm1I8Y9XsoA5290t453gtI+MFgN77N2OwXtyFIbt92WfGv3UwOtNGfbFxHUcUP
         4kwrSpsLbrB9W96NlWWjgavpC19WKjBos/c1H7BkmvXSjHqP96BaukAUkriE+hCHq47/
         Wh78wsIajmPBHrs7183mPO1dArMBTuL+YPrygHEcdLu+szJNOnmBEtScMsS64iZnmLqj
         KEceVLnhLT8zOruyrC8cd3JDWOBMzvms5svu6qkilKiCRKMAs5y7jYVX25gUQzZ9NINn
         dLHmrSZzGNKHOFBoNmMOp7HuA0uF5CljSKWASJ5Sxuhw6eZWmJH6hfVLeFA09UOa58x7
         n1Yw==
X-Gm-Message-State: AOAM53225kU3Z7o/eS46YE3RE0J3YKG6iZDYM2gEzkQJUzoSoIkloKAi
	vhbemSPLObrhlo0KMLOBprE=
X-Google-Smtp-Source: ABdhPJzQMESBEPOPGqGcZuAk/n/Z5wakVcQuS2AbCIoKkSasknrB2xPn30KY0qRxW4wozzoGqQM+6w==
X-Received: by 2002:a0c:ec88:: with SMTP id u8mr15688566qvo.25.1621193092543;
        Sun, 16 May 2021 12:24:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l6sm8710644qkk.130.2021.05.16.12.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 12:24:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 16 May 2021 12:24:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] staging: rtl8188eu: use safe iterator in
 rtw_sta_flush
Message-ID: <20210516192450.GE2126643@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210516160613.30489-5-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516160613.30489-5-martin@kaiser.cx>

On Sun, May 16, 2021 at 06:06:12PM +0200, Martin Kaiser wrote:
> Use list_for_each_safe, we may delete list items while iterating over
> the list.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> compile-tested only
> 
>  drivers/staging/rtl8188eu/core/rtw_ap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
> index 601974df4114..8ffafc7eb316 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -1579,7 +1579,7 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
>  
>  int rtw_sta_flush(struct adapter *padapter)
>  {
> -	struct list_head *phead, *plist;
> +	struct list_head *phead, *plist, *temp;
>  	struct sta_info *psta = NULL;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
> @@ -1594,7 +1594,7 @@ int rtw_sta_flush(struct adapter *padapter)
>  	spin_lock_bh(&pstapriv->asoc_list_lock);
>  	phead = &pstapriv->asoc_list;
>  	/* free sta asoc_queue */
> -	list_for_each(plist, phead) {
> +	list_for_each_safe(plist, temp, phead) {
>  		psta = list_entry(plist, struct sta_info, asoc_list);
>  
>  		list_del_init(&psta->asoc_list);
> -- 
> 2.20.1
> 
