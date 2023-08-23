Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078A9445
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 16:33:34 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c4c5375329so3854353fac.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692808413; x=1693413213;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=biBWlZOCmK/KsAHuVrUAhW2jC+krkWbIzFYb49cXzMw=;
        b=evjXd3z0R3ITU/OZxJyDTfUSI+Vfd9wdLsGnXSfUZc2ievRee9F4QI5d4soz3Zz9Nx
         IvbxjqlpX4dhIu2sN2VBwOuEuKhTNsC7Z+ufI412d8C4b6SbV/PoRDl33b7ql71K1H2f
         j7L7VpUzjSmHjnHpC4or/th67Vv+O78QjquJKOZsrUZbbun7F0xg99oXnU+eRPGTB8OA
         93MsDsUcThrnoD/71KnV1C9aj8wP/euHh4awKHxZtS2nLC1QjDu6t36ornI6YIVyDCBR
         9q6bKcQOv7ZxQcxSG1Dx1QFEtzRADoUXOfZSfLaQckmlql/FOGIUMNhk0xuWTEKz01lz
         1BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692808413; x=1693413213;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biBWlZOCmK/KsAHuVrUAhW2jC+krkWbIzFYb49cXzMw=;
        b=CMcUc9PETyjZtJV4yEBfn3kcPk6gVV6dPJcZ2Oi8RHCRHFgLw6b8O3zJjk2gCmmeHt
         5XLWCSt1IWX2Ls+dPXas5lPMIEjqFwgijt8N+zTAjcIUd1SgBfk04bMP7qj92HtdPojJ
         paBmMKaX3qfOEAwMaBFKoft5k4Q7h6au+js2t2l9rim7470NngPU7OWOn43kHnNF7PVY
         o9Dfe8NlwE7xVsvWWxsRfCqtsxcrjTCokf9eoj5EvPxsSdIsYwudt3uyOLQAb4IwvQpV
         ghQPJwiKqPPv6nGOJgTmTe/9mOuOPi9TNGBuaILi4BxgtbDW1yidVf1OWTn09zdWNe7V
         Bwcg==
X-Gm-Message-State: AOJu0YwSPYUqILUp8tt/FziES8njpAQh1zpFcvs2ejj2wgIlxCQ5pOrg
	kxjtHw0c8uhcP2p5a7uO7gMiAAhDZHk=
X-Google-Smtp-Source: AGHT+IHZDz8Q6sbVNUjeumuWJnB9xv+l7MdGvW8zDiC7KQRBBGXG/aWkTJsAf/3lx8MZgJsQ0y8nYQ==
X-Received: by 2002:a05:6870:96a1:b0:1c8:2f7f:3c09 with SMTP id o33-20020a05687096a100b001c82f7f3c09mr12185415oaq.23.1692808413254;
        Wed, 23 Aug 2023 09:33:33 -0700 (PDT)
Received: from [192.168.1.119] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id k3-20020a056870350300b001bb803c1cb6sm7093005oah.11.2023.08.23.09.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 09:33:32 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <89aae6c9-e64f-a0e8-1337-c929e83c790a@lwfinger.net>
Date: Wed, 23 Aug 2023 11:33:31 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH -next] staging: rtl8192e: Do not call kfree_skb() under
 spin_lock_irqsave()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-staging@lists.linux.dev,
 mikem@ring3k.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 wlanfae <wlanfae@realtek.com>
References: <20230823035225.1282901-1-ruanjinjie@huawei.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20230823035225.1282901-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/23 22:52, Jinjie Ruan wrote:
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with hardware interrupts being disabled.
> So replace kfree_skb() with dev_kfree_skb_irq() under
> spin_lock_irqsave(). Compile tested only.
> 
> Fixes: 94a799425eee ("From: wlanfae <wlanfae@realtek.com> [PATCH 1/8] rtl8192e: Import new version of driver from realtek")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index 50eb8f3494ec..5a613b116925 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -1663,7 +1663,7 @@ void rtl92e_reset_desc_ring(struct net_device *dev)
>   				dma_unmap_single(&priv->pdev->dev,
>   						 entry->TxBuffAddr, skb->len,
>   						 DMA_TO_DEVICE);
> -				kfree_skb(skb);
> +				dev_kfree_skb_irq(skb);
>   				ring->idx = (ring->idx + 1) % ring->entries;
>   			}
>   			ring->idx = 0;

Reviewed-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

