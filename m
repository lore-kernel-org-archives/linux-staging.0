Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3999F33A9DB
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741866; cv=none; b=jXBdbeGRIEsRCrwmrztDGLrIcRxXHzyLq6eiDT0evVMRnba9QCKbGjkcy97/lSnWJwnovxvKxfo6q9VA3j3n1Wve+A8yYnNhxUu2uZ4aXWisuu1WSXqDe+q87E3MajGVby8F69FhosUIzgxhwSoUlUwZr/Uf9FaKXD5gCNqhF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741866; c=relaxed/simple;
	bh=aodxLrNFywOrNGPxQHygoPDxakVVJLlYTTgiTsL1UYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pni8u2jIduPK2yspFLkzhSHbV3lXFbwFch1W19Vz2MV6xgYfZfJ4S6v788JyWHbkj40Nwvc8ZAXMSBHA3ya5qp6kUjBAAbNCWHUKLxnJWrjZBE14xlUXamdT+GKBvJYlyf+bWBnZbr02PEFc2ek22zo6xoQDOYw6ED1Oq70Deus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwE2d2NC; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwE2d2NC"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a0de515e54so2389143eaf.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782741864; x=1783346664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc3KKu/CbjRKqTbUNoAlqEKJG3Dl+lrIcimJSy7QRFo=;
        b=NwE2d2NCvvdOvqZ/lIYryG6RDkF6vicThHxWshTJ9f5V6Ixvn16Gqe+X6St+xPefv+
         JVBDnsCUWanIOavcINJepbo1lEaL6sel4g56FiZP4RqmQIbs5JHxzkVqpfBQ2zbv6Q0D
         xY36MvTVBgYDq8MZEnnshr+bh/JkI6aTia31EJLPnkHPsvUt62+ThDRJS5kJ3XehsQNo
         zG+FfcYvW5muCeUTsp+3UWXodo8yTvHkZsPUe1mBv2cCbRrqBhYt41cj3+xq8+9zpebw
         Qj2IcdgNjdN4VRVbByMLxP6R5x8mrAywis8ZO3FJfvVuEXCKAjwcom+XuIkEyu84Kv/f
         yciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741864; x=1783346664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc3KKu/CbjRKqTbUNoAlqEKJG3Dl+lrIcimJSy7QRFo=;
        b=pPC+dLvEktE24od5CiXa3R2Tr+T6j4av0PUJjxn+tsmQJxQluFAyb5ZwclKlLY3aK2
         MU9jJewqVof+KfqOFJ/KJ3VnvUJ/cy13mGtMvzQmoRzwwzpug2ixWXQ4o9nKB+nW3BxJ
         rVQVT0kzW6hmp7ytBwb5+U6yxWtGcB0z5WphD/w0OYCatHp+mOoHUDevsIVCHHeoCnGM
         vgEQOtJMvaYOEuwld2UdwaxyPTOKga4I0trSI9m1iYZ0k2UDpQJwYiVQiShvvfRxdmGs
         E0MQuFp1bVd2tADsbPAIvB9o+6UoAnVXhaabFcfFLkzlFYR+tvHLx05DC2EaEbxAmxJK
         LTUg==
X-Forwarded-Encrypted: i=1; AFNElJ/dHeahU7Pyx4hr2rgVgkvFM+neVeWLCIlihRKu6rVyLJzuEJRL26UgO+dmfW45Ck8Zl1AIvNGpShKIn6ta@lists.linux.dev
X-Gm-Message-State: AOJu0YzEm1lVDU6GyZsA5omqDxrWXd7Mtow/FqMfMKEFyxOdgZc6oDvX
	GtBv9BL93JtfO1sjxNkjjtZmqXqMp3Knk+WJAu+pruI3KgQ9/KdIPotx
X-Gm-Gg: AfdE7clNtd+7Y8FPNPFmUrjspc4zR+bqY9vZddQSCVHu7GBPirwCzLQ4dg3JwzN4YFd
	VVbnQgay0+OMQ1I2VLQwe3MOabEwgJlREZktvc6EwLrghLHYJAzoAkGORNPCcbCuvHJItnJGsEm
	xp5TBTPEv9wPv6YWAtUZsQG8Ug7rpxtULl3BmcRx+8FfgrYQELQuT+WzEjT3SUI5xu1kD5t1zog
	HCR89mZrsuB3deOEezFQXE7A5AMnSdo4MLGU5GS+DYrB2PSQfhTW9zwJK8mSdaCvASyyNzKpJb/
	42BGWsyvldy/tl7V2eQz79hFRAcyMYlLOq04tXGpYEA9h2+ePSfZckeS5grTmD0RiQN11o7x4Z3
	VXUtLM1bVPy6MZpvuYU+aApyQxGC2L6j0wgm9ytPp4BMxmQjGdN5OpRop/VRV2pIJcWLbPDiu6f
	dP3rrxXg==
X-Received: by 2002:a05:6820:1c90:b0:69e:5802:9680 with SMTP id 006d021491bc7-6a134215bcdmr10208863eaf.6.1782741864149;
        Mon, 29 Jun 2026 07:04:24 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a14129949dsm7164807eaf.3.2026.06.29.07.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:04:23 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:04:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: clean up style in core files
Message-ID: <akJ7YYmGXpwsUDDh@stanley.mountain>
References: <20260629131831.106937-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629131831.106937-1-miraly.dev@gmail.com>

On Mon, Jun 29, 2026 at 06:18:31PM +0500, Ruziev Miraly wrote:
> Remove unnecessary braces from a single statement block in rtw_wlan_util.c.
> Additionally, remove an redundant NULL check before kfree() in rtw_xmit.c,
> as kfree() is completely safe to be called with a NULL pointer.
> 
> Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
>  drivers/staging/rtl8723bs/core/rtw_xmit.c      | 5 +----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 1d37c2d5b..cc05decd4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
>  {
>  	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
>  
> -	if (dvobj->oper_channel != ch) {
> +	if (dvobj->oper_channel != ch)
>  		dvobj->on_oper_ch_time = jiffies;
> -	}
>  
>  	dvobj->oper_channel = ch;
>  }
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 444966c0d..3dd08bad3 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -1768,10 +1768,7 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
>  		pxmitframe->pkt = NULL;
>  	}
>  
> -	if (pxmitframe->alloc_addr) {
> -		kfree(pxmitframe->alloc_addr);
> -		goto check_pkt_complete;

Why did you delete this goto?

regards,
dan carpenter

> -	}
> +	kfree(pxmitframe->alloc_addr);
>  

