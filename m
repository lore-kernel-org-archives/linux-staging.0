Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3E1857
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 05:53:25 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z11so20771647edp.9
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kcwJ6iz0WSRqkk4otNBkZUgi8EG0jqf80hBxBcLJjoI=;
        b=fw1jQ2idkZYe6jKTepYjZZxhD5giE5xmrVbaEL98EFHaGhs4KpxpLZgXV2E+ZzgVeE
         oMMh+qhpElWo0b5AGkujeZNW/sJx3VlXvuAowr+oxIq4cV1DfMKSr74Yhjhd5Tx2Zhqh
         uh2/CSeRAyVHmBcX0HZR3VHrdsyiaAKqPjCbJwnmWW1aeam455jrHGHKwZSaQbkgPYt1
         VoSy90kfmNFRVeLRDKB7NmN/6G9taLBkyCb28b0IRgfe8pRR7Y4AXn1e887kVoRJ9DAQ
         ainC/Q4GSwL56yLXeKNcZDrMdHyFWEi1GnSUUCyq8+Bst+wlT8I4Gf7kmRcWlWSLX5AL
         8aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kcwJ6iz0WSRqkk4otNBkZUgi8EG0jqf80hBxBcLJjoI=;
        b=LvlAEtJMgYWIjP2oNKJYlL4oDxR3F+vK8WJPIfB1iZsF0je6W5vZeBewumA7pxqqIN
         yZ2W0e6wkVGr0ommPVsi5uWdhaYpMesCDyT4FJM9qL/gSla6Kfbj7fHRVm7EahztswVE
         4GStAkm3uUl3kSteDZZGNtnSET5V4gNBorjGmCaq8M9LK//l3SmLt8piZ57Uv/e6nmW3
         R2ueOf8j5Vhb6Z0DOfCq/FKLzTSW59ggp7/bMB7DIWBUjDAZPd45eSMK3bal0Z1bGS/e
         Bm9yK6mGX9NcE1ODvO6aWLOCRHuL7iMIFGsNvq2ckmxFhF7Bkd2DgX0nN+CaU8iKsyqp
         rw2A==
X-Gm-Message-State: AJIora/iygrkAboa/+zTtezEGSpTXpuyB0P2DC+uwgQzuRBzYAsQme0+
	jLo42BZQaFDM5g2I2Ka9gGY=
X-Google-Smtp-Source: AGRyM1u/0UVLNbC6rm1zOkyTAmn61viyenIsLAhw8yIHE1PtF2FEAPRS8XTizxeuck1l8LAh4MgbJw==
X-Received: by 2002:a05:6402:274a:b0:435:9807:7752 with SMTP id z10-20020a056402274a00b0043598077752mr8606211edd.63.1655963603696;
        Wed, 22 Jun 2022 22:53:23 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906318a00b00711aed17047sm10162207ejy.28.2022.06.22.22.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 22:53:23 -0700 (PDT)
Message-ID: <02cc4538-73c4-9f0f-45d9-29f867143df7@gmail.com>
Date: Thu, 23 Jun 2022 07:53:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] staging: r8188eu: combine nested if statements into
 one
Content-Language: en-US
To: Chang Yu <marcus.yu.56@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220623051404.410632-1-marcus.yu.56@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220623051404.410632-1-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/22 07:14, Chang Yu wrote:
> Combine two nested if statements into a single one
> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---
> Changes in v2:
> Added a pair of parentheses to make operator precedence explicit.
> 
>   drivers/staging/r8188eu/core/rtw_recv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 6564e82ddd66..020bc212532f 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -166,10 +166,8 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
>   
>   	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
>   
> -	if (padapter) {
> -		if (pfree_recv_queue == &precvpriv->free_recv_queue)
> -				precvpriv->free_recvframe_cnt++;
> -	}
> +	if (padapter && (pfree_recv_queue == &precvpriv->free_recv_queue))
> +		precvpriv->free_recvframe_cnt++;
>   
>   	spin_unlock_bh(&pfree_recv_queue->lock);
>   


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
