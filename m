Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE142C9C
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 20:55:14 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id g11so12390710lfu.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=auxuvnZ7svhFSb9Rzfvb/JIfRxgci9V2UAifzlMOcTM=;
        b=ECYyBf96vaAHbThdqPJPqvy55VCW5ptYXqjca/Iny5gNxCMMRjjalHGlc/ey3bsDhw
         XNgYbcMmGR1jI+/nSaKJv+7FhD1ysd2X025a/k57GFrdC5g3o7fgjMY4SU/Ev/CBK8ub
         NOIkSiTXNtW93m6zN3RSeUk+cnW9XaRKkvFBwFAKyU0ShourbZ/vzvq14hQ8XngAh0uN
         zLZpyT7L1gL8gRe7SuhBvHllWUQFQeTt3SWXBB9wJHuwxsDDPAXhD0nyZpscrWy3OimC
         xWY6DuMw8w7w7BJmS+yXBBHCFfYtIw3grPCveJYkTOfiwqOPXch7GcK1MpwQ9q49B2z6
         pArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=auxuvnZ7svhFSb9Rzfvb/JIfRxgci9V2UAifzlMOcTM=;
        b=bwRV0hwHV4mT+QJu+u2tu/vAdPWQSmK4WmALXpOMepVSXaJQ/XYVgkMMRMI+YgmXeT
         9UniyqCZpLv14R0vqFONoIyOoJIWf2qLc+gCZ2YUT2wOTFdZufVPNFk10BSmRphFj7vK
         4W9FK4a7Fo5QP++m1ErqaZ7ytfwsnzjYJCd3CDwUQeJcwAhQm4Zw5ReQyBUhHxijXHVg
         qOoNMUFfb4CIb9OkK/3IKdi2QtdDNwv6TvRdB8uSf9jW1uWbBKyB99uyUfRqW9aEba7U
         aGjkkgSvEqaQTgYluoQfpoDl/fhIbh7DE/VyTrFqqTwGTH0FBrcBFZ87sBUHs36uVdiD
         nm1A==
X-Gm-Message-State: AOAM530Qo7WRmQpdYEt2S6PpEzfvd9pHIKGfuJH6dX2Ndk8QbfN3hZbe
	KlkC6DdAfJCyzeKVVeIEvGo=
X-Google-Smtp-Source: ABdhPJwf5tLCYkS2sGY7VDb8SZxpGfIppK2DwajY7sfHp3THVu5O4SLuPJGD0ZAEshdlNhzdr5Ft7w==
X-Received: by 2002:ac2:4113:: with SMTP id b19mr8853709lfi.449.1639860912390;
        Sat, 18 Dec 2021 12:55:12 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.239])
        by smtp.gmail.com with ESMTPSA id j15sm1816002lfe.157.2021.12.18.12.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 12:55:12 -0800 (PST)
Message-ID: <63ff3ff8-e428-f0f6-eafc-3c517f34cb6c@gmail.com>
Date: Sat, 18 Dec 2021 23:55:11 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] staging: rtl8723bs: Fix styling issues
Content-Language: en-US
To: Ismayil Mirzali <ismayilmirzeli@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, simon.fodin@gmail.com
References: <20211218203647.24486-1-ismayilmirzeli@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211218203647.24486-1-ismayilmirzeli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/21 23:36, Ismayil Mirzali wrote:
> Removed extra whitespaces and brackets for oneline if statements
> 
> Signed-off-by: Ismayil Mirzali <ismayilmirzeli@gmail.com>
> ---
>   .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 20 ++++++++-----------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 7fe3df863fe1..7807b2a6cdc5 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -32,7 +32,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
>   	pHalData->SdioTxOQTFreeSpace -= agg_num;
>   
>   	/* if (n > 1) */
> -	/* 	++priv->pshare->nr_out_of_txoqt_space; */
> +	/*	++priv->pshare->nr_out_of_txoqt_space; */
>   

I believe, commented code should be just removed

>   	return true;
>   }

[...]

>   	rtw_unregister_tx_alive(padapter);
> @@ -311,7 +310,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>   					pxmitframe->pg_num = (txlen + 127) / 128;
>   					pxmitbuf->pg_num += (txlen + 127) / 128;
>   				    /* if (k != 1) */
> -					/* 	((struct xmit_frame*)pxmitbuf->priv_data)->pg_num += pxmitframe->pg_num; */
> +					/*	((struct xmit_frame*)pxmitbuf->priv_data)->pg_num += pxmitframe->pg_num; */
> 

Same here


With regards,
Pavel Skripkin
