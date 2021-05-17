Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B0B71
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 20:33:17 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id o27so7141919qkj.9
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SFC+rYe0zaR/WVxTaatYntEqRqeQts9HjOc00HhAjT8=;
        b=BXjPaJ+KF2p68/R5wLNrYhoLA6R53ICumLEJqqm7BFTcD/gjYlolaXSZZHfJC03GgD
         XkaYjkPNr0mawJymbppU2IkmgazdcP1EtCTcVUkif/FgIizGiKf6c8lMt4z+2NyNSmR5
         FdcjfvsCjPcBs13tZdVaZ8ONd2tnjlhGJEKe/yv2jrWi7aVZVAtw2O0XPcGREsKpRsSX
         wKOFfpJr7I86N5kpDYFoN8H9mzB9eJUQyhS99P4ycle6J9glCJ+U8dVRbcdOx4OqG4gZ
         fe/03OaPMEnwJWBfFtZ0c5ZxdlyKw9UdoVp8kLpx4kN/M4khPVtKuCeTKho8UcsWXFb4
         RsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=SFC+rYe0zaR/WVxTaatYntEqRqeQts9HjOc00HhAjT8=;
        b=SMrR07aNw40reDVfs7UFjTXjS36Vftk451KqbIGp+CWCAZyqkmOfRSkUj5WT4WZr6a
         QgtlHn1Z7zLnYtUw6sGi2s/LxP8qvcPKBxcL4gqsUdRYda1THV8jCWaQqyoWV5DypQ5x
         1GoBwpKP0HTv52roLUm0MGq65iAF1IAG1rIm+jfJtSdHE+AWb3K1cqQRKRAWl4eajIQL
         YBNmtK1jjIMsfb4avK4fIItGJRPS+3IijnQvSdNJsyAeJjn+VEeBV2YQXIPLSYB32RI8
         sA2rXTSfRm5n87mEdLlV5atHSBog4NLrIVRYvaV+vhrJNZFA3GITZA2QNAELbce8WTIr
         J3UQ==
X-Gm-Message-State: AOAM533tg8pFJpISWnGrAXsow91y0AiLXB3EL6li2GpDmBKuR1bFuxuu
	jKkkuL/hHiEK+QAQOorWBRc=
X-Google-Smtp-Source: ABdhPJw2L4LYtFCWNUte6JIJohS94Wd4Y9j4vGnNMmZtdxVCaDLZudyNH1eau1ry/ldh/F/bDmqltg==
X-Received: by 2002:a37:6891:: with SMTP id d139mr1781264qkc.466.1621283596594;
        Mon, 17 May 2021 13:33:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t203sm11202276qke.83.2021.05.17.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:33:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 May 2021 13:33:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] staging: rtl8188eu: use safe iterator in
 expire_timeout_chk
Message-ID: <20210517203314.GC3620180@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210517201826.25150-1-martin@kaiser.cx>
 <20210517201826.25150-3-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517201826.25150-3-martin@kaiser.cx>

On Mon, May 17, 2021 at 10:18:23PM +0200, Martin Kaiser wrote:
> In the first loop in expire_timeout_chk, we may call rtw_free_stainfo and
> remove an entry from auth_list.
> 
> In the second loop, we may call list_del_init on our list.
> 
> Use list_for_each_entry_safe for both loops.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  - use list_for_each_entry_safe
>  - update both loops (I forgot the 2nd loop in v1)
> 
>  drivers/staging/rtl8188eu/core/rtw_ap.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
> index ca9a321c4921..6d7c96f1aa42 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -164,9 +164,9 @@ static u8 chk_sta_is_alive(struct sta_info *psta)
>  
>  void expire_timeout_chk(struct adapter *padapter)
>  {
> -	struct list_head *phead, *plist;
> +	struct list_head *phead;
>  	u8 updated = 0;
> -	struct sta_info *psta = NULL;
> +	struct sta_info *psta, *temp;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
>  	u8 chk_alive_num = 0;
>  	char chk_alive_list[NUM_STA];
> @@ -176,9 +176,7 @@ void expire_timeout_chk(struct adapter *padapter)
>  
>  	phead = &pstapriv->auth_list;
>  	/* check auth_queue */
> -	list_for_each(plist, phead) {
> -		psta = list_entry(plist, struct sta_info, auth_list);
> -
> +	list_for_each_entry_safe(psta, temp, phead, auth_list) {
>  		if (psta->expire_to > 0) {
>  			psta->expire_to--;
>  			if (psta->expire_to == 0) {
> @@ -206,9 +204,7 @@ void expire_timeout_chk(struct adapter *padapter)
>  
>  	phead = &pstapriv->asoc_list;
>  	/* check asoc_queue */
> -	list_for_each(plist, phead) {
> -		psta = list_entry(plist, struct sta_info, asoc_list);
> -
> +	list_for_each_entry_safe(psta, temp, phead, asoc_list) {
>  		if (chk_sta_is_alive(psta) || !psta->expire_to) {
>  			psta->expire_to = pstapriv->expire_to;
>  			psta->keep_alive_trycnt = 0;
> -- 
> 2.20.1
> 
