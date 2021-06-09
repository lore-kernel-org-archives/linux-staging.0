Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096372
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 10:35:49 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id q5-20020a9d66450000b02903f18d65089fso7233916otm.11
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nXjAuhIXVZyPoeUrx9siagzmPu5Az50EDvyRWCnxxEs=;
        b=vJUYsXfPYovu+iz92/RvEugJMis+Z74dcHYMkyuFPVVUY+ihNB6sIRRC6n5r7KKUPN
         hvL7QPZZOKtC8jywEV/il/VwfLqAdi6KCjmyp09NPeK83PbqJW7Zs+WsYWqIh+p3HZIU
         3mdFsIB2GEH+VN6yINY2vqAawKt+KTXYVcGFNGlD9ESEkkGV1Vc9nlYpFkjvQV2rXM5/
         Kan4Nel/06PJyxvH0X/BPS5GrwO7knuoncGBZ/2hbEhBcwgKZPbbgp7TRdv3Fq7MtEnR
         43GVJqFoDOPiABq/piL3ns2FLRkSKGA9qJAyRPMNPeXuZI5kn4yHbE4FInCMNmNJCx0P
         lalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=nXjAuhIXVZyPoeUrx9siagzmPu5Az50EDvyRWCnxxEs=;
        b=qH4S+Or+AbZBtG4afflB/3PnthkrFRhfuxwF66VGScsJVL+vX3YlKlF7OiT3fEXpmI
         tGedh8jzvAiNRD6L2fZefJoycXilFJ41OqMKTGfOPB4Y8mMUof7O6M7GmdtCqdK47BA5
         lEN8ATDHOCa51znRG46Xl7ck4vxB9eN2Febku/oVJoPw3leeGRJBeI57CnU3+kLX4/WS
         cBiVHvhneVx6/9Guok3Hq0xhgnkqm/wr0rNVhL7t87u73ZD+aOdMaH37R6yQh3DZaswR
         yPVRT69J59KVd5vsBjLXEZsleHmlb56xTSeqhGcVtdVAfjqs2vj0+G6g+w2MiTal0d7/
         7IQw==
X-Gm-Message-State: AOAM530ItJO+gfpTqc3Yt3zzKAOVBFrER/mIWWMsBF7kxFnxGQVus78W
	feULESs3JpxtnxefiIAx4Hg=
X-Google-Smtp-Source: ABdhPJxc33QJQ47j1RA0Uzk0RejGgy47Gq7IdPphMuDwbKmUOIqVmxpRd5JBCW4ctNcQocuO53LIIQ==
X-Received: by 2002:a05:6830:3115:: with SMTP id b21mr21296441ots.234.1623234948977;
        Wed, 09 Jun 2021 03:35:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1sm3351988oos.32.2021.06.09.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:35:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Jun 2021 03:35:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Kaiser <martin@kaiser.cx>,
	Ivan Safonov <insafonov@gmail.com>,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>,
	Simon Fong <simon.fodin@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/7] staging: rtl8188eu: use safe iterator in
 dequeue_xmitframes_to_sleeping_queue()
Message-ID: <20210609103547.GC3727184@roeck-us.net>
References: <YL5iX3Exc0HVYrsi@mwanda>
 <YL5ixzKaYKkpHhky@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5ixzKaYKkpHhky@mwanda>

On Mon, Jun 07, 2021 at 09:17:43PM +0300, Dan Carpenter wrote:
> On some code paths the xmitframe_enqueue_for_sleeping_sta() function can
> call list_del_init(&pxmitframe->list) which would lead to a forever loop
> because "pxmitframe" is the list iterator.  Use the _safe version of the
> iterator to prevent this.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/staging/rtl8188eu/core/rtw_xmit.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> index dcc29a74612d..f57e41f817ca 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> @@ -1729,17 +1729,15 @@ int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_fra
>  
>  static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
>  {
> -	struct list_head *plist, *phead;
> +	struct list_head *phead;
>  	u8	ac_index;
>  	struct tx_servq	*ptxservq;
>  	struct pkt_attrib	*pattrib;
> -	struct xmit_frame	*pxmitframe;
> +	struct xmit_frame	*pxmitframe, *n;
>  	struct hw_xmit *phwxmits =  padapter->xmitpriv.hwxmits;
>  
>  	phead = get_list_head(pframequeue);
> -	list_for_each(plist, phead) {
> -		pxmitframe = list_entry(plist, struct xmit_frame, list);
> -
> +	list_for_each_entry_safe(pxmitframe, n, phead, list) {
>  		xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
>  
>  		pattrib = &pxmitframe->attrib;
> -- 
> 2.30.2
> 
