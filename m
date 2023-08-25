Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA4E17E8
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 05:41:24 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fefaf4e3c6so1830065e9.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692942083; x=1693546883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRDL3W8tj/Rupdx4eH2zPmrVZ7N1Lam9Z23I4Mee4M4=;
        b=Zp5kMKdWt76NkxneM0F07eUoVlcQsm3zmjZywYoF5YHmtiCr6JzFik8cDj/m+Q+G+B
         uZ5ylG531mMQzVeF0hQl5ixolecfHo3noakmXtCLh2Ofmqrw9lUPu+9zYX3U2WYY1e9g
         3ZJwK/5M8FG3ipcRELatsf/3l010dOMJQdr8feQj8Kou8SFQp1KooPDceBT/G2ow5QMP
         sWr5CnijWbV8soiOenQnQ+sVyXjbn4Zyt1d0+O2sP1Q/pX4y9Zvk9lan5ytixBYFezTn
         uTbEy6/QmrdhDset1uG0vGUWNiTVsYtvImLJNAca9zToxDVISE2wwIlmIIOs44TvfOOa
         Ol5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692942083; x=1693546883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRDL3W8tj/Rupdx4eH2zPmrVZ7N1Lam9Z23I4Mee4M4=;
        b=ceigjbshNs3lMcW9g5h2r4f8NSr6PdDQIIN86IVl9wc1N+NmHRB/w1J/tRD95bQvWT
         yWPTnu2V2J6OEG39VzsX/GpQLDJ7VPLYumkvzRFRNcsg4wj/cyRW7dR7c8v/FHVe8ash
         tnQ/I/Q8rqqinxwqxJeTuzaeicvbkjYDenBAMT4hMR+hikhJSRKNO0DkJxyvWUoBJkGx
         EJdJlSBHwGaVZ0GXZvIUq+IfCkx1OvyHnMz4x0z8lzbKGYPtTMEEO1sJll6yHCTM643/
         uRWwFUvdJYwXNCRvjqZP5Mp6fwTzgu2svdvs8TZd3iirhp0oClUsl0tQa3uWD4Y4AmUE
         VuOQ==
X-Gm-Message-State: AOJu0Ywc0lXxKCdlirOKnUlfhrLovkmKHDNFWxY4BcZkZQUXzgDmdRAW
	EVE+0HZO2x+MVGby+hAbZtQ=
X-Google-Smtp-Source: AGHT+IFWCDCTmvKnFtnFsDTV4czNaxvmhoS9Zu5VHvisKe+UYqaTQbfKbmK9QOe1D7OgPqQuPdbfUw==
X-Received: by 2002:a05:600c:5185:b0:3fe:d46a:ef4b with SMTP id fa5-20020a05600c518500b003fed46aef4bmr13559703wmb.1.1692942082807;
        Thu, 24 Aug 2023 22:41:22 -0700 (PDT)
Received: from [192.168.0.101] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003fe61c33df5sm4449357wml.3.2023.08.24.22.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 22:41:22 -0700 (PDT)
Message-ID: <b8d7d28f-8cac-a272-a3b5-11bf9af42702@gmail.com>
Date: Fri, 25 Aug 2023 07:41:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] staging: rtl8192e: Do not call kfree_skb() under
 spin_lock_irqsave()
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-staging@lists.linux.dev,
 mikem@ring3k.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>, wlanfae <wlanfae@realtek.com>
References: <20230823035225.1282901-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230823035225.1282901-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/23 05:52, Jinjie Ruan wrote:
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

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

