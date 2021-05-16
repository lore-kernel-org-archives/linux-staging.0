Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7EE2FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 19:24:20 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id h7so1487744qvs.12
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=89sQlr+Wbs3TI3AePCAxDHsUpirFRnv86QFA4meiI7Y=;
        b=AJXugGdAWwISIw3nWq7r4rUZxP9MGViQPenaxNXj2mUS4Kude+ZHhBwzZUGZLpnoT/
         LWgSj3d38YNv1kubjXqgbPzoPFJDqkSzukAorLRgk+Eb//lCikKsPYTrZ+vlDh69Xnpp
         YthzK8N9sw2kbK3fEd8BlJGapqK3T+iF9mzRvLm1T3ckaqStjKzzgIxQGXenmV+RQLIE
         v4Dk/sQfqUN2kJXKB5w1OptaU72FLH4nIJ5W3ck2iyrZWyvV9+6tJPLEoFFADBaX6xWb
         cP+Dgbb5diilaocLS0G8vfSv73M71gGwwpCZ732oDgdVi7uKzmsiBlgNolGztGTdTUWf
         xvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=89sQlr+Wbs3TI3AePCAxDHsUpirFRnv86QFA4meiI7Y=;
        b=jSfrfMA5DlvqthrcQnzklMAF5Z1HY7v9X7htGuo0w69FUgZadNWvBiOu8+g6qpWe8R
         FVm91ARnOU08CFiONE7TGLoxD/75W+t1dAwleFoBKK/Gy+tFPq5w8vCxSiH73nWt5DBm
         uiIH/7Eot6qiHpmH7+TAwBbf78IPUmXXNwdTyoxLBudLtru8nA7n86vaX4xnNcCaTyN+
         pehgU1pORf2rb0ExMwJmknx9OLdaNmVU9P890kqdytFZ18nYMVSHq5ta528ikUYEQPIi
         EXzGwqdtg85694OMViJPEx8s/X+N0tjZYePbflHOovFqMZl+rbetmHlLN0SSZK4f4sS+
         k/XQ==
X-Gm-Message-State: AOAM533iMi59jW1G4AihhNuYqMTsydXIITAAx2vVCVYTLDjv+hkMCKHG
	kXuuTiNBN6IqTPeBHkGLRdY=
X-Google-Smtp-Source: ABdhPJy2uqLbNkF3eDqsXtyvnl/jcgOV9LIzvqg6nKfMvN4Ner8q3fkDSn/c9cYNPoBpFV7IqwF26Q==
X-Received: by 2002:ad4:56a8:: with SMTP id bd8mr23578755qvb.9.1621193060071;
        Sun, 16 May 2021 12:24:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w7sm8717171qtn.91.2021.05.16.12.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 12:24:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 16 May 2021 12:24:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] staging: rtl8188eu: use safe iterator in
 rtw_free_all_stainfo
Message-ID: <20210516192418.GB2126643@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210516160613.30489-2-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516160613.30489-2-martin@kaiser.cx>

On Sun, May 16, 2021 at 06:06:09PM +0200, Martin Kaiser wrote:
> This is another case where we may remove list entries while we iterate over
> the list. Use list_for_each_safe to avoid an endless loop.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Without this patch, unloading the module goes into an endless loop
> sometimes.
> 
>  drivers/staging/rtl8188eu/core/rtw_sta_mgt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
> index 7941ca0397ed..eda7a441acde 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
> @@ -379,7 +379,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
>  /*  free all stainfo which in sta_hash[all] */
>  void rtw_free_all_stainfo(struct adapter *padapter)
>  {
> -	struct list_head *plist, *phead;
> +	struct list_head *plist, *phead, *temp;
>  	s32 index;
>  	struct sta_info *psta = NULL;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
> @@ -392,7 +392,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
>  
>  	for (index = 0; index < NUM_STA; index++) {
>  		phead = &pstapriv->sta_hash[index];
> -		list_for_each(plist, phead) {
> +		list_for_each_safe(plist, temp, phead) {
>  			psta = list_entry(plist, struct sta_info, hash_list);
>  
>  			if (pbcmc_stainfo != psta)
> -- 
> 2.20.1
> 
