Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22D2CA9
	for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 22:54:13 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-95227e5164dso221976366b.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682549651; x=1685141651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jcdcPneC4h+EAp1/88eKvrZbB5n2MW+1FCC3sLF0pGo=;
        b=dQC8+stSwibicT85yS4qeCq6Cxdrisph1xvLEm4kYH/54UA5VPsO5pRYOOA8oogn0o
         6pF/yHMQNvm1+vZvEf2GYk6j0EdTXAXGt9/a60NL/GR4f/khqAzj+XGOfkMBSs3eAwBH
         j3xc8fH27i00GzsqsqePFqfVFayu6eKRdoTS9NQ+A9DBLCR7fOSBfZHHmfCCqS1FXSa5
         z9ZBy1AloBNASETOaQbSz49FJRNwuXoE9Noxs3AxUvnafnALncktNj7PhzvFwwGgn7QC
         1m3cn62m1Pj6nuqQ4uIvvMISTZ7hKCMBic3/awFLCW35BDOdy2E+3l535E1tekjBHWbX
         vbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682549651; x=1685141651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jcdcPneC4h+EAp1/88eKvrZbB5n2MW+1FCC3sLF0pGo=;
        b=Hf0WBCpOLvzUts8rt4bOvKUF+F8xwK4T3Jk7Jjhuzewt+NwH9lua93aNDh6YRkzhUl
         BxW27MeLdrs5zkHJN4FtWllP+VYWM5249lXbaeBiA42JaFPwMcvlktW7r2S0EQccpRwE
         shmpgGcDkta6+yN4JGkkfI2Nw0IxsRcpFj1uIMOblDeAHLZTcjaZIUxKPY4YGaV9nKCe
         sai3I/kOe1LL4GnFAO9jSHPO669J9i8zPxO1ShJDmz4GsetXXgSVRogADtcgnQk/XW0H
         idFBgUd69h30i12SDxqLN0NlmcHf7P5g++7zIv8xIsjof4Zj7R7lXZKBfXamv/FcjGNe
         dL9w==
X-Gm-Message-State: AC+VfDwy9C2aggK4GDx2X3dkIhwbHPshrcEFqJOy/nhykioTzBt0OKrV
	liZihvsRj5aoS2RKiHkgDFM=
X-Google-Smtp-Source: ACHHUZ6tJGRrWHXw1Mh4MYD1H3bs3tBriPOiZU+J6ZP6yG4qPJ3TC4QcwBhSLKqeCn6/lM1fBQRMCg==
X-Received: by 2002:a17:906:72dc:b0:94e:d688:fca8 with SMTP id m28-20020a17090672dc00b0094ed688fca8mr295110ejl.3.1682549651282;
        Wed, 26 Apr 2023 15:54:11 -0700 (PDT)
Received: from [192.168.0.103] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906828b00b0094f23480619sm8901783ejx.172.2023.04.26.15.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 15:54:10 -0700 (PDT)
Message-ID: <b61a2bc8-ce4b-3670-998d-8130d61c7f9a@gmail.com>
Date: Thu, 27 Apr 2023 00:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] staging: rtl8192e: avoid CamelCase <RATRIndex>
To: John Grace <johnmgrace1@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
References: <ZEcjdUR/bnln7Z1J@iris>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZEcjdUR/bnln7Z1J@iris>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/23 02:48, John Grace wrote:
> Linux kernel coding-style suggests to not use mixed-case names. Fix
> checkpatch issue by changing the variable name from camel case to snake
> case.
> 
> Signed-off-by: John Grace <johnmgrace1@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 4 ++--
>   drivers/staging/rtl8192e/rtllib.h              | 2 +-
>   drivers/staging/rtl8192e/rtllib_softmac.c      | 4 ++--
>   drivers/staging/rtl8192e/rtllib_tx.c           | 6 +++---
>   5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index aed53fedeb61..c612e31d1a84 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -1008,7 +1008,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
>   	pdesc->PktSize = skb->len - sizeof(struct tx_fwinfo_8190pci);
>   
>   	pdesc->SecCAMID = 0;
> -	pdesc->RATid = cb_desc->RATRIndex;
> +	pdesc->RATid = cb_desc->ratr_index;
>   
>   
>   	pdesc->NoEnc = 1;
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index 27040d1e3230..b58a30d68f2f 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -466,7 +466,7 @@ static void _rtl92e_prepare_beacon(struct tasklet_struct *t)
>   	tcb_desc = (struct cb_desc *)(pnewskb->cb + 8);
>   	tcb_desc->queue_index = BEACON_QUEUE;
>   	tcb_desc->data_rate = 2;
> -	tcb_desc->RATRIndex = 7;
> +	tcb_desc->ratr_index = 7;
>   	tcb_desc->tx_dis_rate_fallback = 1;
>   	tcb_desc->tx_use_drv_assinged_rate = 1;
>   	skb_push(pnewskb, priv->rtllib->tx_headroom);
> @@ -1440,7 +1440,7 @@ static int _rtl92e_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
>   		return 0;
>   	}
>   
> -	tcb_desc->RATRIndex = 7;
> +	tcb_desc->ratr_index = 7;
>   	tcb_desc->tx_dis_rate_fallback = 1;
>   	tcb_desc->tx_use_drv_assinged_rate = 1;
>   	tcb_desc->bTxEnableFwCalcDur = 1;
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 6e665e866f1f..d5f5ea5615fc 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -139,7 +139,7 @@ struct cb_desc {
>   	u8 rata_index;
>   	u8 queue_index;
>   	u16 txbuf_size;
> -	u8 RATRIndex;
> +	u8 ratr_index;
>   	u8 bAMSDU:1;
>   	u8 bFromAggrQ:1;
>   	u8 reserved6:6;
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
> index b9886e83a6dc..1ca77cdbafa3 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac.c
> @@ -219,7 +219,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct rtllib_device *ieee)
>   		tcb_desc->queue_index = HIGH_QUEUE;
>   
>   	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
> -	tcb_desc->RATRIndex = 7;
> +	tcb_desc->ratr_index = 7;
>   	tcb_desc->tx_dis_rate_fallback = 1;
>   	tcb_desc->tx_use_drv_assinged_rate = 1;
>   	if (single) {
> @@ -297,7 +297,7 @@ softmac_ps_mgmt_xmit(struct sk_buff *skb,
>   
>   
>   	tcb_desc->data_rate = MgntQuery_MgntFrameTxRate(ieee);
> -	tcb_desc->RATRIndex = 7;
> +	tcb_desc->ratr_index = 7;
>   	tcb_desc->tx_dis_rate_fallback = 1;
>   	tcb_desc->tx_use_drv_assinged_rate = 1;
>   	if (single) {
> diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
> index 9ab8ee46ef66..54119fba8a57 100644
> --- a/drivers/staging/rtl8192e/rtllib_tx.c
> +++ b/drivers/staging/rtl8192e/rtllib_tx.c
> @@ -486,7 +486,7 @@ static void rtllib_txrate_selectmode(struct rtllib_device *ieee,
>   	    !tcb_desc->tx_use_drv_assinged_rate) {
>   		if (ieee->iw_mode == IW_MODE_INFRA ||
>   		    ieee->iw_mode == IW_MODE_ADHOC)
> -			tcb_desc->RATRIndex = 0;
> +			tcb_desc->ratr_index = 0;
>   	}
>   }
>   
> @@ -892,7 +892,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
>   				tcb_desc->tx_dis_rate_fallback = 1;
>   			}
>   
> -			tcb_desc->RATRIndex = 7;
> +			tcb_desc->ratr_index = 7;
>   			tcb_desc->tx_use_drv_assinged_rate = 1;
>   		} else {
>   			if (is_multicast_ether_addr(header.addr1))
> @@ -916,7 +916,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
>   					tcb_desc->tx_dis_rate_fallback = 1;
>   				}
>   
> -				tcb_desc->RATRIndex = 7;
> +				tcb_desc->ratr_index = 7;
>   				tcb_desc->tx_use_drv_assinged_rate = 1;
>   				tcb_desc->bdhcp = 1;
>   			}

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

