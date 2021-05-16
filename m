Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50D2FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 19:24:10 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id j11so3423989qtn.12
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fZxwgKfIQimb2AFH9JXSBKvKMRan0cAJtKbrTFd8DCw=;
        b=oAFuw8Wmvx0yY/70GlCle9lO76HkGhbMJymOixmBUvyzzqQT0FOomMm56cDB73Rd5g
         t4zw3VSbnD//3Ew+RisP/Dy8OWP24iNKZTqgt0VdIjmuF46hpwRwCa6pFa7YxgaU1xo8
         1KyLY+bFS6eBYBQzDT5vI0sRjLFzgTg0bJtFBchVtxQKg1LRPV8+JcPiiYUfyIdibnAI
         /wnf6FonMZ1G/hOypvchbLwy/sHTeKUDE4GwBy7g+pwKTED4yjLEPFw/5hPIsao/ZNSe
         F2/IPPW+X3FGPaeBWtoK9IvlmGjTZiPx4jZCyjUJlkqxvqDgW5htN4TcSaIpn5TUHTmj
         XBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fZxwgKfIQimb2AFH9JXSBKvKMRan0cAJtKbrTFd8DCw=;
        b=td6TnmaI2x2fje1geRs5Loocvj+Mjx4ZguzP+Xb5N4CbMTYP+OdlTh0k6/O1oBKxuW
         GWiMmSMoVvQZd76LRkdf5zSHpOoZ/d/OQxbwgWNVPL91EjDothpB3FlJIfcSxpqTo7+Z
         5rICmdPd/TZQSlwPoAj+0KDa5ktHc6FmNYA1dYt8dBZ9gszGhzkgT8q1RomWZxnaRKzO
         pO9eN7FbU9LwEDgFnOYirhFK4WVP7Md/oI1UPE90cL5p4IdYyFnRx59PVQ6P5k38dUXT
         kyLXO9dTlAgwYMKevT55cvLclOvPLNwBmkvhCGGGduy0sPuqNIIY6lqToa3wvIp8rej/
         TRcA==
X-Gm-Message-State: AOAM532IB9DG8ksumIEkIzkYtwr5dturcNpnmc30zrnk/2q9sFhLB5m5
	4moBTSb0HUiYNIHGqoQybaU=
X-Google-Smtp-Source: ABdhPJw4ToR7cX6GwzJbqm5gAAoq9uNgPrbSZky7o6MUT6XFMq14WKNkqN9PXv1mbajcZYIUonTbcg==
X-Received: by 2002:ac8:5751:: with SMTP id 17mr36207643qtx.389.1621193049615;
        Sun, 16 May 2021 12:24:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h8sm9027603qtp.46.2021.05.16.12.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 12:24:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 16 May 2021 12:24:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: rtl8188eu: use safe iterator in
 rtw_free_network_queue
Message-ID: <20210516192407.GA2126643@roeck-us.net>
References: <20210516160613.30489-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516160613.30489-1-martin@kaiser.cx>

On Sun, May 16, 2021 at 06:06:08PM +0200, Martin Kaiser wrote:
> rtw_free_network_queue iterates over the scanned wireless networks and
> calls _rtw_free_network for each of them. In some cases,
> _rtw_free_network removes a network from the list.
> 
> We have to use list_for_each_safe if we remove list entries while we
> iterate over a list.
> 
> Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> Without this patch, it's easy to get the driver into an endless loop by
> scanning, connecting and disconnecting repeatedly.
> 

Oops. Good catch. Thanks for noticing.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
>  drivers/staging/rtl8188eu/core/rtw_mlme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> index 159465b073c2..14816ad51668 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
> @@ -199,7 +199,7 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
>  
>  void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
>  {
> -	struct list_head *phead, *plist;
> +	struct list_head *phead, *plist, *temp;
>  	struct wlan_network *pnetwork;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  	struct __queue *scanned_queue = &pmlmepriv->scanned_queue;
> @@ -207,7 +207,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
>  	spin_lock_bh(&scanned_queue->lock);
>  
>  	phead = get_list_head(scanned_queue);
> -	list_for_each(plist, phead) {
> +	list_for_each_safe(plist, temp, phead) {
>  		pnetwork = list_entry(plist, struct wlan_network, list);
>  
>  		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
> -- 
> 2.20.1
> 
