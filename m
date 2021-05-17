Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257EC71
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 20:34:31 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id h21so5894234qtu.5
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C827mxc6Fp6xq25VAgPqo5a4jEN7qKOekGr4SbEOmHE=;
        b=mmdWw8fIVx8C1XBBhADN9QbNK7ionOYqxXAngKOajKyEAipWVV9dXkgw+0Phws+sIR
         6CxxFJHZl3ffuhQvxUqMFv5eaYUpuqkgNf1XQ1fmKwzoarQindX8sFKPdQc4RbwZg7uM
         UsiOHoP0XClbRqXt+8/rq1c+Mrsg3i+/aPok6M3j/nOstEQXu2/cKc09ZSSRs7uh20cB
         TiwfhMB/dnbqvrKW0CQdFuBgMFUNE2r6DAh9+6sVd0SDGkue35gTa/RLocckhGHqLKUL
         BHBRCZPq3aK0zDnAFEfdqvqKUfRBR3U8IYhNiBAmAOkXBOnTRCj27jcl7pCgumfWg1tX
         ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=C827mxc6Fp6xq25VAgPqo5a4jEN7qKOekGr4SbEOmHE=;
        b=Dg1AvFGD4XPKMSjagkhbZ+iJoCOt0L5UBu5bhuViOXrlTEGfz8qE2k5SJYR17dxOek
         xWnRwdibqmPjR82b26agnsGDXUwqGb5xf9f1DEkaQvDOaArzFcSfXtQ/riiXv7gOqeYN
         ketPZ66knZYHGOiBTZitObCkNhw+CEwAXINpyowaNWu+AXWPP+DAa9+IEvBYyQzWOhVr
         RawJZRxFr77ZVwJznp4vlZzRKrmKBUYct+QtJTciJ7dD3+mG2RdTx3+KNCzygdt7rPsW
         uVv1Y7bBe200hg9wttNO/sQKvu9/8UC/h/QYk/TqP0mvJoXandXQ5pEFtOgcpuQIEctQ
         fJbw==
X-Gm-Message-State: AOAM533xOxKfQOpRfAwPjfR1YQ7dZpDYGeLrDKYHOVqfTvezIi/1D8bz
	tfjuyfzYoLJkAB3EIYIjv0I=
X-Google-Smtp-Source: ABdhPJzDCZ/NXHWcJ5gZyFxQHcpCE+SokIfC3RHncqZzlP7fPzUbvLnOwrd5xYYGJiT+X22n/GyqSg==
X-Received: by 2002:ac8:5946:: with SMTP id 6mr1312420qtz.366.1621283671188;
        Mon, 17 May 2021 13:34:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t18sm10884356qtn.63.2021.05.17.13.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:34:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 May 2021 13:34:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] staging: rtl8188eu: use safe iterator in
 rtw_sta_flush
Message-ID: <20210517203429.GE3620180@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210517201826.25150-1-martin@kaiser.cx>
 <20210517201826.25150-5-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517201826.25150-5-martin@kaiser.cx>

On Mon, May 17, 2021 at 10:18:25PM +0200, Martin Kaiser wrote:
> Use list_for_each_entry_safe, we may delete list items while iterating
> over the list.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  - use list_for_each_entry_safe
> 
>  drivers/staging/rtl8188eu/core/rtw_ap.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
> index d297d5301153..bbecb07274f6 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -1573,8 +1573,8 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
>  
>  int rtw_sta_flush(struct adapter *padapter)
>  {
> -	struct list_head *phead, *plist;
> -	struct sta_info *psta = NULL;
> +	struct list_head *phead;
> +	struct sta_info *psta, *temp;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>  	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
> @@ -1588,9 +1588,7 @@ int rtw_sta_flush(struct adapter *padapter)
>  	spin_lock_bh(&pstapriv->asoc_list_lock);
>  	phead = &pstapriv->asoc_list;
>  	/* free sta asoc_queue */
> -	list_for_each(plist, phead) {
> -		psta = list_entry(plist, struct sta_info, asoc_list);
> -
> +	list_for_each_entry_safe(psta, temp, phead, asoc_list) {
>  		list_del_init(&psta->asoc_list);
>  		pstapriv->asoc_list_cnt--;
>  
> -- 
> 2.20.1
> 
