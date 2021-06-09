Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B4872
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 10:33:13 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 102-20020a9d0eef0000b02903fccc5b733fso418458otj.4
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C6zmZocfV59nTRUR/tuzqZPISvv+0Relgl8iloiv6bQ=;
        b=TJhP3AsfAN5fWM/pybxz1m4QEpj/Hhiaz3m7UGAeUImETHl8elkocpS+Y9h8+GFu8o
         k++7ev++/ua+zwrhKKg/a9Gbq+e+JA4bn/kbDWSuMCc3tbwFNPsF6ZpYacqj9ZSnFJwR
         SMQfWwqXSssrPo8Z22MY2gQiO5Rp/M6VH8B15//i/UHf3rQ8emluQaSmxsjr+739ZM7L
         jFsQL3u4MSDz8apuQ5p05CYmxJsqvy7YwtbIwS1bK+uxdWxEfpsjmA2sR9D44MdUDpRd
         BmfT84IWiLwpZsUAgdivyT9wG9yMuTl0QJanNGOf0HI/+2ROaCFRByRnc5Yq0L/MNrg8
         HwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=C6zmZocfV59nTRUR/tuzqZPISvv+0Relgl8iloiv6bQ=;
        b=VijdLUsrWh2F5xRD9Xr7fY2ah5SvgxJ8cVQKmrLE5Uy2nGWU8jRsaA1ityY/j+g6o8
         oipfmVz0aoQ+Y36ekcYY2Qi5jL44seAcuFb7Xs9zpNtnadq8fZqqLmTwXqCmOhrpxyiJ
         aTQ8sIL0LwV+t5IQMywIvZP5nwefAZI4L9VpxVGyKHqR1IXkDOmVlSX5qvMYFPr4J71N
         47e7fU1uNYLT75IPjpMsaYFjpu30Iht0GlKvhuxi5pNkFC+ywrY4RKBr2UF1qwjXUXqN
         vRpPfUtEd902lppuR0B7iEBWP8xS7a+oBER+OHV9Er0VtarrJ4Kb0TTOiqrCq5UQMMHN
         +vuQ==
X-Gm-Message-State: AOAM530RVzsUgoH4W1b23b9vKMeT8Tv76ofmWPUFz8Ux3BFIdghEPEiH
	5368wIhoM3NIUbWmQenMqI4=
X-Google-Smtp-Source: ABdhPJyeXw5X999oqt7C6iMeiIUz0+8cZ+wjvaM2TWs+PQv8nZv/nEeFANue6ztPSOQd5H31GGmeAw==
X-Received: by 2002:a05:6830:1bd8:: with SMTP id v24mr2244034ota.203.1623234793036;
        Wed, 09 Jun 2021 03:33:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c13sm2659023otr.23.2021.06.09.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:33:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Jun 2021 03:33:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Kaiser <martin@kaiser.cx>,
	Ivan Safonov <insafonov@gmail.com>,
	Paul McQuade <paulmcquad@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/7] staging: rtl8188eu: use safe iterator in
 stop_ap_mode()
Message-ID: <20210609103310.GA3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5ip4yz9NEB9RZO@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5ip4yz9NEB9RZO@mwanda>

On Mon, Jun 07, 2021 at 09:17:11PM +0300, Dan Carpenter wrote:
> This loop calls list_del_init() on the list iterator so it can result
> in a forever loop.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/core/rtw_ap.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
> index bbecb07274f6..9399c17bfdbf 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -1688,8 +1688,7 @@ void start_ap_mode(struct adapter *padapter)
>  
>  void stop_ap_mode(struct adapter *padapter)
>  {
> -	struct list_head *phead, *plist;
> -	struct rtw_wlan_acl_node *paclnode;
> +	struct rtw_wlan_acl_node *paclnode, *n;
>  	struct sta_info *psta = NULL;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -1709,10 +1708,7 @@ void stop_ap_mode(struct adapter *padapter)
>  
>  	/* for ACL */
>  	spin_lock_bh(&pacl_node_q->lock);
> -	phead = get_list_head(pacl_node_q);
> -	list_for_each(plist, phead) {
> -		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
> -
> +	list_for_each_entry_safe(paclnode, n, &pacl_node_q->queue, list) {
>  		if (paclnode->valid) {
>  			paclnode->valid = false;
>  
> -- 
> 2.30.2
> 
