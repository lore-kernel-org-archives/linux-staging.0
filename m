Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D543C2B
	for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 19:26:38 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id lc7so10235607ejb.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 12:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wv1NWdkn3I9gA/Yg/AumQzS52TikNGwDppVEZ+Nt1Wk=;
        b=ee+oMk5QJHGldCNyCjWqsb2Mn9sj6dahTB50enQsh0/c5xjIiWEPbfihPBQwdQ6FdQ
         6cIflYdMZCUGIHDeicJI/x4yKrbL3L2rG6SmZAxkpBx5Clk58Cf8B0RDzL2A9H6pAG/z
         d8slV4OuQe7GjXBNaxwGZPqE9a4LIUPAFDCYLvgYzJh9Pg3WFxMGSZF6kUWQKJutE+sy
         C5BtvEJL45Op08j/AMTL1soTBJ3abdns7ScaZJw4t3NaZP0gNPRIWjWVNS2aN3EsAxDU
         JdoSpQPR0ZDmZbVkAMPc36Voo0gDRJqvaY3+zskEdeq8JyYmyummclEH4i0ps13A5/pQ
         swXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wv1NWdkn3I9gA/Yg/AumQzS52TikNGwDppVEZ+Nt1Wk=;
        b=pIyfeDXXxdMQSB+pnkxbrb2aOIHVIucpzyzFdMMhID+QBqSafRhMOpBqdY0EPuSb1r
         XVSAnuK4uEfE3FDha0cfSVjRRbRWru2HmAS7fm/NWVvq1VlsvzvTLpgqhu47deGUksIz
         kZ4Ag51AKCeIPSrVQrThBjvP6hmnxQyZVmzmCmjFXe5jYe83TCgY2jcqKDxdmo2kwECh
         wstUlPLVp8dzESLb/iP+PQT7Zrv6FQ1RiyuDfRE3xRYh6mIpQpZSJl81ToC1sWUfiwPC
         ewhO1bz48SPlKRq9j0i8UDcO7Mjs4WqUlpiak82g2Fb9qR6ET++HQU0TmsM39fJlKcjJ
         xJhw==
X-Gm-Message-State: ACrzQf0Hkv6TsKlDuuT64HTbRsRwE5LLdPs+ioHY5LPpRh+zTwQ5UjwK
	rMhgjxNb9rb1pD6k8ulkj+M=
X-Google-Smtp-Source: AMsMyM6XPVke5u+Ie/NleaWu7V80J+TKvM5qZRIh92byCyFET/dhcJGoKVXKDW8+QNL6HKfiDfYljA==
X-Received: by 2002:a17:907:a079:b0:77d:a363:64b6 with SMTP id ia25-20020a170907a07900b0077da36364b6mr14931389ejc.451.1664133996784;
        Sun, 25 Sep 2022 12:26:36 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id w23-20020a170906185700b0073d71792c8dsm7242796eje.180.2022.09.25.12.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 12:26:36 -0700 (PDT)
Message-ID: <59255558-06ed-d82f-3e72-f1ccf03ba96d@gmail.com>
Date: Sun, 25 Sep 2022 21:26:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Rename Tx_Retry_Count_Reg
Content-Language: en-US
To: Dragan Cvetic <dragan.m.cvetic@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220924225126.10527-1-dragan.m.cvetic@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220924225126.10527-1-dragan.m.cvetic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/22 00:51, Dragan Cvetic wrote:
> Rename: Current_Tx_Rate_Reg to CURRENT_TX_RATE_REG, Initial_Tx_Rate_Reg to
> INITIAL_TX_RATE_REG and Tx_Retry_Count_Reg to TX_RETRY_COUNT_REG to avoid
> CamelCase which is not accepted by checkpatch.pl.
> 
> Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 11 +++--------
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  6 +++---
>   2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index 3ee52147960e..9fefa1a7ae75 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -2499,14 +2499,9 @@ static void _rtl92e_dm_check_txrateandretrycount(struct net_device *dev)
>   	struct r8192_priv *priv = rtllib_priv(dev);
>   	struct rtllib_device *ieee = priv->rtllib;
>   
> -	ieee->softmac_stats.CurrentShowTxate = rtl92e_readb(dev,
> -						 Current_Tx_Rate_Reg);
> -
> -	ieee->softmac_stats.last_packet_rate = rtl92e_readb(dev,
> -						 Initial_Tx_Rate_Reg);
> -
> -	ieee->softmac_stats.txretrycount = rtl92e_readl(dev,
> -						 Tx_Retry_Count_Reg);
> +	ieee->softmac_stats.CurrentShowTxate = rtl92e_readb(dev, CURRENT_TX_RATE_REG);
> +	ieee->softmac_stats.last_packet_rate = rtl92e_readb(dev, INITIAL_TX_RATE_REG);
> +	ieee->softmac_stats.txretrycount = rtl92e_readl(dev, TX_RETRY_COUNT_REG);
>   }
>   
>   static void _rtl92e_dm_send_rssi_to_fw(struct net_device *dev)
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
> index ea1b14bbcdcd..51e295d389a8 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
> @@ -42,9 +42,9 @@
>   #define	 TX_POWER_ATHEROAP_THRESH_HIGH	   78
>   #define		TX_POWER_ATHEROAP_THRESH_LOW		72
>   
> -#define			Current_Tx_Rate_Reg	 0x1e0
> -#define			Initial_Tx_Rate_Reg	 0x1e1
> -#define			Tx_Retry_Count_Reg	 0x1ac
> +#define		CURRENT_TX_RATE_REG		0x1e0
> +#define		INITIAL_TX_RATE_REG		0x1e1
> +#define		TX_RETRY_COUNT_REG		0x1ac
>   #define		RegC38_TH				 20
>   
>   #define		DM_Type_ByDriver		1

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
