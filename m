Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38023B4
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 16:58:01 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id r20so11619885ljj.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 08:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=owTm5fqCrovwZsSeFyT0SWgn+isvTSMUFwaRZEzOpTg=;
        b=Fw6F2RVeaLHd4OcyWKFCNWbxG59qs8S5e5ppQ7b/fAmmhBaNwAzqoPn5FqurgRD/UP
         4kNMqK8/iAw5tXqy8+SKwwagzwBK4r13GtfI8di1uSxXHmwOVj4nCezKW3oEY72dYotj
         hxVlwrYqNlHbjZj6/Rxz1Fz4jvaADcWGFTUOeHJYnUJKiUk8GxVsSFmxrcMk3EgkLOuc
         r/2UDFiULKIrVAO768vm6gXm/qSHQWjc1R4K8u2FvGxdNUlMjr+iioWtvpv50HYPOHcY
         n6yHYcFeLLs87ATwhTrEl/EGglY8rlyjj3g8c3+/ASibXypzBIvcVryqfXQj6KaOZJeo
         ixKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=owTm5fqCrovwZsSeFyT0SWgn+isvTSMUFwaRZEzOpTg=;
        b=IU9AX+vAxQ2rh5mRd+pUbo+XKcG616l72lRWr7ZLnoqIrCAHudLkGKaeVk4uVdjNf/
         XCLF0wYxruUNMQtF7IpbwC8tIJc5gZ8LlDVtJYimBZcdWVT3GbfcEd28XOk+e81ih9bT
         Y4PuIaHbtytDsR8M9U+kCWge6j/z13tCIlaa9zl/xXgEPgSktAhP4Hat5+s1ahwULY/B
         ukMHfeiZu1gFO85FXKgTVgKA03iqsH0LgEztzLNIAajmYlfdmrmcHQGCa+7J+0VVDSxE
         6MLNpHRA3PlbVpOvVu5Vral8kZIpDvQnBd8/LxeKDwj7A4LzHO1px1V9YGr0Cvfsxfc0
         iosA==
X-Gm-Message-State: AOAM5330JeVyvMdbiR4PJMUQQLZZH9qO5BTIpVnlia5sIM6bMEEMySab
	RlgZxaloSAaOipNC3A2sXsA=
X-Google-Smtp-Source: ABdhPJxfFuunKLuYEM0yR1kHFngwA+u3ljU4hHA2rRC2yknzPx4+HY108YRLQnqv4A73w3xJwOxzfw==
X-Received: by 2002:a2e:808b:0:b0:243:f7ef:fbb6 with SMTP id i11-20020a2e808b000000b00243f7effbb6mr8841775ljg.30.1645894679320;
        Sat, 26 Feb 2022 08:57:59 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.64])
        by smtp.gmail.com with ESMTPSA id g41-20020a0565123ba900b004437f6677e6sm491579lfv.245.2022.02.26.08.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Feb 2022 08:57:58 -0800 (PST)
Message-ID: <1c44c931-5b90-03d8-94bd-5e68682c4787@gmail.com>
Date: Sat, 26 Feb 2022 19:57:57 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 3/6] staging: r8188eu: cnt is set but not used
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220226144843.1118951-1-martin@kaiser.cx>
 <20220226144843.1118951-4-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220226144843.1118951-4-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 2/26/22 17:48, Martin Kaiser wrote:
> In function recv_func, the cnt variable is set but not used.
> It can be removed.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/core/rtw_recv.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 0144c4642911..9a2e2bc2e294 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -1798,11 +1798,9 @@ static int recv_func(struct adapter *padapter, struct recv_frame *rframe)
>   	if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
>   	    psecuritypriv->busetkipkey) {
>   		struct recv_frame *pending_frame;
> -		int cnt = 0;
>   
>   		pending_frame = rtw_alloc_recvframe(&padapter->recvpriv.uc_swdec_pending_queue);
>   		while (pending_frame) {

Just out of curiosity: is this thing infinity loop?

> -			cnt++;
>   			recv_func_posthandle(padapter, pending_frame);
>   		}

Nit: bracers can be removed

>   	}




With regards,
Pavel Skripkin
