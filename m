Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A571
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 20:30:19 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id o27so7132054qkj.9
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bJtsCzAAfzfgWGG5zeNNWX1IxBdBK+YvWcZ2EEt9SEA=;
        b=aQ1b83W4tx2OXxhE4IBzyHZ97MmP9oc9sNW17IfhHtfOwVFPaPaYnOscDcmQD4dRXa
         SGoqC/kSrGKvbQRVLO+vQii4M5IGTtvrZ+RL0TyOCedfUEn/0EPSEpg+zA99u1Tsu9oW
         0Ijea03MxhZQlRH2kpbucyJX8Ih7htVfc/EfbVsh2Iw4GvvqQddF7MdCyRvuQrta/MSY
         5MZlAHDF1VjhhDxfYzYVlPKwiVEsUP1shAvuNhyCj34G6chMbAc1g47wCGTm8dW9PTKg
         +hMA5imKUP6qWZL5OwBIACduNRdFZ3Zza7BUXCaUtH510lWLLhTGzIuGszrtBkcBVjWi
         1BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bJtsCzAAfzfgWGG5zeNNWX1IxBdBK+YvWcZ2EEt9SEA=;
        b=iRJy4ueO8TaFvBF7ScoO8Uw6Lf9zCUULofFAtpEt30Zr/17L+0Uq8My9eAk+ToC+O/
         FXf+jCgNdDGAOw3Nv44RGRC4eoAg3IQyNo6EBkyme+rc/nM4nFobqdrGiggsm5Nwbny3
         whRjGxxBnM5Pz3v8ZXZZr+G/CFhirjvQ3kTV7wkwrr2ERmlzS71QPOCPRGXpaHKq+tkL
         YZi6CXp0mn/zK0Wp+tJEyU5QznvBkEcv6hg6XXYI0wOj3DPqoKQJ7KaoOc6/C5x8Gjoh
         4o+VS5grvd19yXRQAcQulGU0gHh1wRB+CUOZPTY5R17vk2ymW6qCACPB2GF2xjSKxtZ0
         Mp4A==
X-Gm-Message-State: AOAM533P62tpUdeZ5biZbkvtI/l68kguHrc/qjWsK6X1FhqpDIdjmash
	PhdVNzWjEIXC+/h7CFq3Yuk=
X-Google-Smtp-Source: ABdhPJwC79WDTflcZNZYFsVra8+I1OYWlvLVFTCmjd4vR+cJ5UqB4Jy1j+o0qKuaa9LQEETG1RSXWg==
X-Received: by 2002:a37:9e12:: with SMTP id h18mr1716835qke.483.1621283419114;
        Mon, 17 May 2021 13:30:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z18sm10779728qki.55.2021.05.17.13.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:30:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 May 2021 13:30:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] staging: rtl8188eu: use safe iterator in
 rtw_free_network_queue
Message-ID: <20210517203016.GA3620180@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210517201826.25150-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517201826.25150-1-martin@kaiser.cx>

On Mon, May 17, 2021 at 10:18:21PM +0200, Martin Kaiser wrote:
> rtw_free_network_queue iterates over the scanned wireless networks and
> calls _rtw_free_network for each of them. In some cases,
> _rtw_free_network removes a network from the list.
> 
> We have to use list_for_each_entry_safe if we remove list entries while
> we iterate over a list.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  - use list_for_each_entry_safe
> 
> Without this patch, it's easy to get the driver into an endless loop by
> scanning, connecting and disconnecting repeatedly.
> 
> wpa_supplicant -B -Dwext -i wlan0 -c /path/to/my/config...
> while true ; do
>    sleep 1
>    wpa_cli reconfigure
>    wpa_cli add_network
>    wpa_cli set_network 0 ssid ...
>    wpa_cli set_network 0 psk ...
>    wpa_cli select_network 0
>    sleep 6
>    wpa_cli status
>    wpa_cli disconnect 0
> done
> 
>  drivers/staging/rtl8188eu/core/rtw_mlme.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> index 159465b073c2..ba73ac5325e2 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> @@ -199,19 +199,17 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>  
>  void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
>  {
> -	struct list_head *phead, *plist;
> -	struct wlan_network *pnetwork;
> +	struct list_head *phead;
> +	struct wlan_network *pnetwork, *temp;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  	struct __queue *scanned_queue = &pmlmepriv->scanned_queue;
>  
>  	spin_lock_bh(&scanned_queue->lock);
>  
>  	phead = get_list_head(scanned_queue);
> -	list_for_each(plist, phead) {
> -		pnetwork = list_entry(plist, struct wlan_network, list);
> -
> +	list_for_each_entry_safe(pnetwork, temp, phead, list)
>  		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
> -	}
> +
>  	spin_unlock_bh(&scanned_queue->lock);
>  }
>  
> -- 
> 2.20.1
> 
