Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AEA3FC4
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631539489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXsTS2qgj0DJKAnZpWeQ2GgDU/t21LtMn8iMahLaDWw=;
	b=CaC+QFD+NURVrkAMIBgP7XSZhDnTK1c+2MNL67zFk4+gFvxxviLJZUzY6exbpbXExQLVD5
	s619Z+0KBxgZ4LXnQG6wlxBM+qoEWTwYF6B6whxOyoNDl5E7Gx0iwe7UyLAovEhWjdWxii
	ZsfLBt1Qyv2Oq7KxdKI0fBuwaUR1gDI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-96pYl5gqPkOcMwb601F8nA-1; Mon, 13 Sep 2021 09:24:46 -0400
X-MC-Unique: 96pYl5gqPkOcMwb601F8nA-1
Received: by mail-ej1-f69.google.com with SMTP id k23-20020a170906055700b005e8a5cb6925so3681815eja.9
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 06:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GXsTS2qgj0DJKAnZpWeQ2GgDU/t21LtMn8iMahLaDWw=;
        b=qB3vvA4/bwPJCF6D0og5gOHBYISXX8NcBcX6r3k5jToLuuVWquTmknU+FbDJe3YHT1
         geSkOmLSgd+j8hOHUD89fXgrlVEWgzzRup1OObM6KbjWxMUyqxxTaR18+S/a8aQowtJd
         lZlwXYNODeWtrUqamX2p8LZreuqUU6jqueR6+QBMmmk2dRrYj6YUt7y81v7aib5UZ+Vt
         8IZ1gMh9FSCKBVkFTYGwvPpizUtyZvYV5ImMyPOy6fC9Q/cnWsX0WkKDK8SsJbDTbMS+
         7Gzgx5TMZseADOgrZptNCBOzZOchC/Dtm9abVxr+fx+Mx++VpBsDyQa7+iFMfJOuuqFQ
         3NxQ==
X-Gm-Message-State: AOAM533fRbeV/JqjKFVKSqYt20UHH5c2gAt4rqQevtE4Qs8qcdroQstH
	V6ZhFGR1zQ8y4dRltf2FfGR0saqADbi3ZiETQQWd3A7PEvKsRXGLQbwq22SCc1yHHlGQBQMp5JQ
	E1N7B5uqvU8oMIVukp/hfBzFSmA==
X-Received: by 2002:aa7:c617:: with SMTP id h23mr11717112edq.357.1631539485247;
        Mon, 13 Sep 2021 06:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgso/58go/bCIPD3ANBIA2Lxa5lcq90iKyqr6/f66HqZVHaaHJih6Pcb+vTLHe8eF6VN93+A==
X-Received: by 2002:aa7:c617:: with SMTP id h23mr11717099edq.357.1631539485094;
        Mon, 13 Sep 2021 06:24:45 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id y5sm2773354edt.21.2021.09.13.06.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 06:24:44 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: protect sleepq_len access by
 sleep_q.lock
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210913130346.2390-1-fabioaiuto83@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d6d6c6bf-b787-aac9-4767-4bf54c5437ac@redhat.com>
Date: Mon, 13 Sep 2021 15:24:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210913130346.2390-1-fabioaiuto83@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Fabio,

On 9/13/21 3:03 PM, Fabio Aiuto wrote:
> protect sleepq_len access by sleep_q.lock and move
> pxmitpriv->lock after sleep_q.lock release.
> 
> This fixes and completes a lockdep warning silencing
> done in a prevoius commit where accesses to sleep_q
> related fields were protected by sleep_q.lock instead
> of pxmitpriv->lock.
> 
> Note that sleep_q.lock is already taken inside
> rtw_free_xmitframe_queue so we just wrap sleepq_len
> access.
> 
> Moved pxmitpriv->lock after sleep_q.lock release to
> avoid locks nesting.
> 
> Fixes: 78a1614a81f0 ("staging: rtl8723bs: remove possible deadlock when disconnect")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index bf090f3b1db6..c98918e02afe 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -294,10 +294,12 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
>  
>  	/* list_del_init(&psta->wakeup_list); */
>  
> -	spin_lock_bh(&pxmitpriv->lock);
> -
>  	rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
> +	spin_lock_bh(&psta->sleep_q.lock);

AFAICT this needs to be above the rtw_free_xmitframe_queue() ?

Regards,

Hans


>  	psta->sleepq_len = 0;
> +	spin_unlock_bh(&psta->sleep_q.lock);
> +
> +	spin_lock_bh(&pxmitpriv->lock);
>  
>  	/* vo */
>  	/* spin_lock_bh(&(pxmitpriv->vo_pending.lock)); */
> 

