Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5886A7C
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 19:01:33 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id v4so3277685ljd.10
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+tusk1aAliVBnk698Wzreusezn6ixz2Ndj0yD2FT6oc=;
        b=IJ3yiYTbx1PS6R8J/dzPgtTLTnGNzwwOcXou8Z3ksezDlwUWJs6VmBY+p1ftGw7tSl
         mjZ9rwHSjgcfX5WknNLLAq1VLL8pB5N+rSDR5sXPk6a/ZbekHE3gxKK3gLkVMzFXnD28
         Ewz2+k9IMYx/Evk2TXQ6evAdofCjh1Ha/V3juheITvbC7/KcJ8mxQ3fBFGBbks+ko0zH
         j8D5MXMN1/M7z0yZO5B7Rba/qvyyhtmw+CgcL28eTchETC03Fj+7sP2a1pYzK4Ojg8oW
         0vMe0S3KxO8oj5nbZ/FPdDnx4cJSaFPmNca27EAZ8Swd3UMA4OmEA5hbI8pk9OiabUHK
         TKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+tusk1aAliVBnk698Wzreusezn6ixz2Ndj0yD2FT6oc=;
        b=McHWlDH9qJkSKgBUb8lPQN/ioqavGGqqt7TqUFvrNgaYpT/5X5FUVf9bvRtiM5zn2/
         tLxFzSgHprNqydwlg6vnPTBI1frXc19fe2WCHp5q/MhJzzyyNQgIY0N88w+Lp6gvjYO2
         UDnsEjeUSpAb2P8GGt2lomB92Q0Z9W+v/eaaBwF8bfExWZF0XIxRbIWQC5F37t8LzXdm
         gFg1aGYYhGjKyHIzdbkTc1Jms8ZRZQi+iYcmWBa8XzgtDNLuHY2/6gfTm4RThfNWPafv
         jq4KyCDyUk8xh26c9StzZwKCksfNtj+y2S/1kGDDnVMnLz+xgDUeBsXEvoorG09FN5og
         S7ng==
X-Gm-Message-State: AOAM5309jkR3MA30Yd/l2YPq4sm+u1V/vPUYRm/Vm+0ktdWIVdwlt+aj
	z2jXHix6c2q9S2FwJsx/Ev0=
X-Google-Smtp-Source: ABdhPJy6nfIi6y1OenfKsFPHIu8uWbc7mMPb+DsfPiY5lIpUSHJ15Zj0P3YBXEC0akZH5wGrwWh0yg==
X-Received: by 2002:a2e:9e19:0:b0:247:deb7:cd9f with SMTP id e25-20020a2e9e19000000b00247deb7cd9fmr8622396ljk.261.1650826891258;
        Sun, 24 Apr 2022 12:01:31 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id x16-20020a19e010000000b0046bb663f05csm1113153lfg.99.2022.04.24.12.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 12:01:30 -0700 (PDT)
Message-ID: <88d617e4-419c-0d57-b0e2-f743d208c766@gmail.com>
Date: Sun, 24 Apr 2022 22:01:29 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] staging: r8188eu: fix null check in
 rtw_free_recvframe
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220424163132.37007-1-makvihas@gmail.com>
 <20220424163132.37007-2-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220424163132.37007-2-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 4/24/22 19:31, Vihas Makwana wrote:
> There's a NULL check on padapter in rtw_recv.c:170 which makes no sense as
> rtw_recv.c:152 dereferences it unconditionally and it would have already
> crashed at this point.
> Fix this by moving the dereference line inside the check.
> 
> Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index c1005ddaa..4cf9b4b8f 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -154,7 +154,6 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
>   	if (!precvframe)
>   		return _FAIL;
>   	padapter = precvframe->adapter;
> -	precvpriv = &padapter->recvpriv;

This expression just an addr calculation, so it does not lead to panic 
in case of padapter being NULL

>   	if (precvframe->pkt) {
>   		dev_kfree_skb_any(precvframe->pkt);/* free skb by driver */
>   		precvframe->pkt = NULL;
> @@ -169,6 +168,7 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
>   	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
>   
>   	if (padapter) {
> +		precvpriv = &padapter->recvpriv;
>   		if (pfree_recv_queue == &precvpriv->free_recv_queue)
>   				precvpriv->free_recvframe_cnt++;
>   	}




With regards,
Pavel Skripkin
