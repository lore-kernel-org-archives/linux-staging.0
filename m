Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF7333EA
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 19:22:23 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id h11so4611336ljb.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IY7OoR//ShblW6kyrlBUUrXswtml+giyXaUgcmjOBHM=;
        b=cZSnajyumhDtwlZYKn5Kp6i7W3fmPF/lT40N9AKwMp/3M4ctrp/0elgIYKElOlxYuJ
         dNwH7Xt/YjA9YFJYQ/6E2NkeEqjGU4UX7Ic2yIEv1U7Dsqxo9sSeWgbFz3MhUtEYojyf
         9nYNiTrRwNhm61lkiu2KM/0xw9MS2ds35jIRMGBXsE2q3WmA0HZbgowV8BeWg7zNNpCf
         xnduV0oNV5ZsyxbKgEI4Fvh0D/wHCwPG4Cw7l+3CdHiEueTN5CCjWSM4Z7vwIh9vUEH4
         5FqsIL7t577nlmGFq/yDI0ari3NiRHdubB4D+MLsew7XiY6oM0EEsrE/YE9JU43Xdaa7
         xxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IY7OoR//ShblW6kyrlBUUrXswtml+giyXaUgcmjOBHM=;
        b=m9M/EnDeLureWSocrdEaJkEOrYMZ5aBBvFILVJj4mOD2LSziXAJrBBKGU7wKUGuUMS
         wg8McXoldC2JqCkQKhdtoeSVZIU6m1/n5pzmiViohyqnqldmYIIHrtSqZOgxkJuaIIgD
         YeigIP6kKbhlnJlmcvfXo/EtPSlq/0SzKTOPOMSqSYUu5/tmObFn/hlGBPRxXms5oZp6
         8e+m+zg7p/izK4TDeA0TPf/vKAYERo0+Fb9ooWKg4LK8IkmnFd0ac55IRqCIqzQQ5u3E
         4tGu0+ODctUEE1EAqYT4LtLuH52QoJh+cbhlvUrb2YlRrHXDnNBRz7r69BD/PmGN9eGU
         wSzA==
X-Gm-Message-State: AOAM531x+UYnvpM6aFAevzCf6lUEkzxcSzKDLSAhnPdlORqZSdIQ7gMD
	Ah4x3xVxcrXgwiSfvobeI9o=
X-Google-Smtp-Source: ABdhPJxxrgebjuuBB7dcPiuGRipD55DeXg8mm2ww5jZSdBNZmrcUrW0k92dF38UmLa84zsunOxtpbA==
X-Received: by 2002:a2e:bd09:0:b0:247:e127:5e05 with SMTP id n9-20020a2ebd09000000b00247e1275e05mr6239533ljq.212.1649272941671;
        Wed, 06 Apr 2022 12:22:21 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
        by smtp.gmail.com with ESMTPSA id h23-20020a056512339700b0044a15d1c6adsm1919834lfg.26.2022.04.06.12.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 12:22:21 -0700 (PDT)
Message-ID: <9c307f1e-aa95-08e6-3a01-825caba19a30@gmail.com>
Date: Wed, 6 Apr 2022 22:22:19 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] staging: r8188eu: check the return of kzalloc()
Content-Language: en-US
To: xkernel.wang@foxmail.com, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <tencent_5AB92A7786438342357C5669E7BF0C249505@qq.com>
 <tencent_15C23F2EC8197361EE200714C54E78B45206@qq.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <tencent_15C23F2EC8197361EE200714C54E78B45206@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xkernel,

On 4/6/22 07:30, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to handle the return
> of it to prevent potential wrong memory access.
> 
> Besides, to propagate the error to the caller, the type of
> rtw_alloc_hwxmits() is changed and another check is added in its caller.
> Then if kzalloc() fails, the caller will properly jump to the
> corresponding error hanlding code.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2 update the description and adjust the sequence of patches.
>   drivers/staging/r8188eu/core/rtw_xmit.c    | 10 ++++++++--
>   drivers/staging/r8188eu/include/rtw_xmit.h |  2 +-
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 865b2fc..92a1ad3 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -176,7 +176,9 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>   
>   	pxmitpriv->free_xmit_extbuf_cnt = num_xmit_extbuf;
>   
> -	rtw_alloc_hwxmits(padapter);
> +	res = rtw_alloc_hwxmits(padapter);
> +	if (res == _FAIL)
> +		goto free_xmit_extbuf;
>   	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
>   
>   	for (i = 0; i < 4; i++)
> @@ -1490,7 +1492,7 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
>   	return res;
>   }
>   
> -void rtw_alloc_hwxmits(struct adapter *padapter)
> +s32 rtw_alloc_hwxmits(struct adapter *padapter)
>   {

What about plain 'int'? I know that s32 is typedef for 'int', but 'int' 
looks more natural

just my 2c,


With regards,
Pavel Skripkin
