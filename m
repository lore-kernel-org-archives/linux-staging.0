Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E92CCAA
	for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727031491; cv=none; b=aEpNY7qSMBVOKm8NrOTedkDQCupgSEPIPdFwUTFlXZL5ZDACJ7nyPQxIDjO0wKgK5h6SsOaIOdx6XX8iYaWj+6M3g3YXM+gMZ6Fq021KzTSfoJQJ0t5MZhgjoOFpQzEozT9v3GV6xriU0pEXPAjkmccojfS2jQl7ptYVrGzOFDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727031491; c=relaxed/simple;
	bh=Yo1p9c3D7RZVeVPDG9rUuD/rLgihvhItphgmie2b8C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rr0VtETkzaH5mvpOwpz1xXW/8XEja95X+0L3krbW6/u0kX+8IFK5Utr7yyYdqy+Dj/kiZTMgmD169o0RU4FteAyZbVTTC7OiEMXRr1nzPahVR+kzM+LGFxaw69UeFk0BBoymTerSf506734+viskYBhpybwpSKvJ5f1SApHwSgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiaSdel7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiaSdel7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso46615565e9.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 11:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727031486; x=1727636286; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VtGjd1R3UG9yqI9eG9VC/AHCt3Lp0guUAhfU5piwLw=;
        b=NiaSdel7WFetvDyolpPJaA+1/NMtb4/DMUM7HEZ+G+rR4XKsqnXtHmVr7ivhpdlQu2
         +0Z0eZqfJ8pxRpYFMKb6egiiz1bkOCEo4Cid3SbhFb6dnZj8YqipOA5G2HMnStjhshmC
         6Y9yR/lYIZcWxPOlekZBIkBxPdoKazWsOWRAU5Vp/ZnAiTD5RFSzrzGpvLrVVf37MMSk
         5f08NfJzR1YzvMF/6HxcFHK+KR3WQbUwKQrXu96kGjiK55AVMK0IDCiyrgC36Wvy6Wge
         UtT/W/JeWfXjOubLBR8KEDuHhh2AC44yAGeweTneFHglmh0Qheax4+5L7OIJJb3sb0SV
         f6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727031486; x=1727636286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VtGjd1R3UG9yqI9eG9VC/AHCt3Lp0guUAhfU5piwLw=;
        b=eFlckjOUwrVP+b5Cd476WjXbQCz82LMEkELBk0dK0pei6TXOCmh5bChYpwq/22p91d
         /pakUgrHvQ7Vd5r3DMY4pgOppVnYkw+DzDmqqSU+ZK1Apc3UNu55Q6ibza+KqrTXjGyK
         e7niGk4K/iFsGLNu1mHu7isZyiwxSjPUwPrw4QwqscURBI9m3OSsgt7VZBbmbpEDQ3JV
         ZnNrhnYVEw2dpXyi8n0mEQ3SlHnlLXk5skRlMth16R0PgmUWUIij8RUoAaYBbZRkL30D
         lEdQldqfmwIbkOEIiiokSUIAKf6kITUTAmIyXMvIVcOOK9B0oIcGz/pOvVaTnS3P4sYq
         K9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeew7M3XGW6e/qHckz9Lvzn9Nl8PZywRPoMoyizaOwZFll2ly2ZA/MaX9I9ZevFC/WS8e2Glxvw796wwXE@lists.linux.dev
X-Gm-Message-State: AOJu0YxPxlrV7lDUIc73kuSD8hQfE23Igi3pJTjvR+CnnmDyppmkpreY
	gTDKolWYx90SEilc/mamFAjmqr9K83T8fAMFsdEReQAoXqdtLYtG
X-Google-Smtp-Source: AGHT+IFOkUOXhu/KYBBc+5T7xNHZfam5jpYiqdzWrAJ5+ZIYsI04V+s8TZ69VXJOJUCBYHTGGUrPCQ==
X-Received: by 2002:a05:600c:1908:b0:42c:c8be:4215 with SMTP id 5b1f17b1804b1-42e7abe3ef3mr93411025e9.4.1727031485979;
        Sun, 22 Sep 2024 11:58:05 -0700 (PDT)
Received: from [10.188.212.131] (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f0622sm22718510f8f.18.2024.09.22.11.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 11:58:05 -0700 (PDT)
Message-ID: <eb3000aa-6bfe-484b-8717-5d98681f6230@gmail.com>
Date: Sun, 22 Sep 2024 20:58:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: use kmalloc_array
To: Tudor Gheorghiu <tudor.reda@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Linux Driver Project Developer List
 <driverdev-devel@linuxdriverproject.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <ZvBX_mugFRQHMq1r@MacBook-Pro.local>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZvBX_mugFRQHMq1r@MacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/24 7:46 PM, Tudor Gheorghiu wrote:
> use kmalloc_array instead of kmalloc with multiply
> 
> Signed-off-by: Tudor Gheorghiu <tudor.reda@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> index 408616e9afcf..a0f29fab3dce 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> @@ -117,7 +117,7 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
>   	/*init xmit_buf*/
>   	_init_queue(&pxmitpriv->free_xmitbuf_queue);
>   	_init_queue(&pxmitpriv->pending_xmitbuf_queue);
> -	pxmitpriv->pxmitbuf = kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf), GFP_ATOMIC);
> +	pxmitpriv->pxmitbuf = kmalloc_array(NR_XMITBUFF, sizeof(struct xmit_buf), GFP_ATOMIC);
>   	if (!pxmitpriv->pxmitbuf)
>   		goto clean_up_frame_buf;
>   	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;

Hi Tudor,

please improve your patch description. Better omit what you are changing 
as this can be seen in the change itself. Do focus on why this patch 
makes the code better. Please use a full sentence starting with an upper 
letter and ends with a ".".

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
