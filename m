Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D162F32;
	Wed, 13 Apr 2022 20:24:50 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id x17so5544008lfa.10;
        Wed, 13 Apr 2022 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QJ5sTyRXODAe6Yj1NqU8Svd2xdPO6Zu9E85WaAx9PWE=;
        b=DBUo9zxVWHLMuYWmfCttg/JIIivO3FPIzTfAeZ6zmB1pcjms7Sa0DQ+Ye5pvKqDvbk
         qVjqTKAKSH856P1pkVfdysbJuM5cuFVklYT2evCxvESxZn+5+9w3OQ8NAo75PEhHvzS7
         LHE/9ytcS+v/sCB3tKe9RWhvjW1ktxMKSVCECISVjXbuw5lFgg6+iCtBn6/LnoVg8t5p
         R+KKoz2KH2fPqJ7ak7S/vrguhXAuDwxAvlkv3q+zQXGGj2bcegQlK+YEQKc/CgjRfuWy
         hA/tI8EyShy5l3XlknAgF8r/wF2cEc86gGfIkIWfqyojgY/XhBNG03VRpWc0ZgqZ2pAo
         ztpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QJ5sTyRXODAe6Yj1NqU8Svd2xdPO6Zu9E85WaAx9PWE=;
        b=6tOxo2ZXh9lKRJIuRfPgYR/p9UFJ7oF3BGPjztAdA0JhDAnIrabndd08veAklrEV1u
         qiol6vgkMdqsS6hfZ6wriU1s7+AGd7651M6/CM51C/26QQT1BFUguMHwc9cR3Gk7ioUl
         giUbn7XVwP1PmFFVM/8+nCtZ0AEajiIuFa4BTJTK7/nFG6CjWF+S78bG9FdQ9mQ3rfVc
         NBvkky+pznSJ0EPuvm40mc2/9LNpqbOAfq70CAhTwBzesu0Yp7v9/pMWAcNUpeax+L8I
         HAUWYnL7jKt+04kHuhukmNgSjnXXhu8UFc01NM/8leGPIcJCcmbsQtftpQDeok3naPxZ
         qZ7w==
X-Gm-Message-State: AOAM5327HQViylBAoRIukP3kBl6OmFQlgWZ5q5wNtaj2Pt5PBT/rcXAq
	qh3nMgGgE8QRlWlCzrjI3IE=
X-Google-Smtp-Source: ABdhPJw7Bb3Dr2VojoGI6uyIup0R4eK6b5vwAVrSnHxXRhrZJS9bNEgWl0PZYkHwswFBkIuDIkM2CQ==
X-Received: by 2002:a05:6512:3fa1:b0:44a:f351:5a00 with SMTP id x33-20020a0565123fa100b0044af3515a00mr29051943lfa.19.1649881488119;
        Wed, 13 Apr 2022 13:24:48 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id r23-20020a2e94d7000000b0024c7e0c3862sm543488ljh.58.2022.04.13.13.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 13:24:47 -0700 (PDT)
Message-ID: <3f4a6c08-4434-1865-bc96-984152af5af1@gmail.com>
Date: Wed, 13 Apr 2022 23:24:46 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/6] staging: r8188eu: remove unnecessary braces in single
 statement block
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1649880454.git.jhpark1013@gmail.com>
 <4a0f2a0f24321c5b2039f0f8e6132cec4a2ef068.1649880454.git.jhpark1013@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <4a0f2a0f24321c5b2039f0f8e6132cec4a2ef068.1649880454.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jaehee,

On 4/13/22 23:11, Jaehee Park wrote:
> Remove braces for single statement block to minimize the number of
> empty lines, without loss of readability. Issue found with checkpatch.
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 3e9882f89f76..d3f4d7cdfa08 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -112,9 +112,8 @@ void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
>   
>   	rtw_free_mlme_priv_ie_data(pmlmepriv);
>   
> -	if (pmlmepriv) {
> +	if (pmlmepriv)
>   		vfree(pmlmepriv->free_bss_buf);
> -	}
>   

If pmlmepriv is equal to NULL we would die in 
rtw_free_mlme_priv_ie_data(), so this check is just redundant




With regards,
Pavel Skripkin
