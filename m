Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B622FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 19:24:33 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t7so3463531qtn.3
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6U909VWU4nAe/QDSV5I3qjiMxCKZF7YLEUGHeixhqF8=;
        b=KffHzKIzqynI4zc70Kw0zyPbz3qWC4pc8dy5nV9Qf2Fha5VoLbe411BIM1qjt4SGlk
         Fi3amRM7sUEnw3jb/Lv5DxrSRl3+apX4RLPIMDXwis9fpgOc7Xo8N0Ngswc9bXIF7a7q
         iN8faiKTmZMmG1/rZI6CxCGEgVsDlp2I4rBHsSG5OYkdFfGULpy4uXyIYMo0mO0jkZOl
         tzL9bAL16bU1+T87Jjllk7YMl762xbJLkC3PtXuO6jcZdA1W7SmNNXjgDjkWP+v35jr/
         3CtWKhvhxgs1QzxHVEVa3USb7sXFcZTuB0zWiEDD8DcOoi3Yh0EE0XUKk96VnyJ14JX8
         dJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=6U909VWU4nAe/QDSV5I3qjiMxCKZF7YLEUGHeixhqF8=;
        b=mnkb4clJhfqRTM+0/ihTM+HufPBsdF3SkH1lH9003TpmNryVhmPlPm5sN4ZrKyafga
         qo00ep9LD7uSzOmuSlX7dlbEvGzahAJbCEhq05ZLNAxyGLKuOcxwojy24iRaj86v3l2l
         0qji4OD64Dac+M0LgG4M10Dk6bXCibPmWtQAYvnKmeifkcrVLlsstO9i8Vlw/Z3G68A3
         T8VP7xYrPgm+Sgg3NZZDZ//+fe8MYbFUkK6BAOOxQ6lpmCLrE1RHXbg/PLxUAhl4C2tq
         hql85GtK2nwqJzEK+QK/GVAgEuhoIJQVLA8DL/YSwRxhyhDSrV+Zj2G4G4w4Dd4s339C
         gDdg==
X-Gm-Message-State: AOAM530yFkQSb2IaF0UpajtUAKyJx8F6VDVpMgbmzBGi3hLmKj1RNOHh
	w3G4ve79vN9kLu0nfHdfj84=
X-Google-Smtp-Source: ABdhPJzNSIGl/zFZPKHs7Ch5gLoAGOSSy2BK7z87y2qf3FhjQ3zS1VhnfpmVlohin8om3DyZvCRVaQ==
X-Received: by 2002:ac8:7285:: with SMTP id v5mr53370884qto.247.1621193072345;
        Sun, 16 May 2021 12:24:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 195sm8699806qkj.1.2021.05.16.12.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 12:24:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 16 May 2021 12:24:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] staging: rtl8188eu: use safe iterator in
 expire_timeout_chk
Message-ID: <20210516192430.GC2126643@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210516160613.30489-3-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516160613.30489-3-martin@kaiser.cx>

On Sun, May 16, 2021 at 06:06:10PM +0200, Martin Kaiser wrote:
> In the first loop in expire_timeout_chk, we may call rtw_free_stainfo and
> remove an entry from auth_list.
> 
> In the second loop, we may call list_del_init on our list.
> 
> Use list_for_each_safe for both loops.
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
> index ca9a321c4921..a410b42ecb6e 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -164,7 +164,7 @@ static u8 chk_sta_is_alive(struct sta_info *psta)
>  
>  void expire_timeout_chk(struct adapter *padapter)
>  {
> -	struct list_head *phead, *plist;
> +	struct list_head *phead, *plist, *temp;
>  	u8 updated = 0;
>  	struct sta_info *psta = NULL;
>  	struct sta_priv *pstapriv = &padapter->stapriv;
> @@ -176,7 +176,7 @@ void expire_timeout_chk(struct adapter *padapter)
>  
>  	phead = &pstapriv->auth_list;
>  	/* check auth_queue */
> -	list_for_each(plist, phead) {
> +	list_for_each_safe(plist, temp, phead) {
>  		psta = list_entry(plist, struct sta_info, auth_list);
>  
>  		if (psta->expire_to > 0) {
> -- 
> 2.20.1
> 
