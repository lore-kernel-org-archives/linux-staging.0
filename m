Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2193FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 19:20:57 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id d22-20020a1c1d16000000b002e7777970f0so11704148wmd.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 12:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3blXmIdosDOuNNq7nc3EFCtcuawBSD/bJRQmtHW5+7k=;
        b=BoUhq/GfIAy4h/4PE78IRtrCiIBdQAyXgY6Hkfs+QynhWluSjz7NDD+9Umc0Pr8E8M
         fHbWxcESZS4Hh8Owb59LUMiZQmODjssSQ6AxMWJ1KdUld7S3t/3/fU8AOG7gOnIrI8NX
         Rx1xrMjwKfUQTkS/Aw+/7Mx4LkNtmteALToLtPY5No8G+/8xTNsyxWr8nnKLA6HJBJSy
         jyxW2Na7Ydie2n3BvrB/bHckxzIHV9oKuHT/JGcYhDveRPP6miCnqt44nJIRceFZqIRk
         3BfOBEVqu6Y5grr/EgSCJb/NJddRA5sZKIH0mWsV7s/ORtvHHHv6jjf7Kq3EkFQUpRr+
         LfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3blXmIdosDOuNNq7nc3EFCtcuawBSD/bJRQmtHW5+7k=;
        b=hAiZ+igl/0i1eh044Z44PYLFbD0CLtoUU5W3YPGDG0/HpogJ0SRkPvzJr2gmpIsm7Z
         OqwMMQrymSFTYFWFN5xzbNTvgqQl23yphMIhUFJ7izvClh1Y1A2Le8hETuKeJ/ZHySqm
         VjZVPvyyepqHnoA4WwIuiKOD4RTZlv1PnpVLCyPBQxtN2ywLwxFFB+WFRVBERu2DdaPp
         +V1UxvCN4z9N5V6BnP6FApeofj2UysBp5wvC+nd/kF1Mj/D4O6iVNB4idBt5DuFUafyV
         OeR3PpJkXN8iCDJgRGL9iQDDx8zkuDNPacszNBwzkGXWGvo2WzpRnOQupT3SL0R70vUW
         QpdQ==
X-Gm-Message-State: AOAM533nFXBifP33B7+DqZ6Gpj9ESaVCuxByv2NVtp3BwHc/77LDypYL
	6sruMeTR40eVz5kU4R4dbrY=
X-Google-Smtp-Source: ABdhPJyz5Emi3EedmduPhplg1maqn6jL2UZ6g5VEtgiYyqYMWWDP52GalTmaWl05OkvAXPqygVClRQ==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr15046919wmc.148.1630178456131;
        Sat, 28 Aug 2021 12:20:56 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::884b? ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with UTF8SMTPSA id p13sm10288209wro.8.2021.08.28.12.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 12:20:55 -0700 (PDT)
Message-ID: <1e31610a-0324-dfb7-abe5-f05d652d461d@gmail.com>
Date: Sat, 28 Aug 2021 21:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] staging: r8188eu: core: remove null check before vfree
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YSp4UP1+HrhmDA3C@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YSp4UP1+HrhmDA3C@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/21 19:54, Saurav Girepunje wrote:
> Remove NULL check. NULL check before freeing function is not needed.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_sta_mgt.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
> index f6dffed53a60..4726771a8403 100644
> --- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
> +++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
> @@ -155,9 +155,7 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
>   		spin_unlock_bh(&pstapriv->sta_hash_lock);
>   		/*===============================*/
> 
> -		if (pstapriv->pallocated_stainfo_buf)
> -			vfree(pstapriv->pallocated_stainfo_buf);
> -		}
> +		vfree(pstapriv->pallocated_stainfo_buf);
> 
>   	return _SUCCESS;
>   }
> --
> 2.32.0
> 

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
