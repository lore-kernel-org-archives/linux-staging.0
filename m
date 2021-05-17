Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0571371
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 20:32:07 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id c20so7182907qkm.3
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7tDiRnux3uGojDgUk7bh9AMoMEuxHuA0volg/VGIBr0=;
        b=nIvO8kJuEVhhjIGB6QynAKHZyarbmO5+pCfkGFoGSJBdQfIAupRkIAfiVCPEmuAF08
         MEvsG/Z7Oe3h9O744TVcz6XaOYpmc9V13jO2p0i8ueT3hBLfXDPuMnDWgRFFoPb9uhn6
         MxuNLFBMFZXkbdndqoD5VqDNxDIj8EF4ed1TDnFHwvLLytX1wxm0pnXTgbyAIKhrKfzv
         6cXZ7buvJDCzT76JNWKC4Uy3JGsPckpCiC4zztLvtTlWFiOz8Psz1nT7QJVGbsTWgu7q
         iVM4gMoRKEIR2mBA5VRfgjFE0ngrxfNypVDXFIGJCZHyEyo2EMQAXSNjHABH5QQHoeIh
         Aj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7tDiRnux3uGojDgUk7bh9AMoMEuxHuA0volg/VGIBr0=;
        b=Sh9712JCtyhZ5j/aRQPF+KUqeRb2KRxk7IPy6gd9sMvo4Q4BqMF5xTMuNEL/3IiiNF
         PQgBOR2xpVOTQG2yGfijFhcUeQbJduSa2FHKZ3VTFma1EwTo+M+HgG2XP9UmVt9PLCfZ
         qhOKX0cVPuHMVy9QQFgA9ybUr8JA5OP0d5lSWVBU2RdHODuWSfxtc/0agA5eEorRhmiu
         pDnWhLTqcatyNN6KSONPnEh/8wl7vE5kLCDkfcHZo1atV9irDPTEX0KciEvAcuEvo+UO
         qAyRYT96JuDVAT1NccZOP57DNKoHn8K4O1Z6ENQaxavgHOkK2Zds1TnGTxXMOQfR3Yvo
         ueWA==
X-Gm-Message-State: AOAM531JO3ILK0X4ZoBlBCLctoAZ7HduBpHhKkImB10sHSK2M5PpPCCI
	IPoNHPmd0iLuVvuaONcryQY=
X-Google-Smtp-Source: ABdhPJywC7gR3ZD4k1krxuHzwmwfJc2ESji7ZOfPZX6VhrU8S+kfVJeD5EdVbnzLZVLZh2lQZVx09w==
X-Received: by 2002:a37:a604:: with SMTP id p4mr1686927qke.215.1621283527185;
        Mon, 17 May 2021 13:32:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6sm11273426qti.4.2021.05.17.13.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:32:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 May 2021 13:32:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] staging: rtl8188eu: use safe iterator in
 rtw_free_all_stainfo
Message-ID: <20210517203205.GB3620180@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210517201826.25150-1-martin@kaiser.cx>
 <20210517201826.25150-2-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517201826.25150-2-martin@kaiser.cx>

On Mon, May 17, 2021 at 10:18:22PM +0200, Martin Kaiser wrote:
> This is another case where we may remove list entries while we iterate over
> the list. Use list_for_each_entry_safe to avoid an endless loop.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  - use list_for_each_entry_safe
> 
> Without this patch, unloading the module goes into an endless loop
> sometimes.
> 
>  drivers/staging/rtl8188eu/core/rtw_sta_mgt.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
> index 7941ca0397ed..5af7af5f5a5a 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
> @@ -379,9 +379,9 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
>  /*  free all stainfo which in sta_hash[all] */
>  void rtw_free_all_stainfo(struct adapter *padapter)
>  {
> -	struct list_head *plist, *phead;
> +	struct list_head *phead;
>  	s32 index;
> -	struct sta_info *psta = NULL;
> +	struct sta_info *psta, *temp;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	struct sta_info *pbcmc_stainfo = rtw_get_bcmc_stainfo(padapter);
>  
> @@ -392,9 +392,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
>  
>  	for (index = 0; index < NUM_STA; index++) {
>  		phead = &pstapriv->sta_hash[index];
> -		list_for_each(plist, phead) {
> -			psta = list_entry(plist, struct sta_info, hash_list);
> -
> +		list_for_each_entry_safe(psta, temp, phead, hash_list) {
>  			if (pbcmc_stainfo != psta)
>  				rtw_free_stainfo(padapter, psta);
>  		}
> -- 
> 2.20.1
> 
