Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123182FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 19:24:44 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 197so3830619qkl.12
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sgfbGG6vvo3BXl14q9FKr0UfIDgPm9H78kr76xF4ZZw=;
        b=O7be3xhyePxqsqhzrlj0GUR8x0eNYvOrPzScoZe4heRhlYqyMVbLYM6UfH4f3jDgYa
         53RpYmRD0VAKOkFXhpl0BGpQFSOC/6a3vJqgTk5If8nrQvZGU1v6E3s4WJRrGXvjYLus
         rrhzu97tRa5ar0UROSIak6IJDZskib2xZD4HHfVnvWHHx8NdB9Bm0ABSqj9XMPCvDGw9
         KAAGZC6vy5sZXqxLml5beFCQmSMXA6EgQmff6ODxlCv7gVN5h+MEx9jKMabNO/VOzahU
         cI+yOXcoc3qNRTRa65P3q0T6lm1xWfvNRt1FuRHi2BHJDJY2ByKUc/tJreeYgOPURX4o
         7QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=sgfbGG6vvo3BXl14q9FKr0UfIDgPm9H78kr76xF4ZZw=;
        b=t+p2rUzCtSjMyKIIdUWaOQ4cQBUR7+ODCfkrGQxjfhddsjlJGYNx0MgaTqTpxjCu+d
         vHAPHrsZxPo0LQBcm3yzZkM3BbqPGO+8a+InSdiP4YosI5sZOzW8BBMC/gcEhQAiEdZg
         0aOHN/Dv/Jtvtwq+/xrQYr8vO6dS5/Xvw5kYpwZ98GGYePrV65OYGjbrpKtta4vGGwsq
         +HtG8lkFRrGrJXzZxVy1kYQBgm9ll5XEnppklpHxogeduYyraN5z5zaVJJhrjo+eJs9x
         Bik3G9IeoI2KjCoX7Lxt7qDF/4SNLlWkJRTylinmERd1YlYusT/7d6Uxor1WspT6/vCP
         4FKQ==
X-Gm-Message-State: AOAM5304Q3Wx6YkvvoNOsjAPfB3uvuAVrBH5OqYNbaKrjvqu3xxHLuxf
	8M81z9I4DXDfsJS7IJd6Cr8=
X-Google-Smtp-Source: ABdhPJweqIBUAuWBwfUP9MvYBov5rWzl/HP/HPHEHSWvzI4KgYXXwHy4FCXwhqXtNCo9fab3Yuw3sA==
X-Received: by 2002:a05:620a:e8a:: with SMTP id w10mr52587492qkm.248.1621193083217;
        Sun, 16 May 2021 12:24:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x28sm9470836qtm.71.2021.05.16.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 12:24:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 16 May 2021 12:24:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] staging: rtl8188eu: use safe iterator in
 rtw_acl_remove_sta
Message-ID: <20210516192441.GD2126643@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210516160613.30489-4-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516160613.30489-4-martin@kaiser.cx>

On Sun, May 16, 2021 at 06:06:11PM +0200, Martin Kaiser wrote:
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
> index a410b42ecb6e..601974df4114 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -1072,7 +1072,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
>  
>  int rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
>  {
> -	struct list_head *plist, *phead;
> +	struct list_head *plist, *phead, *temp;
>  	struct rtw_wlan_acl_node *paclnode;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
> @@ -1083,7 +1083,7 @@ int rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
>  	spin_lock_bh(&pacl_node_q->lock);
>  
>  	phead = get_list_head(pacl_node_q);
> -	list_for_each(plist, phead) {
> +	list_for_each_safe(plist, temp, phead) {
>  		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
>  
>  		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
> -- 
> 2.20.1
> 
